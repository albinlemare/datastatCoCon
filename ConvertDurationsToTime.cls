VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisWorkbook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub ConvertDurationsToTime()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim cell As Range
    
    ' Définir la feuille active
    Set ws = ActiveSheet
    
    ' Trouver la dernière ligne utilisée dans la colonne M
    lastRow = ws.Cells(ws.Rows.Count, "M").End(xlUp).Row
    
    ' Parcourir chaque cellule de la colonne M
    For Each cell In ws.Range("M2:M" & lastRow)
        If Not IsEmpty(cell.Value) Then
            If IsNumeric(cell.Value) Then
                ' Si c'est déjà un nombre, on garde mais on applique le format
                cell.Value = cell.Value
            Else
                ' Si c'est du texte, on le convertit en heure
                On Error Resume Next
                cell.Value = TimeValue(cell.Value)
                On Error GoTo 0
            End If
        End If
    Next cell
    
    ' Appliquer le format hh:mm:ss à toute la colonne M
    ws.Range("M2:M" & lastRow).NumberFormat = "hh:mm:ss"
    
    MsgBox "Conversion terminée !", vbInformation
End Sub

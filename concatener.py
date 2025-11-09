import pandas as pd

# Chemins des fichiers
file1 = "bd_participants.xlsx"
file2 = "temps_parole.xlsx"


# Charger les fichiers Excel
df1 = pd.read_excel(file1)
df2 = pd.read_excel(file2)

# Vérifier les colonnes disponibles
print("Colonnes file1 :", df1.columns.tolist())
print("Colonnes file2 :", df2.columns.tolist())

# Nom de la colonne clé
key_column = "AgendaInformation.AgendaItem.Session.Delegate.Name"

# Fusionner : on garde toutes les lignes de file1 et on ajoute les colonnes de file2
merged_df = pd.merge(
    df1,
    df2,
    on=key_column,
    how="left"  # left join : toutes les lignes de file1
)

# Sauvegarder le résultat
output_file = "fusion_result.xlsx"
merged_df.to_excel(output_file, index=False)

print(f"Fichier fusionné créé : {output_file}")

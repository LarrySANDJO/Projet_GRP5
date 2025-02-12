# Importation de la library
library(rmarkdown)

# Exemple de DataFrame avec les informations des étudiants

students <- data.frame(
  name = c("Ndaye Fama", "Sandjo Larry", "Bargo Alferd"),
  degree = c("diplôme Analiste statisticien", "diplômes d'ingénieur statisticien-économiste  ", "master statistiques agricole"),
  graduation_date = c("15 juin 2024", "12 juillet 2023", "23 septembre 2025"),
  university = c("École nationale de la statistiques et l'analyse économique", "École nationale de la statistiques et l'analyse économique",
                 "École nationale de la statistiques et l'analyse économique")
)

# Chemin du fichier R Markdown template
template <- "../Projet_RMD/Publipostage/Template_publipostage.Rmd"

# Générer un diplôme pour chaque étudiant à l'aide d'une boucle for

for (i in 1:nrow(students)) {
  params <- list(
    student_name = students$name[i],
    degree = students$degree[i],
    graduation_date = students$graduation_date[i],
    university = students$university[i]
  )
  
  # Nom du fichier de sortie
  
  output_file <- paste0("diplome_", gsub(" ", "_", students$name[i]), ".docx")
  
  # Sortie du document R Markdown
  
  rmarkdown::render(
    input = template,
    output_file = output_file,
    params = params,
    envir = new.env(parent = globalenv())
  )
}

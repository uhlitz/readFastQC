# list.files("~/sshfs/extra/flo/landthaler/HEK293_RAF1ER/RiboSeq/FastQC",
#            pattern="fastqc_data.txt",
#            recursive = T,
#            full.names = T) -> fqc
#
# lapply(fastqc[21], read_fastqc, feature=7) %>%
#   setNames(fastqc[21] %>% str_replace_all("/fastqc_data.txt", "") %>% basename) %>%
#   bind_rows(.id = "Sample") %>%
#   setNames(c("Sample", "Length", "Count")) ->
#   length_distribution_A
#
# lapply(fastqc[1:20], read_fastqc, feature=8) %>%
#   setNames(fastqc[1:20] %>% str_replace_all("/fastqc_data.txt", "") %>% basename) %>%
#   bind_rows(.id = "Sample") %>%
#   setNames(c("Sample", "Length", "Count")) ->
#   length_distribution_B
#
# length_distribution <- bind_rows(length_distribution_A, length_distribution_B)
#
# ggplot(length_distribution_A) +
#   geom_line(aes(Length, Count, group = Sample)) +
#   geom_vline(xintercept = 29, color = "red") +
#   facet_wrap(~Sample)
#
# ggplot(length_distribution_B) +
#   geom_line(aes(Length, Count, group = Sample)) +
#   geom_vline(xintercept = 29, color = "red") +
#   facet_wrap(~Sample)
#
#
#
#

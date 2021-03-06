$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-parallel
- sentinel_outputs=sv_rawcoverage_rec:depth__bins__target;depth__bins__antitarget;resources;description;regions__bins__target;regions__bins__antitarget;regions__bins__group;reference__fasta__base;config__algorithm__svcaller;config__algorithm__coverage_interval;genome_resources__rnaseq__gene_bed;genome_resources__variation__encode_blacklist;metadata__batch;genome_resources__variation__lcr;metadata__phenotype;genome_resources__variation__polyx;config__algorithm__variant_regions;config__algorithm__exclude_regions;align_bam;config__algorithm__variant_regions_merged;depth__variant_regions__regions;config__algorithm__callable_regions
- sentinel_inputs=sv_bin_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- calculate_sv_coverage
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 8
  outdirMin: 17161
  ramMin: 28672
  tmpdirMin: 8069
- class: dx:InputResourceRequirement
  indirMin: 3028
- class: SoftwareRequirement
  packages:
  - package: mosdepth
    specs:
    - https://anaconda.org/bioconda/mosdepth
  - package: cnvkit
    specs:
    - https://anaconda.org/bioconda/cnvkit
inputs:
- id: sv_bin_rec
  type:
    fields:
    - name: regions__bins__target
      type:
      - File
      - 'null'
    - name: regions__bins__antitarget
      type:
      - File
      - 'null'
    - name: regions__bins__group
      type:
      - string
      - 'null'
    - name: resources
      type: string
    - name: description
      type: string
    - name: reference__fasta__base
      type: File
    - name: config__algorithm__svcaller
      type:
        items: string
        type: array
    - name: config__algorithm__coverage_interval
      type:
      - string
      - 'null'
    - name: genome_resources__rnaseq__gene_bed
      type: File
    - name: genome_resources__variation__encode_blacklist
      type: File
    - name: metadata__batch
      type: string
    - name: genome_resources__variation__lcr
      type: File
    - name: metadata__phenotype
      type: string
    - name: genome_resources__variation__polyx
      type: File
    - name: config__algorithm__variant_regions
      type:
      - File
      - 'null'
    - name: config__algorithm__exclude_regions
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: align_bam
      type:
      - File
      - 'null'
    - name: config__algorithm__variant_regions_merged
      type:
      - File
      - 'null'
    - name: depth__variant_regions__regions
      type:
      - File
      - 'null'
    - name: config__algorithm__callable_regions
      type: File
    name: sv_bin_rec
    type: record
outputs:
- id: sv_rawcoverage_rec
  type:
    fields:
    - name: depth__bins__target
      type:
      - File
      - 'null'
    - name: depth__bins__antitarget
      type:
      - File
      - 'null'
    - name: resources
      type: string
    - name: description
      type: string
    - name: regions__bins__target
      type:
      - File
      - 'null'
    - name: regions__bins__antitarget
      type:
      - File
      - 'null'
    - name: regions__bins__group
      type:
      - string
      - 'null'
    - name: reference__fasta__base
      type: File
    - name: config__algorithm__svcaller
      type:
        items: string
        type: array
    - name: config__algorithm__coverage_interval
      type:
      - string
      - 'null'
    - name: genome_resources__rnaseq__gene_bed
      type: File
    - name: genome_resources__variation__encode_blacklist
      type: File
    - name: metadata__batch
      type: string
    - name: genome_resources__variation__lcr
      type: File
    - name: metadata__phenotype
      type: string
    - name: genome_resources__variation__polyx
      type: File
    - name: config__algorithm__variant_regions
      type:
      - File
      - 'null'
    - name: config__algorithm__exclude_regions
      type:
      - 'null'
      - string
      - items:
        - 'null'
        - string
        type: array
    - name: align_bam
      type:
      - File
      - 'null'
    - name: config__algorithm__variant_regions_merged
      type:
      - File
      - 'null'
    - name: depth__variant_regions__regions
      type:
      - File
      - 'null'
    - name: config__algorithm__callable_regions
      type: File
    name: sv_rawcoverage_rec
    type: record
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json

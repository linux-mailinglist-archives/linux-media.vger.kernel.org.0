Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC5C39AEE5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 01:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFCXwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 19:52:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:37393 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhFCXwL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 19:52:11 -0400
IronPort-SDR: LJKlUPiPK4YkfIPelO96MnH4qTkThP45mKmHu0WKrg+bJIx3ewnHmsPwpjlz+bh7IIYNROc4K9
 68XAI81fd4PQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="202324060"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="202324060"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 16:50:26 -0700
IronPort-SDR: sJTrd/nJsBZjjRehfjSm8madMiHE8AXGa4lvfrWKSyXhzFE08YLJLbMCKRseMFuctiVsfkGetr
 Ew+UnmY4NJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="480422895"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Jun 2021 16:50:24 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lox6V-0006SZ-Lh; Thu, 03 Jun 2021 23:50:23 +0000
Date:   Fri, 04 Jun 2021 07:50:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 80c1c54a2aa3c5177f73fc5d505668df56fb28b6
Message-ID: <60b96ab9.NuD0Ldp8a2NBN+zQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 80c1c54a2aa3c5177f73fc5d505668df56fb28b6  Merge tag 'v5.13-rc4' into media_tree

i386-tinyconfig vmlinux size:

====================================================================================================================
 TOTAL  TEXT  amd_get_highest_perf()  force_sig_perf()                                                              
====================================================================================================================
     0     0                                            2fb27551ba40 media: imx: imx7_mipi_csis: Update MAINTAINERS 
  +188  +187                     +74               +70  6efb943b8616..80c1c54a2aa3 (ALL COMMITS)                    
====================================================================================================================

elapsed time: 2235m

configs tested: 390
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       omap2plus_defconfig
m68k                          amiga_defconfig
riscv                             allnoconfig
riscv                               defconfig
arm                           sunxi_defconfig
arm                         socfpga_defconfig
arm                            qcom_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
parisc                           allyesconfig
mips                        vocore2_defconfig
mips                           ip27_defconfig
powerpc                      pasemi_defconfig
m68k                       m5249evb_defconfig
arm                         lpc32xx_defconfig
mips                        qi_lb60_defconfig
arm                      footbridge_defconfig
mips                  decstation_64_defconfig
mips                           ip22_defconfig
mips                      maltaaprp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      obs600_defconfig
mips                           jazz_defconfig
xtensa                    smp_lx200_defconfig
arm                          collie_defconfig
powerpc                    adder875_defconfig
m68k                         apollo_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      arches_defconfig
powerpc                           allnoconfig
h8300                     edosk2674_defconfig
sparc64                          alldefconfig
arm                     am200epdkit_defconfig
arm                        multi_v5_defconfig
powerpc                    mvme5100_defconfig
arm                      pxa255-idp_defconfig
arm                         s3c2410_defconfig
microblaze                          defconfig
arc                     nsimosci_hs_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
arm                           h5000_defconfig
ia64                      gensparse_defconfig
arm                          pxa168_defconfig
mips                          rm200_defconfig
sh                            titan_defconfig
powerpc                     tqm8548_defconfig
sh                         apsh4a3a_defconfig
arc                         haps_hs_defconfig
arm                         mv78xx0_defconfig
sh                         ecovec24_defconfig
sh                         ap325rxa_defconfig
mips                        workpad_defconfig
arc                     haps_hs_smp_defconfig
arm                           sama5_defconfig
sh                            migor_defconfig
powerpc                     tqm8560_defconfig
sh                           se7722_defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    amigaone_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                   sh7770_generic_defconfig
m68k                       m5275evb_defconfig
powerpc                 mpc836x_mds_defconfig
nds32                               defconfig
arm                        mini2440_defconfig
parisc                              defconfig
sh                               j2_defconfig
powerpc                 mpc837x_mds_defconfig
mips                       lemote2f_defconfig
arm                              alldefconfig
m68k                        m5407c3_defconfig
m68k                        mvme16x_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            zeus_defconfig
x86_64                           alldefconfig
powerpc                      pmac32_defconfig
sh                          lboxre2_defconfig
sh                           se7705_defconfig
powerpc                       maple_defconfig
arm                        shmobile_defconfig
s390                       zfcpdump_defconfig
arm                         bcm2835_defconfig
mips                            ar7_defconfig
powerpc                  storcenter_defconfig
m68k                             alldefconfig
arm                         lpc18xx_defconfig
arc                      axs103_smp_defconfig
mips                         mpc30x_defconfig
sh                        dreamcast_defconfig
powerpc                     rainier_defconfig
m68k                       bvme6000_defconfig
sh                        sh7757lcr_defconfig
xtensa                           allyesconfig
xtensa                generic_kc705_defconfig
sh                          rsk7203_defconfig
powerpc                     ep8248e_defconfig
powerpc                     sequoia_defconfig
arm                         orion5x_defconfig
sh                          r7780mp_defconfig
arm                           h3600_defconfig
arm                            mps2_defconfig
arc                          axs103_defconfig
arm                         s3c6400_defconfig
sparc                       sparc32_defconfig
powerpc                     tqm8540_defconfig
arm                         vf610m4_defconfig
arm                       multi_v4t_defconfig
sh                               alldefconfig
powerpc                     sbc8548_defconfig
arm                       netwinder_defconfig
mips                           rs90_defconfig
arm                        cerfcube_defconfig
powerpc                 canyonlands_defconfig
powerpc64                        alldefconfig
powerpc64                           defconfig
arc                           tb10x_defconfig
arm                             ezx_defconfig
sh                           se7343_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                   sb1250_swarm_defconfig
arm                    vt8500_v6_v7_defconfig
mips                            gpr_defconfig
h8300                       h8s-sim_defconfig
sh                         microdev_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     redwood_defconfig
powerpc                    gamecube_defconfig
mips                      loongson3_defconfig
powerpc                     tqm5200_defconfig
sh                             shx3_defconfig
arm                           viper_defconfig
nios2                         3c120_defconfig
powerpc                      pcm030_defconfig
nds32                             allnoconfig
powerpc                   lite5200b_defconfig
arm                           u8500_defconfig
um                                  defconfig
x86_64                            allnoconfig
arc                              alldefconfig
arm                        neponset_defconfig
m68k                       m5475evb_defconfig
arm                          pcm027_defconfig
arm                         lubbock_defconfig
sh                        sh7785lcr_defconfig
sh                          kfr2r09_defconfig
arm                  colibri_pxa270_defconfig
mips                            e55_defconfig
arm                       aspeed_g4_defconfig
sh                           se7751_defconfig
mips                      bmips_stb_defconfig
sparc                            alldefconfig
mips                          rb532_defconfig
mips                          ath25_defconfig
m68k                       m5208evb_defconfig
sh                          r7785rp_defconfig
mips                       capcella_defconfig
mips                        nlm_xlp_defconfig
sh                           se7721_defconfig
sh                   secureedge5410_defconfig
um                             i386_defconfig
arm                         s5pv210_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                        cell_defconfig
mips                        bcm63xx_defconfig
powerpc                      walnut_defconfig
mips                      pic32mzda_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      acadia_defconfig
mips                        maltaup_defconfig
powerpc                      ppc64e_defconfig
s390                             alldefconfig
arm                       imx_v4_v5_defconfig
sparc                            allyesconfig
powerpc                      katmai_defconfig
xtensa                              defconfig
nios2                               defconfig
mips                         db1xxx_defconfig
powerpc                     pseries_defconfig
powerpc                      tqm8xx_defconfig
sh                          urquell_defconfig
powerpc                      cm5200_defconfig
sh                            hp6xx_defconfig
um                            kunit_defconfig
arm                     davinci_all_defconfig
sh                      rts7751r2d1_defconfig
arc                            hsdk_defconfig
powerpc                   currituck_defconfig
mips                       bmips_be_defconfig
powerpc                     mpc83xx_defconfig
parisc                generic-32bit_defconfig
openrisc                 simple_smp_defconfig
arc                        nsimosci_defconfig
m68k                            q40_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     skiroot_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                    xip_kc705_defconfig
arm                      tct_hammer_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        vexpress_defconfig
mips                           ci20_defconfig
mips                           mtx1_defconfig
sh                           se7712_defconfig
powerpc                        warp_defconfig
powerpc                     stx_gp3_defconfig
mips                         cobalt_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
sh                             espt_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           stm32_defconfig
xtensa                         virt_defconfig
arm                         at91_dt_defconfig
x86_64                              defconfig
mips                  cavium_octeon_defconfig
arm                         palmz72_defconfig
sparc                               defconfig
powerpc                         wii_defconfig
powerpc                  mpc866_ads_defconfig
arm                           omap1_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                         tb0219_defconfig
m68k                        m5307c3_defconfig
arm                       spear13xx_defconfig
powerpc                    ge_imp3a_defconfig
openrisc                  or1klitex_defconfig
arc                          axs101_defconfig
sparc64                             defconfig
h8300                            alldefconfig
arm                           tegra_defconfig
powerpc                          allmodconfig
sh                              ul2_defconfig
mips                     loongson2k_defconfig
mips                      pistachio_defconfig
nios2                         10m50_defconfig
mips                         tb0226_defconfig
sh                           sh2007_defconfig
xtensa                  cadence_csp_defconfig
arm                  colibri_pxa300_defconfig
h8300                               defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         shannon_defconfig
powerpc                     tqm8541_defconfig
arm                          simpad_defconfig
mips                      malta_kvm_defconfig
arm                       versatile_defconfig
arm                         assabet_defconfig
riscv                          rv32_defconfig
parisc                           alldefconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      bamboo_defconfig
powerpc                       ppc64_defconfig
powerpc                      chrp32_defconfig
mips                        nlm_xlr_defconfig
arm                          moxart_defconfig
sh                        edosk7705_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     asp8347_defconfig
ia64                         bigsur_defconfig
sh                     magicpanelr2_defconfig
mips                        jmr3927_defconfig
sh                        apsh4ad0a_defconfig
ia64                             alldefconfig
s390                                defconfig
openrisc                            defconfig
arm                            mmp2_defconfig
arm                        magician_defconfig
powerpc                        icon_defconfig
arm                       mainstone_defconfig
powerpc                         ps3_defconfig
sh                           se7206_defconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20210602
x86_64               randconfig-a004-20210602
x86_64               randconfig-a003-20210602
x86_64               randconfig-a006-20210602
x86_64               randconfig-a005-20210602
x86_64               randconfig-a001-20210602
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a002-20210603
i386                 randconfig-a005-20210603
i386                 randconfig-a003-20210601
i386                 randconfig-a006-20210601
i386                 randconfig-a004-20210601
i386                 randconfig-a001-20210601
i386                 randconfig-a002-20210601
i386                 randconfig-a005-20210601
i386                 randconfig-a003-20210602
i386                 randconfig-a006-20210602
i386                 randconfig-a004-20210602
i386                 randconfig-a001-20210602
i386                 randconfig-a005-20210602
i386                 randconfig-a002-20210602
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
x86_64               randconfig-a015-20210601
x86_64               randconfig-a011-20210601
x86_64               randconfig-a012-20210601
x86_64               randconfig-a014-20210601
x86_64               randconfig-a016-20210601
x86_64               randconfig-a013-20210601
i386                 randconfig-a015-20210603
i386                 randconfig-a013-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a016-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
i386                 randconfig-a015-20210602
i386                 randconfig-a013-20210602
i386                 randconfig-a016-20210602
i386                 randconfig-a011-20210602
i386                 randconfig-a014-20210602
i386                 randconfig-a012-20210602
i386                 randconfig-a015-20210601
i386                 randconfig-a013-20210601
i386                 randconfig-a011-20210601
i386                 randconfig-a016-20210601
i386                 randconfig-a014-20210601
i386                 randconfig-a012-20210601
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210603
x86_64               randconfig-b001-20210601
x86_64               randconfig-b001-20210602
x86_64               randconfig-a002-20210603
x86_64               randconfig-a004-20210603
x86_64               randconfig-a003-20210603
x86_64               randconfig-a006-20210603
x86_64               randconfig-a005-20210603
x86_64               randconfig-a001-20210603
x86_64               randconfig-a002-20210601
x86_64               randconfig-a004-20210601
x86_64               randconfig-a003-20210601
x86_64               randconfig-a006-20210601
x86_64               randconfig-a005-20210601
x86_64               randconfig-a001-20210601
x86_64               randconfig-a015-20210602
x86_64               randconfig-a011-20210602
x86_64               randconfig-a012-20210602
x86_64               randconfig-a014-20210602
x86_64               randconfig-a016-20210602
x86_64               randconfig-a013-20210602

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

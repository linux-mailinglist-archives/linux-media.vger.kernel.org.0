Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D27D2665E6
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 19:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgIKRRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 13:17:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:21780 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgIKRQ6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 13:16:58 -0400
IronPort-SDR: g3rUNX0uh6j4fCc94geHhe5M/82tX/44wthYSRrTgkF/yjXaaGAmkMOEcMyGO4vDeyIiPccgfx
 lSwRI/F8Lahw==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="146503142"
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; 
   d="scan'208";a="146503142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 10:16:55 -0700
IronPort-SDR: TuKHiwrJasazhTpHXsfRJkw5TvA5dvsp2JjHAvCpNrlf67GIlrEElG6iIOYVp/GBPG6Efr410V
 cteTLk1K7AlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; 
   d="scan'208";a="334574326"
Received: from lkp-server01.sh.intel.com (HELO a75722977aa5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2020 10:16:53 -0700
Received: from kbuild by a75722977aa5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGmfM-0000J5-Av; Fri, 11 Sep 2020 17:16:52 +0000
Date:   Sat, 12 Sep 2020 01:16:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD REGRESSION
 93c16fabdb74a9c1a427402fc1fe588a45130c5b
Message-ID: <5f5bb0db.IW/9GSBapWmv+67b%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 93c16fabdb74a9c1a427402fc1fe588a45130c5b  media: ov8856: Add support for 3264x2448 mode

Error/Warning in current branch:

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:861:50: error: assignment to 'int (*)(const char *, char *)' from incompatible pointer type 'int (__attribute__((regparm(0))) *)(const char *, char *)' [-Werror=incompatible-pointer-types]
drivers/staging/media/atomisp/pci/sh_css.c:1384:6: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
drivers/staging/media/atomisp/pci/sh_css.c:2967:38: error: 'continuous' undeclared (first use in this function)
drivers/staging/media/atomisp/pci/sh_css.c:6234:52: error: 'memory' undeclared (first use in this function); did you mean 'memcpy'?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   `-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:error:assignment-to-int-(-)(const-char-char-)-from-incompatible-pointer-type-int-(__attribute__((regparm()))-)(const-char-char-)
|-- i386-randconfig-a002-20200909
|   |-- drivers-staging-media-atomisp-pci-atomisp_compat_css20.c:error:assignment-to-int-(-)(const-char-char-)-from-incompatible-pointer-type-int-(__attribute__((regparm()))-)(const-char-char-)
|   |-- drivers-staging-media-atomisp-pci-sh_css.c:error:continuous-undeclared-(first-use-in-this-function)
|   |-- drivers-staging-media-atomisp-pci-sh_css.c:error:memory-undeclared-(first-use-in-this-function)
|   `-- drivers-staging-media-atomisp-pci-sh_css.c:error:stream-undeclared-(first-use-in-this-function)
`-- i386-randconfig-s002-20200909
    |-- drivers-staging-media-atomisp-pci-sh_css.c:error:continuous-undeclared-(first-use-in-this-function)
    |-- drivers-staging-media-atomisp-pci-sh_css.c:error:memory-undeclared-(first-use-in-this-function)
    `-- drivers-staging-media-atomisp-pci-sh_css.c:error:stream-undeclared-(first-use-in-this-function)

elapsed time: 1710m

configs tested: 224
configs skipped: 8

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     powernv_defconfig
powerpc                      mgcoge_defconfig
arm                        neponset_defconfig
m68k                        stmark2_defconfig
arm                     davinci_all_defconfig
sh                         apsh4a3a_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                              zx_defconfig
sh                          sdk7786_defconfig
powerpc                     rainier_defconfig
sh                           sh2007_defconfig
arm                           efm32_defconfig
arm                       aspeed_g4_defconfig
mips                         tb0226_defconfig
mips                          ath79_defconfig
arm                      integrator_defconfig
mips                           ip22_defconfig
sh                           se7705_defconfig
sh                             sh03_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       versatile_defconfig
arm                        magician_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
sh                            shmin_defconfig
arm                            lart_defconfig
mips                        qi_lb60_defconfig
mips                            e55_defconfig
powerpc                     ksi8560_defconfig
ia64                             alldefconfig
sh                          lboxre2_defconfig
powerpc                       maple_defconfig
xtensa                generic_kc705_defconfig
nds32                             allnoconfig
ia64                             allyesconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
sh                          sdk7780_defconfig
powerpc                      ppc64e_defconfig
openrisc                    or1ksim_defconfig
arm                          imote2_defconfig
arm                            zeus_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
csky                                defconfig
arm                        cerfcube_defconfig
arm                       omap2plus_defconfig
h8300                    h8300h-sim_defconfig
mips                            gpr_defconfig
mips                         rt305x_defconfig
alpha                            alldefconfig
arm                       imx_v6_v7_defconfig
powerpc                  iss476-smp_defconfig
powerpc                    sam440ep_defconfig
arc                          axs101_defconfig
sh                          rsk7264_defconfig
powerpc                          allyesconfig
mips                        maltaup_defconfig
arc                            hsdk_defconfig
m68k                        m5272c3_defconfig
m68k                          multi_defconfig
s390                          debug_defconfig
mips                           jazz_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                      pasemi_defconfig
mips                           mtx1_defconfig
m68k                           sun3_defconfig
arm                            mps2_defconfig
mips                   sb1250_swarm_defconfig
arc                        vdk_hs38_defconfig
arm                          gemini_defconfig
powerpc                        icon_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                     loongson1b_defconfig
arm                           omap1_defconfig
arm                        mvebu_v7_defconfig
arm                            dove_defconfig
h8300                     edosk2674_defconfig
powerpc                   bluestone_defconfig
arm                         lubbock_defconfig
arm                            u300_defconfig
xtensa                           alldefconfig
arm                         ebsa110_defconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
arm                           u8500_defconfig
nios2                         3c120_defconfig
sh                ecovec24-romimage_defconfig
ia64                            zx1_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                               allmodconfig
m68k                                defconfig
mips                 pnx8335_stb225_defconfig
c6x                        evmc6472_defconfig
arm                          lpd270_defconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
mips                      loongson3_defconfig
microblaze                    nommu_defconfig
arc                          axs103_defconfig
arm                      pxa255-idp_defconfig
arm                         s5pv210_defconfig
arm                              alldefconfig
arm                           corgi_defconfig
powerpc                        fsp2_defconfig
arm                          badge4_defconfig
microblaze                      mmu_defconfig
riscv                            allmodconfig
parisc                           alldefconfig
arm                          tango4_defconfig
openrisc                         alldefconfig
arm                        shmobile_defconfig
xtensa                       common_defconfig
powerpc                      pmac32_defconfig
sh                        sh7785lcr_defconfig
riscv                          rv32_defconfig
sh                          kfr2r09_defconfig
arm                         cm_x300_defconfig
sh                          polaris_defconfig
xtensa                         virt_defconfig
powerpc                 mpc837x_rdb_defconfig
nios2                               defconfig
nios2                            alldefconfig
arm                       spear13xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a004-20200909
x86_64               randconfig-a006-20200909
x86_64               randconfig-a003-20200909
x86_64               randconfig-a001-20200909
x86_64               randconfig-a005-20200909
x86_64               randconfig-a002-20200909
i386                 randconfig-a004-20200911
i386                 randconfig-a006-20200911
i386                 randconfig-a001-20200911
i386                 randconfig-a003-20200911
i386                 randconfig-a002-20200911
i386                 randconfig-a005-20200911
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a004-20200910
i386                 randconfig-a006-20200910
i386                 randconfig-a001-20200910
i386                 randconfig-a003-20200910
i386                 randconfig-a002-20200910
i386                 randconfig-a005-20200910
x86_64               randconfig-a014-20200911
x86_64               randconfig-a011-20200911
x86_64               randconfig-a012-20200911
x86_64               randconfig-a016-20200911
x86_64               randconfig-a015-20200911
x86_64               randconfig-a013-20200911
i386                 randconfig-a016-20200909
i386                 randconfig-a015-20200909
i386                 randconfig-a011-20200909
i386                 randconfig-a013-20200909
i386                 randconfig-a014-20200909
i386                 randconfig-a012-20200909
i386                 randconfig-a015-20200911
i386                 randconfig-a014-20200911
i386                 randconfig-a011-20200911
i386                 randconfig-a013-20200911
i386                 randconfig-a016-20200911
i386                 randconfig-a012-20200911
x86_64               randconfig-a004-20200910
x86_64               randconfig-a006-20200910
x86_64               randconfig-a003-20200910
x86_64               randconfig-a002-20200910
x86_64               randconfig-a005-20200910
x86_64               randconfig-a001-20200910
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200911
x86_64               randconfig-a006-20200911
x86_64               randconfig-a003-20200911
x86_64               randconfig-a002-20200911
x86_64               randconfig-a005-20200911
x86_64               randconfig-a001-20200911

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FD32F6940
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbhANSRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:17:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:50338 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbhANSRy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:17:54 -0500
IronPort-SDR: XfKdyKCV+mPlzo6JS4kJ0fRU/bTcylMX5b6OtI7vmTfS1vE8NHssUNmQ38Y0XaRIDkLQU+OXrh
 q86GOFF2J7iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="239963233"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="239963233"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 10:16:57 -0800
IronPort-SDR: Z6QrMyffDMmDuZ6FE5qTCa7kG7IMRUp3bTZqjBzKbHvUVGsyf2RVK3mRY4dX09o2zFr8o0KO5c
 WkdiSjd1fqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="400996003"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2021 10:16:55 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l07B1-00014G-33; Thu, 14 Jan 2021 18:16:55 +0000
Date:   Fri, 15 Jan 2021 02:15:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 7371093f983d35d60a7fac3a6f082de7fefe3648
Message-ID: <60008a5e.1QPKyiK0NpOwJwPm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 7371093f983d35d60a7fac3a6f082de7fefe3648  media: venus: helpers: Wire up hfi platform buffer requirements

Warning reports:

https://lore.kernel.org/linux-media/202101131847.Yohd2Cfr-lkp@intel.com

Warning in current branch:

drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c:1242:5: warning: no previous prototype for 'bufreq_enc' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- arm-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- arm-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- arm64-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- c6x-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- c6x-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- c6x-randconfig-m031-20210113
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- c6x-randconfig-r013-20210113
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- h8300-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- i386-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- ia64-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- m68k-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- m68k-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- nds32-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- nios2-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- parisc-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- riscv-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- riscv-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- sh-allmodconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- sparc-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- x86_64-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
|-- xtensa-allyesconfig
|   `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc
`-- xtensa-randconfig-r013-20210113
    `-- drivers-media-platform-qcom-venus-hfi_plat_bufs_v6.c:warning:no-previous-prototype-for-bufreq_enc

elapsed time: 2008m

configs tested: 231
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
ia64                         bigsur_defconfig
mips                            e55_defconfig
openrisc                 simple_smp_defconfig
xtensa                  nommu_kc705_defconfig
mips                          ath25_defconfig
mips                            gpr_defconfig
arm                       multi_v4t_defconfig
m68k                        stmark2_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
m68k                        m5272c3_defconfig
sh                            migor_defconfig
powerpc                        icon_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
arm                           corgi_defconfig
arm                     eseries_pxa_defconfig
ia64                          tiger_defconfig
m68k                          hp300_defconfig
powerpc64                           defconfig
ia64                             allyesconfig
m68k                          multi_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
mips                       rbtx49xx_defconfig
c6x                              alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                         vf610m4_defconfig
h8300                               defconfig
ia64                      gensparse_defconfig
arm                          pxa910_defconfig
sparc                            alldefconfig
powerpc                      ppc64e_defconfig
sh                   sh7770_generic_defconfig
powerpc                         wii_defconfig
arm                        magician_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                           ip28_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc44x_defconfig
arm                         lubbock_defconfig
arm                        vexpress_defconfig
mips                         tb0226_defconfig
arc                     nsimosci_hs_defconfig
c6x                        evmc6474_defconfig
arm                      jornada720_defconfig
powerpc                    mvme5100_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      katmai_defconfig
powerpc                       eiger_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
um                            kunit_defconfig
arm                         shannon_defconfig
sh                          sdk7786_defconfig
mips                      bmips_stb_defconfig
powerpc                     ksi8560_defconfig
arm                       imx_v4_v5_defconfig
powerpc                    gamecube_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
arm                        mini2440_defconfig
powerpc                     tqm8560_defconfig
sh                         ecovec24_defconfig
powerpc                      pcm030_defconfig
sparc                            allyesconfig
mips                         db1xxx_defconfig
powerpc                     rainier_defconfig
powerpc                     sbc8548_defconfig
c6x                        evmc6457_defconfig
arm                            hisi_defconfig
arc                           tb10x_defconfig
mips                      pistachio_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
arm                       versatile_defconfig
mips                          ath79_defconfig
arm                  colibri_pxa300_defconfig
powerpc                  mpc866_ads_defconfig
um                           x86_64_defconfig
mips                          malta_defconfig
sh                           se7724_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
arm                        multi_v7_defconfig
powerpc                      walnut_defconfig
c6x                         dsk6455_defconfig
m68k                          sun3x_defconfig
arm                          collie_defconfig
powerpc                    amigaone_defconfig
arc                     haps_hs_smp_defconfig
csky                                defconfig
parisc                              defconfig
mips                           xway_defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm5200_defconfig
mips                      maltasmvp_defconfig
arc                        nsimosci_defconfig
riscv                    nommu_virt_defconfig
m68k                        m5307c3_defconfig
arc                      axs103_smp_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc837x_rdb_defconfig
arm64                            alldefconfig
powerpc                     pseries_defconfig
mips                        nlm_xlp_defconfig
arm                         hackkit_defconfig
arm                         socfpga_defconfig
arm                             mxs_defconfig
x86_64                              defconfig
xtensa                       common_defconfig
powerpc                 mpc8315_rdb_defconfig
nios2                               defconfig
arm                         cm_x300_defconfig
sh                           se7750_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
sh                           se7722_defconfig
mips                        maltaup_defconfig
csky                             alldefconfig
arm                          iop32x_defconfig
mips                      pic32mzda_defconfig
arm                     am200epdkit_defconfig
nios2                            alldefconfig
mips                            ar7_defconfig
arm                        keystone_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210113
x86_64               randconfig-a004-20210113
x86_64               randconfig-a001-20210113
x86_64               randconfig-a005-20210113
x86_64               randconfig-a003-20210113
x86_64               randconfig-a002-20210113
i386                 randconfig-a002-20210113
i386                 randconfig-a005-20210113
i386                 randconfig-a006-20210113
i386                 randconfig-a003-20210113
i386                 randconfig-a001-20210113
i386                 randconfig-a004-20210113
i386                 randconfig-a002-20210114
i386                 randconfig-a005-20210114
i386                 randconfig-a006-20210114
i386                 randconfig-a001-20210114
i386                 randconfig-a003-20210114
i386                 randconfig-a004-20210114
x86_64               randconfig-a015-20210114
x86_64               randconfig-a012-20210114
x86_64               randconfig-a013-20210114
x86_64               randconfig-a016-20210114
x86_64               randconfig-a014-20210114
x86_64               randconfig-a011-20210114
i386                 randconfig-a012-20210113
i386                 randconfig-a011-20210113
i386                 randconfig-a016-20210113
i386                 randconfig-a013-20210113
i386                 randconfig-a015-20210113
i386                 randconfig-a014-20210113
i386                 randconfig-a012-20210114
i386                 randconfig-a011-20210114
i386                 randconfig-a016-20210114
i386                 randconfig-a015-20210114
i386                 randconfig-a013-20210114
i386                 randconfig-a014-20210114
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210114
x86_64               randconfig-a006-20210114
x86_64               randconfig-a001-20210114
x86_64               randconfig-a003-20210114
x86_64               randconfig-a005-20210114
x86_64               randconfig-a002-20210114
x86_64               randconfig-a015-20210113
x86_64               randconfig-a012-20210113
x86_64               randconfig-a013-20210113
x86_64               randconfig-a016-20210113
x86_64               randconfig-a014-20210113
x86_64               randconfig-a011-20210113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

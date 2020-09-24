Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A62F2777B2
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 19:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgIXRZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 13:25:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:17834 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727364AbgIXRZE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 13:25:04 -0400
IronPort-SDR: kKYP9P6qK5AHcrt4792olISUEz/O7EOYhydlkdOdHxug0fFmdPvHmmuLnKUyD/u7M24ocJOZOW
 RO9yorOdaMpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="149037594"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; 
   d="scan'208";a="149037594"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 10:25:03 -0700
IronPort-SDR: OUP64TJDNOIG3R0BLY/D7y0vUMAXuDYuoJE4di8Ft9OtRCO4lNsS1GN38yOnmaKDBCrgjrDVoN
 N16wP9Whdlig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; 
   d="scan'208";a="342966270"
Received: from lkp-server01.sh.intel.com (HELO d1a6b931d9c6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2020 10:25:01 -0700
Received: from kbuild by d1a6b931d9c6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLUzM-00003t-VO; Thu, 24 Sep 2020 17:25:00 +0000
Date:   Fri, 25 Sep 2020 01:24:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 01cc2ec6ea044731e939e5e47f7e115b86f49465
Message-ID: <5f6cd649.MJoZpddLvSm1wUfi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 01cc2ec6ea044731e939e5e47f7e115b86f49465  media: atomisp: cleanup __printf() atributes on printk messages

elapsed time: 1979m

configs tested: 210
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
sh                          rsk7269_defconfig
arm                             rpc_defconfig
riscv                               defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                          tiger_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
powerpc                    sam440ep_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
sh                        sh7757lcr_defconfig
h8300                     edosk2674_defconfig
powerpc                 xes_mpc85xx_defconfig
ia64                                defconfig
arm                            lart_defconfig
riscv                    nommu_virt_defconfig
powerpc                        warp_defconfig
arm                         ebsa110_defconfig
sh                          rsk7264_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                           se7206_defconfig
powerpc                     asp8347_defconfig
s390                             alldefconfig
c6x                        evmc6472_defconfig
microblaze                      mmu_defconfig
sh                          rsk7201_defconfig
powerpc                       maple_defconfig
sh                             sh03_defconfig
mips                          rm200_defconfig
mips                       bmips_be_defconfig
powerpc                   currituck_defconfig
i386                             alldefconfig
arm                        mini2440_defconfig
mips                         tb0226_defconfig
m68k                           sun3_defconfig
microblaze                          defconfig
s390                                defconfig
mips                           gcw0_defconfig
sh                           se7722_defconfig
arm                      tct_hammer_defconfig
powerpc                       ebony_defconfig
arm                          tango4_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      tqm8xx_defconfig
powerpc                    ge_imp3a_defconfig
arm                          lpd270_defconfig
csky                                defconfig
i386                                defconfig
powerpc                     ep8248e_defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7619_defconfig
ia64                             allyesconfig
arm                        neponset_defconfig
powerpc                      makalu_defconfig
c6x                        evmc6457_defconfig
arm                           sama5_defconfig
x86_64                           alldefconfig
arm                         s5pv210_defconfig
arm                       aspeed_g4_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
sh                           se7712_defconfig
arm                           corgi_defconfig
arc                     nsimosci_hs_defconfig
powerpc                      cm5200_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
riscv                             allnoconfig
powerpc                        cell_defconfig
arm                        trizeps4_defconfig
mips                      maltaaprp_defconfig
m68k                         apollo_defconfig
arc                            hsdk_defconfig
mips                          ath79_defconfig
arm                          imote2_defconfig
sh                           se7705_defconfig
mips                         tb0287_defconfig
powerpc                   lite5200b_defconfig
mips                       capcella_defconfig
arm                           u8500_defconfig
powerpc                     sbc8548_defconfig
mips                       rbtx49xx_defconfig
sh                   rts7751r2dplus_defconfig
riscv                          rv32_defconfig
mips                  maltasmvp_eva_defconfig
arm                       cns3420vb_defconfig
arc                             nps_defconfig
arm                         orion5x_defconfig
powerpc                      ep88xc_defconfig
arc                 nsimosci_hs_smp_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      malta_kvm_defconfig
arm                             mxs_defconfig
powerpc                      katmai_defconfig
openrisc                 simple_smp_defconfig
arm                          pxa910_defconfig
parisc                           alldefconfig
xtensa                          iss_defconfig
sh                     sh7710voipgw_defconfig
arm                         nhk8815_defconfig
powerpc                     rainier_defconfig
mips                            e55_defconfig
powerpc                        icon_defconfig
arm                        multi_v7_defconfig
arc                        nsimosci_defconfig
arm                           efm32_defconfig
powerpc                      pmac32_defconfig
mips                       lemote2f_defconfig
mips                           ci20_defconfig
m68k                       m5275evb_defconfig
arm                       versatile_defconfig
powerpc                     mpc83xx_defconfig
microblaze                    nommu_defconfig
powerpc                      chrp32_defconfig
sh                                  defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
sh                   sh7724_generic_defconfig
arm                         mv78xx0_defconfig
c6x                              allyesconfig
arm                    vt8500_v6_v7_defconfig
arm                            qcom_defconfig
sh                         microdev_defconfig
mips                            gpr_defconfig
arm                      integrator_defconfig
mips                          ath25_defconfig
mips                        nlm_xlp_defconfig
sh                           se7721_defconfig
arm                          gemini_defconfig
mips                      pic32mzda_defconfig
arm                            pleb_defconfig
arm                            mmp2_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200924
i386                 randconfig-a006-20200924
i386                 randconfig-a003-20200924
i386                 randconfig-a004-20200924
i386                 randconfig-a005-20200924
i386                 randconfig-a001-20200924
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a015-20200923
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200923
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a001-20200923

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

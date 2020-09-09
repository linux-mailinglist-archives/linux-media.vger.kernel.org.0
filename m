Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4360E263485
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbgIIRV5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:21:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:4303 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbgIIRVz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 13:21:55 -0400
IronPort-SDR: xwP32fGTk94FlTy8NAV95/eJfr7Y0QsNw1QtFeWCDC2Q84rAVb/GD28652kwqe5OEJ6hz9dueZ
 6paz1bppr5LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="222580275"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="222580275"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 10:21:53 -0700
IronPort-SDR: wm5RKinbd8V1aWbtt2vV54qOeiv/kJi6Sm9NFzh2lJuJw7P25WtnoR55GSfYE6EraIbQt/ANsH
 fdOPk0gUICCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="286290819"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2020 10:21:52 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kG3n5-0000XA-Ij; Wed, 09 Sep 2020 17:21:51 +0000
Date:   Thu, 10 Sep 2020 01:21:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 d034731bb4b4f2bf5f378231a6d99e59c2cb59f6
Message-ID: <5f590f22.8cqrvsKc1Huwc9w6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: d034731bb4b4f2bf5f378231a6d99e59c2cb59f6  media: vivid: fix compile warning/error

elapsed time: 1877m

configs tested: 241
configs skipped: 30

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                    xip_kc705_defconfig
arm                          iop32x_defconfig
h8300                    h8300h-sim_defconfig
arm                             mxs_defconfig
mips                malta_kvm_guest_defconfig
mips                         db1xxx_defconfig
mips                          rm200_defconfig
arm                        vexpress_defconfig
mips                         tb0226_defconfig
mips                      maltasmvp_defconfig
h8300                       h8s-sim_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
arm                      footbridge_defconfig
sh                         ecovec24_defconfig
powerpc                      pasemi_defconfig
sh                   secureedge5410_defconfig
sh                        sh7757lcr_defconfig
microblaze                    nommu_defconfig
i386                             allyesconfig
c6x                        evmc6678_defconfig
c6x                        evmc6472_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
mips                      loongson3_defconfig
arm                          lpd270_defconfig
mips                         cobalt_defconfig
sh                     magicpanelr2_defconfig
mips                           ip28_defconfig
mips                          malta_defconfig
powerpc                       holly_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
arm                           sama5_defconfig
arm                       netwinder_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
mips                           rs90_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
xtensa                              defconfig
arm                          pxa910_defconfig
arm                        spear3xx_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
m68k                       m5475evb_defconfig
mips                     decstation_defconfig
mips                  cavium_octeon_defconfig
sh                   sh7724_generic_defconfig
sh                          lboxre2_defconfig
powerpc                         wii_defconfig
arm                           h5000_defconfig
openrisc                    or1ksim_defconfig
mips                      maltaaprp_defconfig
arm                       imx_v4_v5_defconfig
mips                       lemote2f_defconfig
um                            kunit_defconfig
arm                         lpc18xx_defconfig
mips                           jazz_defconfig
m68k                       m5249evb_defconfig
parisc                generic-32bit_defconfig
arm                         assabet_defconfig
arm                            dove_defconfig
sh                                  defconfig
arm                              zx_defconfig
arm                  colibri_pxa270_defconfig
arm                          pxa168_defconfig
arm                       aspeed_g4_defconfig
arm                         socfpga_defconfig
arm                         bcm2835_defconfig
alpha                            alldefconfig
mips                         bigsur_defconfig
mips                     cu1000-neo_defconfig
arm                      pxa255-idp_defconfig
nios2                               defconfig
arm                          moxart_defconfig
arc                            hsdk_defconfig
powerpc                          allmodconfig
s390                                defconfig
m68k                                defconfig
arm                         hackkit_defconfig
powerpc                 linkstation_defconfig
arm                    vt8500_v6_v7_defconfig
arm                  colibri_pxa300_defconfig
xtensa                generic_kc705_defconfig
arm                         s3c2410_defconfig
arm                         cm_x300_defconfig
arm                         lpc32xx_defconfig
riscv                             allnoconfig
sh                            hp6xx_defconfig
nios2                         3c120_defconfig
arm                       aspeed_g5_defconfig
sh                         ap325rxa_defconfig
arm                       spear13xx_defconfig
openrisc                 simple_smp_defconfig
arm                          collie_defconfig
mips                         rt305x_defconfig
riscv                            allmodconfig
m68k                        stmark2_defconfig
arc                        vdk_hs38_defconfig
sh                               alldefconfig
powerpc                         ps3_defconfig
arm                        trizeps4_defconfig
nds32                               defconfig
arm                      tct_hammer_defconfig
powerpc                  mpc885_ads_defconfig
sh                          landisk_defconfig
arc                     haps_hs_smp_defconfig
arm                           tegra_defconfig
mips                         tb0287_defconfig
arc                          axs101_defconfig
sh                        apsh4ad0a_defconfig
sparc                               defconfig
arm                         s5pv210_defconfig
h8300                               defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
powerpc                      ppc64e_defconfig
mips                           ci20_defconfig
x86_64                           alldefconfig
arc                        nsim_700_defconfig
arm                        multi_v7_defconfig
arm                      jornada720_defconfig
sh                           se7206_defconfig
mips                          rb532_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
x86_64               randconfig-a004-20200909
x86_64               randconfig-a006-20200909
x86_64               randconfig-a003-20200909
x86_64               randconfig-a001-20200909
x86_64               randconfig-a005-20200909
x86_64               randconfig-a002-20200909
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a004-20200908
i386                 randconfig-a005-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a012-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200909
i386                 randconfig-a015-20200909
i386                 randconfig-a011-20200909
i386                 randconfig-a013-20200909
i386                 randconfig-a014-20200909
i386                 randconfig-a012-20200909
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
riscv                            allyesconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200908
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a005-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

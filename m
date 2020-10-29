Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A48729F752
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 23:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgJ2WBv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 18:01:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:55829 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2WBv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 18:01:51 -0400
IronPort-SDR: nHukXyVULHP7lo96nc7QBxSd89zTZQzDhB1x2WhP8IXhQx56IKykHev7SLesoAXZE+apKIkdiH
 4hk3IsVpRf3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="232698988"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="232698988"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 15:01:50 -0700
IronPort-SDR: LC55DTrGgJ71TP0rEgcS6MBcEOv1MujzNhGlfl9k4I6xwCtJcrDZqRqLG4SwGubRw0u9xLLuLC
 6Hd1K1S30B9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="356410855"
Received: from lkp-server01.sh.intel.com (HELO c01187be935a) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2020 15:01:47 -0700
Received: from kbuild by c01187be935a with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kYFzO-0000HI-MP; Thu, 29 Oct 2020 22:01:46 +0000
Date:   Fri, 30 Oct 2020 06:01:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 ce8bfbe73f1dac59377e1690c302e8e7b0662eba
Message-ID: <5f9b3b9c.ktL34QSRyFLcD8Vj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: ce8bfbe73f1dac59377e1690c302e8e7b0662eba  refcount.h: fix a kernel-doc markup

elapsed time: 1575m

configs tested: 219
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                        m5307c3_defconfig
c6x                                 defconfig
s390                             allyesconfig
arm                          prima2_defconfig
ia64                          tiger_defconfig
openrisc                         alldefconfig
powerpc                 mpc8272_ads_defconfig
mips                        maltaup_defconfig
sh                           se7721_defconfig
arc                          axs103_defconfig
arm                     davinci_all_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                            shmin_defconfig
c6x                              alldefconfig
arm                      integrator_defconfig
arm                       aspeed_g5_defconfig
s390                          debug_defconfig
sh                          rsk7269_defconfig
mips                  decstation_64_defconfig
m68k                          amiga_defconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
xtensa                           alldefconfig
powerpc                 mpc8315_rdb_defconfig
arm                          pxa3xx_defconfig
ia64                                defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
sh                          lboxre2_defconfig
mips                           gcw0_defconfig
powerpc                       ebony_defconfig
sh                   sh7770_generic_defconfig
arm                          simpad_defconfig
arm                         bcm2835_defconfig
arm                        mvebu_v7_defconfig
powerpc                     mpc5200_defconfig
powerpc                      chrp32_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5249evb_defconfig
arm                           tegra_defconfig
powerpc                 mpc834x_mds_defconfig
mips                     loongson1b_defconfig
powerpc64                           defconfig
mips                             allyesconfig
sh                           se7343_defconfig
arc                                 defconfig
powerpc                      katmai_defconfig
mips                          rb532_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
c6x                        evmc6472_defconfig
riscv                               defconfig
sh                             sh03_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
sh                        dreamcast_defconfig
powerpc                       maple_defconfig
c6x                        evmc6678_defconfig
powerpc                      arches_defconfig
sh                        apsh4ad0a_defconfig
mips                       capcella_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     akebono_defconfig
powerpc                      pcm030_defconfig
arm                             ezx_defconfig
powerpc64                        alldefconfig
powerpc                  iss476-smp_defconfig
arm                          imote2_defconfig
mips                     decstation_defconfig
m68k                        m5407c3_defconfig
mips                            gpr_defconfig
mips                       bmips_be_defconfig
ia64                      gensparse_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                    gamecube_defconfig
powerpc                     stx_gp3_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
mips                malta_qemu_32r6_defconfig
sh                             espt_defconfig
arm                          ixp4xx_defconfig
um                            kunit_defconfig
m68k                          multi_defconfig
nds32                            alldefconfig
um                           x86_64_defconfig
arm                      tct_hammer_defconfig
arm                              zx_defconfig
arm                           viper_defconfig
powerpc                      pasemi_defconfig
m68k                            q40_defconfig
mips                         db1xxx_defconfig
alpha                            allyesconfig
arc                 nsimosci_hs_smp_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                   motionpro_defconfig
sh                          rsk7203_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
h8300                            alldefconfig
c6x                        evmc6457_defconfig
ia64                             alldefconfig
arm                            mps2_defconfig
arm                            zeus_defconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
riscv                    nommu_virt_defconfig
arm                          pxa168_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201029
x86_64               randconfig-a002-20201029
x86_64               randconfig-a003-20201029
x86_64               randconfig-a006-20201029
x86_64               randconfig-a005-20201029
x86_64               randconfig-a004-20201029
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
i386                 randconfig-a002-20201029
i386                 randconfig-a005-20201029
i386                 randconfig-a003-20201029
i386                 randconfig-a001-20201029
i386                 randconfig-a004-20201029
i386                 randconfig-a006-20201029
i386                 randconfig-a002-20201028
i386                 randconfig-a005-20201028
i386                 randconfig-a003-20201028
i386                 randconfig-a001-20201028
i386                 randconfig-a004-20201028
i386                 randconfig-a006-20201028
x86_64               randconfig-a011-20201028
x86_64               randconfig-a013-20201028
x86_64               randconfig-a016-20201028
x86_64               randconfig-a015-20201028
x86_64               randconfig-a012-20201028
x86_64               randconfig-a014-20201028
i386                 randconfig-a016-20201029
i386                 randconfig-a014-20201029
i386                 randconfig-a015-20201029
i386                 randconfig-a013-20201029
i386                 randconfig-a012-20201029
i386                 randconfig-a011-20201029
i386                 randconfig-a016-20201028
i386                 randconfig-a014-20201028
i386                 randconfig-a015-20201028
i386                 randconfig-a013-20201028
i386                 randconfig-a012-20201028
i386                 randconfig-a011-20201028
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026
x86_64               randconfig-a001-20201028
x86_64               randconfig-a002-20201028
x86_64               randconfig-a003-20201028
x86_64               randconfig-a006-20201028
x86_64               randconfig-a005-20201028
x86_64               randconfig-a004-20201028
x86_64               randconfig-a011-20201029
x86_64               randconfig-a013-20201029
x86_64               randconfig-a016-20201029
x86_64               randconfig-a015-20201029
x86_64               randconfig-a012-20201029
x86_64               randconfig-a014-20201029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

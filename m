Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAD73B0B38
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 19:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhFVRPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 13:15:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:46387 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhFVRPg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 13:15:36 -0400
IronPort-SDR: mphxh+lWbypFclaOnICaRO/RNz/Irp50oS2/QqJOPlO4HwdceOiC4aeK9SHYXu7+tD1jaeu5sR
 kQW5abxtfSxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="268243349"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="268243349"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 10:13:19 -0700
IronPort-SDR: gTqkZ8+DyV1eP+2eAt99MqNjCF+umu8H+NZ1jwZY/5Eh0H+LQCZ5A348kUc/B73fJn8NHQbIVW
 Do1z8Zefex1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="406399001"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jun 2021 10:13:17 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lvjxd-0005N9-8x; Tue, 22 Jun 2021 17:13:17 +0000
Date:   Wed, 23 Jun 2021 01:12:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 52fb74b6891b47ceade325c39d7cedad1e376736
Message-ID: <60d21a0f.eCyQt6x2gRPMy3Hu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 52fb74b6891b47ceade325c39d7cedad1e376736  media: gspca: Drop default m

elapsed time: 1642m

configs tested: 227
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
powerpc                      mgcoge_defconfig
sh                            titan_defconfig
arm                         s5pv210_defconfig
h8300                            alldefconfig
sh                           se7619_defconfig
arc                          axs103_defconfig
arm                       versatile_defconfig
arm                         s3c2410_defconfig
powerpc                      chrp32_defconfig
m68k                        mvme16x_defconfig
openrisc                            defconfig
powerpc                    ge_imp3a_defconfig
arm                         at91_dt_defconfig
m68k                       m5475evb_defconfig
mips                     cu1000-neo_defconfig
arm                         mv78xx0_defconfig
powerpc                          allmodconfig
arm                        spear6xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
arm                      integrator_defconfig
powerpc                 xes_mpc85xx_defconfig
um                           x86_64_defconfig
mips                         db1xxx_defconfig
arc                        nsimosci_defconfig
arm                       imx_v4_v5_defconfig
alpha                            alldefconfig
powerpc                      ppc64e_defconfig
microblaze                          defconfig
mips                         rt305x_defconfig
arm                           h5000_defconfig
sh                           se7343_defconfig
sh                           sh2007_defconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
powerpc                     sequoia_defconfig
arm                          badge4_defconfig
mips                          ath79_defconfig
arc                              allyesconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
m68k                            mac_defconfig
ia64                             alldefconfig
powerpc                     asp8347_defconfig
mips                        jmr3927_defconfig
riscv                    nommu_virt_defconfig
powerpc                     taishan_defconfig
arm                    vt8500_v6_v7_defconfig
arm                        keystone_defconfig
arm                          exynos_defconfig
mips                       lemote2f_defconfig
sh                          polaris_defconfig
m68k                         apollo_defconfig
powerpc                      katmai_defconfig
sh                          rsk7264_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
sh                           se7780_defconfig
arm                              alldefconfig
powerpc                      pcm030_defconfig
m68k                            q40_defconfig
m68k                       m5275evb_defconfig
mips                      loongson3_defconfig
arm                          simpad_defconfig
openrisc                         alldefconfig
mips                      fuloong2e_defconfig
sh                             espt_defconfig
arm                         palmz72_defconfig
sh                            shmin_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       aspeed_g5_defconfig
arc                        nsim_700_defconfig
mips                         tb0226_defconfig
sh                          lboxre2_defconfig
arm                            qcom_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                       bmips_be_defconfig
mips                            e55_defconfig
x86_64                           allyesconfig
powerpc                       holly_defconfig
parisc                generic-32bit_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
mips                           jazz_defconfig
sh                               allmodconfig
powerpc                     pq2fads_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
m68k                          hp300_defconfig
parisc                           alldefconfig
mips                        vocore2_defconfig
sh                           se7722_defconfig
powerpc                      pasemi_defconfig
m68k                       m5208evb_defconfig
ia64                         bigsur_defconfig
mips                  decstation_64_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
arm                          collie_defconfig
s390                                defconfig
sh                                  defconfig
arm                        mini2440_defconfig
powerpc                     kmeter1_defconfig
powerpc                 mpc8315_rdb_defconfig
s390                       zfcpdump_defconfig
sh                              ul2_defconfig
powerpc                      pmac32_defconfig
arm                          gemini_defconfig
mips                             allyesconfig
mips                          malta_defconfig
arm                             ezx_defconfig
mips                      maltaaprp_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        omega2p_defconfig
m68k                         amcore_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                   motionpro_defconfig
arm                       cns3420vb_defconfig
m68k                           sun3_defconfig
riscv                            allmodconfig
arm                       aspeed_g4_defconfig
arc                        vdk_hs38_defconfig
parisc                generic-64bit_defconfig
powerpc                     sbc8548_defconfig
powerpc                   currituck_defconfig
um                               alldefconfig
powerpc                     tqm8548_defconfig
arm                       multi_v4t_defconfig
ia64                            zx1_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210621
x86_64               randconfig-a001-20210621
x86_64               randconfig-a005-20210621
x86_64               randconfig-a003-20210621
x86_64               randconfig-a004-20210621
x86_64               randconfig-a006-20210621
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
i386                 randconfig-a002-20210621
i386                 randconfig-a001-20210621
i386                 randconfig-a003-20210621
i386                 randconfig-a006-20210621
i386                 randconfig-a005-20210621
i386                 randconfig-a004-20210621
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
i386                 randconfig-a011-20210622
i386                 randconfig-a011-20210621
i386                 randconfig-a014-20210621
i386                 randconfig-a013-20210621
i386                 randconfig-a015-20210621
i386                 randconfig-a012-20210621
i386                 randconfig-a016-20210621
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-b001-20210621
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622
x86_64               randconfig-a012-20210621
x86_64               randconfig-a016-20210621
x86_64               randconfig-a015-20210621
x86_64               randconfig-a014-20210621
x86_64               randconfig-a013-20210621
x86_64               randconfig-a011-20210621

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

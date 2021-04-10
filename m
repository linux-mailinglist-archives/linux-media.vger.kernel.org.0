Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B97E35AF66
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 19:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJRwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 13:52:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:47148 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234392AbhDJRwA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 13:52:00 -0400
IronPort-SDR: piD39X050Ru4N5wXgcgCKE+cB51ldwn16G0qNSoWa4yt5TXV/83+I6ycKFuoh7KjAuIyid2z89
 eFrpcGFr88FQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="191809195"
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="191809195"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2021 10:51:46 -0700
IronPort-SDR: JOAUuzfiE4CFLh6hhdxuMI9N7B+VJwyrSbhhjfFrSwF/i6awSvRAnerwSJ1xdVY5Qniq7YifiH
 WsFes51US0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,212,1613462400"; 
   d="scan'208";a="520650705"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2021 10:51:44 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lVHlo-000IWq-6u; Sat, 10 Apr 2021 17:51:44 +0000
Date:   Sun, 11 Apr 2021 01:51:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 4f4e6644cd876c844cdb3bea2dd7051787d5ae25
Message-ID: <6071e59e.iEnV4YTEy6Pl5VWD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 4f4e6644cd876c844cdb3bea2dd7051787d5ae25  media: gscpa/stv06xx: fix memory leak

elapsed time: 1763m

configs tested: 235
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
sh                          polaris_defconfig
arc                              allyesconfig
powerpc                     asp8347_defconfig
m68k                          multi_defconfig
arm64                            alldefconfig
powerpc                      bamboo_defconfig
m68k                       bvme6000_defconfig
mips                      pistachio_defconfig
openrisc                 simple_smp_defconfig
openrisc                  or1klitex_defconfig
xtensa                    xip_kc705_defconfig
arm                            hisi_defconfig
powerpc                      pmac32_defconfig
arm                          lpd270_defconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
mips                           xway_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     pq2fads_defconfig
mips                    maltaup_xpa_defconfig
mips                          ath79_defconfig
m68k                                defconfig
ia64                             allyesconfig
s390                       zfcpdump_defconfig
powerpc                      pasemi_defconfig
powerpc                 linkstation_defconfig
um                             i386_defconfig
s390                             allmodconfig
sh                           se7722_defconfig
m68k                        m5307c3_defconfig
powerpc                       ppc64_defconfig
arm                          gemini_defconfig
powerpc                     ep8248e_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
sh                           se7751_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
mips                        bcm63xx_defconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
arm                            mmp2_defconfig
powerpc64                           defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
powerpc                      arches_defconfig
sh                        dreamcast_defconfig
arm                             rpc_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                      mmu_defconfig
sh                                  defconfig
powerpc                 mpc8313_rdb_defconfig
arm                            dove_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7619_defconfig
powerpc                      chrp32_defconfig
arm                         socfpga_defconfig
arm                            pleb_defconfig
arm                            xcep_defconfig
arm                          ep93xx_defconfig
mips                            e55_defconfig
mips                        workpad_defconfig
mips                       bmips_be_defconfig
sh                            shmin_defconfig
arm                        multi_v7_defconfig
riscv                    nommu_k210_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        multi_v5_defconfig
h8300                               defconfig
mips                         tb0287_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
mips                         bigsur_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
arm                        shmobile_defconfig
arm                         s3c2410_defconfig
m68k                        stmark2_defconfig
sh                           se7712_defconfig
mips                        qi_lb60_defconfig
powerpc                     pseries_defconfig
mips                             allyesconfig
powerpc                   bluestone_defconfig
mips                      loongson3_defconfig
arc                                 defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                         amcore_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
arc                          axs101_defconfig
sh                          sdk7780_defconfig
arm                          badge4_defconfig
s390                             allyesconfig
arm                         at91_dt_defconfig
powerpc                 mpc834x_mds_defconfig
arm                             pxa_defconfig
powerpc                      walnut_defconfig
mips                       lemote2f_defconfig
sh                      rts7751r2d1_defconfig
m68k                       m5208evb_defconfig
openrisc                            defconfig
ia64                          tiger_defconfig
sh                   sh7770_generic_defconfig
powerpc                 canyonlands_defconfig
arm                     am200epdkit_defconfig
sh                        sh7757lcr_defconfig
arm                         nhk8815_defconfig
arc                      axs103_smp_defconfig
powerpc                     taishan_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
arm                         shannon_defconfig
h8300                     edosk2674_defconfig
powerpc                     ksi8560_defconfig
powerpc                       eiger_defconfig
mips                       rbtx49xx_defconfig
xtensa                  audio_kc705_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                          lboxre2_defconfig
sh                          r7785rp_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
mips                     loongson1b_defconfig
arm                         mv78xx0_defconfig
arm                       multi_v4t_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
arm                        vexpress_defconfig
csky                                defconfig
i386                                defconfig
sh                   secureedge5410_defconfig
arm                       versatile_defconfig
arc                        nsimosci_defconfig
sh                               alldefconfig
arm                          collie_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
i386                 randconfig-a015-20210410
i386                 randconfig-a014-20210410
i386                 randconfig-a012-20210410
i386                 randconfig-a016-20210410
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409
x86_64               randconfig-a003-20210410
x86_64               randconfig-a002-20210410
x86_64               randconfig-a001-20210410
x86_64               randconfig-a005-20210410
x86_64               randconfig-a006-20210410
x86_64               randconfig-a004-20210410

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

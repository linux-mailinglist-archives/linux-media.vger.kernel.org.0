Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1174F391EA8
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 20:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbhEZSGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 14:06:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:64716 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232141AbhEZSGc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 14:06:32 -0400
IronPort-SDR: UuvKA9lbwaoEEbj2VWR/wJ2URBTG9B/Yot0EBmk5yais3Of2Z23me+NrA3vRwXFBltpXBfMmeF
 jRgFpTEtQsJA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202567061"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202567061"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 11:05:00 -0700
IronPort-SDR: q+Lw5fVI2ILUuB/5BDOdnR1q1aySTHvtcBP60NjiUIRsEjrvRhJc0QR6u+qHGzqc4mfRyKJmu3
 0MzcNULrEOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="444193451"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 May 2021 11:04:59 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1llxtp-0002Ld-KL; Wed, 26 May 2021 18:04:57 +0000
Date:   Thu, 27 May 2021 02:04:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS WITH WARNING
 71c689dc2e732d4cb190aaf0edea73116b1611bd
Message-ID: <60ae8d9b.wZTxKTqa0/Ljnd3G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 71c689dc2e732d4cb190aaf0edea73116b1611bd  media: v4l2-ctrls: split up into four source files

possible Warning in current branch:

drivers/media/v4l2-core/v4l2-ctrls-api.c:12:1: iwyu: warning: superfluous #include <linux/slab.h>
drivers/media/v4l2-core/v4l2-ctrls-api.c:17:1: iwyu: warning: superfluous #include <media/v4l2-ioctl.h>
drivers/media/v4l2-core/v4l2-ctrls-request.c:14:1: iwyu: warning: superfluous #include <media/v4l2-ioctl.h>

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-randconfig-b001-20210526
    |-- drivers-media-v4l2-core-v4l2-ctrls-api.c:iwyu:warning:superfluous-include-linux-slab.h
    |-- drivers-media-v4l2-core-v4l2-ctrls-api.c:iwyu:warning:superfluous-include-media-v4l2-ioctl.h
    `-- drivers-media-v4l2-core-v4l2-ctrls-request.c:iwyu:warning:superfluous-include-media-v4l2-ioctl.h

elapsed time: 1600m

configs tested: 262
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
sh                           se7751_defconfig
arm                           sunxi_defconfig
openrisc                         alldefconfig
arm                       imx_v6_v7_defconfig
sh                          sdk7786_defconfig
sh                   rts7751r2dplus_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
powerpc                      ppc44x_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
s390                          debug_defconfig
xtensa                    xip_kc705_defconfig
alpha                            allyesconfig
arm                       multi_v4t_defconfig
m68k                        m5272c3_defconfig
arm                        oxnas_v6_defconfig
sh                         microdev_defconfig
arm                          ep93xx_defconfig
x86_64                            allnoconfig
mips                      maltasmvp_defconfig
powerpc                  mpc866_ads_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
arm                        spear3xx_defconfig
sh                           se7705_defconfig
powerpc                       maple_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                             ezx_defconfig
arm                              alldefconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ksi8560_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
mips                           ip22_defconfig
m68k                             allyesconfig
powerpc                     redwood_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
powerpc                       eiger_defconfig
arm                         socfpga_defconfig
arm                          moxart_defconfig
powerpc                      katmai_defconfig
mips                         mpc30x_defconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
powerpc                    ge_imp3a_defconfig
um                               allmodconfig
powerpc                     pq2fads_defconfig
arm                         at91_dt_defconfig
powerpc                       holly_defconfig
arc                        vdk_hs38_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
powerpc                    sam440ep_defconfig
arm                     davinci_all_defconfig
sparc64                          alldefconfig
arm                          pxa910_defconfig
mips                  cavium_octeon_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
arm                         orion5x_defconfig
powerpc                   motionpro_defconfig
powerpc64                           defconfig
um                             i386_defconfig
sparc64                             defconfig
arm                        multi_v7_defconfig
mips                           ip28_defconfig
mips                         db1xxx_defconfig
xtensa                         virt_defconfig
nios2                            alldefconfig
arm                      jornada720_defconfig
arm                            pleb_defconfig
sh                           se7343_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                       spear13xx_defconfig
arm                        spear6xx_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
arm                           tegra_defconfig
sh                          rsk7264_defconfig
ia64                        generic_defconfig
arm                         axm55xx_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
mips                      maltaaprp_defconfig
arm                         cm_x300_defconfig
mips                          rm200_defconfig
arm                           omap1_defconfig
arm                       imx_v4_v5_defconfig
sh                          r7785rp_defconfig
powerpc                     asp8347_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                            ar7_defconfig
powerpc                      bamboo_defconfig
arm                           u8500_defconfig
arm                         s3c2410_defconfig
arm                            qcom_defconfig
powerpc                      pasemi_defconfig
m68k                          multi_defconfig
sh                          r7780mp_defconfig
powerpc                    mvme5100_defconfig
mips                          ath79_defconfig
arm                          lpd270_defconfig
sh                           se7750_defconfig
mips                      pic32mzda_defconfig
mips                         tb0219_defconfig
m68k                       m5249evb_defconfig
powerpc                     taishan_defconfig
riscv                             allnoconfig
sh                           se7206_defconfig
arm                       cns3420vb_defconfig
powerpc                     sequoia_defconfig
sh                           se7619_defconfig
s390                                defconfig
arc                          axs101_defconfig
sh                           se7724_defconfig
powerpc               mpc834x_itxgp_defconfig
parisc                generic-32bit_defconfig
arm                         lpc18xx_defconfig
mips                      fuloong2e_defconfig
powerpc                      obs600_defconfig
sparc                       sparc64_defconfig
m68k                        stmark2_defconfig
arm                      tct_hammer_defconfig
xtensa                    smp_lx200_defconfig
mips                      loongson3_defconfig
riscv                    nommu_k210_defconfig
alpha                            alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                        mvme147_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
m68k                        mvme16x_defconfig
arm                             rpc_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                        fsp2_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
riscv                          rv32_defconfig
sh                               j2_defconfig
arm64                            alldefconfig
sh                   secureedge5410_defconfig
sh                        edosk7705_defconfig
powerpc                      tqm8xx_defconfig
powerpc                   currituck_defconfig
mips                          ath25_defconfig
arc                        nsim_700_defconfig
mips                        nlm_xlr_defconfig
m68k                          hp300_defconfig
arm                       aspeed_g5_defconfig
mips                          rb532_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
i386                 randconfig-a011-20210526
i386                 randconfig-a016-20210526
i386                 randconfig-a015-20210526
i386                 randconfig-a012-20210526
i386                 randconfig-a014-20210526
i386                 randconfig-a013-20210526
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                            allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210525
x86_64               randconfig-b001-20210526
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

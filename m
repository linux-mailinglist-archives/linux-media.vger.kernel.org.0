Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003A32F51EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbhAMSYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:24:22 -0500
Received: from mga14.intel.com ([192.55.52.115]:31360 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728254AbhAMSYW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:24:22 -0500
IronPort-SDR: 4rcPkFajSOVjaEVcoP0bxXaQls2YKERCxVNgOL+sSXXitKpz6WRnamo10tURG5IhfMb/5zPH8H
 gp8pGs32VL2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="177474161"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="177474161"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2021 10:23:41 -0800
IronPort-SDR: iH0qQrJZUriqepDRJ+voH3Yz8nEJhSNtds3tOYwGNxs7X3PBedViAl2dtMny2UdTl60xCYShLc
 VgDpxzC2ukRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; 
   d="scan'208";a="400640942"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2021 10:23:39 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kzknz-0000KL-9S; Wed, 13 Jan 2021 18:23:39 +0000
Date:   Thu, 14 Jan 2021 02:22:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 d497fcdab02996a4510d5dd0d743447c737c317a
Message-ID: <5fff3a6f.PkN16lZnxTKnGEqI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: d497fcdab02996a4510d5dd0d743447c737c317a  media: aspeed: fix error return code in aspeed_video_setup_video()

elapsed time: 1493m

configs tested: 271
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

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
arm                         shannon_defconfig
powerpc                       maple_defconfig
arm                              zx_defconfig
arm                       spear13xx_defconfig
arm                  colibri_pxa300_defconfig
sh                           se7206_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                   lite5200b_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                       lemote2f_defconfig
sh                      rts7751r2d1_defconfig
m68k                        m5272c3_defconfig
sh                            migor_defconfig
powerpc                        icon_defconfig
sh                               alldefconfig
mips                     cu1000-neo_defconfig
arm                       cns3420vb_defconfig
mips                 decstation_r4k_defconfig
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
mips                     decstation_defconfig
sh                   sh7770_generic_defconfig
arm                            hisi_defconfig
c6x                        evmc6472_defconfig
microblaze                          defconfig
xtensa                  cadence_csp_defconfig
sparc                            alldefconfig
powerpc                      ppc64e_defconfig
powerpc                         wii_defconfig
arm                        magician_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         lubbock_defconfig
arm                        vexpress_defconfig
mips                         tb0226_defconfig
arc                     nsimosci_hs_defconfig
c6x                        evmc6474_defconfig
arm                      jornada720_defconfig
powerpc                     akebono_defconfig
mips                  cavium_octeon_defconfig
arm                           h3600_defconfig
arm                          badge4_defconfig
xtensa                           alldefconfig
arm                           sama5_defconfig
i386                                defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                    mvme5100_defconfig
m68k                         amcore_defconfig
mips                        bcm47xx_defconfig
m68k                          amiga_defconfig
mips                        qi_lb60_defconfig
powerpc                 mpc836x_mds_defconfig
sh                           se7780_defconfig
sh                          sdk7786_defconfig
mips                      bmips_stb_defconfig
powerpc                     ksi8560_defconfig
arm                          moxart_defconfig
powerpc                      arches_defconfig
arm                             rpc_defconfig
arc                        nsimosci_defconfig
mips                        workpad_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           xway_defconfig
arc                           tb10x_defconfig
sh                           se7721_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
arm                        mini2440_defconfig
powerpc                     tqm8560_defconfig
sh                         ecovec24_defconfig
riscv                            alldefconfig
arc                            hsdk_defconfig
arm                            xcep_defconfig
c6x                        evmc6457_defconfig
arm                        mvebu_v7_defconfig
mips                      pistachio_defconfig
sh                         ap325rxa_defconfig
sh                           se7751_defconfig
arm                       versatile_defconfig
mips                          ath79_defconfig
s390                       zfcpdump_defconfig
xtensa                    smp_lx200_defconfig
h8300                    h8300h-sim_defconfig
powerpc                  mpc866_ads_defconfig
um                           x86_64_defconfig
mips                          malta_defconfig
sh                          r7785rp_defconfig
powerpc                       eiger_defconfig
m68k                            mac_defconfig
powerpc                     tqm8548_defconfig
arm                     davinci_all_defconfig
sh                          r7780mp_defconfig
arm                        keystone_defconfig
ia64                            zx1_defconfig
mips                      maltaaprp_defconfig
sh                           se7724_defconfig
sh                          urquell_defconfig
arm                        multi_v5_defconfig
powerpc                      pmac32_defconfig
powerpc                    amigaone_defconfig
arc                     haps_hs_smp_defconfig
csky                                defconfig
um                            kunit_defconfig
parisc                              defconfig
arm                           u8500_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
mips                     cu1830-neo_defconfig
powerpc                     tqm5200_defconfig
mips                      maltasmvp_defconfig
riscv                    nommu_virt_defconfig
m68k                        m5307c3_defconfig
arc                      axs103_smp_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
m68k                        m5407c3_defconfig
m68k                          atari_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7264_defconfig
sh                        apsh4ad0a_defconfig
sh                         microdev_defconfig
mips                        vocore2_defconfig
riscv                            allmodconfig
powerpc                      ppc44x_defconfig
sh                           se7722_defconfig
mips                     loongson1b_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        fsp2_defconfig
m68k                       m5275evb_defconfig
sh                   sh7724_generic_defconfig
powerpc                     taishan_defconfig
arm                        spear3xx_defconfig
xtensa                         virt_defconfig
parisc                generic-64bit_defconfig
mips                           rs90_defconfig
arm                          ixp4xx_defconfig
arm                            qcom_defconfig
sh                ecovec24-romimage_defconfig
arm                          tango4_defconfig
sh                           sh2007_defconfig
arm                         socfpga_defconfig
m68k                       m5249evb_defconfig
ia64                        generic_defconfig
mips                  decstation_64_defconfig
arm                        spear6xx_defconfig
arm                         s3c6400_defconfig
powerpc                     pseries_defconfig
arc                              alldefconfig
nios2                            alldefconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
powerpc                     rainier_defconfig
h8300                            alldefconfig
arm                         orion5x_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
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
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
x86_64               randconfig-a012-20210112
i386                 randconfig-a012-20210112
i386                 randconfig-a011-20210112
i386                 randconfig-a016-20210112
i386                 randconfig-a013-20210112
i386                 randconfig-a015-20210112
i386                 randconfig-a014-20210112
i386                 randconfig-a012-20210113
i386                 randconfig-a011-20210113
i386                 randconfig-a016-20210113
i386                 randconfig-a013-20210113
i386                 randconfig-a015-20210113
i386                 randconfig-a014-20210113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210112
x86_64               randconfig-a004-20210112
x86_64               randconfig-a001-20210112
x86_64               randconfig-a005-20210112
x86_64               randconfig-a003-20210112
x86_64               randconfig-a002-20210112
x86_64               randconfig-a015-20210113
x86_64               randconfig-a012-20210113
x86_64               randconfig-a013-20210113
x86_64               randconfig-a016-20210113
x86_64               randconfig-a014-20210113
x86_64               randconfig-a011-20210113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

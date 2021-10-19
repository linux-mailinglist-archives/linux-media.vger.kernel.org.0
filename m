Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59D2433DEF
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 19:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbhJSSBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 14:01:25 -0400
Received: from mga02.intel.com ([134.134.136.20]:52420 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhJSSBZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 14:01:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215751884"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="215751884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 10:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="661926393"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2021 10:59:10 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mctOI-000Cba-7A; Tue, 19 Oct 2021 17:59:10 +0000
Date:   Wed, 20 Oct 2021 01:59:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 af82746a05230370a4b1fecd97404a2b88649119
Message-ID: <616f0765.One6QBRXeIxD83gJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: af82746a05230370a4b1fecd97404a2b88649119  media: ite-cir: IR receiver stop working after receive overflow

elapsed time: 1542m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    adder875_defconfig
powerpc                      walnut_defconfig
arc                        nsim_700_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8548_defconfig
sh                           se7705_defconfig
sh                           se7722_defconfig
powerpc                      obs600_defconfig
mips                        nlm_xlr_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         cobalt_defconfig
arm                         hackkit_defconfig
mips                        omega2p_defconfig
powerpc                      cm5200_defconfig
mips                        qi_lb60_defconfig
xtensa                          iss_defconfig
arm                           viper_defconfig
powerpc                   bluestone_defconfig
powerpc                      acadia_defconfig
ia64                         bigsur_defconfig
arm                       multi_v4t_defconfig
arm                      jornada720_defconfig
powerpc                     powernv_defconfig
openrisc                            defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm                         palmz72_defconfig
arm                         nhk8815_defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
openrisc                    or1ksim_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         s5pv210_defconfig
mips                         tb0226_defconfig
arm                            qcom_defconfig
sparc                               defconfig
powerpc                     pseries_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
sh                     magicpanelr2_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         orion5x_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          imote2_defconfig
powerpc                      makalu_defconfig
arm                         s3c6400_defconfig
mips                             allyesconfig
powerpc                      ppc6xx_defconfig
sh                            shmin_defconfig
powerpc                        icon_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        neponset_defconfig
powerpc                           allnoconfig
arm                       mainstone_defconfig
powerpc                      ppc64e_defconfig
mips                          rb532_defconfig
m68k                        stmark2_defconfig
xtensa                  nommu_kc705_defconfig
sh                             sh03_defconfig
mips                       rbtx49xx_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7619_defconfig
mips                           ip28_defconfig
sh                          rsk7264_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
powerpc64                        alldefconfig
s390                       zfcpdump_defconfig
mips                           rs90_defconfig
h8300                            alldefconfig
mips                            e55_defconfig
m68k                       bvme6000_defconfig
powerpc                      pasemi_defconfig
ia64                            zx1_defconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
arm                        keystone_defconfig
arm                           sunxi_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                         s3c2410_defconfig
mips                        vocore2_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
powerpc                          g5_defconfig
powerpc                       holly_defconfig
arm                      integrator_defconfig
arm                           corgi_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211019
i386                 randconfig-c001-20211019
x86_64               randconfig-c001-20211019
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211019
s390                 randconfig-r044-20211019
riscv                randconfig-r042-20211019
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

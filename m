Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B308C346762
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 19:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhCWSPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 14:15:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:22940 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231645AbhCWSPM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 14:15:12 -0400
IronPort-SDR: kptqaf0WvJIMuDq32we/+BF/kn1l1ACLYk5wR8IX2rFQsBUN0L946iBbqSvw46oHjJHDP0j320
 zHNtiuIK49Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187220647"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="187220647"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 11:15:12 -0700
IronPort-SDR: bB/9tgskAhLxkfGZfL8lnPZy/SJuAN6LY6fNuBfvAyiG/txb10T3XncMumVxGyM6MlzVbJ/9hO
 VWM5Csbh4uTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="374338593"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Mar 2021 11:15:09 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lOlYa-0000k2-O4; Tue, 23 Mar 2021 18:15:08 +0000
Date:   Wed, 24 Mar 2021 02:14:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 bf9a40ae8d722f281a2721779595d6df1c33a0bf
Message-ID: <605a2ffe.xK14hFRCfK2/YuHu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: bf9a40ae8d722f281a2721779595d6df1c33a0bf  media: dvbdev: Fix memory leak in dvb_media_device_free()

possible Warning in current branch:

drivers/media/platform/imx-jpeg/mxc-jpeg.c:1993:3-10: line 1993 is redundant because platform_get_irq() already prints an error

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-randconfig-c024-20210323
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- i386-allmodconfig
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- i386-allyesconfig
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- riscv-allmodconfig
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- riscv-allyesconfig
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- sparc-randconfig-c023-20210323
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
|-- x86_64-allmodconfig
|   `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error
`-- x86_64-allyesconfig
    `-- drivers-media-platform-imx-jpeg-mxc-jpeg.c:line-is-redundant-because-platform_get_irq()-already-prints-an-error

elapsed time: 1101m

configs tested: 154
configs skipped: 2

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
xtensa                         virt_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        neponset_defconfig
arm                          pxa168_defconfig
xtensa                  nommu_kc705_defconfig
m68k                       m5208evb_defconfig
arc                         haps_hs_defconfig
powerpc                      katmai_defconfig
sh                   rts7751r2dplus_defconfig
mips                           ip27_defconfig
riscv                    nommu_virt_defconfig
arc                              alldefconfig
m68k                        m5307c3_defconfig
mips                     cu1000-neo_defconfig
h8300                    h8300h-sim_defconfig
arm                           sunxi_defconfig
powerpc                      tqm8xx_defconfig
m68k                             alldefconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
powerpc                      ppc64e_defconfig
arm                       imx_v4_v5_defconfig
sh                           se7724_defconfig
mips                      malta_kvm_defconfig
sh                        apsh4ad0a_defconfig
mips                         mpc30x_defconfig
arc                          axs103_defconfig
arm                         shannon_defconfig
powerpc                    adder875_defconfig
parisc                           alldefconfig
mips                        omega2p_defconfig
arm                      pxa255-idp_defconfig
arm                     davinci_all_defconfig
powerpc                      pasemi_defconfig
arm                        realview_defconfig
powerpc                      ppc6xx_defconfig
arm                          exynos_defconfig
nios2                            alldefconfig
powerpc                 linkstation_defconfig
powerpc                    gamecube_defconfig
arm                           tegra_defconfig
xtensa                  cadence_csp_defconfig
powerpc                         ps3_defconfig
sh                           se7750_defconfig
sh                          urquell_defconfig
openrisc                         alldefconfig
parisc                generic-64bit_defconfig
sh                           se7343_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7203_defconfig
mips                     loongson1b_defconfig
sparc                            allyesconfig
riscv                          rv32_defconfig
arm                          moxart_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                         wii_defconfig
mips                        bcm47xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210323
x86_64               randconfig-a003-20210323
x86_64               randconfig-a006-20210323
x86_64               randconfig-a001-20210323
x86_64               randconfig-a004-20210323
x86_64               randconfig-a005-20210323
i386                 randconfig-a003-20210323
i386                 randconfig-a004-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a004-20210322
i386                 randconfig-a003-20210322
i386                 randconfig-a001-20210322
i386                 randconfig-a002-20210322
i386                 randconfig-a006-20210322
i386                 randconfig-a005-20210322
x86_64               randconfig-a012-20210322
x86_64               randconfig-a015-20210322
x86_64               randconfig-a013-20210322
x86_64               randconfig-a014-20210322
x86_64               randconfig-a016-20210322
x86_64               randconfig-a011-20210322
i386                 randconfig-a014-20210322
i386                 randconfig-a011-20210322
i386                 randconfig-a015-20210322
i386                 randconfig-a016-20210322
i386                 randconfig-a012-20210322
i386                 randconfig-a013-20210322
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a015-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210322
x86_64               randconfig-a003-20210322
x86_64               randconfig-a001-20210322
x86_64               randconfig-a006-20210322
x86_64               randconfig-a004-20210322
x86_64               randconfig-a005-20210322
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

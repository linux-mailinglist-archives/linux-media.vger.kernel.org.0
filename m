Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FC63126FF
	for <lists+linux-media@lfdr.de>; Sun,  7 Feb 2021 19:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhBGS5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Feb 2021 13:57:15 -0500
Received: from mga06.intel.com ([134.134.136.31]:40677 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhBGS5K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Feb 2021 13:57:10 -0500
IronPort-SDR: Sd/Yr1npGpm6mEQQqlodFjU5SBjYd+g44kSkI6/C2PzK5/V+dOM/m0KFFctrm5xbqmYj8Db6dv
 B5RKln33vn8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="243125300"
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="scan'208";a="243125300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2021 10:56:28 -0800
IronPort-SDR: xkR73qO8A6MzkDmKgaQco8XbNrKdLjKNSCaZdDR79NqYkdRKddUkJEMl4p+EAtElnHVMhBQD1x
 Jazzc18thRVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,160,1610438400"; 
   d="scan'208";a="435333956"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2021 10:56:27 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l8pEQ-00031S-RJ; Sun, 07 Feb 2021 18:56:26 +0000
Date:   Mon, 08 Feb 2021 02:56:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 9746b11715c3949241e2d88cb9057da4adab7e02
Message-ID: <602037cd.cl0hlPtWO7qqfFZb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-tree
branch HEAD: 9746b11715c3949241e2d88cb9057da4adab7e02  media: i2c: Add imx334 camera sensor driver

i386-tinyconfig vmlinux size:

+-------+-------------------------------------------+------------------------------------------+
| DELTA |                  SYMBOL                   |                  COMMIT                  |
+-------+-------------------------------------------+------------------------------------------+
| +1154 | TOTAL                                     | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
| +1148 | TEXT                                      | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|  +134 | software_node_graph_parse_endpoint()      | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|  +130 | software_node_graph_get_next_endpoint()   | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|  +101 | kernel_fpu_begin_mask()                   | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|   +91 | shrink_page_list()                        | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|   +75 | swnode_graph_find_next_port()             | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|   +66 | software_node_graph_get_remote_endpoint() | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
|   -87 | kernel_fpu_begin()                        | 5c8fe583cce5..9746b11715c3 (ALL COMMITS) |
+-------+-------------------------------------------+------------------------------------------+

elapsed time: 2024m

configs tested: 138
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                              allyesconfig
mips                           ip27_defconfig
m68k                       m5249evb_defconfig
m68k                          sun3x_defconfig
arm                        mvebu_v7_defconfig
powerpc                 mpc8540_ads_defconfig
mips                  maltasmvp_eva_defconfig
arm                        spear6xx_defconfig
arm                          pcm027_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8540_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           stm32_defconfig
arm                          pxa3xx_defconfig
sh                          landisk_defconfig
arm                          moxart_defconfig
s390                             allmodconfig
powerpc                     kmeter1_defconfig
xtensa                  cadence_csp_defconfig
sh                   sh7724_generic_defconfig
arm                         at91_dt_defconfig
powerpc                      mgcoge_defconfig
powerpc                      obs600_defconfig
powerpc                     sbc8548_defconfig
mips                          rm200_defconfig
powerpc                     asp8347_defconfig
arm                        realview_defconfig
arm                  colibri_pxa270_defconfig
m68k                          multi_defconfig
sh                               j2_defconfig
sh                   sh7770_generic_defconfig
sh                            migor_defconfig
sh                     magicpanelr2_defconfig
mips                     cu1830-neo_defconfig
powerpc                   bluestone_defconfig
arm                     eseries_pxa_defconfig
m68k                          atari_defconfig
m68k                       bvme6000_defconfig
xtensa                              defconfig
powerpc                    socrates_defconfig
arm                        mvebu_v5_defconfig
powerpc                  storcenter_defconfig
ia64                            zx1_defconfig
powerpc                    sam440ep_defconfig
arm                        cerfcube_defconfig
arm                           viper_defconfig
microblaze                          defconfig
arm                         nhk8815_defconfig
arm                     davinci_all_defconfig
powerpc                     tqm8541_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
sh                          r7780mp_defconfig
arm                     am200epdkit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210206
i386                 randconfig-a005-20210206
i386                 randconfig-a003-20210206
i386                 randconfig-a006-20210206
i386                 randconfig-a002-20210206
i386                 randconfig-a004-20210206
x86_64               randconfig-a013-20210206
x86_64               randconfig-a014-20210206
x86_64               randconfig-a015-20210206
x86_64               randconfig-a011-20210206
x86_64               randconfig-a016-20210206
x86_64               randconfig-a012-20210206
i386                 randconfig-a013-20210206
i386                 randconfig-a016-20210206
i386                 randconfig-a014-20210206
i386                 randconfig-a012-20210206
i386                 randconfig-a015-20210206
i386                 randconfig-a011-20210206
x86_64               randconfig-a006-20210207
x86_64               randconfig-a001-20210207
x86_64               randconfig-a005-20210207
x86_64               randconfig-a002-20210207
x86_64               randconfig-a004-20210207
x86_64               randconfig-a003-20210207
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210206
x86_64               randconfig-a001-20210206
x86_64               randconfig-a005-20210206
x86_64               randconfig-a002-20210206
x86_64               randconfig-a004-20210206
x86_64               randconfig-a003-20210206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

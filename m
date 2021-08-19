Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B363F1F60
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 19:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhHSRvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 13:51:13 -0400
Received: from mga18.intel.com ([134.134.136.126]:8401 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhHSRvN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 13:51:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="203761099"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; 
   d="scan'208";a="203761099"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 10:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; 
   d="scan'208";a="512223599"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2021 10:50:35 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mGmBW-000U9Q-9V; Thu, 19 Aug 2021 17:50:34 +0000
Date:   Fri, 20 Aug 2021 01:49:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 19e95228c722ad458ef03f4a45e7740a640252f7
Message-ID: <611e99bd.4/WHoC0hp52MUzMX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: 19e95228c722ad458ef03f4a45e7740a640252f7  media: netup_unidvb: handle interrupt properly according to the firmware

elapsed time: 1662m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210816
i386                 randconfig-c001-20210818
powerpc                     pq2fads_defconfig
powerpc                      walnut_defconfig
powerpc                       holly_defconfig
arm                             ezx_defconfig
powerpc                     mpc512x_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      ep88xc_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     loongson1c_defconfig
arm                        mvebu_v5_defconfig
alpha                            alldefconfig
sh                     sh7710voipgw_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                 mpc834x_mds_defconfig
mips                           ip28_defconfig
sh                          urquell_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
arm                       aspeed_g4_defconfig
nios2                         10m50_defconfig
m68k                       m5249evb_defconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
arm                  colibri_pxa300_defconfig
sh                   sh7724_generic_defconfig
sparc                            alldefconfig
x86_64                           allyesconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
powerpc                        icon_defconfig
m68k                            mac_defconfig
powerpc                   currituck_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          lpd270_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                     loongson2k_defconfig
parisc                generic-64bit_defconfig
powerpc                     sequoia_defconfig
arc                     nsimosci_hs_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip27_defconfig
mips                      pic32mzda_defconfig
sh                        apsh4ad0a_defconfig
xtensa                          iss_defconfig
sh                           se7780_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
mips                  maltasmvp_eva_defconfig
arm                          pcm027_defconfig
mips                      loongson3_defconfig
ia64                             alldefconfig
powerpc                 mpc85xx_cds_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210818
x86_64               randconfig-a006-20210818
x86_64               randconfig-a003-20210818
x86_64               randconfig-a005-20210818
x86_64               randconfig-a002-20210818
x86_64               randconfig-a001-20210818
i386                 randconfig-a004-20210818
i386                 randconfig-a006-20210818
i386                 randconfig-a002-20210818
i386                 randconfig-a001-20210818
i386                 randconfig-a003-20210818
i386                 randconfig-a005-20210818
x86_64               randconfig-a013-20210819
x86_64               randconfig-a011-20210819
x86_64               randconfig-a012-20210819
x86_64               randconfig-a016-20210819
x86_64               randconfig-a014-20210819
x86_64               randconfig-a015-20210819
i386                 randconfig-a015-20210819
i386                 randconfig-a011-20210819
i386                 randconfig-a014-20210819
i386                 randconfig-a013-20210819
i386                 randconfig-a016-20210819
i386                 randconfig-a012-20210819
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210818
x86_64               randconfig-a004-20210819
x86_64               randconfig-a006-20210819
x86_64               randconfig-a003-20210819
x86_64               randconfig-a002-20210819
x86_64               randconfig-a005-20210819
x86_64               randconfig-a001-20210819
i386                 randconfig-a004-20210819
i386                 randconfig-a006-20210819
i386                 randconfig-a001-20210819
i386                 randconfig-a002-20210819
i386                 randconfig-a003-20210819
i386                 randconfig-a005-20210819
i386                 randconfig-a004-20210817
i386                 randconfig-a003-20210817
i386                 randconfig-a001-20210817
i386                 randconfig-a002-20210817
i386                 randconfig-a006-20210817
i386                 randconfig-a005-20210817
x86_64               randconfig-a013-20210818
x86_64               randconfig-a011-20210818
x86_64               randconfig-a012-20210818
x86_64               randconfig-a016-20210818
x86_64               randconfig-a014-20210818
x86_64               randconfig-a015-20210818
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816
i386                 randconfig-a015-20210818
i386                 randconfig-a011-20210818
i386                 randconfig-a013-20210818
i386                 randconfig-a014-20210818
i386                 randconfig-a016-20210818
i386                 randconfig-a012-20210818
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

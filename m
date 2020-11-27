Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7262C74AA
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388255AbgK1Vtd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:56017 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728568AbgK0TqG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 14:46:06 -0500
IronPort-SDR: 7nSikPHhwYlckLjX/40MhG+PuPYmkhPPHZ50OuCmDgMjdLjrLYBhV7lrByfiFQQMLvNJKE31YO
 5hAlrxT4OjSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234034419"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="234034419"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2020 11:40:54 -0800
IronPort-SDR: ZirvkXxYmRbuNFix4kzRPkXswiQ54MFVuUMVsuY2bNpnn/43YITtlJwnbbq9b3a/aRGEWPibRv
 3p/TQ5JEfamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; 
   d="scan'208";a="479759317"
Received: from lkp-server01.sh.intel.com (HELO b5888d13d5a5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Nov 2020 11:40:52 -0800
Received: from kbuild by b5888d13d5a5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kijbv-00009G-Ox; Fri, 27 Nov 2020 19:40:51 +0000
Date:   Sat, 28 Nov 2020 03:40:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 711561a41d1f70ad939c3ff3cf00e75fa8238337
Message-ID: <5fc1561b.3MTKYU/1PscHKaU5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 711561a41d1f70ad939c3ff3cf00e75fa8238337  media: lirc: fix lirc.h documentation generation

Warning in current branch:

drivers/media/i2c/ov2740.c:945 ov2740_load_otp_data() warn: variable dereferenced before check 'nvm' (see line 939)

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- parisc-randconfig-m031-20201127
    `-- drivers-media-i2c-ov2740.c-ov2740_load_otp_data()-warn:variable-dereferenced-before-check-nvm-(see-line-)

elapsed time: 1789m

configs tested: 120
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5475evb_defconfig
powerpc                 linkstation_defconfig
powerpc                      cm5200_defconfig
powerpc                        cell_defconfig
microblaze                    nommu_defconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
arm                       imx_v6_v7_defconfig
powerpc64                        alldefconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     mpc83xx_defconfig
arm                           viper_defconfig
s390                                defconfig
xtensa                    xip_kc705_defconfig
parisc                generic-32bit_defconfig
arm                        magician_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
sh                            migor_defconfig
powerpc                     skiroot_defconfig
arc                    vdk_hs38_smp_defconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
powerpc                     kmeter1_defconfig
mips                           ip22_defconfig
powerpc                      pasemi_defconfig
sh                          sdk7786_defconfig
powerpc                     sequoia_defconfig
arm                         lpc32xx_defconfig
sh                             sh03_defconfig
powerpc                      ppc6xx_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
h8300                       h8s-sim_defconfig
arm                         hackkit_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
powerpc                 mpc8272_ads_defconfig
xtensa                          iss_defconfig
xtensa                              defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
m68k                       m5208evb_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
powerpc                    klondike_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201127
i386                 randconfig-a003-20201127
i386                 randconfig-a002-20201127
i386                 randconfig-a005-20201127
i386                 randconfig-a001-20201127
i386                 randconfig-a006-20201127
x86_64               randconfig-a015-20201127
x86_64               randconfig-a011-20201127
x86_64               randconfig-a014-20201127
x86_64               randconfig-a016-20201127
x86_64               randconfig-a012-20201127
x86_64               randconfig-a013-20201127
i386                 randconfig-a012-20201127
i386                 randconfig-a013-20201127
i386                 randconfig-a011-20201127
i386                 randconfig-a016-20201127
i386                 randconfig-a014-20201127
i386                 randconfig-a015-20201127
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201127
x86_64               randconfig-a003-20201127
x86_64               randconfig-a004-20201127
x86_64               randconfig-a005-20201127
x86_64               randconfig-a002-20201127
x86_64               randconfig-a001-20201127

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F03628F78F
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 19:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404906AbgJORTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 13:19:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:21185 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390145AbgJORTA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 13:19:00 -0400
IronPort-SDR: sTmsm5HSxP5HyX28SAktcjnBJ/x16m8P4g4ARbnE44PqpgQI/Rume7NKX9pxv9kXotj3cASOEO
 i8p0oGpuMm8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="146264710"
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; 
   d="scan'208";a="146264710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2020 10:18:59 -0700
IronPort-SDR: 0iETKS5C5kttUfXAN091IV9c53sdvec2EkoaVUur/Nxz9fdRUMReGtyAf3TeTuDs9dfvIi+DLQ
 FwB6R/Aer0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; 
   d="scan'208";a="357794221"
Received: from lkp-server01.sh.intel.com (HELO 5003fa193bf3) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2020 10:18:58 -0700
Received: from kbuild by 5003fa193bf3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kT6u1-00002p-Aj; Thu, 15 Oct 2020 17:18:57 +0000
Date:   Fri, 16 Oct 2020 01:18:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 a2c13eb834ddb25797a387c6d571eda439592603
Message-ID: <5f888474.bd2pOKMN4SALsEha%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: a2c13eb834ddb25797a387c6d571eda439592603  PM / devfreq: remove a duplicated kernel-doc markup

elapsed time: 1737m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        shmobile_defconfig
m68k                        m5407c3_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                           viper_defconfig
arm                          pxa168_defconfig
arm                           sama5_defconfig
sparc                       sparc32_defconfig
arm                        multi_v5_defconfig
mips                            gpr_defconfig
powerpc                 mpc834x_mds_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
mips                            e55_defconfig
xtensa                  audio_kc705_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
arm                          collie_defconfig
mips                      maltaaprp_defconfig
arm                         cm_x300_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8555_defconfig
arm                              alldefconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc832x_mds_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath79_defconfig
arm                  colibri_pxa300_defconfig
arm                            xcep_defconfig
powerpc                       eiger_defconfig
mips                           ip32_defconfig
alpha                               defconfig
powerpc                   motionpro_defconfig
mips                          malta_defconfig
arm                         lpc32xx_defconfig
arm                          simpad_defconfig
sh                               allmodconfig
riscv                    nommu_k210_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      pmac32_defconfig
powerpc                     sbc8548_defconfig
sh                              ul2_defconfig
mips                   sb1250_swarm_defconfig
arc                                 defconfig
arm                            zeus_defconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc                      cm5200_defconfig
powerpc                 linkstation_defconfig
ia64                          tiger_defconfig
mips                    maltaup_xpa_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig
powerpc                     tqm8540_defconfig
arm                         nhk8815_defconfig
arm                             pxa_defconfig
arm                         bcm2835_defconfig
m68k                         amcore_defconfig
s390                       zfcpdump_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
powerpc                     mpc5200_defconfig
arm                       imx_v4_v5_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
sh                   sh7770_generic_defconfig
sh                          lboxre2_defconfig
powerpc                  mpc885_ads_defconfig
sh                          polaris_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
m68k                            q40_defconfig
arm                             rpc_defconfig
arm                           tegra_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201015
x86_64               randconfig-a002-20201015
x86_64               randconfig-a006-20201015
x86_64               randconfig-a001-20201015
x86_64               randconfig-a005-20201015
x86_64               randconfig-a003-20201015
i386                 randconfig-a005-20201015
i386                 randconfig-a006-20201015
i386                 randconfig-a001-20201015
i386                 randconfig-a003-20201015
i386                 randconfig-a004-20201015
i386                 randconfig-a002-20201015
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201015
i386                 randconfig-a013-20201015
i386                 randconfig-a015-20201015
i386                 randconfig-a011-20201015
i386                 randconfig-a012-20201015
i386                 randconfig-a014-20201015
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
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
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C772804DD
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 19:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732865AbgJARNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 13:13:22 -0400
Received: from mga05.intel.com ([192.55.52.43]:61016 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732507AbgJARNV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 13:13:21 -0400
IronPort-SDR: tyHoZWCq/HfwZv8i8Tk3DvsLAsqxkFuX5YuAtKv+jg3oWRoANNNwYDnBnIgjS+KPI8UXU/PEso
 wiv90D2FnEVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="247519929"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="247519929"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 10:13:10 -0700
IronPort-SDR: bVhAW+6KzD/BGf4M7merliUa+wBTxMKADk+V1p+Ju/4lS5DhxYiRFz+tUt9UPhr2+czFF4rx+N
 P99QMilzflyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="308707842"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 01 Oct 2020 10:13:08 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kO28h-0000fh-GV; Thu, 01 Oct 2020 17:13:07 +0000
Date:   Fri, 02 Oct 2020 01:12:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 cae045f495d259122cfa18a87c65a2b12fbdcbb2
Message-ID: <5f760e06.7AaBD6dcvNNw14Gt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: cae045f495d259122cfa18a87c65a2b12fbdcbb2  media: hist-v4l2.rst: remove :c:`type` from structs and enums

elapsed time: 1431m

configs tested: 187
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                          g5_defconfig
arm                           u8500_defconfig
powerpc                     sbc8548_defconfig
powerpc                    gamecube_defconfig
mips                          rb532_defconfig
arm                       aspeed_g4_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
h8300                            allyesconfig
arm                         shannon_defconfig
arm                  colibri_pxa300_defconfig
mips                          ath25_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
c6x                         dsk6455_defconfig
powerpc64                        alldefconfig
arm                          gemini_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
riscv                             allnoconfig
arm                              alldefconfig
mips                         tb0287_defconfig
arm                       cns3420vb_defconfig
arm                        realview_defconfig
arm                         assabet_defconfig
mips                       rbtx49xx_defconfig
csky                                defconfig
m68k                             allmodconfig
alpha                               defconfig
powerpc                 canyonlands_defconfig
mips                          ath79_defconfig
c6x                        evmc6457_defconfig
powerpc                     asp8347_defconfig
arm                         mv78xx0_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                        bcm63xx_defconfig
nds32                            alldefconfig
nios2                         10m50_defconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          simpad_defconfig
microblaze                    nommu_defconfig
arm                          pcm027_defconfig
sh                              ul2_defconfig
arm                        oxnas_v6_defconfig
mips                         rt305x_defconfig
mips                           ip28_defconfig
arm                          pxa3xx_defconfig
sh                ecovec24-romimage_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
m68k                             allyesconfig
s390                       zfcpdump_defconfig
powerpc                       ppc64_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
arm                           spitz_defconfig
h8300                               defconfig
powerpc                    mvme5100_defconfig
arc                            hsdk_defconfig
m68k                           sun3_defconfig
arm                          pxa910_defconfig
sh                     magicpanelr2_defconfig
powerpc                    sam440ep_defconfig
sh                          sdk7786_defconfig
xtensa                          iss_defconfig
powerpc                      ppc44x_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           stm32_defconfig
h8300                            alldefconfig
sh                           se7750_defconfig
m68k                            q40_defconfig
arm                        multi_v5_defconfig
arm                          lpd270_defconfig
arm                        trizeps4_defconfig
powerpc                      chrp32_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
powerpc                      makalu_defconfig
arm                       imx_v6_v7_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm47xx_defconfig
arm                             pxa_defconfig
arm                         hackkit_defconfig
sh                          rsk7269_defconfig
m68k                         apollo_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
mips                        nlm_xlr_defconfig
mips                        jmr3927_defconfig
powerpc                      katmai_defconfig
powerpc                           allnoconfig
nios2                               defconfig
riscv                            alldefconfig
arm                         palmz72_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     ksi8560_defconfig
sh                        sh7785lcr_defconfig
sh                          rsk7203_defconfig
sh                   sh7724_generic_defconfig
sh                             espt_defconfig
arm                          iop32x_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
i386                 randconfig-a003-20200930
i386                 randconfig-a002-20200930
i386                 randconfig-a006-20200930
i386                 randconfig-a005-20200930
i386                 randconfig-a004-20200930
i386                 randconfig-a001-20200930
x86_64               randconfig-a015-20200930
x86_64               randconfig-a013-20200930
x86_64               randconfig-a012-20200930
x86_64               randconfig-a016-20200930
x86_64               randconfig-a014-20200930
x86_64               randconfig-a011-20200930
i386                 randconfig-a011-20200930
i386                 randconfig-a015-20200930
i386                 randconfig-a012-20200930
i386                 randconfig-a014-20200930
i386                 randconfig-a016-20200930
i386                 randconfig-a013-20200930
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20200930
x86_64               randconfig-a005-20200930
x86_64               randconfig-a003-20200930
x86_64               randconfig-a004-20200930
x86_64               randconfig-a002-20200930
x86_64               randconfig-a006-20200930

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

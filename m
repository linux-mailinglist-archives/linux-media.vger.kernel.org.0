Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C5C25B2CB
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 19:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIBRPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 13:15:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:9255 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgIBRPO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 13:15:14 -0400
IronPort-SDR: mE/mt4uuWoIC02HNWCIZRQwzaiCusL5OwwXrIE7S5koj/rOGpOh0tztFN8sstZJty7XeMHxTvz
 1lXOJ1v4tJlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="221653107"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
   d="scan'208";a="221653107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 10:15:13 -0700
IronPort-SDR: uyP232MgceFKI6t9fadyEvESR2JcEXkU1/Li3wzu7btBbN3r2YsxKY84Jdj2O29YC0/cKKFV9s
 i97s65Y6/B0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
   d="scan'208";a="315184670"
Received: from lkp-server02.sh.intel.com (HELO eb469fda2af7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Sep 2020 10:15:12 -0700
Received: from kbuild by eb469fda2af7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kDWLn-0000BX-Ch; Wed, 02 Sep 2020 17:15:11 +0000
Date:   Thu, 03 Sep 2020 01:15:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 cfe9e707c5640c28ab168cabe91aea5d0b3f9195
Message-ID: <5f4fd316.z8I0z7m/Kp7HxO0j%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: cfe9e707c5640c28ab168cabe91aea5d0b3f9195  media: open.rst: document mc-centric and video-node-centric

elapsed time: 1731m

configs tested: 171
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
arc                              allyesconfig
arm                            mmp2_defconfig
sh                           sh2007_defconfig
sh                        edosk7705_defconfig
mips                      bmips_stb_defconfig
sh                             espt_defconfig
mips                           rs90_defconfig
c6x                        evmc6474_defconfig
powerpc                           allnoconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
sh                            migor_defconfig
arm                         shannon_defconfig
x86_64                           alldefconfig
powerpc                      pasemi_defconfig
sh                ecovec24-romimage_defconfig
arm                        mvebu_v5_defconfig
mips                      maltasmvp_defconfig
mips                         rt305x_defconfig
nios2                            alldefconfig
sh                          polaris_defconfig
arm                          gemini_defconfig
arc                        nsim_700_defconfig
s390                       zfcpdump_defconfig
arm                             pxa_defconfig
microblaze                    nommu_defconfig
sh                         microdev_defconfig
i386                                defconfig
ia64                            zx1_defconfig
sh                              ul2_defconfig
arm                        spear6xx_defconfig
sh                        apsh4ad0a_defconfig
arm                        clps711x_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
sh                           se7343_defconfig
riscv                             allnoconfig
arm                           efm32_defconfig
powerpc                             defconfig
arm                        shmobile_defconfig
arm                             rpc_defconfig
powerpc                      ppc40x_defconfig
powerpc                     pq2fads_defconfig
m68k                        mvme16x_defconfig
mips                      loongson3_defconfig
sh                          rsk7269_defconfig
ia64                                defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         hackkit_defconfig
xtensa                       common_defconfig
arm                           h5000_defconfig
arm                           sunxi_defconfig
sh                           se7721_defconfig
arm                            lart_defconfig
arm                      pxa255-idp_defconfig
arm                         mv78xx0_defconfig
arm                         s3c2410_defconfig
arm                              alldefconfig
mips                         tb0287_defconfig
mips                     cu1000-neo_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
m68k                             alldefconfig
mips                      malta_kvm_defconfig
m68k                       m5249evb_defconfig
x86_64                              defconfig
sh                          kfr2r09_defconfig
c6x                                 defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
sh                          r7785rp_defconfig
mips                         tb0226_defconfig
sh                            titan_defconfig
arm                        mvebu_v7_defconfig
powerpc                 linkstation_defconfig
mips                malta_qemu_32r6_defconfig
nds32                            alldefconfig
mips                    maltaup_xpa_defconfig
arm                            dove_defconfig
powerpc                     mpc512x_defconfig
arm                            qcom_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
powerpc                      ppc64e_defconfig
arm                          ixp4xx_defconfig
mips                         cobalt_defconfig
riscv                    nommu_virt_defconfig
arm                          exynos_defconfig
arm                        neponset_defconfig
sh                         ecovec24_defconfig
powerpc                  mpc885_ads_defconfig
mips                      pic32mzda_defconfig
mips                       capcella_defconfig
alpha                               defconfig
ia64                             allmodconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20200901
x86_64               randconfig-a006-20200901
x86_64               randconfig-a003-20200901
x86_64               randconfig-a005-20200901
x86_64               randconfig-a001-20200901
x86_64               randconfig-a002-20200901
i386                 randconfig-a004-20200901
i386                 randconfig-a005-20200901
i386                 randconfig-a006-20200901
i386                 randconfig-a002-20200901
i386                 randconfig-a001-20200901
i386                 randconfig-a003-20200901
i386                 randconfig-a016-20200901
i386                 randconfig-a015-20200901
i386                 randconfig-a011-20200901
i386                 randconfig-a013-20200901
i386                 randconfig-a014-20200901
i386                 randconfig-a012-20200901
i386                 randconfig-a016-20200902
i386                 randconfig-a015-20200902
i386                 randconfig-a011-20200902
i386                 randconfig-a013-20200902
i386                 randconfig-a014-20200902
i386                 randconfig-a012-20200902
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200902
x86_64               randconfig-a006-20200902
x86_64               randconfig-a003-20200902
x86_64               randconfig-a005-20200902
x86_64               randconfig-a001-20200902
x86_64               randconfig-a002-20200902
x86_64               randconfig-a013-20200901
x86_64               randconfig-a016-20200901
x86_64               randconfig-a011-20200901
x86_64               randconfig-a012-20200901
x86_64               randconfig-a015-20200901
x86_64               randconfig-a014-20200901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

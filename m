Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7011B207A2F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 19:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405442AbgFXRYd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 13:24:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:61492 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405318AbgFXRYb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 13:24:31 -0400
IronPort-SDR: YPaH7jcwqWNjRYmGRDNh9hEP6a5gb7F1e0rT3+8kOvU6FIS6eA+jwsEw7jYUcez9cXJHYNxmG5
 th1qZcYT1Yzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="124811345"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; 
   d="scan'208";a="124811345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 10:24:29 -0700
IronPort-SDR: 80aacObEhQinJbqB0r6t34D/tndfPWdvM+ChDqxb3E2bsOrJcKNe9UQsMp+d3IxTMTjb/xAJMP
 Il0SSqi95mpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; 
   d="scan'208";a="292582668"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jun 2020 10:24:28 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jo98N-000139-H0; Wed, 24 Jun 2020 17:24:27 +0000
Date:   Thu, 25 Jun 2020 01:23:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS
 e30cc79cc80fd919b697a15c5000d9f57487de8e
Message-ID: <5ef38c17.K9ePaIqwXshTP8Hy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: e30cc79cc80fd919b697a15c5000d9f57487de8e  media: media-request: Fix crash if memory allocation fails

elapsed time: 1676m

configs tested: 165
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
powerpc                      mgcoge_defconfig
sh                ecovec24-romimage_defconfig
arm                        mvebu_v7_defconfig
arm                        multi_v5_defconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7203_defconfig
arc                         haps_hs_defconfig
xtensa                          iss_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
sh                         microdev_defconfig
arm                       cns3420vb_defconfig
arc                            hsdk_defconfig
m68k                        m5272c3_defconfig
arm                           h3600_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
alpha                            alldefconfig
arc                             nps_defconfig
arm                      integrator_defconfig
ia64                                defconfig
m68k                        mvme147_defconfig
mips                  decstation_64_defconfig
arm                      tct_hammer_defconfig
mips                        omega2p_defconfig
powerpc                          g5_defconfig
c6x                         dsk6455_defconfig
arm                          tango4_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                    gamecube_defconfig
mips                         tb0219_defconfig
sh                          r7780mp_defconfig
mips                     cu1000-neo_defconfig
sh                        edosk7705_defconfig
arc                          axs101_defconfig
arc                              allyesconfig
arm                           efm32_defconfig
mips                      bmips_stb_defconfig
riscv                    nommu_virt_defconfig
arm                          collie_defconfig
sparc                            alldefconfig
sparc64                             defconfig
mips                        nlm_xlr_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
arm                          gemini_defconfig
powerpc                 mpc8272_ads_defconfig
riscv                          rv32_defconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
arm                        clps711x_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                            mps2_defconfig
arm                      footbridge_defconfig
xtensa                       common_defconfig
arm                          pxa910_defconfig
mips                 decstation_r4k_defconfig
sh                          rsk7264_defconfig
mips                          malta_defconfig
mips                    maltaup_xpa_defconfig
alpha                               defconfig
mips                       bmips_be_defconfig
ia64                            zx1_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200624
i386                 randconfig-a006-20200624
i386                 randconfig-a003-20200624
i386                 randconfig-a001-20200624
i386                 randconfig-a005-20200624
i386                 randconfig-a004-20200624
i386                 randconfig-a006-20200623
i386                 randconfig-a002-20200623
i386                 randconfig-a003-20200623
i386                 randconfig-a001-20200623
i386                 randconfig-a005-20200623
i386                 randconfig-a004-20200623
i386                 randconfig-a013-20200623
i386                 randconfig-a016-20200623
i386                 randconfig-a012-20200623
i386                 randconfig-a014-20200623
i386                 randconfig-a015-20200623
i386                 randconfig-a011-20200623
i386                 randconfig-a013-20200624
i386                 randconfig-a016-20200624
i386                 randconfig-a012-20200624
i386                 randconfig-a014-20200624
i386                 randconfig-a011-20200624
i386                 randconfig-a015-20200624
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

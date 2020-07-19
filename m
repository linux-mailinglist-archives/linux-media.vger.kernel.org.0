Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5226D2252F3
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 19:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgGSRJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 13:09:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:36243 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgGSRJv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 13:09:51 -0400
IronPort-SDR: /xbxzaqOOnbOxlHZdYIdvjQv5J51lH0HhDX/1SXrm8He83PX72MyWC6x8S5bYvoLh04sGNdWnF
 SJWyRUuUV2iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="214507923"
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="214507923"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2020 10:09:49 -0700
IronPort-SDR: BylT0IM6JFMDXps+gdaDYzlSOgJQMMBRo8bOivB0CuTKio3qL4hhUHVesKjyGAxbEBrf1volDE
 8SLz/ALP1KwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="487005507"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2020 10:09:48 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jxCot-0001Br-Qb; Sun, 19 Jul 2020 17:09:47 +0000
Date:   Mon, 20 Jul 2020 01:08:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 d6c91e4eacfee32c0a8c08201f9054ce140e4bf0
Message-ID: <5f147e24.4LMr1Qwq5ypTF5Cw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: d6c91e4eacfee32c0a8c08201f9054ce140e4bf0  media: atomisp: Fix error code in ov5693_probe()

elapsed time: 2031m

configs tested: 156
configs skipped: 9

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
nds32                             allnoconfig
powerpc                      ppc64e_defconfig
arm                           viper_defconfig
ia64                             alldefconfig
sh                           se7721_defconfig
arm                      pxa255-idp_defconfig
arc                         haps_hs_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    gamecube_defconfig
mips                  cavium_octeon_defconfig
mips                malta_qemu_32r6_defconfig
arm                        vexpress_defconfig
sh                             shx3_defconfig
arm                      integrator_defconfig
sparc                            allyesconfig
sparc                               defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
arm                          simpad_defconfig
openrisc                         allyesconfig
mips                   sb1250_swarm_defconfig
h8300                            allyesconfig
powerpc                 linkstation_defconfig
sparc                       sparc32_defconfig
arm                          badge4_defconfig
powerpc                      pmac32_defconfig
riscv                          rv32_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
powerpc                           allnoconfig
xtensa                    xip_kc705_defconfig
ia64                        generic_defconfig
mips                          rb532_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         tb0219_defconfig
csky                             alldefconfig
sh                        edosk7705_defconfig
arm                         s3c6400_defconfig
mips                       rbtx49xx_defconfig
arm                            u300_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
sh                                allnoconfig
microblaze                        allnoconfig
arc                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
i386                 randconfig-a001-20200717
i386                 randconfig-a005-20200717
i386                 randconfig-a002-20200717
i386                 randconfig-a006-20200717
i386                 randconfig-a003-20200717
i386                 randconfig-a004-20200717
x86_64               randconfig-a005-20200719
x86_64               randconfig-a002-20200719
x86_64               randconfig-a006-20200719
x86_64               randconfig-a001-20200719
x86_64               randconfig-a003-20200719
x86_64               randconfig-a004-20200719
x86_64               randconfig-a012-20200716
x86_64               randconfig-a011-20200716
x86_64               randconfig-a016-20200716
x86_64               randconfig-a014-20200716
x86_64               randconfig-a013-20200716
x86_64               randconfig-a015-20200716
x86_64               randconfig-a005-20200717
x86_64               randconfig-a006-20200717
x86_64               randconfig-a002-20200717
x86_64               randconfig-a001-20200717
x86_64               randconfig-a003-20200717
x86_64               randconfig-a004-20200717
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
i386                 randconfig-a016-20200717
i386                 randconfig-a011-20200717
i386                 randconfig-a015-20200717
i386                 randconfig-a012-20200717
i386                 randconfig-a013-20200717
i386                 randconfig-a014-20200717
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

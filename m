Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1391E9D17
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 07:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgFAFRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 01:17:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:47255 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgFAFRu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 01:17:50 -0400
IronPort-SDR: YuoLtrL/rFONrs+WHS0CAKeWRlPSx6bwsCG22PU+9igoFc6yutfIVRKB0ym0DYqSr8ciGjI8XA
 T4EVGw8DEHZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 22:17:50 -0700
IronPort-SDR: w+GY71Y0RFpMAkMx+8zgYZOg1lcYqLgJ+70U7zDTmBNEu4hkbBqPbk6f2Bn7kGVftLF8jm5tYy
 lNUMOfsx9ONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="470195252"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 22:17:49 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfcpY-0000DJ-AC; Mon, 01 Jun 2020 05:17:48 +0000
Date:   Mon, 01 Jun 2020 13:16:37 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 7d398a74c789941b36646d1b27cada97a8b58b06
Message-ID: <5ed48f35.52tWFJG71hWWXBu6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 7d398a74c789941b36646d1b27cada97a8b58b06  media: atomisp: get rid of sh_css_pipe.c

elapsed time: 2041m

configs tested: 134
configs skipped: 8

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
arm                         vf610m4_defconfig
arm                          pxa168_defconfig
nds32                             allnoconfig
s390                              allnoconfig
mips                           ip27_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           mtx1_defconfig
sh                            shmin_defconfig
microblaze                          defconfig
um                           x86_64_defconfig
mips                         db1xxx_defconfig
sh                          sdk7780_defconfig
arm                       aspeed_g5_defconfig
sh                   secureedge5410_defconfig
arm                         assabet_defconfig
arm                         shannon_defconfig
powerpc                      ppc6xx_defconfig
powerpc64                        alldefconfig
microblaze                    nommu_defconfig
arm                       mainstone_defconfig
arm                            hisi_defconfig
powerpc                     mpc83xx_defconfig
m68k                          multi_defconfig
m68k                             allyesconfig
mips                     decstation_defconfig
arm                        spear6xx_defconfig
c6x                                 defconfig
mips                        bcm63xx_defconfig
nds32                            alldefconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
powerpc                       ppc64_defconfig
mips                      pistachio_defconfig
c6x                         dsk6455_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7343_defconfig
mips                          rm200_defconfig
arm                        mvebu_v5_defconfig
xtensa                           alldefconfig
sh                          landisk_defconfig
sh                          rsk7264_defconfig
mips                       markeins_defconfig
arm                         lpc32xx_defconfig
um                               alldefconfig
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
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a004-20200531
i386                 randconfig-a003-20200531
i386                 randconfig-a006-20200531
i386                 randconfig-a002-20200531
i386                 randconfig-a005-20200531
i386                 randconfig-a001-20200531
i386                 randconfig-a013-20200531
i386                 randconfig-a012-20200531
i386                 randconfig-a015-20200531
i386                 randconfig-a011-20200531
i386                 randconfig-a016-20200531
i386                 randconfig-a014-20200531
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A61F7868
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 15:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgFLNFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 09:05:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:28011 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgFLNFh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 09:05:37 -0400
IronPort-SDR: +Ef1A4LNyaZFM9uFTSP0U0S27Lgh/fzdblYTFoTLIXfyEMdJRyilEO9PRHIBHPpxjhNNi/oC6w
 VCHe+qmUiQpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 06:05:36 -0700
IronPort-SDR: JfT3xiEhJEZoVPQV5ofv8hOPqwwL0KHwSOGsxyi1CFPwMp55LBqjfURs0vjZpFRiChjUH4khHK
 vUjP9hGOOKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="307294805"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2020 06:05:34 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjjNF-0000kY-N1; Fri, 12 Jun 2020 13:05:33 +0000
Date:   Fri, 12 Jun 2020 21:05:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD SUCCESS
 2630e1bb0948c3134c6f22ad275ae27cc6023532
Message-ID: <5ee37d8e.zVi7z7Fr6t/hOywE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-next
branch HEAD: 2630e1bb0948c3134c6f22ad275ae27cc6023532  media: rkvdec: Fix H264 scaling list order

elapsed time: 1136m

configs tested: 124
configs skipped: 4

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
powerpc                         wii_defconfig
powerpc                     mpc83xx_defconfig
mips                           ip32_defconfig
c6x                        evmc6457_defconfig
nds32                               defconfig
alpha                            alldefconfig
mips                     loongson1b_defconfig
alpha                               defconfig
mips                       bmips_be_defconfig
c6x                        evmc6678_defconfig
powerpc                          g5_defconfig
arc                            hsdk_defconfig
arm                          tango4_defconfig
sh                        edosk7705_defconfig
csky                                defconfig
alpha                            allyesconfig
sh                        dreamcast_defconfig
mips                           ci20_defconfig
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
openrisc                         allyesconfig
nds32                             allnoconfig
csky                             allyesconfig
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
i386                 randconfig-a006-20200612
i386                 randconfig-a002-20200612
i386                 randconfig-a001-20200612
i386                 randconfig-a004-20200612
i386                 randconfig-a005-20200612
i386                 randconfig-a003-20200612
i386                 randconfig-a006-20200611
i386                 randconfig-a002-20200611
i386                 randconfig-a001-20200611
i386                 randconfig-a004-20200611
i386                 randconfig-a005-20200611
i386                 randconfig-a003-20200611
x86_64               randconfig-a001-20200612
x86_64               randconfig-a003-20200612
x86_64               randconfig-a002-20200612
x86_64               randconfig-a006-20200612
x86_64               randconfig-a005-20200612
x86_64               randconfig-a004-20200612
i386                 randconfig-a015-20200612
i386                 randconfig-a011-20200612
i386                 randconfig-a014-20200612
i386                 randconfig-a016-20200612
i386                 randconfig-a013-20200612
i386                 randconfig-a012-20200612
i386                 randconfig-a015-20200611
i386                 randconfig-a011-20200611
i386                 randconfig-a014-20200611
i386                 randconfig-a013-20200611
i386                 randconfig-a016-20200611
i386                 randconfig-a012-20200611
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
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

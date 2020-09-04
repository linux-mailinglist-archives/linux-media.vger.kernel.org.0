Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C484C25E087
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 19:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgIDRHu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 13:07:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:3671 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbgIDRHu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 13:07:50 -0400
IronPort-SDR: UbTJfPTO4xg89Jil1E8d/2NgmyHcLFA4sf9Wd1mxPRNUnmb7fovBBNZImGFtJXEdBGM6cddtEA
 OERykfCbhEFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="145488692"
X-IronPort-AV: E=Sophos;i="5.76,390,1592895600"; 
   d="scan'208";a="145488692"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2020 10:07:48 -0700
IronPort-SDR: DF2npWWCqYoFRJ8RiC26nnfUoRUc3dPWmvLBP65PpOqfCcgBZN6MOxohC+3WvlG861zkUtvfle
 qRhKXgkiJmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,390,1592895600"; 
   d="scan'208";a="502997740"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Sep 2020 10:07:47 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEFBi-00006v-BR; Fri, 04 Sep 2020 17:07:46 +0000
Date:   Sat, 05 Sep 2020 01:07:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-tree] BUILD SUCCESS WITH WARNING
 75992a4418b6c51d4da9c99aac7d92ab29148196
Message-ID: <5f527438.MkZIKgdUH3+yJvIh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux  media-tree
branch HEAD: 75992a4418b6c51d4da9c99aac7d92ab29148196  media: rc: rename ir_lirc_* functions to lirc_*

Warning in current branch:

drivers/media/rc/lirc_dev.c:110 lirc_raw_event() error: double unlocked 'dev->lirc_fh_lock' (orig line 87)

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- i386-randconfig-m021-20200904
    `-- drivers-media-rc-lirc_dev.c-lirc_raw_event()-error:double-unlocked-dev-lirc_fh_lock-(orig-line-)

elapsed time: 1601m

configs tested: 133
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5275evb_defconfig
sh                            hp6xx_defconfig
powerpc                     skiroot_defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
mips                            ar7_defconfig
arm                         lpc32xx_defconfig
powerpc                        cell_defconfig
mips                        workpad_defconfig
xtensa                generic_kc705_defconfig
openrisc                         alldefconfig
powerpc                      ep88xc_defconfig
arm                           viper_defconfig
um                            kunit_defconfig
sh                        edosk7760_defconfig
m68k                          amiga_defconfig
arm                   milbeaut_m10v_defconfig
m68k                       m5249evb_defconfig
x86_64                           alldefconfig
mips                   sb1250_swarm_defconfig
arm                          moxart_defconfig
arm                            lart_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
arm                             mxs_defconfig
sh                   sh7770_generic_defconfig
mips                      loongson3_defconfig
sh                ecovec24-romimage_defconfig
arm                              zx_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a004-20200902
i386                 randconfig-a005-20200902
i386                 randconfig-a006-20200902
i386                 randconfig-a002-20200902
i386                 randconfig-a001-20200902
i386                 randconfig-a003-20200902
i386                 randconfig-a004-20200904
i386                 randconfig-a005-20200904
i386                 randconfig-a006-20200904
i386                 randconfig-a002-20200904
i386                 randconfig-a003-20200904
i386                 randconfig-a001-20200904
x86_64               randconfig-a013-20200904
x86_64               randconfig-a011-20200904
x86_64               randconfig-a016-20200904
x86_64               randconfig-a012-20200904
x86_64               randconfig-a015-20200904
x86_64               randconfig-a014-20200904
x86_64               randconfig-a013-20200902
x86_64               randconfig-a016-20200902
x86_64               randconfig-a011-20200902
x86_64               randconfig-a012-20200902
x86_64               randconfig-a015-20200902
x86_64               randconfig-a014-20200902
i386                 randconfig-a016-20200903
i386                 randconfig-a015-20200903
i386                 randconfig-a011-20200903
i386                 randconfig-a013-20200903
i386                 randconfig-a014-20200903
i386                 randconfig-a012-20200903
i386                 randconfig-a016-20200904
i386                 randconfig-a015-20200904
i386                 randconfig-a011-20200904
i386                 randconfig-a013-20200904
i386                 randconfig-a014-20200904
i386                 randconfig-a012-20200904
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200904
x86_64               randconfig-a004-20200904
x86_64               randconfig-a003-20200904
x86_64               randconfig-a005-20200904
x86_64               randconfig-a001-20200904
x86_64               randconfig-a002-20200904
x86_64               randconfig-a013-20200903
x86_64               randconfig-a016-20200903
x86_64               randconfig-a011-20200903
x86_64               randconfig-a012-20200903
x86_64               randconfig-a015-20200903
x86_64               randconfig-a014-20200903
x86_64               randconfig-a004-20200902
x86_64               randconfig-a006-20200902
x86_64               randconfig-a003-20200902
x86_64               randconfig-a005-20200902
x86_64               randconfig-a001-20200902
x86_64               randconfig-a002-20200902

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

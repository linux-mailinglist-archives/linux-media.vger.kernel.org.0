Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C111D70A684
	for <lists+linux-media@lfdr.de>; Sat, 20 May 2023 10:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjETIyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 May 2023 04:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjETIym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 May 2023 04:54:42 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B70186
        for <linux-media@vger.kernel.org>; Sat, 20 May 2023 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684572881; x=1716108881;
  h=date:from:to:cc:subject:message-id;
  bh=Ac6z13TQxAyYWR+i4zunFpJ5Gi44hCf+FqI5E+4HwFo=;
  b=eMvjvhr/3WbLj/Nbt3MDbawsN50akN0K/+CNXbxZJadC8SttdFXxF3zy
   MZ50MBzQNMTki4acd3K+K5H2lYW3wfkmhJV5RMhZkCmVDrKzSVu8mTzf9
   ukj7fP9V07+HHAA3ZclGxn9CMG9ttU9SOiu4rghHpIaGvsExG99p2AQA1
   Kn8yrkreo5kQBLewlo5DtHYo+wPTBPdy4sfRTO2IrKKnd+g8xvvyt1/aE
   2XwYpVzXQeHuRHZb5xj8Dpa8+6yxy76uYfXF/7YZsqQlN+QO6IWB+y2Gr
   tMVOLGSD5ZA3FwG72hzftaa7rCzjbRqGgNbCZQcZQ116DK/q7BK9LBpQG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="416030154"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; 
   d="scan'208";a="416030154"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2023 01:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="735784542"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; 
   d="scan'208";a="735784542"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 May 2023 01:54:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q0IMI-000BQU-2c;
        Sat, 20 May 2023 08:54:38 +0000
Date:   Sat, 20 May 2023 16:53:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi] BUILD SUCCESS
 3e688b0ac7261224f5056959913b95c0679de029
Message-ID: <20230520085340.lhZFb%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: INFO setup_repo_specs: /db/releases/20230519164737/lkp-src/repo/*/sailus-media-tree
git://linuxtv.org/sailus/media_tree.git async-multi
branch HEAD: 3e688b0ac7261224f5056959913b95c0679de029  print link creation

elapsed time: 879m

configs tested: 212
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230517   gcc  
alpha                randconfig-r023-20230519   gcc  
alpha                randconfig-r024-20230517   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                  randconfig-r004-20230517   gcc  
arc                  randconfig-r016-20230517   gcc  
arc                  randconfig-r043-20230517   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                  randconfig-r012-20230517   clang
arm                  randconfig-r026-20230517   clang
arm                  randconfig-r034-20230517   gcc  
arm                  randconfig-r036-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                        spear3xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230517   clang
arm64                randconfig-r014-20230517   gcc  
arm64                randconfig-r015-20230517   gcc  
csky         buildonly-randconfig-r005-20230517   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r005-20230517   clang
hexagon              randconfig-r035-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                         bigsur_defconfig   gcc  
ia64         buildonly-randconfig-r003-20230517   gcc  
ia64         buildonly-randconfig-r004-20230517   gcc  
ia64         buildonly-randconfig-r005-20230517   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r025-20230519   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230519   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230517   gcc  
loongarch            randconfig-r011-20230517   gcc  
loongarch            randconfig-r026-20230519   gcc  
loongarch            randconfig-r033-20230517   gcc  
loongarch            randconfig-r035-20230517   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230517   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r014-20230517   gcc  
m68k                 randconfig-r021-20230517   gcc  
m68k                 randconfig-r022-20230519   gcc  
m68k                 randconfig-r023-20230517   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r001-20230517   gcc  
microblaze           randconfig-r003-20230517   gcc  
microblaze           randconfig-r012-20230517   gcc  
microblaze           randconfig-r031-20230517   gcc  
microblaze           randconfig-r033-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips         buildonly-randconfig-r003-20230517   gcc  
mips                     cu1000-neo_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                       rbtx49xx_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230517   gcc  
nios2                randconfig-r013-20230517   gcc  
nios2                randconfig-r021-20230519   gcc  
nios2                randconfig-r023-20230517   gcc  
nios2                randconfig-r024-20230517   gcc  
openrisc     buildonly-randconfig-r004-20230517   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r011-20230517   gcc  
openrisc             randconfig-r026-20230517   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230517   gcc  
parisc               randconfig-r024-20230519   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc               randconfig-r032-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc      buildonly-randconfig-r002-20230519   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230519   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230517   clang
riscv                randconfig-r002-20230517   clang
riscv                randconfig-r003-20230517   clang
riscv                randconfig-r005-20230517   clang
riscv                randconfig-r023-20230517   gcc  
riscv                randconfig-r032-20230517   clang
riscv                randconfig-r042-20230517   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230517   clang
s390                 randconfig-r031-20230517   clang
s390                 randconfig-r044-20230517   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230519   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh           buildonly-randconfig-r006-20230517   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r002-20230517   gcc  
sh                   randconfig-r015-20230517   gcc  
sh                   randconfig-r021-20230517   gcc  
sh                   randconfig-r022-20230517   gcc  
sh                   randconfig-r025-20230517   gcc  
sh                   randconfig-r034-20230517   gcc  
sh                          rsk7264_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230517   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230517   gcc  
sparc                randconfig-r022-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r031-20230517   gcc  
sparc64      buildonly-randconfig-r001-20230517   gcc  
sparc64              randconfig-r012-20230517   gcc  
sparc64              randconfig-r015-20230517   gcc  
sparc64              randconfig-r016-20230517   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                        randconfig-x051   gcc  
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x053   gcc  
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x055   gcc  
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa       buildonly-randconfig-r002-20230517   gcc  
xtensa       buildonly-randconfig-r006-20230519   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230517   gcc  
xtensa               randconfig-r006-20230517   gcc  
xtensa               randconfig-r021-20230517   gcc  
xtensa               randconfig-r035-20230517   gcc  
xtensa                         virt_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

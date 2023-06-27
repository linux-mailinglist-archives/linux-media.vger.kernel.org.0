Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0321873F02E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 03:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjF0BNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 21:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbjF0BNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 21:13:39 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795D4173E
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 18:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828418; x=1719364418;
  h=date:from:to:cc:subject:message-id;
  bh=vlHQH6B7zFghFU2emTrIj9bqh/CRmBBrMYK99nD1udw=;
  b=OfEJ6jqSPQD4sMymnYWK7ww00093eAJiB4EWHKURgCt8/wIHdB5qnOed
   mBys8AsJ351iotDith8n/ZIMw/HKb7ja5icIvfhUN5180mCwtV9aKwrAG
   atu41nX95FvG2HPHmw842922JWu+Ph8P+lAgIcWvVdWZaS1hYkmaz6f+s
   OgrpSaOSlSejXDOzs2snVHUPi4122DGk8EfUTKK56uhIgYIRVAT6mXw23
   sfrsZZQwLY0ZPn5NnpeFk7U/Sz0vJMAZ7Coh+6JHc9X8yNn4HmUk+gRRc
   /VXsjNpRGpFv+MD7HM9AxWUtiipWvf3BqJCACyWefSbmd19Zsv+KrslTb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="447821285"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="447821285"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693668587"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="693668587"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 18:13:36 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxGx-000BE8-2a;
        Tue, 27 Jun 2023 01:13:35 +0000
Date:   Tue, 27 Jun 2023 09:12:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD REGRESSION
 e03cd35afd1787dc8daadbd61ad47da455bc76eb
Message-ID: <202306270940.etg9biNA-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: e03cd35afd1787dc8daadbd61ad47da455bc76eb  add IVSC support for IPU bridge driver

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306231315.r0N0wLfe-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/v4l2-core/v4l2-subdev.c:179:8: error: call to undeclared function 'v4l2_subdev_state_get_stream_format'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
drivers/media/v4l2-core/v4l2-subdev.c:502:41: warning: pointer/integer type mismatch in conditional expression ('struct v4l2_subdev_state *' and 'int') [-Wconditional-type-mismatch]
drivers/media/v4l2-core/v4l2-subdev.c:504:9: error: call to undeclared function 'v4l2_subdev_get_unlocked_active_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
drivers/media/v4l2-core/v4l2-subdev.c:55:10: error: call to undeclared function '__v4l2_subdev_state_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
drivers/media/v4l2-core/v4l2-subdev.c:55:8: error: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_state *' from 'int' [-Wint-conversion]
drivers/media/v4l2-core/v4l2-subdev.c:66:2: error: call to undeclared function '__v4l2_subdev_state_free'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
drivers/media/v4l2-core/v4l2-subdev.c:91:32: error: no member named 'entity' in 'struct v4l2_subdev'
drivers/media/v4l2-core/v4l2-subdev.c:979:4: error: call to undeclared function 'v4l2_subdev_lock_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
drivers/media/v4l2-core/v4l2-subdev.c:984:4: error: call to undeclared function 'v4l2_subdev_unlock_state'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
include/media/v4l2-subdev.h:1159:25: error: no member named 'entity' in 'struct v4l2_subdev'

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- i386-randconfig-i014-20230623
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-__v4l2_subdev_state_alloc-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-__v4l2_subdev_state_free-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-v4l2_subdev_get_unlocked_active_state-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-v4l2_subdev_lock_state-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-v4l2_subdev_state_get_stream_format-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-de
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:call-to-undeclared-function-v4l2_subdev_unlock_state-ISO-C99-and-later-do-not-support-implicit-function-declarations-Werror-Wimplicit-function-declaration
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:incompatible-integer-to-pointer-conversion-assigning-to-struct-v4l2_subdev_state-from-int
    |-- drivers-media-v4l2-core-v4l2-subdev.c:error:no-member-named-entity-in-struct-v4l2_subdev
    |-- drivers-media-v4l2-core-v4l2-subdev.c:warning:pointer-integer-type-mismatch-in-conditional-expression-(-struct-v4l2_subdev_state-and-int-)
    `-- include-media-v4l2-subdev.h:error:no-member-named-entity-in-struct-v4l2_subdev

elapsed time: 8828m

configs tested: 234
configs skipped: 14

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230621   gcc  
alpha                randconfig-r026-20230622   gcc  
alpha                randconfig-r032-20230620   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r003-20230621   gcc  
arc                  randconfig-r024-20230622   gcc  
arc                  randconfig-r043-20230620   gcc  
arc                  randconfig-r043-20230622   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                        neponset_defconfig   clang
arm                       netwinder_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r014-20230620   clang
arm                  randconfig-r016-20230620   clang
arm                  randconfig-r022-20230622   clang
arm                  randconfig-r025-20230622   clang
arm                  randconfig-r046-20230620   clang
arm                         s5pv210_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm                           spitz_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230621   gcc  
csky                 randconfig-r012-20230621   gcc  
hexagon              randconfig-r003-20230622   clang
hexagon              randconfig-r023-20230622   clang
hexagon              randconfig-r026-20230620   clang
hexagon              randconfig-r041-20230620   clang
hexagon              randconfig-r045-20230620   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230620   clang
i386         buildonly-randconfig-r004-20230622   clang
i386         buildonly-randconfig-r005-20230620   clang
i386         buildonly-randconfig-r005-20230622   clang
i386         buildonly-randconfig-r006-20230620   clang
i386         buildonly-randconfig-r006-20230622   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230620   clang
i386                 randconfig-i001-20230622   clang
i386                 randconfig-i002-20230620   clang
i386                 randconfig-i002-20230622   clang
i386                 randconfig-i003-20230620   clang
i386                 randconfig-i003-20230622   clang
i386                 randconfig-i004-20230620   clang
i386                 randconfig-i004-20230622   clang
i386                 randconfig-i005-20230620   clang
i386                 randconfig-i005-20230622   clang
i386                 randconfig-i006-20230620   clang
i386                 randconfig-i006-20230622   clang
i386                 randconfig-i011-20230620   gcc  
i386                 randconfig-i011-20230622   gcc  
i386                 randconfig-i011-20230623   clang
i386                 randconfig-i012-20230620   gcc  
i386                 randconfig-i012-20230622   gcc  
i386                 randconfig-i012-20230623   clang
i386                 randconfig-i013-20230620   gcc  
i386                 randconfig-i013-20230622   gcc  
i386                 randconfig-i013-20230623   clang
i386                 randconfig-i014-20230620   gcc  
i386                 randconfig-i014-20230622   gcc  
i386                 randconfig-i014-20230623   clang
i386                 randconfig-i015-20230620   gcc  
i386                 randconfig-i015-20230622   gcc  
i386                 randconfig-i015-20230623   clang
i386                 randconfig-i016-20230620   gcc  
i386                 randconfig-i016-20230622   gcc  
i386                 randconfig-i016-20230623   clang
i386                 randconfig-r026-20230622   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230622   gcc  
loongarch            randconfig-r013-20230620   gcc  
loongarch            randconfig-r015-20230620   gcc  
loongarch            randconfig-r021-20230622   gcc  
loongarch            randconfig-r024-20230622   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r013-20230621   gcc  
m68k                 randconfig-r022-20230620   gcc  
microblaze           randconfig-r002-20230620   gcc  
microblaze           randconfig-r006-20230622   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                     loongson2k_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                 randconfig-r004-20230620   gcc  
mips                 randconfig-r024-20230620   clang
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230622   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r003-20230622   gcc  
parisc               randconfig-r023-20230622   gcc  
parisc               randconfig-r025-20230620   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r001-20230620   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230620   clang
riscv                randconfig-r012-20230620   gcc  
riscv                randconfig-r013-20230622   gcc  
riscv                randconfig-r031-20230620   clang
riscv                randconfig-r042-20230620   gcc  
riscv                randconfig-r042-20230622   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230622   clang
s390                 randconfig-r011-20230622   gcc  
s390                 randconfig-r025-20230622   gcc  
s390                 randconfig-r033-20230620   clang
s390                 randconfig-r044-20230620   gcc  
s390                 randconfig-r044-20230622   gcc  
sh                               allmodconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r021-20230620   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230622   gcc  
sparc64              randconfig-r035-20230620   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230622   gcc  
um                   randconfig-r003-20230620   gcc  
um                   randconfig-r015-20230621   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230620   clang
x86_64       buildonly-randconfig-r001-20230622   clang
x86_64       buildonly-randconfig-r002-20230620   clang
x86_64       buildonly-randconfig-r002-20230622   clang
x86_64       buildonly-randconfig-r003-20230620   clang
x86_64       buildonly-randconfig-r003-20230622   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r022-20230622   gcc  
x86_64               randconfig-r023-20230620   gcc  
x86_64               randconfig-r025-20230622   gcc  
x86_64               randconfig-r034-20230620   clang
x86_64               randconfig-r036-20230620   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r006-20230620   gcc  
xtensa               randconfig-r035-20230621   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

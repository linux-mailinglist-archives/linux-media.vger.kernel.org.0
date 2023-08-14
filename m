Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17BB77C41E
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 01:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjHNX7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 19:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbjHNX66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 19:58:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C664124
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 16:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692057537; x=1723593537;
  h=date:from:to:cc:subject:message-id;
  bh=Wbk0N9M57rp1xQZtcYO/ITdp4A2fgmBZMqxVqMRfwIc=;
  b=HWG+EhES/QnbV3304ddaOoBhxjU0A7I+c81tZc26bPRIcHoCoecWrhwP
   crYyG4V/JGUFLmAxjzmE1WNKqdHvEnQ2vPvhfqoI49dXibZe3kBQGkBgs
   XMY/1Nrz8BMJYjx393e95/9J7m9oLmud90q5alVsWVRuKengiKZAcEZfh
   fUtHYIl3t0tZ2h/2dXs0+gEmQo5dfkR2kTKqRrfyfOxFxmdFnlAu/eQ9w
   1GDdCUTxycPqG0vHO9vRCd0YL2eVDh6qmOCyVQjdNVmy3ydUPpBlK30P4
   2duJFmsN+NHq4u/27ASyboXCPOgQDXKOSFvqryFTglYAkBxJoh7pSXQDs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351754190"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="351754190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 16:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710518348"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="710518348"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 16:58:55 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVhSQ-0000Vz-2x;
        Mon, 14 Aug 2023 23:58:53 +0000
Date:   Tue, 15 Aug 2023 07:58:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 fa36a847388c96d680f3964a2a7c0abfff317d9f
Message-ID: <202308150700.zyaPht5h-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: fa36a847388c96d680f3964a2a7c0abfff317d9f  media: staging: ipu3-imgu: Initialise height_per_slice in the stripes

elapsed time: 720m

configs tested: 299
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230814   gcc  
alpha                randconfig-r004-20230814   gcc  
alpha                randconfig-r012-20230815   gcc  
alpha                randconfig-r013-20230815   gcc  
alpha                randconfig-r021-20230814   gcc  
alpha                randconfig-r024-20230815   gcc  
alpha                randconfig-r031-20230815   gcc  
alpha                randconfig-r033-20230815   gcc  
alpha                randconfig-r034-20230815   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230815   gcc  
arc                  randconfig-r002-20230815   gcc  
arc                  randconfig-r003-20230815   gcc  
arc                  randconfig-r013-20230814   gcc  
arc                  randconfig-r013-20230815   gcc  
arc                  randconfig-r014-20230814   gcc  
arc                  randconfig-r022-20230814   gcc  
arc                  randconfig-r023-20230815   gcc  
arc                  randconfig-r043-20230814   gcc  
arc                  randconfig-r043-20230815   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                  randconfig-r002-20230814   clang
arm                  randconfig-r003-20230814   clang
arm                  randconfig-r004-20230814   clang
arm                  randconfig-r006-20230815   gcc  
arm                  randconfig-r024-20230815   clang
arm                  randconfig-r025-20230815   clang
arm                  randconfig-r026-20230814   gcc  
arm                  randconfig-r032-20230814   clang
arm                  randconfig-r034-20230815   gcc  
arm                  randconfig-r046-20230814   gcc  
arm                  randconfig-r046-20230815   clang
arm                        shmobile_defconfig   gcc  
arm                        spear3xx_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230814   gcc  
arm64                randconfig-r012-20230815   gcc  
arm64                randconfig-r014-20230814   clang
arm64                randconfig-r021-20230815   gcc  
arm64                randconfig-r022-20230815   gcc  
arm64                randconfig-r025-20230815   gcc  
arm64                randconfig-r026-20230815   gcc  
arm64                randconfig-r031-20230814   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230814   gcc  
csky                 randconfig-r013-20230815   gcc  
csky                 randconfig-r014-20230815   gcc  
csky                 randconfig-r015-20230815   gcc  
csky                 randconfig-r016-20230815   gcc  
csky                 randconfig-r031-20230815   gcc  
csky                 randconfig-r035-20230814   gcc  
hexagon              randconfig-r003-20230814   clang
hexagon              randconfig-r026-20230815   clang
hexagon              randconfig-r041-20230814   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230814   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230814   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230814   gcc  
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230814   gcc  
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230814   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230814   gcc  
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230814   gcc  
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230814   gcc  
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230814   gcc  
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230814   gcc  
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230814   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230814   clang
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230814   clang
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230814   clang
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230814   clang
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230814   clang
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r004-20230815   clang
i386                 randconfig-r005-20230814   gcc  
i386                 randconfig-r005-20230815   clang
i386                 randconfig-r016-20230815   gcc  
i386                 randconfig-r035-20230814   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230815   gcc  
loongarch            randconfig-r006-20230814   gcc  
loongarch            randconfig-r013-20230815   gcc  
loongarch            randconfig-r021-20230814   gcc  
loongarch            randconfig-r022-20230814   gcc  
loongarch            randconfig-r024-20230814   gcc  
loongarch            randconfig-r035-20230815   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r006-20230815   gcc  
m68k                 randconfig-r014-20230815   gcc  
m68k                 randconfig-r021-20230815   gcc  
m68k                 randconfig-r024-20230815   gcc  
m68k                 randconfig-r025-20230814   gcc  
m68k                 randconfig-r035-20230815   gcc  
m68k                 randconfig-r036-20230814   gcc  
microblaze           randconfig-r004-20230814   gcc  
microblaze           randconfig-r005-20230814   gcc  
microblaze           randconfig-r011-20230815   gcc  
microblaze           randconfig-r012-20230815   gcc  
microblaze           randconfig-r015-20230815   gcc  
microblaze           randconfig-r022-20230815   gcc  
microblaze           randconfig-r024-20230814   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
mips                 randconfig-r002-20230815   gcc  
mips                 randconfig-r035-20230814   clang
mips                          rb532_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230814   gcc  
nios2                randconfig-r003-20230814   gcc  
nios2                randconfig-r004-20230815   gcc  
nios2                randconfig-r005-20230815   gcc  
nios2                randconfig-r011-20230814   gcc  
nios2                randconfig-r011-20230815   gcc  
nios2                randconfig-r015-20230815   gcc  
nios2                randconfig-r026-20230814   gcc  
openrisc             randconfig-r001-20230815   gcc  
openrisc             randconfig-r006-20230815   gcc  
openrisc             randconfig-r016-20230814   gcc  
openrisc             randconfig-r026-20230815   gcc  
openrisc             randconfig-r032-20230814   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r013-20230814   gcc  
parisc               randconfig-r016-20230814   gcc  
parisc               randconfig-r023-20230815   gcc  
parisc               randconfig-r032-20230815   gcc  
parisc               randconfig-r036-20230814   gcc  
parisc               randconfig-r036-20230815   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r011-20230815   gcc  
powerpc              randconfig-r016-20230814   clang
powerpc              randconfig-r023-20230815   gcc  
powerpc              randconfig-r034-20230814   gcc  
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r031-20230814   gcc  
riscv                randconfig-r042-20230814   clang
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230814   clang
s390                 randconfig-r022-20230815   gcc  
s390                 randconfig-r023-20230814   clang
s390                 randconfig-r025-20230814   clang
s390                 randconfig-r034-20230814   gcc  
s390                 randconfig-r044-20230814   clang
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r002-20230815   gcc  
sh                   randconfig-r005-20230815   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230815   gcc  
sparc                randconfig-r006-20230814   gcc  
sparc                randconfig-r015-20230814   gcc  
sparc                randconfig-r024-20230815   gcc  
sparc                randconfig-r031-20230815   gcc  
sparc                randconfig-r033-20230815   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r002-20230814   gcc  
sparc64              randconfig-r002-20230815   gcc  
sparc64              randconfig-r003-20230815   gcc  
sparc64              randconfig-r004-20230815   gcc  
sparc64              randconfig-r005-20230815   gcc  
sparc64              randconfig-r012-20230815   gcc  
sparc64              randconfig-r023-20230814   gcc  
sparc64              randconfig-r024-20230815   gcc  
sparc64              randconfig-r033-20230814   gcc  
sparc64              randconfig-r036-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230815   gcc  
um                   randconfig-r005-20230815   gcc  
um                   randconfig-r006-20230814   clang
um                   randconfig-r013-20230814   gcc  
um                   randconfig-r023-20230814   gcc  
um                   randconfig-r024-20230814   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230814   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230814   gcc  
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230814   gcc  
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r012-20230814   clang
x86_64               randconfig-r015-20230814   clang
x86_64               randconfig-r015-20230815   gcc  
x86_64               randconfig-r021-20230815   gcc  
x86_64               randconfig-r025-20230815   gcc  
x86_64               randconfig-x001-20230814   clang
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230814   clang
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230814   clang
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230814   clang
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230814   clang
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230814   clang
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230814   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230814   gcc  
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230814   gcc  
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230814   gcc  
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230814   gcc  
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230814   gcc  
x86_64               randconfig-x016-20230815   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r003-20230815   gcc  
xtensa               randconfig-r005-20230814   gcc  
xtensa               randconfig-r015-20230815   gcc  
xtensa               randconfig-r022-20230815   gcc  
xtensa               randconfig-r033-20230814   gcc  
xtensa               randconfig-r033-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

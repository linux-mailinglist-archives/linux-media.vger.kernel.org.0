Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7565C754598
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 02:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjGOAJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 20:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjGOAJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 20:09:49 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDF13A95
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689379788; x=1720915788;
  h=date:from:to:cc:subject:message-id;
  bh=BiXwDCxwnpdJtkbWGS4T8XtJoctLwBwsQV45c+ORklY=;
  b=k2N4zMX4HA2qahpnPCRxP9AIDsMT1fenNuIovzwgHPBVoeGJ17FdLcCj
   K4KgNAfmejrKQsP1ytnREun1BrIksWRHVa3VL4ipquMHUgLnPdA5BLnUj
   /KxzTY+z+BSUJrrD/AeQBulBZLF4uekyu0vSVPVzr9a4q46GAZpv3EQCg
   zSTbgOoqNfg9ONAtYlV3PzX7EAc1j2zW7jP1x3nAJboU4gixyZ3Hd1aUD
   XJy8v9qhXVbJIGuoXhtWxy4cIXZTLw2nmDA9kQVCLglUEBkB57mKbSC8x
   vagM3Rxs+9yEpkQEIeH5dR/09shXZ+t6vinZQ/gt+crih9tiqPhSbHbND
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="369158204"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="369158204"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 17:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="725886023"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="725886023"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 17:09:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qKSr4-0007mF-07;
        Sat, 15 Jul 2023 00:09:46 +0000
Date:   Sat, 15 Jul 2023 08:09:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 d7b13edd4cb4bfa335b6008ab867ac28582d3e5c
Message-ID: <202307150821.44sZi2Mx-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: d7b13edd4cb4bfa335b6008ab867ac28582d3e5c  media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()

elapsed time: 726m

configs tested: 155
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r031-20230714   gcc  
alpha                randconfig-r032-20230714   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r022-20230714   gcc  
arc                  randconfig-r043-20230714   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r004-20230714   clang
arm                  randconfig-r046-20230714   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r013-20230714   gcc  
hexagon                             defconfig   clang
hexagon              randconfig-r004-20230714   clang
hexagon              randconfig-r012-20230714   clang
hexagon              randconfig-r016-20230714   clang
hexagon              randconfig-r033-20230714   clang
hexagon              randconfig-r035-20230714   clang
hexagon              randconfig-r036-20230714   clang
hexagon              randconfig-r041-20230714   clang
hexagon              randconfig-r045-20230714   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230714   gcc  
i386         buildonly-randconfig-r005-20230714   gcc  
i386         buildonly-randconfig-r006-20230714   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230714   gcc  
i386                 randconfig-i002-20230714   gcc  
i386                 randconfig-i003-20230714   gcc  
i386                 randconfig-i004-20230714   gcc  
i386                 randconfig-i005-20230714   gcc  
i386                 randconfig-i006-20230714   gcc  
i386                 randconfig-i011-20230714   clang
i386                 randconfig-i012-20230714   clang
i386                 randconfig-i013-20230714   clang
i386                 randconfig-i014-20230714   clang
i386                 randconfig-i015-20230714   clang
i386                 randconfig-i016-20230714   clang
i386                 randconfig-r031-20230714   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230714   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze           randconfig-r022-20230714   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                 randconfig-r033-20230714   clang
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230714   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r006-20230714   gcc  
openrisc             randconfig-r014-20230714   gcc  
openrisc             randconfig-r025-20230714   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230714   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc              randconfig-r001-20230714   gcc  
powerpc              randconfig-r006-20230714   gcc  
powerpc              randconfig-r011-20230714   clang
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230714   clang
riscv                randconfig-r026-20230714   clang
riscv                randconfig-r042-20230714   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230714   gcc  
s390                 randconfig-r012-20230714   clang
s390                 randconfig-r023-20230714   clang
s390                 randconfig-r034-20230714   gcc  
s390                 randconfig-r044-20230714   clang
sh                               allmodconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r001-20230714   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r002-20230714   gcc  
sparc64              randconfig-r021-20230714   gcc  
sparc64              randconfig-r024-20230714   gcc  
sparc64              randconfig-r025-20230714   gcc  
sparc64              randconfig-r035-20230714   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r002-20230714   clang
um                   randconfig-r005-20230714   clang
um                   randconfig-r032-20230714   clang
um                   randconfig-r036-20230714   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230714   gcc  
x86_64       buildonly-randconfig-r002-20230714   gcc  
x86_64       buildonly-randconfig-r003-20230714   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230714   clang
x86_64               randconfig-x002-20230714   clang
x86_64               randconfig-x003-20230714   clang
x86_64               randconfig-x004-20230714   clang
x86_64               randconfig-x005-20230714   clang
x86_64               randconfig-x006-20230714   clang
x86_64               randconfig-x011-20230714   gcc  
x86_64               randconfig-x012-20230714   gcc  
x86_64               randconfig-x013-20230714   gcc  
x86_64               randconfig-x014-20230714   gcc  
x86_64               randconfig-x015-20230714   gcc  
x86_64               randconfig-x016-20230714   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa               randconfig-r005-20230714   gcc  
xtensa               randconfig-r015-20230714   gcc  
xtensa               randconfig-r021-20230714   gcc  
xtensa               randconfig-r034-20230714   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F607BEB4D
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 22:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378554AbjJIUJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 16:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378556AbjJIUJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 16:09:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E609E94
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696882188; x=1728418188;
  h=date:from:to:cc:subject:message-id;
  bh=CR+y5GuJjL8Swzs7q+dWAYlpGgV1WQjHiTaKcQh5680=;
  b=X+zTWDHtdQ4JdWK8DLEI/auWyVZ4YS4RaT4Oab8AB1IXwJemO6ZUxAL8
   bAGYV+gBXasn3iI+Wwn9iUp6tKGWofbVzkbo/UDkfLxfxjyEmrJAD8Mnb
   +yMwS9svUcYfHQF21hFr3UuwuGE9IbNlvFmusk+D9LrUfN6c5R7YSdsal
   J22Qp4eaOwauyU5tLHkKvPJBka7nPPptTok1yBZdMaplWBpAGqASccRzK
   tY2i0LaMTR89QkMIGhJrWWEpbbPxZqkYv13nivyWbsxbMzm/S49MxjAyQ
   OmPoWvKuwjT/zrmRtFzLRtqGh1y71aBny8q/IDQROTdfmPaxWuqYefc5A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448431838"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448431838"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 13:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="896897740"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="896897740"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Oct 2023 13:07:59 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qpwZO-0000co-0N;
        Mon, 09 Oct 2023 20:09:38 +0000
Date:   Tue, 10 Oct 2023 04:09:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-fix] BUILD REGRESSION
 56ea581e40d9aa9ffe425f4faa4b00ce389b9053
Message-ID: <202310100424.kHQWpWFg-lkp@intel.com>
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

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-fix
branch HEAD: 56ea581e40d9aa9ffe425f4faa4b00ce389b9053  media: ccs: Rework initialising sub-device state

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310100428.9YKB4IiP-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c:269:67: error: too few arguments to function call, expected 4, have 3
drivers/media/platform/renesas/vsp1/vsp1_entity.c:683:35: error: too few arguments to function call, expected 4, have 3
drivers/media/platform/st/stm32/stm32-dcmi.c:998:8: error: too few arguments to function call, expected 4, have 3
drivers/staging/media/tegra-video/vi.c:453:15: error: too few arguments to function call, expected 4, have 3

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- powerpc-allmodconfig
    |-- drivers-media-platform-renesas-rcar-vin-rcar-v4l2.c:error:too-few-arguments-to-function-call-expected-have
    |-- drivers-media-platform-renesas-vsp1-vsp1_entity.c:error:too-few-arguments-to-function-call-expected-have
    |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:too-few-arguments-to-function-call-expected-have
    `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have

elapsed time: 720m

configs tested: 146
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231009   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                   randconfig-001-20231009   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231009   gcc  
i386         buildonly-randconfig-002-20231009   gcc  
i386         buildonly-randconfig-003-20231009   gcc  
i386         buildonly-randconfig-004-20231009   gcc  
i386         buildonly-randconfig-005-20231009   gcc  
i386         buildonly-randconfig-006-20231009   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231009   gcc  
i386                  randconfig-002-20231009   gcc  
i386                  randconfig-003-20231009   gcc  
i386                  randconfig-004-20231009   gcc  
i386                  randconfig-005-20231009   gcc  
i386                  randconfig-006-20231009   gcc  
i386                  randconfig-011-20231009   gcc  
i386                  randconfig-012-20231009   gcc  
i386                  randconfig-013-20231009   gcc  
i386                  randconfig-014-20231009   gcc  
i386                  randconfig-015-20231009   gcc  
i386                  randconfig-016-20231009   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231009   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                       lemote2f_defconfig   clang
mips                     loongson2k_defconfig   clang
mips                          rm200_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231009   gcc  
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231009   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231009   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231009   gcc  
x86_64       buildonly-randconfig-002-20231009   gcc  
x86_64       buildonly-randconfig-003-20231009   gcc  
x86_64       buildonly-randconfig-004-20231009   gcc  
x86_64       buildonly-randconfig-005-20231009   gcc  
x86_64       buildonly-randconfig-006-20231009   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231009   gcc  
x86_64                randconfig-002-20231009   gcc  
x86_64                randconfig-003-20231009   gcc  
x86_64                randconfig-004-20231009   gcc  
x86_64                randconfig-005-20231009   gcc  
x86_64                randconfig-006-20231009   gcc  
x86_64                randconfig-011-20231009   gcc  
x86_64                randconfig-012-20231009   gcc  
x86_64                randconfig-013-20231009   gcc  
x86_64                randconfig-014-20231009   gcc  
x86_64                randconfig-015-20231009   gcc  
x86_64                randconfig-016-20231009   gcc  
x86_64                randconfig-071-20231009   gcc  
x86_64                randconfig-072-20231009   gcc  
x86_64                randconfig-073-20231009   gcc  
x86_64                randconfig-074-20231009   gcc  
x86_64                randconfig-075-20231009   gcc  
x86_64                randconfig-076-20231009   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

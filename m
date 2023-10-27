Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1297D936E
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345488AbjJ0JV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjJ0JVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:21:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E40187
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698398482; x=1729934482;
  h=date:from:to:cc:subject:message-id;
  bh=LU12vgbRx/a/3I3dtvg/i/82U2th0jQMURQlskhAdLQ=;
  b=IPJDj8LT2snOhJxcM9/796Cgj+LOXScADluWZ/DXAAxTv6DBB5ZjEGnX
   OUQQbQi4E/Zal0cdk/l0kzXI66Lrkcr4ebc4hIk+D0W9njz+gsjDjqRVY
   xVGpES8XCNDf/N7r8bZ6LnEBs/TAgLu5KaDs1o/UimiNMbpvqwRGihX9g
   9aClTZgFBdPUdlp7HE76/ud91ioYklLIxGzF86Vubqo9piVTUncelE8gu
   ERevR7PAwLB6p6OE3E0aOvqpXLe7rocL4NgdVK0eR00ouhshfV3eB872i
   nadq0f+I8oRYTHZoCfJBf0TcNQ+6UEtPDXcdnGOQpAOSFjQMHm6tT1SKF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387555489"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="387555489"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="883136541"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="883136541"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Oct 2023 02:21:21 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qwJ1q-000Agl-2g;
        Fri, 27 Oct 2023 09:21:18 +0000
Date:   Fri, 27 Oct 2023 17:20:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 d184eb37d98e626fa267cf3229974d8d1b7bd364
Message-ID: <202310271716.snUpyg4W-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: d184eb37d98e626fa267cf3229974d8d1b7bd364  media: ccs: Remove which parameter from ccs_propagate

elapsed time: 3521m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231025   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231026   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231025   gcc  
i386         buildonly-randconfig-002-20231025   gcc  
i386         buildonly-randconfig-003-20231025   gcc  
i386         buildonly-randconfig-004-20231025   gcc  
i386         buildonly-randconfig-005-20231025   gcc  
i386         buildonly-randconfig-006-20231025   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231025   gcc  
i386                  randconfig-002-20231025   gcc  
i386                  randconfig-003-20231025   gcc  
i386                  randconfig-004-20231025   gcc  
i386                  randconfig-005-20231025   gcc  
i386                  randconfig-006-20231025   gcc  
i386                  randconfig-011-20231025   gcc  
i386                  randconfig-012-20231025   gcc  
i386                  randconfig-013-20231025   gcc  
i386                  randconfig-014-20231025   gcc  
i386                  randconfig-015-20231025   gcc  
i386                  randconfig-016-20231025   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231025   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231025   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231025   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231025   gcc  
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
x86_64       buildonly-randconfig-001-20231025   gcc  
x86_64       buildonly-randconfig-002-20231025   gcc  
x86_64       buildonly-randconfig-003-20231025   gcc  
x86_64       buildonly-randconfig-004-20231025   gcc  
x86_64       buildonly-randconfig-005-20231025   gcc  
x86_64       buildonly-randconfig-006-20231025   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231025   gcc  
x86_64                randconfig-002-20231025   gcc  
x86_64                randconfig-003-20231025   gcc  
x86_64                randconfig-004-20231025   gcc  
x86_64                randconfig-005-20231025   gcc  
x86_64                randconfig-006-20231025   gcc  
x86_64                randconfig-011-20231026   gcc  
x86_64                randconfig-012-20231026   gcc  
x86_64                randconfig-013-20231026   gcc  
x86_64                randconfig-014-20231026   gcc  
x86_64                randconfig-015-20231026   gcc  
x86_64                randconfig-016-20231026   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

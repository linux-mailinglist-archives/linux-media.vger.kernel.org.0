Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88477A52E4
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 21:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjIRTVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 15:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjIRTU7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 15:20:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A26410E
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695064853; x=1726600853;
  h=date:from:to:cc:subject:message-id;
  bh=xU959r3KFt0v89nTcex+L1/3LPSaHTDLzYilDTCcO2s=;
  b=UuYtWMgnkM6cD2bg093tcadMSWTNzVQnYL6JcEFwy5FFJAV5vRF/WaLl
   SOIKZX55NQwHsWd2yzTgQZYCR0KCYzN+EIAi+DtNFEEldjtdWhenZvsNz
   hlKf+txybg+HjteQbPG5ckW/1/ovZqL+4efa66lQS32ejPFzTP4oUZoSj
   LX8Zq5uAa4qsNWQdRl0F1s3bHx8HP0xHd2+y2uao2nrKyCUdmCNcb3SQA
   varidk5vBQMkl6h4COIhWVXECibRBuKDLExTU08UuvATYuUNVikwBDg8D
   xXXraXXUj1npJkWTMRZdwlg5ALyV/gCHjtlV/0NZ5v5I/ADIRBgYhY1CU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446210697"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="446210697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 12:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836146691"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="836146691"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2023 12:20:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qiJnc-0006Oa-2r;
        Mon, 18 Sep 2023 19:20:48 +0000
Date:   Tue, 19 Sep 2023 03:20:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 097304bdbff14705c22e429c2857d9d467b4825d
Message-ID: <202309190336.olhj7Ruz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 097304bdbff14705c22e429c2857d9d467b4825d  media: i2c: ov9734: Drop system suspend and resume handlers

elapsed time: 736m

configs tested: 127
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
arc                   randconfig-001-20230918   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm64                            alldefconfig   gcc  
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
i386         buildonly-randconfig-001-20230918   gcc  
i386         buildonly-randconfig-002-20230918   gcc  
i386         buildonly-randconfig-003-20230918   gcc  
i386         buildonly-randconfig-004-20230918   gcc  
i386         buildonly-randconfig-005-20230918   gcc  
i386         buildonly-randconfig-006-20230918   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-016-20230918   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230918   gcc  
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
mips                      maltasmvp_defconfig   gcc  
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
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230918   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230918   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230918   gcc  
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
x86_64       buildonly-randconfig-001-20230918   gcc  
x86_64       buildonly-randconfig-002-20230918   gcc  
x86_64       buildonly-randconfig-003-20230918   gcc  
x86_64       buildonly-randconfig-004-20230918   gcc  
x86_64       buildonly-randconfig-005-20230918   gcc  
x86_64       buildonly-randconfig-006-20230918   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230918   gcc  
x86_64                randconfig-002-20230918   gcc  
x86_64                randconfig-003-20230918   gcc  
x86_64                randconfig-004-20230918   gcc  
x86_64                randconfig-005-20230918   gcc  
x86_64                randconfig-006-20230918   gcc  
x86_64                randconfig-015-20230918   gcc  
x86_64                randconfig-016-20230918   gcc  
x86_64                randconfig-071-20230918   gcc  
x86_64                randconfig-072-20230918   gcc  
x86_64                randconfig-073-20230918   gcc  
x86_64                randconfig-074-20230918   gcc  
x86_64                randconfig-075-20230918   gcc  
x86_64                randconfig-076-20230918   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

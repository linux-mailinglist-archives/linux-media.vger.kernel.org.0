Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53FA67A70C0
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 05:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjITDAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 23:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjITDAq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 23:00:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85080C6
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 20:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695178840; x=1726714840;
  h=date:from:to:cc:subject:message-id;
  bh=Ju//gFoehVYhMK4jG3Yy6woEbZdwUr5cGXW1eRE63kc=;
  b=S9rrorjraUis5xoP1Ry+3JiWM0TzOUe7fhSAddpYFVwdyO5T+0aOKatx
   DdyDBzH/xE554+RjpAZ6zQpctsnGIgRWMfzt4XFYn5KAMyKI04fRykYV5
   KNbszvPgcb3E5cMcmdmLU047URVdNda9e0eIb3PQAJp29YN4exNudgFla
   1Y9s/wxLsbgLJPyDVQuROxKIAyL+6LoVQ+ZucZTxY9ECOq+H4zsj0gi4X
   HwwJN8GfgMKxqQzlggi1ckBO3qrQR0Mm/pQBCMgI3RW36SpFHTZbceOVu
   t1dd0bfnYxROaN27WOwlLXeHQS4XRnh/rP+rMFMMUXQsXUPTmxX29niJk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378999139"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="378999139"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 20:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889737334"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="889737334"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2023 19:59:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qinS9-0008Ct-0J;
        Wed, 20 Sep 2023 03:00:37 +0000
Date:   Wed, 20 Sep 2023 11:00:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 0c17102518085d25889cb01d17a1b12b8ee8f3ba
Message-ID: <202309201102.sjI141lG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 0c17102518085d25889cb01d17a1b12b8ee8f3ba  media: mc: Check pad flag validity

elapsed time: 814m

configs tested: 130
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
arc                   randconfig-001-20230919   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230919   gcc  
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
i386         buildonly-randconfig-001-20230919   gcc  
i386         buildonly-randconfig-002-20230919   gcc  
i386         buildonly-randconfig-003-20230919   gcc  
i386         buildonly-randconfig-004-20230919   gcc  
i386         buildonly-randconfig-005-20230919   gcc  
i386         buildonly-randconfig-006-20230919   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230919   gcc  
i386                  randconfig-002-20230919   gcc  
i386                  randconfig-003-20230919   gcc  
i386                  randconfig-004-20230919   gcc  
i386                  randconfig-005-20230919   gcc  
i386                  randconfig-006-20230919   gcc  
i386                  randconfig-011-20230919   gcc  
i386                  randconfig-012-20230919   gcc  
i386                  randconfig-013-20230919   gcc  
i386                  randconfig-014-20230919   gcc  
i386                  randconfig-015-20230919   gcc  
i386                  randconfig-016-20230919   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230919   gcc  
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
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230919   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230919   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230919   gcc  
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
x86_64       buildonly-randconfig-001-20230919   gcc  
x86_64       buildonly-randconfig-002-20230919   gcc  
x86_64       buildonly-randconfig-003-20230919   gcc  
x86_64       buildonly-randconfig-004-20230919   gcc  
x86_64       buildonly-randconfig-005-20230919   gcc  
x86_64       buildonly-randconfig-006-20230919   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230919   gcc  
x86_64                randconfig-002-20230919   gcc  
x86_64                randconfig-003-20230919   gcc  
x86_64                randconfig-004-20230919   gcc  
x86_64                randconfig-005-20230919   gcc  
x86_64                randconfig-006-20230919   gcc  
x86_64                randconfig-071-20230919   gcc  
x86_64                randconfig-072-20230919   gcc  
x86_64                randconfig-073-20230919   gcc  
x86_64                randconfig-074-20230919   gcc  
x86_64                randconfig-075-20230919   gcc  
x86_64                randconfig-076-20230919   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

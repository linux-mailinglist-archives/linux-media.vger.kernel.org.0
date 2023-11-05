Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7222A7E12E8
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 11:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjKEKBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 05:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjKEKBt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 05:01:49 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE09DD
        for <linux-media@vger.kernel.org>; Sun,  5 Nov 2023 02:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699178506; x=1730714506;
  h=date:from:to:cc:subject:message-id;
  bh=oob3inI2bqrTxXBncbyto1/3FO7d+umNpfImnIKa6wI=;
  b=Vw9ZTRIydRralNlxTW70CqhD2K5CV8J1v67RzP45s792xJWP+pkpvSxf
   KXbbuXkR/FuxGu7Gs79PHkgJMZ3tLNQFhAfjDqYPkPE6Arw76gDaMsbHs
   0mldQrIfPsmEpE1N4v4/6kpmEStizNixXP2b9hJXqtR1LdEMmU7cI3c3T
   490VS/JjE3AfHRXxbK1NdmBairSVKOLOuK4DBdPvU5EuMH0LXn/fuwxSR
   FdYZNGBpWKt2zjMrkx1Kw5u108XwkHY96YffeIM+xtE+XsOxx2MKOBEdL
   n7vISwUWj2tb1rJ7fKGNHNcMYtVeshGV3bx0E47VUI/EPmf0dKspe9BwT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="2044739"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2044739"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 02:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="791198408"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="791198408"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2023 02:01:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qzZwr-0005Iy-11;
        Sun, 05 Nov 2023 10:01:41 +0000
Date:   Sun, 05 Nov 2023 18:00:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:acpi-crs-csi2] BUILD SUCCESS
 017d9f8da34cee5870096565cb37aa758a963397
Message-ID: <202311051849.GDeVFKhb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git acpi-crs-csi2
branch HEAD: 017d9f8da34cee5870096565cb37aa758a963397  media: v4l: fwnode: Parse MIPI DisCo for Imaging properties

elapsed time: 2884m

configs tested: 250
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
arc                   randconfig-001-20231103   gcc  
arc                   randconfig-001-20231104   gcc  
arc                   randconfig-001-20231105   gcc  
arc                   randconfig-002-20231103   gcc  
arc                   randconfig-002-20231104   gcc  
arc                   randconfig-002-20231105   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231104   gcc  
arm                   randconfig-001-20231105   gcc  
arm                   randconfig-002-20231104   gcc  
arm                   randconfig-002-20231105   gcc  
arm                   randconfig-003-20231104   gcc  
arm                   randconfig-003-20231105   gcc  
arm                   randconfig-004-20231104   gcc  
arm                   randconfig-004-20231105   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231104   gcc  
arm64                 randconfig-001-20231105   gcc  
arm64                 randconfig-002-20231104   gcc  
arm64                 randconfig-002-20231105   gcc  
arm64                 randconfig-003-20231104   gcc  
arm64                 randconfig-003-20231105   gcc  
arm64                 randconfig-004-20231104   gcc  
arm64                 randconfig-004-20231105   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231103   gcc  
csky                  randconfig-001-20231104   gcc  
csky                  randconfig-001-20231105   gcc  
csky                  randconfig-002-20231103   gcc  
csky                  randconfig-002-20231104   gcc  
csky                  randconfig-002-20231105   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231103   gcc  
i386         buildonly-randconfig-001-20231104   gcc  
i386         buildonly-randconfig-002-20231103   gcc  
i386         buildonly-randconfig-002-20231104   gcc  
i386         buildonly-randconfig-003-20231103   gcc  
i386         buildonly-randconfig-003-20231104   gcc  
i386         buildonly-randconfig-004-20231103   gcc  
i386         buildonly-randconfig-004-20231104   gcc  
i386         buildonly-randconfig-005-20231103   gcc  
i386         buildonly-randconfig-005-20231104   gcc  
i386         buildonly-randconfig-006-20231103   gcc  
i386         buildonly-randconfig-006-20231104   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231104   gcc  
i386                  randconfig-001-20231105   gcc  
i386                  randconfig-002-20231104   gcc  
i386                  randconfig-002-20231105   gcc  
i386                  randconfig-003-20231104   gcc  
i386                  randconfig-003-20231105   gcc  
i386                  randconfig-004-20231104   gcc  
i386                  randconfig-004-20231105   gcc  
i386                  randconfig-005-20231104   gcc  
i386                  randconfig-005-20231105   gcc  
i386                  randconfig-006-20231104   gcc  
i386                  randconfig-006-20231105   gcc  
i386                  randconfig-011-20231104   gcc  
i386                  randconfig-011-20231105   gcc  
i386                  randconfig-012-20231104   gcc  
i386                  randconfig-012-20231105   gcc  
i386                  randconfig-013-20231104   gcc  
i386                  randconfig-013-20231105   gcc  
i386                  randconfig-014-20231104   gcc  
i386                  randconfig-014-20231105   gcc  
i386                  randconfig-015-20231104   gcc  
i386                  randconfig-015-20231105   gcc  
i386                  randconfig-016-20231104   gcc  
i386                  randconfig-016-20231105   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231103   gcc  
loongarch             randconfig-001-20231104   gcc  
loongarch             randconfig-001-20231105   gcc  
loongarch             randconfig-002-20231103   gcc  
loongarch             randconfig-002-20231104   gcc  
loongarch             randconfig-002-20231105   gcc  
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
nios2                 randconfig-001-20231104   gcc  
nios2                 randconfig-001-20231105   gcc  
nios2                 randconfig-002-20231104   gcc  
nios2                 randconfig-002-20231105   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231104   gcc  
parisc                randconfig-001-20231105   gcc  
parisc                randconfig-002-20231104   gcc  
parisc                randconfig-002-20231105   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc               randconfig-001-20231104   gcc  
powerpc               randconfig-001-20231105   gcc  
powerpc               randconfig-002-20231104   gcc  
powerpc               randconfig-002-20231105   gcc  
powerpc               randconfig-003-20231104   gcc  
powerpc               randconfig-003-20231105   gcc  
powerpc64             randconfig-001-20231104   gcc  
powerpc64             randconfig-001-20231105   gcc  
powerpc64             randconfig-002-20231104   gcc  
powerpc64             randconfig-002-20231105   gcc  
powerpc64             randconfig-003-20231104   gcc  
powerpc64             randconfig-003-20231105   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231104   gcc  
riscv                 randconfig-001-20231105   gcc  
riscv                 randconfig-002-20231104   gcc  
riscv                 randconfig-002-20231105   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231104   gcc  
s390                  randconfig-001-20231105   gcc  
s390                  randconfig-002-20231104   gcc  
s390                  randconfig-002-20231105   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231104   gcc  
sh                    randconfig-001-20231105   gcc  
sh                    randconfig-002-20231104   gcc  
sh                    randconfig-002-20231105   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231104   gcc  
sparc                 randconfig-001-20231105   gcc  
sparc                 randconfig-002-20231104   gcc  
sparc                 randconfig-002-20231105   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231104   gcc  
sparc64               randconfig-001-20231105   gcc  
sparc64               randconfig-002-20231104   gcc  
sparc64               randconfig-002-20231105   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231104   gcc  
um                    randconfig-001-20231105   gcc  
um                    randconfig-002-20231104   gcc  
um                    randconfig-002-20231105   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231104   gcc  
x86_64       buildonly-randconfig-001-20231105   gcc  
x86_64       buildonly-randconfig-002-20231104   gcc  
x86_64       buildonly-randconfig-002-20231105   gcc  
x86_64       buildonly-randconfig-003-20231104   gcc  
x86_64       buildonly-randconfig-003-20231105   gcc  
x86_64       buildonly-randconfig-004-20231104   gcc  
x86_64       buildonly-randconfig-004-20231105   gcc  
x86_64       buildonly-randconfig-005-20231104   gcc  
x86_64       buildonly-randconfig-005-20231105   gcc  
x86_64       buildonly-randconfig-006-20231104   gcc  
x86_64       buildonly-randconfig-006-20231105   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231104   gcc  
x86_64                randconfig-001-20231105   gcc  
x86_64                randconfig-002-20231104   gcc  
x86_64                randconfig-002-20231105   gcc  
x86_64                randconfig-003-20231104   gcc  
x86_64                randconfig-003-20231105   gcc  
x86_64                randconfig-004-20231104   gcc  
x86_64                randconfig-004-20231105   gcc  
x86_64                randconfig-005-20231104   gcc  
x86_64                randconfig-005-20231105   gcc  
x86_64                randconfig-006-20231104   gcc  
x86_64                randconfig-006-20231105   gcc  
x86_64                randconfig-011-20231104   gcc  
x86_64                randconfig-011-20231105   gcc  
x86_64                randconfig-012-20231104   gcc  
x86_64                randconfig-012-20231105   gcc  
x86_64                randconfig-013-20231104   gcc  
x86_64                randconfig-013-20231105   gcc  
x86_64                randconfig-014-20231104   gcc  
x86_64                randconfig-014-20231105   gcc  
x86_64                randconfig-015-20231104   gcc  
x86_64                randconfig-015-20231105   gcc  
x86_64                randconfig-016-20231104   gcc  
x86_64                randconfig-016-20231105   gcc  
x86_64                randconfig-071-20231104   gcc  
x86_64                randconfig-071-20231105   gcc  
x86_64                randconfig-072-20231104   gcc  
x86_64                randconfig-072-20231105   gcc  
x86_64                randconfig-073-20231104   gcc  
x86_64                randconfig-073-20231105   gcc  
x86_64                randconfig-074-20231104   gcc  
x86_64                randconfig-074-20231105   gcc  
x86_64                randconfig-075-20231104   gcc  
x86_64                randconfig-075-20231105   gcc  
x86_64                randconfig-076-20231104   gcc  
x86_64                randconfig-076-20231105   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231104   gcc  
xtensa                randconfig-001-20231105   gcc  
xtensa                randconfig-002-20231104   gcc  
xtensa                randconfig-002-20231105   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

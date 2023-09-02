Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F2E7908B4
	for <lists+linux-media@lfdr.de>; Sat,  2 Sep 2023 18:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbjIBQja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Sep 2023 12:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjIBQja (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Sep 2023 12:39:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AA5E8
        for <linux-media@vger.kernel.org>; Sat,  2 Sep 2023 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693672766; x=1725208766;
  h=date:from:to:cc:subject:message-id;
  bh=SAeEjAO/aRj0Gpa1sRVzSZljItr+/vb4nVenASd6suw=;
  b=YV/mvd8nvKBArO/PyTEIa+5wQJ/o0mDYnvdd/trgog3GMQ6QiM47fYtR
   SgfSuwS2vyVwnHI8IRP0xChCiHI4cNN07bk3m7uv47InuAvrcENvsSibm
   AJCAp1JVWYCdDaFcdKV72czBG2/eroj/ODk0Hy2qyqeIuSPFBV+ooHOIh
   c94ZwOY6lZDvgk/UmUh9GoeVns6jTcag/kLhq42XjRoryRisTefh4zDZM
   7pe9yYIX1yq8HsbCsLopzPEW1Sy1CSuwEG5Vc9GoQfkWvjRcOKo5FII4r
   SuSP4eY0dAnhgXhB1FSWVwlHz5tKG/kDKUz1CShdW6fmoj1Q0eP89Qxx4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="407381816"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="407381816"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 09:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987025798"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="987025798"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 09:39:25 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qcTed-0002Tp-1C;
        Sat, 02 Sep 2023 16:39:23 +0000
Date:   Sun, 03 Sep 2023 00:39:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 892ec0c7ee771a853f773a6a88d19c7b2b016b0a
Message-ID: <202309030058.egR8CFpf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 892ec0c7ee771a853f773a6a88d19c7b2b016b0a  media: dt-bindings: Merge OV5695 into OV5693 binding

elapsed time: 1099m

configs tested: 161
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230902   gcc  
alpha                randconfig-r026-20230902   gcc  
alpha                randconfig-r033-20230902   gcc  
alpha                randconfig-r036-20230902   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230902   gcc  
arc                  randconfig-r025-20230902   gcc  
arc                  randconfig-r032-20230902   gcc  
arc                  randconfig-r035-20230902   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230902   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230902   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230902   gcc  
csky                 randconfig-r013-20230902   gcc  
hexagon               randconfig-001-20230902   clang
hexagon               randconfig-002-20230902   clang
hexagon              randconfig-r015-20230902   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230902   gcc  
i386         buildonly-randconfig-002-20230902   gcc  
i386         buildonly-randconfig-003-20230902   gcc  
i386         buildonly-randconfig-004-20230902   gcc  
i386         buildonly-randconfig-005-20230902   gcc  
i386         buildonly-randconfig-006-20230902   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230902   gcc  
i386                  randconfig-002-20230902   gcc  
i386                  randconfig-003-20230902   gcc  
i386                  randconfig-004-20230902   gcc  
i386                  randconfig-005-20230902   gcc  
i386                  randconfig-006-20230902   gcc  
i386                  randconfig-011-20230902   clang
i386                  randconfig-012-20230902   clang
i386                  randconfig-013-20230902   clang
i386                  randconfig-014-20230902   clang
i386                  randconfig-015-20230902   clang
i386                  randconfig-016-20230902   clang
i386                 randconfig-r002-20230902   gcc  
i386                 randconfig-r031-20230902   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230902   gcc  
loongarch            randconfig-r001-20230902   gcc  
loongarch            randconfig-r003-20230902   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r006-20230902   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230902   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230902   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r022-20230902   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230902   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230902   clang
s390                 randconfig-r012-20230902   clang
s390                 randconfig-r021-20230902   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r005-20230902   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r014-20230902   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r034-20230902   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230902   gcc  
x86_64       buildonly-randconfig-002-20230902   gcc  
x86_64       buildonly-randconfig-003-20230902   gcc  
x86_64       buildonly-randconfig-004-20230902   gcc  
x86_64       buildonly-randconfig-005-20230902   gcc  
x86_64       buildonly-randconfig-006-20230902   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230902   clang
x86_64                randconfig-002-20230902   clang
x86_64                randconfig-003-20230902   clang
x86_64                randconfig-004-20230902   clang
x86_64                randconfig-005-20230902   clang
x86_64                randconfig-006-20230902   clang
x86_64                randconfig-011-20230902   gcc  
x86_64                randconfig-012-20230902   gcc  
x86_64                randconfig-013-20230902   gcc  
x86_64                randconfig-014-20230902   gcc  
x86_64                randconfig-015-20230902   gcc  
x86_64                randconfig-016-20230902   gcc  
x86_64                randconfig-071-20230902   gcc  
x86_64                randconfig-072-20230902   gcc  
x86_64                randconfig-073-20230902   gcc  
x86_64                randconfig-074-20230902   gcc  
x86_64                randconfig-075-20230902   gcc  
x86_64                randconfig-076-20230902   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

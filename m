Return-Path: <linux-media+bounces-196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57607E997E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C011C2088C
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 09:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ADD1BDC7;
	Mon, 13 Nov 2023 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEQK12NP"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A331A5B3
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 09:55:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69315171B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 01:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699869304; x=1731405304;
  h=date:from:to:cc:subject:message-id;
  bh=iyGLXy5FTp5GjRVbwK6rzh/YjfeAHy9gfMCAU9r7ts8=;
  b=TEQK12NPcegX4q4P9nuPJ9YyMmo1V3UltPsJWxtbk9GBA5nndWGvAqKB
   N1X4sIer+rhWJghk+qywdtdia1121UkD4uDYRizgeLEf2ccu4lDCkTt77
   LaV/1Xoj2NmLraxd3dWnNvhAC7xBIzYPxc1Hi9AB0C+cOYlglLaQQYc5R
   0B80N2dEUm3XJWrWcuWFxerQRKs/qNbGbhIeLKX1doG5mCwfLHLIC6V3z
   80/WxsQXeqq8nNl9qhtjGCZY4jkeFN/owdGKlSr6/x/AFmhmnms8mjXJ/
   5kj6XIq4rY5V9DYCgtg23iSh6M/rVfQn+vtgncGZkraGbdliaWDC0tpup
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369739238"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369739238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 01:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12059076"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2023 01:55:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Tem-000C0Q-12;
	Mon, 13 Nov 2023 09:55:00 +0000
Date: Mon, 13 Nov 2023 17:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 61ab89c1916219ccbeca9f6cefb1680212de8d1c
Message-ID: <202311131739.EmEtGgJ6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 61ab89c1916219ccbeca9f6cefb1680212de8d1c  media: v4l: subdev: Return NULL from pad access functions on error

elapsed time: 785m

configs tested: 181
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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20231113   gcc  
arc                   randconfig-002-20231113   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231113   gcc  
arm                   randconfig-002-20231113   gcc  
arm                   randconfig-003-20231113   gcc  
arm                   randconfig-004-20231113   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231113   gcc  
arm64                 randconfig-002-20231113   gcc  
arm64                 randconfig-003-20231113   gcc  
arm64                 randconfig-004-20231113   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231113   gcc  
csky                  randconfig-002-20231113   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231113   gcc  
i386         buildonly-randconfig-002-20231113   gcc  
i386         buildonly-randconfig-003-20231113   gcc  
i386         buildonly-randconfig-004-20231113   gcc  
i386         buildonly-randconfig-005-20231113   gcc  
i386         buildonly-randconfig-006-20231113   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231113   gcc  
i386                  randconfig-002-20231113   gcc  
i386                  randconfig-003-20231113   gcc  
i386                  randconfig-004-20231113   gcc  
i386                  randconfig-005-20231113   gcc  
i386                  randconfig-006-20231113   gcc  
i386                  randconfig-011-20231113   gcc  
i386                  randconfig-012-20231113   gcc  
i386                  randconfig-013-20231113   gcc  
i386                  randconfig-014-20231113   gcc  
i386                  randconfig-015-20231113   gcc  
i386                  randconfig-016-20231113   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231113   gcc  
loongarch             randconfig-002-20231113   gcc  
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
mips                          ath79_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231113   gcc  
nios2                 randconfig-002-20231113   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231113   gcc  
parisc                randconfig-002-20231113   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc               randconfig-001-20231113   gcc  
powerpc               randconfig-002-20231113   gcc  
powerpc               randconfig-003-20231113   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231113   gcc  
powerpc64             randconfig-002-20231113   gcc  
powerpc64             randconfig-003-20231113   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231113   gcc  
riscv                 randconfig-002-20231113   gcc  
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231113   gcc  
s390                  randconfig-002-20231113   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231113   gcc  
sh                    randconfig-002-20231113   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231113   gcc  
sparc                 randconfig-002-20231113   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231113   gcc  
sparc64               randconfig-002-20231113   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231113   gcc  
um                    randconfig-002-20231113   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231113   gcc  
x86_64       buildonly-randconfig-002-20231113   gcc  
x86_64       buildonly-randconfig-003-20231113   gcc  
x86_64       buildonly-randconfig-004-20231113   gcc  
x86_64       buildonly-randconfig-005-20231113   gcc  
x86_64       buildonly-randconfig-006-20231113   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231113   gcc  
x86_64                randconfig-002-20231113   gcc  
x86_64                randconfig-003-20231113   gcc  
x86_64                randconfig-004-20231113   gcc  
x86_64                randconfig-005-20231113   gcc  
x86_64                randconfig-006-20231113   gcc  
x86_64                randconfig-011-20231113   gcc  
x86_64                randconfig-012-20231113   gcc  
x86_64                randconfig-013-20231113   gcc  
x86_64                randconfig-014-20231113   gcc  
x86_64                randconfig-015-20231113   gcc  
x86_64                randconfig-016-20231113   gcc  
x86_64                randconfig-071-20231113   gcc  
x86_64                randconfig-072-20231113   gcc  
x86_64                randconfig-073-20231113   gcc  
x86_64                randconfig-074-20231113   gcc  
x86_64                randconfig-075-20231113   gcc  
x86_64                randconfig-076-20231113   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                randconfig-001-20231113   gcc  
xtensa                randconfig-002-20231113   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-1358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2127FD5FF
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 12:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6101C210CD
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8C1D529;
	Wed, 29 Nov 2023 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZd47t7g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B77183
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 03:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701258531; x=1732794531;
  h=date:from:to:cc:subject:message-id;
  bh=rFHbYoeRWfXpw7HkZkPNbh0zluA9GRtRH36GXIbShUI=;
  b=WZd47t7g10jw0MQsFt+Eh7z1hSG02CRnYVcI2xHjJh5cGaQ3IeIJm9SO
   egSXURxyFAcmPFD/YjOnIpwcR5A/eJ9pqSdOVdTt5kth75FLDQ0ZdR7UH
   2kDNBkKG9g87PeTm/2l0LQOOjsRBat9X2qwh/ryCafj+DpDvjN9BFykSO
   urMNfDKkoDFFfg8enqKbxzZYqrNjRw2ODdruL2b8g7Kd4XBD6a7AwALEC
   YZ9ssyhgN4EXXI9j8wDruJPfqAec4Esxccf6tD9eAdfetY9khcTJHQWx2
   27+7zMiWpSD65YQ3WXCUE6jKv+NEKg5PGvxQPNnN8QngOMEuOP07KYF2L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479348134"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="479348134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 03:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762292420"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762292420"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Nov 2023 03:48:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8J3f-0000BY-0p;
	Wed, 29 Nov 2023 11:48:47 +0000
Date: Wed, 29 Nov 2023 19:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 d940503dc621ded42c2816d5d693453d90d5cf64
Message-ID: <202311291933.UJLNSXDX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: d940503dc621ded42c2816d5d693453d90d5cf64  media: v4l2-subdev: Fix indentation in v4l2-subdev.h

elapsed time: 1498m

configs tested: 162
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
arc                   randconfig-001-20231128   gcc  
arc                   randconfig-002-20231128   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231128   clang
arm                   randconfig-002-20231128   clang
arm                   randconfig-003-20231128   clang
arm                   randconfig-004-20231128   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231128   clang
arm64                 randconfig-002-20231128   clang
arm64                 randconfig-003-20231128   clang
arm64                 randconfig-004-20231128   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231128   gcc  
csky                  randconfig-002-20231128   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231128   clang
hexagon               randconfig-002-20231128   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231128   clang
i386         buildonly-randconfig-002-20231128   clang
i386         buildonly-randconfig-003-20231128   clang
i386         buildonly-randconfig-004-20231128   clang
i386         buildonly-randconfig-005-20231128   clang
i386         buildonly-randconfig-006-20231128   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231128   clang
i386                  randconfig-002-20231128   clang
i386                  randconfig-003-20231128   clang
i386                  randconfig-004-20231128   clang
i386                  randconfig-005-20231128   clang
i386                  randconfig-006-20231128   clang
i386                  randconfig-011-20231128   gcc  
i386                  randconfig-012-20231128   gcc  
i386                  randconfig-013-20231128   gcc  
i386                  randconfig-014-20231128   gcc  
i386                  randconfig-015-20231128   gcc  
i386                  randconfig-016-20231128   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231128   gcc  
loongarch             randconfig-002-20231128   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231128   gcc  
nios2                 randconfig-002-20231128   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231128   gcc  
parisc                randconfig-002-20231128   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231128   clang
powerpc               randconfig-002-20231128   clang
powerpc               randconfig-003-20231128   clang
powerpc64             randconfig-001-20231128   clang
powerpc64             randconfig-002-20231128   clang
powerpc64             randconfig-003-20231128   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231128   clang
riscv                 randconfig-002-20231128   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231128   gcc  
s390                  randconfig-002-20231128   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231128   gcc  
sh                    randconfig-002-20231128   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231128   gcc  
sparc64               randconfig-002-20231128   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231128   clang
um                    randconfig-002-20231128   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231128   clang
x86_64       buildonly-randconfig-002-20231128   clang
x86_64       buildonly-randconfig-003-20231128   clang
x86_64       buildonly-randconfig-004-20231128   clang
x86_64       buildonly-randconfig-005-20231128   clang
x86_64       buildonly-randconfig-006-20231128   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231128   gcc  
x86_64                randconfig-002-20231128   gcc  
x86_64                randconfig-003-20231128   gcc  
x86_64                randconfig-004-20231128   gcc  
x86_64                randconfig-005-20231128   gcc  
x86_64                randconfig-006-20231128   gcc  
x86_64                randconfig-011-20231128   clang
x86_64                randconfig-012-20231128   clang
x86_64                randconfig-013-20231128   clang
x86_64                randconfig-014-20231128   clang
x86_64                randconfig-015-20231128   clang
x86_64                randconfig-016-20231128   clang
x86_64                randconfig-071-20231128   clang
x86_64                randconfig-072-20231128   clang
x86_64                randconfig-073-20231128   clang
x86_64                randconfig-074-20231128   clang
x86_64                randconfig-075-20231128   clang
x86_64                randconfig-076-20231128   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231128   gcc  
xtensa                randconfig-002-20231128   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


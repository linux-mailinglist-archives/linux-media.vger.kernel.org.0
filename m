Return-Path: <linux-media+bounces-1656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CFC8051CF
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D94A41C20B5F
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FF656759;
	Tue,  5 Dec 2023 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EonfOIeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC2E116
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 03:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774927; x=1733310927;
  h=date:from:to:cc:subject:message-id;
  bh=h8mUr3hdfCT72LUwLfWchKfqTiybG8NFtplBUTLBSlw=;
  b=EonfOIegNsUIzYH8gdrfC6FwwA6z2rc3V6rPRHX5MN4GISWdbn+8qpMJ
   aV36IPNL8Sl7OodApW1M4NKJAwE9h9mGa7I+aRYm+0iIAIQk7NvoClOf1
   QixNcsZ2HFEElg3sAh/yaPIajAKs6Ye3BA1/xzjIcQ5FksVOh2V7/EBL9
   LFCe8mquilVtiX+cJ9rYToc1NOw7WThU6n/naCUEGOV8C0Ts6mNKR0Npi
   sv8mhmIOYkoKHkrjxbt+/hkD3pISBgs0YyM2uCWnVtFRJNxdVMRCW2x1L
   fzG9Xmv+E2STmBbHq8pO96GUX288vydq3VJvzEO1rdm/WNZ2YFt0FPoEN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7223272"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7223272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:15:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720663323"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="720663323"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2023 03:15:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATOc-0008qJ-1W;
	Tue, 05 Dec 2023 11:15:22 +0000
Date: Tue, 05 Dec 2023 19:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 bec3db03911bd85da29c1c8ee556162153002c9a
Message-ID: <202312051919.XvWJf28W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: bec3db03911bd85da29c1c8ee556162153002c9a  media: v4l: async: Drop useless list move operation

elapsed time: 1461m

configs tested: 247
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
arc                   randconfig-001-20231204   gcc  
arc                   randconfig-001-20231205   gcc  
arc                   randconfig-002-20231204   gcc  
arc                   randconfig-002-20231205   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231204   clang
arm                   randconfig-001-20231205   gcc  
arm                   randconfig-002-20231204   clang
arm                   randconfig-002-20231205   gcc  
arm                   randconfig-003-20231204   clang
arm                   randconfig-003-20231205   gcc  
arm                   randconfig-004-20231204   clang
arm                   randconfig-004-20231205   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231204   clang
arm64                 randconfig-001-20231205   gcc  
arm64                 randconfig-002-20231204   clang
arm64                 randconfig-002-20231205   gcc  
arm64                 randconfig-003-20231204   clang
arm64                 randconfig-003-20231205   gcc  
arm64                 randconfig-004-20231204   clang
arm64                 randconfig-004-20231205   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231204   gcc  
csky                  randconfig-001-20231205   gcc  
csky                  randconfig-002-20231204   gcc  
csky                  randconfig-002-20231205   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231204   clang
hexagon               randconfig-002-20231204   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231204   clang
i386         buildonly-randconfig-002-20231204   clang
i386         buildonly-randconfig-003-20231204   clang
i386         buildonly-randconfig-004-20231204   clang
i386         buildonly-randconfig-005-20231204   clang
i386         buildonly-randconfig-006-20231204   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231204   clang
i386                  randconfig-002-20231204   clang
i386                  randconfig-003-20231204   clang
i386                  randconfig-004-20231204   clang
i386                  randconfig-005-20231204   clang
i386                  randconfig-006-20231204   clang
i386                  randconfig-011-20231204   gcc  
i386                  randconfig-012-20231204   gcc  
i386                  randconfig-013-20231204   gcc  
i386                  randconfig-014-20231204   gcc  
i386                  randconfig-015-20231204   gcc  
i386                  randconfig-016-20231204   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231204   gcc  
loongarch             randconfig-001-20231205   gcc  
loongarch             randconfig-002-20231204   gcc  
loongarch             randconfig-002-20231205   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                           rs90_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231204   gcc  
nios2                 randconfig-001-20231205   gcc  
nios2                 randconfig-002-20231204   gcc  
nios2                 randconfig-002-20231205   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231204   gcc  
parisc                randconfig-001-20231205   gcc  
parisc                randconfig-002-20231204   gcc  
parisc                randconfig-002-20231205   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231204   clang
powerpc               randconfig-001-20231205   gcc  
powerpc               randconfig-002-20231204   clang
powerpc               randconfig-002-20231205   gcc  
powerpc               randconfig-003-20231204   clang
powerpc               randconfig-003-20231205   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc64             randconfig-001-20231204   clang
powerpc64             randconfig-001-20231205   gcc  
powerpc64             randconfig-002-20231204   clang
powerpc64             randconfig-002-20231205   gcc  
powerpc64             randconfig-003-20231204   clang
powerpc64             randconfig-003-20231205   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231204   clang
riscv                 randconfig-001-20231205   gcc  
riscv                 randconfig-002-20231204   clang
riscv                 randconfig-002-20231205   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231204   gcc  
s390                  randconfig-002-20231204   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20231204   gcc  
sh                    randconfig-001-20231205   gcc  
sh                    randconfig-002-20231204   gcc  
sh                    randconfig-002-20231205   gcc  
sh                           se7724_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231204   gcc  
sparc64               randconfig-001-20231205   gcc  
sparc64               randconfig-002-20231204   gcc  
sparc64               randconfig-002-20231205   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231204   clang
um                    randconfig-001-20231205   gcc  
um                    randconfig-002-20231204   clang
um                    randconfig-002-20231205   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231204   clang
x86_64       buildonly-randconfig-001-20231205   gcc  
x86_64       buildonly-randconfig-002-20231204   clang
x86_64       buildonly-randconfig-002-20231205   gcc  
x86_64       buildonly-randconfig-003-20231204   clang
x86_64       buildonly-randconfig-003-20231205   gcc  
x86_64       buildonly-randconfig-004-20231204   clang
x86_64       buildonly-randconfig-004-20231205   gcc  
x86_64       buildonly-randconfig-005-20231204   clang
x86_64       buildonly-randconfig-005-20231205   gcc  
x86_64       buildonly-randconfig-006-20231204   clang
x86_64       buildonly-randconfig-006-20231205   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231204   gcc  
x86_64                randconfig-002-20231204   gcc  
x86_64                randconfig-003-20231204   gcc  
x86_64                randconfig-004-20231204   gcc  
x86_64                randconfig-005-20231204   gcc  
x86_64                randconfig-006-20231204   gcc  
x86_64                randconfig-011-20231204   clang
x86_64                randconfig-011-20231205   gcc  
x86_64                randconfig-012-20231204   clang
x86_64                randconfig-012-20231205   gcc  
x86_64                randconfig-013-20231204   clang
x86_64                randconfig-013-20231205   gcc  
x86_64                randconfig-014-20231204   clang
x86_64                randconfig-014-20231205   gcc  
x86_64                randconfig-015-20231204   clang
x86_64                randconfig-015-20231205   gcc  
x86_64                randconfig-016-20231204   clang
x86_64                randconfig-016-20231205   gcc  
x86_64                randconfig-071-20231204   clang
x86_64                randconfig-071-20231205   gcc  
x86_64                randconfig-072-20231204   clang
x86_64                randconfig-072-20231205   gcc  
x86_64                randconfig-073-20231204   clang
x86_64                randconfig-073-20231205   gcc  
x86_64                randconfig-074-20231204   clang
x86_64                randconfig-074-20231205   gcc  
x86_64                randconfig-075-20231204   clang
x86_64                randconfig-075-20231205   gcc  
x86_64                randconfig-076-20231204   clang
x86_64                randconfig-076-20231205   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231204   gcc  
xtensa                randconfig-001-20231205   gcc  
xtensa                randconfig-002-20231204   gcc  
xtensa                randconfig-002-20231205   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


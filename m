Return-Path: <linux-media+bounces-12372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA98D6B7E
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 23:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FF361F239A2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 21:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994A778C89;
	Fri, 31 May 2024 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1E9IEbA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457EF1CAA6
	for <linux-media@vger.kernel.org>; Fri, 31 May 2024 21:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717190592; cv=none; b=g4ibI74Os90mcNN/nb9Th/8LOSXu6KA6ZUXQZAu2+IHVymJhC8126roLUz2WqhH1TN8eQQGjsXosk5d9u1NMbSeBrpCvAbbTnW/VPNg2mf2PZxPuahg/SrwHJrhhikk8NrX34Kq9K4uHMJ0XKyCMlvyPy9HlVyP19N75gN4jBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717190592; c=relaxed/simple;
	bh=n7kedYxXv74fYPthGp5HxCeILRBivrCv5pOTb9tCTrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dblyk7dll0O8/VrWkJQgWOCi3cjh97JZsKhhYl8QEJs+qOlVFzd1SKb0hoq1/ixJ0Epmu+L7MO4dPMG78IpbtQJw/7GLGdJ3QMDtOvcPBPz0hph9BGXQLkPMQOwlEN6VlnjgdiQDnOQi0p33uJPXb5zNKRPwY9/Zw2wbLRbrJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1E9IEbA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717190590; x=1748726590;
  h=date:from:to:cc:subject:message-id;
  bh=n7kedYxXv74fYPthGp5HxCeILRBivrCv5pOTb9tCTrc=;
  b=M1E9IEbANth5ypprpb1WHgbfOqfzTAFW95wv8kMwf1FTYr02uiX9AWfl
   V2CuYrD4SY+/WBAFCGxf+W/07gunalFOZe+lUPp82x1SxqkuR3wiTbpUI
   3gX829QiiT8cm8R5sxcGn4JgpdwV8tPVZ9VLG/BdMYY7Jq1KNIivhxPQ9
   8Zd9I73/qpZT5msNVYKpfbttCbM1c39tugySH6NEyP3J/tS6t1R9eogHm
   zggYOkhYGDmvPFX3GBNXKQpzNtOPsTRZxofOnabdFkGt6rCAsDlrqrPc6
   /29LwWbe/GlVrVT9QMZoi2uy6hx7kNPHXIKVxmgLWUTmm2J7hXrC9BEpl
   Q==;
X-CSE-ConnectionGUID: NJrLir30RkuB1U4+QntJ6w==
X-CSE-MsgGUID: t3EMnFHRS4S6xYL3rCR1vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13595779"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13595779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 14:23:09 -0700
X-CSE-ConnectionGUID: sndW+7uWTMWtlBhGbVuUdA==
X-CSE-MsgGUID: pd1bMYpxTdKhCyNC5hC1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40724232"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 May 2024 14:23:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD9iM-000Hq1-0x;
	Fri, 31 May 2024 21:23:06 +0000
Date: Sat, 01 Jun 2024 05:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 6bdb83404e343cae573143b857a4b85855c998bf
Message-ID: <202406010538.9L3h1gV4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 6bdb83404e343cae573143b857a4b85855c998bf  media: rkisp1: Mark subdev state pointers as const

elapsed time: 1466m

configs tested: 218
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240531   gcc  
arc                   randconfig-001-20240601   gcc  
arc                   randconfig-002-20240531   gcc  
arc                   randconfig-002-20240601   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        multi_v5_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-003-20240601   gcc  
arm                   randconfig-004-20240601   gcc  
arm                        vexpress_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240601   gcc  
arm64                 randconfig-003-20240531   gcc  
arm64                 randconfig-004-20240531   gcc  
arm64                 randconfig-004-20240601   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240531   gcc  
csky                  randconfig-001-20240601   gcc  
csky                  randconfig-002-20240531   gcc  
csky                  randconfig-002-20240601   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240531   clang
i386         buildonly-randconfig-002-20240531   gcc  
i386         buildonly-randconfig-003-20240531   gcc  
i386         buildonly-randconfig-004-20240531   clang
i386         buildonly-randconfig-005-20240531   gcc  
i386         buildonly-randconfig-006-20240531   clang
i386                                defconfig   clang
i386                  randconfig-001-20240531   gcc  
i386                  randconfig-002-20240531   clang
i386                  randconfig-003-20240531   clang
i386                  randconfig-004-20240531   gcc  
i386                  randconfig-005-20240531   clang
i386                  randconfig-006-20240531   clang
i386                  randconfig-011-20240531   clang
i386                  randconfig-012-20240531   gcc  
i386                  randconfig-013-20240531   gcc  
i386                  randconfig-014-20240531   clang
i386                  randconfig-015-20240531   gcc  
i386                  randconfig-016-20240531   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240531   gcc  
loongarch             randconfig-001-20240601   gcc  
loongarch             randconfig-002-20240531   gcc  
loongarch             randconfig-002-20240601   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240531   gcc  
nios2                 randconfig-001-20240601   gcc  
nios2                 randconfig-002-20240531   gcc  
nios2                 randconfig-002-20240601   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240531   gcc  
parisc                randconfig-001-20240601   gcc  
parisc                randconfig-002-20240531   gcc  
parisc                randconfig-002-20240601   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240601   gcc  
powerpc               randconfig-002-20240601   gcc  
powerpc               randconfig-003-20240531   gcc  
powerpc               randconfig-003-20240601   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-003-20240531   gcc  
powerpc64             randconfig-003-20240601   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240601   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240531   gcc  
s390                  randconfig-001-20240601   gcc  
s390                  randconfig-002-20240531   gcc  
s390                  randconfig-002-20240601   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240531   gcc  
sh                    randconfig-001-20240601   gcc  
sh                    randconfig-002-20240531   gcc  
sh                    randconfig-002-20240601   gcc  
sh                           se7343_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240531   gcc  
sparc64               randconfig-001-20240601   gcc  
sparc64               randconfig-002-20240531   gcc  
sparc64               randconfig-002-20240601   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240531   gcc  
um                    randconfig-001-20240601   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240531   clang
x86_64       buildonly-randconfig-001-20240601   clang
x86_64       buildonly-randconfig-002-20240531   gcc  
x86_64       buildonly-randconfig-002-20240601   clang
x86_64       buildonly-randconfig-003-20240531   clang
x86_64       buildonly-randconfig-004-20240531   clang
x86_64       buildonly-randconfig-005-20240531   gcc  
x86_64       buildonly-randconfig-005-20240601   clang
x86_64       buildonly-randconfig-006-20240531   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240531   gcc  
x86_64                randconfig-002-20240531   clang
x86_64                randconfig-002-20240601   clang
x86_64                randconfig-003-20240531   gcc  
x86_64                randconfig-003-20240601   clang
x86_64                randconfig-004-20240531   gcc  
x86_64                randconfig-004-20240601   clang
x86_64                randconfig-005-20240531   gcc  
x86_64                randconfig-006-20240531   gcc  
x86_64                randconfig-006-20240601   clang
x86_64                randconfig-011-20240531   clang
x86_64                randconfig-011-20240601   clang
x86_64                randconfig-012-20240531   gcc  
x86_64                randconfig-012-20240601   clang
x86_64                randconfig-013-20240531   gcc  
x86_64                randconfig-013-20240601   clang
x86_64                randconfig-014-20240531   clang
x86_64                randconfig-015-20240531   gcc  
x86_64                randconfig-016-20240531   gcc  
x86_64                randconfig-071-20240531   clang
x86_64                randconfig-071-20240601   clang
x86_64                randconfig-072-20240531   gcc  
x86_64                randconfig-073-20240531   gcc  
x86_64                randconfig-073-20240601   clang
x86_64                randconfig-074-20240531   gcc  
x86_64                randconfig-075-20240531   clang
x86_64                randconfig-075-20240601   clang
x86_64                randconfig-076-20240531   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240531   gcc  
xtensa                randconfig-001-20240601   gcc  
xtensa                randconfig-002-20240531   gcc  
xtensa                randconfig-002-20240601   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


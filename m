Return-Path: <linux-media+bounces-5207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03A8561D9
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 12:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058B929627C
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5941012F373;
	Thu, 15 Feb 2024 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIkGNMbm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAB12F36F
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707997020; cv=none; b=KjBsmkyI7QGSHiq9jfQjSLiUoRBqVRi565WfgS6I6iEapJRwa1KfAPAmiNSfE0NLotzoaZwONB0eY0nBn8mot/8duwKVRlENoB8PyyWBSd9gbVpReXjNsbd+wSH/M1KQdhOTL6gTuKLkH4Ul/4kCw83yFfHqj1pw8XloQmF+Kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707997020; c=relaxed/simple;
	bh=Iq2NaEZnSMKOQNNA5TOcbQnwHY2+jGObn/EezYJOrnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UpDfrutcxjh7bWMMsCzGGMVph3tJpK7XKvkD6xSXqi0etIibw+23Fo53nGJm3qJfNi9JpBDJowr/K9PDOrHCixVjJoBtoGVOFDcbIGZPZSv2kLEQH9Xg0GxPWd9IxUQqVrT6f4i9cEJv6RkNGHTbCgF4hPidifqquB1ua50uqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIkGNMbm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707997018; x=1739533018;
  h=date:from:to:cc:subject:message-id;
  bh=Iq2NaEZnSMKOQNNA5TOcbQnwHY2+jGObn/EezYJOrnM=;
  b=VIkGNMbma4j1Bjip9lahjFG+CLrNAT/AgG9hFjYXJgr+JjMdVlN8X5Oh
   d2HarK/F2+eZrof3quVcoV1QlKVusMruePRWM1zUbKiUKzx9w4ta3zwef
   AKT3EbP/3nnIi/vF2fVf0X6ZMdwIoHiFRYGVkxA+vCF0cSFeHvsYt39sW
   cC9/MJRK/eH5+y+k1aZItyiLzA3sY1ugwSv6R8oXXvygA+mdB7XUCXleb
   H6yMWgIeLHyXgX0f00p5uuC8Hj6JwAShRJXsXnKIny9jIzyBvfc+yRhah
   wU46I5ZnpwBuO6N1dadQ5DoEjT4bH99f6LWOz+YqvOE5RG4Ln/ZTBC/e7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2217590"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2217590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 03:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8111435"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Feb 2024 03:36:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raa2v-0000RW-03;
	Thu, 15 Feb 2024 11:36:53 +0000
Date: Thu, 15 Feb 2024 19:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 31343acd3c3ab852367e3f986d12b5e743d5c5c5
Message-ID: <202402151949.B2G3DOnf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 31343acd3c3ab852367e3f986d12b5e743d5c5c5  media: ipu6/isys: support line-based metadata capture support

elapsed time: 1447m

configs tested: 152
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20240215   gcc  
arc                   randconfig-002-20240215   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                           imxrt_defconfig   clang
arm                   randconfig-002-20240215   gcc  
arm                   randconfig-003-20240215   gcc  
arm                   randconfig-004-20240215   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-003-20240215   gcc  
arm64                 randconfig-004-20240215   gcc  
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240215   gcc  
csky                  randconfig-002-20240215   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240215   clang
i386         buildonly-randconfig-002-20240215   clang
i386         buildonly-randconfig-003-20240215   clang
i386         buildonly-randconfig-004-20240215   clang
i386         buildonly-randconfig-005-20240215   clang
i386         buildonly-randconfig-006-20240215   clang
i386                                defconfig   clang
i386                  randconfig-003-20240215   clang
i386                  randconfig-011-20240215   clang
i386                  randconfig-012-20240215   clang
i386                  randconfig-015-20240215   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240215   gcc  
loongarch             randconfig-002-20240215   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240215   gcc  
nios2                 randconfig-002-20240215   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240215   gcc  
parisc                randconfig-002-20240215   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          g5_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               randconfig-001-20240215   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-002-20240215   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_k210_defconfig   clang
riscv                 randconfig-001-20240215   gcc  
riscv                 randconfig-002-20240215   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240215   gcc  
sh                    randconfig-002-20240215   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240215   gcc  
sparc64               randconfig-002-20240215   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240215   gcc  
um                    randconfig-002-20240215   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240215   gcc  
xtensa                randconfig-002-20240215   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


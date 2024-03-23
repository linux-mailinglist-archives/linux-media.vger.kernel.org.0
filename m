Return-Path: <linux-media+bounces-7677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3146887877
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 13:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E25A4B22CE1
	for <lists+linux-media@lfdr.de>; Sat, 23 Mar 2024 12:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63551B95C;
	Sat, 23 Mar 2024 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoM3USUq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A7810A1B
	for <linux-media@vger.kernel.org>; Sat, 23 Mar 2024 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711196162; cv=none; b=FDTW4CECXU+5kU+ZadXoCAQ1ZGlAx9v+p3TB+nAbxo/3WYEYeJiuVCpo6wtONF0fVjEfBSty9BQvxw8BAkxDT5/wSIajANhwvGw1QmovgCYobtWzcAgCLAm3pysNqbvxnzXCjyeLXlBl8MyQ87h10vPF6b1p36f1op+AGRCGIW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711196162; c=relaxed/simple;
	bh=bah9HJdA1zBPMKl7VZu9W+Q5hfYBF3uOE13WwOSi1Tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gGf6Db6TS8m66vLjVzUwC6rnLuWdQtDyy7hE04X/ZC2clAHbbbn/2fpKcDAWTOrpljbH5Y2qF2h1D0I3oJCInTKFYK7RxNlcpTjCJyavvekUw4G0A0dRTk/AkOgA09CVXaZL8P37k7ZoaxMtWlN2spI5TnSSKplK7E1jFvZugu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoM3USUq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711196161; x=1742732161;
  h=date:from:to:cc:subject:message-id;
  bh=bah9HJdA1zBPMKl7VZu9W+Q5hfYBF3uOE13WwOSi1Tk=;
  b=VoM3USUqWVBj7fP9qGEKGhLNo+g0n/pW6etXZ+qEA7WdQ4K+Y1Ehqidk
   jhx8VEr0ZSa4Sb3YDz36Rs+ewEsrM3UCIDbVX1RXmWnXAAvWmUdyay4ez
   X8+ji0+lxVn1RUbRJFNZZimQdC9h2K+rpYTzgexUTXD7EM6nSvJhN8smy
   UWb/M+8245yWes7QirY1mSBJJ8qqvESnM+6YCTjxgVQ0UNQeI9kRnV73x
   zxVRZbqQnavENpfmeulRPgHa9CRC7JburU41dLhsxTtbIHazm9PIudCQl
   UuxS+TusC+5jdlrISBSu0iaoHKieWxAeYiv1+z5Ikix2vQilEpncRIOUm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10032546"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="10032546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 05:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15609976"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2024 05:15:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro0I0-000L95-00;
	Sat, 23 Mar 2024 12:15:56 +0000
Date: Sat, 23 Mar 2024 20:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 8e031f4ce7f07ddeaeb74c8570803d258a6e3131
Message-ID: <202403232008.IkPlMEDN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 8e031f4ce7f07ddeaeb74c8570803d258a6e3131  media: ov2740: Add IMMUTABLE route flag

elapsed time: 893m

configs tested: 147
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
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240323   gcc  
arc                   randconfig-002-20240323   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240323   clang
arm                   randconfig-002-20240323   clang
arm                   randconfig-003-20240323   clang
arm                   randconfig-004-20240323   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240323   gcc  
arm64                 randconfig-002-20240323   gcc  
arm64                 randconfig-003-20240323   clang
arm64                 randconfig-004-20240323   clang
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240323   gcc  
csky                  randconfig-002-20240323   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240323   clang
hexagon               randconfig-002-20240323   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240323   gcc  
i386         buildonly-randconfig-002-20240323   clang
i386         buildonly-randconfig-003-20240323   clang
i386         buildonly-randconfig-004-20240323   gcc  
i386         buildonly-randconfig-005-20240323   gcc  
i386         buildonly-randconfig-006-20240323   clang
i386                                defconfig   clang
i386                  randconfig-001-20240323   clang
i386                  randconfig-002-20240323   clang
i386                  randconfig-003-20240323   gcc  
i386                  randconfig-004-20240323   gcc  
i386                  randconfig-005-20240323   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240323   gcc  
loongarch             randconfig-002-20240323   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                 decstation_r4k_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240323   gcc  
nios2                 randconfig-002-20240323   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240323   gcc  
parisc                randconfig-002-20240323   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240323   gcc  
powerpc               randconfig-002-20240323   gcc  
powerpc               randconfig-003-20240323   clang
powerpc                      tqm8xx_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240323   clang
powerpc64             randconfig-002-20240323   clang
powerpc64             randconfig-003-20240323   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_k210_defconfig   clang
riscv                 randconfig-001-20240323   clang
riscv                 randconfig-002-20240323   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240323   clang
s390                  randconfig-002-20240323   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240323   gcc  
sh                    randconfig-002-20240323   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240323   gcc  
sparc64               randconfig-002-20240323   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240323   gcc  
um                    randconfig-002-20240323   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240323   gcc  
xtensa                randconfig-002-20240323   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


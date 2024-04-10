Return-Path: <linux-media+bounces-8958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF089E876
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 05:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52621284E0E
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 03:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3680BC129;
	Wed, 10 Apr 2024 03:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNXBdMzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A359C122
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712720135; cv=none; b=VWJeXKWYfVl/8q8kl4da8UQ5VBCW/GWlusZAT/LMfxkxLecw//LfCiGZzYIlLoxbTRPZHRNPHtyVEnfrVbO1Tanqlu3YvspN+zLLXruXGvMJsXEU32rEIENhrjgBfOpdwcHDkiv+7FChHFYfZC6WPoPbmKBHQAQFV6QAVtDldEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712720135; c=relaxed/simple;
	bh=2zoF4zAokF1dotbaTXRicC9GJBqFXrCmO98eVnlFsCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CYuT1f7OOcl1jAGv7JwaAeUfeZNkksT40HHj6QULFn5wP7Nk9g2Rbs8y/W+11IOC/t/LylzdiDsutOsDcAGBzZ/OViKyHl45zFHm/80hMYegFmTXBuqJYar94a4FjeX2pywkQTKIjzpQuttpI/u4x5hPTiVsJSTyZ8/IE5TXYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNXBdMzD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712720133; x=1744256133;
  h=date:from:to:cc:subject:message-id;
  bh=2zoF4zAokF1dotbaTXRicC9GJBqFXrCmO98eVnlFsCY=;
  b=jNXBdMzDYytIeTt2SNSnL+CT9EUA6kkMFg9quiyVkTOFVp8ys+3vLSMd
   qsTDz49+V7AHumMpRdOv3xd0t8U1XFPFOjtFn0jHWCNylX9owq1QDBp0p
   dPx7lCeZmCyqoClHl4roO+CapczodLZcasEh7sm/U4yclC2to2a8A8bws
   nYWaWhYXhiE8enHUo06Ot5+gM5yKVZyWTkS1Nqu49YX5qBcUBzJ2UweT3
   vhdb5n9eol9JnSCRrMTtashm+Oew0hH9QoCVqnfsexMA3ZB2BBgqmXDjL
   NZVhBwFnmkRDaUnoDoT6XD1fndjirTL3T3vFs3V9PW4gH1Ohsn7ItOCYl
   g==;
X-CSE-ConnectionGUID: F//EHfbQSYCQZevlH00plA==
X-CSE-MsgGUID: PyNPigxlS72X0W29IYMC9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8232150"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8232150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:35:32 -0700
X-CSE-ConnectionGUID: 05Q6IGEwQqOevCIQ7gMORQ==
X-CSE-MsgGUID: 8tkH0qOlTDes6z7OLX5XWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20856843"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2024 20:35:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruOkC-0006kW-2L;
	Wed, 10 Apr 2024 03:35:28 +0000
Date: Wed, 10 Apr 2024 11:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 3a375a90df85acbcc18eaed7be259a24ffd8a172
Message-ID: <202404101113.tLlC65Jv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 3a375a90df85acbcc18eaed7be259a24ffd8a172  media: v4l2-subdev: Fix stream handling for crop API

elapsed time: 1255m

configs tested: 216
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
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240409   gcc  
arc                   randconfig-001-20240410   gcc  
arc                   randconfig-002-20240409   gcc  
arc                   randconfig-002-20240410   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-001-20240410   gcc  
arm                   randconfig-003-20240410   gcc  
arm                   randconfig-004-20240409   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-002-20240410   gcc  
arm64                 randconfig-003-20240410   gcc  
arm64                 randconfig-004-20240410   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240409   gcc  
csky                  randconfig-001-20240410   gcc  
csky                  randconfig-002-20240409   gcc  
csky                  randconfig-002-20240410   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240410   gcc  
i386         buildonly-randconfig-003-20240409   gcc  
i386         buildonly-randconfig-005-20240409   gcc  
i386         buildonly-randconfig-005-20240410   gcc  
i386         buildonly-randconfig-006-20240409   gcc  
i386         buildonly-randconfig-006-20240410   gcc  
i386                                defconfig   clang
i386                  randconfig-002-20240409   gcc  
i386                  randconfig-003-20240410   gcc  
i386                  randconfig-004-20240409   gcc  
i386                  randconfig-004-20240410   gcc  
i386                  randconfig-005-20240409   gcc  
i386                  randconfig-005-20240410   gcc  
i386                  randconfig-011-20240409   gcc  
i386                  randconfig-013-20240410   gcc  
i386                  randconfig-015-20240409   gcc  
i386                  randconfig-015-20240410   gcc  
i386                  randconfig-016-20240410   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240409   gcc  
loongarch             randconfig-001-20240410   gcc  
loongarch             randconfig-002-20240409   gcc  
loongarch             randconfig-002-20240410   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240409   gcc  
nios2                 randconfig-001-20240410   gcc  
nios2                 randconfig-002-20240409   gcc  
nios2                 randconfig-002-20240410   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240409   gcc  
parisc                randconfig-001-20240410   gcc  
parisc                randconfig-002-20240409   gcc  
parisc                randconfig-002-20240410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-001-20240410   gcc  
powerpc               randconfig-002-20240409   gcc  
powerpc               randconfig-002-20240410   gcc  
powerpc               randconfig-003-20240410   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240409   gcc  
powerpc64             randconfig-001-20240410   gcc  
powerpc64             randconfig-002-20240410   gcc  
powerpc64             randconfig-003-20240409   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240410   gcc  
riscv                 randconfig-002-20240409   gcc  
riscv                 randconfig-002-20240410   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240409   gcc  
s390                  randconfig-002-20240409   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240409   gcc  
sh                    randconfig-001-20240410   gcc  
sh                    randconfig-002-20240409   gcc  
sh                    randconfig-002-20240410   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240409   gcc  
sparc64               randconfig-001-20240410   gcc  
sparc64               randconfig-002-20240409   gcc  
sparc64               randconfig-002-20240410   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240409   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240409   clang
x86_64       buildonly-randconfig-002-20240409   clang
x86_64       buildonly-randconfig-002-20240410   clang
x86_64       buildonly-randconfig-003-20240410   clang
x86_64       buildonly-randconfig-005-20240409   clang
x86_64       buildonly-randconfig-005-20240410   clang
x86_64       buildonly-randconfig-006-20240409   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240409   clang
x86_64                randconfig-001-20240410   clang
x86_64                randconfig-002-20240409   clang
x86_64                randconfig-003-20240410   clang
x86_64                randconfig-004-20240410   clang
x86_64                randconfig-005-20240409   clang
x86_64                randconfig-006-20240409   clang
x86_64                randconfig-006-20240410   clang
x86_64                randconfig-012-20240409   clang
x86_64                randconfig-014-20240409   clang
x86_64                randconfig-014-20240410   clang
x86_64                randconfig-016-20240410   clang
x86_64                randconfig-072-20240409   clang
x86_64                randconfig-072-20240410   clang
x86_64                randconfig-073-20240409   clang
x86_64                randconfig-074-20240409   clang
x86_64                randconfig-074-20240410   clang
x86_64                randconfig-075-20240409   clang
x86_64                randconfig-076-20240410   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240409   gcc  
xtensa                randconfig-001-20240410   gcc  
xtensa                randconfig-002-20240409   gcc  
xtensa                randconfig-002-20240410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


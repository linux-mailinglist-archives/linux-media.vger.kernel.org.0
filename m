Return-Path: <linux-media+bounces-10674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FA8BA948
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8299B1F219ED
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC41514D29C;
	Fri,  3 May 2024 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoP7KZrw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C381D52B
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714726767; cv=none; b=QvtFPTAfSGLBAOcmD0D8CGWwIFRAOx/mrzDhXMU7GnwAAZA+ShihhvOMoWugCDfV/3wY904eZPRmVqlEWA9IS1C1pcjtCtMY7INsImQZthZKqwXIWjFQApIWwS4Ak4KYKZ1NikV921wOxQE7J/7RIjCEisKLQcjV0WWqfAbvtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714726767; c=relaxed/simple;
	bh=p9FCTv8RiScFcrNWA/tZX3kcZ2sMO876spdpu6rXpyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdQ2H084rbpEzUrPmZWeUDna3eHeh8/Nz2Nc/ybUremn2dzSfS4rZwYh+5KXTIyqCTcSjhZFakXjq6g/6tD7Va+nyb+MeEjw4tYrG6cKP2RtXPy9Wy5jIcow2S8ItP16pkhVrE2tRV75HZ41juJMUeoC2bGXLZtWxP/hcnWo1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoP7KZrw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714726765; x=1746262765;
  h=date:from:to:cc:subject:message-id;
  bh=p9FCTv8RiScFcrNWA/tZX3kcZ2sMO876spdpu6rXpyo=;
  b=NoP7KZrwIGPCH5hcO2/sw8q+ZC4YqkJ/uI+e3BtOy2tgr+jCR3gl64iF
   vgmEkXuNQ8E+Gr6mfGzH5p0RSglDkZTfko4+F+725OE4DoN5r/7HP5BZF
   DAB5QBHwp7Ua2hohkYNtubZf81Ai5TbVZvXXdn/OIc6iROyXTlltDQUUu
   hINf5mudrJvV3uxyBR0fcagm+DpWuFN5FOPy5VGaqxVM3CsEh4KGAQYOy
   QZ0bOCjt7iJuynjfRWO+UpKUzjpY23IaYhZmcR27ZnXLSfF2yezwDX+B8
   7pmJ5au9/ZmwqlA0c0spzeBBgP8KNNKD1+2hQUGWneSMDKLyKuoWKFHaI
   w==;
X-CSE-ConnectionGUID: so7bbPJjQ+2MMHP/2igQEw==
X-CSE-MsgGUID: 8pyAKosFSw+RgUN0b3wLWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13477942"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="13477942"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 01:59:24 -0700
X-CSE-ConnectionGUID: wu+IeBvRQSa0pg9N8gSueg==
X-CSE-MsgGUID: TuCiRQRbRZi5niNmo1uWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="32075852"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 May 2024 01:59:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2olE-000BWA-2l;
	Fri, 03 May 2024 08:59:20 +0000
Date: Fri, 03 May 2024 16:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 f7c78a803c97d389acf11e777f08e1db1e96c8f7
Message-ID: <202405031648.taCG61qr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: f7c78a803c97d389acf11e777f08e1db1e96c8f7  media: ivsc: csi: Fix link frequency control behaviour

elapsed time: 1466m

configs tested: 177
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
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240503   gcc  
arc                   randconfig-002-20240503   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240503   clang
arm                   randconfig-002-20240503   clang
arm                   randconfig-003-20240503   clang
arm                   randconfig-004-20240503   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         s5pv210_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240503   clang
arm64                 randconfig-002-20240503   gcc  
arm64                 randconfig-003-20240503   clang
arm64                 randconfig-004-20240503   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240503   gcc  
csky                  randconfig-002-20240503   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240503   clang
hexagon               randconfig-002-20240503   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240503   clang
i386         buildonly-randconfig-002-20240503   clang
i386         buildonly-randconfig-003-20240503   gcc  
i386         buildonly-randconfig-004-20240503   gcc  
i386         buildonly-randconfig-005-20240503   gcc  
i386         buildonly-randconfig-006-20240503   clang
i386                                defconfig   clang
i386                  randconfig-001-20240503   gcc  
i386                  randconfig-002-20240503   clang
i386                  randconfig-003-20240503   clang
i386                  randconfig-004-20240503   gcc  
i386                  randconfig-005-20240503   clang
i386                  randconfig-006-20240503   clang
i386                  randconfig-011-20240503   clang
i386                  randconfig-012-20240503   gcc  
i386                  randconfig-013-20240503   gcc  
i386                  randconfig-014-20240503   gcc  
i386                  randconfig-015-20240503   gcc  
i386                  randconfig-016-20240503   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240503   gcc  
loongarch             randconfig-002-20240503   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240503   gcc  
nios2                 randconfig-002-20240503   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240503   gcc  
parisc                randconfig-002-20240503   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                      makalu_defconfig   clang
powerpc               randconfig-001-20240503   clang
powerpc               randconfig-002-20240503   clang
powerpc               randconfig-003-20240503   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240503   clang
powerpc64             randconfig-002-20240503   clang
powerpc64             randconfig-003-20240503   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240503   gcc  
riscv                 randconfig-002-20240503   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240503   gcc  
s390                  randconfig-002-20240503   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240503   gcc  
sh                    randconfig-002-20240503   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240503   gcc  
sparc64               randconfig-002-20240503   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240503   clang
um                    randconfig-002-20240503   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240503   gcc  
x86_64       buildonly-randconfig-002-20240503   gcc  
x86_64       buildonly-randconfig-003-20240503   gcc  
x86_64       buildonly-randconfig-004-20240503   clang
x86_64       buildonly-randconfig-005-20240503   gcc  
x86_64       buildonly-randconfig-006-20240503   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240503   clang
x86_64                randconfig-002-20240503   clang
x86_64                randconfig-003-20240503   clang
x86_64                randconfig-004-20240503   gcc  
x86_64                randconfig-005-20240503   gcc  
x86_64                randconfig-006-20240503   clang
x86_64                randconfig-011-20240503   clang
x86_64                randconfig-012-20240503   clang
x86_64                randconfig-013-20240503   clang
x86_64                randconfig-014-20240503   clang
x86_64                randconfig-015-20240503   clang
x86_64                randconfig-016-20240503   clang
x86_64                randconfig-071-20240503   clang
x86_64                randconfig-072-20240503   clang
x86_64                randconfig-073-20240503   clang
x86_64                randconfig-074-20240503   clang
x86_64                randconfig-075-20240503   clang
x86_64                randconfig-076-20240503   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240503   gcc  
xtensa                randconfig-002-20240503   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


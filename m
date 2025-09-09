Return-Path: <linux-media+bounces-42049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69705B49E7A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 03:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D35C1B2520A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 01:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C55721ABC9;
	Tue,  9 Sep 2025 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhOnAc+G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3C33F3
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757379825; cv=none; b=ee1kI7NQehyW4ygA84pbRKf4YPBVtD5BcjuUxRR/GuK471mbPhHc3h5TQytO5rXz8Oj3X6llVYeQBuInuq0VkYAg8B9ZwOrAZ4TCJ9invfMc4ld/o7JoWXmv1Y3I1SflSAgGe0yImme7zKjkZGsaNVf5nHEHsl9wWIgajEp2m+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757379825; c=relaxed/simple;
	bh=Fh9BRERESERhm8RYNa8MqFp/3KxKQ817iS0I9HXELXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E20IJyn4JOEJMhiJLtfZpuOayt95JgtUXqVAUq6gvbgTuK19hPXloYfDnvzJBwK1s1Il3fc9XliGjdseXTp76bBWTgTwPgr12vLl9fYca4vzxySroITjUXC5cAIbJSkUwvo7/GHZoFkFrKiqzG4eGwZCLxykH/MfIiOGPblFC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhOnAc+G; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757379823; x=1788915823;
  h=date:from:to:cc:subject:message-id;
  bh=Fh9BRERESERhm8RYNa8MqFp/3KxKQ817iS0I9HXELXM=;
  b=BhOnAc+GDD4ezNV2ARPWWA72v5hMotHb4l/Do97sm+M3AZCpYFFCL1a9
   UAk7dm+Es33mro6SK+dfGb3YXGLKQl3wcHt/OxgKFomAzP5K6iWQ8p48I
   wwfNxXA28cPGXldaYQSO5cUshFKRQzq5g7ITWzu4Rp+QY8zqSCwH/FtIL
   zM5j35Tdvu8F6ISevTnamFswRxXMT5rsFJ4sDorBmhprMzcjzOFFkTYoE
   ZYSst9zjL9Er4FvJs7EbAxKAjt4+Z57h95eh1hhE9ZQeI3GAfYxg0O7+A
   AYvf33hbs3OOYa8qJIKlkrGeB9p3zVTjJrBvXwPknGTu/ICJigXn4eW2K
   g==;
X-CSE-ConnectionGUID: zLc6yQI6S4yAtYsrKmLmzw==
X-CSE-MsgGUID: NvvjZN+9Sg6Mozjv8TTVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59719245"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59719245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:03:42 -0700
X-CSE-ConnectionGUID: dLtnlFdBTGiKvVeNog1Psw==
X-CSE-MsgGUID: URgz/V0wRA+vqp+4Tes87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173409871"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 18:03:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvmlm-0004IA-39;
	Tue, 09 Sep 2025 01:03:38 +0000
Date: Tue, 09 Sep 2025 09:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 17de12296f2640f4e8d1a04aacb4b51f570692ed
Message-ID: <202509090918.7XF00CdI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 17de12296f2640f4e8d1a04aacb4b51f570692ed  media: i2c: add ov2735 image sensor driver

elapsed time: 1072m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250908    gcc-8.5.0
arc                   randconfig-002-20250908    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250908    clang-22
arm                   randconfig-002-20250908    clang-22
arm                   randconfig-003-20250908    gcc-12.5.0
arm                   randconfig-004-20250908    gcc-14.3.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250908    clang-20
arm64                 randconfig-002-20250908    clang-16
arm64                 randconfig-003-20250908    gcc-9.5.0
arm64                 randconfig-004-20250908    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250908    gcc-14.3.0
csky                  randconfig-002-20250908    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250908    clang-17
hexagon               randconfig-002-20250908    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-13
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250908    gcc-13
i386        buildonly-randconfig-002-20250908    gcc-13
i386        buildonly-randconfig-003-20250908    gcc-13
i386        buildonly-randconfig-004-20250908    gcc-13
i386        buildonly-randconfig-005-20250908    clang-20
i386        buildonly-randconfig-006-20250908    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250908    gcc-15.1.0
loongarch             randconfig-002-20250908    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250908    gcc-8.5.0
nios2                 randconfig-002-20250908    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250908    gcc-13.4.0
parisc                randconfig-002-20250908    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250908    gcc-15.1.0
powerpc               randconfig-002-20250908    clang-19
powerpc               randconfig-003-20250908    gcc-9.5.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250908    gcc-8.5.0
powerpc64             randconfig-002-20250908    gcc-10.5.0
powerpc64             randconfig-003-20250908    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250908    gcc-11.5.0
riscv                 randconfig-002-20250908    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250908    clang-22
s390                  randconfig-002-20250908    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250908    gcc-14.3.0
sh                    randconfig-002-20250908    gcc-14.3.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250908    gcc-8.5.0
sparc                 randconfig-002-20250908    gcc-12.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250908    gcc-13.4.0
sparc64               randconfig-002-20250908    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250908    gcc-13
um                    randconfig-002-20250908    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250909    clang-20
x86_64      buildonly-randconfig-002-20250909    clang-20
x86_64      buildonly-randconfig-003-20250909    gcc-13
x86_64      buildonly-randconfig-004-20250909    clang-20
x86_64      buildonly-randconfig-005-20250909    gcc-13
x86_64      buildonly-randconfig-006-20250909    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250908    gcc-9.5.0
xtensa                randconfig-002-20250908    gcc-11.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


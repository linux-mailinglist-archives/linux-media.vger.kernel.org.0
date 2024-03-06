Return-Path: <linux-media+bounces-6536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D732872D3D
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 04:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516491C22F2D
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 03:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E5EDF44;
	Wed,  6 Mar 2024 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldQx3FDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E126FBD
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 03:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709694430; cv=none; b=ISLwKQAnzDS4yL+w8QAis9isPEJS88/tkqWviIQe8SYGj+hLYA11YqLzoc1LlkwdqN14HctJqRIQra9Cfe8llL7Qs37MOJduQKAmqMXIXGUkbdIfY0G80oqeuHaw4OsGnkpt889uEGfjPCv7gB6aK23o6Qnd0hHuRqnsDbwPLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709694430; c=relaxed/simple;
	bh=2DxrbsXl6PLDAJTpjUYCuXdq7vjyfsE7tg07LKq0/cw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5KaoUvTyzPhC/Hj/osFmlMOF1vTUB8vj8KtwGKvcVUi02ViFzjuxpSBh3Xtl0TtyQidh2wCeQnpF20pU8n99jSuGXi5kAFsB4ysE3kfXvJvirXelAu44JLv2/xXNoBMxTso7f/SrVUeh36s8NnLOaabXXagHKOdeuEGQoyx/14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldQx3FDW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709694429; x=1741230429;
  h=date:from:to:cc:subject:message-id;
  bh=2DxrbsXl6PLDAJTpjUYCuXdq7vjyfsE7tg07LKq0/cw=;
  b=ldQx3FDWXsemRKpTyn/KfKfj1CdPaRyzHAr1T+ubCkIgBCdpXjC7KGk4
   cID9zp90hAEiMccd0Jn6LtPgoV2+JjhSz/c08X/c9gfuucDr82q08crQI
   nldzKpF+EUz6AJsu26bdKZuiBEpWcaWN+YgwPQodvwpk1wFdRoxx8in43
   FiU8ykPMMOCCCEB+t8koOsNjVTHVaq8OF4Kq8lN40/WtjUJOok5OFfJ6i
   8zQitDxujtxeO90bvet9qgS4nOtrG5DHiKjENokpJNILp4SrQ5K24Vs+l
   TRtxgHpQ3/+Yq+JA8W907U5zth/U2dJgCSu764H6RrkA9DvNzz8jI8Z7N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4461449"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4461449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 19:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9503688"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 19:07:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhhcX-0003rV-0h;
	Wed, 06 Mar 2024 03:07:05 +0000
Date: Wed, 06 Mar 2024 11:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 bec16f91adad937244277c1505893599c64c9297
Message-ID: <202403061145.sjzgp3DF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: bec16f91adad937244277c1505893599c64c9297  ACPI: property: Polish ignoring bad data nodes

elapsed time: 1224m

configs tested: 138
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
arc                   randconfig-001-20240306   gcc  
arc                   randconfig-002-20240306   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240306   gcc  
arm                   randconfig-002-20240306   clang
arm                   randconfig-003-20240306   clang
arm                   randconfig-004-20240306   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240306   gcc  
arm64                 randconfig-002-20240306   clang
arm64                 randconfig-003-20240306   gcc  
arm64                 randconfig-004-20240306   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240306   gcc  
csky                  randconfig-002-20240306   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240306   clang
hexagon               randconfig-002-20240306   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240306   clang
i386         buildonly-randconfig-002-20240306   clang
i386         buildonly-randconfig-003-20240306   gcc  
i386         buildonly-randconfig-004-20240306   clang
i386         buildonly-randconfig-005-20240306   clang
i386         buildonly-randconfig-006-20240306   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240306   gcc  
i386                  randconfig-002-20240306   clang
i386                  randconfig-003-20240306   clang
i386                  randconfig-004-20240306   clang
i386                  randconfig-005-20240306   gcc  
i386                  randconfig-006-20240306   clang
i386                  randconfig-011-20240306   clang
i386                  randconfig-012-20240306   clang
i386                  randconfig-013-20240306   gcc  
i386                  randconfig-014-20240306   gcc  
i386                  randconfig-015-20240306   clang
i386                  randconfig-016-20240306   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240306   gcc  
loongarch             randconfig-002-20240306   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
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
nios2                 randconfig-001-20240306   gcc  
nios2                 randconfig-002-20240306   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240306   gcc  
parisc                randconfig-002-20240306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240306   gcc  
powerpc               randconfig-002-20240306   gcc  
powerpc               randconfig-003-20240306   clang
powerpc64             randconfig-001-20240306   gcc  
powerpc64             randconfig-002-20240306   clang
powerpc64             randconfig-003-20240306   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240306   clang
riscv                 randconfig-002-20240306   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240306   clang
s390                  randconfig-002-20240306   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240306   gcc  
sh                    randconfig-002-20240306   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240306   gcc  
sparc64               randconfig-002-20240306   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240306   gcc  
um                    randconfig-002-20240306   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


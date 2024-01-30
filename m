Return-Path: <linux-media+bounces-4379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BC841755
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 01:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F2F285B62
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 00:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A02111E;
	Tue, 30 Jan 2024 00:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5X0ie7a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD1125CA
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 00:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706573484; cv=none; b=GyWom38HiFN4MmVwPTgS9+Jkx07/+wGBcJChDtJzvde/IlQKmtuCOHRYrVXDd+wIedUe1um/IRLg/lQoxmhFtInTZcQEwK2gFRlWT+CcmHwee49N9ZvVx5601SkD73PbKtg6Vz2zc20EvpEOV/qijg34E21B+2jYIhsXT6Z3ri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706573484; c=relaxed/simple;
	bh=oRBMcsmnvxQ+rEKDK0Kl4zxHR1bCAcNuaJikxuT+RqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HDKU8jMgf4W/+PH4VvQqfeASGO89UJbB/YcrLPXUllfifZUMFUNMSf8dwbx2xWnjUOyaVQje5+wz3TzMb4E61QJt82H8FOwLBb2Lx6Gw44EpJkU+uvzg3xiM0c3WiJ0igSOhL8Vgs28ygGZvvV5R3q8uSq+NToy8D8VWUePWXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5X0ie7a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706573483; x=1738109483;
  h=date:from:to:cc:subject:message-id;
  bh=oRBMcsmnvxQ+rEKDK0Kl4zxHR1bCAcNuaJikxuT+RqQ=;
  b=O5X0ie7a6kxsxxpFdmgxUVjD1qhKp4/gSS5xbCS9ODKYovVT+073iN3Q
   jBzWb6ptmL6uZm4yKDbuPv5ntXTwicTATXPpPf1tVyjIppM6nMENVbi2a
   U7WlViyCGzaI7piQtLout5SJpekloJI54QE9T+QKHGHTd5ETkG0MPsdt8
   oNEZijH+7eeWjS0swo+7hOqh0+PXs81rteR6r81OFph9Ot5eorZc1rYM6
   AC1AiDNpvecm82sybloMfIONrTaEcQ+OmmbbHBFqFfVtweXua7qz0+YLX
   KqZMLoihzVzEJdNPEvxHfOnp27rO48kK0VvHhuHY4n1mJR065kvc8l4pA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16506456"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="16506456"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 16:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29962887"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 16:11:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUbig-0004kI-20;
	Tue, 30 Jan 2024 00:11:18 +0000
Date: Tue, 30 Jan 2024 08:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 c8282f7b8523a4d37e5fefa220d93f2be06650e2
Message-ID: <202401300805.AOvIXdeR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: c8282f7b8523a4d37e5fefa220d93f2be06650e2  Merge tag 'v6.8-rc2'

elapsed time: 879m

configs tested: 273
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-001-20240130   gcc  
arc                   randconfig-002-20240129   gcc  
arc                   randconfig-002-20240130   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                         axm55xx_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-001-20240130   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-002-20240130   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-003-20240130   gcc  
arm                   randconfig-004-20240129   gcc  
arm                   randconfig-004-20240130   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240129   gcc  
arm64                 randconfig-001-20240130   gcc  
arm64                 randconfig-002-20240129   gcc  
arm64                 randconfig-002-20240130   gcc  
arm64                 randconfig-003-20240129   gcc  
arm64                 randconfig-003-20240130   gcc  
arm64                 randconfig-004-20240129   gcc  
arm64                 randconfig-004-20240130   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240129   gcc  
csky                  randconfig-001-20240130   gcc  
csky                  randconfig-002-20240129   gcc  
csky                  randconfig-002-20240130   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240129   gcc  
i386         buildonly-randconfig-002-20240129   gcc  
i386         buildonly-randconfig-003-20240129   gcc  
i386         buildonly-randconfig-004-20240129   gcc  
i386         buildonly-randconfig-005-20240129   gcc  
i386         buildonly-randconfig-006-20240129   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240129   gcc  
i386                  randconfig-002-20240129   gcc  
i386                  randconfig-003-20240129   gcc  
i386                  randconfig-004-20240129   gcc  
i386                  randconfig-005-20240129   gcc  
i386                  randconfig-006-20240129   gcc  
i386                  randconfig-011-20240129   clang
i386                  randconfig-011-20240130   clang
i386                  randconfig-012-20240129   clang
i386                  randconfig-012-20240130   clang
i386                  randconfig-013-20240129   clang
i386                  randconfig-013-20240130   clang
i386                  randconfig-014-20240129   clang
i386                  randconfig-014-20240130   clang
i386                  randconfig-015-20240129   clang
i386                  randconfig-015-20240130   clang
i386                  randconfig-016-20240129   clang
i386                  randconfig-016-20240130   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240129   gcc  
loongarch             randconfig-001-20240130   gcc  
loongarch             randconfig-002-20240129   gcc  
loongarch             randconfig-002-20240130   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                          rm200_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240129   gcc  
nios2                 randconfig-001-20240130   gcc  
nios2                 randconfig-002-20240129   gcc  
nios2                 randconfig-002-20240130   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240129   gcc  
parisc                randconfig-001-20240130   gcc  
parisc                randconfig-002-20240129   gcc  
parisc                randconfig-002-20240130   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc               randconfig-001-20240129   gcc  
powerpc               randconfig-001-20240130   gcc  
powerpc               randconfig-002-20240129   gcc  
powerpc               randconfig-002-20240130   gcc  
powerpc               randconfig-003-20240129   gcc  
powerpc               randconfig-003-20240130   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240129   gcc  
powerpc64             randconfig-001-20240130   gcc  
powerpc64             randconfig-002-20240129   gcc  
powerpc64             randconfig-002-20240130   gcc  
powerpc64             randconfig-003-20240129   gcc  
powerpc64             randconfig-003-20240130   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240129   gcc  
riscv                 randconfig-001-20240130   gcc  
riscv                 randconfig-002-20240129   gcc  
riscv                 randconfig-002-20240130   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240129   gcc  
sh                    randconfig-001-20240130   gcc  
sh                    randconfig-002-20240129   gcc  
sh                    randconfig-002-20240130   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240129   gcc  
sparc64               randconfig-001-20240130   gcc  
sparc64               randconfig-002-20240129   gcc  
sparc64               randconfig-002-20240130   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240129   gcc  
um                    randconfig-001-20240130   gcc  
um                    randconfig-002-20240129   gcc  
um                    randconfig-002-20240130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240129   gcc  
x86_64       buildonly-randconfig-001-20240130   gcc  
x86_64       buildonly-randconfig-002-20240129   gcc  
x86_64       buildonly-randconfig-002-20240130   gcc  
x86_64       buildonly-randconfig-003-20240129   gcc  
x86_64       buildonly-randconfig-003-20240130   gcc  
x86_64       buildonly-randconfig-004-20240129   gcc  
x86_64       buildonly-randconfig-004-20240130   gcc  
x86_64       buildonly-randconfig-005-20240129   gcc  
x86_64       buildonly-randconfig-005-20240130   gcc  
x86_64       buildonly-randconfig-006-20240129   gcc  
x86_64       buildonly-randconfig-006-20240130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240129   clang
x86_64                randconfig-002-20240129   clang
x86_64                randconfig-003-20240129   clang
x86_64                randconfig-004-20240129   clang
x86_64                randconfig-005-20240129   clang
x86_64                randconfig-006-20240129   clang
x86_64                randconfig-011-20240129   gcc  
x86_64                randconfig-011-20240130   gcc  
x86_64                randconfig-012-20240129   gcc  
x86_64                randconfig-012-20240130   gcc  
x86_64                randconfig-013-20240129   gcc  
x86_64                randconfig-013-20240130   gcc  
x86_64                randconfig-014-20240129   gcc  
x86_64                randconfig-014-20240130   gcc  
x86_64                randconfig-015-20240129   gcc  
x86_64                randconfig-015-20240130   gcc  
x86_64                randconfig-016-20240129   gcc  
x86_64                randconfig-016-20240130   gcc  
x86_64                randconfig-071-20240129   gcc  
x86_64                randconfig-071-20240130   gcc  
x86_64                randconfig-072-20240129   gcc  
x86_64                randconfig-072-20240130   gcc  
x86_64                randconfig-073-20240129   gcc  
x86_64                randconfig-073-20240130   gcc  
x86_64                randconfig-074-20240129   gcc  
x86_64                randconfig-074-20240130   gcc  
x86_64                randconfig-075-20240129   gcc  
x86_64                randconfig-075-20240130   gcc  
x86_64                randconfig-076-20240129   gcc  
x86_64                randconfig-076-20240130   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240129   gcc  
xtensa                randconfig-001-20240130   gcc  
xtensa                randconfig-002-20240129   gcc  
xtensa                randconfig-002-20240130   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


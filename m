Return-Path: <linux-media+bounces-4850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714384D9C6
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 07:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5B91C23778
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 06:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A2267C6D;
	Thu,  8 Feb 2024 06:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikcV616R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DC867E61
	for <linux-media@vger.kernel.org>; Thu,  8 Feb 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707372573; cv=none; b=RRJjDZ9R5LOjVcneaTC16JLijxUjEV6ART+bDnCHNrWIuRbTfTc80yXYSG7i+AI6tpihMeCKU3E6yxfNiZJnFh1IX4g5mTQt8oMpFVi3keBfJaCS4JMwkE02oKXwmT06XTR+rio8g0pd2sVH4fwWrekZzVpG41T5qR3wzKgTFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707372573; c=relaxed/simple;
	bh=+VMaCIo4WTuG6g9dAAnWlwMJrE4w/KgAD+vvDvqV2vI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UkCflyS4mrFA8y+h5qCFTbZ0i2CePZW5kPpgii62OJJQHIgiz+AOZIu14v79WnH5GOf+RPVBkdwyZJz6T/W1FryYRvZ3EuBddp9a3tCVUTLg5xGgQg2mqa8lm7a4q9FDX7LEelvDZZPPb81aSg7sPwbeZ8HHXemnuwdyO44NU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikcV616R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707372571; x=1738908571;
  h=date:from:to:cc:subject:message-id;
  bh=+VMaCIo4WTuG6g9dAAnWlwMJrE4w/KgAD+vvDvqV2vI=;
  b=ikcV616RiLNAaVnR7jnO9vH8N1jDsy15m629hD38MOkWGwdRSOpC4BxB
   cWAWFMMKkLu9U2B4tCs0wfw1RvVs+RCfoIsyylw6iZOKFRFhNrKvmUkAa
   TVyLc2rTXjaPvQIXvpSaNznbvibs0i4N6hpu+t9IyT/dDfSxkxyjFc4/n
   Ari22b/mMmmjiO/p5bueWZtaIcX7yuv8Y8FtJ5WpoQsn0rqpC09V8Gkct
   1yPYd1ViDk2Bd5xskQr5XPzqCvLN0e+f/JGoiwH09bROimIjTPTMewt5p
   pfJfYIf7WbIbDgpksJNjKaSjqHw78wuhZ4s6wxZQ97PA82+nKYFd9YmOZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11731084"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11731084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 22:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1553378"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2024 22:09:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXxbC-0003Q2-1r;
	Thu, 08 Feb 2024 06:09:26 +0000
Date: Thu, 08 Feb 2024 14:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
Message-ID: <202402081417.ROD8XAqM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5  media: edia: dvbdev: fix a use-after-free

elapsed time: 1450m

configs tested: 245
configs skipped: 4

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
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-001-20240208   gcc  
arc                   randconfig-002-20240207   gcc  
arc                   randconfig-002-20240208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240207   clang
arm                   randconfig-001-20240208   gcc  
arm                   randconfig-002-20240207   clang
arm                   randconfig-002-20240208   gcc  
arm                   randconfig-003-20240207   clang
arm                   randconfig-003-20240208   gcc  
arm                   randconfig-004-20240207   gcc  
arm                        shmobile_defconfig   gcc  
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240207   clang
arm64                 randconfig-002-20240207   clang
arm64                 randconfig-003-20240207   clang
arm64                 randconfig-004-20240207   clang
arm64                 randconfig-004-20240208   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-001-20240208   gcc  
csky                  randconfig-002-20240207   gcc  
csky                  randconfig-002-20240208   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240207   clang
hexagon               randconfig-002-20240207   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240207   clang
i386         buildonly-randconfig-001-20240208   gcc  
i386         buildonly-randconfig-002-20240207   clang
i386         buildonly-randconfig-003-20240207   clang
i386         buildonly-randconfig-003-20240208   gcc  
i386         buildonly-randconfig-004-20240207   clang
i386         buildonly-randconfig-004-20240208   gcc  
i386         buildonly-randconfig-005-20240207   clang
i386         buildonly-randconfig-005-20240208   gcc  
i386         buildonly-randconfig-006-20240207   clang
i386         buildonly-randconfig-006-20240208   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-001-20240208   gcc  
i386                  randconfig-002-20240207   clang
i386                  randconfig-002-20240208   gcc  
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-003-20240208   gcc  
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-005-20240208   gcc  
i386                  randconfig-006-20240207   clang
i386                  randconfig-006-20240208   gcc  
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240207   gcc  
i386                  randconfig-016-20240208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-001-20240208   gcc  
loongarch             randconfig-002-20240207   gcc  
loongarch             randconfig-002-20240208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm63xx_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-001-20240208   gcc  
nios2                 randconfig-002-20240207   gcc  
nios2                 randconfig-002-20240208   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-001-20240208   gcc  
parisc                randconfig-002-20240207   gcc  
parisc                randconfig-002-20240208   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                       eiger_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                     mpc83xx_defconfig   clang
powerpc                      pcm030_defconfig   clang
powerpc               randconfig-001-20240207   clang
powerpc               randconfig-002-20240207   clang
powerpc               randconfig-002-20240208   gcc  
powerpc               randconfig-003-20240207   gcc  
powerpc               randconfig-003-20240208   gcc  
powerpc64                        alldefconfig   clang
powerpc64             randconfig-001-20240207   clang
powerpc64             randconfig-001-20240208   gcc  
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-002-20240208   gcc  
powerpc64             randconfig-003-20240207   gcc  
powerpc64             randconfig-003-20240208   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240207   clang
riscv                 randconfig-001-20240208   gcc  
riscv                 randconfig-002-20240207   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
s390                  randconfig-002-20240208   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-001-20240208   gcc  
sh                    randconfig-002-20240207   gcc  
sh                    randconfig-002-20240208   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-001-20240208   gcc  
sparc64               randconfig-002-20240207   gcc  
sparc64               randconfig-002-20240208   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240207   clang
um                    randconfig-002-20240207   gcc  
um                    randconfig-002-20240208   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240207   clang
x86_64       buildonly-randconfig-002-20240207   clang
x86_64       buildonly-randconfig-003-20240207   gcc  
x86_64       buildonly-randconfig-003-20240208   gcc  
x86_64       buildonly-randconfig-004-20240207   clang
x86_64       buildonly-randconfig-005-20240207   clang
x86_64       buildonly-randconfig-006-20240207   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240207   clang
x86_64                randconfig-001-20240208   gcc  
x86_64                randconfig-002-20240207   gcc  
x86_64                randconfig-002-20240208   gcc  
x86_64                randconfig-003-20240207   gcc  
x86_64                randconfig-003-20240208   gcc  
x86_64                randconfig-004-20240207   gcc  
x86_64                randconfig-005-20240207   clang
x86_64                randconfig-005-20240208   gcc  
x86_64                randconfig-006-20240207   clang
x86_64                randconfig-006-20240208   gcc  
x86_64                randconfig-011-20240207   clang
x86_64                randconfig-011-20240208   gcc  
x86_64                randconfig-012-20240207   gcc  
x86_64                randconfig-012-20240208   gcc  
x86_64                randconfig-013-20240207   clang
x86_64                randconfig-014-20240207   clang
x86_64                randconfig-015-20240207   gcc  
x86_64                randconfig-016-20240207   gcc  
x86_64                randconfig-071-20240207   gcc  
x86_64                randconfig-072-20240207   clang
x86_64                randconfig-073-20240207   clang
x86_64                randconfig-073-20240208   gcc  
x86_64                randconfig-074-20240207   gcc  
x86_64                randconfig-075-20240207   gcc  
x86_64                randconfig-075-20240208   gcc  
x86_64                randconfig-076-20240207   clang
x86_64                randconfig-076-20240208   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-001-20240208   gcc  
xtensa                randconfig-002-20240207   gcc  
xtensa                randconfig-002-20240208   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


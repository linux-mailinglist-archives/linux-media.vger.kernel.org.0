Return-Path: <linux-media+bounces-16352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DB9537B3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3920F282916
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1C41B150D;
	Thu, 15 Aug 2024 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4j5te1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17C15E88
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737456; cv=none; b=qYINtNrzCS8BMD87cIx5jPT1byvY/tCNbfHnK5WmIaxFLJCmLE+4Htiv+HPqPPUWlwhAlfnWKmfpsyXsKjYWfeb6U3D2UPkKQdcCMK1NX01nhpg704nlB6bIw9g+RJnrmmP9SLkZ3L8gCZ/1WUM9HaiJsTB6OpQH4mAKJhrnwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737456; c=relaxed/simple;
	bh=32VsR2G0h8SvZS3+br87F350Y1RnnnXKWS/3wat8vY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHosfz1noJKq/lRk7YhB7UepiDLbLtrW9zmtHhMCQgr874Y7H0ztBO6LplUs6EFGPVj/0YSMLKFIq4NQPADmdCP9XPGUAz44wLcZM9gsLNHlAMaGUvbovBntRtVpXOtJC7y+1bHrtfIM14pU8YeVtn7HjJqHJ2fYrHDPjVZUiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4j5te1a; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723737455; x=1755273455;
  h=date:from:to:cc:subject:message-id;
  bh=32VsR2G0h8SvZS3+br87F350Y1RnnnXKWS/3wat8vY8=;
  b=I4j5te1aEi2Fya0Q9TtiqfpNtB9KJrgOKayhFZ1m+vORSDahdV5s/eZj
   hcPRusen2kFl0AekiWjF1bvS/iKcSba2BL3b9sfOpklxmVeu0mRIFY+jQ
   yeZlfdVT1TNVsl1pViCAXemVLvTPvXxp1CQRN7UNSflHltYUZZYTMLRt7
   vlUr0Ji50ciaMYM8zKldsZAmZ5gdk19lHA8Zhor5Jd02CJUTA0L9HXqaq
   tee9KuOS3SHU6uzpZrJxbdIVH4JrkUlSHqOKXDtrqyS22e/K+r/9FyWG8
   JkE4kB3GJVwrZLishT2GUmLFOSYWZa1M2pWGNK1ulp8vXZ+y6enzct3a8
   g==;
X-CSE-ConnectionGUID: o3jcLGotS/CrbzDSSrChAA==
X-CSE-MsgGUID: GxMmRX20SAO2JlnR5+ZeQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22143499"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="22143499"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 08:57:33 -0700
X-CSE-ConnectionGUID: NjDRXzHVQZaxMizagkm3yA==
X-CSE-MsgGUID: e68BCMLORW+8lJR/zr4ACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="60174860"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Aug 2024 08:57:32 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1secqv-0003pC-0d;
	Thu, 15 Aug 2024 15:57:29 +0000
Date: Thu, 15 Aug 2024 23:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 a043ea54bbb975ca9239c69fd17f430488d33522
Message-ID: <202408152308.ue2RQAJK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: a043ea54bbb975ca9239c69fd17f430488d33522  Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git

elapsed time: 1445m

configs tested: 190
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240815   gcc-13.2.0
arc                   randconfig-002-20240815   gcc-13.2.0
arm                              alldefconfig   gcc-14.1.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                        clps711x_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-14.1.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                   randconfig-001-20240815   gcc-13.2.0
arm                   randconfig-002-20240815   gcc-13.2.0
arm                   randconfig-003-20240815   gcc-13.2.0
arm                   randconfig-004-20240815   gcc-13.2.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240815   gcc-13.2.0
arm64                 randconfig-002-20240815   gcc-13.2.0
arm64                 randconfig-003-20240815   gcc-13.2.0
arm64                 randconfig-004-20240815   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240815   gcc-13.2.0
csky                  randconfig-002-20240815   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240815   gcc-12
i386         buildonly-randconfig-002-20240815   gcc-12
i386         buildonly-randconfig-003-20240815   gcc-12
i386         buildonly-randconfig-004-20240815   gcc-12
i386         buildonly-randconfig-005-20240815   gcc-12
i386         buildonly-randconfig-006-20240815   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240815   gcc-12
i386                  randconfig-002-20240815   gcc-12
i386                  randconfig-003-20240815   gcc-12
i386                  randconfig-004-20240815   gcc-12
i386                  randconfig-005-20240815   gcc-12
i386                  randconfig-006-20240815   gcc-12
i386                  randconfig-011-20240815   gcc-12
i386                  randconfig-012-20240815   gcc-12
i386                  randconfig-013-20240815   gcc-12
i386                  randconfig-014-20240815   gcc-12
i386                  randconfig-015-20240815   gcc-12
i386                  randconfig-016-20240815   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240815   gcc-13.2.0
loongarch             randconfig-002-20240815   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                  cavium_octeon_defconfig   gcc-14.1.0
mips                           ci20_defconfig   gcc-14.1.0
mips                  decstation_64_defconfig   gcc-14.1.0
mips                           ip30_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-14.1.0
mips                          rm200_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240815   gcc-13.2.0
nios2                 randconfig-002-20240815   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240815   gcc-13.2.0
parisc                randconfig-002-20240815   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                        cell_defconfig   gcc-14.1.0
powerpc                  mpc885_ads_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240815   gcc-13.2.0
powerpc               randconfig-002-20240815   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-14.1.0
powerpc                     tqm8548_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240815   gcc-13.2.0
powerpc64             randconfig-002-20240815   gcc-13.2.0
powerpc64             randconfig-003-20240815   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240815   gcc-13.2.0
riscv                 randconfig-002-20240815   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240815   gcc-13.2.0
s390                  randconfig-002-20240815   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                    randconfig-001-20240815   gcc-13.2.0
sh                    randconfig-002-20240815   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-14.1.0
sh                           se7750_defconfig   gcc-14.1.0
sh                   sh7724_generic_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc64_defconfig   gcc-14.1.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240815   gcc-13.2.0
sparc64               randconfig-002-20240815   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240815   gcc-13.2.0
um                    randconfig-002-20240815   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240815   gcc-12
x86_64       buildonly-randconfig-002-20240815   gcc-12
x86_64       buildonly-randconfig-003-20240815   gcc-12
x86_64       buildonly-randconfig-004-20240815   gcc-12
x86_64       buildonly-randconfig-005-20240815   gcc-12
x86_64       buildonly-randconfig-006-20240815   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240815   gcc-12
x86_64                randconfig-002-20240815   gcc-12
x86_64                randconfig-003-20240815   gcc-12
x86_64                randconfig-004-20240815   gcc-12
x86_64                randconfig-005-20240815   gcc-12
x86_64                randconfig-006-20240815   gcc-12
x86_64                randconfig-011-20240815   gcc-12
x86_64                randconfig-012-20240815   gcc-12
x86_64                randconfig-013-20240815   gcc-12
x86_64                randconfig-014-20240815   gcc-12
x86_64                randconfig-015-20240815   gcc-12
x86_64                randconfig-016-20240815   gcc-12
x86_64                randconfig-071-20240815   gcc-12
x86_64                randconfig-072-20240815   gcc-12
x86_64                randconfig-073-20240815   gcc-12
x86_64                randconfig-074-20240815   gcc-12
x86_64                randconfig-075-20240815   gcc-12
x86_64                randconfig-076-20240815   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240815   gcc-13.2.0
xtensa                randconfig-002-20240815   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


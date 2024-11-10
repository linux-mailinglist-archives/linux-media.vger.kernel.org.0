Return-Path: <linux-media+bounces-21214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF79C3105
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 07:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144B31F215DE
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 06:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1179314884D;
	Sun, 10 Nov 2024 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH1yo9gK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8B13B58F
	for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731219160; cv=none; b=INUgzaae0fi2hf69ct9kEMxK+6WVfhLOyiQmFK9Y0ghHarbjrGTqoooIAr2fGhYYfz/k15t1NfKTpRdqfurLJmm5vbrjiJft1zXHESAnIIzZ7Ba/KgvoCugghrgo/JInQ7JUA/Xp1eWCKVGs5dzdeXsvW+MyVzNp60sL+VDAb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731219160; c=relaxed/simple;
	bh=20izWPQ3URHsuJ0mLso9TyUUEEOFgNOvyz5lCH8qTUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TRWt6h35CgaEIJA9ocb4f/QajJZfWFUQXk/noiPkQiA3UgRIO/gntbKd/shgLzuJnVFZMDWYgaSuzhYVCaua59VzINXaprsiT9hxAScV3UIiYVvhX9aS96Bd+kllbnfQhIbEFuKexC/uxpDWfgRSptIrJWBtkLj1hS8/JiCIj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH1yo9gK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731219159; x=1762755159;
  h=date:from:to:cc:subject:message-id;
  bh=20izWPQ3URHsuJ0mLso9TyUUEEOFgNOvyz5lCH8qTUM=;
  b=nH1yo9gKem3LD8lkAoD5hUlG5n6NW2XaQ5p9IrqirSimozhbWW4gxqu1
   mQkpZE6HzOIINcCvXr3kTrHOHANF+cyKoD3jogVacsEvjRoEPxWkGmo6n
   twLf1nzjyZMmfXKkqDjnAlshQKGnLNOyfHMUEiqhEvoSnifA9Nbnyz2Tt
   gjSLW5olhmqcR5c5hLGQUokAXDufEDL/0Wy1pLfi1xydNZbtgOPs2jJc/
   /p6GctF1qqhi817dGOwCQvowBsWHSxGgAcf1SsxmhPqtYhsBpE2Xpa1oF
   Pa3/LB0sts7wA1QaXyqonCdJhYY2LN1uUY77GjrsmS2ptus/9xcxEFOEY
   w==;
X-CSE-ConnectionGUID: xFDfH/CjRY6m0d2kXGT6sA==
X-CSE-MsgGUID: j+I9+H7kT+KRHGUhr9ZQ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="18674784"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="18674784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 22:12:38 -0800
X-CSE-ConnectionGUID: XGKjONvhQdOW85jhczwOyA==
X-CSE-MsgGUID: H9zr1LgKTcSQwdvXSbBP7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86399122"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2024 22:12:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA1Ba-000tJ4-2C;
	Sun, 10 Nov 2024 06:12:34 +0000
Date: Sun, 10 Nov 2024 14:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 ecf2b43018da9579842c774b7f35dbe11b5c38dd
Message-ID: <202411101450.Vpnicoy9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: ecf2b43018da9579842c774b7f35dbe11b5c38dd  media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format

elapsed time: 1019m

configs tested: 308
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    gcc-14.2.0
arc                   randconfig-001-20241109    gcc-13.2.0
arc                   randconfig-001-20241110    gcc-14.2.0
arc                   randconfig-002-20241109    gcc-13.2.0
arc                   randconfig-002-20241110    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          exynos_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                           h3600_defconfig    clang-15
arm                            hisi_defconfig    clang-15
arm                           imxrt_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-20
arm                   randconfig-001-20241109    gcc-14.2.0
arm                   randconfig-001-20241110    gcc-14.2.0
arm                   randconfig-002-20241109    clang-16
arm                   randconfig-002-20241110    gcc-14.2.0
arm                   randconfig-003-20241109    clang-20
arm                   randconfig-003-20241110    gcc-14.2.0
arm                   randconfig-004-20241109    gcc-14.2.0
arm                   randconfig-004-20241110    gcc-14.2.0
arm                           sama5_defconfig    clang-20
arm                           sama7_defconfig    clang-15
arm                           spitz_defconfig    clang-15
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241109    clang-14
arm64                 randconfig-001-20241110    gcc-14.2.0
arm64                 randconfig-002-20241109    gcc-14.2.0
arm64                 randconfig-002-20241110    gcc-14.2.0
arm64                 randconfig-003-20241109    clang-20
arm64                 randconfig-003-20241110    gcc-14.2.0
arm64                 randconfig-004-20241109    clang-14
arm64                 randconfig-004-20241110    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241109    gcc-14.2.0
csky                  randconfig-001-20241110    gcc-14.2.0
csky                  randconfig-002-20241109    gcc-14.2.0
csky                  randconfig-002-20241110    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241110    gcc-14.2.0
hexagon               randconfig-002-20241109    clang-20
hexagon               randconfig-002-20241110    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241109    gcc-12
i386        buildonly-randconfig-001-20241110    gcc-11
i386        buildonly-randconfig-002-20241109    clang-19
i386        buildonly-randconfig-002-20241110    gcc-11
i386        buildonly-randconfig-003-20241109    gcc-12
i386        buildonly-randconfig-003-20241110    gcc-11
i386        buildonly-randconfig-004-20241109    gcc-12
i386        buildonly-randconfig-004-20241110    gcc-11
i386        buildonly-randconfig-005-20241109    clang-19
i386        buildonly-randconfig-005-20241110    gcc-11
i386        buildonly-randconfig-006-20241109    clang-19
i386        buildonly-randconfig-006-20241110    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241109    clang-19
i386                  randconfig-001-20241110    gcc-11
i386                  randconfig-002-20241109    clang-19
i386                  randconfig-002-20241110    gcc-11
i386                  randconfig-003-20241109    gcc-12
i386                  randconfig-003-20241110    gcc-11
i386                  randconfig-004-20241109    clang-19
i386                  randconfig-004-20241110    gcc-11
i386                  randconfig-005-20241109    clang-19
i386                  randconfig-005-20241110    gcc-11
i386                  randconfig-006-20241109    clang-19
i386                  randconfig-006-20241110    gcc-11
i386                  randconfig-011-20241109    gcc-12
i386                  randconfig-011-20241110    gcc-11
i386                  randconfig-012-20241109    clang-19
i386                  randconfig-012-20241110    gcc-11
i386                  randconfig-013-20241109    clang-19
i386                  randconfig-013-20241110    gcc-11
i386                  randconfig-014-20241109    clang-19
i386                  randconfig-014-20241110    gcc-11
i386                  randconfig-015-20241109    gcc-11
i386                  randconfig-015-20241110    gcc-11
i386                  randconfig-016-20241109    clang-19
i386                  randconfig-016-20241110    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    clang-15
loongarch             randconfig-001-20241109    gcc-14.2.0
loongarch             randconfig-001-20241110    gcc-14.2.0
loongarch             randconfig-002-20241109    gcc-14.2.0
loongarch             randconfig-002-20241110    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-15
mips                         db1xxx_defconfig    clang-15
mips                           mtx1_defconfig    clang-20
mips                          rb532_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241109    gcc-14.2.0
nios2                 randconfig-001-20241110    gcc-14.2.0
nios2                 randconfig-002-20241109    gcc-14.2.0
nios2                 randconfig-002-20241110    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241109    gcc-14.2.0
parisc                randconfig-001-20241110    gcc-14.2.0
parisc                randconfig-002-20241109    gcc-14.2.0
parisc                randconfig-002-20241110    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    clang-20
powerpc                       ebony_defconfig    clang-15
powerpc                       eiger_defconfig    clang-15
powerpc                        fsp2_defconfig    clang-15
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-15
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    clang-15
powerpc               randconfig-001-20241109    gcc-14.2.0
powerpc               randconfig-001-20241110    gcc-14.2.0
powerpc               randconfig-002-20241110    gcc-14.2.0
powerpc               randconfig-003-20241109    clang-20
powerpc               randconfig-003-20241110    gcc-14.2.0
powerpc                     tqm8555_defconfig    clang-15
powerpc64             randconfig-001-20241109    clang-20
powerpc64             randconfig-001-20241110    gcc-14.2.0
powerpc64             randconfig-002-20241109    gcc-14.2.0
powerpc64             randconfig-002-20241110    gcc-14.2.0
powerpc64             randconfig-003-20241109    gcc-14.2.0
powerpc64             randconfig-003-20241110    gcc-14.2.0
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241109    gcc-14.2.0
riscv                 randconfig-001-20241110    gcc-14.2.0
riscv                 randconfig-002-20241109    clang-20
riscv                 randconfig-002-20241110    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    clang-20
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20241109    gcc-14.2.0
s390                  randconfig-001-20241110    gcc-14.2.0
s390                  randconfig-002-20241109    clang-20
s390                  randconfig-002-20241110    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    clang-15
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241109    gcc-14.2.0
sh                    randconfig-001-20241110    gcc-14.2.0
sh                    randconfig-002-20241109    gcc-14.2.0
sh                    randconfig-002-20241110    gcc-14.2.0
sh                          rsk7201_defconfig    clang-15
sh                          rsk7264_defconfig    clang-20
sh                           se7712_defconfig    gcc-14.2.0
sh                   sh7724_generic_defconfig    gcc-14.2.0
sh                              ul2_defconfig    clang-15
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241109    gcc-14.2.0
sparc64               randconfig-001-20241110    gcc-14.2.0
sparc64               randconfig-002-20241109    gcc-14.2.0
sparc64               randconfig-002-20241110    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241109    clang-16
um                    randconfig-001-20241110    gcc-14.2.0
um                    randconfig-002-20241109    clang-20
um                    randconfig-002-20241110    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241109    gcc-12
x86_64      buildonly-randconfig-001-20241110    gcc-12
x86_64      buildonly-randconfig-002-20241109    gcc-12
x86_64      buildonly-randconfig-002-20241110    gcc-12
x86_64      buildonly-randconfig-003-20241109    gcc-12
x86_64      buildonly-randconfig-003-20241110    gcc-12
x86_64      buildonly-randconfig-004-20241109    gcc-12
x86_64      buildonly-randconfig-004-20241110    gcc-12
x86_64      buildonly-randconfig-005-20241109    gcc-12
x86_64      buildonly-randconfig-005-20241110    gcc-12
x86_64      buildonly-randconfig-006-20241109    gcc-12
x86_64      buildonly-randconfig-006-20241110    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241109    gcc-12
x86_64                randconfig-001-20241110    gcc-12
x86_64                randconfig-002-20241109    gcc-12
x86_64                randconfig-002-20241110    gcc-12
x86_64                randconfig-003-20241109    gcc-12
x86_64                randconfig-003-20241110    gcc-12
x86_64                randconfig-004-20241109    gcc-12
x86_64                randconfig-004-20241110    gcc-12
x86_64                randconfig-005-20241109    gcc-12
x86_64                randconfig-005-20241110    gcc-12
x86_64                randconfig-006-20241109    gcc-12
x86_64                randconfig-006-20241110    gcc-12
x86_64                randconfig-011-20241109    gcc-12
x86_64                randconfig-011-20241110    gcc-12
x86_64                randconfig-012-20241109    gcc-12
x86_64                randconfig-012-20241110    gcc-12
x86_64                randconfig-013-20241109    gcc-12
x86_64                randconfig-013-20241110    gcc-12
x86_64                randconfig-014-20241109    gcc-12
x86_64                randconfig-014-20241110    gcc-12
x86_64                randconfig-015-20241109    gcc-12
x86_64                randconfig-015-20241110    gcc-12
x86_64                randconfig-016-20241109    gcc-12
x86_64                randconfig-016-20241110    gcc-12
x86_64                randconfig-071-20241109    gcc-12
x86_64                randconfig-071-20241110    gcc-12
x86_64                randconfig-072-20241109    gcc-12
x86_64                randconfig-072-20241110    gcc-12
x86_64                randconfig-073-20241109    gcc-12
x86_64                randconfig-073-20241110    gcc-12
x86_64                randconfig-074-20241109    gcc-12
x86_64                randconfig-074-20241110    gcc-12
x86_64                randconfig-075-20241109    gcc-12
x86_64                randconfig-075-20241110    gcc-12
x86_64                randconfig-076-20241109    gcc-12
x86_64                randconfig-076-20241110    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-20
xtensa                randconfig-001-20241109    gcc-14.2.0
xtensa                randconfig-001-20241110    gcc-14.2.0
xtensa                randconfig-002-20241109    gcc-14.2.0
xtensa                randconfig-002-20241110    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


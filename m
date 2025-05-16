Return-Path: <linux-media+bounces-32627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7792AB97C9
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCE41B61142
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 08:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CED22D7AD;
	Fri, 16 May 2025 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzXql0us"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC320C47F
	for <linux-media@vger.kernel.org>; Fri, 16 May 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747384583; cv=none; b=XhmrwMV5kSfg8JFrawJcRVfweDHf1Udd9SvSAyIsmAJNjvymbiubtyF64dRdE4Lm6d3SuCg8Rw4EWMQ+sii/C+9b3t2nxDtDAFywch38WUKAhcerPkAgbCFFx2dupkT6k9t7di6Ql1aWc/bDgHQOv5T/aEqLbmnSkMe9OuNwWls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747384583; c=relaxed/simple;
	bh=qqTsnM3FQT41dQGAOVtnfoWuOnTlhBxl9KILziZ/204=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7JH57VJIX4SYh8kBZ9Ts3rBk/0PD9jFBd7XC2sbsGhjwz4px1UqWuQmJQTiwsqVA36T+VFIl9gDxf+RUaYHSixgsNnTZhoJHBfRY5lN2Ecu611fd/8JPWGdZ+f47TBSX+cujzYES8uLLSu/Vm/+zvTXngNleqYG74/4tsim3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzXql0us; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747384582; x=1778920582;
  h=date:from:to:cc:subject:message-id;
  bh=qqTsnM3FQT41dQGAOVtnfoWuOnTlhBxl9KILziZ/204=;
  b=hzXql0usfo+/NbFlRrtrmd2MBSr33wfSWBaTpymn/5FjbiZQMCvgB4kI
   vV0aLujDmyx9jdnCRvvMuguTsk7TkBrVqFzCMQ3t9Ps7b4Uugf3k9MrVa
   9sGplAsoqGeMip4uAu9AKyDabFbdQT1c9mM9TdxDGwC5zMOL+E7E5kx32
   4dU3vw/93PDHGuq0qNbFWuJgvSoKU1+/wNQ4BelrNk3HgCmSoENSYrBUc
   pSiwxIbtTjFkwLdv9+rI4WztfgPrR1GWR7hVqdrCROfU4qZ0p0GgG4NJZ
   rH0nycQ+PvwoHWcN2QGxhMa+C8iwihciiII9mefWKbyTv7Y78ODwGwiEn
   w==;
X-CSE-ConnectionGUID: ASmJNkw3ReGrAEcF/xe7ZA==
X-CSE-MsgGUID: GX4NDGtsQkGEMKu75jebCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49044525"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49044525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 01:36:21 -0700
X-CSE-ConnectionGUID: lyD+ufPRQVSpHbTmMabiqw==
X-CSE-MsgGUID: 8dcRuRd4TrCa28eNdNhC8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143517912"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 01:36:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFqYC-000J9J-34;
	Fri, 16 May 2025 08:36:16 +0000
Date: Fri, 16 May 2025 16:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 5e1ff2314797bf53636468a97719a8222deca9ae
Message-ID: <202505161617.l9QpzWVS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 5e1ff2314797bf53636468a97719a8222deca9ae  media: rkvdec: h264: Support High 10 and 4:2:2 profiles

elapsed time: 1459m

configs tested: 256
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250515    gcc-12.4.0
arc                   randconfig-001-20250516    gcc-9.5.0
arc                   randconfig-002-20250515    gcc-14.2.0
arc                   randconfig-002-20250516    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-21
arm                      integrator_defconfig    clang-21
arm                            mps2_defconfig    clang-21
arm                         mv78xx0_defconfig    clang-19
arm                         orion5x_defconfig    clang-21
arm                   randconfig-001-20250515    clang-21
arm                   randconfig-001-20250516    gcc-9.5.0
arm                   randconfig-002-20250515    gcc-8.5.0
arm                   randconfig-002-20250516    gcc-9.5.0
arm                   randconfig-003-20250515    gcc-8.5.0
arm                   randconfig-003-20250516    gcc-9.5.0
arm                   randconfig-004-20250515    clang-21
arm                   randconfig-004-20250516    gcc-9.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250515    clang-21
arm64                 randconfig-001-20250516    gcc-9.5.0
arm64                 randconfig-002-20250515    clang-21
arm64                 randconfig-002-20250516    gcc-9.5.0
arm64                 randconfig-003-20250515    clang-20
arm64                 randconfig-003-20250516    gcc-9.5.0
arm64                 randconfig-004-20250515    gcc-6.5.0
arm64                 randconfig-004-20250516    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250515    gcc-14.2.0
csky                  randconfig-001-20250516    clang-21
csky                  randconfig-002-20250515    gcc-14.2.0
csky                  randconfig-002-20250516    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250515    clang-16
hexagon               randconfig-001-20250516    clang-21
hexagon               randconfig-002-20250515    clang-21
hexagon               randconfig-002-20250516    clang-21
i386                             alldefconfig    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250515    gcc-11
i386        buildonly-randconfig-001-20250516    clang-20
i386        buildonly-randconfig-002-20250515    gcc-12
i386        buildonly-randconfig-002-20250516    clang-20
i386        buildonly-randconfig-003-20250515    clang-20
i386        buildonly-randconfig-003-20250516    clang-20
i386        buildonly-randconfig-004-20250515    clang-20
i386        buildonly-randconfig-004-20250516    clang-20
i386        buildonly-randconfig-005-20250515    gcc-12
i386        buildonly-randconfig-005-20250516    clang-20
i386        buildonly-randconfig-006-20250515    gcc-11
i386        buildonly-randconfig-006-20250516    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250516    gcc-12
i386                  randconfig-002-20250516    gcc-12
i386                  randconfig-003-20250516    gcc-12
i386                  randconfig-004-20250516    gcc-12
i386                  randconfig-005-20250516    gcc-12
i386                  randconfig-006-20250516    gcc-12
i386                  randconfig-007-20250516    gcc-12
i386                  randconfig-011-20250516    gcc-12
i386                  randconfig-012-20250516    gcc-12
i386                  randconfig-013-20250516    gcc-12
i386                  randconfig-014-20250516    gcc-12
i386                  randconfig-015-20250516    gcc-12
i386                  randconfig-016-20250516    gcc-12
i386                  randconfig-017-20250516    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250515    gcc-12.4.0
loongarch             randconfig-001-20250516    clang-21
loongarch             randconfig-002-20250515    gcc-14.2.0
loongarch             randconfig-002-20250516    clang-21
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-21
m68k                          sun3x_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-21
mips                          eyeq5_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-21
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250515    gcc-12.4.0
nios2                 randconfig-001-20250516    clang-21
nios2                 randconfig-002-20250515    gcc-6.5.0
nios2                 randconfig-002-20250516    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250515    gcc-13.3.0
parisc                randconfig-001-20250516    clang-21
parisc                randconfig-002-20250515    gcc-13.3.0
parisc                randconfig-002-20250516    clang-21
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-21
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-21
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250515    gcc-8.5.0
powerpc               randconfig-001-20250516    clang-21
powerpc               randconfig-002-20250515    gcc-6.5.0
powerpc               randconfig-002-20250516    clang-21
powerpc               randconfig-003-20250515    clang-21
powerpc               randconfig-003-20250516    clang-21
powerpc                     sequoia_defconfig    clang-21
powerpc                     skiroot_defconfig    clang-21
powerpc64             randconfig-001-20250515    clang-21
powerpc64             randconfig-001-20250516    clang-21
powerpc64             randconfig-002-20250515    gcc-8.5.0
powerpc64             randconfig-002-20250516    clang-21
powerpc64             randconfig-003-20250515    clang-21
powerpc64             randconfig-003-20250516    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250515    gcc-8.5.0
riscv                 randconfig-001-20250516    gcc-7.5.0
riscv                 randconfig-002-20250515    gcc-14.2.0
riscv                 randconfig-002-20250516    gcc-7.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250515    clang-21
s390                  randconfig-001-20250516    gcc-7.5.0
s390                  randconfig-002-20250515    gcc-9.3.0
s390                  randconfig-002-20250516    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250515    gcc-14.2.0
sh                    randconfig-001-20250516    gcc-7.5.0
sh                    randconfig-002-20250515    gcc-10.5.0
sh                    randconfig-002-20250516    gcc-7.5.0
sh                            shmin_defconfig    clang-21
sh                              ul2_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250515    gcc-6.5.0
sparc                 randconfig-001-20250516    gcc-7.5.0
sparc                 randconfig-002-20250515    gcc-10.3.0
sparc                 randconfig-002-20250516    gcc-7.5.0
sparc                       sparc64_defconfig    clang-21
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250515    gcc-9.3.0
sparc64               randconfig-001-20250516    gcc-7.5.0
sparc64               randconfig-002-20250515    gcc-9.3.0
sparc64               randconfig-002-20250516    gcc-7.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250515    gcc-12
um                    randconfig-001-20250516    gcc-7.5.0
um                    randconfig-002-20250515    clang-21
um                    randconfig-002-20250516    gcc-7.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250515    clang-20
x86_64      buildonly-randconfig-001-20250516    gcc-12
x86_64      buildonly-randconfig-002-20250515    clang-20
x86_64      buildonly-randconfig-002-20250516    gcc-12
x86_64      buildonly-randconfig-003-20250515    clang-20
x86_64      buildonly-randconfig-003-20250516    gcc-12
x86_64      buildonly-randconfig-004-20250515    clang-20
x86_64      buildonly-randconfig-004-20250516    gcc-12
x86_64      buildonly-randconfig-005-20250515    clang-20
x86_64      buildonly-randconfig-005-20250516    gcc-12
x86_64      buildonly-randconfig-006-20250515    gcc-12
x86_64      buildonly-randconfig-006-20250516    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250516    gcc-12
x86_64                randconfig-002-20250516    gcc-12
x86_64                randconfig-003-20250516    gcc-12
x86_64                randconfig-004-20250516    gcc-12
x86_64                randconfig-005-20250516    gcc-12
x86_64                randconfig-006-20250516    gcc-12
x86_64                randconfig-007-20250516    gcc-12
x86_64                randconfig-008-20250516    gcc-12
x86_64                randconfig-071-20250516    clang-20
x86_64                randconfig-072-20250516    clang-20
x86_64                randconfig-073-20250516    clang-20
x86_64                randconfig-074-20250516    clang-20
x86_64                randconfig-075-20250516    clang-20
x86_64                randconfig-076-20250516    clang-20
x86_64                randconfig-077-20250516    clang-20
x86_64                randconfig-078-20250516    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250515    gcc-14.2.0
xtensa                randconfig-001-20250516    gcc-7.5.0
xtensa                randconfig-002-20250515    gcc-13.3.0
xtensa                randconfig-002-20250516    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


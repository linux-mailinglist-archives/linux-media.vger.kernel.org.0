Return-Path: <linux-media+bounces-20507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 178F09B45F5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 10:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42DA61C221EB
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0251204003;
	Tue, 29 Oct 2024 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iqpm8noe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A631DF989
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730195339; cv=none; b=A4pNEp1DwRZAq1S4h7dBne+foJAO7KGO2NLdGTAKu5lcxg5vP87d1450xFiEV+4Tivzot5qsqv9Ww/NVp/dOP9VusvXYFtAa+yLqizI6BEPKftcbdm3NynHl9ysvicZNtueO8iD1mwslcYXLPW6lVdBIQu8M2Hx1QGUeJ4ByGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730195339; c=relaxed/simple;
	bh=fD/LiiTuRQPBA7RfszyY9zWUTnktfTCYn6gpfuQUq40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bs/a39IsdsQQYPW52L3Q3TdVhyPkeliKzych4k4R0vWN9dfZTH/MBqff0LTK7npNJsKMLI4pXgH+ELj1ovwOSR5uou+yGlaZO7K3V7GKNJhNQs0Zi6Efiif374gBfmXjgu/7QJZX7Ok5NL+lpAPNzDQOK2hiXFx7SxIk3AIbMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iqpm8noe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730195335; x=1761731335;
  h=date:from:to:cc:subject:message-id;
  bh=fD/LiiTuRQPBA7RfszyY9zWUTnktfTCYn6gpfuQUq40=;
  b=Iqpm8noeyNB5OfIrYyPrb6NJ4HyRppBIYz7dTrMl0zDjn7OmmpTglHDZ
   tPwsqvb9ubrjAMWv8jdtdOvPRAcJkwil9XAiYOgXQD5r+rYEtj+Ey4qpi
   bi+N3ptF+SQ7KtJao0d4JA1RiOxhCHlTHJzvsAzYkmX/tROqgvNrwOeAe
   kKr/OfTLA9j4pMMAASlhWFUnTbWCwHYS5g3OdKqQBH/M/oY7F9SBl02jG
   fUA6LHyvzt5vznud5YvDlgIbczCYPvp+Eln8KaYBwIflEIaaDcj1ZUQOd
   GeAK+Be6Sb+RAkkWAg3Gp65jiqv2JawnzRdkEyNbBmjqOlYP4mPvwNpdm
   g==;
X-CSE-ConnectionGUID: mKNm6avxQh+KdnDVY8QGbQ==
X-CSE-MsgGUID: HhmANuIqT5qCZ8keZrvpIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47287181"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47287181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 02:48:54 -0700
X-CSE-ConnectionGUID: 8xS3plcWTqiWxjnmySpMOg==
X-CSE-MsgGUID: A2Ewy869TAOnmfRj359b7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86675734"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Oct 2024 02:48:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5iqI-000dVA-0H;
	Tue, 29 Oct 2024 09:48:50 +0000
Date: Tue, 29 Oct 2024 17:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 96d8569563916fe2f8fe17317e20e43f54f9ba4b
Message-ID: <202410291717.vzGjQmKe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 96d8569563916fe2f8fe17317e20e43f54f9ba4b  media: vivid: fix buffer overwrite when using > 32 buffers

elapsed time: 1205m

configs tested: 214
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-14.1.0
arc                   randconfig-001-20241029    gcc-14.1.0
arc                   randconfig-002-20241029    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         assabet_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            hisi_defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-13.2.0
arm                          moxart_defconfig    clang-14
arm                        mvebu_v7_defconfig    gcc-13.2.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                           omap1_defconfig    clang-14
arm                   randconfig-001-20241029    gcc-14.1.0
arm                   randconfig-002-20241029    gcc-14.1.0
arm                   randconfig-003-20241029    gcc-14.1.0
arm                   randconfig-004-20241029    gcc-14.1.0
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241029    gcc-14.1.0
arm64                 randconfig-002-20241029    gcc-14.1.0
arm64                 randconfig-003-20241029    gcc-14.1.0
arm64                 randconfig-004-20241029    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241029    gcc-14.1.0
csky                  randconfig-002-20241029    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241029    gcc-14.1.0
hexagon               randconfig-002-20241029    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241029    clang-19
i386        buildonly-randconfig-002-20241029    clang-19
i386        buildonly-randconfig-003-20241029    clang-19
i386        buildonly-randconfig-004-20241029    clang-19
i386        buildonly-randconfig-005-20241029    clang-19
i386        buildonly-randconfig-006-20241029    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241029    clang-19
i386                  randconfig-002-20241029    clang-19
i386                  randconfig-003-20241029    clang-19
i386                  randconfig-004-20241029    clang-19
i386                  randconfig-005-20241029    clang-19
i386                  randconfig-006-20241029    clang-19
i386                  randconfig-011-20241029    clang-19
i386                  randconfig-012-20241029    clang-19
i386                  randconfig-013-20241029    clang-19
i386                  randconfig-014-20241029    clang-19
i386                  randconfig-015-20241029    clang-19
i386                  randconfig-016-20241029    clang-19
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241029    gcc-14.1.0
loongarch             randconfig-002-20241029    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    gcc-13.2.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      maltaaprp_defconfig    clang-14
mips                        omega2p_defconfig    gcc-14.1.0
mips                       rbtx49xx_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241029    gcc-14.1.0
nios2                 randconfig-002-20241029    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241029    gcc-14.1.0
parisc                randconfig-002-20241029    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-13.2.0
powerpc                       holly_defconfig    clang-14
powerpc                       maple_defconfig    clang-14
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                  mpc885_ads_defconfig    clang-14
powerpc                      pcm030_defconfig    gcc-13.2.0
powerpc                      pmac32_defconfig    gcc-13.2.0
powerpc                     ppa8548_defconfig    gcc-13.2.0
powerpc                       ppc64_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241029    gcc-14.1.0
powerpc               randconfig-002-20241029    gcc-14.1.0
powerpc               randconfig-003-20241029    gcc-14.1.0
powerpc64             randconfig-001-20241029    gcc-14.1.0
powerpc64             randconfig-002-20241029    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-13.2.0
riscv                 randconfig-001-20241029    gcc-14.1.0
riscv                 randconfig-002-20241029    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-14
s390                                defconfig    gcc-12
s390                                defconfig    gcc-14.1.0
s390                  randconfig-001-20241029    gcc-14.1.0
s390                  randconfig-002-20241029    gcc-14.1.0
s390                       zfcpdump_defconfig    clang-14
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-13.2.0
sh                 kfr2r09-romimage_defconfig    clang-14
sh                    randconfig-001-20241029    gcc-14.1.0
sh                    randconfig-002-20241029    gcc-14.1.0
sh                          sdk7780_defconfig    gcc-13.2.0
sh                           se7780_defconfig    gcc-13.2.0
sh                             sh03_defconfig    clang-14
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241029    gcc-14.1.0
sparc64               randconfig-002-20241029    gcc-14.1.0
um                               alldefconfig    clang-14
um                               alldefconfig    gcc-13.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241029    gcc-14.1.0
um                    randconfig-002-20241029    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241029    clang-19
x86_64      buildonly-randconfig-002-20241029    clang-19
x86_64      buildonly-randconfig-003-20241029    clang-19
x86_64      buildonly-randconfig-004-20241029    clang-19
x86_64      buildonly-randconfig-005-20241029    clang-19
x86_64      buildonly-randconfig-006-20241029    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241029    clang-19
x86_64                randconfig-002-20241029    clang-19
x86_64                randconfig-003-20241029    clang-19
x86_64                randconfig-004-20241029    clang-19
x86_64                randconfig-005-20241029    clang-19
x86_64                randconfig-006-20241029    clang-19
x86_64                randconfig-011-20241029    clang-19
x86_64                randconfig-012-20241029    clang-19
x86_64                randconfig-013-20241029    clang-19
x86_64                randconfig-014-20241029    clang-19
x86_64                randconfig-015-20241029    clang-19
x86_64                randconfig-016-20241029    clang-19
x86_64                randconfig-071-20241029    clang-19
x86_64                randconfig-072-20241029    clang-19
x86_64                randconfig-073-20241029    clang-19
x86_64                randconfig-074-20241029    clang-19
x86_64                randconfig-075-20241029    clang-19
x86_64                randconfig-076-20241029    clang-19
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-13.2.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-14
xtensa                randconfig-001-20241029    gcc-14.1.0
xtensa                randconfig-002-20241029    gcc-14.1.0
xtensa                    xip_kc705_defconfig    clang-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


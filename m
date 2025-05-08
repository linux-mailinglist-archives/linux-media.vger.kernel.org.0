Return-Path: <linux-media+bounces-32012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 411ADAAF34C
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F0E4E4755
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 06:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4311FCD1F;
	Thu,  8 May 2025 06:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eU7weeb0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768671C4609
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 06:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684197; cv=none; b=uyoW3zCOAgiw0QC5PbpQwoF8wEzCT6BIgpJd3xSYqqU2hdMq1SoFY4jyIdZ+uwyOrL9dT80EikJlDo6Wh15+TC2t/2PMGjkpQ/Azk7kvNiz7Er7dNMt9pf5e7DgK8uKSsudZTxkh8pcTT6HvKuaOHuVxRodkkWwhcR8QfoPl/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684197; c=relaxed/simple;
	bh=NCZc/bIQKBgqSoiah1OfHi7UOU+9kT1tamnwMP3L9/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJm7eBU1bnVB3tVsmbwoAgtdRjPYfYyZ5U884WTai0ZuYzn8dv0OxrAIQh9rQo8BzGmcYcflsvbG8FVmBCQFfWgiHbJ24mQVJfVCPscOWSJkteyYKVUGNVgNu5hXqYpZ8nOnDpmlDnf118sVZ68+KcrFMCbaZfjyjKSkdMQL/2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eU7weeb0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746684195; x=1778220195;
  h=date:from:to:cc:subject:message-id;
  bh=NCZc/bIQKBgqSoiah1OfHi7UOU+9kT1tamnwMP3L9/k=;
  b=eU7weeb0o9CzB9BTKZuKBMJuYtQbHCWqChm45m+sIJkwWD7auk/gLCx9
   gBJ4ncr099mdD4tstQI6OxiAZEhlkbC/XBqEGdbx8ICCzRD4NPUt1WDxJ
   /YY7+D1QSHqexB1q+wFfXzVlBaAEGIDFVWMN4dqZ0DZbVaPYjA8gmlfW3
   zwEkx84jso2yGip2s+jMJeql8NYGuW1G8xymtsLCa0QgubiG10+9o2IzJ
   Kru6ABWSJjf/zp0UlRqgTM/GsNlBQbfKRXuThD5fY+tD3Mc5A39FkWZEN
   9XTQejht83wtQHs4Ht/oYPk7oeYvt/oF1dFQhHOk0ZHmvFFXm2qSSm7Ad
   A==;
X-CSE-ConnectionGUID: mvdRH+etQBSrF57hVx735w==
X-CSE-MsgGUID: pP5Nv1tKSzuz01nOfOaexw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48558191"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48558191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 23:03:14 -0700
X-CSE-ConnectionGUID: xtW4Bk63SgGCZCyZ+D8hdw==
X-CSE-MsgGUID: go84R1TfTECy/sZSYuvy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136205956"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 23:03:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCuLf-000AX7-29;
	Thu, 08 May 2025 06:03:11 +0000
Date: Thu, 08 May 2025 14:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:master] BUILD SUCCESS
 543f81b86cf4046c7454a05c741c491a4fac44dd
Message-ID: <202505081439.HqbfNvhJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git master
branch HEAD: 543f81b86cf4046c7454a05c741c491a4fac44dd  media: rc: add keymap for Hauppauge Credit Card RC

elapsed time: 11345m

configs tested: 278
configs skipped: 9

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
arc                   randconfig-001-20250430    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-8.5.0
arc                   randconfig-001-20250503    gcc-14.2.0
arc                   randconfig-002-20250430    gcc-14.2.0
arc                   randconfig-002-20250502    gcc-8.5.0
arc                   randconfig-002-20250503    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250430    gcc-10.5.0
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-001-20250503    gcc-6.5.0
arm                   randconfig-002-20250430    gcc-7.5.0
arm                   randconfig-002-20250502    gcc-8.5.0
arm                   randconfig-002-20250503    clang-21
arm                   randconfig-003-20250430    clang-21
arm                   randconfig-003-20250502    gcc-8.5.0
arm                   randconfig-003-20250503    gcc-6.5.0
arm                   randconfig-004-20250430    gcc-7.5.0
arm                   randconfig-004-20250502    gcc-8.5.0
arm                   randconfig-004-20250503    clang-21
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                            allyesconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250430    gcc-5.5.0
arm64                 randconfig-001-20250502    gcc-8.5.0
arm64                 randconfig-001-20250503    gcc-9.5.0
arm64                 randconfig-002-20250430    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-002-20250503    clang-21
arm64                 randconfig-003-20250430    gcc-5.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-003-20250503    clang-21
arm64                 randconfig-004-20250430    gcc-5.5.0
arm64                 randconfig-004-20250502    gcc-8.5.0
arm64                 randconfig-004-20250503    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-8.5.0
csky                  randconfig-001-20250503    gcc-14.2.0
csky                  randconfig-002-20250502    gcc-8.5.0
csky                  randconfig-002-20250503    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250502    gcc-8.5.0
hexagon               randconfig-001-20250503    clang-21
hexagon               randconfig-002-20250502    gcc-8.5.0
hexagon               randconfig-002-20250503    clang-16
i386                             alldefconfig    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250430    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    gcc-12
i386        buildonly-randconfig-002-20250430    gcc-12
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    gcc-12
i386        buildonly-randconfig-003-20250430    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    gcc-12
i386        buildonly-randconfig-004-20250430    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250430    clang-20
i386        buildonly-randconfig-005-20250502    clang-20
i386        buildonly-randconfig-005-20250503    gcc-12
i386        buildonly-randconfig-006-20250430    clang-20
i386        buildonly-randconfig-006-20250502    clang-20
i386        buildonly-randconfig-006-20250503    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250502    clang-20
i386                  randconfig-002-20250502    clang-20
i386                  randconfig-003-20250502    clang-20
i386                  randconfig-004-20250502    clang-20
i386                  randconfig-005-20250502    clang-20
i386                  randconfig-006-20250502    clang-20
i386                  randconfig-007-20250502    clang-20
i386                  randconfig-011-20250502    gcc-12
i386                  randconfig-012-20250502    gcc-12
i386                  randconfig-013-20250502    gcc-12
i386                  randconfig-014-20250502    gcc-12
i386                  randconfig-015-20250502    gcc-12
i386                  randconfig-016-20250502    gcc-12
i386                  randconfig-017-20250502    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                        allyesconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-8.5.0
loongarch             randconfig-001-20250503    gcc-14.2.0
loongarch             randconfig-002-20250502    gcc-8.5.0
loongarch             randconfig-002-20250503    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                             allmodconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                             allyesconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250502    gcc-8.5.0
nios2                 randconfig-001-20250503    gcc-11.5.0
nios2                 randconfig-002-20250502    gcc-8.5.0
nios2                 randconfig-002-20250503    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250502    gcc-8.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250502    gcc-8.5.0
parisc                randconfig-002-20250503    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250502    gcc-8.5.0
powerpc               randconfig-001-20250503    gcc-5.5.0
powerpc               randconfig-002-20250502    gcc-8.5.0
powerpc               randconfig-002-20250503    gcc-9.3.0
powerpc               randconfig-003-20250502    gcc-8.5.0
powerpc               randconfig-003-20250503    clang-21
powerpc64             randconfig-001-20250502    gcc-8.5.0
powerpc64             randconfig-001-20250503    gcc-7.5.0
powerpc64             randconfig-002-20250502    gcc-8.5.0
powerpc64             randconfig-002-20250503    gcc-10.5.0
powerpc64             randconfig-003-20250502    gcc-8.5.0
powerpc64             randconfig-003-20250503    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250430    gcc-7.5.0
riscv                 randconfig-001-20250502    gcc-13.3.0
riscv                 randconfig-002-20250430    gcc-9.3.0
riscv                 randconfig-002-20250502    gcc-13.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250430    clang-20
s390                  randconfig-001-20250502    gcc-13.3.0
s390                  randconfig-002-20250430    clang-21
s390                  randconfig-002-20250502    gcc-13.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250430    gcc-5.5.0
sh                    randconfig-001-20250502    gcc-13.3.0
sh                    randconfig-002-20250430    gcc-5.5.0
sh                    randconfig-002-20250502    gcc-13.3.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                            allyesconfig    gcc-14.2.0
sparc                 randconfig-001-20250430    gcc-10.3.0
sparc                 randconfig-001-20250502    gcc-13.3.0
sparc                 randconfig-002-20250430    gcc-14.2.0
sparc                 randconfig-002-20250502    gcc-13.3.0
sparc64                          allmodconfig    gcc-14.2.0
sparc64                          allyesconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250430    gcc-12.4.0
sparc64               randconfig-001-20250502    gcc-13.3.0
sparc64               randconfig-002-20250430    gcc-12.4.0
sparc64               randconfig-002-20250502    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250430    gcc-12
um                    randconfig-001-20250502    gcc-13.3.0
um                    randconfig-002-20250430    clang-16
um                    randconfig-002-20250502    gcc-13.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250430    clang-20
x86_64      buildonly-randconfig-001-20250502    clang-20
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250430    clang-20
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250430    gcc-12
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250430    clang-20
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-005-20250430    clang-20
x86_64      buildonly-randconfig-005-20250502    clang-20
x86_64      buildonly-randconfig-005-20250503    clang-20
x86_64      buildonly-randconfig-006-20250430    clang-20
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250502    clang-20
x86_64                randconfig-002-20250502    clang-20
x86_64                randconfig-003-20250502    clang-20
x86_64                randconfig-004-20250502    clang-20
x86_64                randconfig-005-20250502    clang-20
x86_64                randconfig-006-20250502    clang-20
x86_64                randconfig-007-20250502    clang-20
x86_64                randconfig-008-20250502    clang-20
x86_64                randconfig-071-20250502    clang-20
x86_64                randconfig-072-20250502    clang-20
x86_64                randconfig-073-20250502    clang-20
x86_64                randconfig-074-20250502    clang-20
x86_64                randconfig-075-20250502    clang-20
x86_64                randconfig-076-20250502    clang-20
x86_64                randconfig-077-20250502    clang-20
x86_64                randconfig-078-20250502    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                           allyesconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250430    gcc-8.5.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-002-20250430    gcc-10.5.0
xtensa                randconfig-002-20250502    gcc-13.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


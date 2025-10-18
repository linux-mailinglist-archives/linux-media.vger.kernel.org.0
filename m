Return-Path: <linux-media+bounces-44950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B8BECD12
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 12:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DA8B404CD4
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E8D2874E3;
	Sat, 18 Oct 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QABW8Eqg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2BA2BEC5E
	for <linux-media@vger.kernel.org>; Sat, 18 Oct 2025 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782778; cv=none; b=X3U1BymrJzKrzJvbM6zqo7Kg5BHaqAi1Jyy/0NSGkmEkZfyQOUG+c8HRbyKUK3oyyIcHjsbZrlcjQJkZzNAItvc5fjjCZ/2+8Ip2oQS0vdhLP5eHrn/A7TmcTkc+2DowrwCY8Jh8EVIROzkDAkK7edI9nmdf6HvdQOznb1pXREM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782778; c=relaxed/simple;
	bh=xgP+79R/iPEjkwHB+9kbqWkGV/bfUp4pBfg6MGuJ2kk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ravdgOgFG1+Hx1COFyCgJVfWK3nc0q8abahpA0dkF7wTZsUmK/2enzOgGamBylAV+D3gOeSW6kylMcXcloANy5bPo1H6ihRADgZFHdMEUyZ5mZqjRztjG8Fe6FE3s4C0J0skf16+dIwe+Pp89Dq/D4jiD6feP/rjOqJVbLqEm+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QABW8Eqg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760782776; x=1792318776;
  h=date:from:to:cc:subject:message-id;
  bh=xgP+79R/iPEjkwHB+9kbqWkGV/bfUp4pBfg6MGuJ2kk=;
  b=QABW8EqgFOYQBz6CeOYYiiIT3qIMCQCoA0sZFCvTel1IhBg+L9FlZ7IU
   FgzrfEeT9vhd4pabdnYMy7KbkM6nFW7dMzdpLXb/HpyvN0aoENyyn6Z0x
   9Ah6ubHZvNallJHHhpTAYa408iOcoY7FGSJUtWTTQCuwQNM8Ngp+BjlA6
   e07eZTjUROWrW1YgwmBu9DEVp24FokwzMG1tyHZubHu9BaKuIOtf3dyd+
   bGLLrxj+T55BaFyvwqhSUSCm7KDBSmSwCkVB7R5eRXydxHIWmbUZUvCLL
   Nm3UyqrKzVjfzjVQ/DOiGnWFu2yXYRuhXQYvdbDS6vpER1ssS/FNDPjJ/
   g==;
X-CSE-ConnectionGUID: sbrRZp1GSwSA3e48HhFCaQ==
X-CSE-MsgGUID: FwUgPrPoQ5OYsZ/Y7hZARA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74099875"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74099875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 03:19:35 -0700
X-CSE-ConnectionGUID: +qpEd6DeS62xLI+aM7lsLQ==
X-CSE-MsgGUID: y6HMTSdVRwqZwpgZCBZExA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="183341053"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2025 03:19:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA428-0008Dd-1R;
	Sat, 18 Oct 2025 10:19:32 +0000
Date: Sat, 18 Oct 2025 18:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8
Message-ID: <202510181818.qrMV929j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8  media: v4l2-mem2mem: Don't copy frame flags in v4l2_m2m_buf_copy_metadata()

elapsed time: 1452m

configs tested: 184
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251017    gcc-8.5.0
arc                   randconfig-002-20251017    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251017    gcc-15.1.0
arm                   randconfig-002-20251017    clang-22
arm                   randconfig-003-20251017    clang-22
arm                   randconfig-004-20251017    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251017    clang-20
arm64                 randconfig-002-20251017    clang-22
arm64                 randconfig-003-20251017    gcc-15.1.0
arm64                 randconfig-004-20251017    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251017    gcc-15.1.0
csky                  randconfig-002-20251017    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251017    clang-22
hexagon               randconfig-002-20251017    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251017    clang-20
i386        buildonly-randconfig-001-20251018    clang-20
i386        buildonly-randconfig-002-20251017    clang-20
i386        buildonly-randconfig-002-20251018    clang-20
i386        buildonly-randconfig-003-20251017    clang-20
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-004-20251017    clang-20
i386        buildonly-randconfig-004-20251018    clang-20
i386        buildonly-randconfig-005-20251017    clang-20
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-006-20251017    clang-20
i386        buildonly-randconfig-006-20251018    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251018    gcc-14
i386                  randconfig-002-20251018    gcc-14
i386                  randconfig-003-20251018    gcc-14
i386                  randconfig-004-20251018    gcc-14
i386                  randconfig-005-20251018    gcc-14
i386                  randconfig-006-20251018    gcc-14
i386                  randconfig-007-20251018    gcc-14
i386                  randconfig-011-20251018    clang-20
i386                  randconfig-012-20251018    clang-20
i386                  randconfig-013-20251018    clang-20
i386                  randconfig-014-20251018    clang-20
i386                  randconfig-015-20251018    clang-20
i386                  randconfig-016-20251018    clang-20
i386                  randconfig-017-20251018    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20251017    gcc-13.4.0
loongarch             randconfig-002-20251017    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251017    gcc-8.5.0
nios2                 randconfig-002-20251017    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251017    gcc-12.5.0
parisc                randconfig-002-20251017    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251017    gcc-14.3.0
powerpc               randconfig-002-20251017    clang-22
powerpc               randconfig-003-20251017    gcc-11.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251017    clang-20
powerpc64             randconfig-002-20251017    gcc-15.1.0
powerpc64             randconfig-003-20251017    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251018    gcc-8.5.0
riscv                 randconfig-002-20251018    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-002-20251018    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251018    gcc-13.4.0
sh                    randconfig-002-20251018    gcc-14.3.0
sh                           se7343_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251018    gcc-11.5.0
sparc                 randconfig-002-20251018    gcc-13.4.0
sparc64               randconfig-001-20251018    gcc-8.5.0
sparc64               randconfig-002-20251018    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                    randconfig-001-20251018    gcc-14
um                    randconfig-002-20251018    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251017    gcc-14
x86_64      buildonly-randconfig-001-20251018    clang-20
x86_64      buildonly-randconfig-002-20251017    gcc-14
x86_64      buildonly-randconfig-002-20251018    clang-20
x86_64      buildonly-randconfig-003-20251017    clang-20
x86_64      buildonly-randconfig-003-20251018    clang-20
x86_64      buildonly-randconfig-004-20251017    gcc-14
x86_64      buildonly-randconfig-004-20251018    clang-20
x86_64      buildonly-randconfig-005-20251017    clang-20
x86_64      buildonly-randconfig-005-20251018    clang-20
x86_64      buildonly-randconfig-006-20251017    clang-20
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251018    gcc-14
x86_64                randconfig-002-20251018    gcc-14
x86_64                randconfig-003-20251018    gcc-14
x86_64                randconfig-004-20251018    gcc-14
x86_64                randconfig-005-20251018    gcc-14
x86_64                randconfig-006-20251018    gcc-14
x86_64                randconfig-007-20251018    gcc-14
x86_64                randconfig-008-20251018    gcc-14
x86_64                randconfig-071-20251018    clang-20
x86_64                randconfig-072-20251018    clang-20
x86_64                randconfig-073-20251018    clang-20
x86_64                randconfig-074-20251018    clang-20
x86_64                randconfig-075-20251018    clang-20
x86_64                randconfig-076-20251018    clang-20
x86_64                randconfig-077-20251018    clang-20
x86_64                randconfig-078-20251018    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251018    gcc-13.4.0
xtensa                randconfig-002-20251018    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


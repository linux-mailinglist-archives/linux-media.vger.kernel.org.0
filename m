Return-Path: <linux-media+bounces-35065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82AADC979
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFBA165C88
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44222A819;
	Tue, 17 Jun 2025 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDRci0mf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA91A9B24
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160005; cv=none; b=udXA3DhttDId75qLbS9sF3ka68uMY+zLm0L737/FLhF7bF027Hm4iISz2u8n2Wt42a9p+Eu0cj0xsmkXuSD7iG51h6bOOJiG1Qfq3tLs2v00BTkhmtyJrdrQB7CBnH44YEDnSRd02IsvvbscOS3nm4ER3rUsol9y9mXrwoTkQZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160005; c=relaxed/simple;
	bh=xFKlE7/D4tdfLmOSy6X5m+UWtvMHEFTEYoJPSojQ/ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E8Cb+hvR3hRK72NXR2U5Nac5r/es4MDqsVutXBvcjdPQ1X4G5xMB5BhQB/0PufPoK1i9Ud9zUqwWBjKJXT+Dwez1e+xKlAKDwIPqzLTtSYl0prS3Soga+lX4fnKErEgr3T67VQTT9xNOSZYPmpzzxSeG3GjkvxCcMx+L11U/dw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDRci0mf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750160004; x=1781696004;
  h=date:from:to:cc:subject:message-id;
  bh=xFKlE7/D4tdfLmOSy6X5m+UWtvMHEFTEYoJPSojQ/ik=;
  b=lDRci0mfDRymL6I8Af+H88LdD9qq5zgDxBfHYxvvUfGljsRPfLj8ULW7
   QCUdz66IADyQtU9PUnvTtctBtFaSr8Z5dn9C+eNt3YKsxXxqMknfr3o9t
   DH12khlMs2fEiideUDhiWDd7nQPdSTrk3P5WLukqLe9QHTE9EVBnhhFZ6
   qt43DI9RweLMxgKZv8Q3zzwY0nDF1aUmDQYj6RwvSOJO4S+qvOibyYWLL
   3U5OrnRdmW70amfRcRpeHoiiG/SvznBK7A5JPnp7rVq/FZ2IWm53V9GPB
   vy5cnG9Sc8B42X+lVen2F2fKB9ECS1yzepOwAuZR0ZsMwhZR1YqOT10PT
   w==;
X-CSE-ConnectionGUID: D6bsarQnQ4a7/HWpWBnTxg==
X-CSE-MsgGUID: CuxdyNJGQkO+F/JKuEy5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51559801"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="51559801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 04:33:23 -0700
X-CSE-ConnectionGUID: F5pE8xVcR1eBa8RmaVPzpg==
X-CSE-MsgGUID: zd6UlzstS0WEHJRceVWuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="171996278"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jun 2025 04:33:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRUZ5-000FvO-2t;
	Tue, 17 Jun 2025 11:33:19 +0000
Date: Tue, 17 Jun 2025 19:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:testing] BUILD SUCCESS
 f0f4ab6b151a55475dc88c4d08207203f6c06102
Message-ID: <202506171918.frLpCVFl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git testing
branch HEAD: f0f4ab6b151a55475dc88c4d08207203f6c06102  media: uvcvideo: eUSB2 double isochronous bandwidth support

elapsed time: 1332m

configs tested: 257
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250616    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250616    gcc-15.1.0
arc                   randconfig-002-20250617    gcc-11.5.0
arc                           tb10x_defconfig    clang-21
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    clang-21
arm                           h3600_defconfig    clang-21
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20250616    gcc-12.4.0
arm                   randconfig-001-20250617    gcc-11.5.0
arm                   randconfig-002-20250616    gcc-15.1.0
arm                   randconfig-002-20250617    gcc-11.5.0
arm                   randconfig-003-20250616    clang-21
arm                   randconfig-003-20250617    gcc-11.5.0
arm                   randconfig-004-20250616    clang-21
arm                   randconfig-004-20250617    gcc-11.5.0
arm64                            alldefconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250616    gcc-8.5.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250616    gcc-15.1.0
arm64                 randconfig-002-20250617    gcc-11.5.0
arm64                 randconfig-003-20250616    clang-19
arm64                 randconfig-003-20250617    gcc-11.5.0
arm64                 randconfig-004-20250616    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250616    gcc-13.3.0
csky                  randconfig-001-20250617    clang-21
csky                  randconfig-002-20250616    gcc-15.1.0
csky                  randconfig-002-20250617    clang-21
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250616    clang-21
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250616    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-002-20250617    gcc-12
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386        buildonly-randconfig-006-20250617    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250617    gcc-12
i386                  randconfig-002-20250617    gcc-12
i386                  randconfig-003-20250617    gcc-12
i386                  randconfig-004-20250617    gcc-12
i386                  randconfig-005-20250617    gcc-12
i386                  randconfig-006-20250617    gcc-12
i386                  randconfig-007-20250617    gcc-12
i386                  randconfig-011-20250617    clang-20
i386                  randconfig-012-20250617    clang-20
i386                  randconfig-013-20250617    clang-20
i386                  randconfig-014-20250617    clang-20
i386                  randconfig-015-20250617    clang-20
i386                  randconfig-016-20250617    clang-20
i386                  randconfig-017-20250617    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250616    gcc-15.1.0
loongarch             randconfig-001-20250617    clang-21
loongarch             randconfig-002-20250616    gcc-15.1.0
loongarch             randconfig-002-20250617    clang-21
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250616    gcc-8.5.0
nios2                 randconfig-001-20250617    clang-21
nios2                 randconfig-002-20250616    gcc-10.5.0
nios2                 randconfig-002-20250617    clang-21
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250616    gcc-8.5.0
parisc                randconfig-001-20250617    clang-21
parisc                randconfig-002-20250616    gcc-9.3.0
parisc                randconfig-002-20250617    clang-21
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250616    clang-21
powerpc               randconfig-001-20250617    clang-21
powerpc               randconfig-002-20250616    clang-21
powerpc               randconfig-002-20250617    clang-21
powerpc               randconfig-003-20250616    clang-21
powerpc               randconfig-003-20250617    clang-21
powerpc                    sam440ep_defconfig    clang-21
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250616    gcc-8.5.0
powerpc64             randconfig-001-20250617    clang-21
powerpc64             randconfig-002-20250616    clang-21
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250616    clang-21
powerpc64             randconfig-003-20250617    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250616    clang-19
riscv                 randconfig-001-20250617    gcc-12.4.0
riscv                 randconfig-002-20250616    clang-21
riscv                 randconfig-002-20250617    gcc-12.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250616    gcc-11.5.0
s390                  randconfig-001-20250617    gcc-12.4.0
s390                  randconfig-002-20250616    gcc-10.5.0
s390                  randconfig-002-20250617    gcc-12.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250616    gcc-12.4.0
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250616    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-12.4.0
sh                           se7724_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250616    gcc-13.3.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250616    gcc-8.5.0
sparc                 randconfig-002-20250617    gcc-12.4.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250616    gcc-13.3.0
sparc64               randconfig-001-20250617    gcc-12.4.0
sparc64               randconfig-002-20250616    gcc-8.5.0
sparc64               randconfig-002-20250617    gcc-12.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250616    clang-20
um                    randconfig-001-20250617    gcc-12.4.0
um                    randconfig-002-20250616    clang-21
um                    randconfig-002-20250617    gcc-12.4.0
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250616    clang-20
x86_64      buildonly-randconfig-001-20250617    gcc-12
x86_64      buildonly-randconfig-002-20250616    clang-20
x86_64      buildonly-randconfig-002-20250617    gcc-12
x86_64      buildonly-randconfig-003-20250616    clang-20
x86_64      buildonly-randconfig-003-20250617    gcc-12
x86_64      buildonly-randconfig-004-20250616    clang-20
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250616    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250616    clang-20
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250617    gcc-12
x86_64                randconfig-002-20250617    gcc-12
x86_64                randconfig-003-20250617    gcc-12
x86_64                randconfig-004-20250617    gcc-12
x86_64                randconfig-005-20250617    gcc-12
x86_64                randconfig-006-20250617    gcc-12
x86_64                randconfig-007-20250617    gcc-12
x86_64                randconfig-008-20250617    gcc-12
x86_64                randconfig-071-20250617    clang-20
x86_64                randconfig-072-20250617    clang-20
x86_64                randconfig-073-20250617    clang-20
x86_64                randconfig-074-20250617    clang-20
x86_64                randconfig-075-20250617    clang-20
x86_64                randconfig-076-20250617    clang-20
x86_64                randconfig-077-20250617    clang-20
x86_64                randconfig-078-20250617    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250616    gcc-13.3.0
xtensa                randconfig-001-20250617    gcc-12.4.0
xtensa                randconfig-002-20250616    gcc-8.5.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


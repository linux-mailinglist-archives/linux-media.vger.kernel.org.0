Return-Path: <linux-media+bounces-26190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E9A374F9
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 16:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 209393A1D8B
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4591990AF;
	Sun, 16 Feb 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmG5ew7E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12658192589
	for <linux-media@vger.kernel.org>; Sun, 16 Feb 2025 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718984; cv=none; b=c1qXAFdvgzXzpRUaZEDQ0W6FF+618vAX3FF/LqkJX7dQWWdgOxv6O9g092ULYMl0NViXqmFavWkdrJjGadx/6J4lGDwBzM6gF3URXxvHHqWMUN7jMb6lchQdF1cZb+Hzd81qSTcny0jOVQqf8qlNOPSbZ6bYcpj2wPg4h/x+T5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718984; c=relaxed/simple;
	bh=rN5dvRGSZp/jX6+WBWONB47LtGirUvzKxx8rCXCWpV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vp3b6Ovd5fZ8Ltxno2a3fEEHp7Bv/izDsdgrpR59SlguZsZmyvVWtBJQLfQ93xwwNcXi60uADiJ/dkWaiim6Re+N2zkH+cNlm95b9RhfmPu0GagYkemWjGgrJdWjn+BPLbSnx9tDhd/jKoPtfznNIny55kz3C3a+doNsTh3F4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmG5ew7E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739718982; x=1771254982;
  h=date:from:to:cc:subject:message-id;
  bh=rN5dvRGSZp/jX6+WBWONB47LtGirUvzKxx8rCXCWpV8=;
  b=SmG5ew7EzPGeJ98EqTi9FifXLncmgvxf1LqM9HkDVgQs8qq8ABdD9wT1
   S3ZNPaFALLYsc76R0LYoUgEuIPpl7F5ouWD5yVj1Kv6akqb5Rskkgc6YB
   rwvwVAJMvv9eRCHwQGE120+rQXr0Z5sl7YKl4w+daDf77G8PoCzYibFBG
   H49I7r4bJTGBe7IGEmmKuiDUks3U+tFUePZGI2EjdTIvqZjPi1FGnCbzk
   FdogUvW1iuf58GS+fP7Q4dKVvWkoN1e/zGevEW1yjDajnAKdmVVXwO4ig
   wjM3mc+VohahsZ25zNgkNCnV+5SnkiU9d18CelJOVTynGM1Kup+2IS0uG
   w==;
X-CSE-ConnectionGUID: OL7LB+mWRnOluGj+lU+LKA==
X-CSE-MsgGUID: iu3peNo9SrK81D7L3ElL5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51034770"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51034770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 07:16:21 -0800
X-CSE-ConnectionGUID: skxGeIprQJSWq/K5jTR9MQ==
X-CSE-MsgGUID: V+fm8mWJQ1C47y3TVn3DKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="119019068"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2025 07:16:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjgNW-001C15-1H;
	Sun, 16 Feb 2025 15:16:18 +0000
Date: Sun, 16 Feb 2025 23:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 2a1551665a8505150cf3f35f6028d7d06ea62024
Message-ID: <202502162355.W1gOlQwB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 2a1551665a8505150cf3f35f6028d7d06ea62024  media: dw9719: Add DW9761 support

elapsed time: 1310m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250216    gcc-13.2.0
arc                   randconfig-002-20250216    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250216    gcc-14.2.0
arm                   randconfig-002-20250216    gcc-14.2.0
arm                   randconfig-003-20250216    gcc-14.2.0
arm                   randconfig-004-20250216    clang-21
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250216    gcc-14.2.0
arm64                 randconfig-002-20250216    clang-21
arm64                 randconfig-003-20250216    gcc-14.2.0
arm64                 randconfig-004-20250216    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250216    gcc-14.2.0
csky                  randconfig-002-20250216    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250216    clang-15
hexagon               randconfig-002-20250216    clang-21
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250216    gcc-12
i386        buildonly-randconfig-002-20250216    gcc-12
i386        buildonly-randconfig-003-20250216    clang-19
i386        buildonly-randconfig-004-20250216    gcc-12
i386        buildonly-randconfig-005-20250216    gcc-12
i386        buildonly-randconfig-006-20250216    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250216    gcc-14.2.0
loongarch             randconfig-002-20250216    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-15
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250216    gcc-14.2.0
nios2                 randconfig-002-20250216    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250216    gcc-14.2.0
parisc                randconfig-002-20250216    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-17
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250216    gcc-14.2.0
powerpc               randconfig-002-20250216    gcc-14.2.0
powerpc               randconfig-003-20250216    gcc-14.2.0
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250216    gcc-14.2.0
powerpc64             randconfig-002-20250216    gcc-14.2.0
powerpc64             randconfig-003-20250216    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250216    clang-21
riscv                 randconfig-002-20250216    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250216    clang-19
s390                  randconfig-002-20250216    clang-17
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250216    gcc-14.2.0
sh                    randconfig-002-20250216    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250216    gcc-14.2.0
sparc                 randconfig-002-20250216    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250216    gcc-14.2.0
sparc64               randconfig-002-20250216    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250216    gcc-12
um                    randconfig-002-20250216    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250216    clang-19
x86_64      buildonly-randconfig-002-20250216    gcc-12
x86_64      buildonly-randconfig-003-20250216    gcc-12
x86_64      buildonly-randconfig-004-20250216    gcc-12
x86_64      buildonly-randconfig-005-20250216    gcc-12
x86_64      buildonly-randconfig-006-20250216    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250216    gcc-14.2.0
xtensa                randconfig-002-20250216    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


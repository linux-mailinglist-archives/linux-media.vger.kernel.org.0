Return-Path: <linux-media+bounces-28921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E85A748EF
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 12:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8675172DF9
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 11:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417DB214205;
	Fri, 28 Mar 2025 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDB0JgCA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F1B676
	for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159965; cv=none; b=kwEIjlRmJns2k21Ku8GfO6LPaufR++n3iQpvNp+P89V6k1Lt/0nXtZCawf7uze8xshkERNRAUi4X83NyrKYBoY/KtMOmtggk7zzT/CBSsi/AvzoBeseD0sm4V2t6KdSgnIhsBim9XJphG75ghCF+h1wUmF6sT3XQWa9WTALabkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159965; c=relaxed/simple;
	bh=4e9mHnxpEFRoOZYXk50P/ZhPx0hztsDXwunjei1VlcM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jw9RLEBiOjxVuaN6cG9gwZQLvAJEpAp4HTOSNBJVpVd0peVnzJDWtQ6H6uPF5NvGHvTDctxxZ0qiGvfg4nVBLa/LlcsdbFcaHTNvvt+ROzbiDH2Qtdu7KFDqlMM7LQMORo/NfsmCKnzfO6Ooj8eqZ8+pcv0gNSUgesAiMg8Wlz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDB0JgCA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743159963; x=1774695963;
  h=date:from:to:cc:subject:message-id;
  bh=4e9mHnxpEFRoOZYXk50P/ZhPx0hztsDXwunjei1VlcM=;
  b=DDB0JgCAf/c1XE/to7FQ+H1YTl6WKKxCPFgQYYVYr6JcdM3F1I20XQwX
   23yONGWlErjaYIN1IHyyMhytuP/w9qYqfEgh+xDt1r83bW5h2FrO8hrL4
   +Z1YbIAWbOS6aT7Yk0NTrLM9ewfsZRKn2O6Tk3+U8JLjsJXdZs+biwEqf
   AHFcliWdQV/F16p4/jm8Y6zY2Z2Ris/awOGzAtfX3sUMQnHayEfTgB7dE
   FwgoR4Km/Jz8Q3vL0AflCvYpN5170hA9Vg3kiV0hSD6571v5DfUjKlBNG
   DEPsw6SxdYOd2s3Sd6a+da2g1FhSpsEBEAZgJ5wko/IOhhS1BGhTAxwlp
   Q==;
X-CSE-ConnectionGUID: 7xai5I27RgOQ1D8I61y9ug==
X-CSE-MsgGUID: ylBCuCzRTIStc/CR7KDLbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44410552"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44410552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:06:03 -0700
X-CSE-ConnectionGUID: BIrB9KU1T6aO66vZWLibdg==
X-CSE-MsgGUID: Te48e7+WSrCYm3hs3M92qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125928852"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2025 04:06:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty7XD-0007Nt-1b;
	Fri, 28 Mar 2025 11:05:59 +0000
Date: Fri, 28 Mar 2025 19:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 ba8a1e4e79f546eb593da30518f3f29ebdc3fe19
Message-ID: <202503281949.CT0l6kfy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: ba8a1e4e79f546eb593da30518f3f29ebdc3fe19  media: ti: cal: Add streams support

elapsed time: 1447m

configs tested: 209
configs skipped: 7

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
arc                            hsdk_defconfig    gcc-14.2.0
arc                   randconfig-001-20250327    gcc-14.2.0
arc                   randconfig-002-20250327    gcc-14.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-21
arm                   randconfig-001-20250327    clang-21
arm                   randconfig-002-20250327    gcc-5.5.0
arm                   randconfig-003-20250327    clang-21
arm                   randconfig-004-20250327    clang-16
arm                       spear13xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250327    gcc-5.5.0
arm64                 randconfig-002-20250327    clang-21
arm64                 randconfig-003-20250327    clang-21
arm64                 randconfig-004-20250327    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250327    gcc-9.3.0
csky                  randconfig-002-20250327    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250327    clang-21
hexagon               randconfig-002-20250327    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250327    clang-20
i386        buildonly-randconfig-002-20250327    gcc-12
i386        buildonly-randconfig-003-20250327    clang-20
i386        buildonly-randconfig-004-20250327    clang-20
i386        buildonly-randconfig-005-20250327    clang-20
i386        buildonly-randconfig-006-20250327    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250328    gcc-12
i386                  randconfig-002-20250328    gcc-12
i386                  randconfig-003-20250328    gcc-12
i386                  randconfig-004-20250328    gcc-12
i386                  randconfig-005-20250328    gcc-12
i386                  randconfig-006-20250328    gcc-12
i386                  randconfig-007-20250328    gcc-12
i386                  randconfig-011-20250328    clang-20
i386                  randconfig-012-20250328    clang-20
i386                  randconfig-013-20250328    clang-20
i386                  randconfig-014-20250328    clang-20
i386                  randconfig-015-20250328    clang-20
i386                  randconfig-016-20250328    clang-20
i386                  randconfig-017-20250328    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250327    gcc-14.2.0
loongarch             randconfig-002-20250327    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250327    gcc-11.5.0
nios2                 randconfig-002-20250327    gcc-13.3.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250327    gcc-14.2.0
parisc                randconfig-002-20250327    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc               randconfig-001-20250327    gcc-7.5.0
powerpc               randconfig-002-20250327    gcc-9.3.0
powerpc               randconfig-003-20250327    gcc-5.5.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250327    gcc-9.3.0
powerpc64             randconfig-002-20250327    clang-21
powerpc64             randconfig-003-20250327    clang-16
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250327    clang-21
riscv                 randconfig-002-20250327    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250327    gcc-6.5.0
s390                  randconfig-002-20250327    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250327    gcc-5.5.0
sh                    randconfig-002-20250327    gcc-9.3.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250327    gcc-12.4.0
sparc                 randconfig-002-20250327    gcc-10.3.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250327    gcc-6.5.0
sparc64               randconfig-002-20250327    gcc-6.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-15
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250327    clang-19
um                    randconfig-002-20250327    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250327    gcc-12
x86_64      buildonly-randconfig-002-20250327    gcc-12
x86_64      buildonly-randconfig-003-20250327    clang-20
x86_64      buildonly-randconfig-004-20250327    clang-20
x86_64      buildonly-randconfig-005-20250327    gcc-12
x86_64      buildonly-randconfig-006-20250327    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250328    gcc-12
x86_64                randconfig-002-20250328    gcc-12
x86_64                randconfig-003-20250328    gcc-12
x86_64                randconfig-004-20250328    gcc-12
x86_64                randconfig-005-20250328    gcc-12
x86_64                randconfig-006-20250328    gcc-12
x86_64                randconfig-007-20250328    gcc-12
x86_64                randconfig-008-20250328    gcc-12
x86_64                randconfig-071-20250328    clang-20
x86_64                randconfig-072-20250328    clang-20
x86_64                randconfig-073-20250328    clang-20
x86_64                randconfig-074-20250328    clang-20
x86_64                randconfig-075-20250328    clang-20
x86_64                randconfig-076-20250328    clang-20
x86_64                randconfig-077-20250328    clang-20
x86_64                randconfig-078-20250328    clang-20
x86_64                               rhel-9.4    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250327    gcc-14.2.0
xtensa                randconfig-002-20250327    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-45317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF9BFE0C8
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3EC63A3EFD
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 19:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FCA2F49ED;
	Wed, 22 Oct 2025 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fgf1Dsxo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D092C0277
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761161525; cv=none; b=QCqcOBX34ov8S+iRsRjOE9gn1qW+p5Ulgwq98mQq1VEBk4PFSwPOqV0MfVHPGmEu0bQgifrLkJDUxkeRHtU4hhwBepg06wPXYw1Yq+Q7TRyf5Vmsmh72i0zB/i3y5tbh1e26BImLsyVLZAYEmUgyYC/4JwBwEBF3CkCGQwvQaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761161525; c=relaxed/simple;
	bh=DSPnTJSsdD2uA3YWB3D/ivmiIMR9pY5vjKdD9wWWjOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jEXOx8xY9kzN1X6icIrHXM2f/R2LDjcogFCbMHCfOe3JFuM270iSb+SXMP/DinWvs5kJ6A6Fc9iy8GlqBOp77QLvak0MxzdEVxcUENsx8i/KrGR9TxYQHPhYWWaCBOC1AoII+WZ6csNXO9oWofCrz0EvnO5KDzf6QL8zhb/jcHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fgf1Dsxo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761161523; x=1792697523;
  h=date:from:to:cc:subject:message-id;
  bh=DSPnTJSsdD2uA3YWB3D/ivmiIMR9pY5vjKdD9wWWjOA=;
  b=Fgf1DsxotYqTpnYGuGok+iMgi/pYWhWTk33mSi+qfMJUQjU383JLj89W
   JXeexUJk7SMFH1ddcrI9uNU5B24mtkbGBfS0AyOGY0TNK/hEgukaEz/9G
   eO0vJQdxJt+Nx+bqw2SBD+3tT6GhLh50i0hceoyJePoSwI3jy+9ilEHu4
   pbPfdMikHUZ9GxL5XGOW4QM46a6a+jNtnHx19uMrl27V4U8GrJZnuh12J
   LyO/LA3LAdDMP2qLQjaO+q+vPiq/j92gmFdaSXZau4khJuY7GfujZ0pW2
   1ZYqrnAiRbbY0XvR5ghldObrJvmh+qh9awaO5mcPxa4VZeUr4k7z2xLEJ
   A==;
X-CSE-ConnectionGUID: W/brwfvjSGWnsKzrJOg8gA==
X-CSE-MsgGUID: ugd/LjwkR7WU+SJQzkJxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62531601"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="62531601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 12:32:03 -0700
X-CSE-ConnectionGUID: Dq+w+RhgThW1ssoql81/qg==
X-CSE-MsgGUID: 0hG2w1n6SnKnam0i7oFKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183546116"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 12:32:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBeYw-000Cfh-26;
	Wed, 22 Oct 2025 19:31:58 +0000
Date: Thu, 23 Oct 2025 03:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 7c636f1698c115e9bd688c977a3f39cc246ad302
Message-ID: <202510230321.XTUTDkUq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 7c636f1698c115e9bd688c977a3f39cc246ad302  media: dt-bindings: video-interfaces: add video-interfaces.h information

elapsed time: 730m

configs tested: 200
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20251022    gcc-13.4.0
arc                   randconfig-002-20251022    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20251022    gcc-11.5.0
arm                   randconfig-002-20251022    gcc-10.5.0
arm                   randconfig-003-20251022    gcc-10.5.0
arm                   randconfig-004-20251022    clang-22
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251022    gcc-9.5.0
arm64                 randconfig-002-20251022    clang-18
arm64                 randconfig-003-20251022    gcc-10.5.0
arm64                 randconfig-004-20251022    gcc-12.5.0
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251022    clang-22
csky                  randconfig-001-20251022    gcc-15.1.0
csky                  randconfig-002-20251022    clang-22
csky                  randconfig-002-20251022    gcc-11.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251022    clang-22
hexagon               randconfig-002-20251022    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251022    clang-20
i386        buildonly-randconfig-001-20251022    gcc-14
i386        buildonly-randconfig-002-20251022    clang-20
i386        buildonly-randconfig-002-20251022    gcc-14
i386        buildonly-randconfig-003-20251022    gcc-14
i386        buildonly-randconfig-004-20251022    clang-20
i386        buildonly-randconfig-004-20251022    gcc-14
i386        buildonly-randconfig-005-20251022    gcc-12
i386        buildonly-randconfig-005-20251022    gcc-14
i386        buildonly-randconfig-006-20251022    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251022    gcc-14
i386                  randconfig-002-20251022    gcc-14
i386                  randconfig-003-20251022    gcc-14
i386                  randconfig-004-20251022    gcc-14
i386                  randconfig-005-20251022    gcc-14
i386                  randconfig-006-20251022    gcc-14
i386                  randconfig-007-20251022    gcc-14
i386                  randconfig-011-20251022    gcc-13
i386                  randconfig-012-20251022    gcc-13
i386                  randconfig-013-20251022    gcc-13
i386                  randconfig-014-20251022    gcc-13
i386                  randconfig-015-20251022    gcc-13
i386                  randconfig-016-20251022    gcc-13
i386                  randconfig-017-20251022    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251022    clang-22
loongarch             randconfig-001-20251022    gcc-12.5.0
loongarch             randconfig-002-20251022    clang-22
loongarch             randconfig-002-20251022    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                          amiga_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm47xx_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251022    clang-22
nios2                 randconfig-001-20251022    gcc-8.5.0
nios2                 randconfig-002-20251022    clang-22
nios2                 randconfig-002-20251022    gcc-10.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251022    clang-22
parisc                randconfig-001-20251022    gcc-13.4.0
parisc                randconfig-002-20251022    clang-22
parisc                randconfig-002-20251022    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251022    clang-22
powerpc               randconfig-001-20251022    gcc-8.5.0
powerpc               randconfig-002-20251022    clang-22
powerpc               randconfig-002-20251022    gcc-8.5.0
powerpc               randconfig-003-20251022    clang-22
powerpc               randconfig-003-20251022    gcc-8.5.0
powerpc64             randconfig-001-20251022    clang-22
powerpc64             randconfig-001-20251022    gcc-8.5.0
powerpc64             randconfig-002-20251022    clang-22
powerpc64             randconfig-002-20251022    gcc-8.5.0
powerpc64             randconfig-003-20251022    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251023    gcc-8.5.0
riscv                 randconfig-002-20251023    gcc-8.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251023    gcc-8.5.0
s390                  randconfig-002-20251023    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                    randconfig-001-20251023    gcc-8.5.0
sh                    randconfig-002-20251023    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251023    gcc-8.5.0
sparc                 randconfig-002-20251023    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251023    gcc-8.5.0
sparc64               randconfig-002-20251023    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251023    gcc-8.5.0
um                    randconfig-002-20251023    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251022    clang-20
x86_64      buildonly-randconfig-002-20251022    clang-20
x86_64      buildonly-randconfig-002-20251022    gcc-14
x86_64      buildonly-randconfig-003-20251022    clang-20
x86_64      buildonly-randconfig-003-20251022    gcc-14
x86_64      buildonly-randconfig-004-20251022    clang-20
x86_64      buildonly-randconfig-005-20251022    clang-20
x86_64      buildonly-randconfig-005-20251022    gcc-14
x86_64      buildonly-randconfig-006-20251022    clang-20
x86_64      buildonly-randconfig-006-20251022    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251022    clang-20
x86_64                randconfig-002-20251022    clang-20
x86_64                randconfig-003-20251022    clang-20
x86_64                randconfig-004-20251022    clang-20
x86_64                randconfig-005-20251022    clang-20
x86_64                randconfig-006-20251022    clang-20
x86_64                randconfig-007-20251022    clang-20
x86_64                randconfig-008-20251022    clang-20
x86_64                randconfig-071-20251022    clang-20
x86_64                randconfig-072-20251022    clang-20
x86_64                randconfig-073-20251022    clang-20
x86_64                randconfig-074-20251022    clang-20
x86_64                randconfig-075-20251022    clang-20
x86_64                randconfig-076-20251022    clang-20
x86_64                randconfig-077-20251022    clang-20
x86_64                randconfig-078-20251022    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251023    gcc-8.5.0
xtensa                randconfig-002-20251023    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


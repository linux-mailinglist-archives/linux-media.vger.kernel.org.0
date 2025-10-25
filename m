Return-Path: <linux-media+bounces-45542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB49C08DE0
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 10:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FCB1A6547A
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 08:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D9E25D540;
	Sat, 25 Oct 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcpSOvgB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2D35B12C
	for <linux-media@vger.kernel.org>; Sat, 25 Oct 2025 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761380441; cv=none; b=lKXI1TF9NNLtc8W5YosthFtn6dmGku+5bpUInw0hOtfn7sQ5M7M6x9YAmrEr3YNOqGEcGXwN8pQiZICBb/33QWYLM4kdLVwmNMBPDlVOGeGpU/Je4fRtMiFi8rDoZhEfpfmaq3IojXv4bES89r5yrXUWyys43QHOMhei23A/1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761380441; c=relaxed/simple;
	bh=ZtfBEidDTO+VZLlmNYXlB/51BVCs448IM9pifU2RzuU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uhCDyXyd3WwfESi+h0w6p4PhUwa9RjECS6oYcvrz16euVRjrMBVSNtlTRya/uKN2JQyI3xoSm+RlREBee0Q7LqVgsI0h42MwyTfOmDZ0PGmQb/jjfl+3QsIwvBb1kG2DxY4Ybaxk8y6EjDUrn/eJCejyWa4+AenS0MSHCWQgk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcpSOvgB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761380439; x=1792916439;
  h=date:from:to:cc:subject:message-id;
  bh=ZtfBEidDTO+VZLlmNYXlB/51BVCs448IM9pifU2RzuU=;
  b=EcpSOvgBAvzi/FLdij8fbDkg+ubA+g4Ffi4lAIZ/NJg9kfsXdGApCZJd
   QBHzpNSQNCSrNfSNNs8asLUqN7LNZlgUFsHel9M+GrqSvJYtOtpk8Tidc
   MekNTIYDZz5s3oraxZ9Socww5lLlOOmBFRB+VNlBhV7wUYgFvmRz9Xoa2
   V1jKsa40SBlRWY/9a/PAKLCDcpk7Zd0iIA1CQZYPc8T2T2aMaD7cay0qT
   xPZ91no9ZKIXyBOobmnxgQw4u5tEXr/7yYhjNkuqBtl7jPSGnfodX81F6
   86GGCH3iyWMbRRnXYFpWr6HTWio/mLGpyR/evLaYp9ctbpPh3WdLBYJs0
   g==;
X-CSE-ConnectionGUID: XHZ80ldoTVeF6gwNPW+tSA==
X-CSE-MsgGUID: P0TD3O4FR+SUEIm6cv6YrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67410753"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="67410753"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 01:20:39 -0700
X-CSE-ConnectionGUID: aUdDPF4oQVmq2lcy2mg/gQ==
X-CSE-MsgGUID: XdWAJERRRcW/k9HiOL8SSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="185091831"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2025 01:20:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCZVo-000FC5-0s;
	Sat, 25 Oct 2025 08:20:33 +0000
Date: Sat, 25 Oct 2025 16:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 13870c08efbc144c8a2d85ec577f705b8f11de45
Message-ID: <202510251608.QKpiDZY1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 13870c08efbc144c8a2d85ec577f705b8f11de45  media: i2c: vd55g1: Add support for vd65g4 RGB variant

elapsed time: 1446m

configs tested: 249
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251024    gcc-8.5.0
arc                   randconfig-001-20251025    clang-22
arc                   randconfig-002-20251024    gcc-14.3.0
arc                   randconfig-002-20251025    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            hisi_defconfig    clang-22
arm                   randconfig-001-20251024    clang-20
arm                   randconfig-001-20251025    clang-22
arm                   randconfig-002-20251024    gcc-15.1.0
arm                   randconfig-002-20251025    clang-22
arm                   randconfig-003-20251024    clang-22
arm                   randconfig-003-20251025    clang-22
arm                   randconfig-004-20251024    clang-22
arm                   randconfig-004-20251025    clang-22
arm                           sama7_defconfig    clang-22
arm                        spear6xx_defconfig    clang-22
arm                           u8500_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                            allyesconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251024    gcc-8.5.0
arm64                 randconfig-001-20251025    clang-22
arm64                 randconfig-002-20251024    clang-16
arm64                 randconfig-002-20251025    clang-22
arm64                 randconfig-003-20251024    gcc-13.4.0
arm64                 randconfig-003-20251025    clang-22
arm64                 randconfig-004-20251024    clang-17
arm64                 randconfig-004-20251025    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    clang-22
csky                             allyesconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251024    gcc-14.3.0
csky                  randconfig-001-20251025    gcc-10.5.0
csky                  randconfig-002-20251024    gcc-11.5.0
csky                  randconfig-002-20251025    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251024    clang-22
hexagon               randconfig-001-20251025    gcc-10.5.0
hexagon               randconfig-002-20251024    clang-22
hexagon               randconfig-002-20251025    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251024    clang-20
i386        buildonly-randconfig-001-20251025    clang-20
i386        buildonly-randconfig-002-20251024    gcc-14
i386        buildonly-randconfig-002-20251025    clang-20
i386        buildonly-randconfig-003-20251024    clang-20
i386        buildonly-randconfig-003-20251025    clang-20
i386        buildonly-randconfig-004-20251024    gcc-14
i386        buildonly-randconfig-004-20251025    clang-20
i386        buildonly-randconfig-005-20251024    gcc-14
i386        buildonly-randconfig-005-20251025    clang-20
i386        buildonly-randconfig-006-20251024    gcc-14
i386        buildonly-randconfig-006-20251025    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251025    clang-20
i386                  randconfig-002-20251025    clang-20
i386                  randconfig-003-20251025    clang-20
i386                  randconfig-004-20251025    clang-20
i386                  randconfig-005-20251025    clang-20
i386                  randconfig-006-20251025    clang-20
i386                  randconfig-007-20251025    clang-20
i386                  randconfig-011-20251025    gcc-14
i386                  randconfig-012-20251025    gcc-14
i386                  randconfig-013-20251025    gcc-14
i386                  randconfig-014-20251025    gcc-14
i386                  randconfig-015-20251025    gcc-14
i386                  randconfig-016-20251025    gcc-14
i386                  randconfig-017-20251025    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251024    gcc-15.1.0
loongarch             randconfig-001-20251025    gcc-10.5.0
loongarch             randconfig-002-20251024    gcc-15.1.0
loongarch             randconfig-002-20251025    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251024    gcc-11.5.0
nios2                 randconfig-001-20251025    gcc-10.5.0
nios2                 randconfig-002-20251024    gcc-11.5.0
nios2                 randconfig-002-20251025    gcc-10.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251024    gcc-9.5.0
parisc                randconfig-001-20251025    gcc-10.5.0
parisc                randconfig-002-20251024    gcc-13.4.0
parisc                randconfig-002-20251025    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                       ebony_defconfig    clang-22
powerpc               randconfig-001-20251024    gcc-8.5.0
powerpc               randconfig-001-20251025    gcc-10.5.0
powerpc               randconfig-002-20251024    clang-17
powerpc               randconfig-002-20251025    gcc-10.5.0
powerpc               randconfig-003-20251024    clang-16
powerpc               randconfig-003-20251025    gcc-10.5.0
powerpc64             randconfig-001-20251024    gcc-12.5.0
powerpc64             randconfig-001-20251025    gcc-10.5.0
powerpc64             randconfig-002-20251024    gcc-14.3.0
powerpc64             randconfig-002-20251025    gcc-10.5.0
powerpc64             randconfig-003-20251024    gcc-8.5.0
powerpc64             randconfig-003-20251025    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251024    clang-22
riscv                 randconfig-001-20251025    clang-22
riscv                 randconfig-002-20251024    clang-22
riscv                 randconfig-002-20251025    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251024    gcc-13.4.0
s390                  randconfig-001-20251025    clang-22
s390                  randconfig-002-20251024    clang-22
s390                  randconfig-002-20251025    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251024    gcc-12.5.0
sh                    randconfig-001-20251025    clang-22
sh                    randconfig-002-20251024    gcc-14.3.0
sh                    randconfig-002-20251025    clang-22
sh                   sh7724_generic_defconfig    clang-22
sh                            titan_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251024    gcc-12.5.0
sparc                 randconfig-001-20251025    clang-22
sparc                 randconfig-002-20251024    gcc-8.5.0
sparc                 randconfig-002-20251025    clang-22
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251024    clang-20
sparc64               randconfig-001-20251025    clang-22
sparc64               randconfig-002-20251024    clang-22
sparc64               randconfig-002-20251025    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251024    gcc-14
um                    randconfig-001-20251025    clang-22
um                    randconfig-002-20251024    clang-22
um                    randconfig-002-20251025    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251024    clang-20
x86_64      buildonly-randconfig-001-20251025    clang-20
x86_64      buildonly-randconfig-002-20251024    clang-20
x86_64      buildonly-randconfig-002-20251025    clang-20
x86_64      buildonly-randconfig-003-20251024    clang-20
x86_64      buildonly-randconfig-003-20251025    clang-20
x86_64      buildonly-randconfig-004-20251024    gcc-14
x86_64      buildonly-randconfig-004-20251025    clang-20
x86_64      buildonly-randconfig-005-20251024    gcc-14
x86_64      buildonly-randconfig-005-20251025    clang-20
x86_64      buildonly-randconfig-006-20251024    clang-20
x86_64      buildonly-randconfig-006-20251025    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251025    clang-20
x86_64                randconfig-002-20251025    clang-20
x86_64                randconfig-003-20251025    clang-20
x86_64                randconfig-004-20251025    clang-20
x86_64                randconfig-005-20251025    clang-20
x86_64                randconfig-006-20251025    clang-20
x86_64                randconfig-007-20251025    clang-20
x86_64                randconfig-008-20251025    clang-20
x86_64                randconfig-071-20251025    clang-20
x86_64                randconfig-072-20251025    clang-20
x86_64                randconfig-073-20251025    clang-20
x86_64                randconfig-074-20251025    clang-20
x86_64                randconfig-075-20251025    clang-20
x86_64                randconfig-076-20251025    clang-20
x86_64                randconfig-077-20251025    clang-20
x86_64                randconfig-078-20251025    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251024    gcc-11.5.0
xtensa                randconfig-001-20251025    clang-22
xtensa                randconfig-002-20251024    gcc-13.4.0
xtensa                randconfig-002-20251025    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


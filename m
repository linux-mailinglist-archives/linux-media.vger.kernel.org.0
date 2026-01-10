Return-Path: <linux-media+bounces-50337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD5D0D50B
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 11:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B048C3025307
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 10:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F36E3191A9;
	Sat, 10 Jan 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQhF22t+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF1318ECA
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768042251; cv=none; b=h8ygyG+92EPYv8nd5+rUo2WFeEyiNW4nztRsiI1PmoxmoeyEWoKlWFLlRvs25+aWrok1Wbdgnvqf8o2o6CiAzGkbA6pzy/Qzr0kyCJ4wUG95sRByYImPk4n08K1+Pd0/tigHLwTKgv9oWUSaIMgqxr/dHkwvqEUz438Qxik5K0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768042251; c=relaxed/simple;
	bh=eF44bDkNy6ANQWvHtfdSwYu3s5YcBteKl+pPxZHg9v0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NYrAgDezmNDbiK2zJ7DSCD4FPuyTEViGH58ElrieLUtoAvoS69expXO/xynyhty3LqWYiuX6QonA2QRSbuBt3jb7MRVwka2OFvUqnPkOyhxK1KuC3y6AUtB6Iuih+skyt1h3p+FtInu2CX0ESCn2hoIT1MANJhzdRtAiwbV1y08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQhF22t+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768042251; x=1799578251;
  h=date:from:to:cc:subject:message-id;
  bh=eF44bDkNy6ANQWvHtfdSwYu3s5YcBteKl+pPxZHg9v0=;
  b=bQhF22t+pAPCc6uCyS8ERp4sK+k9AJitXRhwdTqrks0ZGjfyalBuiw4/
   O0D3cYrZw66xHqK5AI013duvqzfPZrR3Q9OeqJN9kmLmxE+8YISbheZGY
   dTgGUQ2xpL8/EvmHEoMSRX2wkQ+3yfT8eUzeKrakQK1W/mVCVp7XiBYFc
   gpXA09CMgusAcgyY7WHRv++2cHQoZbUuZl47YAHUpBKFD6fv9qxbetPXZ
   kZC+NS8cYRNnqQb7wDc93QFAWUG5cMxWJI/mMKQHNzcy46O0YdhPCOg0R
   HwM5mR4Hbjt3Y6HVsqPGLURPODBlz6usZ9XLV3uwHEnnLGME11bNoi6lX
   w==;
X-CSE-ConnectionGUID: d64ib28ERNmZHkpcyd1Png==
X-CSE-MsgGUID: 7mMfAZIYTDi0OnLf8HjSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69137946"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69137946"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:50:49 -0800
X-CSE-ConnectionGUID: h05a/Uh0Qk+bBZKfXNYnWw==
X-CSE-MsgGUID: XkMv9SLpSOuEEHIiVAFmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204101161"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 02:50:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWYP-000000008YW-1b1J;
	Sat, 10 Jan 2026 10:50:45 +0000
Date: Sat, 10 Jan 2026 18:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 2694330ab99db2f115c8b26a2e26d6011bbc2bc5
Message-ID: <202601101848.QpzKaMcM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 2694330ab99db2f115c8b26a2e26d6011bbc2bc5  media: i2c: ov5647: use our own mutex for the ctrl lock

elapsed time: 3002m

configs tested: 96
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
alpha                     defconfig    gcc-15.2.0
arc                    allmodconfig    clang-16
arc                     allnoconfig    gcc-15.2.0
arc                       defconfig    gcc-15.2.0
arm                     allnoconfig    gcc-15.2.0
arm                    allyesconfig    clang-16
arm                       defconfig    gcc-15.2.0
arm64                   allnoconfig    gcc-15.2.0
arm64                     defconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky                      defconfig    gcc-15.2.0
hexagon                allmodconfig    gcc-15.2.0
hexagon                 allnoconfig    gcc-15.2.0
hexagon                   defconfig    gcc-15.2.0
hexagon     randconfig-001-20260110    clang-22
hexagon     randconfig-002-20260110    clang-22
i386                    allnoconfig    gcc-15.2.0
i386                      defconfig    gcc-15.2.0
i386        randconfig-001-20260110    gcc-14
i386        randconfig-002-20260110    gcc-14
i386        randconfig-003-20260110    gcc-14
i386        randconfig-004-20260110    gcc-14
i386        randconfig-005-20260110    gcc-14
i386        randconfig-006-20260110    gcc-14
i386        randconfig-007-20260110    gcc-14
loongarch               allnoconfig    gcc-15.2.0
loongarch   randconfig-001-20260110    clang-22
loongarch   randconfig-002-20260110    clang-22
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    clang-16
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    clang-22
nios2                   allnoconfig    clang-22
nios2       randconfig-001-20260110    clang-22
nios2       randconfig-002-20260110    clang-22
openrisc               allmodconfig    clang-22
openrisc                allnoconfig    clang-22
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    clang-22
parisc                 allyesconfig    clang-19
parisc                    defconfig    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    clang-22
riscv                   allnoconfig    clang-22
riscv                  allyesconfig    clang-16
riscv                     defconfig    gcc-15.2.0
riscv       randconfig-001-20260110    gcc-15.2.0
riscv       randconfig-002-20260110    gcc-15.2.0
s390                   allmodconfig    clang-19
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.2.0
s390                      defconfig    gcc-15.2.0
s390        randconfig-001-20260110    gcc-15.2.0
s390        randconfig-002-20260110    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    clang-22
sh                     allyesconfig    clang-19
sh          randconfig-001-20260110    gcc-15.2.0
sh          randconfig-002-20260110    gcc-15.2.0
sparc                   allnoconfig    clang-22
sparc                     defconfig    gcc-15.2.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-15.2.0
x86_64                  allnoconfig    clang-22
x86_64                        kexec    clang-20
x86_64      randconfig-001-20260110    clang-20
x86_64      randconfig-002-20260110    clang-20
x86_64      randconfig-003-20260110    clang-20
x86_64      randconfig-004-20260110    clang-20
x86_64      randconfig-005-20260110    clang-20
x86_64      randconfig-006-20260110    clang-20
x86_64      randconfig-071-20260110    clang-20
x86_64      randconfig-072-20260110    clang-20
x86_64      randconfig-073-20260110    clang-20
x86_64      randconfig-074-20260110    clang-20
x86_64      randconfig-075-20260110    clang-20
x86_64      randconfig-076-20260110    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    clang-22
xtensa                 allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


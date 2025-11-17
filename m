Return-Path: <linux-media+bounces-47185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD1C62377
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 04:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D3CE64F0C87
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 03:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B66625F98B;
	Mon, 17 Nov 2025 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOdNejul"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2F27F19F
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 03:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763348688; cv=none; b=mnLR09pxHU4Wz+2nqU2JP3ZFcH4C4hcqt8RWebo90Js0di7waIgj6zWyw0kWKxo/zxJ5kz7pUMXRh884BWbbiojc3LLuinfl1XjIJKrEaREHzUpb19pmrDYYUbA+0sxRZ+Xh28k9iBTueuZZGzM0gbX5KGxzf2bDK+aapf3bm+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763348688; c=relaxed/simple;
	bh=ABnVxFzjwAUClKaECLJuQ5sl3rbm9kF25xh7dwAViu0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKWRcBX1DP9F/s2OkKNYD5AVKZDyxe/H20mGGOlad3Z/luohvmPL5kTHyUlJu0K5yfMypJP6wXi00meLe8OM2YUGP+KVBVY29mT9TfGMU/08+4SIyvbCzPwhpvJA2n6x9dz92vrsXFDmeDUCdWxA9dKqY5f//CoFrirMdy1sbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOdNejul; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763348686; x=1794884686;
  h=date:from:to:cc:subject:message-id;
  bh=ABnVxFzjwAUClKaECLJuQ5sl3rbm9kF25xh7dwAViu0=;
  b=JOdNejulGP8QVoPrNjaeDL5O55JehaBct9l1N166bJmbLFKEw9xmc1mh
   PPaEghHytpwG3zibbcb7gtMLUYQe52FidXVjVmjlq9T4in64OlL/o+fBK
   E3ygCTz43YmNyA2dx4wKYh7qHLKP5QQ3OTI/5E23HrFM+yEsRbY/FkePQ
   3FH5Vfl6ATNSMEox21Z9H5KSv8pjs+/1bh5w7XTI+mvHx4aJEeb+Y1lHH
   XAcxtsFVcz+3XEYzpF9ZW/2LALEJqv4k1G8+eEjWZ6Mw3HvPOqU94gdQl
   c2/mF2MwTVr/pq/qUZWGc7VyKYAKIZkdEJN2o9k7yWUWtk8Fl6u0Yv2v+
   w==;
X-CSE-ConnectionGUID: sjq7rbhETxiM0N7DOru6LA==
X-CSE-MsgGUID: kBdlWqSCRSW+ZX8nhD28sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76444931"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="76444931"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 19:04:46 -0800
X-CSE-ConnectionGUID: yeuRmU6KSpO8GzfsEksJEA==
X-CSE-MsgGUID: snurKwOtRv+n7GlbWa80SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="190772680"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2025 19:04:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKpXm-00007d-1O;
	Mon, 17 Nov 2025 03:04:42 +0000
Date: Mon, 17 Nov 2025 11:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:master] BUILD SUCCESS
 97e8e73777ab21f2ea9a917a76d2186748e9f9cb
Message-ID: <202511171125.Z1AnKcDe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git master
branch HEAD: 97e8e73777ab21f2ea9a917a76d2186748e9f9cb  media: siano: Remove redundant ternary operators

elapsed time: 8147m

configs tested: 89
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-001-20251116    gcc-8.5.0
arc                   randconfig-002-20251115    gcc-11.5.0
arc                   randconfig-002-20251116    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-001-20251116    gcc-8.5.0
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-002-20251116    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-003-20251116    clang-22
arm                   randconfig-004-20251115    clang-22
arm                   randconfig-004-20251116    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251116    gcc-12.5.0
arm64                 randconfig-002-20251116    gcc-10.5.0
arm64                 randconfig-003-20251116    clang-22
arm64                 randconfig-004-20251116    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251116    gcc-12.5.0
csky                  randconfig-002-20251116    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251116    clang-22
hexagon               randconfig-001-20251117    clang-22
hexagon               randconfig-002-20251116    clang-17
hexagon               randconfig-002-20251117    clang-22
i386                              allnoconfig    gcc-14
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251116    gcc-15.1.0
loongarch             randconfig-001-20251117    gcc-15.1.0
loongarch             randconfig-002-20251116    clang-22
loongarch             randconfig-002-20251117    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251116    gcc-11.5.0
nios2                 randconfig-001-20251117    gcc-11.5.0
nios2                 randconfig-002-20251116    gcc-11.5.0
nios2                 randconfig-002-20251117    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20251116    gcc-12.5.0
parisc                randconfig-002-20251116    gcc-14.3.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251116    gcc-10.5.0
powerpc               randconfig-002-20251116    clang-22
powerpc64             randconfig-001-20251116    clang-22
powerpc64             randconfig-002-20251116    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251115    clang-22
riscv                 randconfig-001-20251116    clang-20
riscv                 randconfig-002-20251115    gcc-8.5.0
riscv                 randconfig-002-20251116    gcc-10.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251115    clang-17
s390                  randconfig-001-20251116    clang-22
s390                  randconfig-002-20251115    gcc-8.5.0
s390                  randconfig-002-20251116    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251115    gcc-12.5.0
sh                    randconfig-001-20251116    gcc-13.4.0
sh                    randconfig-002-20251115    gcc-15.1.0
sh                    randconfig-002-20251116    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251117    gcc-12
x86_64      buildonly-randconfig-002-20251117    gcc-14
x86_64      buildonly-randconfig-003-20251117    gcc-14
x86_64      buildonly-randconfig-004-20251117    gcc-14
x86_64      buildonly-randconfig-005-20251117    gcc-14
x86_64      buildonly-randconfig-006-20251117    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


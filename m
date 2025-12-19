Return-Path: <linux-media+bounces-49159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7CECCFBA0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5B5D30AC4D3
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B9733A710;
	Fri, 19 Dec 2025 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4McWKLj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9D3009F7
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146280; cv=none; b=CgJcXcA4JGI89YZ9tTeS23tYCxdbEcx5tUee4e3rcI6yLucsrHmNnQM11vxHVixycXH7oyig3VGN91ywS7KzTBHQaBlPAJwt0wVzM7Qri/IEB2C9luNg4Czo9bqmZVrhiPRVAQX/67MWzwMfRv3a1ZhoaqdGoMwFnx7OWPCSigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146280; c=relaxed/simple;
	bh=FxZEkeKHcMhBBgc4p/BmCBJ2dw1M3eTFh4eGfi8DuQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqFmsDptQEhveKX2nG2PY9II/OYIwrFNB7NKNoV2Jyp0MFqAVKPM6aaKX2LN5TR4k9o+xXUzSz/XPFS7whUuphboPvGt694GP2Mn591tcBBUTdrPXmqV3Q56detl8Pl6pBiF46/MvhOLOEo8im+k4CeDfnnA8ODiMMvEOlg6lJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4McWKLj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766146279; x=1797682279;
  h=date:from:to:cc:subject:message-id;
  bh=FxZEkeKHcMhBBgc4p/BmCBJ2dw1M3eTFh4eGfi8DuQ4=;
  b=E4McWKLjTy0H2MZYiQsYw3QJfytR98Pwx2Sl4DMabzyDzMFJbogVx6C7
   DQj9u7SBd/ZarQDQ8J1sVDjTEW/3Xkh2dlAO78fPRR1qH5JwKork9XQAp
   iMk+HO3YOBK/yT9nH3MYKmO3+C2+wJ456uGT0gQjVk3Jx4Bk7NFQpr/QO
   TBO3LDiOcITCFCzs5xCNsG6A8epAZMYAgd3dAV/EasnDQ+tR3URXWZcIC
   QZ7MdDHpOPTniYPe+eWp4vzNS+R6jbfWBin9R+z/1yXsfIOmjZptk9Fnh
   JLI02CLl9nrWMmrMxRmKcu3TQn/cuMAXaSR9ktXZ4J5oW6ZJikeIqrLNq
   g==;
X-CSE-ConnectionGUID: NadgiqsSSoGRI6jl/BIJDQ==
X-CSE-MsgGUID: rzdKFWUuQ/qUw6OnQrA+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67301884"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="67301884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 04:11:18 -0800
X-CSE-ConnectionGUID: WKV8sx18Q0O7LrgBw1cTLw==
X-CSE-MsgGUID: 09MmF52hRKatzBvFy0lvhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199667521"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Dec 2025 04:11:17 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWZKE-000000003VJ-3wQ8;
	Fri, 19 Dec 2025 12:11:14 +0000
Date: Fri, 19 Dec 2025 20:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 b70886ff5833cf499e77af77d2324ce8f68b60ce
Message-ID: <202512192049.2eSts7uQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: b70886ff5833cf499e77af77d2324ce8f68b60ce  media: vb2: drop wait_prepare/finish callbacks

elapsed time: 1478m

configs tested: 182
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251219    gcc-11.5.0
arc                   randconfig-002-20251219    gcc-11.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.1.0
arm                          ep93xx_defconfig    clang-22
arm                        neponset_defconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20251219    gcc-11.5.0
arm                   randconfig-002-20251219    gcc-11.5.0
arm                   randconfig-003-20251219    gcc-11.5.0
arm                   randconfig-004-20251219    gcc-11.5.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251219    gcc-9.5.0
arm64                 randconfig-002-20251219    gcc-9.5.0
arm64                 randconfig-003-20251219    gcc-9.5.0
arm64                 randconfig-004-20251219    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251219    gcc-9.5.0
csky                  randconfig-002-20251219    gcc-9.5.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251219    gcc-11.5.0
hexagon               randconfig-002-20251219    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251219    clang-20
i386        buildonly-randconfig-002-20251219    clang-20
i386        buildonly-randconfig-003-20251219    clang-20
i386        buildonly-randconfig-004-20251219    clang-20
i386        buildonly-randconfig-005-20251219    clang-20
i386        buildonly-randconfig-006-20251219    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251219    clang-20
i386                  randconfig-002-20251219    clang-20
i386                  randconfig-003-20251219    clang-20
i386                  randconfig-004-20251219    clang-20
i386                  randconfig-005-20251219    clang-20
i386                  randconfig-006-20251219    clang-20
i386                  randconfig-007-20251219    clang-20
i386                  randconfig-011-20251219    gcc-14
i386                  randconfig-012-20251219    gcc-14
i386                  randconfig-013-20251219    gcc-14
i386                  randconfig-014-20251219    gcc-14
i386                  randconfig-015-20251219    gcc-14
i386                  randconfig-016-20251219    gcc-14
i386                  randconfig-017-20251219    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251219    gcc-11.5.0
loongarch             randconfig-002-20251219    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251219    gcc-11.5.0
nios2                 randconfig-002-20251219    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251219    clang-22
parisc                randconfig-002-20251219    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    clang-22
powerpc                     mpc5200_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251219    clang-22
powerpc               randconfig-002-20251219    clang-22
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251219    clang-22
powerpc64             randconfig-002-20251219    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251219    clang-22
riscv                 randconfig-002-20251219    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251219    clang-22
s390                  randconfig-002-20251219    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251219    clang-22
sh                    randconfig-002-20251219    clang-22
sh                   sh7724_generic_defconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251219    gcc-8.5.0
sparc                 randconfig-002-20251219    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251219    gcc-8.5.0
sparc64               randconfig-002-20251219    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251219    gcc-8.5.0
um                    randconfig-002-20251219    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251219    clang-20
x86_64      buildonly-randconfig-002-20251219    clang-20
x86_64      buildonly-randconfig-003-20251219    clang-20
x86_64      buildonly-randconfig-004-20251219    clang-20
x86_64      buildonly-randconfig-005-20251219    clang-20
x86_64      buildonly-randconfig-006-20251219    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251219    gcc-14
x86_64                randconfig-002-20251219    gcc-14
x86_64                randconfig-003-20251219    gcc-14
x86_64                randconfig-004-20251219    gcc-14
x86_64                randconfig-005-20251219    gcc-14
x86_64                randconfig-006-20251219    gcc-14
x86_64                randconfig-011-20251219    clang-20
x86_64                randconfig-012-20251219    clang-20
x86_64                randconfig-013-20251219    clang-20
x86_64                randconfig-014-20251219    clang-20
x86_64                randconfig-015-20251219    clang-20
x86_64                randconfig-016-20251219    clang-20
x86_64                randconfig-071-20251219    gcc-14
x86_64                randconfig-072-20251219    gcc-14
x86_64                randconfig-073-20251219    gcc-14
x86_64                randconfig-074-20251219    gcc-14
x86_64                randconfig-075-20251219    gcc-14
x86_64                randconfig-076-20251219    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                  nommu_kc705_defconfig    clang-22
xtensa                randconfig-001-20251219    gcc-8.5.0
xtensa                randconfig-002-20251219    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


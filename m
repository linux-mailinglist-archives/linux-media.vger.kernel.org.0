Return-Path: <linux-media+bounces-27778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6452A553C0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 18:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6983B4341
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C9A25D541;
	Thu,  6 Mar 2025 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxy5EjKz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38EB25C6EE
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283873; cv=none; b=fXZVKPsOWdtylx4aPX5DTnxv85DTggZ+fppMxV2rbfPEM/x7hBPdqTIuxmY76tMPm9PXU7LVU94BFhTZZRUPSFYNtFziQOcTr0b3SMEtkVK7ZfBBbbxMwZpHGjoR6wMm8nPxnb+t/YsWOzvtMfuUgKBbwPwLtKmSDwHOsquDEzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283873; c=relaxed/simple;
	bh=R9FdRL3KirGsHiyMjW9ZuUsC9bSPKYRcijIp05TC/jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Htc6lgbx7ocT8PcobJiZRIAo0Vm7AvpopzirKW0IocoLeRZyJnjL7Rx2UMOjfQ1vhlJC63EpX5hbHDEcoXn3k9tdElmkSFoO1I8A8bmI28rFedGYxH5IjC7cG9kBCovG34UXLst7ZXAryIPj/QYOZvL6jgI8PQaUKcQMWJM/tCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxy5EjKz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741283872; x=1772819872;
  h=date:from:to:cc:subject:message-id;
  bh=R9FdRL3KirGsHiyMjW9ZuUsC9bSPKYRcijIp05TC/jc=;
  b=jxy5EjKz4Jtrm8upwV+IDuGkfhEu+IVuv8pL0bCYucRRl1bfPdjI+mDZ
   Y5bRKgsdEV/0wcH+bPXL2T0arYOYos7SsTttaeiz0se6kahKB/7xpLeVx
   p8qcydmfpE4OQTO6xA1+rOJp0H6u/Cq2SxgnQSKdp8RLIrrj3c02dKowm
   s/av4cP09Dc1slwqJqS761qT3C6B7W1JIu98c5Lukc4nZSbPJ6KX/YLRR
   dEsgzi9t/xazStfCaKXkVSDCoqwnthjCjdg2G5DMxt9oPa/l8nz1g4KwX
   Z5t1OV8AKt90WF8oaoXszvpww7mLslzAYp3NYRjZs/fN8o7tfeuDYoOli
   w==;
X-CSE-ConnectionGUID: YIA5Z6BkQ4Kt09tqXict8A==
X-CSE-MsgGUID: zmz50FSTQ1Kqnl6yAPfARA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53299675"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="53299675"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:57:51 -0800
X-CSE-ConnectionGUID: rA8Wgu8GRl24DFs6/MCoJg==
X-CSE-MsgGUID: 7bEeol/9TNSL1ETvhg9rWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119791590"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Mar 2025 09:57:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqFTf-000NPi-2S;
	Thu, 06 Mar 2025 17:57:47 +0000
Date: Fri, 07 Mar 2025 01:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ccs] BUILD SUCCESS
 3c93533c94aa4b609dab8ea16648ce0849a92d6c
Message-ID: <202503070106.ApMn9MGo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ccs
branch HEAD: 3c93533c94aa4b609dab8ea16648ce0849a92d6c  media: ccs-pll: Print PLL calculator flags in the beginning

elapsed time: 1452m

configs tested: 122
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250306    gcc-13.2.0
arc                   randconfig-002-20250306    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                   randconfig-001-20250306    gcc-14.2.0
arm                   randconfig-002-20250306    gcc-14.2.0
arm                   randconfig-003-20250306    gcc-14.2.0
arm                   randconfig-004-20250306    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250306    gcc-14.2.0
arm64                 randconfig-002-20250306    gcc-14.2.0
arm64                 randconfig-003-20250306    gcc-14.2.0
arm64                 randconfig-004-20250306    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250306    gcc-14.2.0
csky                  randconfig-002-20250306    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250306    clang-21
hexagon               randconfig-002-20250306    clang-19
i386        buildonly-randconfig-001-20250306    clang-19
i386        buildonly-randconfig-001-20250307    clang-19
i386        buildonly-randconfig-002-20250306    clang-19
i386        buildonly-randconfig-002-20250307    clang-19
i386        buildonly-randconfig-003-20250306    clang-19
i386        buildonly-randconfig-003-20250307    clang-19
i386        buildonly-randconfig-004-20250306    gcc-12
i386        buildonly-randconfig-004-20250307    clang-19
i386        buildonly-randconfig-005-20250306    gcc-12
i386        buildonly-randconfig-005-20250307    clang-19
i386        buildonly-randconfig-006-20250306    clang-19
i386        buildonly-randconfig-006-20250307    clang-19
i386                  randconfig-011-20250307    gcc-11
i386                  randconfig-012-20250307    gcc-11
i386                  randconfig-013-20250307    gcc-11
i386                  randconfig-014-20250307    gcc-11
i386                  randconfig-015-20250307    gcc-11
i386                  randconfig-016-20250307    gcc-11
i386                  randconfig-017-20250307    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250306    gcc-14.2.0
loongarch             randconfig-002-20250306    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250306    gcc-14.2.0
nios2                 randconfig-002-20250306    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250306    gcc-14.2.0
parisc                randconfig-002-20250306    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250306    clang-21
powerpc               randconfig-002-20250306    clang-18
powerpc               randconfig-003-20250306    gcc-14.2.0
powerpc64             randconfig-001-20250306    clang-18
powerpc64             randconfig-002-20250306    clang-21
powerpc64             randconfig-003-20250306    clang-18
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250306    clang-18
riscv                 randconfig-002-20250306    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250306    gcc-14.2.0
s390                  randconfig-002-20250306    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250306    gcc-14.2.0
sh                    randconfig-002-20250306    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250306    gcc-14.2.0
sparc                 randconfig-002-20250306    gcc-14.2.0
sparc64               randconfig-001-20250306    gcc-14.2.0
sparc64               randconfig-002-20250306    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250306    gcc-12
um                    randconfig-002-20250306    clang-16
x86_64      buildonly-randconfig-001-20250306    gcc-11
x86_64      buildonly-randconfig-001-20250307    clang-19
x86_64      buildonly-randconfig-002-20250306    clang-19
x86_64      buildonly-randconfig-002-20250307    clang-19
x86_64      buildonly-randconfig-003-20250306    clang-19
x86_64      buildonly-randconfig-003-20250307    clang-19
x86_64      buildonly-randconfig-004-20250306    clang-19
x86_64      buildonly-randconfig-004-20250307    clang-19
x86_64      buildonly-randconfig-005-20250306    clang-19
x86_64      buildonly-randconfig-005-20250307    clang-19
x86_64      buildonly-randconfig-006-20250306    gcc-12
x86_64      buildonly-randconfig-006-20250307    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250307    clang-19
x86_64                randconfig-002-20250307    clang-19
x86_64                randconfig-003-20250307    clang-19
x86_64                randconfig-004-20250307    clang-19
x86_64                randconfig-005-20250307    clang-19
x86_64                randconfig-006-20250307    clang-19
x86_64                randconfig-007-20250307    clang-19
x86_64                randconfig-008-20250307    clang-19
x86_64                randconfig-071-20250307    clang-19
x86_64                randconfig-072-20250307    clang-19
x86_64                randconfig-073-20250307    clang-19
x86_64                randconfig-074-20250307    clang-19
x86_64                randconfig-075-20250307    clang-19
x86_64                randconfig-076-20250307    clang-19
x86_64                randconfig-077-20250307    clang-19
x86_64                randconfig-078-20250307    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250306    gcc-14.2.0
xtensa                randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


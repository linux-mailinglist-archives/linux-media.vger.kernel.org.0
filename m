Return-Path: <linux-media+bounces-27793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9E3A561E4
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 08:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D90C1727FE
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 07:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D541A5B9E;
	Fri,  7 Mar 2025 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXYiObUw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3B192B7F
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332994; cv=none; b=AImgOcVqkVQYrumLq4ofK3ueF+i2ZY5/xN744PfcEfdX7LjOIX6abCKmsFcL3fwpeVImPmr1TwziUVa4tY28b5vrDe4iObVVM78fVdYgjUqYIZwbEjD7s2mviSQg25pJOIMRruGrrsFcLGdyAR20rJYbys9XOt+ciqMqkKEuFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332994; c=relaxed/simple;
	bh=EUmVSOAcnqWVtRfR+UgSD+kB+uG7pKFiuiejsMpHK+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIi9Ml3+LoEqAIwU3OnnUTJK1YYoBdQ8zKHw8p1pUvT30oZdo5u+YfBHg/bPe3BnKJoJU9iu/pkEAKBsPSoQt4xR+uCzHIiJfkWrrtinl5CdPjd8lzYYmrN1e1oCvlsTpxOVw0dnuk9r6Jn8fw3ittjc+1Ch4SpX9MN1hk08UMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXYiObUw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741332993; x=1772868993;
  h=date:from:to:cc:subject:message-id;
  bh=EUmVSOAcnqWVtRfR+UgSD+kB+uG7pKFiuiejsMpHK+4=;
  b=ZXYiObUwJoqLSoQKbEDgI09o1FzGjhinMdOTA0Qw4w9KaYGYOXTXEaW+
   gAyXJo+okHmmjPfEyHyoKEkV6yWBhs5yCbp7+LDz0TqAhxwhrqt3n8G7I
   J6A8ynEVXN05X+UMoDomRVACsctuedVVx67Tw5UE2TKEVqSD+RsvK27hv
   FEWTaVETEXfo8f1NVusRDgsuOu754jFyVPD/NhLRGzavcnCXsw6pTEYsI
   wWLoKdTAbrkbucalk5F6t7ZCUIJYKJby81DBLFH/8/8foQiKLpxmiVEqx
   XyzB/AW+eAT/4hj285+JpGdydHcSGKqt9BcDnPUEdeYC1LkfZCLW/N74o
   g==;
X-CSE-ConnectionGUID: i/oTyFzKS8GR8KflzujFWg==
X-CSE-MsgGUID: zN33Bm3nQN+MVQJZ+zYkww==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52578946"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="52578946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 23:36:33 -0800
X-CSE-ConnectionGUID: uNKbci6gRSm9rYgIQHFEzw==
X-CSE-MsgGUID: w8U004reRdSaR351pTDB6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119759880"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 23:36:31 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqSFx-00007r-04;
	Fri, 07 Mar 2025 07:36:29 +0000
Date: Fri, 07 Mar 2025 15:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 f4b211714bcc70effa60c34d9fa613d182e3ef1e
Message-ID: <202503071554.7NvMudXW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: f4b211714bcc70effa60c34d9fa613d182e3ef1e  media: venus: hfi: add a check to handle OOB in sfr region

elapsed time: 5104m

configs tested: 164
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250304    gcc-13.2.0
arc                   randconfig-001-20250306    gcc-13.2.0
arc                   randconfig-002-20250304    gcc-13.2.0
arc                   randconfig-002-20250306    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250304    clang-21
arm                   randconfig-001-20250306    gcc-14.2.0
arm                   randconfig-002-20250304    gcc-14.2.0
arm                   randconfig-002-20250306    gcc-14.2.0
arm                   randconfig-003-20250304    clang-21
arm                   randconfig-003-20250306    gcc-14.2.0
arm                   randconfig-004-20250304    gcc-14.2.0
arm                   randconfig-004-20250306    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250304    clang-21
arm64                 randconfig-001-20250306    gcc-14.2.0
arm64                 randconfig-002-20250304    gcc-14.2.0
arm64                 randconfig-002-20250306    gcc-14.2.0
arm64                 randconfig-003-20250304    gcc-14.2.0
arm64                 randconfig-003-20250306    gcc-14.2.0
arm64                 randconfig-004-20250304    gcc-14.2.0
arm64                 randconfig-004-20250306    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250304    gcc-14.2.0
csky                  randconfig-001-20250306    gcc-14.2.0
csky                  randconfig-002-20250304    gcc-14.2.0
csky                  randconfig-002-20250306    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250304    clang-21
hexagon               randconfig-001-20250306    clang-21
hexagon               randconfig-002-20250304    clang-21
hexagon               randconfig-002-20250306    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250304    clang-19
i386        buildonly-randconfig-001-20250306    clang-19
i386        buildonly-randconfig-002-20250304    clang-19
i386        buildonly-randconfig-002-20250306    clang-19
i386        buildonly-randconfig-003-20250304    gcc-12
i386        buildonly-randconfig-003-20250306    clang-19
i386        buildonly-randconfig-004-20250304    gcc-11
i386        buildonly-randconfig-004-20250306    gcc-12
i386        buildonly-randconfig-005-20250304    gcc-11
i386        buildonly-randconfig-005-20250306    gcc-12
i386        buildonly-randconfig-006-20250304    gcc-12
i386        buildonly-randconfig-006-20250306    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250304    gcc-14.2.0
loongarch             randconfig-001-20250306    gcc-14.2.0
loongarch             randconfig-002-20250304    gcc-14.2.0
loongarch             randconfig-002-20250306    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250304    gcc-14.2.0
nios2                 randconfig-001-20250306    gcc-14.2.0
nios2                 randconfig-002-20250304    gcc-14.2.0
nios2                 randconfig-002-20250306    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250304    gcc-14.2.0
parisc                randconfig-001-20250306    gcc-14.2.0
parisc                randconfig-002-20250304    gcc-14.2.0
parisc                randconfig-002-20250306    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250304    gcc-14.2.0
powerpc               randconfig-001-20250306    clang-21
powerpc               randconfig-002-20250304    gcc-14.2.0
powerpc               randconfig-002-20250306    clang-18
powerpc               randconfig-003-20250304    clang-21
powerpc               randconfig-003-20250306    gcc-14.2.0
powerpc64             randconfig-001-20250304    gcc-14.2.0
powerpc64             randconfig-001-20250306    clang-18
powerpc64             randconfig-002-20250304    gcc-14.2.0
powerpc64             randconfig-002-20250306    clang-21
powerpc64             randconfig-003-20250304    clang-21
powerpc64             randconfig-003-20250306    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250304    gcc-14.2.0
riscv                 randconfig-001-20250306    clang-18
riscv                 randconfig-002-20250304    gcc-14.2.0
riscv                 randconfig-002-20250306    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250304    clang-15
s390                  randconfig-001-20250306    gcc-14.2.0
s390                  randconfig-002-20250304    clang-15
s390                  randconfig-002-20250306    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250304    gcc-14.2.0
sh                    randconfig-001-20250306    gcc-14.2.0
sh                    randconfig-002-20250304    gcc-14.2.0
sh                    randconfig-002-20250306    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250304    gcc-14.2.0
sparc                 randconfig-001-20250306    gcc-14.2.0
sparc                 randconfig-002-20250304    gcc-14.2.0
sparc                 randconfig-002-20250306    gcc-14.2.0
sparc64               randconfig-001-20250304    gcc-14.2.0
sparc64               randconfig-001-20250306    gcc-14.2.0
sparc64               randconfig-002-20250304    gcc-14.2.0
sparc64               randconfig-002-20250306    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250304    gcc-12
um                    randconfig-001-20250306    gcc-12
um                    randconfig-002-20250304    gcc-12
um                    randconfig-002-20250306    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250304    clang-19
x86_64      buildonly-randconfig-001-20250306    gcc-11
x86_64      buildonly-randconfig-002-20250304    gcc-12
x86_64      buildonly-randconfig-002-20250306    clang-19
x86_64      buildonly-randconfig-003-20250304    gcc-12
x86_64      buildonly-randconfig-003-20250306    clang-19
x86_64      buildonly-randconfig-004-20250304    gcc-12
x86_64      buildonly-randconfig-004-20250306    clang-19
x86_64      buildonly-randconfig-005-20250304    gcc-12
x86_64      buildonly-randconfig-005-20250306    clang-19
x86_64      buildonly-randconfig-006-20250304    gcc-12
x86_64      buildonly-randconfig-006-20250306    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250304    gcc-14.2.0
xtensa                randconfig-001-20250306    gcc-14.2.0
xtensa                randconfig-002-20250304    gcc-14.2.0
xtensa                randconfig-002-20250306    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


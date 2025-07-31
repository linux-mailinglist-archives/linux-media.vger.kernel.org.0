Return-Path: <linux-media+bounces-38691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950FB16DFE
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 10:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B721AA645D
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 08:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67CE28FFF6;
	Thu, 31 Jul 2025 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1wK3LQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F821FF4C
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753952250; cv=none; b=MUpHoeD7SFt4pLpJHGO9fibxmazTGz0RtUpVtAZ2YWeFpHUY75hNTjrTZQtq5Zlor2ynGB+/Z/5onjbyUwZutr6lXmvW9VsjFj2Hby/R0ND8NgxdLiIVBYpf5dG8OTHoTLxZHRMzxKy3StVgpy2Bd+bIxoOajUnl61Fg1E4c6e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753952250; c=relaxed/simple;
	bh=S1cx+9IhDBoCw9fmf+QjR0p/HuXPxawzG8ZeikTzatI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cRufloPaMf2VKbAAOPeIVITNUGBGYe/S420Mz74IzdyUexd4wSQ06YMH9FphXJcNJBOCUSvuIIrWfLxIw8Wz9IkoQY5w08kIMoHQvhpqDFmXRt1i7L9khLo//pPRTVZ4ftaAHAD1dHIUnXNxvLTO2GR25a5krdREJlvqs6vASok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1wK3LQ3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753952248; x=1785488248;
  h=date:from:to:cc:subject:message-id;
  bh=S1cx+9IhDBoCw9fmf+QjR0p/HuXPxawzG8ZeikTzatI=;
  b=Y1wK3LQ3WMRToqUHCXp2qKVUipib7m8udJHBGjnHefEpR242HFzrpp7j
   MDxlzNEK8Ahju8+Mm6EzjdevX+bpm2HBt3S80qAePAVtpsfFglqsGptVK
   o6SNkxDKevJxmKrKSRPVWURbx98rPQ4ID216UiIlP6v6UxX1HyBEastT4
   kDnj4ZAmGeYsA6nlkstHjSCt62+KupQVeJPnKRzf846reY5EhnCYoyhbi
   dlPJGxcwmLKasypTrT+p69WAZF8UsxfgEnPlGk5rIQYLCS5Cw+VhHokv+
   lycxvUBy1daPv72W9tckZP0rch+qzHmGWenGJ7V4HzLIFj0cX9pXUta2O
   g==;
X-CSE-ConnectionGUID: 2uva9eYjSeeQ3jvmTVQltg==
X-CSE-MsgGUID: 15YFDOknR76s2e//QPSbbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43872143"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="43872143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 01:57:24 -0700
X-CSE-ConnectionGUID: tk0zzoGaQWml87msShYHFQ==
X-CSE-MsgGUID: D0jzsCmcT+GxKJmB827n+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162487685"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2025 01:57:24 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhP6G-0003Zw-2m;
	Thu, 31 Jul 2025 08:57:20 +0000
Date: Thu, 31 Jul 2025 16:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:eusb2] BUILD SUCCESS
 5021b45920d47a704e369135364b63e426c35677
Message-ID: <202507311615.Fu9dhnpP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git eusb2
branch HEAD: 5021b45920d47a704e369135364b63e426c35677  media: uvcvideo: eUSB2 double isochronous bandwidth support

elapsed time: 1064m

configs tested: 152
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250731    gcc-13.4.0
arc                   randconfig-002-20250731    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250731    gcc-14.3.0
arm                   randconfig-002-20250731    gcc-8.5.0
arm                   randconfig-003-20250731    gcc-8.5.0
arm                   randconfig-004-20250731    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250731    gcc-8.5.0
arm64                 randconfig-002-20250731    gcc-13.4.0
arm64                 randconfig-003-20250731    gcc-10.5.0
arm64                 randconfig-004-20250731    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250731    gcc-12.5.0
csky                  randconfig-002-20250731    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250731    clang-16
hexagon               randconfig-002-20250731    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250731    gcc-12
i386        buildonly-randconfig-002-20250731    gcc-12
i386        buildonly-randconfig-003-20250731    clang-20
i386        buildonly-randconfig-003-20250731    gcc-12
i386        buildonly-randconfig-004-20250731    gcc-12
i386        buildonly-randconfig-005-20250731    gcc-12
i386        buildonly-randconfig-006-20250731    clang-20
i386        buildonly-randconfig-006-20250731    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250731    gcc-12
i386                  randconfig-002-20250731    gcc-12
i386                  randconfig-003-20250731    gcc-12
i386                  randconfig-004-20250731    gcc-12
i386                  randconfig-005-20250731    gcc-12
i386                  randconfig-006-20250731    gcc-12
i386                  randconfig-007-20250731    gcc-12
i386                  randconfig-011-20250731    gcc-12
i386                  randconfig-012-20250731    gcc-12
i386                  randconfig-013-20250731    gcc-12
i386                  randconfig-014-20250731    gcc-12
i386                  randconfig-015-20250731    gcc-12
i386                  randconfig-016-20250731    gcc-12
i386                  randconfig-017-20250731    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250731    gcc-13.4.0
loongarch             randconfig-002-20250731    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip27_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250731    gcc-11.5.0
nios2                 randconfig-002-20250731    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250731    gcc-8.5.0
parisc                randconfig-002-20250731    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    clang-22
powerpc               randconfig-001-20250731    gcc-13.4.0
powerpc               randconfig-002-20250731    gcc-13.4.0
powerpc               randconfig-003-20250731    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250731    clang-22
powerpc64             randconfig-002-20250731    gcc-12.5.0
powerpc64             randconfig-003-20250731    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250731    gcc-13.4.0
riscv                 randconfig-002-20250731    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250731    clang-22
s390                  randconfig-002-20250731    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250731    gcc-10.5.0
sh                    randconfig-002-20250731    gcc-9.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250731    gcc-8.5.0
sparc                 randconfig-002-20250731    gcc-11.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250731    gcc-8.5.0
sparc64               randconfig-002-20250731    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250731    clang-22
um                    randconfig-002-20250731    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250731    gcc-12
x86_64      buildonly-randconfig-002-20250731    clang-20
x86_64      buildonly-randconfig-002-20250731    gcc-12
x86_64      buildonly-randconfig-003-20250731    gcc-12
x86_64      buildonly-randconfig-004-20250731    gcc-12
x86_64      buildonly-randconfig-005-20250731    gcc-12
x86_64      buildonly-randconfig-006-20250731    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250731    gcc-14.3.0
xtensa                randconfig-002-20250731    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


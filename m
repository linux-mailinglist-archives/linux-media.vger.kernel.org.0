Return-Path: <linux-media+bounces-49235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8431CD2ED9
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AADD530142CA
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 12:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218A020E702;
	Sat, 20 Dec 2025 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2qRUAXP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A04153BE9
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766234875; cv=none; b=kzDhdKOExcQkjWMj/r/0pf4HI9vdiLWmCQ51wlot8uvirgPZA0R+PKUIu1nkKq4Th7cF5wXj6pi9S4oYPUEeExrmRFT6hBHP/BYIoMob1363ZRSE4Qnao64SNx0SimXoMYh4BziFX2sxn48AGslgIe9hVCvilMe9jrSO5yDb0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766234875; c=relaxed/simple;
	bh=3pekgqtxVE7G7FR3OL0e7pWbpR0XzOWI+5MTbzmfNN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=awGfUwaJ1q5mksoiQX7VSsHj0vGvbBHR8JMYNFlJjidh2F7P+7ysZ20dOz/pp57XwPuK32p6waoRZ0Qw69z6EhBhX60HecAErxMyK/Pm1+BvR5DwFbGdFa8S4o9/OllDcy5hlLdWs35S2or+bpUl4f1SLlWQnz44Ekjzci2Gocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2qRUAXP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766234874; x=1797770874;
  h=date:from:to:cc:subject:message-id;
  bh=3pekgqtxVE7G7FR3OL0e7pWbpR0XzOWI+5MTbzmfNN4=;
  b=E2qRUAXPvjJniQzT4TX7bqU7rwAafpEYhiIcaDai0AuNqgsJpivrUNZL
   ElrtRxcTQnhTwza0MBAAl2xTsOctfjXs7YdUQRDp+DnyhOD44OXmGHjWs
   Wj0hERerObg4ibZer3aSJBqAPwy61+nCvKcLcaIh5OxVLqEkdMCZiXhLp
   ckocFNlDUqkVaEu4a5BXyLAHKgE0XIHgfpICQqYbIG1O3zEGmDooIt9fL
   Khr73o4tCVpGeRse6lkZ6GtOTv0xOcfw5c1/csBD4HWgDZSt8xpLWaj7m
   xt306TBZs5dWFo6RnhJMU8nuPJ2FNPqPCbOf8kOG419CEmI6ncZf9C34j
   w==;
X-CSE-ConnectionGUID: mRZuAPmLTeqpUv7eK4cCmw==
X-CSE-MsgGUID: sElv6nP4QGCOq0Ji5paH+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68066815"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68066815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:47:53 -0800
X-CSE-ConnectionGUID: 3jJ2tv3RQvibwYa8dJ0+tw==
X-CSE-MsgGUID: bGJ9DuT2SJmy3Pxeq9QW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199622732"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 04:47:51 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWwNB-000000004Wr-20I5;
	Sat, 20 Dec 2025 12:47:49 +0000
Date: Sat, 20 Dec 2025 20:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:flash-duration] BUILD SUCCESS
 03abfef3039efee3d546dd9f6b8e457cb8596b0c
Message-ID: <202512202041.EBsC0Qta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git flash-duration
branch HEAD: 03abfef3039efee3d546dd9f6b8e457cb8596b0c  media: i2c: ov9282: dynamic flash_duration maximum

elapsed time: 1462m

configs tested: 94
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                           h3600_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251220    clang-20
x86_64      buildonly-randconfig-002-20251220    clang-20
x86_64      buildonly-randconfig-003-20251220    clang-20
x86_64      buildonly-randconfig-004-20251220    clang-20
x86_64      buildonly-randconfig-005-20251220    clang-20
x86_64      buildonly-randconfig-006-20251220    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


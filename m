Return-Path: <linux-media+bounces-35717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04266AE5CE8
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84F2B4A6571
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 06:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6F323C51F;
	Tue, 24 Jun 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXlTukXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8982864
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747004; cv=none; b=m2LI16XUlprkXAauxeTecLVhQ8BtR6BNhNxLnvCFJVfdkN4RpEx4B+bCxiP6K1/UV8wjulB/30PttNlKLBOORRNhSmxcb620IHD2CB/8ULEc+gEiY4tIuVXXxysnnt3dS+tQynVbm3lhoF37UKsM3+/2cJjwc/Gyov2NYqU8wB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747004; c=relaxed/simple;
	bh=v5LOKQvXLlwJkoy+NH3JFZdxGDZKNjbmVUAvyUhegEo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XK1qwNMvGuynsc5pF/XB9duv2jATk7orE0lkbyou0y9HvwxKT5tDAmHYFvChz0//PisOX1bMEWh+GQWQSH+xGgzSsjqdGuIcQrzHDh62livOpjKlqn14Z0KXglSE1Xf6OgBM68dMUIXKJzS1kPaPNoT1DjAv4PaeK8u5J8tGpuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXlTukXZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750747003; x=1782283003;
  h=date:from:to:cc:subject:message-id;
  bh=v5LOKQvXLlwJkoy+NH3JFZdxGDZKNjbmVUAvyUhegEo=;
  b=QXlTukXZd4JYFYLXXH0pwIC/jqg/CWX0Eg2he0WMQVV6nLp7U6nDN5n8
   N7lU+RGXaPoYakTfhG42voTrldsQw820ouLNwimhSOkfKoHnHJx0IdurJ
   GqFwce8iwkvu9I9AD5I6vt0Pw7GO4fY68GSjx8AuRjzI1AQg2xAaZRh6n
   9cdJTQ2A7mK1QLYZlAbZUQgNge3UqFVxXu4xCCZFTW9cGpkvBhUrF+NWu
   zQaAW5PXGfeEKaZtSXEDrEqE8vcJr2czMYaPLKkZjT2PgiEL4Cnzj3hib
   s8qdvx3i4OYS1H0d1jiXZcCvq+NdTwrUAzjudQtr85JA945DylG49bjjp
   w==;
X-CSE-ConnectionGUID: FYigNtFtRW+hdSTQNmcpVA==
X-CSE-MsgGUID: lglZF79zTJC3Q5gklQ5Xrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55602375"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="55602375"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:36:42 -0700
X-CSE-ConnectionGUID: JRiIFrZjTIaP3NJkwwkB1A==
X-CSE-MsgGUID: RQw0qlnNRO+3jsUJFEldng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="156209310"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2025 23:36:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTxGo-000RoU-0J;
	Tue, 24 Jun 2025 06:36:38 +0000
Date: Tue, 24 Jun 2025 14:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 5e2562c1e46d3623fbdef77693f374eade075840
Message-ID: <202506241432.sgaFNQH8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 5e2562c1e46d3623fbdef77693f374eade075840  media: i2c: max96714: Drop check on number of active routes

elapsed time: 884m

configs tested: 97
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250624    gcc-12.4.0
arc                   randconfig-001-20250624    gcc-8.5.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250624    gcc-13.3.0
arm                   randconfig-001-20250624    gcc-8.5.0
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-12.4.0
arm                   randconfig-003-20250624    gcc-8.5.0
arm                   randconfig-004-20250624    clang-17
arm                   randconfig-004-20250624    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250624    clang-21
arm64                 randconfig-001-20250624    gcc-8.5.0
arm64                 randconfig-002-20250624    gcc-10.5.0
arm64                 randconfig-002-20250624    gcc-8.5.0
arm64                 randconfig-003-20250624    clang-21
arm64                 randconfig-003-20250624    gcc-8.5.0
arm64                 randconfig-004-20250624    clang-21
arm64                 randconfig-004-20250624    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-001-20250624    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-003-20250624    gcc-12
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-004-20250624    gcc-12
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-005-20250624    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    clang-20
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


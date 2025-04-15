Return-Path: <linux-media+bounces-30222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D059A8974C
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 10:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C95B189651A
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 08:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069A827B4ED;
	Tue, 15 Apr 2025 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAhMsAN1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D606A1C5F13
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707563; cv=none; b=OrPw/XRpwVsV8fLbt6AlDOUJF0kiqfR7DOj2+A34zFWCRyV6Sh91xux2DjiqZgVcG1x/ourSmHOm+ahWP4jEDbXDiLasYbdMUQnjCW3Bv6UflJv9ju4WVwNWH4BmA0JhVbW+LDT/1SQ9Y6lQWD9lMAkCOSXfyp83yDDBEM9xkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707563; c=relaxed/simple;
	bh=44gR+RWorjIEb3cR2Jf/EGY+zSJyAKbLhhW97UKDkas=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsd8u0AZ+dfT8cPXWSRLRu8dimXzYB67T7BTjqDzC7XNOGKPA0kzWRjQLjinPz8sAgEIOngjuGagi+okcNiLyZVWpeRH9zar8mfD0z330RXPDpWSRFXje5BImg5cPipRDeaZsCgoyagTE8sSo+pWKtR2cBiena9g6iwEWyILYfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAhMsAN1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744707562; x=1776243562;
  h=date:from:to:cc:subject:message-id;
  bh=44gR+RWorjIEb3cR2Jf/EGY+zSJyAKbLhhW97UKDkas=;
  b=DAhMsAN1hG8/xBXO6s0SPpf+XdPVO4IN7gn3SEeTOuVsG84qNSv/fngR
   jA0OtfMwMP0pnCxNR7+6WzeefUanZAYQDn9m1yfxGppIFNSU3DFZbC05A
   P3Yw/ySs8AacO0W78k3bXtg3tRmRXvrO79XNvVLsBo3YWRMTkQ0tE1A17
   Grd62HOrhoqRi/C2+yNr5SClKWNid5PfuW+ctvOPuCLx3pF58ufWOycar
   S9So2NyIumHs8CfpY4oz6zE2VVKWjAuXkjiYwJfKnQ1670HwoPZRaQXUU
   tdQ2mlrgggrx/4XlWp/QLl4hqP3pUW7hjhrq6KJlqnJ6vnKdXgMVg2pQe
   Q==;
X-CSE-ConnectionGUID: 3A9WRc6HTiyiakPAb/1GlA==
X-CSE-MsgGUID: OjhYeWP6Q26ILsE66UvhNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56865578"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="56865578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:59:21 -0700
X-CSE-ConnectionGUID: kQkKbWBIRHO1621tKvTn7Q==
X-CSE-MsgGUID: e4mG32vCRXqlI6nthV8B4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135242603"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2025 01:59:20 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4c8T-000FSQ-1i;
	Tue, 15 Apr 2025 08:59:17 +0000
Date: Tue, 15 Apr 2025 16:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 caca9090fc78bba8d11f1da55d97393b8fa781cf
Message-ID: <202504151631.tEOK4F8W-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: caca9090fc78bba8d11f1da55d97393b8fa781cf  media: i2c: imx219: Add embedded data support

elapsed time: 1463m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                   randconfig-001-20250414    gcc-14.2.0
arc                   randconfig-002-20250414    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250414    clang-18
arm                   randconfig-002-20250414    gcc-7.5.0
arm                   randconfig-003-20250414    gcc-7.5.0
arm                   randconfig-004-20250414    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250414    clang-21
arm64                 randconfig-002-20250414    clang-19
arm64                 randconfig-003-20250414    gcc-8.5.0
arm64                 randconfig-004-20250414    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250414    gcc-14.2.0
csky                  randconfig-002-20250414    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250414    clang-18
hexagon               randconfig-002-20250414    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250414    gcc-12
i386        buildonly-randconfig-002-20250414    clang-20
i386        buildonly-randconfig-003-20250414    clang-20
i386        buildonly-randconfig-004-20250414    gcc-12
i386        buildonly-randconfig-005-20250414    gcc-12
i386        buildonly-randconfig-006-20250414    gcc-12
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250414    gcc-12.4.0
loongarch             randconfig-002-20250414    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250414    gcc-12.4.0
nios2                 randconfig-002-20250414    gcc-12.4.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250414    gcc-5.5.0
parisc                randconfig-002-20250414    gcc-7.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc               randconfig-001-20250414    gcc-8.5.0
powerpc               randconfig-002-20250414    clang-21
powerpc               randconfig-003-20250414    gcc-6.5.0
powerpc64             randconfig-001-20250414    clang-17
powerpc64             randconfig-002-20250414    clang-21
powerpc64             randconfig-003-20250414    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250414    gcc-8.5.0
riscv                 randconfig-002-20250414    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250414    clang-20
s390                  randconfig-002-20250414    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250414    gcc-6.5.0
sh                    randconfig-002-20250414    gcc-10.5.0
sh                           se7722_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250414    gcc-11.5.0
sparc                 randconfig-002-20250414    gcc-13.3.0
sparc64               randconfig-001-20250414    gcc-5.5.0
sparc64               randconfig-002-20250414    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250414    clang-21
um                    randconfig-002-20250414    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250414    clang-20
x86_64      buildonly-randconfig-002-20250414    clang-20
x86_64      buildonly-randconfig-003-20250414    clang-20
x86_64      buildonly-randconfig-004-20250414    clang-20
x86_64      buildonly-randconfig-005-20250414    clang-20
x86_64      buildonly-randconfig-006-20250414    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250414    gcc-7.5.0
xtensa                randconfig-002-20250414    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-50275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D8BD08637
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 11:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A919130312E0
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B340F334692;
	Fri,  9 Jan 2026 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+IMqNhV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B9E329390
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952896; cv=none; b=bQvFg3oEjJI5s2aaWhtb1RZ+J80dxjgFdgHRa6XAAiwxrEmvvKIKDMN4Cin9QDAbzOGcSlUUGhIu0oGqjn1ZP6gf3qDBsU7fxgjlnqmcHhCc+fYjc7OtDcOjAQ4W/eBkk+e293syLYQ4QigZz/FCIo9lVpFNiXIXeJlOnBFktNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952896; c=relaxed/simple;
	bh=Cvpoz9GABsXijK6MZLFLlRL9Ws/h5Zbiivk0aPoRqfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpT0ProVasvjmnsqAiVsQ5q9xJ3HI36tUbdXHfnombWUkUqLvDndQ9YM6WXrnHVI9a2qjl2KEn5gkntC0SFPf7h6Qk9WKv+Tnq1yFBmW+76KH2SMeMeDWjqoh6MZvfFDuKgzJSeza5R2pdeYe+bCoVN8RdgtelrQy5/LkGGSto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+IMqNhV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767952894; x=1799488894;
  h=date:from:to:cc:subject:message-id;
  bh=Cvpoz9GABsXijK6MZLFLlRL9Ws/h5Zbiivk0aPoRqfw=;
  b=f+IMqNhVZClj7QSs/tmB9nKx9btcoIYM7/iORh7+Pj8z7nwnRt2GygJu
   cIhJFKzDwSj8oDnHWH74sFxP4YrtsEZz2FGCUEySePsgVAOAmEontQHJ7
   pmQYUc8nDQT4j7c46Rt5jJsvGAgE1MDjr7T4j0ozOXx58R5USihcw5SCL
   zVcTFwOX3QhAfBKtSc5+sGnHvrcIcjzhq5r7zdpftivGVKdt02Mu6dhYB
   S2tagcH3XHZ3aIkBhdLOj78RAUNcDsFKaMIEX8XbefChwqGriiLp9olV1
   hcxLLwh1ijCMe+SYxhxoWrQxTyTfhvTmIF4/4Vkre2eMNVfLV+lgor1Tx
   g==;
X-CSE-ConnectionGUID: P9FC+pI3R+Osc5oyvKafPA==
X-CSE-MsgGUID: 9Ie7yivLR+yA36IJIyqNJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69246566"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69246566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:01:34 -0800
X-CSE-ConnectionGUID: RmURfDcmSUK/dn0gV3P++A==
X-CSE-MsgGUID: Kn34J/4+RjGVKXaRUXEZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203460709"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jan 2026 02:01:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve9JB-000000005iy-3erj;
	Fri, 09 Jan 2026 10:01:29 +0000
Date: Fri, 09 Jan 2026 18:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 d2432f513e7655050d03fd609a715ea833f5f598
Message-ID: <202601091830.36XV7Xws-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: d2432f513e7655050d03fd609a715ea833f5f598  media: i2c: add os05b10 image sensor driver

elapsed time: 2042m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260109    gcc-13.4.0
arc                   randconfig-002-20260109    gcc-9.5.0
arm                       netwinder_defconfig    gcc-15.2.0
arm                   randconfig-001-20260109    gcc-10.5.0
arm                   randconfig-002-20260109    gcc-15.2.0
arm                   randconfig-003-20260109    gcc-8.5.0
arm                   randconfig-004-20260109    gcc-11.5.0
arm64                 randconfig-001-20260109    clang-22
arm64                 randconfig-002-20260109    clang-22
arm64                 randconfig-003-20260109    gcc-11.5.0
arm64                 randconfig-004-20260109    gcc-8.5.0
csky                  randconfig-001-20260109    gcc-9.5.0
csky                  randconfig-002-20260109    gcc-15.2.0
hexagon               randconfig-001-20260109    clang-22
hexagon               randconfig-002-20260109    clang-17
i386        buildonly-randconfig-001-20260109    clang-20
i386        buildonly-randconfig-002-20260109    gcc-14
i386        buildonly-randconfig-003-20260109    gcc-14
i386        buildonly-randconfig-004-20260109    clang-20
i386        buildonly-randconfig-005-20260109    gcc-12
i386        buildonly-randconfig-006-20260109    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260109    gcc-14
i386                  randconfig-002-20260109    gcc-14
i386                  randconfig-003-20260109    gcc-12
i386                  randconfig-004-20260109    gcc-14
i386                  randconfig-005-20260109    gcc-14
i386                  randconfig-006-20260109    clang-20
i386                  randconfig-007-20260109    gcc-14
i386                  randconfig-011-20260109    clang-20
i386                  randconfig-012-20260109    gcc-14
i386                  randconfig-013-20260109    clang-20
i386                  randconfig-014-20260109    gcc-14
i386                  randconfig-015-20260109    clang-20
i386                  randconfig-016-20260109    clang-20
i386                  randconfig-017-20260109    clang-20
loongarch             randconfig-001-20260109    clang-22
loongarch             randconfig-002-20260109    gcc-15.2.0
m68k                          amiga_defconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260109    gcc-8.5.0
nios2                 randconfig-002-20260109    gcc-8.5.0
openrisc                            defconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260109    gcc-12.5.0
parisc                randconfig-002-20260109    gcc-15.2.0
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    gcc-15.2.0
powerpc                     ksi8560_defconfig    gcc-15.2.0
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc               randconfig-001-20260109    clang-22
powerpc               randconfig-002-20260109    clang-22
powerpc64             randconfig-001-20260109    gcc-15.2.0
powerpc64             randconfig-002-20260109    gcc-8.5.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260109    gcc-14.3.0
riscv                 randconfig-002-20260109    gcc-8.5.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260109    clang-22
s390                  randconfig-002-20260109    clang-22
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260109    gcc-14.3.0
sh                    randconfig-002-20260109    gcc-13.4.0
sh                            shmin_defconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260109    gcc-8.5.0
sparc                 randconfig-002-20260109    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260109    gcc-8.5.0
sparc64               randconfig-002-20260109    clang-20
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260109    gcc-14
um                    randconfig-002-20260109    gcc-14
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260109    clang-20
x86_64      buildonly-randconfig-002-20260109    gcc-14
x86_64      buildonly-randconfig-003-20260109    gcc-14
x86_64      buildonly-randconfig-004-20260109    gcc-14
x86_64      buildonly-randconfig-005-20260109    gcc-14
x86_64      buildonly-randconfig-006-20260109    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260109    clang-20
x86_64                randconfig-002-20260109    clang-20
x86_64                randconfig-003-20260109    gcc-14
x86_64                randconfig-004-20260109    clang-20
x86_64                randconfig-005-20260109    clang-20
x86_64                randconfig-006-20260109    gcc-14
x86_64                randconfig-071-20260109    gcc-14
x86_64                randconfig-072-20260109    clang-20
x86_64                randconfig-073-20260109    gcc-14
x86_64                randconfig-074-20260109    gcc-14
x86_64                randconfig-075-20260109    gcc-14
x86_64                randconfig-076-20260109    gcc-12
xtensa                randconfig-001-20260109    gcc-12.5.0
xtensa                randconfig-002-20260109    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


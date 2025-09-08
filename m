Return-Path: <linux-media+bounces-42043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BDBB499E9
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 21:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A57A440D26
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 19:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9155E27F728;
	Mon,  8 Sep 2025 19:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/c7v1UR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D6925634
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359725; cv=none; b=ROIx6zr3qVlsJZP6Ssk7fdDWXZsHPKzvUXlQrG1nR7ry4qqo9mfHeSKfWj4rOrKCyl4cUMpChMWDa6r9BgRlxzEz3SOyQDmh/IpXa4t+sBp2HLdNub94T6BibAobhfu1JbbDr5IDV6Zx+LyFS7r7QRiAT6HwRc9hOMjK0ViCkOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359725; c=relaxed/simple;
	bh=Uw9KHaD+rQjefhG8/lbymmjdYXLlDgKi0MDnV0a93eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jK3PFlm48nCyEalLkUMOl1nymyicoODjFAJABG5Vu4kX3MDl3HEluYrUsTgF8JHsrs9okmONzyVbk93HPeHCnsVgSCQ5Q12AZQ8iUtJovFhMYXWudjXMX5cbM/IVltpJ+RRcZySiqhk7WYKdADItKf7VYibWlx3ercJGJAN0PjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/c7v1UR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757359724; x=1788895724;
  h=date:from:to:cc:subject:message-id;
  bh=Uw9KHaD+rQjefhG8/lbymmjdYXLlDgKi0MDnV0a93eI=;
  b=V/c7v1URNZH3v5FLhtX/yl4Fa6Aj6drdBeZoDV/Rg5PMh+G06AGV9F5z
   4HrnscePb6HP5n435dgsbvBLCM6dh2+qbXkgGXY8rU9alZJgDl4q0kogo
   0JZzDumkss4gNUWDaMgqYVA45vw+cCyDpkQhRAWcqjedn25RGxiLjeqTl
   q4pTVMA8kJU8P6c9nRO/FdRHgKUS2hqUnpfVSgRO7IQKNsYnKlmSuhbcD
   VyYh7GtHPmy+nE90CX2sPqG4vIzqce0eDRA/RAMVHrCjQy6NE6m+ETvdG
   qYRebEx8WcOLCA4iDGp0AgL4s6ay5mGDlK3YdNZd3TmtE6GTTui103qOD
   w==;
X-CSE-ConnectionGUID: p9xN4606Thuo274GmwpsSQ==
X-CSE-MsgGUID: 7/87QrjLTcuFsgXSk7sOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47202475"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="47202475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 12:28:41 -0700
X-CSE-ConnectionGUID: Gb7Hy269QAS/eUr+VtiRgA==
X-CSE-MsgGUID: 3IMf5GoISVeRak3XPrLLSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="177214179"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2025 12:28:37 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvhXX-00046A-0Q;
	Mon, 08 Sep 2025 19:28:35 +0000
Date: Tue, 09 Sep 2025 03:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 e9fc898cd700db03138475b0970d51e450b9f927
Message-ID: <202509090312.Xls27hK7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: e9fc898cd700db03138475b0970d51e450b9f927  media: ov08x40: Fix the horizontal flip control

elapsed time: 737m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250908    gcc-8.5.0
arc                   randconfig-002-20250908    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250908    clang-22
arm                   randconfig-002-20250908    clang-22
arm                   randconfig-003-20250908    gcc-12.5.0
arm                   randconfig-004-20250908    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250908    clang-20
arm64                 randconfig-002-20250908    clang-16
arm64                 randconfig-003-20250908    gcc-9.5.0
arm64                 randconfig-004-20250908    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250908    gcc-14.3.0
csky                  randconfig-002-20250908    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250908    clang-17
hexagon               randconfig-002-20250908    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250908    gcc-13
i386        buildonly-randconfig-002-20250908    gcc-13
i386        buildonly-randconfig-003-20250908    gcc-13
i386        buildonly-randconfig-004-20250908    gcc-13
i386        buildonly-randconfig-005-20250908    clang-20
i386        buildonly-randconfig-006-20250908    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250908    gcc-15.1.0
loongarch             randconfig-002-20250908    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250908    gcc-8.5.0
nios2                 randconfig-002-20250908    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250908    gcc-13.4.0
parisc                randconfig-002-20250908    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250908    gcc-15.1.0
powerpc               randconfig-002-20250908    clang-19
powerpc               randconfig-003-20250908    gcc-9.5.0
powerpc64             randconfig-001-20250908    gcc-8.5.0
powerpc64             randconfig-002-20250908    gcc-10.5.0
powerpc64             randconfig-003-20250908    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250908    gcc-11.5.0
riscv                 randconfig-002-20250908    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250908    clang-22
s390                  randconfig-002-20250908    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250908    gcc-14.3.0
sh                    randconfig-002-20250908    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250908    gcc-8.5.0
sparc                 randconfig-002-20250908    gcc-12.5.0
sparc64               randconfig-001-20250908    gcc-13.4.0
sparc64               randconfig-002-20250908    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-13
um                    randconfig-001-20250908    gcc-13
um                    randconfig-002-20250908    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250908    clang-20
x86_64      buildonly-randconfig-002-20250908    gcc-13
x86_64      buildonly-randconfig-003-20250908    gcc-13
x86_64      buildonly-randconfig-004-20250908    gcc-11
x86_64      buildonly-randconfig-005-20250908    gcc-13
x86_64      buildonly-randconfig-006-20250908    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250908    gcc-9.5.0
xtensa                randconfig-002-20250908    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


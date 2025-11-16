Return-Path: <linux-media+bounces-47173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C65C61094
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 06:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CADE4E5581
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 05:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC732288E3;
	Sun, 16 Nov 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8uSrP/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE33398A
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763272334; cv=none; b=e6agi69VUbimCmKQ4tutPyQqCDI4Ouolh7IxwMTytmPWUGtTM8XYdTXsyIaGiCOrGYSoP5ZAOlyoSKWZvNW1h+2hQ5uM/BzdQ+Zd91HWRr9WMz6z460L6iIe+5pzeRVQFYict4XWfHMvHnpdfbrKDs7s/yuvPdf8VhNLFlPrQq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763272334; c=relaxed/simple;
	bh=BBU+aO+lAqSd1MRSRrfozKcCmoiYTn/XsFeTRWlXGCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xhlp+WVm3C5RSAsuAifftbHvOWcU3+ce0+fFz7ZSChtaXfccLdaX6MLXe1tcVHPJvaOd/rVwOC7mwXBAt5ArAtRkBQ6ccm2427abXkrLK70yNbHpZa71E1wAuBFcTmsXYNPmMCGuZ+MLzyYnjVyE13Lb1U6jFMmXXxCtNIOYqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8uSrP/x; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763272333; x=1794808333;
  h=date:from:to:cc:subject:message-id;
  bh=BBU+aO+lAqSd1MRSRrfozKcCmoiYTn/XsFeTRWlXGCY=;
  b=D8uSrP/xjkW7DRPLTKxPzcT+9m+McQ/Z4MDzOeIZZp07MJxJfvMwswYV
   23vHB5k8sC2WkDY6DzBDevkt1EwCpqlwzGv2wEMSnnxJ/lHyHdhbBdNPW
   RXFRhjEypNunKvye0qtDFYtJZ8fple1s+3TwjR2M6lpWRdCHGh6wFWkb8
   5mj9VlND5MOA4jLH+IN+clNwcjfKgOVg6wtRN1+v+PKuyLRnRY/Cu05de
   llIsWppdSgH+o0Ji8bPR0b876kDRpK0p8T6btzJhA8/M0qzKXeEqMA34Q
   866q64+oqkeDKb+qxSl9D/P7vramwJaemNjuof6QnEX3Hovm4iRvLEsEZ
   A==;
X-CSE-ConnectionGUID: gBj8CB5ZSimMgnElEQNZzg==
X-CSE-MsgGUID: zskenS9sTQSvJHvtaONZ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="87955311"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="87955311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 21:52:12 -0800
X-CSE-ConnectionGUID: G+HeHEfjSVi34gpaOQdfoQ==
X-CSE-MsgGUID: oz/5Kox3SC+C1WkJ2T3q+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="220813780"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2025 21:52:10 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKVgG-0008X5-11;
	Sun, 16 Nov 2025 05:52:08 +0000
Date: Sun, 16 Nov 2025 13:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 4c6cd542d00c0fcb8ded090698e28083eb66a9cc
Message-ID: <202511161314.SQ6h5Bqt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 4c6cd542d00c0fcb8ded090698e28083eb66a9cc  media: v4l2-fwnode: Allow passing NULL fwnode to endpoint parsers

elapsed time: 2274m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-002-20251115    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-004-20251115    clang-22
arm                        spear3xx_defconfig    clang-17
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251115    clang-16
hexagon               randconfig-002-20251115    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251116    clang-20
i386        buildonly-randconfig-002-20251116    clang-20
i386        buildonly-randconfig-003-20251116    clang-20
i386        buildonly-randconfig-004-20251116    gcc-14
i386        buildonly-randconfig-005-20251116    clang-20
i386        buildonly-randconfig-006-20251116    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251116    gcc-14
i386                  randconfig-003-20251116    gcc-14
i386                  randconfig-011-20251116    clang-20
i386                  randconfig-012-20251116    gcc-14
i386                  randconfig-013-20251116    gcc-14
i386                  randconfig-014-20251116    clang-20
i386                  randconfig-015-20251116    gcc-12
i386                  randconfig-016-20251116    clang-20
i386                  randconfig-017-20251116    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251115    clang-18
loongarch             randconfig-002-20251115    gcc-13.4.0
m68k                              allnoconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251115    gcc-8.5.0
nios2                 randconfig-002-20251115    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251115    gcc-8.5.0
parisc                randconfig-002-20251115    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       ppc64_defconfig    clang-22
powerpc               randconfig-001-20251115    clang-19
powerpc               randconfig-002-20251115    gcc-8.5.0
powerpc                     redwood_defconfig    clang-22
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251115    gcc-11.5.0
powerpc64             randconfig-002-20251115    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251115    clang-22
riscv                 randconfig-002-20251115    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251115    clang-17
s390                  randconfig-002-20251115    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251115    gcc-12.5.0
sh                    randconfig-002-20251115    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251116    clang-20
x86_64      buildonly-randconfig-002-20251116    clang-20
x86_64      buildonly-randconfig-003-20251116    clang-20
x86_64      buildonly-randconfig-004-20251116    gcc-13
x86_64      buildonly-randconfig-005-20251116    clang-20
x86_64      buildonly-randconfig-006-20251116    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251116    clang-20
x86_64                randconfig-012-20251116    clang-20
x86_64                randconfig-013-20251116    gcc-14
x86_64                randconfig-014-20251116    clang-20
x86_64                randconfig-015-20251116    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


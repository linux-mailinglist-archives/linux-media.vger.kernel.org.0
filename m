Return-Path: <linux-media+bounces-40810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A176CB32745
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 09:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FD15A86A3
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 07:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A6223336;
	Sat, 23 Aug 2025 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMujtqSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0551CAA7D
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755934050; cv=none; b=NR/6Zc5MVY44WD6q1zjYn++vKd6Ck7jl5MYf2JR5JUewdMnHubHZnm8JRJgO5B1iMTTA802+yOl42VZHHpoKcpcq98Lgawr/duaduvEBgum6nSrLJARTjhPiC2ndEzA/itgG7D3uKSJdhp5iSkTYqfFYr5yzv++WX8/DRbSN5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755934050; c=relaxed/simple;
	bh=F1Mhjx6m7adKMnjre4lCpniku8rIJGZG2inM4L9mZA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B8+SaXIEqe5J24kOROQAx6FPDJI/z6rWJrCg60EuCiKn3t68rtlX5JcR7is+1mgT2WqUdHrKAUBa6QCoTawu+ZudIFWKP0oTdNr0DGDdLroPCtD0tHZMU8yA4UWd4I5qVMj8MkI0DTWkTaO/Se28Y0Efi3QsZaDZpKzmITcitK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMujtqSX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755934048; x=1787470048;
  h=date:from:to:cc:subject:message-id;
  bh=F1Mhjx6m7adKMnjre4lCpniku8rIJGZG2inM4L9mZA0=;
  b=EMujtqSXoqzfzsxJeZovw9r18MNsOD9sOU1EcqH8h7N8vQHI888oSiBx
   /j+wU7X3m4bzAwB1c9ReYBvWw/62gbjraw45G7u8I9twvfDp9SHHzwVVD
   WyX0FgZlXX6Su3OiC9UbR0C2ewId0FEMPxhY1Oqqr/mfV2M+iKSlWdTkO
   L+fpzvMfq8G0PLXAZ43vt/AYNgSm0vwHEzW3zlpa3mqkQXtYzxcQ2prxy
   zVnV2Jp98xEUe0s7AqXJimZNoxBFxUl+VBiAOSYJ0PJs9M8NmzqEOC2Z6
   heoU+YZKYmGiNGzv6SnWwDKKrVS9bUlo4tq2Ree/qI2qGgyJc+hGkIMQ6
   g==;
X-CSE-ConnectionGUID: P25obscgRbuxmZVaXwr1JQ==
X-CSE-MsgGUID: AH8rKw/tSAqjhxoGuF+fgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68935021"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68935021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 00:27:28 -0700
X-CSE-ConnectionGUID: /X+/6hgTS0eqHVHxiHgR3A==
X-CSE-MsgGUID: ZZpknOx9TguHUTKeogX0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199835886"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2025 00:27:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upieN-000MAZ-0p;
	Sat, 23 Aug 2025 07:27:09 +0000
Date: Sat, 23 Aug 2025 15:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 bf2aceaf11d82fbf7aee411c117b5d558fdf2c3a
Message-ID: <202508231511.1DNF4uXv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: bf2aceaf11d82fbf7aee411c117b5d558fdf2c3a  media: staging: ipu7: Don't include linux/version.h

elapsed time: 1319m

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
arc                   randconfig-001-20250822    gcc-8.5.0
arc                   randconfig-002-20250822    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250822    clang-22
arm                   randconfig-002-20250822    gcc-8.5.0
arm                   randconfig-003-20250822    clang-22
arm                   randconfig-004-20250822    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250822    clang-22
arm64                 randconfig-002-20250822    clang-22
arm64                 randconfig-003-20250822    clang-17
arm64                 randconfig-004-20250822    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250822    gcc-9.5.0
csky                  randconfig-002-20250822    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250822    clang-22
hexagon               randconfig-002-20250822    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250822    gcc-12
i386        buildonly-randconfig-002-20250822    clang-20
i386        buildonly-randconfig-003-20250822    gcc-12
i386        buildonly-randconfig-004-20250822    gcc-12
i386        buildonly-randconfig-005-20250822    gcc-12
i386        buildonly-randconfig-006-20250822    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250822    clang-22
loongarch             randconfig-002-20250822    gcc-15.1.0
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
nios2                 randconfig-001-20250822    gcc-11.5.0
nios2                 randconfig-002-20250822    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250822    gcc-9.5.0
parisc                randconfig-002-20250822    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250822    clang-22
powerpc               randconfig-002-20250822    gcc-11.5.0
powerpc               randconfig-003-20250822    clang-18
powerpc64             randconfig-001-20250822    gcc-13.4.0
powerpc64             randconfig-002-20250822    clang-22
powerpc64             randconfig-003-20250822    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250823    clang-22
riscv                 randconfig-002-20250823    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250823    gcc-9.5.0
s390                  randconfig-002-20250823    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250823    gcc-15.1.0
sh                    randconfig-002-20250823    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250823    gcc-8.5.0
sparc                 randconfig-002-20250823    gcc-8.5.0
sparc64               randconfig-001-20250823    gcc-8.5.0
sparc64               randconfig-002-20250823    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250823    clang-22
um                    randconfig-002-20250823    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250822    clang-20
x86_64      buildonly-randconfig-002-20250822    gcc-12
x86_64      buildonly-randconfig-003-20250822    clang-20
x86_64      buildonly-randconfig-004-20250822    clang-20
x86_64      buildonly-randconfig-005-20250822    clang-20
x86_64      buildonly-randconfig-006-20250822    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250823    gcc-15.1.0
xtensa                randconfig-002-20250823    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


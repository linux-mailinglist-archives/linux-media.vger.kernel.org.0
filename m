Return-Path: <linux-media+bounces-23946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4309F95F7
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13BE4188ADB8
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47491216397;
	Fri, 20 Dec 2024 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/dwrT/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6E249EB
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710686; cv=none; b=IDsIPwSy40Ye9rrl7CwCOuEJATWf53Vx5FSVgExAC9QMEWb18FONRDpQiF3lL8wFO8inhNIxucSIwHtA2zyn/3bhqJWAtpnHgpnJ9VVg8iu8BvL07sokXHrC6+0KfC0LXBs92f4km8Ktij4kc7GP0IHgsl5Dt1xv6lBIGNbloKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710686; c=relaxed/simple;
	bh=tiDhkidZTKsCNh9DVwLnS8NLSDhHMlN02t6qXcfRm0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTRkRnUCKlhTNIERpAVgq2hdOJhS9ufP29lxb9A0Vkwb95PUtfEaoH2z+NfTtFwvxGYeRbJR25ax8xdSqCx+9PNrlyAZuJIN0/Hiso/9ClCX/IEmN6WTShLncbbnKZYSU/ipKN0SLhZkBgjZ60O/NQqsNkrXyQOKmPfnz5zeWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/dwrT/D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734710685; x=1766246685;
  h=date:from:to:cc:subject:message-id;
  bh=tiDhkidZTKsCNh9DVwLnS8NLSDhHMlN02t6qXcfRm0o=;
  b=H/dwrT/DqzQcaDJkiFN/RABb2pNf2gl+wYvbL5/6Sg6tWjwcxAKeFlkz
   O5yRHIUtuxqFYjrZAKS/2PYRhLIBAARq1HNO9o5Mpef80tYG+vt8UC08F
   DMIBdQBeyfm6EBArAFD/b0DhYi/nVeyPxZ/5bgzvRMe1LDi3FGb3addNn
   wR1F1TZnlqFXwkdwxJ1SXmY2vrgTCiFBvW13/sdCQ751PlVlhuKDEf+g3
   J6IUyb3MrohMmz7bNko5DRJKi7QY1hzzdr6w363I9pplqwChaZfmrC6g0
   jxd46rKRSosb2NR7C0GgRAr/C2K1zdytYNpzEVmFfkB2ho4s4mx/2c7og
   w==;
X-CSE-ConnectionGUID: gelD8C0RQISWiHdYzWX3Mw==
X-CSE-MsgGUID: zUsom0HXRBGDp/gd5V6qFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45951452"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45951452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:04:44 -0800
X-CSE-ConnectionGUID: 0XMmxq4jQoSuHF86oOwE0Q==
X-CSE-MsgGUID: v2sQVEdRRxK2KUojr28T6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135893569"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2024 08:04:43 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOfUW-0001Mt-2j;
	Fri, 20 Dec 2024 16:04:40 +0000
Date: Sat, 21 Dec 2024 00:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 40ed9e9b2808beeb835bd0ed971fb364c285d39c
Message-ID: <202412210009.RV1cdwsw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 40ed9e9b2808beeb835bd0ed971fb364c285d39c  media: uvcvideo: Announce the user our deprecation intentions

elapsed time: 1452m

configs tested: 95
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241220    gcc-13.2.0
arc                   randconfig-002-20241220    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241220    clang-19
arm                   randconfig-002-20241220    gcc-14.2.0
arm                   randconfig-003-20241220    gcc-14.2.0
arm                   randconfig-004-20241220    clang-20
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241220    clang-17
arm64                 randconfig-002-20241220    clang-19
arm64                 randconfig-003-20241220    clang-20
arm64                 randconfig-004-20241220    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241220    gcc-14.2.0
csky                  randconfig-002-20241220    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241220    clang-20
hexagon               randconfig-002-20241220    clang-20
i386        buildonly-randconfig-001-20241220    gcc-12
i386        buildonly-randconfig-002-20241220    gcc-12
i386        buildonly-randconfig-003-20241220    gcc-12
i386        buildonly-randconfig-004-20241220    clang-19
i386        buildonly-randconfig-005-20241220    gcc-12
i386        buildonly-randconfig-006-20241220    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241220    gcc-14.2.0
loongarch             randconfig-002-20241220    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241220    gcc-14.2.0
nios2                 randconfig-002-20241220    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241220    gcc-14.2.0
parisc                randconfig-002-20241220    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20241220    clang-15
powerpc               randconfig-002-20241220    gcc-14.2.0
powerpc               randconfig-003-20241220    gcc-14.2.0
powerpc64             randconfig-001-20241220    gcc-14.2.0
powerpc64             randconfig-002-20241220    clang-19
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241220    gcc-14.2.0
riscv                 randconfig-002-20241220    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241220    gcc-14.2.0
s390                  randconfig-002-20241220    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241220    gcc-14.2.0
sh                    randconfig-002-20241220    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241220    gcc-14.2.0
sparc                 randconfig-002-20241220    gcc-14.2.0
sparc64               randconfig-001-20241220    gcc-14.2.0
sparc64               randconfig-002-20241220    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241220    clang-20
um                    randconfig-002-20241220    clang-20
x86_64      buildonly-randconfig-001-20241220    gcc-12
x86_64      buildonly-randconfig-002-20241220    clang-19
x86_64      buildonly-randconfig-003-20241220    gcc-12
x86_64      buildonly-randconfig-004-20241220    gcc-12
x86_64      buildonly-randconfig-005-20241220    clang-19
x86_64      buildonly-randconfig-006-20241220    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241220    gcc-14.2.0
xtensa                randconfig-002-20241220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


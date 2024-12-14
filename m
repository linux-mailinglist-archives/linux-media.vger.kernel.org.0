Return-Path: <linux-media+bounces-23415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E29F1DCC
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 10:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF1216166D
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 09:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21563158DD9;
	Sat, 14 Dec 2024 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkLTUago"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94FD17BA0
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734168158; cv=none; b=OEVaQcGV16vGQ0aBrvY0UUkyTNAjDBpLCYzz1kA6N88SbDAmACQVNMVZnaUevHbmUPMmVKoNXw1pwuF/RhUJi23o2UkvvVUuTDvXyW6jmmlYnxhbLO5lMTjKVRgZhKnnf4ojseMe5wurdY2QojTJGiqa4XogN2Ww4OEZg2KOL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734168158; c=relaxed/simple;
	bh=wHsslLstNfxuupNLPeKGp/jpQ39KmFAYKJm437EoZ2A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fU0ZxKHtwfyvAxAv2gTMeZSwUd62Edmp8OsBozZbaKYfRyADpQgdCQ1d+8U15ibAnXBpNsDYmHRvMn1N7qBmrWXjsO19QOwxOwVKuQPvCgo6WYqkfGP5qrJr2YOQc6WTF3MqcQVXg0UKUfg55wsv3HTdMCTZKkO720WB9q5BKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkLTUago; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734168157; x=1765704157;
  h=date:from:to:cc:subject:message-id;
  bh=wHsslLstNfxuupNLPeKGp/jpQ39KmFAYKJm437EoZ2A=;
  b=WkLTUago1MDQqmihBgN8Le6ablnio+MDp2oKv0kBExETTSS2ik7IYMAr
   T8CQTqE6byTimaUUkEKxlmAmYDCmcs8DF3XMWq3vChP/t/zn8XwiGYKaa
   FzDGlp1Vt40wFWc3dOH46rKwHaZ3TeoSJSG47lix5Hz8+RDn3gZEfF4SL
   Zyy4nYPxqE8rSa3UYV3+N0l1CHt78hlGkRMGM2kZIwEdlN3TAxp3BoJja
   y1ueFZMyKtKQvs3eOE0Kzs9ljyGIZqc84d2JRMEgkGrym7tVGogdufxU+
   qXp1bbPe3MBx1SaO34K0Jjz/wZjj7H2/yJ/qtJ6k43OKyXQ1A1MUBnuhE
   g==;
X-CSE-ConnectionGUID: jgEtb/e2SGWWfVeh8PlKUQ==
X-CSE-MsgGUID: c5xOhYlRSE+kRA5wanjQLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46024886"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46024886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 01:22:36 -0800
X-CSE-ConnectionGUID: xTUW4cykSCufxbVmFV6Dmw==
X-CSE-MsgGUID: OM3wlLuHQ1GiORLBihDaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="96820663"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2024 01:22:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMOM4-000CoZ-36;
	Sat, 14 Dec 2024 09:22:32 +0000
Date: Sat, 14 Dec 2024 17:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 757059398ba89205068916fec59e05326bce76d2
Message-ID: <202412141742.O9YHB7Ew-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 757059398ba89205068916fec59e05326bce76d2  media: i2c: ds90ub960: Fix shadowing of local variables

elapsed time: 1459m

configs tested: 70
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch                       allmodconfig    gcc-14.2.0
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


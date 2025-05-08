Return-Path: <linux-media+bounces-32013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25AAAF4B6
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 09:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E87A3AA784
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 07:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4343421E0AD;
	Thu,  8 May 2025 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zadkc+GK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E0195FE8
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689674; cv=none; b=KW7adex9yTe+QI1I5F78xvZNtNbznNKS6VVQGz5d33eqlX7x6Rbgj+LNLem1AS4lEOQYJRfY8Uf+DqHhE6NXHDJXs2lyvUnnICPRIYu+T7tIPc2wEdWqRcrQjnuSbaGM9Lc2yjVA8mNTXPf/BPfSfcEElfBePR+Ex/XbICESUNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689674; c=relaxed/simple;
	bh=UAaCeWdXkSF9PBuUkpkji/K7XRm9LPYSJAGcz22Bvjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wvr8S1lmbHAxT+FTvcT8D2rmZNLShH06t60U9qpyItY4EzRaBq52t/fZWhNEeu2l9b1yONI56TUnMqjrginmUlazD1OczNSP91WvoVU817SFmgvfUMFNonHO+Vsf3+ZjJVz6GXbgbEgNGR8b5D3uj9GXEl6yJO5RWW9+Chmb3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zadkc+GK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746689673; x=1778225673;
  h=date:from:to:cc:subject:message-id;
  bh=UAaCeWdXkSF9PBuUkpkji/K7XRm9LPYSJAGcz22Bvjg=;
  b=Zadkc+GKK/T82GBuGMPol04KFjl7bbUWD0614WIzF1M4uSBNpQ945gCi
   H4xXmQRLiqIN7h5JEVo1IxQDYG1lI7mwMwWaSWw9c8zK7K/jCv0P7rHrA
   Yh1Lla+mLkScdV1CRD9WzQ1SUY1A2NR9OC9iBFruAIBupUmpb3JEJk638
   M87IrlvrZ1/7lflHtnl0Wg5rp6ADgcZEVv6UDPLQuSEGM9Ff2BjjU/u0S
   ycuXPpjApo0UPY+JKPVCwI0d1woACqTs4SrDlQs8GtqR1SN1tvroZZVSL
   RbEhL/Q9FFvCf+IVXkQ02ckO3nNzPXpD2fyspog8eEUZ4uGZD8DH8w+Qh
   g==;
X-CSE-ConnectionGUID: dvvmjG7DQVir7/zFzwLs+Q==
X-CSE-MsgGUID: Rwk27cgLRUO+IyRrNfJOPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59808158"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59808158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 00:34:32 -0700
X-CSE-ConnectionGUID: qidiSfNfSfSAgmE1x2G7XA==
X-CSE-MsgGUID: bRFFl4DDQZKemXLk/Z39lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136160291"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 00:34:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCvm1-000Akc-0n;
	Thu, 08 May 2025 07:34:29 +0000
Date: Thu, 08 May 2025 15:34:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 b64b134942c8cf4801ea288b3fd38b509aedec21
Message-ID: <202505081515.TynB4Gad-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: b64b134942c8cf4801ea288b3fd38b509aedec21  media: renesas: vsp1: Expose color space through the DRM API

elapsed time: 8231m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-14.2.0
arc                   randconfig-002-20250502    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-002-20250502    gcc-7.5.0
arm                   randconfig-003-20250502    gcc-7.5.0
arm                   randconfig-004-20250502    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250502    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-004-20250502    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-12.4.0
csky                  randconfig-002-20250502    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250502    clang-21
hexagon               randconfig-002-20250502    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-005-20250502    gcc-12
i386        buildonly-randconfig-006-20250502    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-14.2.0
loongarch             randconfig-002-20250502    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250502    gcc-14.2.0
nios2                 randconfig-002-20250502    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250502    gcc-5.5.0
parisc                randconfig-002-20250502    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250502    clang-21
powerpc               randconfig-002-20250502    clang-19
powerpc               randconfig-003-20250502    clang-21
powerpc64             randconfig-001-20250502    clang-21
powerpc64             randconfig-002-20250502    clang-17
powerpc64             randconfig-003-20250502    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250502    clang-19
riscv                 randconfig-002-20250502    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250502    clang-21
s390                  randconfig-002-20250502    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250502    gcc-14.2.0
sh                    randconfig-002-20250502    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250502    gcc-10.3.0
sparc                 randconfig-002-20250502    gcc-11.5.0
sparc64               randconfig-001-20250502    gcc-5.5.0
sparc64               randconfig-002-20250502    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250502    clang-21
um                    randconfig-002-20250502    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250502    gcc-12
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-005-20250502    gcc-12
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-002-20250502    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


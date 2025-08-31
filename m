Return-Path: <linux-media+bounces-41385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B2B3D5C4
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 01:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB65B3B7D71
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 23:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C42580D1;
	Sun, 31 Aug 2025 23:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB71XHmB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E5079CD
	for <linux-media@vger.kernel.org>; Sun, 31 Aug 2025 23:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756682879; cv=none; b=H1mjnJOE85UCZgExlZgSJ43viIMk1J938u1Z6THf0AoaM7s9SpU3KJV0zxd7LEPEpJA2nLsdIDYCDbBVH6lquTKRU2ugEaDgrGN9qIituOIuP/61zlpw035dTNfQkzmBLnedwOkcfeno7Rc6swBdxFog9ErtiHtDzZpkdQWyecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756682879; c=relaxed/simple;
	bh=hhHDIPqiqV7OpLcljqgK0YGTkjsOGquJT45JZlv7DSU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z9m8QSck8cm4bkFpILDDMA2iyIvdGHGj60uUKjE+hD8WP4nXaRslJdk9zDjX9uOZAcwW9RwzOaQs3yOs7Cv6GCDIMkuFwMHsLYKNd8+eXqWrJWTIKYRFI52xdXXI0R/Ug4rFW/P/VzN8TdF84Et2tZxBe3LuW0W7rA7iHN1V6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB71XHmB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756682878; x=1788218878;
  h=date:from:to:cc:subject:message-id;
  bh=hhHDIPqiqV7OpLcljqgK0YGTkjsOGquJT45JZlv7DSU=;
  b=kB71XHmBCSzmFw4dYixnsl1JPsILuNM96T0qQMi7W/GPnZZRGAbQ75SA
   XV/bTlUoELCs0XJfQkyKjzhj0MtFjp8b0aWn0oN1RGhCQFeJ68mjLj/YN
   20E74bHsZwGnki29jVbOEylJoqKp1aBwcYlME/+agVy1zhJtt6WUltyAB
   SLpBnfS8YFU3LHZG1TtXp/5JN+X+kBa3f7nGZ6+iQ4Tp3zkCM+Rmi78GL
   aLIhh10X7tv/EVclhOQ20BmbqHBVKLnU5B9jOi20mHkZvdYMG8RIQ7Js4
   ZXsJnrOHqBNyn8O9MpYWuqkf39cNRAXyZRvuRYrcQGrBNxbAXGMh9jSXP
   g==;
X-CSE-ConnectionGUID: oaW4uCyMTl2lAEXji89Wkg==
X-CSE-MsgGUID: 6g1itsSrScODTbCNAtwA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58589995"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58589995"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 16:27:57 -0700
X-CSE-ConnectionGUID: YP706w3FSTWWq9+TM42NvA==
X-CSE-MsgGUID: APf59HUQROmICO+O73TYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201752823"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2025 16:27:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usrSR-000WPV-1i;
	Sun, 31 Aug 2025 23:27:51 +0000
Date: Mon, 01 Sep 2025 07:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 603957ae903e81fb80d3788297c0f58a68802dfc
Message-ID: <202509010713.u6YqHOtH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 603957ae903e81fb80d3788297c0f58a68802dfc  media: rkisp1: Add support for multiple power domains

elapsed time: 720m

configs tested: 133
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250831    gcc-8.5.0
arc                   randconfig-002-20250831    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                          pxa168_defconfig    clang-19
arm                   randconfig-001-20250831    clang-22
arm                   randconfig-002-20250831    gcc-8.5.0
arm                   randconfig-003-20250831    clang-22
arm                   randconfig-004-20250831    gcc-14.3.0
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250831    gcc-13.4.0
arm64                 randconfig-002-20250831    gcc-9.5.0
arm64                 randconfig-003-20250831    gcc-8.5.0
arm64                 randconfig-004-20250831    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250831    gcc-11.5.0
csky                  randconfig-002-20250831    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250831    clang-22
hexagon               randconfig-002-20250831    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250831    gcc-12
i386        buildonly-randconfig-002-20250831    clang-20
i386        buildonly-randconfig-003-20250831    gcc-12
i386        buildonly-randconfig-004-20250831    gcc-12
i386        buildonly-randconfig-005-20250831    gcc-12
i386        buildonly-randconfig-006-20250831    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250831    gcc-15.1.0
loongarch             randconfig-002-20250831    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       rbtx49xx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250831    gcc-11.5.0
nios2                 randconfig-002-20250831    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250831    gcc-15.1.0
parisc                randconfig-002-20250831    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc                      pcm030_defconfig    clang-22
powerpc               randconfig-001-20250831    gcc-14.3.0
powerpc               randconfig-002-20250831    gcc-12.5.0
powerpc               randconfig-003-20250831    gcc-14.3.0
powerpc64             randconfig-001-20250831    gcc-8.5.0
powerpc64             randconfig-003-20250831    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250831    gcc-12.5.0
riscv                 randconfig-002-20250831    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250831    gcc-13.4.0
s390                  randconfig-002-20250831    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250831    gcc-11.5.0
sh                    randconfig-002-20250831    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250831    gcc-15.1.0
sparc                 randconfig-002-20250831    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250831    clang-22
sparc64               randconfig-002-20250831    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250831    clang-17
um                    randconfig-002-20250831    clang-18
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250831    gcc-12
x86_64      buildonly-randconfig-002-20250831    clang-20
x86_64      buildonly-randconfig-003-20250831    gcc-12
x86_64      buildonly-randconfig-004-20250831    gcc-12
x86_64      buildonly-randconfig-005-20250831    gcc-12
x86_64      buildonly-randconfig-006-20250831    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250831    gcc-10.5.0
xtensa                randconfig-002-20250831    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


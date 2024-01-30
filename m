Return-Path: <linux-media+bounces-4449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1A842EAA
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 22:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE0C1F25D85
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 21:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D76278B53;
	Tue, 30 Jan 2024 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwrkE2pF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3478B4A
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706650420; cv=none; b=K+35vHqWmspKUygu5a6kk9hWXsSnMRTK44o4rrXzJwU0zwLYNC+txqMO89WjH10nE5SJHMAI+e6G5dTMDP9JWXGvDGZclDVbpHTgzyW2xuujlr4aerCYFat9/Jy24H5s1sPLLbpx5LSW2jPmR+E+C1VGDMgKfl9mBUuK0TPDTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706650420; c=relaxed/simple;
	bh=7YUckVD8aLWcVJ0HPx5IIYcymgiJQUYlaRd4CkbacRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7JttMR9zDsfEZqQCOzJ8a2XuM9SqV5ZGNu8eEMI4gklQqeNnOKS7EyxOINn4ylVHcq3XRmD7hQ4jdBTOXDtu12fSKKtLxKw1WhI/adkVl3XuPwpKf5I+JoUPDcA6IWnBDLhi8aT9vS8gFb7PeHy7dPi10jcH2aaWrm2jg77cP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwrkE2pF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706650418; x=1738186418;
  h=date:from:to:cc:subject:message-id;
  bh=7YUckVD8aLWcVJ0HPx5IIYcymgiJQUYlaRd4CkbacRQ=;
  b=SwrkE2pF9PseOwJBvnEjMqf3vzOUUPmhDUf5KR6UlBIG8F3gdBgW56Se
   wKD3QtqQhWyC751wCwg25fb3khPbhY9qyvH7sSFfTpG7yHoUZKPVqm0GJ
   TYyRqXUID0YNKdoa/pnuId34bN/coDVLoFGeTV2A+8H2MzL5BT2VI1JC6
   zjklFRfraquqiuUXfTTsITQH94ijgjaqka0OYO0toadH+TW/9iob/0uQh
   HMxr0aOaFrklfe2LmJoI69ixXQwNzvZiHY/9GBH3kDRJyQeU6HEQT3RGR
   h/rWO4mT4mpcmxt2mHOKU8dSQ1mDEKFTfotDQA7RuRcfNE2b8FETCyY6N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="21928814"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="21928814"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858595100"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="858595100"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2024 13:33:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvja-0000qy-0S;
	Tue, 30 Jan 2024 21:33:34 +0000
Date: Wed, 31 Jan 2024 05:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 d7cb6098f1d4866ae864cccdbb3fdcea1176a7f6
Message-ID: <202401310529.1hNOcz1V-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: d7cb6098f1d4866ae864cccdbb3fdcea1176a7f6  media: ov08x40: Reduce start streaming time

elapsed time: 736m

configs tested: 218
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240130   gcc  
arc                   randconfig-001-20240131   gcc  
arc                   randconfig-002-20240130   gcc  
arc                   randconfig-002-20240131   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   gcc  
arm                   randconfig-001-20240130   gcc  
arm                   randconfig-002-20240130   gcc  
arm                   randconfig-003-20240130   gcc  
arm                   randconfig-004-20240130   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240130   gcc  
arm64                 randconfig-002-20240130   gcc  
arm64                 randconfig-003-20240130   gcc  
arm64                 randconfig-004-20240130   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240130   gcc  
csky                  randconfig-001-20240131   gcc  
csky                  randconfig-002-20240130   gcc  
csky                  randconfig-002-20240131   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240130   gcc  
i386         buildonly-randconfig-002-20240130   gcc  
i386         buildonly-randconfig-003-20240130   gcc  
i386         buildonly-randconfig-004-20240130   gcc  
i386         buildonly-randconfig-005-20240130   gcc  
i386         buildonly-randconfig-006-20240130   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240130   gcc  
i386                  randconfig-002-20240130   gcc  
i386                  randconfig-003-20240130   gcc  
i386                  randconfig-004-20240130   gcc  
i386                  randconfig-005-20240130   gcc  
i386                  randconfig-006-20240130   gcc  
i386                  randconfig-011-20240130   clang
i386                  randconfig-012-20240130   clang
i386                  randconfig-013-20240130   clang
i386                  randconfig-014-20240130   clang
i386                  randconfig-015-20240130   clang
i386                  randconfig-016-20240130   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240130   gcc  
loongarch             randconfig-001-20240131   gcc  
loongarch             randconfig-002-20240130   gcc  
loongarch             randconfig-002-20240131   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240130   gcc  
nios2                 randconfig-001-20240131   gcc  
nios2                 randconfig-002-20240130   gcc  
nios2                 randconfig-002-20240131   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240130   gcc  
parisc                randconfig-001-20240131   gcc  
parisc                randconfig-002-20240130   gcc  
parisc                randconfig-002-20240131   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc               randconfig-001-20240130   gcc  
powerpc               randconfig-002-20240130   gcc  
powerpc               randconfig-003-20240130   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240130   gcc  
powerpc64             randconfig-002-20240130   gcc  
powerpc64             randconfig-003-20240130   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240130   gcc  
riscv                 randconfig-002-20240130   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240131   gcc  
s390                  randconfig-002-20240131   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240130   gcc  
sh                    randconfig-001-20240131   gcc  
sh                    randconfig-002-20240130   gcc  
sh                    randconfig-002-20240131   gcc  
sh                           se7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240130   gcc  
sparc64               randconfig-001-20240131   gcc  
sparc64               randconfig-002-20240130   gcc  
sparc64               randconfig-002-20240131   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240130   gcc  
um                    randconfig-002-20240130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240130   gcc  
x86_64       buildonly-randconfig-001-20240131   clang
x86_64       buildonly-randconfig-002-20240130   gcc  
x86_64       buildonly-randconfig-002-20240131   clang
x86_64       buildonly-randconfig-003-20240130   gcc  
x86_64       buildonly-randconfig-003-20240131   clang
x86_64       buildonly-randconfig-004-20240130   gcc  
x86_64       buildonly-randconfig-004-20240131   clang
x86_64       buildonly-randconfig-005-20240130   gcc  
x86_64       buildonly-randconfig-005-20240131   clang
x86_64       buildonly-randconfig-006-20240130   gcc  
x86_64       buildonly-randconfig-006-20240131   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240130   gcc  
x86_64                randconfig-011-20240131   clang
x86_64                randconfig-012-20240130   gcc  
x86_64                randconfig-012-20240131   clang
x86_64                randconfig-013-20240130   gcc  
x86_64                randconfig-013-20240131   clang
x86_64                randconfig-014-20240130   gcc  
x86_64                randconfig-014-20240131   clang
x86_64                randconfig-015-20240130   gcc  
x86_64                randconfig-015-20240131   clang
x86_64                randconfig-016-20240130   gcc  
x86_64                randconfig-016-20240131   clang
x86_64                randconfig-071-20240130   gcc  
x86_64                randconfig-071-20240131   clang
x86_64                randconfig-072-20240130   gcc  
x86_64                randconfig-072-20240131   clang
x86_64                randconfig-073-20240130   gcc  
x86_64                randconfig-073-20240131   clang
x86_64                randconfig-074-20240130   gcc  
x86_64                randconfig-074-20240131   clang
x86_64                randconfig-075-20240130   gcc  
x86_64                randconfig-075-20240131   clang
x86_64                randconfig-076-20240130   gcc  
x86_64                randconfig-076-20240131   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240130   gcc  
xtensa                randconfig-001-20240131   gcc  
xtensa                randconfig-002-20240130   gcc  
xtensa                randconfig-002-20240131   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


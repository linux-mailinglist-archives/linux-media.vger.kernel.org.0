Return-Path: <linux-media+bounces-3746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081D82ED56
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 12:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5BAFB22CBE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 11:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22011A593;
	Tue, 16 Jan 2024 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3DuozxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780071A581
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 11:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705403044; x=1736939044;
  h=date:from:to:cc:subject:message-id;
  bh=1WnVMVF8h44xl3i4cgbFkDF1irZbnEn/Xchk9j9IgSA=;
  b=J3DuozxNiVLsRJJn7fL0L6DkNS6FRKFVFBMJsLICeXudFjuMsErMkL5T
   6smm3ZM5IsFKZbTXISH4/dm35X4uqi1UGoxzLJTqr0abEqK1VDDgUDe7G
   a3bMXJx3lWQttD6R+nphL8WQ30h3dOEM9l8hXyj6/6mXAKShPp1urikum
   wiW1sS73s6ETanJ4563zhBBmtrQNnbGadHHr/qx2vyFTAW7ElSS0wj49z
   0UdO2ZlyP2Ys8Ogs5mRnCaxm7358RoH3LH1Z6mI42MBfoI9KfT2j8jgUN
   KJNnYtJPBX/KpCZ6bb17OhUjtZoNl3ulLEf2QgY5VAFf/B5WWqBMGqSHk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="390279823"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="390279823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 03:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="784095628"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="784095628"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jan 2024 03:04:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPhEd-0000ac-25;
	Tue, 16 Jan 2024 11:03:59 +0000
Date: Tue, 16 Jan 2024 19:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 203a4330052c6dad2241f25262e213a90f0e1599
Message-ID: <202401161931.FgsKdl4S-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 203a4330052c6dad2241f25262e213a90f0e1599  media: Documentation: Rework CCS driver documentation

elapsed time: 1458m

configs tested: 160
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240116   gcc  
arc                   randconfig-002-20240116   gcc  
arm                               allnoconfig   gcc  
arm                   randconfig-001-20240116   clang
arm                   randconfig-002-20240116   clang
arm                   randconfig-003-20240116   clang
arm                   randconfig-004-20240116   clang
arm                             rpc_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240116   clang
arm64                 randconfig-002-20240116   clang
arm64                 randconfig-003-20240116   clang
arm64                 randconfig-004-20240116   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240116   gcc  
csky                  randconfig-002-20240116   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20240116   clang
hexagon               randconfig-002-20240116   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240116   gcc  
i386                  randconfig-012-20240116   gcc  
i386                  randconfig-013-20240116   gcc  
i386                  randconfig-014-20240116   gcc  
i386                  randconfig-015-20240116   gcc  
i386                  randconfig-016-20240116   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240116   gcc  
loongarch             randconfig-002-20240116   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                          rm200_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240116   gcc  
nios2                 randconfig-002-20240116   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240116   gcc  
parisc                randconfig-002-20240116   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                 linkstation_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240116   clang
powerpc               randconfig-002-20240116   clang
powerpc               randconfig-003-20240116   clang
powerpc64             randconfig-001-20240116   clang
powerpc64             randconfig-002-20240116   clang
powerpc64             randconfig-003-20240116   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240116   clang
riscv                 randconfig-002-20240116   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240116   gcc  
s390                  randconfig-002-20240116   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240116   gcc  
sh                    randconfig-002-20240116   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240116   gcc  
sparc64               randconfig-002-20240116   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240116   clang
um                    randconfig-002-20240116   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240116   clang
x86_64       buildonly-randconfig-002-20240116   clang
x86_64       buildonly-randconfig-003-20240116   clang
x86_64       buildonly-randconfig-004-20240116   clang
x86_64       buildonly-randconfig-005-20240116   clang
x86_64       buildonly-randconfig-006-20240116   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240116   clang
x86_64                randconfig-012-20240116   clang
x86_64                randconfig-013-20240116   clang
x86_64                randconfig-014-20240116   clang
x86_64                randconfig-015-20240116   clang
x86_64                randconfig-016-20240116   clang
x86_64                randconfig-071-20240116   clang
x86_64                randconfig-072-20240116   clang
x86_64                randconfig-073-20240116   clang
x86_64                randconfig-074-20240116   clang
x86_64                randconfig-075-20240116   clang
x86_64                randconfig-076-20240116   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240116   gcc  
xtensa                randconfig-002-20240116   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


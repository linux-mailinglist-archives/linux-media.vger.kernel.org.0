Return-Path: <linux-media+bounces-1267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4917FB904
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 12:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B549CB20B9A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAC44F1E2;
	Tue, 28 Nov 2023 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxxXMa/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEA5BE
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701169714; x=1732705714;
  h=date:from:to:cc:subject:message-id;
  bh=lU66JDeYA7/crvm+hHn9NENVLzp0aQOUYwoKtxIuVE0=;
  b=cxxXMa/8zMIjJ/qe5MbUhl8fijdIxFnR/aDVZNlLbugt9I4r3WYiJ1lJ
   BE5JQgU3OHdKcD3eDh2p3u+MnLdED+/G16xVffHG2j9hHeIDyYPaRrrSi
   Q+Nd43u6DaMVRZM1jEDlGlTjNCgxpPSNk3+vLQj1TD1Fh4eVthfN+bw4c
   +c3KpvNxo5n47YHs3jRiy7IQ5+JwQ92kX3cC3NvUSpq8zcDQ6+RyynZfH
   i9cl1rkU47eKQ01yv3iNUwCXfdbKzJvNHyApckUdb/cJcchB1XCcWEO1p
   s7gCYm/7cC9YDpdhC3YuCekhJciKYxi60N0Ld3KTxJh4VwwBZwoBX8eMY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459405650"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="459405650"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 03:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941883938"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="941883938"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2023 03:08:33 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7vx7-0007Su-2q;
	Tue, 28 Nov 2023 11:08:30 +0000
Date: Tue, 28 Nov 2023 19:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:test] BUILD SUCCESS
 851fbdaebd3b1b4c47c2e2e38342c5ccf292ce27
Message-ID: <202311281927.baOLvhZs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git test
branch HEAD: 851fbdaebd3b1b4c47c2e2e38342c5ccf292ce27  media: renesas: vsp1: Fix references to pad config

elapsed time: 1480m

configs tested: 127
configs skipped: 2

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
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231127   clang
i386                  randconfig-012-20231127   clang
i386                  randconfig-013-20231127   clang
i386                  randconfig-014-20231127   clang
i386                  randconfig-015-20231127   clang
i386                  randconfig-016-20231127   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231127   gcc  
x86_64       buildonly-randconfig-001-20231128   clang
x86_64       buildonly-randconfig-002-20231127   gcc  
x86_64       buildonly-randconfig-002-20231128   clang
x86_64       buildonly-randconfig-003-20231127   gcc  
x86_64       buildonly-randconfig-003-20231128   clang
x86_64       buildonly-randconfig-004-20231127   gcc  
x86_64       buildonly-randconfig-004-20231128   clang
x86_64       buildonly-randconfig-005-20231127   gcc  
x86_64       buildonly-randconfig-005-20231128   clang
x86_64       buildonly-randconfig-006-20231127   gcc  
x86_64       buildonly-randconfig-006-20231128   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231127   clang
x86_64                randconfig-001-20231128   gcc  
x86_64                randconfig-002-20231127   clang
x86_64                randconfig-002-20231128   gcc  
x86_64                randconfig-003-20231127   clang
x86_64                randconfig-003-20231128   gcc  
x86_64                randconfig-004-20231127   clang
x86_64                randconfig-004-20231128   gcc  
x86_64                randconfig-005-20231127   clang
x86_64                randconfig-005-20231128   gcc  
x86_64                randconfig-006-20231127   clang
x86_64                randconfig-006-20231128   gcc  
x86_64                randconfig-011-20231127   gcc  
x86_64                randconfig-011-20231128   clang
x86_64                randconfig-012-20231127   gcc  
x86_64                randconfig-012-20231128   clang
x86_64                randconfig-013-20231127   gcc  
x86_64                randconfig-013-20231128   clang
x86_64                randconfig-014-20231128   clang
x86_64                randconfig-015-20231128   clang
x86_64                randconfig-016-20231128   clang
x86_64                randconfig-071-20231128   clang
x86_64                randconfig-072-20231128   clang
x86_64                randconfig-073-20231128   clang
x86_64                randconfig-074-20231128   clang
x86_64                randconfig-075-20231128   clang
x86_64                randconfig-076-20231128   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-49382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5ACCD7EE6
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 04:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56223021045
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 03:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06069288515;
	Tue, 23 Dec 2025 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnPOxu9F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DB3B2A0
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 03:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766458872; cv=none; b=CovBaaJppqmpEZ9knqBpRakrWtO499vraKTx1OkPZPqF8uQ8QKjdFkdXmEiZw5LF+wPQXX/MAn1jyd2YVZsGZ8jvpzcm0WUsMnnihXr1vDUU2Gk3+fpDjQjPnuHQ5UxzGWHdMGKysNAaef+iN6lGQpcMie+yYNqU153g9RhFn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766458872; c=relaxed/simple;
	bh=NdzCxJ/w9VyXXKv+w/RnmVMTS0bqW+zTODohWb/LeMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CjBDmX5V9E5hTeywNMnDealLB6tmzHlYDNHbFMl/ahzsQyDGtgS0tsSMirCtvK27t+rMYNWY05/XLUF4IQ0ORq3Ltj0btEGTgsswzpUoIzDFw6jra7CcHS64OiAU4Nyo5+inn03iX9htZgArsCIYD3ZpSv50y3WffzkuUk0W8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnPOxu9F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766458870; x=1797994870;
  h=date:from:to:cc:subject:message-id;
  bh=NdzCxJ/w9VyXXKv+w/RnmVMTS0bqW+zTODohWb/LeMU=;
  b=mnPOxu9FZaflemjil+4d1uzXHJBMI7TO+sw9BUyOWoubjM34rJNebXnj
   iMzWWF3Nx0bVq8RqzSs/vuWsDQPj4edm9BX6GOOMdLJXNhB/oskcUG0rQ
   i/w38zKc27tfP0T2/JtB3pPPFnv3Guq2tQElY3WN0yx89Ob63fGFfaHoc
   o/U3lu32fjwkmCeLeLiMw6e6DRz0FlPR5VaFfKyrHFUzO++iZiU9vybmK
   Ml9FisJKcBTUXQywoskqxBbQKYgVGLQ7za/wJDE2CbGX/s4KzRfOci/kf
   fH0OWEqyCn+4W3jLGyctu5gy/IEMSdULUIprMrbOL9sLh5mpfDDEgpTlZ
   g==;
X-CSE-ConnectionGUID: DAeGtF9LQdKBjQWg7wz1vA==
X-CSE-MsgGUID: cfLgfVTyQI6M59rfCqk1sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71941955"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="71941955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 19:01:05 -0800
X-CSE-ConnectionGUID: jJOq8xEVQ0SOr8zyJTVUXw==
X-CSE-MsgGUID: 3yC5XhGSSOGw6/erapazRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198919114"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 19:01:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXsdx-000000001OT-1ZRS;
	Tue, 23 Dec 2025 03:01:01 +0000
Date: Tue, 23 Dec 2025 11:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-clean] BUILD SUCCESS
 ecbe880c0957551478370e6fc41295477ff85167
Message-ID: <202512231112.wGmeH597-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6-clean
branch HEAD: ecbe880c0957551478370e6fc41295477ff85167  media: ipu6: Always call video_device_pipeline_alloc_start()

elapsed time: 1027m

configs tested: 161
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251223    gcc-8.5.0
arc                   randconfig-002-20251223    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251223    gcc-8.5.0
arm                   randconfig-002-20251223    gcc-8.5.0
arm                   randconfig-003-20251223    gcc-8.5.0
arm                   randconfig-004-20251223    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    gcc-15.1.0
arm64                 randconfig-002-20251223    gcc-15.1.0
arm64                 randconfig-003-20251223    gcc-15.1.0
arm64                 randconfig-004-20251223    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-15.1.0
csky                  randconfig-002-20251223    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251223    gcc-15.1.0
hexagon               randconfig-002-20251223    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251223    gcc-14
i386        buildonly-randconfig-002-20251223    gcc-14
i386        buildonly-randconfig-003-20251223    gcc-14
i386        buildonly-randconfig-004-20251223    gcc-14
i386        buildonly-randconfig-005-20251223    gcc-14
i386        buildonly-randconfig-006-20251223    gcc-14
i386                                defconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-002-20251223    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251223    gcc-15.1.0
nios2                 randconfig-002-20251223    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251223    clang-22
parisc                randconfig-002-20251223    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20251223    clang-22
powerpc               randconfig-002-20251223    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20251223    clang-22
powerpc64             randconfig-002-20251223    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251223    gcc-14.3.0
riscv                 randconfig-002-20251223    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251223    gcc-14.3.0
s390                  randconfig-002-20251223    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251223    gcc-14.3.0
sh                    randconfig-002-20251223    gcc-14.3.0
sh                   secureedge5410_defconfig    clang-22
sh                             sh03_defconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251223    clang-22
sparc                 randconfig-002-20251223    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251223    clang-22
sparc64               randconfig-002-20251223    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251223    clang-22
um                    randconfig-002-20251223    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251223    clang-20
x86_64      buildonly-randconfig-002-20251223    clang-20
x86_64      buildonly-randconfig-003-20251223    clang-20
x86_64      buildonly-randconfig-004-20251223    clang-20
x86_64      buildonly-randconfig-005-20251223    clang-20
x86_64      buildonly-randconfig-006-20251223    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251223    gcc-14
x86_64                randconfig-072-20251223    gcc-14
x86_64                randconfig-073-20251223    gcc-14
x86_64                randconfig-074-20251223    gcc-14
x86_64                randconfig-075-20251223    gcc-14
x86_64                randconfig-076-20251223    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251223    clang-22
xtensa                randconfig-002-20251223    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


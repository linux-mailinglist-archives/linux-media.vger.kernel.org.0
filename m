Return-Path: <linux-media+bounces-50973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE7D393F9
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 11:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFE5C300F9E3
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 10:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890A635959;
	Sun, 18 Jan 2026 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9QinYPb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD002E88BD
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731879; cv=none; b=cC7vWpjPlu5n9DRkIKiw/5gE2Tt0VeXK//xCEjjFGlLBndN3R1SenLJ4doCV4POushgROH9S+Wglv/iQEptM73berUCoaYnmeRBW2AAuqD01O9rQImAPE+bfmgjwUHHCDr2o5UBsLRhzSxZulhvshQbwIIr4FffRFLTAlT1TCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731879; c=relaxed/simple;
	bh=V1VWonk/09ELJ9LOdBPEjvA1bMPx2AwjUaTLbisvTpI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CP+dD/92fyY+H6juaBszq+T9gg2heGfzOLXwPCqoNOuH0qJAM7PPbiHaVi38bpux3zcIuewdBMtd0Uz8Q4LZUARv5hSYbVSISs2YqO3MieTEacA5f43yPNrmS0obt/cck2a4J2xWc9vwJ7c7iwyWKqGLNEDnY2oAo/FOc/8sojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9QinYPb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768731875; x=1800267875;
  h=date:from:to:cc:subject:message-id;
  bh=V1VWonk/09ELJ9LOdBPEjvA1bMPx2AwjUaTLbisvTpI=;
  b=D9QinYPb4AmkBgWMFWjaZ+gO694o0sQJXxDRPTix5EFvftAETfNS9vbs
   fbkpqtDD5KH/uYjnIIiBBAzmPdGGkP+9IR5VVuV5pvAVeFeUC/1+hs7sL
   LRfhyL/vmHrkMa3j1oWe3ML1Y9hdAo9cETovSY5v7dF/iQks7eEYQkdo8
   rmS/2iW2oyq/uWA3EtN/qYSqLmLipViHdj9J4qTysvIBc39pLsSPyDrhh
   VfRCqd9FLlS50IwZPGleAendQukHrhUGHnWTdNdmai33iGjuIt1d7y+x2
   J1RNPWWWVi1Nqw9ZlR9d56zpcsAGIIv15GA360qcPsMcKxvV4UlAE2IUT
   A==;
X-CSE-ConnectionGUID: /z3H5s0aT2iVa/bmpifRWA==
X-CSE-MsgGUID: 6mu0lQvGTXiz1tt43ViTWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81417118"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="81417118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 02:24:34 -0800
X-CSE-ConnectionGUID: V8OOxstiSPqwABUCOCL2JA==
X-CSE-MsgGUID: 0lwPWRsiQ8KtgjytEWeaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="236898092"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2026 02:24:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhPxO-00000000Msa-3P0w;
	Sun, 18 Jan 2026 10:24:30 +0000
Date: Sun, 18 Jan 2026 18:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 2759816f1682ca6a269064b7b9d50a65bc3afd5d
Message-ID: <202601181824.hmVl6o3m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 2759816f1682ca6a269064b7b9d50a65bc3afd5d  media: qcom: camss: add support for SM6150 camss

elapsed time: 4997m

configs tested: 407
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    clang-22
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260115    clang-22
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-001-20260118    gcc-13.4.0
arc                   randconfig-002-20260115    clang-22
arc                   randconfig-002-20260116    gcc-8.5.0
arc                   randconfig-002-20260118    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                            mmp2_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260115    clang-22
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-001-20260118    gcc-10.5.0
arm                   randconfig-002-20260115    clang-22
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-002-20260118    gcc-8.5.0
arm                   randconfig-003-20260115    clang-22
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-003-20260118    clang-22
arm                   randconfig-004-20260115    clang-22
arm                   randconfig-004-20260116    gcc-8.5.0
arm                   randconfig-004-20260118    gcc-15.2.0
arm                        shmobile_defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    clang-17
arm                           sunxi_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260115    clang-22
arm64                 randconfig-001-20260118    gcc-8.5.0
arm64                 randconfig-002-20260115    clang-22
arm64                 randconfig-002-20260118    clang-17
arm64                 randconfig-003-20260115    clang-22
arm64                 randconfig-003-20260118    gcc-14.3.0
arm64                 randconfig-004-20260115    clang-22
arm64                 randconfig-004-20260118    gcc-9.5.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260115    clang-22
csky                  randconfig-001-20260118    gcc-10.5.0
csky                  randconfig-002-20260115    clang-22
csky                  randconfig-002-20260118    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260115    clang-22
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-001-20260118    clang-22
hexagon               randconfig-002-20260115    clang-22
hexagon               randconfig-002-20260116    clang-20
hexagon               randconfig-002-20260118    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260115    gcc-14
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-001-20260118    gcc-14
i386        buildonly-randconfig-002-20260115    gcc-14
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-002-20260118    clang-20
i386        buildonly-randconfig-003-20260115    gcc-14
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-003-20260118    gcc-14
i386        buildonly-randconfig-004-20260115    gcc-14
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-004-20260118    gcc-14
i386        buildonly-randconfig-005-20260115    gcc-14
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-005-20260118    gcc-14
i386        buildonly-randconfig-006-20260115    gcc-14
i386        buildonly-randconfig-006-20260116    gcc-12
i386        buildonly-randconfig-006-20260118    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260115    clang-20
i386                  randconfig-001-20260116    clang-20
i386                  randconfig-001-20260118    gcc-14
i386                  randconfig-002-20260115    clang-20
i386                  randconfig-002-20260116    clang-20
i386                  randconfig-002-20260118    gcc-14
i386                  randconfig-003-20260115    clang-20
i386                  randconfig-003-20260116    clang-20
i386                  randconfig-003-20260118    gcc-14
i386                  randconfig-004-20260115    clang-20
i386                  randconfig-004-20260116    clang-20
i386                  randconfig-004-20260118    clang-20
i386                  randconfig-005-20260115    clang-20
i386                  randconfig-005-20260116    clang-20
i386                  randconfig-005-20260118    clang-20
i386                  randconfig-006-20260115    clang-20
i386                  randconfig-006-20260116    clang-20
i386                  randconfig-006-20260118    gcc-14
i386                  randconfig-007-20260115    clang-20
i386                  randconfig-007-20260116    clang-20
i386                  randconfig-007-20260118    clang-20
i386                  randconfig-011-20260115    gcc-14
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-011-20260118    clang-20
i386                  randconfig-012-20260115    gcc-14
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-012-20260118    clang-20
i386                  randconfig-013-20260115    gcc-14
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-013-20260118    clang-20
i386                  randconfig-014-20260115    gcc-14
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-014-20260118    clang-20
i386                  randconfig-015-20260115    gcc-14
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-015-20260118    clang-20
i386                  randconfig-016-20260115    gcc-14
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-016-20260118    clang-20
i386                  randconfig-017-20260115    gcc-14
i386                  randconfig-017-20260116    clang-20
i386                  randconfig-017-20260118    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260115    clang-22
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-001-20260118    gcc-15.2.0
loongarch             randconfig-002-20260115    clang-22
loongarch             randconfig-002-20260116    clang-20
loongarch             randconfig-002-20260118    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                       m5208evb_defconfig    gcc-15.2.0
m68k                        m5307c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-22
mips                           ip30_defconfig    clang-22
mips                           jazz_defconfig    clang-17
mips                       rbtx49xx_defconfig    clang-22
mips                          rm200_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260115    clang-22
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-001-20260118    gcc-8.5.0
nios2                 randconfig-002-20260115    clang-22
nios2                 randconfig-002-20260116    clang-20
nios2                 randconfig-002-20260118    gcc-9.5.0
openrisc                         alldefconfig    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
openrisc                 simple_smp_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                randconfig-001-20260115    clang-22
parisc                randconfig-001-20260117    clang-22
parisc                randconfig-001-20260118    gcc-8.5.0
parisc                randconfig-002-20260115    clang-22
parisc                randconfig-002-20260117    clang-22
parisc                randconfig-002-20260118    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                    adder875_defconfig    clang-22
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    gcc-15.2.0
powerpc                   bluestone_defconfig    gcc-15.2.0
powerpc                    gamecube_defconfig    clang-22
powerpc                   motionpro_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260115    clang-22
powerpc               randconfig-001-20260117    clang-22
powerpc               randconfig-001-20260118    gcc-11.5.0
powerpc               randconfig-002-20260115    clang-22
powerpc               randconfig-002-20260117    clang-22
powerpc               randconfig-002-20260118    gcc-8.5.0
powerpc                     tqm8548_defconfig    clang-22
powerpc                      tqm8xx_defconfig    clang-22
powerpc64             randconfig-001-20260115    clang-22
powerpc64             randconfig-001-20260117    clang-22
powerpc64             randconfig-001-20260118    clang-22
powerpc64             randconfig-002-20260115    clang-22
powerpc64             randconfig-002-20260117    clang-22
powerpc64             randconfig-002-20260118    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260115    gcc-10.5.0
riscv                 randconfig-001-20260116    gcc-15.2.0
riscv                 randconfig-001-20260118    gcc-10.5.0
riscv                 randconfig-002-20260115    gcc-10.5.0
riscv                 randconfig-002-20260116    gcc-15.2.0
riscv                 randconfig-002-20260118    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260115    gcc-10.5.0
s390                  randconfig-001-20260116    gcc-15.2.0
s390                  randconfig-001-20260118    gcc-15.2.0
s390                  randconfig-002-20260115    gcc-10.5.0
s390                  randconfig-002-20260116    gcc-15.2.0
s390                  randconfig-002-20260118    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                          r7785rp_defconfig    clang-22
sh                    randconfig-001-20260115    gcc-10.5.0
sh                    randconfig-001-20260116    gcc-15.2.0
sh                    randconfig-001-20260118    gcc-15.2.0
sh                    randconfig-002-20260115    gcc-10.5.0
sh                    randconfig-002-20260116    gcc-15.2.0
sh                    randconfig-002-20260118    gcc-15.2.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                           se7619_defconfig    gcc-15.2.0
sh                           se7751_defconfig    clang-22
sh                              ul2_defconfig    clang-22
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260115    clang-22
sparc                 randconfig-001-20260116    gcc-10.5.0
sparc                 randconfig-001-20260118    gcc-13.4.0
sparc                 randconfig-002-20260115    clang-22
sparc                 randconfig-002-20260116    gcc-10.5.0
sparc                 randconfig-002-20260118    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260115    clang-22
sparc64               randconfig-001-20260116    gcc-10.5.0
sparc64               randconfig-001-20260118    gcc-12.5.0
sparc64               randconfig-002-20260115    clang-22
sparc64               randconfig-002-20260116    gcc-10.5.0
sparc64               randconfig-002-20260118    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260115    clang-22
um                    randconfig-001-20260116    gcc-10.5.0
um                    randconfig-001-20260118    clang-22
um                    randconfig-002-20260115    clang-22
um                    randconfig-002-20260116    gcc-10.5.0
um                    randconfig-002-20260118    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260115    clang-20
x86_64      buildonly-randconfig-001-20260116    gcc-14
x86_64      buildonly-randconfig-001-20260118    gcc-14
x86_64      buildonly-randconfig-002-20260115    clang-20
x86_64      buildonly-randconfig-002-20260116    gcc-14
x86_64      buildonly-randconfig-002-20260118    clang-20
x86_64      buildonly-randconfig-003-20260115    clang-20
x86_64      buildonly-randconfig-003-20260116    gcc-14
x86_64      buildonly-randconfig-003-20260118    gcc-14
x86_64      buildonly-randconfig-004-20260115    clang-20
x86_64      buildonly-randconfig-004-20260116    gcc-14
x86_64      buildonly-randconfig-004-20260118    gcc-14
x86_64      buildonly-randconfig-005-20260115    clang-20
x86_64      buildonly-randconfig-005-20260116    gcc-14
x86_64      buildonly-randconfig-005-20260118    gcc-14
x86_64      buildonly-randconfig-006-20260115    clang-20
x86_64      buildonly-randconfig-006-20260116    gcc-14
x86_64      buildonly-randconfig-006-20260118    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260115    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-001-20260118    gcc-14
x86_64                randconfig-002-20260115    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-002-20260118    clang-20
x86_64                randconfig-003-20260115    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-003-20260118    clang-20
x86_64                randconfig-004-20260115    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-004-20260118    gcc-14
x86_64                randconfig-005-20260115    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-005-20260118    clang-20
x86_64                randconfig-006-20260115    clang-20
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-006-20260118    clang-20
x86_64                randconfig-011-20260115    clang-20
x86_64                randconfig-011-20260116    clang-20
x86_64                randconfig-011-20260118    gcc-12
x86_64                randconfig-012-20260115    clang-20
x86_64                randconfig-012-20260116    clang-20
x86_64                randconfig-012-20260118    gcc-14
x86_64                randconfig-013-20260115    clang-20
x86_64                randconfig-013-20260116    clang-20
x86_64                randconfig-013-20260118    gcc-14
x86_64                randconfig-014-20260115    clang-20
x86_64                randconfig-014-20260116    clang-20
x86_64                randconfig-014-20260118    gcc-14
x86_64                randconfig-015-20260115    clang-20
x86_64                randconfig-015-20260116    clang-20
x86_64                randconfig-015-20260118    clang-20
x86_64                randconfig-016-20260115    clang-20
x86_64                randconfig-016-20260116    clang-20
x86_64                randconfig-016-20260118    gcc-14
x86_64                randconfig-071-20260115    gcc-14
x86_64                randconfig-071-20260116    clang-20
x86_64                randconfig-071-20260118    clang-20
x86_64                randconfig-072-20260115    gcc-14
x86_64                randconfig-072-20260116    clang-20
x86_64                randconfig-072-20260118    gcc-12
x86_64                randconfig-073-20260115    gcc-14
x86_64                randconfig-073-20260116    clang-20
x86_64                randconfig-073-20260118    gcc-14
x86_64                randconfig-074-20260115    gcc-14
x86_64                randconfig-074-20260116    clang-20
x86_64                randconfig-074-20260118    clang-20
x86_64                randconfig-075-20260115    gcc-14
x86_64                randconfig-075-20260116    clang-20
x86_64                randconfig-075-20260118    gcc-14
x86_64                randconfig-076-20260115    gcc-14
x86_64                randconfig-076-20260116    clang-20
x86_64                randconfig-076-20260118    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260115    clang-22
xtensa                randconfig-001-20260116    gcc-10.5.0
xtensa                randconfig-001-20260118    gcc-8.5.0
xtensa                randconfig-002-20260115    clang-22
xtensa                randconfig-002-20260116    gcc-10.5.0
xtensa                randconfig-002-20260118    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


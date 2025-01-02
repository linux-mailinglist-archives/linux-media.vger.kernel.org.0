Return-Path: <linux-media+bounces-24229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D6A0015A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 23:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8201882775
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 22:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD161B6CF4;
	Thu,  2 Jan 2025 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyMxL4Rd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCADDC1
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 22:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735858532; cv=none; b=KdsvWPNUC3v/t1GXRi606gW2/hGzjSqM/MAh/7ikLhhgBq/+2e6iV0SHUs1v87o8MMOJVSuOUjpFS0/NPbEvnDPg+qQcKagf1i8MDiR+wYI+daAEdia08Rf2OOHlt5wQmNHfr41Oxav7e7EdjzUbq9cKBqVACQ+q9KiCV3v/9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735858532; c=relaxed/simple;
	bh=/idQgI0/Ztm4YKAFLFQL18sZHQ5K4sV152ogLUVwjjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RgeYGW4OiAO0zHjM4rhoUh9lhJSV4YrmsTGFZVEHybUjrJGQd+W+xIpoiQ/OzFXobyAA3hEKHofMud1c3Mb6wnKtUElqpv6CUAv4q63/I99dXg6JTrVY1atiqX3yXIHY1bwfBJn8S2YxZ2DtwIF+fm9bs8L1m8JVPh1xusMbtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyMxL4Rd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735858530; x=1767394530;
  h=date:from:to:cc:subject:message-id;
  bh=/idQgI0/Ztm4YKAFLFQL18sZHQ5K4sV152ogLUVwjjc=;
  b=cyMxL4Rdtlok7Rr7WaTLOlhjHVioigUJZRUlm/5bFf7cVElDmSgV/e62
   t6pZ0nQlmii9HwxxEawmgQVLx+pHUvm1QoiZbgmqcAt3is4a9lBpgQjuu
   KtFOI2DGPFngDGhOM4MbxuUSyGwSDkR3mjveo+p9OxaF0InzHUPcSFOIq
   t8PXi5szwRJUkDV36SAuMdxlZPT15IUAtYjWBLAu+glkppEjM8D3Wzc0f
   yY7rPsAGCAkvBlLPth7Vao6ksUb4xpWX5AHMMec9E6DJf9/KHlnh6LVnx
   NwxpKtJL9u1y/f9qDJG6WE/SLOH5n9BdK+5+YPRhpfSK8Tq2pK72cuD5i
   w==;
X-CSE-ConnectionGUID: Z297cC3tTkum4HbVTJzeRA==
X-CSE-MsgGUID: J6ScNjfPTeWC3p2BzqECAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35988325"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35988325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 14:55:29 -0800
X-CSE-ConnectionGUID: ja+L1HzIRICYB5+VRMYPfg==
X-CSE-MsgGUID: AkhumiYAReycQFyKmy1LSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132545145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jan 2025 14:55:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTU69-0008wJ-3C;
	Thu, 02 Jan 2025 22:55:25 +0000
Date: Fri, 03 Jan 2025 06:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 2762eab6d4140781840f253f9a04b8627017248b
Message-ID: <202501030634.yYgVyuzc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 2762eab6d4140781840f253f9a04b8627017248b  media: uvcvideo: Add Kurokesu C1 PRO camera

elapsed time: 792m

configs tested: 231
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250102    gcc-13.2.0
arc                   randconfig-001-20250103    clang-20
arc                   randconfig-002-20250102    gcc-13.2.0
arc                   randconfig-002-20250103    clang-20
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-13.2.0
arm                          ep93xx_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        mvebu_v7_defconfig    clang-15
arm                             mxs_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250102    gcc-14.2.0
arm                   randconfig-001-20250103    clang-20
arm                   randconfig-002-20250102    gcc-14.2.0
arm                   randconfig-002-20250103    clang-20
arm                   randconfig-003-20250102    gcc-14.2.0
arm                   randconfig-003-20250103    clang-20
arm                   randconfig-004-20250102    gcc-14.2.0
arm                   randconfig-004-20250103    clang-20
arm                           stm32_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250102    clang-20
arm64                 randconfig-001-20250103    clang-20
arm64                 randconfig-002-20250102    gcc-14.2.0
arm64                 randconfig-002-20250103    clang-20
arm64                 randconfig-003-20250102    clang-20
arm64                 randconfig-003-20250103    clang-20
arm64                 randconfig-004-20250102    gcc-14.2.0
arm64                 randconfig-004-20250103    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250102    gcc-14.2.0
csky                  randconfig-002-20250102    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250102    clang-19
hexagon               randconfig-002-20250102    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250102    gcc-12
i386        buildonly-randconfig-002-20250102    gcc-12
i386        buildonly-randconfig-003-20250102    clang-19
i386        buildonly-randconfig-004-20250102    clang-19
i386        buildonly-randconfig-005-20250102    clang-19
i386        buildonly-randconfig-006-20250102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250103    clang-19
i386                  randconfig-002-20250103    clang-19
i386                  randconfig-003-20250103    clang-19
i386                  randconfig-004-20250103    clang-19
i386                  randconfig-005-20250103    clang-19
i386                  randconfig-006-20250103    clang-19
i386                  randconfig-007-20250103    clang-19
i386                  randconfig-011-20250103    gcc-12
i386                  randconfig-012-20250103    gcc-12
i386                  randconfig-013-20250103    gcc-12
i386                  randconfig-014-20250103    gcc-12
i386                  randconfig-015-20250103    gcc-12
i386                  randconfig-016-20250103    gcc-12
i386                  randconfig-017-20250103    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250102    gcc-14.2.0
loongarch             randconfig-002-20250102    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                           ip22_defconfig    clang-20
mips                           ip27_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    clang-20
mips                      maltaaprp_defconfig    clang-20
mips                        maltaup_defconfig    gcc-13.2.0
mips                       rbtx49xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250102    gcc-14.2.0
nios2                 randconfig-002-20250102    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250102    gcc-14.2.0
parisc                randconfig-002-20250102    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                        cell_defconfig    gcc-13.2.0
powerpc                     ksi8560_defconfig    clang-20
powerpc                 linkstation_defconfig    gcc-13.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc                      ppc6xx_defconfig    clang-20
powerpc               randconfig-001-20250102    clang-20
powerpc               randconfig-002-20250102    gcc-14.2.0
powerpc               randconfig-003-20250102    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc                    socrates_defconfig    clang-20
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm8560_defconfig    gcc-13.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250102    gcc-14.2.0
powerpc64             randconfig-003-20250102    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250102    clang-16
riscv                 randconfig-002-20250102    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250102    clang-20
s390                  randconfig-002-20250102    clang-20
s390                       zfcpdump_defconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    clang-20
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250102    gcc-14.2.0
sh                    randconfig-002-20250102    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250102    gcc-14.2.0
sparc                 randconfig-002-20250102    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250102    gcc-14.2.0
sparc64               randconfig-002-20250102    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250102    clang-16
um                    randconfig-002-20250102    clang-18
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250102    gcc-12
x86_64      buildonly-randconfig-002-20250102    gcc-12
x86_64      buildonly-randconfig-003-20250102    gcc-12
x86_64      buildonly-randconfig-004-20250102    clang-19
x86_64      buildonly-randconfig-005-20250102    gcc-12
x86_64      buildonly-randconfig-006-20250102    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250103    gcc-12
x86_64                randconfig-002-20250103    gcc-12
x86_64                randconfig-003-20250103    gcc-12
x86_64                randconfig-004-20250103    gcc-12
x86_64                randconfig-005-20250103    gcc-12
x86_64                randconfig-006-20250103    gcc-12
x86_64                randconfig-007-20250103    gcc-12
x86_64                randconfig-008-20250103    gcc-12
x86_64                randconfig-071-20250103    clang-19
x86_64                randconfig-072-20250103    clang-19
x86_64                randconfig-073-20250103    clang-19
x86_64                randconfig-074-20250103    clang-19
x86_64                randconfig-075-20250103    clang-19
x86_64                randconfig-076-20250103    clang-19
x86_64                randconfig-077-20250103    clang-19
x86_64                randconfig-078-20250103    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-13.2.0
xtensa                randconfig-001-20250102    gcc-14.2.0
xtensa                randconfig-002-20250102    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


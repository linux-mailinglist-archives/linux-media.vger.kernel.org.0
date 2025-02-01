Return-Path: <linux-media+bounces-25522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB28A24BF6
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 23:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592CE3A6003
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2025 22:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DEB1C9DD7;
	Sat,  1 Feb 2025 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiEG0r16"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B9DA926
	for <linux-media@vger.kernel.org>; Sat,  1 Feb 2025 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738449141; cv=none; b=YUh/Mv0oqC+SoIp5ixI5Fdd/0wPMJE76uil4WU4KU1iecWBIn5lTvixzxCBPwVSon3b+yp3Zi4Kopa5/Z43Bz39Hbt6c0hwRN5QFvz8/2HpjZEGbMItuzRWaSnWQmBRSO58yE4V7A9g0cTPzeTkotsN2EgjP/VCQWypf6oTr3fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738449141; c=relaxed/simple;
	bh=eoX3yycEBdr5tEQNqirwFDmrpwiJ+DyNdU9lkQ3ndGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pDNTeCOqnbIrvMVREQ/e6ac1HBzeMz1qdI1q5eKAGRkrJ8UpyO3a/pykMiRDIdTyKY+fe/p3DWNkDLmL3I6Q8CjF59fwtty7JJ6Haq37gYLaer6rz+fgn1rFwc9FMvaGDuiVdic1Z095asda8/OUOpINxdXycbAlDnm69FDXnDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiEG0r16; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738449138; x=1769985138;
  h=date:from:to:cc:subject:message-id;
  bh=eoX3yycEBdr5tEQNqirwFDmrpwiJ+DyNdU9lkQ3ndGM=;
  b=fiEG0r16TjwgRa1vXP7Jbl96i42oEvJHYJ4JkLF16dOQgZia88SQ0h/Q
   XNwhX4UOOPk7FI/miZ9WNGDbctVKyoTaJK9nAn/JXLxpD5G3VlHGHDBM7
   fRB9mp3co/HO5kFPsIIRNFa4rGd5e4qje8wp+TRh+vBeSYAqxVDwV6aDh
   3NgdP2Umbf2CmdZ29oTfbBbuhkD7oQM7wZyLZkcMii4w38bo+6QtJoioB
   O4LcQAX9OckR41u4BTFeIdkwy9JzrabBAlYMEjNHgSwiYIAgQ1yBA6fJY
   gEdLqSkwvrK64Cq9KQ+nhAVD6QoLfmJbHi66SSUJLaBan9x4nQ8ZSsSg9
   Q==;
X-CSE-ConnectionGUID: xRLU3SV3RfSEhuIl3hO+dg==
X-CSE-MsgGUID: KxT4jJi9QweajtDwI+L6pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="39141323"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="39141323"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 14:32:18 -0800
X-CSE-ConnectionGUID: DWxqS4nDRkm6s19Z9e6OMg==
X-CSE-MsgGUID: bOnL70SIQsisjwv3BB9XzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="109872074"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Feb 2025 14:32:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teM2A-000owx-1e;
	Sat, 01 Feb 2025 22:32:14 +0000
Date: Sun, 02 Feb 2025 06:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 8004d635f27bbccaa5c083c50d4d5302a6ffa00e
Message-ID: <202502020658.faxK1huq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 8004d635f27bbccaa5c083c50d4d5302a6ffa00e  Revert "media: uvcvideo: Require entities to have a non-zero unique ID"

elapsed time: 1119m

configs tested: 211
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250201    gcc-13.2.0
arc                   randconfig-002-20250201    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.1.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    gcc-14.2.0
arm                   randconfig-001-20250201    gcc-14.2.0
arm                   randconfig-002-20250201    clang-18
arm                   randconfig-003-20250201    gcc-14.2.0
arm                   randconfig-004-20250201    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250201    gcc-14.2.0
arm64                 randconfig-002-20250201    clang-16
arm64                 randconfig-003-20250201    gcc-14.2.0
arm64                 randconfig-004-20250201    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250201    gcc-14.2.0
csky                  randconfig-002-20250201    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250201    clang-21
hexagon               randconfig-002-20250201    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250201    clang-19
i386        buildonly-randconfig-002-20250201    gcc-12
i386        buildonly-randconfig-003-20250201    gcc-12
i386        buildonly-randconfig-004-20250201    gcc-12
i386        buildonly-randconfig-005-20250201    gcc-12
i386        buildonly-randconfig-006-20250201    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250202    clang-19
i386                  randconfig-002-20250202    clang-19
i386                  randconfig-003-20250202    clang-19
i386                  randconfig-004-20250202    clang-19
i386                  randconfig-005-20250202    clang-19
i386                  randconfig-006-20250202    clang-19
i386                  randconfig-007-20250202    clang-19
i386                  randconfig-011-20250201    clang-19
i386                  randconfig-012-20250201    clang-19
i386                  randconfig-013-20250201    clang-19
i386                  randconfig-014-20250201    clang-19
i386                  randconfig-015-20250201    clang-19
i386                  randconfig-016-20250201    clang-19
i386                  randconfig-017-20250201    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20250201    gcc-14.2.0
loongarch             randconfig-002-20250201    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                            mac_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-16
mips                        bcm47xx_defconfig    clang-21
mips                           ip22_defconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250201    gcc-14.2.0
nios2                 randconfig-002-20250201    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250201    gcc-14.2.0
parisc                randconfig-002-20250201    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc               randconfig-001-20250201    clang-21
powerpc               randconfig-002-20250201    clang-18
powerpc               randconfig-003-20250201    gcc-14.2.0
powerpc64                        alldefconfig    gcc-14.2.0
powerpc64             randconfig-001-20250201    gcc-14.2.0
powerpc64             randconfig-002-20250201    gcc-14.2.0
powerpc64             randconfig-003-20250201    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250201    clang-21
riscv                 randconfig-002-20250201    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250201    gcc-14.2.0
s390                  randconfig-002-20250201    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.1.0
sh                    randconfig-001-20250201    gcc-14.2.0
sh                    randconfig-002-20250201    gcc-14.2.0
sh                           se7343_defconfig    gcc-14.1.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250201    gcc-14.2.0
sparc                 randconfig-002-20250201    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250201    gcc-14.2.0
sparc64               randconfig-002-20250201    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250201    clang-18
um                    randconfig-002-20250201    clang-21
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250201    clang-19
x86_64      buildonly-randconfig-002-20250201    gcc-12
x86_64      buildonly-randconfig-003-20250201    gcc-12
x86_64      buildonly-randconfig-004-20250201    gcc-12
x86_64      buildonly-randconfig-005-20250201    clang-19
x86_64      buildonly-randconfig-006-20250201    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250201    clang-19
x86_64                randconfig-002-20250201    clang-19
x86_64                randconfig-003-20250201    clang-19
x86_64                randconfig-004-20250201    clang-19
x86_64                randconfig-005-20250201    clang-19
x86_64                randconfig-006-20250201    clang-19
x86_64                randconfig-007-20250201    clang-19
x86_64                randconfig-008-20250201    clang-19
x86_64                randconfig-071-20250201    clang-19
x86_64                randconfig-072-20250201    clang-19
x86_64                randconfig-073-20250201    clang-19
x86_64                randconfig-074-20250201    clang-19
x86_64                randconfig-075-20250201    clang-19
x86_64                randconfig-076-20250201    clang-19
x86_64                randconfig-077-20250201    clang-19
x86_64                randconfig-078-20250201    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250201    gcc-14.2.0
xtensa                randconfig-002-20250201    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


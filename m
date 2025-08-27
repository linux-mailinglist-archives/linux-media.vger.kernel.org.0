Return-Path: <linux-media+bounces-41101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5DB37925
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 06:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C2DD3BE8AC
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 04:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B45226C3BF;
	Wed, 27 Aug 2025 04:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8zBqOIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C330CDBB
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756269055; cv=none; b=fgidOPTkXQhWCOCTGqjl0/eLlYSuVRlYtNMP0GwUWhjmbEn2Jtt0u+gB3wD4pLUVzPs0Ua1n/VG4Ar2Z0Rjz2NOixbedntQPdlI11MkHQf8WsEVgtTP+bfU7W5G8s+gFhNM4ZiN6zHo6kJ00O3+azOapB+ixGq6dz/uoKjcoReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756269055; c=relaxed/simple;
	bh=ERRo0n8Mzw2npL5WOLmi6/TDE8zyM6FdGRwcR5Gnqt8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cf2/dg8C8qWfrkGrpZzApG92wsCQLgJ5EaT1w6CS6xWnC5haeyCxbKDb92tRJqrpVCi9X+v4Yot/bknn1XKDi1e8S5mT+2zTMonb4HVBUGN0vjos3UHwarm2D8QCVs8bWYFYa/CCTgcp5+Rx8VC6x3S8l9/JuMBPFUUsw4D0BbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8zBqOIk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756269054; x=1787805054;
  h=date:from:to:cc:subject:message-id;
  bh=ERRo0n8Mzw2npL5WOLmi6/TDE8zyM6FdGRwcR5Gnqt8=;
  b=E8zBqOIkR8/iywg0onQRglVxdsESz7R1P1bI3nC9nmAGNbd2uTsNGza8
   OKOI1I62fsifKA4t4Yh4i6A7m5dSSk2z6/WBimRZzVl7J1lGAIy7mK5eW
   F5WgA4YVMtAGBr8OdqE5mE8YAjAK3vsY8mBVBGPiTcZ5ItgMYFFQdqsiv
   ULElmLfc6TyPLjkP+PMBjR9VQBuUXNpsdXuZ64JMNu4piJAQC2NaulWMx
   o4yuWalZG8sUf65PlVLY4XoD0kH1Yqc9SfknHvU+Iy/FCmQZ1OoDOSMxX
   JepZ8feD7Oc4A1zY8Dpas81SdKz6gRO4JKMePYtJ4cHyXJ530okcQMUCA
   Q==;
X-CSE-ConnectionGUID: SMT7QgEnTRWB+mBzZtM5RQ==
X-CSE-MsgGUID: Ea8TnXzsT2axS0wALmb7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58373994"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58373994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 21:30:54 -0700
X-CSE-ConnectionGUID: blfbA92VShGYnzwte6s8Bw==
X-CSE-MsgGUID: mITuWWZzTreGEXOpoB+YvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200638763"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2025 21:30:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur7nR-000Sfr-0M;
	Wed, 27 Aug 2025 04:30:18 +0000
Date: Wed, 27 Aug 2025 12:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 9a8e7210e8e21ebba263affd0d7481ef0d6c323e
Message-ID: <202508271207.dHu5lY5j-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: 9a8e7210e8e21ebba263affd0d7481ef0d6c323e  media: i2c: mt9p031: fix mbus code initialization

Unverified Warning (likely false positive, kindly check if interested):

    drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)

Warning ids grouped by kconfigs:

recent_errors
`-- i386-randconfig-141-20250827
    `-- drivers-media-i2c-imx214.c-imx214_ctrls_init()-error:we-previously-assumed-imx214-link_freq-could-be-null-(see-line-)

elapsed time: 1207m

configs tested: 136
configs skipped: 3

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
arc                   randconfig-001-20250826    gcc-11.5.0
arc                   randconfig-002-20250826    gcc-8.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250826    gcc-12.5.0
arm                   randconfig-002-20250826    gcc-13.4.0
arm                   randconfig-003-20250826    gcc-8.5.0
arm                   randconfig-004-20250826    gcc-10.5.0
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250826    clang-22
arm64                 randconfig-002-20250826    gcc-8.5.0
arm64                 randconfig-003-20250826    clang-22
arm64                 randconfig-004-20250826    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250826    gcc-15.1.0
csky                  randconfig-002-20250826    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250826    clang-19
hexagon               randconfig-002-20250826    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250826    gcc-12
i386        buildonly-randconfig-002-20250826    gcc-12
i386        buildonly-randconfig-003-20250826    clang-20
i386        buildonly-randconfig-004-20250826    gcc-12
i386        buildonly-randconfig-005-20250826    clang-20
i386        buildonly-randconfig-006-20250826    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250826    gcc-14.3.0
loongarch             randconfig-002-20250826    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250826    gcc-8.5.0
nios2                 randconfig-002-20250826    gcc-10.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250826    gcc-8.5.0
parisc                randconfig-002-20250826    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250826    gcc-8.5.0
powerpc               randconfig-002-20250826    clang-22
powerpc               randconfig-003-20250826    gcc-13.4.0
powerpc64             randconfig-001-20250826    gcc-10.5.0
powerpc64             randconfig-002-20250826    gcc-11.5.0
powerpc64             randconfig-003-20250826    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250826    gcc-8.5.0
riscv                 randconfig-002-20250826    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250826    clang-22
s390                  randconfig-002-20250826    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250826    gcc-11.5.0
sh                    randconfig-002-20250826    gcc-9.5.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                          sdk7780_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250826    gcc-13.4.0
sparc                 randconfig-002-20250826    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250826    gcc-8.5.0
sparc64               randconfig-002-20250826    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250826    gcc-12
um                    randconfig-002-20250826    clang-17
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250826    clang-20
x86_64      buildonly-randconfig-002-20250826    clang-20
x86_64      buildonly-randconfig-003-20250826    gcc-12
x86_64      buildonly-randconfig-004-20250826    clang-20
x86_64      buildonly-randconfig-005-20250826    gcc-12
x86_64      buildonly-randconfig-006-20250826    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250826    gcc-11.5.0
xtensa                randconfig-002-20250826    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


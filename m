Return-Path: <linux-media+bounces-38641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E16B1535B
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 21:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B27718A601E
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 19:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5448D239E81;
	Tue, 29 Jul 2025 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpUcZZh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465315CD74
	for <linux-media@vger.kernel.org>; Tue, 29 Jul 2025 19:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753816860; cv=none; b=DMx7b+wwxavwxSGgBWh8OauAQsuo9WBYQf3HZc0BKLCeqdHtkLc0lVSq+oQwfArXlA4xxhqZnZxoc4tljHzG1TNkMTeA0V9XnrJP3+XnUuuFI6PGtDgBbdt1MixY2Wwe3Er5Yt1vR5jbzMb14p0srLVwZPjuorU1SuPp63WggHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753816860; c=relaxed/simple;
	bh=JTmKHWBaShp+3l9gShp3d8kpbUYIVfy8seJbKydlcF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCnWQjAYHsXSHGM9dtO5libMhLtNQzAtQJCNwHiH16/dK40gSSWnnFHO4a2Q1wjGL2GPVp99qYxTwunNk7JhZ0xE8iFSX5NB8/TPrqfCsaZ/9RF90pbCbSZ4IZMkUMS1bQW5gvicCDdK5oaKwhYpcmNv8XLHvOlqLXkDVsb946o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpUcZZh8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753816858; x=1785352858;
  h=date:from:to:cc:subject:message-id;
  bh=JTmKHWBaShp+3l9gShp3d8kpbUYIVfy8seJbKydlcF4=;
  b=DpUcZZh8oV7RHcfBPho41ydBcrnJZ4FybnTcDyX46Dgr8MQnwTCeV0hN
   ODO5QJqw2P1+XTCaTIiTVLvkR9rrBYtV1zm3TsdHn7GX/S1Yy37UNJJVu
   idW1MePmsHYIEd66W44sX+988pz4MG+9y5I7y9TQdUaP2gn5pclcBj51Q
   nglLOkmIkliLiKE6eXHPSyPt4uzbTOs12NYEdx/y4VNeb6F6GtJhaaPTX
   XDXi0mTfMLufS/LaYdYKeiHo4lnHHimwOkVLiQpAjVtpWqoQPW+Fw0uB2
   aQXMRnNU8yBi6gCv/BfAZRiiI7hVbi4r4Nv0V3tatS4XQXLtTJmeJlW2X
   Q==;
X-CSE-ConnectionGUID: Uc6aUQgNTYmJFBF5MZl05A==
X-CSE-MsgGUID: /fCmaVQ+SB6scSoDfp50Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66673036"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66673036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 12:20:57 -0700
X-CSE-ConnectionGUID: GvhsTxbhQPmjQze4umGYiQ==
X-CSE-MsgGUID: QF/B77mfSXalEQCzLyryxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193626706"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2025 12:20:56 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugpsc-0001bW-2e;
	Tue, 29 Jul 2025 19:20:54 +0000
Date: Wed, 30 Jul 2025 03:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:eusb2] BUILD SUCCESS
 644ce903381e9f2449cd3faa61e482466eea0db5
Message-ID: <202507300324.MSZKBqvO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git eusb2
branch HEAD: 644ce903381e9f2449cd3faa61e482466eea0db5  media: uvcvideo: eUSB2 double isochronous bandwidth support

elapsed time: 1205m

configs tested: 258
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250729    gcc-10.5.0
arc                   randconfig-001-20250729    gcc-8.5.0
arc                   randconfig-002-20250729    gcc-10.5.0
arc                   randconfig-002-20250729    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250729    gcc-10.5.0
arm                   randconfig-001-20250729    gcc-15.1.0
arm                   randconfig-002-20250729    clang-19
arm                   randconfig-002-20250729    gcc-10.5.0
arm                   randconfig-003-20250729    clang-22
arm                   randconfig-003-20250729    gcc-10.5.0
arm                   randconfig-004-20250729    clang-22
arm                   randconfig-004-20250729    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250729    clang-17
arm64                 randconfig-001-20250729    gcc-10.5.0
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250729    clang-22
arm64                 randconfig-003-20250729    gcc-10.5.0
arm64                 randconfig-004-20250729    gcc-10.5.0
arm64                 randconfig-004-20250729    gcc-11.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250729    gcc-10.5.0
csky                  randconfig-001-20250729    gcc-15.1.0
csky                  randconfig-002-20250729    gcc-10.5.0
csky                  randconfig-002-20250729    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250729    clang-22
hexagon               randconfig-001-20250729    gcc-10.5.0
hexagon               randconfig-002-20250729    clang-22
hexagon               randconfig-002-20250729    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-001-20250730    clang-20
i386        buildonly-randconfig-002-20250729    clang-20
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-002-20250730    clang-20
i386        buildonly-randconfig-003-20250729    clang-20
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-003-20250730    clang-20
i386        buildonly-randconfig-004-20250729    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-004-20250730    clang-20
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-005-20250730    clang-20
i386        buildonly-randconfig-006-20250729    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386        buildonly-randconfig-006-20250730    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250729    gcc-12
i386                  randconfig-002-20250729    gcc-12
i386                  randconfig-003-20250729    gcc-12
i386                  randconfig-004-20250729    gcc-12
i386                  randconfig-005-20250729    gcc-12
i386                  randconfig-006-20250729    gcc-12
i386                  randconfig-007-20250729    gcc-12
i386                  randconfig-011-20250729    clang-20
i386                  randconfig-012-20250729    clang-20
i386                  randconfig-013-20250729    clang-20
i386                  randconfig-014-20250729    clang-20
i386                  randconfig-015-20250729    clang-20
i386                  randconfig-016-20250729    clang-20
i386                  randconfig-017-20250729    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250729    gcc-10.5.0
loongarch             randconfig-001-20250729    gcc-15.1.0
loongarch             randconfig-002-20250729    gcc-10.5.0
loongarch             randconfig-002-20250729    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250729    gcc-10.5.0
nios2                 randconfig-001-20250729    gcc-8.5.0
nios2                 randconfig-002-20250729    gcc-10.5.0
nios2                 randconfig-002-20250729    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250729    gcc-10.5.0
parisc                randconfig-002-20250729    gcc-10.5.0
parisc                randconfig-002-20250729    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250729    clang-22
powerpc               randconfig-001-20250729    gcc-10.5.0
powerpc               randconfig-002-20250729    gcc-10.5.0
powerpc               randconfig-002-20250729    gcc-8.5.0
powerpc               randconfig-003-20250729    gcc-10.5.0
powerpc               randconfig-003-20250729    gcc-11.5.0
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250729    clang-22
powerpc64             randconfig-001-20250729    gcc-10.5.0
powerpc64             randconfig-002-20250729    clang-16
powerpc64             randconfig-002-20250729    gcc-10.5.0
powerpc64             randconfig-003-20250729    clang-22
powerpc64             randconfig-003-20250729    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250729    clang-22
riscv                 randconfig-002-20250729    clang-17
riscv                 randconfig-002-20250729    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250729    clang-22
s390                  randconfig-001-20250729    gcc-8.5.0
s390                  randconfig-002-20250729    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250729    clang-22
sh                    randconfig-001-20250729    gcc-14.3.0
sh                    randconfig-002-20250729    clang-22
sh                    randconfig-002-20250729    gcc-9.5.0
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250729    clang-22
sparc                 randconfig-001-20250729    gcc-8.5.0
sparc                 randconfig-002-20250729    clang-22
sparc                 randconfig-002-20250729    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250729    clang-22
sparc64               randconfig-002-20250729    clang-20
sparc64               randconfig-002-20250729    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250729    clang-22
um                    randconfig-001-20250729    gcc-12
um                    randconfig-002-20250729    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-001-20250729    gcc-12
x86_64      buildonly-randconfig-001-20250730    clang-20
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-002-20250729    gcc-12
x86_64      buildonly-randconfig-002-20250730    clang-20
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-003-20250730    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-004-20250729    gcc-12
x86_64      buildonly-randconfig-004-20250730    clang-20
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-005-20250730    clang-20
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64      buildonly-randconfig-006-20250729    gcc-12
x86_64      buildonly-randconfig-006-20250730    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250729    clang-20
x86_64                randconfig-002-20250729    clang-20
x86_64                randconfig-003-20250729    clang-20
x86_64                randconfig-004-20250729    clang-20
x86_64                randconfig-005-20250729    clang-20
x86_64                randconfig-006-20250729    clang-20
x86_64                randconfig-007-20250729    clang-20
x86_64                randconfig-008-20250729    clang-20
x86_64                randconfig-071-20250729    gcc-12
x86_64                randconfig-071-20250730    clang-20
x86_64                randconfig-072-20250729    gcc-12
x86_64                randconfig-072-20250730    clang-20
x86_64                randconfig-073-20250729    gcc-12
x86_64                randconfig-073-20250730    clang-20
x86_64                randconfig-074-20250729    gcc-12
x86_64                randconfig-074-20250730    clang-20
x86_64                randconfig-075-20250729    gcc-12
x86_64                randconfig-075-20250730    clang-20
x86_64                randconfig-076-20250729    gcc-12
x86_64                randconfig-076-20250730    clang-20
x86_64                randconfig-077-20250729    gcc-12
x86_64                randconfig-077-20250730    clang-20
x86_64                randconfig-078-20250729    gcc-12
x86_64                randconfig-078-20250730    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250729    clang-22
xtensa                randconfig-001-20250729    gcc-8.5.0
xtensa                randconfig-002-20250729    clang-22
xtensa                randconfig-002-20250729    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-37163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CDAFD7A6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 21:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D242216DB1F
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 19:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C91239E9B;
	Tue,  8 Jul 2025 19:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clTglbOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33ED17CA17
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752004371; cv=none; b=uur4XdMeX1MoW+Q9pDt8sH0jBV3BCdeBRd5coEfJ8jARDSsUhNwS0h8wATCV5QzhkY0Mwj1vU9KR8KaZnm7np4ALqA0cF/6KI8hAuWwK9h2UR3PS1DPjOeaL80HQOsFsmyu6L5sYjUsB9uFG+/O9IgD6h4dAIE08BcYXLEcRlaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752004371; c=relaxed/simple;
	bh=LdL9HSLQxI7UALu6oT5dh/GnLpyAno8U+uhYf7L9deY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T+af4rUBkxxZWA8Ye6RWRTh0fOXNk3bMBm3IBGjKW+huv2/oezggQUTiaWfyr/HCVEU80OZVkwiKX3HWCkBkBqCMClxjyKZLrzyrsas6iGlk/Gb47ezEGnHbfY3cWdUkOgcQPrs3oTNUD26fOjzYWuSXva9Cy5Q0NJihlOmHvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clTglbOP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752004370; x=1783540370;
  h=date:from:to:cc:subject:message-id;
  bh=LdL9HSLQxI7UALu6oT5dh/GnLpyAno8U+uhYf7L9deY=;
  b=clTglbOP7bM6xJ7uSut1vx1XV3//rvDB0CT9Noq/aSmeUwpC4msf52uQ
   F7NEkN4QmYCIdSLdxiCeQY6kouerqr+cyK2OjCjlGREqKcnMw4qqf7JOt
   zeUq6w8puesgoWSsp29nkerVTvqVFBxSmvQ/9W8IMl6qjqTMkAy9Blwen
   +APm06FZm+xS7Vx6LgoBvr76O11Gp7/krsLY/6vssQleYurKRvdoeKGt+
   qq6KyFgk9D5lV4Z30tge1Jqs8GM+1/a2ymnDGM+UN+HhMnLYyOVYdlese
   Un69MQV6MWo4j5Pm1ozBPRr/StegXwkzTFPElrZSA8hTOn4SOYx1szkdk
   Q==;
X-CSE-ConnectionGUID: IVzETnQTSleWRhzBfeybUw==
X-CSE-MsgGUID: Gl5hYSJWTtGmC+GxCa5Ghg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58057971"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="58057971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 12:52:49 -0700
X-CSE-ConnectionGUID: 3/6OEGu5RiiSvGxzDHPshQ==
X-CSE-MsgGUID: F+y+qBDERjyTxsVbkhb9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156160219"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2025 12:52:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZEMw-0002i4-0M;
	Tue, 08 Jul 2025 19:52:46 +0000
Date: Wed, 09 Jul 2025 03:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:eusb2] BUILD SUCCESS
 fad743a772396c19b71692a6ea74bf3864ca6fe5
Message-ID: <202507090334.XVzwXL2i-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git eusb2
branch HEAD: fad743a772396c19b71692a6ea74bf3864ca6fe5  media: uvcvideo: eUSB2 double isochronous bandwidth support

elapsed time: 1381m

configs tested: 297
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250708    clang-17
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-001-20250709    gcc-10.5.0
arc                   randconfig-002-20250708    clang-17
arc                   randconfig-002-20250708    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-10.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    gcc-15.1.0
arm                        neponset_defconfig    gcc-15.1.0
arm                   randconfig-001-20250708    clang-17
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-001-20250709    gcc-10.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250708    clang-17
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-003-20250709    gcc-10.5.0
arm                   randconfig-004-20250708    clang-17
arm                   randconfig-004-20250708    clang-21
arm                   randconfig-004-20250709    gcc-10.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                          sp7021_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250708    clang-17
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-001-20250709    gcc-10.5.0
arm64                 randconfig-002-20250708    clang-17
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-002-20250709    gcc-10.5.0
arm64                 randconfig-003-20250708    clang-17
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-003-20250709    gcc-10.5.0
arm64                 randconfig-004-20250708    clang-17
arm64                 randconfig-004-20250708    gcc-8.5.0
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    clang-21
csky                                defconfig    clang-19
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-001-20250708    gcc-8.5.0
csky                  randconfig-002-20250708    gcc-15.1.0
csky                  randconfig-002-20250708    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-001-20250708    gcc-8.5.0
hexagon               randconfig-002-20250708    clang-21
hexagon               randconfig-002-20250708    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-001-20250709    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250708    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-005-20250709    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386        buildonly-randconfig-006-20250709    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250708    gcc-11
i386                  randconfig-001-20250709    clang-20
i386                  randconfig-002-20250708    gcc-11
i386                  randconfig-002-20250709    clang-20
i386                  randconfig-003-20250708    gcc-11
i386                  randconfig-003-20250709    clang-20
i386                  randconfig-004-20250708    gcc-11
i386                  randconfig-004-20250709    clang-20
i386                  randconfig-005-20250708    gcc-11
i386                  randconfig-005-20250709    clang-20
i386                  randconfig-006-20250708    gcc-11
i386                  randconfig-006-20250709    clang-20
i386                  randconfig-007-20250708    gcc-11
i386                  randconfig-007-20250709    clang-20
i386                  randconfig-011-20250708    clang-20
i386                  randconfig-012-20250708    clang-20
i386                  randconfig-013-20250708    clang-20
i386                  randconfig-014-20250708    clang-20
i386                  randconfig-015-20250708    clang-20
i386                  randconfig-016-20250708    clang-20
i386                  randconfig-017-20250708    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-001-20250708    gcc-8.5.0
loongarch             randconfig-002-20250708    clang-21
loongarch             randconfig-002-20250708    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-8.5.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc                randconfig-002-20250708    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                     ksi8560_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-002-20250708    gcc-8.5.0
powerpc               randconfig-003-20250708    clang-21
powerpc               randconfig-003-20250708    gcc-8.5.0
powerpc                     tqm8555_defconfig    gcc-15.1.0
powerpc                         wii_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-001-20250708    gcc-8.5.0
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-002-20250708    gcc-8.5.0
powerpc64             randconfig-003-20250708    clang-21
powerpc64             randconfig-003-20250708    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-001-20250708    clang-17
riscv                 randconfig-001-20250709    gcc-12
riscv                 randconfig-002-20250708    clang-17
riscv                 randconfig-002-20250708    gcc-11.5.0
riscv                 randconfig-002-20250709    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250708    clang-17
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-001-20250709    gcc-12
s390                  randconfig-002-20250708    clang-17
s390                  randconfig-002-20250708    gcc-9.3.0
s390                  randconfig-002-20250709    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250708    clang-17
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-001-20250709    gcc-12
sh                    randconfig-002-20250708    clang-17
sh                    randconfig-002-20250708    gcc-15.1.0
sh                    randconfig-002-20250709    gcc-12
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    clang-17
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-001-20250709    gcc-12
sparc                 randconfig-002-20250708    clang-17
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc                 randconfig-002-20250709    gcc-12
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250708    clang-17
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-001-20250709    gcc-12
sparc64               randconfig-002-20250708    clang-17
sparc64               randconfig-002-20250708    gcc-15.1.0
sparc64               randconfig-002-20250709    gcc-12
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-15.1.0
um                    randconfig-001-20250708    clang-17
um                    randconfig-001-20250708    clang-21
um                    randconfig-001-20250709    gcc-12
um                    randconfig-002-20250708    clang-17
um                    randconfig-002-20250709    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-001-20250709    clang-20
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-003-20250708    gcc-12
x86_64      buildonly-randconfig-003-20250709    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250709    clang-20
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-005-20250708    gcc-12
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64      buildonly-randconfig-006-20250708    gcc-12
x86_64      buildonly-randconfig-006-20250709    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250708    gcc-12
x86_64                randconfig-002-20250708    gcc-12
x86_64                randconfig-003-20250708    gcc-12
x86_64                randconfig-004-20250708    gcc-12
x86_64                randconfig-005-20250708    gcc-12
x86_64                randconfig-006-20250708    gcc-12
x86_64                randconfig-007-20250708    gcc-12
x86_64                randconfig-008-20250708    gcc-12
x86_64                randconfig-071-20250708    clang-20
x86_64                randconfig-071-20250709    gcc-12
x86_64                randconfig-072-20250708    clang-20
x86_64                randconfig-072-20250709    gcc-12
x86_64                randconfig-073-20250708    clang-20
x86_64                randconfig-073-20250709    gcc-12
x86_64                randconfig-074-20250708    clang-20
x86_64                randconfig-074-20250709    gcc-12
x86_64                randconfig-075-20250708    clang-20
x86_64                randconfig-075-20250709    gcc-12
x86_64                randconfig-076-20250708    clang-20
x86_64                randconfig-076-20250709    gcc-12
x86_64                randconfig-077-20250708    clang-20
x86_64                randconfig-077-20250709    gcc-12
x86_64                randconfig-078-20250708    clang-20
x86_64                randconfig-078-20250709    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    clang-17
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-001-20250709    gcc-12
xtensa                randconfig-002-20250708    clang-17
xtensa                randconfig-002-20250708    gcc-9.3.0
xtensa                randconfig-002-20250709    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


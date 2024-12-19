Return-Path: <linux-media+bounces-23777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C591D9F79E5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 11:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DDBB188F5A5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 10:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E391C222D5C;
	Thu, 19 Dec 2024 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajYabAuW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882E221D8E
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605706; cv=none; b=bIM7TiipGjsD/6/hYC4ngahH4FW7wt4NAHnI1dXLWoeVDONojPdD1G8DUvgGtA/K2kkQ5rbGoT5oh+KU0ILfHtplnRIPeWkx6kBiTfk5b+56O0JGi3RZIpDrIObazrrGfSU/bV7p7o3LjYw+p4Zojdnf2cBcToSWfc8/pnWdH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605706; c=relaxed/simple;
	bh=E1yo2+sqKtH3Lq10xdtSqoJFUvlhmXqbmyZMbpdhWb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pWDUb3H31f9RHRfAarok8yCg9Xf8gvy8y+FSPSwZGJoncq/gg3e0GJiwmnaeupsO7pvuw3+vbfpK3BzscT1o3yN58TaR7HbPmTJVF8pHsJMdlk0MrK9bW04GBiEv9tt4eLUyVR2W8sFBNri138jHnfoD5hpK7IQ067629F/3dhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajYabAuW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734605705; x=1766141705;
  h=date:from:to:cc:subject:message-id;
  bh=E1yo2+sqKtH3Lq10xdtSqoJFUvlhmXqbmyZMbpdhWb4=;
  b=ajYabAuWwvIJah7FWUxKPBVtAXDU4fyclhb05okGcWEhj9KX6Yz/aKFI
   ucAkQGCLZNAQuwYfDAWPrfAB05iFqhPuYGznNTrvdogVuyTSc4Ada3Cb/
   2mOFuX+pqiXK0iycvRuRzA9fplXke5jg7GMKURvQW+i6cqsmF4+BYk7VL
   JSF2XaFEbHLSo0Qu1hQeryVwcsxzhbBBK5j1GWhj99FdAKTKsrJ0QvBMo
   bF1yuEDL8zq43ekIYLfJzoM4sJ74OrZ+7Hv9kM2vG+runh5VFkzovEZA7
   Wbzwssm9Yu48BTQITi0W882g64rQX1wKTB02D6sUY5cdbQuvGM1JUOgiF
   A==;
X-CSE-ConnectionGUID: TXP9oy82Q+q10quCQxlhCg==
X-CSE-MsgGUID: auCyHT8cT9C1x1tz5UPFfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38889443"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="38889443"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 02:54:59 -0800
X-CSE-ConnectionGUID: Tc1VKMrfSbWzvKs1YtLSxg==
X-CSE-MsgGUID: BbD6+MMeTF+eXDw2KFPUGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135479565"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2024 02:54:58 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOEBC-0000An-3A;
	Thu, 19 Dec 2024 10:54:54 +0000
Date: Thu, 19 Dec 2024 18:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 06022f4e6ab52b18dee64ac88fe4b7a8c60b484c
Message-ID: <202412191842.ekthk4JF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 06022f4e6ab52b18dee64ac88fe4b7a8c60b484c  media: Documentation: PHY information can be obtained from OF endpoint too

elapsed time: 1446m

configs tested: 102
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-13.2.0
arc                   randconfig-001-20241218    gcc-13.2.0
arc                   randconfig-002-20241218    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-19
arm                   randconfig-001-20241218    clang-20
arm                   randconfig-002-20241218    clang-19
arm                   randconfig-003-20241218    clang-17
arm                   randconfig-004-20241218    clang-19
arm                           spitz_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241218    clang-20
arm64                 randconfig-002-20241218    clang-20
arm64                 randconfig-003-20241218    gcc-14.2.0
arm64                 randconfig-004-20241218    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241218    gcc-14.2.0
csky                  randconfig-002-20241218    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241218    clang-20
hexagon               randconfig-002-20241218    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241218    clang-19
i386        buildonly-randconfig-002-20241218    clang-19
i386        buildonly-randconfig-003-20241218    gcc-12
i386        buildonly-randconfig-004-20241218    gcc-12
i386        buildonly-randconfig-005-20241218    clang-19
i386        buildonly-randconfig-006-20241218    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241218    gcc-14.2.0
loongarch             randconfig-002-20241218    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241218    gcc-14.2.0
nios2                 randconfig-002-20241218    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241218    gcc-14.2.0
parisc                randconfig-002-20241218    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-20
powerpc               randconfig-001-20241218    gcc-14.2.0
powerpc               randconfig-002-20241218    clang-15
powerpc               randconfig-003-20241218    clang-17
powerpc64             randconfig-002-20241218    clang-20
powerpc64             randconfig-003-20241218    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241218    gcc-14.2.0
s390                  randconfig-002-20241218    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20241218    gcc-14.2.0
sh                    randconfig-002-20241218    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241218    gcc-14.2.0
sparc                 randconfig-002-20241218    gcc-14.2.0
sparc64               randconfig-001-20241218    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241218    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241218    clang-19
x86_64      buildonly-randconfig-002-20241218    clang-19
x86_64      buildonly-randconfig-003-20241218    gcc-12
x86_64      buildonly-randconfig-004-20241218    gcc-12
x86_64      buildonly-randconfig-005-20241218    gcc-12
x86_64      buildonly-randconfig-006-20241218    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


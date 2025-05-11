Return-Path: <linux-media+bounces-32232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C06AB2709
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 09:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC98178D93
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 07:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D8819E98C;
	Sun, 11 May 2025 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuhwJdMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34233993
	for <linux-media@vger.kernel.org>; Sun, 11 May 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746948983; cv=none; b=XvqxqOybEwifJlmE4Lf2tlNqS3TwrL/hDicsfG6tPjFo3GtTHAG1kEoc2R6LoXIszInNf2YLsl7E8azD4w+6DvUCJzKeWbExG4qHgVk1Xa5vB2ENUDBQW7d3XJ5dQraTV/fyKizyy8lW87moVxtqsEJ4IFB3dkhCFCWabHMbDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746948983; c=relaxed/simple;
	bh=OsGab0aVlph27H7/gqIkiTjmEHsaP5Hb80IBcSV+OLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Etp6g3kgHu6tgoYx9YMAOBiHUPKGztktS7grhk83BZslSwf7kaDF1DKIKPtagOE6eCmSMTaLqzWFK8V1E0UIeanPSgzdL96+cjpoiSHb/qCYlud4KNvcgeedFFGXrqtm2jREJIJIG/V2QRrZRZd53k6/owHm8GrJhEkbQ2MEZWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuhwJdMy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746948981; x=1778484981;
  h=date:from:to:cc:subject:message-id;
  bh=OsGab0aVlph27H7/gqIkiTjmEHsaP5Hb80IBcSV+OLs=;
  b=iuhwJdMyt9lhTORKeCE6iyxwM8PKqbSbjnNvYq+i3zba1pruolIT9PQW
   HDFjDV1LX66eQcr84MrIVY/nubPihJDK7BR2jI+jSplZmUVPHokkRmN14
   oPmd+/brL0Td8nxv1NPv4lX8PbTtJRy3RxtbuSm02FXeFGukTD7FHNciM
   we3SUDmCbQhl//xNFKgLlmv35bdQCFfxlnkOHoUQrIgzKpYpsTQvay9p4
   yRB5cA9f1wcHQ8p5HVNpbNppZHfx/v/aN4Q6zXUJfS6QAoWqEYQVi8Zyj
   Hxb33Y7IrRN64qwjevtw5ADi1nOypdjYJyn4Ru+u2bBOmxeYif6Ws11p8
   A==;
X-CSE-ConnectionGUID: 1jmS3jc1RxKdtN4nQTVg6w==
X-CSE-MsgGUID: /zpdYotrQnOHR4Df6f8p6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48444024"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48444024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 00:36:20 -0700
X-CSE-ConnectionGUID: jXO65lkBSz2ZBlw1i6QkjA==
X-CSE-MsgGUID: TPDX8IR3R4SEBU4p3NyPdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="174231631"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 May 2025 00:36:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE1EO-000Det-2D;
	Sun, 11 May 2025 07:36:16 +0000
Date: Sun, 11 May 2025 15:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 1b83a9f41bd13dae09fabf594918ea36a9bc0cfc
Message-ID: <202505111550.zeVRlBRQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 1b83a9f41bd13dae09fabf594918ea36a9bc0cfc  media: amlogic: c3-mipi-csi2: Handle 64-bits division

elapsed time: 1155m

configs tested: 116
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250510    gcc-14.2.0
arc                   randconfig-002-20250510    gcc-13.3.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250510    gcc-10.5.0
arm                   randconfig-002-20250510    clang-21
arm                   randconfig-003-20250510    gcc-10.5.0
arm                   randconfig-004-20250510    gcc-7.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250510    gcc-7.5.0
arm64                 randconfig-002-20250510    gcc-5.5.0
arm64                 randconfig-003-20250510    clang-21
arm64                 randconfig-004-20250510    gcc-7.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250510    gcc-14.2.0
csky                  randconfig-002-20250510    gcc-13.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250510    clang-21
hexagon               randconfig-002-20250510    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250510    gcc-12
i386        buildonly-randconfig-002-20250510    gcc-12
i386        buildonly-randconfig-003-20250510    gcc-12
i386        buildonly-randconfig-004-20250510    gcc-12
i386        buildonly-randconfig-005-20250510    gcc-12
i386        buildonly-randconfig-006-20250510    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250510    gcc-13.3.0
loongarch             randconfig-002-20250510    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250510    gcc-11.5.0
nios2                 randconfig-002-20250510    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250510    gcc-6.5.0
parisc                randconfig-002-20250510    gcc-12.4.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                   lite5200b_defconfig    clang-21
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250510    gcc-7.5.0
powerpc               randconfig-002-20250510    clang-17
powerpc               randconfig-003-20250510    clang-21
powerpc64             randconfig-001-20250510    clang-18
powerpc64             randconfig-002-20250510    gcc-10.5.0
powerpc64             randconfig-003-20250510    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250510    gcc-14.2.0
riscv                 randconfig-002-20250510    gcc-7.5.0
s390                              allnoconfig    clang-21
s390                  randconfig-001-20250510    gcc-7.5.0
s390                  randconfig-002-20250510    clang-21
sh                               alldefconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250510    gcc-9.3.0
sh                    randconfig-002-20250510    gcc-11.5.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250510    gcc-12.4.0
sparc                 randconfig-002-20250510    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64               randconfig-001-20250510    gcc-10.5.0
sparc64               randconfig-002-20250510    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250510    gcc-12
um                    randconfig-002-20250510    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250510    clang-20
x86_64      buildonly-randconfig-002-20250510    clang-20
x86_64      buildonly-randconfig-003-20250510    gcc-12
x86_64      buildonly-randconfig-004-20250510    gcc-11
x86_64      buildonly-randconfig-005-20250510    gcc-12
x86_64      buildonly-randconfig-006-20250510    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250510    gcc-8.5.0
xtensa                randconfig-002-20250510    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


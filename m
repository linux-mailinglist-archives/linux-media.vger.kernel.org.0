Return-Path: <linux-media+bounces-14501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C991F01D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1340B283C23
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5CF1448DD;
	Tue,  2 Jul 2024 07:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cwz3eHPF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D313D614
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905317; cv=none; b=kEtYqTf9mZR8nlKXPs8ODe0u92rIE55XZ9aqX9rRzyyFjh9t9N4iqEjANSb/ZPh1c3bsxpxbA2ozhXZdKtrYrJebNLHDPn8TlYNmX8uWRcjJizhVHdHg5N20IGfohN/K7grHgs3t6YQdYOuJyAh8HURNH/2XDu9jyYeHJIG4oUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905317; c=relaxed/simple;
	bh=cVVWy8Jspw87K1baTOVGIZ/g9AHYNQIQlHIB/VyDCQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S7GTXCH/+H72I+vOKBHnXGT9Ll09sgRM4lRgVCdcPfu/QNoh8B9Jh4h7g79n1pEfZMkl2ZBMStNdfi/m9dEARegCQkbJYVTSPJvGy3JPU/8c4TxPQt4wv+gj28i7F1vNZnouzwVObQzpQdzxHzWt7vmwavKuU2M1DCk0C7H/yik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cwz3eHPF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719905315; x=1751441315;
  h=date:from:to:cc:subject:message-id;
  bh=cVVWy8Jspw87K1baTOVGIZ/g9AHYNQIQlHIB/VyDCQQ=;
  b=Cwz3eHPFTWc+oeyk3MLibU5JJaZk2FdJH3qFZAevVKikyVdXS/20iyQg
   UaWONgEvlI+0ZT64UWa0Rwy8UdEKC+zmPg+txyRkrHRJoUomElA7A7nR7
   P9SRVA2tya9UsqV+9RiIStaF5u8sTGppSIEmOJhZWPdIO+wPGzWEmmVYU
   amdxAoIvb13MYTjyBNKn77p7YRZ+0tx8GE8CDHPt3xMEmDKFXM9DeCPNh
   777BQdEoorjK6mifq3dCWC8jckQJWZVM8njVCdMCKq0AZpET3+0tTi36V
   1m2ILuZ7HA2cAXYt/B0X/ebTnWbN5R/i830B72W2I93X0erd2P9gzajZn
   g==;
X-CSE-ConnectionGUID: Tyqr25xkSpiKhnPMOORWCg==
X-CSE-MsgGUID: hso5d2pbT0KWCUl//U+Pww==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="20932523"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="20932523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 00:28:35 -0700
X-CSE-ConnectionGUID: Ke5CceJRS/KJttffzmPsFg==
X-CSE-MsgGUID: B6IxS5AZT2OlWfQdM6EPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45769389"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2024 00:28:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOXwF-000NrY-1J;
	Tue, 02 Jul 2024 07:28:31 +0000
Date: Tue, 02 Jul 2024 15:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 a0157b5aa34eb43ec4c5510f9c260bbb03be937e
Message-ID: <202407021527.scMdGFvJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: a0157b5aa34eb43ec4c5510f9c260bbb03be937e  media: venus: fix use after free in vdec_close

elapsed time: 2708m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240702   gcc-13.2.0
arc                   randconfig-002-20240702   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                       multi_v4t_defconfig   clang-19
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240702   gcc-13.2.0
arm                   randconfig-002-20240702   gcc-13.2.0
arm                   randconfig-003-20240702   gcc-13.2.0
arm                   randconfig-004-20240702   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240702   gcc-13.2.0
arm64                 randconfig-002-20240702   clang-19
arm64                 randconfig-003-20240702   gcc-13.2.0
arm64                 randconfig-004-20240702   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240702   gcc-13.2.0
csky                  randconfig-002-20240702   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240702   clang-19
hexagon               randconfig-002-20240702   clang-19
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240630   gcc-7
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240630   gcc-13
i386                  randconfig-001-20240630   gcc-13
i386                  randconfig-002-20240630   gcc-13
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240630   gcc-13
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240630   gcc-13
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240630   gcc-8
i386                  randconfig-014-20240630   gcc-8
i386                  randconfig-015-20240630   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240702   gcc-13.2.0
loongarch             randconfig-002-20240702   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                           ip32_defconfig   clang-19
mips                     loongson2k_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240702   gcc-13.2.0
nios2                 randconfig-002-20240702   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240702   gcc-13.2.0
parisc                randconfig-002-20240702   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                       ebony_defconfig   clang-19
powerpc                   motionpro_defconfig   clang-17
powerpc               randconfig-001-20240702   gcc-13.2.0
powerpc               randconfig-002-20240702   clang-16
powerpc               randconfig-003-20240702   gcc-13.2.0
powerpc64             randconfig-001-20240702   clang-19
powerpc64             randconfig-002-20240702   gcc-13.2.0
powerpc64             randconfig-003-20240702   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv             nommu_k210_sdcard_defconfig   gcc-13.2.0
riscv                    nommu_virt_defconfig   clang-19
riscv                 randconfig-001-20240702   gcc-13.2.0
riscv                 randconfig-002-20240702   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                  randconfig-001-20240702   clang-19
s390                  randconfig-002-20240702   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240702   gcc-13.2.0
sh                    randconfig-002-20240702   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240702   gcc-13.2.0
sparc64               randconfig-002-20240702   gcc-13.2.0
um                                allnoconfig   clang-17
um                    randconfig-001-20240702   gcc-8
um                    randconfig-002-20240702   gcc-13
x86_64                           alldefconfig   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240702   gcc-13.2.0
xtensa                randconfig-002-20240702   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


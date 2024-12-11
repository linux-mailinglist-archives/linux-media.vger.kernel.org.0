Return-Path: <linux-media+bounces-23227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE739ED8F2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28179162146
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 21:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7191D8A08;
	Wed, 11 Dec 2024 21:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oI0FT9OQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F01D63CA
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 21:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953569; cv=none; b=TrrgUGjKZ+ae+h8/sRS1QgzLLgHkpOvpJ99VQNl45ET0/1i+j64nz3OyHSKRDIG3CH0F9QkoWgNiiK7KM9NpSVA7BEFiUvSU7j6wAe+zxcGJLdRpK2qQRwlgVlAZmEprlLaho6nFqyufptfN7B24eabQCgMkk7p9kduvz+aKw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953569; c=relaxed/simple;
	bh=mhHkID4qFw8pvRjtDJIDSNJxQJx9HE7Ci+gfHeQBVGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gJLs2hajhrITgvtxTAYR1ECxDHLhuaLGmj8SowFgFqkuxWA5lYatsPd0k8fRpQ+aZUEsA/fblJq1kRDSQBnIDEuN/kTow8+fr1QEyzhFp/BwhJ9MmQosDGogF2EkW+sNbu1nF/FjmRuk2WG96xgsrcpgbtndGVFTaBog5zxF9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oI0FT9OQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733953568; x=1765489568;
  h=date:from:to:cc:subject:message-id;
  bh=mhHkID4qFw8pvRjtDJIDSNJxQJx9HE7Ci+gfHeQBVGA=;
  b=oI0FT9OQWIOoQXfb8Omq03zGhJA3EinCU8vaHkE8F5MXf28Xws2QXLV+
   95SEJ8q3cHKBmmPFfCYfhhGBqeRZlsulEH7HmzF4u4q7wZq2pfrcgDWRo
   9nkg6VTHG+fEM9fbbI1a3QApJMkdg04sHSrSGheE7XFp7zPQeMhNq0Fa2
   ep/0Qm0OQxgc5DF6s3dL50wZ1vEGHODMYj8FJ0MKASkgunahrzkNFsNES
   y5MORYDI06L1s2Fca48avJPjlwm3A7d6ZQhQjxXUASIeL3Ry6gPxuScW3
   gscLZlpkd2tMO2r2/NEogyNEKRM4XSy+lo6mFw/fLtjUFmA6x+xmvIb/r
   A==;
X-CSE-ConnectionGUID: crl/uGRxTIanRJ8NbLXynA==
X-CSE-MsgGUID: mkRPH5MiSEKKtwbSBbpX7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45737712"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45737712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:46:06 -0800
X-CSE-ConnectionGUID: 9AcfilLTQISaawTfja/niQ==
X-CSE-MsgGUID: vAS1hf8RR6awuEMEsPXvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="95821178"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2024 13:46:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUWw-00077F-2W;
	Wed, 11 Dec 2024 21:46:02 +0000
Date: Thu, 12 Dec 2024 05:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 432427793c3e665e6adf3ff009617c476ad588ea
Message-ID: <202412120515.QvoPZqTo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 432427793c3e665e6adf3ff009617c476ad588ea  media: ipu-bridge: Fix warning when !ACPI

elapsed time: 1477m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241211    gcc-13.2.0
arc                   randconfig-002-20241211    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                   randconfig-001-20241211    clang-18
arm                   randconfig-002-20241211    gcc-14.2.0
arm                   randconfig-003-20241211    clang-20
arm                   randconfig-004-20241211    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241211    gcc-14.2.0
arm64                 randconfig-002-20241211    clang-18
arm64                 randconfig-003-20241211    gcc-14.2.0
arm64                 randconfig-004-20241211    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241211    gcc-14.2.0
csky                  randconfig-002-20241211    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241211    clang-20
hexagon               randconfig-002-20241211    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241211    clang-19
i386        buildonly-randconfig-002-20241211    gcc-11
i386        buildonly-randconfig-003-20241211    clang-19
i386        buildonly-randconfig-004-20241211    gcc-11
i386        buildonly-randconfig-005-20241211    gcc-12
i386        buildonly-randconfig-006-20241211    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241211    gcc-14.2.0
loongarch             randconfig-002-20241211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
mips                           mtx1_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241211    gcc-14.2.0
nios2                 randconfig-002-20241211    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241211    gcc-14.2.0
parisc                randconfig-002-20241211    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      pasemi_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-19
powerpc               randconfig-001-20241211    clang-18
powerpc               randconfig-002-20241211    clang-16
powerpc               randconfig-003-20241211    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc64             randconfig-001-20241211    gcc-14.2.0
powerpc64             randconfig-002-20241211    clang-20
powerpc64             randconfig-003-20241211    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241211    gcc-14.2.0
riscv                 randconfig-002-20241211    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241211    clang-20
s390                  randconfig-002-20241211    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20241211    gcc-14.2.0
sh                    randconfig-002-20241211    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                           se7750_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241211    gcc-14.2.0
sparc                 randconfig-002-20241211    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241211    gcc-14.2.0
sparc64               randconfig-002-20241211    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241211    gcc-12
um                    randconfig-002-20241211    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241211    gcc-12
x86_64      buildonly-randconfig-002-20241211    gcc-11
x86_64      buildonly-randconfig-003-20241211    gcc-12
x86_64      buildonly-randconfig-004-20241211    gcc-12
x86_64      buildonly-randconfig-005-20241211    gcc-12
x86_64      buildonly-randconfig-006-20241211    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241211    gcc-14.2.0
xtensa                randconfig-002-20241211    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


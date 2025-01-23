Return-Path: <linux-media+bounces-25175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07543A19D54
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 04:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C183D188A428
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 03:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211B84A30;
	Thu, 23 Jan 2025 03:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkbN+7yL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E72762F7
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 03:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603320; cv=none; b=bKj+gL3byUef1wv+0ZV8U7wniWz9XB7K5nedfhNbw08kLMrlSf2tMwr5Wk+yDV2wF4uxe7Y+LnD0QFJkfgYlMiaViOiMYYBl8ZihbmdH85P5OVrVvBhyvbNLahyuNcP3nEnpdbTTUCl7fC8g1LvIUkWA4qdnyCJQKgjBS72cvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603320; c=relaxed/simple;
	bh=PN/eUdaXQNXDHSHI0p5aR6b/trzmRrAzQk7yPerB+Vg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hZO8KBI10q/ok8/0XHHEbaQlyfVqDY64aSbSjKm7kjxR3mhcBZF/9Bi3ZIzOtnU1nYRP0QAQ73pJStXymd/kFFU4LE6s5cT90m1G/zI6Yce08XUmEDSW2oYn0c4ARvwfNYbAEEeXq87KmXYuEvR7afWbkcn6Rv9gVzqYG/09Y+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkbN+7yL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737603318; x=1769139318;
  h=date:from:to:cc:subject:message-id;
  bh=PN/eUdaXQNXDHSHI0p5aR6b/trzmRrAzQk7yPerB+Vg=;
  b=HkbN+7yL2+fEghb0uEIzkl6nh+P1gOHbn4NvTjJ4SLx4hTOPgeCT07B3
   ZTu1ymj7byuScqVDHLcIOZKkeLIeHXRD0mtmh13zFdIPi7GjDxfPeL4Ts
   Vx7ZwRDPwfI1wl2JQNpQ0IInG0CzoUl8FdmPoWVB49qk9srAWxDBWblIS
   JQNbk8IzizrGiW163C1J0e2PbF/iW3sXJ2QD9bnbPXVeBXUF0FxLh1U2K
   X0VAO7EgxeceW8YGUu5SbCNKmTnKAmKmz7Hd91ftCWgahdg0vZx3yeyQL
   jCllS+VNAUEhQsltN913FmS3dLzbPp+iVq3PuN7t4byaJJkpUUWnDreGh
   g==;
X-CSE-ConnectionGUID: lhMz2hKgQB+y+ytBYOrVqg==
X-CSE-MsgGUID: BzMFNQBZRvCaudnyk7Ak+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38004076"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38004076"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 19:35:15 -0800
X-CSE-ConnectionGUID: 7MjNYEQ2SmKL86478FdLXA==
X-CSE-MsgGUID: iVYzcUqlS6yFpQSKSLhHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111354029"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2025 19:35:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tanzr-000ac3-32;
	Thu, 23 Jan 2025 03:35:11 +0000
Date: Thu, 23 Jan 2025 11:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS WITH WARNING
 c3af137975ac5de4479d2f019acb74db0b36a26e
Message-ID: <202501231134.gqWddFX9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: c3af137975ac5de4479d2f019acb74db0b36a26e  platform/x86: int3472: Call "reset" GPIO "enable" for INT347E

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501221858.1YHNirHd-lkp@intel.com

    drivers/platform/x86/intel/int3472/discrete.c:138: warning: Function parameter or struct member 'int3472_reset_gpio_map' not described in 'int3472_reset_gpio_map'

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   `-- drivers-platform-x86-intel-int3472-discrete.c:warning:Function-parameter-or-struct-member-int3472_reset_gpio_map-not-described-in-int3472_reset_gpio_map
|-- i386-buildonly-randconfig-002-20250122
|   `-- drivers-platform-x86-intel-int3472-discrete.c:warning:Function-parameter-or-struct-member-int3472_reset_gpio_map-not-described-in-int3472_reset_gpio_map
|-- x86_64-allmodconfig
|   `-- drivers-platform-x86-intel-int3472-discrete.c:warning:Function-parameter-or-struct-member-int3472_reset_gpio_map-not-described-in-int3472_reset_gpio_map
|-- x86_64-allyesconfig
|   `-- drivers-platform-x86-intel-int3472-discrete.c:warning:Function-parameter-or-struct-member-int3472_reset_gpio_map-not-described-in-int3472_reset_gpio_map
`-- x86_64-buildonly-randconfig-004-20250122
    `-- drivers-platform-x86-intel-int3472-discrete.c:warning:Function-parameter-or-struct-member-int3472_reset_gpio_map-not-described-in-int3472_reset_gpio_map

elapsed time: 1442m

configs tested: 86
configs skipped: 10

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250122    gcc-13.2.0
arc                   randconfig-002-20250122    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                        clps711x_defconfig    clang-19
arm                   randconfig-001-20250122    clang-19
arm                   randconfig-002-20250122    clang-20
arm                   randconfig-003-20250122    gcc-14.2.0
arm                   randconfig-004-20250122    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250122    clang-20
arm64                 randconfig-002-20250122    clang-15
arm64                 randconfig-003-20250122    clang-20
arm64                 randconfig-004-20250122    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250122    gcc-14.2.0
csky                  randconfig-002-20250122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250122    clang-20
hexagon               randconfig-002-20250122    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250122    clang-19
i386        buildonly-randconfig-002-20250122    gcc-12
i386        buildonly-randconfig-003-20250122    gcc-12
i386        buildonly-randconfig-004-20250122    clang-19
i386        buildonly-randconfig-005-20250122    clang-19
i386        buildonly-randconfig-006-20250122    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250122    gcc-14.2.0
loongarch             randconfig-002-20250122    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                           ip32_defconfig    clang-20
nios2                 randconfig-001-20250122    gcc-14.2.0
nios2                 randconfig-002-20250122    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250122    gcc-14.2.0
parisc                randconfig-002-20250122    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250122    gcc-14.2.0
powerpc               randconfig-002-20250122    clang-17
powerpc               randconfig-003-20250122    clang-15
powerpc64             randconfig-001-20250122    clang-20
powerpc64             randconfig-002-20250122    clang-19
powerpc64             randconfig-003-20250122    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                    nommu_k210_defconfig    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                 randconfig-001-20250122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250122    gcc-12
x86_64      buildonly-randconfig-002-20250122    clang-19
x86_64      buildonly-randconfig-003-20250122    gcc-12
x86_64      buildonly-randconfig-004-20250122    gcc-12
x86_64      buildonly-randconfig-005-20250122    gcc-12
x86_64      buildonly-randconfig-006-20250122    clang-19
x86_64                              defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


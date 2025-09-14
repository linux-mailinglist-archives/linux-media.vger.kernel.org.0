Return-Path: <linux-media+bounces-42490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97145B56922
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 15:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A71A189B7F3
	for <lists+linux-media@lfdr.de>; Sun, 14 Sep 2025 13:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CAD20B800;
	Sun, 14 Sep 2025 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQDR93d9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C6DF71
	for <linux-media@vger.kernel.org>; Sun, 14 Sep 2025 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855675; cv=none; b=NMA/V1sDxUtCAsdg6Dgb2tK50/Gh8pWy7XD4eLp0tFFHHbnHfXJr7ZFos5vsdc1TA8hhyJ6AfOlKl+IPtIe4JpVGEJ5jlgqnTxHKNmTnKI29IiGw+27L34xpvBlzJSciK7fHaJ6BqFxHlTMwAGpc7r/4pF0kc94u5K1p/Z+ZTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855675; c=relaxed/simple;
	bh=LSqNx+3KKXdTV6Tae9LzxSnVOs2WVw8/BQk36Mx3lZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bT4dYrMsM0sZPmeppYOJKTf76IerhhjCXEfgjwYJ5UurqfZL60PrNR2ZLsZX+24smcgxJuc2ghbUezbKAXyElx34utU86WgQ/YXkAldLFRRiBL4aVROVQiHsmanhsniHrSQIRc1Wkeg9doJfntKfjWe2mbB6vesMDmTJoS4XF8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQDR93d9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757855672; x=1789391672;
  h=date:from:to:cc:subject:message-id;
  bh=LSqNx+3KKXdTV6Tae9LzxSnVOs2WVw8/BQk36Mx3lZE=;
  b=GQDR93d9io9os1Y0BSQxAu+11OyriAh9MKbj9FEn63MVgNFdXPFHU6Pl
   4HxemyIqjAImGyg7Y1CChHDpu98CY5zNWmh+bV5fGPLySO7aFh+rRmAYl
   5BAldzmsSv5eX+KC/cZTodp2hMN9MSVAcVvV8gq7mXI8TRSRNqUJFl6xk
   2mKscp1XYuuqGyGRo6z0eKe1V9xxBeT4WSE2HBwnGDVyW/P3NYKRH/39G
   s+w4G06yzZko3R1vT8dZArYlmHg+Wc2qz16gZfPIY5KBl1f317ZV4Y63G
   BN21gxnbgaze9m9E8hxGrUhUMEdoGy9lj1Am4ZHr+X6hNq0VX1q/sgUZj
   A==;
X-CSE-ConnectionGUID: wuMNE4V0StCjiZulWCbpnQ==
X-CSE-MsgGUID: xsBzw8YqSX+7sALNWr2f6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59358044"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="59358044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 06:14:31 -0700
X-CSE-ConnectionGUID: nKV5PQGNQ7eaEN83p3+nNw==
X-CSE-MsgGUID: jLEOq2+mRsyfmHfjngFFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="198108154"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2025 06:14:31 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxmYm-0002Po-1y;
	Sun, 14 Sep 2025 13:14:28 +0000
Date: Sun, 14 Sep 2025 21:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 76d2d8f7b6348af5f524b7ed21b5ad7d9686971b
Message-ID: <202509142127.WZa477K0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 76d2d8f7b6348af5f524b7ed21b5ad7d9686971b  media: qcom: camss: Add missing header bitfield.h

elapsed time: 5620m

configs tested: 294
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              alldefconfig    clang-22
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250911    clang-22
arc                   randconfig-001-20250911    gcc-8.5.0
arc                   randconfig-001-20250914    gcc-9.5.0
arc                   randconfig-002-20250911    clang-22
arc                   randconfig-002-20250911    gcc-12.5.0
arc                   randconfig-002-20250914    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-19
arm                   randconfig-001-20250911    clang-22
arm                   randconfig-001-20250914    clang-22
arm                   randconfig-002-20250911    clang-22
arm                   randconfig-002-20250911    gcc-14.3.0
arm                   randconfig-002-20250914    clang-19
arm                   randconfig-003-20250911    clang-22
arm                   randconfig-003-20250914    gcc-14.3.0
arm                   randconfig-004-20250911    clang-16
arm                   randconfig-004-20250911    clang-22
arm                   randconfig-004-20250914    gcc-12.5.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250911    clang-22
arm64                 randconfig-001-20250911    gcc-13.4.0
arm64                 randconfig-001-20250914    gcc-9.5.0
arm64                 randconfig-002-20250911    clang-22
arm64                 randconfig-002-20250911    gcc-8.5.0
arm64                 randconfig-002-20250914    clang-22
arm64                 randconfig-003-20250911    clang-22
arm64                 randconfig-003-20250911    gcc-8.5.0
arm64                 randconfig-003-20250914    clang-17
arm64                 randconfig-004-20250911    clang-22
arm64                 randconfig-004-20250914    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250911    clang-20
csky                  randconfig-001-20250911    gcc-15.1.0
csky                  randconfig-001-20250914    gcc-15.1.0
csky                  randconfig-002-20250911    clang-20
csky                  randconfig-002-20250911    gcc-13.4.0
csky                  randconfig-002-20250914    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250911    clang-20
hexagon               randconfig-001-20250914    clang-22
hexagon               randconfig-002-20250911    clang-20
hexagon               randconfig-002-20250911    clang-22
hexagon               randconfig-002-20250914    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250911    clang-20
i386        buildonly-randconfig-001-20250914    gcc-13
i386        buildonly-randconfig-002-20250911    clang-20
i386        buildonly-randconfig-002-20250914    gcc-14
i386        buildonly-randconfig-003-20250911    clang-20
i386        buildonly-randconfig-003-20250914    gcc-14
i386        buildonly-randconfig-004-20250911    clang-20
i386        buildonly-randconfig-004-20250914    gcc-14
i386        buildonly-randconfig-005-20250911    clang-20
i386        buildonly-randconfig-005-20250914    clang-20
i386        buildonly-randconfig-006-20250911    clang-20
i386        buildonly-randconfig-006-20250914    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250911    clang-20
i386                  randconfig-002-20250911    clang-20
i386                  randconfig-003-20250911    clang-20
i386                  randconfig-004-20250911    clang-20
i386                  randconfig-005-20250911    clang-20
i386                  randconfig-006-20250911    clang-20
i386                  randconfig-007-20250911    clang-20
i386                  randconfig-011-20250911    clang-20
i386                  randconfig-012-20250911    clang-20
i386                  randconfig-013-20250911    clang-20
i386                  randconfig-014-20250911    clang-20
i386                  randconfig-015-20250911    clang-20
i386                  randconfig-016-20250911    clang-20
i386                  randconfig-017-20250911    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250911    clang-20
loongarch             randconfig-001-20250911    gcc-15.1.0
loongarch             randconfig-001-20250914    clang-22
loongarch             randconfig-002-20250911    clang-20
loongarch             randconfig-002-20250911    gcc-15.1.0
loongarch             randconfig-002-20250914    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250911    clang-20
nios2                 randconfig-001-20250911    gcc-11.5.0
nios2                 randconfig-001-20250914    gcc-10.5.0
nios2                 randconfig-002-20250911    clang-20
nios2                 randconfig-002-20250911    gcc-8.5.0
nios2                 randconfig-002-20250914    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250911    clang-20
parisc                randconfig-001-20250911    gcc-8.5.0
parisc                randconfig-001-20250914    gcc-8.5.0
parisc                randconfig-002-20250911    clang-20
parisc                randconfig-002-20250911    gcc-8.5.0
parisc                randconfig-002-20250914    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                       eiger_defconfig    clang-22
powerpc                      ppc6xx_defconfig    clang-22
powerpc               randconfig-001-20250911    clang-20
powerpc               randconfig-001-20250911    gcc-8.5.0
powerpc               randconfig-001-20250914    clang-22
powerpc               randconfig-002-20250911    clang-20
powerpc               randconfig-002-20250911    gcc-15.1.0
powerpc               randconfig-002-20250914    clang-22
powerpc               randconfig-003-20250911    clang-20
powerpc               randconfig-003-20250911    gcc-8.5.0
powerpc               randconfig-003-20250914    clang-22
powerpc64             randconfig-001-20250911    clang-20
powerpc64             randconfig-001-20250911    clang-22
powerpc64             randconfig-001-20250914    clang-22
powerpc64             randconfig-002-20250911    clang-20
powerpc64             randconfig-002-20250911    gcc-11.5.0
powerpc64             randconfig-002-20250914    clang-22
powerpc64             randconfig-003-20250911    clang-20
powerpc64             randconfig-003-20250911    gcc-8.5.0
powerpc64             randconfig-003-20250914    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250911    clang-20
riscv                 randconfig-001-20250911    gcc-15.1.0
riscv                 randconfig-001-20250914    clang-22
riscv                 randconfig-002-20250911    clang-22
riscv                 randconfig-002-20250911    gcc-15.1.0
riscv                 randconfig-002-20250914    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20250911    gcc-11.5.0
s390                  randconfig-001-20250911    gcc-15.1.0
s390                  randconfig-001-20250914    gcc-10.5.0
s390                  randconfig-002-20250911    clang-16
s390                  randconfig-002-20250911    gcc-15.1.0
s390                  randconfig-002-20250914    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250911    gcc-15.1.0
sh                    randconfig-001-20250911    gcc-9.5.0
sh                    randconfig-001-20250914    gcc-15.1.0
sh                    randconfig-002-20250911    gcc-15.1.0
sh                    randconfig-002-20250914    gcc-10.5.0
sh                          sdk7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250911    gcc-15.1.0
sparc                 randconfig-001-20250914    gcc-11.5.0
sparc                 randconfig-002-20250911    gcc-15.1.0
sparc                 randconfig-002-20250914    gcc-14.3.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250911    gcc-15.1.0
sparc64               randconfig-001-20250911    gcc-8.5.0
sparc64               randconfig-001-20250914    gcc-8.5.0
sparc64               randconfig-002-20250911    clang-20
sparc64               randconfig-002-20250911    gcc-15.1.0
sparc64               randconfig-002-20250914    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250911    clang-22
um                    randconfig-001-20250911    gcc-15.1.0
um                    randconfig-001-20250914    clang-22
um                    randconfig-002-20250911    gcc-14
um                    randconfig-002-20250911    gcc-15.1.0
um                    randconfig-002-20250914    clang-18
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250911    clang-20
x86_64      buildonly-randconfig-001-20250911    gcc-14
x86_64      buildonly-randconfig-001-20250914    clang-20
x86_64      buildonly-randconfig-002-20250911    clang-20
x86_64      buildonly-randconfig-002-20250911    gcc-14
x86_64      buildonly-randconfig-002-20250914    clang-20
x86_64      buildonly-randconfig-003-20250911    clang-20
x86_64      buildonly-randconfig-003-20250914    clang-20
x86_64      buildonly-randconfig-004-20250911    clang-20
x86_64      buildonly-randconfig-004-20250914    clang-20
x86_64      buildonly-randconfig-005-20250911    clang-20
x86_64      buildonly-randconfig-005-20250914    gcc-14
x86_64      buildonly-randconfig-006-20250911    clang-20
x86_64      buildonly-randconfig-006-20250911    gcc-14
x86_64      buildonly-randconfig-006-20250914    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250911    clang-20
x86_64                randconfig-072-20250911    clang-20
x86_64                randconfig-073-20250911    clang-20
x86_64                randconfig-074-20250911    clang-20
x86_64                randconfig-075-20250911    clang-20
x86_64                randconfig-076-20250911    clang-20
x86_64                randconfig-077-20250911    clang-20
x86_64                randconfig-078-20250911    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    clang-22
xtensa                randconfig-001-20250911    gcc-12.5.0
xtensa                randconfig-001-20250911    gcc-15.1.0
xtensa                randconfig-001-20250914    gcc-14.3.0
xtensa                randconfig-002-20250911    gcc-15.1.0
xtensa                randconfig-002-20250911    gcc-8.5.0
xtensa                randconfig-002-20250914    gcc-8.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


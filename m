Return-Path: <linux-media+bounces-18140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FB974777
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 02:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC461F26D84
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 00:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDE0DF71;
	Wed, 11 Sep 2024 00:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P474Iqnb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204AB3C30
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 00:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726015341; cv=none; b=N8Si3BCX9HgXm6bBqs1b4jFLe1321Benw5znuME9X1Vc8F+IuabIxosTV/faoZ5l6qn0FEzG0Xzo4CDeMdYxusB1TZFmGd2uD8UYbdXQV2rUZUgTnFUX8iGbw7SOwx/Sap9+azW7qlnEZSC7wG+5gy3LcxVpEM/MCFigYm8GlxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726015341; c=relaxed/simple;
	bh=cMhrBSduVkKLsTrRwxzlScJr9hqnpJ1FfGcpDpQIGb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z921LwfzUJAQdpH+c0NxtzeHIYqzK08LiU43tRlAWt747AeoIrhVe84hx37v7g4d2VYfIYFAneTLEFwR3vgMOYQCUbVZpFHsEE3R2fSwAsbhznEV9VYbxqs4dZqn22SnvPnPTi7qQNoMhJPCyiAd61hsUpcZvVvRBx4w4BolOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P474Iqnb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726015339; x=1757551339;
  h=date:from:to:cc:subject:message-id;
  bh=cMhrBSduVkKLsTrRwxzlScJr9hqnpJ1FfGcpDpQIGb8=;
  b=P474IqnbewGUiy8Hjo1yUzPbcbIpX7mZedsGm4PxRcsVKR2SiTfz3nLV
   K2wLPScXapCTGZOGjoxqj1Mq0O3thizEmRaS8LYBItxijYimHU6xvCOoC
   r1Iipzv0VmunNnlcRK3bw24gd74vP2cSWVK740BeUodNiedCmd9rgIJ0U
   xusyLN9TvQ3u2mPhP+Wg4xcXVoFKozp+lZ2nCq0zdurDU1p5GYqVS+0cx
   etX7OS5PFY/sVaXfWvlXqmfzJAnGpfBKxdyFBi9JSPIOC61bgAHAOVF9I
   uK3+uw+ffWep0JVvEAvkAR7Eej5FUS7q4g15Ynjzo5qyV7eSlUTnILbEX
   w==;
X-CSE-ConnectionGUID: RVvqO8N1TPCAUEw6ViD01w==
X-CSE-MsgGUID: WQFYOYNESa2G9l/lDRUhrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35465787"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="35465787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 17:42:19 -0700
X-CSE-ConnectionGUID: DEgUx8OFSxyogo9FzqM6YA==
X-CSE-MsgGUID: Bw0hvhBbQXm4VXztBxh6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="72000089"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2024 17:42:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soBR1-0002sW-0h;
	Wed, 11 Sep 2024 00:42:15 +0000
Date: Wed, 11 Sep 2024 08:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
Message-ID: <202409110851.id0UPKkk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad  media: atomisp: Use clamp() in ia_css_eed1_8_vmem_encode()

elapsed time: 1076m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240911   gcc-13.2.0
arc                   randconfig-002-20240911   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                      footbridge_defconfig   gcc-14.1.0
arm                            hisi_defconfig   gcc-14.1.0
arm                           imxrt_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                   randconfig-001-20240911   clang-20
arm                   randconfig-002-20240911   clang-20
arm                   randconfig-003-20240911   clang-20
arm                   randconfig-004-20240911   gcc-14.1.0
arm                        realview_defconfig   gcc-14.1.0
arm                         s5pv210_defconfig   gcc-14.1.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240911   clang-20
arm64                 randconfig-002-20240911   clang-15
arm64                 randconfig-003-20240911   clang-20
arm64                 randconfig-004-20240911   clang-15
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240911   gcc-14.1.0
csky                  randconfig-002-20240911   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240911   clang-20
hexagon               randconfig-002-20240911   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240911   clang-18
i386         buildonly-randconfig-001-20240911   gcc-12
i386         buildonly-randconfig-002-20240911   gcc-12
i386         buildonly-randconfig-003-20240911   clang-18
i386         buildonly-randconfig-003-20240911   gcc-12
i386         buildonly-randconfig-004-20240911   gcc-12
i386         buildonly-randconfig-005-20240911   gcc-12
i386         buildonly-randconfig-006-20240911   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240911   gcc-12
i386                  randconfig-002-20240911   clang-18
i386                  randconfig-002-20240911   gcc-12
i386                  randconfig-003-20240911   clang-18
i386                  randconfig-003-20240911   gcc-12
i386                  randconfig-004-20240911   gcc-12
i386                  randconfig-005-20240911   gcc-12
i386                  randconfig-006-20240911   clang-18
i386                  randconfig-006-20240911   gcc-12
i386                  randconfig-011-20240911   gcc-12
i386                  randconfig-012-20240911   gcc-12
i386                  randconfig-013-20240911   clang-18
i386                  randconfig-013-20240911   gcc-12
i386                  randconfig-014-20240911   clang-18
i386                  randconfig-014-20240911   gcc-12
i386                  randconfig-015-20240911   gcc-12
i386                  randconfig-016-20240911   clang-18
i386                  randconfig-016-20240911   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240911   gcc-14.1.0
loongarch             randconfig-002-20240911   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip32_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240911   gcc-14.1.0
nios2                 randconfig-002-20240911   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240911   gcc-14.1.0
parisc                randconfig-002-20240911   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-14.1.0
powerpc                 mpc834x_itx_defconfig   gcc-14.1.0
powerpc                     rainier_defconfig   gcc-14.1.0
powerpc               randconfig-003-20240911   gcc-14.1.0
powerpc64             randconfig-001-20240911   clang-17
powerpc64             randconfig-002-20240911   clang-15
powerpc64             randconfig-003-20240911   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240911   gcc-14.1.0
riscv                 randconfig-002-20240911   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240911   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240911   gcc-14.1.0
sh                          sdk7780_defconfig   gcc-14.1.0
sh                           se7206_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                           alldefconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


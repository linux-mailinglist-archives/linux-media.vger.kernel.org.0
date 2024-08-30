Return-Path: <linux-media+bounces-17237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBA966A12
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 21:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781D21F23D1C
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 19:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76121BE248;
	Fri, 30 Aug 2024 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3Uq/0z1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4A1BAEDD
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725047378; cv=none; b=U1zyTWSRROloR2mxUq9SaJha9xHtpKqah1u3lkTe26eaS1uO1iKWwpzNdIJWE86VLrU4XtWWnY0gUyBCn/X6BXm9hSkgae+Fiw7GGP/YK/3w4a00LWgtoZSCt94sm5q9RVcbN7E5pgQ4TKBsG0MwiO3ArB9ek0HOJSGMeP8c/io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725047378; c=relaxed/simple;
	bh=VTSZQB5oZn4HFZIBgEBGzMpGXy+L1HWu8ajN5b7/C2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IKGRJnKwpN9+Dxk9Tg5EvFq6rCCn4WgCDToQQ2GzJggo5OdJq4d9p5Qb5mQwpqUV301piyCZwERDtx4Eaadmult19/Q4vgIp5VLucObdpO4bfKInos0E2sgi70fRMPyhbugrkHUqE/qeT066bRjmLTpJIglrmxB50124V/X5GaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3Uq/0z1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725047376; x=1756583376;
  h=date:from:to:cc:subject:message-id;
  bh=VTSZQB5oZn4HFZIBgEBGzMpGXy+L1HWu8ajN5b7/C2Q=;
  b=j3Uq/0z1K6NNIEuJuSuORieMBLot0Eb/MzExygB8FNWXP7KYyFzJITyx
   bbvVTnBK1n20YmF5D/w+maAeDDA5p984T7irO4K6o/oCMwPGpGX3YC+mc
   bV21Tf6lvPyArhv8U9WC50z8qV/JEoF356mbbmalarnLavQ3gpXOCALx5
   k1sl1W5iOzyA/+r4VizRP9/H04cv2U4oAR7bJvJJ3qBH7ySH1w8bLQ89x
   /raxri9gdnBnO6v1KHVeqIAcYY1+VHJrR4kSK3EfMoA8OdTwiJB/jxk3R
   68K3otRpL6MSuIp0mt9EymMaXwqkPTIQP2VdMDdaUQdHJXdjVFn3pAxcD
   g==;
X-CSE-ConnectionGUID: kFuXSpexTJq3vF+91IbiEA==
X-CSE-MsgGUID: jvUAFvzOSLGTBhizOdjnGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="35110058"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="35110058"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:49:34 -0700
X-CSE-ConnectionGUID: CoVpZwHRRL69Vc5rJTCrDg==
X-CSE-MsgGUID: WXlOoz22SmWVMNdmIW6x3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64492044"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Aug 2024 12:49:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk7ch-00020w-1Y;
	Fri, 30 Aug 2024 19:49:31 +0000
Date: Sat, 31 Aug 2024 03:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 b9852096720e81d3b9feab488f37ee137af5eef2
Message-ID: <202408310339.Hsskj4wm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: b9852096720e81d3b9feab488f37ee137af5eef2  media: i2c: imx290: Remove CHIP_ID reg definition

elapsed time: 1627m

configs tested: 129
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                       aspeed_g5_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-14.1.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                   milbeaut_m10v_defconfig   gcc-13.2.0
arm                        spear6xx_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240830   gcc-12
i386         buildonly-randconfig-002-20240830   gcc-12
i386         buildonly-randconfig-003-20240830   gcc-12
i386         buildonly-randconfig-004-20240830   gcc-12
i386         buildonly-randconfig-005-20240830   gcc-12
i386         buildonly-randconfig-006-20240830   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240830   gcc-12
i386                  randconfig-002-20240830   gcc-12
i386                  randconfig-003-20240830   gcc-12
i386                  randconfig-004-20240830   gcc-12
i386                  randconfig-005-20240830   gcc-12
i386                  randconfig-006-20240830   gcc-12
i386                  randconfig-011-20240830   gcc-12
i386                  randconfig-012-20240830   gcc-12
i386                  randconfig-013-20240830   gcc-12
i386                  randconfig-014-20240830   gcc-12
i386                  randconfig-015-20240830   gcc-12
i386                  randconfig-016-20240830   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          hp300_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           gcw0_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
riscv                    nommu_virt_defconfig   gcc-13.2.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                   sh7770_generic_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240830   clang-18
x86_64       buildonly-randconfig-002-20240830   clang-18
x86_64       buildonly-randconfig-003-20240830   clang-18
x86_64       buildonly-randconfig-004-20240830   clang-18
x86_64       buildonly-randconfig-005-20240830   clang-18
x86_64       buildonly-randconfig-006-20240830   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240830   clang-18
x86_64                randconfig-002-20240830   clang-18
x86_64                randconfig-003-20240830   clang-18
x86_64                randconfig-004-20240830   clang-18
x86_64                randconfig-005-20240830   clang-18
x86_64                randconfig-006-20240830   clang-18
x86_64                randconfig-011-20240830   clang-18
x86_64                randconfig-012-20240830   clang-18
x86_64                randconfig-013-20240830   clang-18
x86_64                randconfig-014-20240830   clang-18
x86_64                randconfig-015-20240830   clang-18
x86_64                randconfig-016-20240830   clang-18
x86_64                randconfig-071-20240830   clang-18
x86_64                randconfig-072-20240830   clang-18
x86_64                randconfig-073-20240830   clang-18
x86_64                randconfig-074-20240830   clang-18
x86_64                randconfig-075-20240830   clang-18
x86_64                randconfig-076-20240830   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


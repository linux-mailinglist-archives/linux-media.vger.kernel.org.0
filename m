Return-Path: <linux-media+bounces-14643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD80C927916
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 313ACB23ACC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 14:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF591AE873;
	Thu,  4 Jul 2024 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2YEVagC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACCF15491
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104332; cv=none; b=q6VsUlXfvt9AuToja5mAlDoTXW4qrgB6fjXk9wHs5EJngF4cq0+w7wjULXoTgikq2N2PotHL8o357GQx5fSYN3/Sq7WogHBlRSTQlVQaDIyxgvByCNDj83hhNgoXHEJvTBrQovoF3/O43Q0xb3Xto7b/bbSbuvs91Vk6gAYrkKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104332; c=relaxed/simple;
	bh=BMWHDnGb3babnVxYC2dmeivTl7mlcK+asFwcJK3IfdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tm+iJX5JDh07m1FHl7fdMtPjsniCDcMl2O+8v9Lttb3WSfsqI1LgeGlepO9NyvDRxTgoTzh/z7JuUEuIGCKyEUnXmrjzkTxL3q/KsgthFh5EgvkdwyGb9FKrUOdSBB6IuSgeCFHISJ/kbLYs55EqscYcH0hotXwTLyKbs6MB0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2YEVagC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720104331; x=1751640331;
  h=date:from:to:cc:subject:message-id;
  bh=BMWHDnGb3babnVxYC2dmeivTl7mlcK+asFwcJK3IfdE=;
  b=F2YEVagCucbb1bA6fw90zZ0Nkp96SIP/Ir0aJSYSliZVnLlS3NcUNFT9
   8D7R20bcP6+jgzpK5pO3xRq5ofJUVlU1oUm4FmGM1QuN8ipJAY8QdzWoB
   GihT4VqRuImEhFo2llz90oUX1nV6GT4+2kbxL/Lkl0ci+oMRUK/t0ZeH0
   j110DDCfoHk+Et+EqmIu2bedJsBE7Y1QZJBjqygAtNvM1+VMQAEgSGNR6
   J+CIDTgC8n4rx4aY+2Fp9RyQl6DvEeDyZwv/trIT6+pPuZuDwMuFIcB3d
   sOJU7Zq7jt/BFzsOeX95iJ8JZ3X1FghQQJOViFqSvnYndb8c50290Y+JA
   g==;
X-CSE-ConnectionGUID: w9RcfwvZR86aMorNUtQq9Q==
X-CSE-MsgGUID: M1QWmh4SRT6mYEoV+WQaQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21197441"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21197441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:45:30 -0700
X-CSE-ConnectionGUID: LNisCS34RpSW8Arjd02rDg==
X-CSE-MsgGUID: LBdgIPRHSOG5wuwnwc9/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="50949316"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2024 07:45:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPNiA-000R5q-1N;
	Thu, 04 Jul 2024 14:45:26 +0000
Date: Thu, 04 Jul 2024 22:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 a7351f0d3668b449fdc2cfd90403b1cb1f03ed6d
Message-ID: <202407042232.fS2733Yn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: a7351f0d3668b449fdc2cfd90403b1cb1f03ed6d  media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs

elapsed time: 1447m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240704   gcc-13.2.0
arc                   randconfig-002-20240704   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                           h3600_defconfig   gcc-13.2.0
arm                   randconfig-001-20240704   gcc-13.2.0
arm                   randconfig-002-20240704   gcc-13.2.0
arm                   randconfig-003-20240704   clang-19
arm                   randconfig-004-20240704   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240704   clang-19
arm64                 randconfig-002-20240704   gcc-13.2.0
arm64                 randconfig-003-20240704   clang-19
arm64                 randconfig-004-20240704   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240704   gcc-13.2.0
csky                  randconfig-002-20240704   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240704   clang-19
hexagon               randconfig-002-20240704   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240704   clang-18
i386         buildonly-randconfig-002-20240704   gcc-13
i386         buildonly-randconfig-003-20240704   gcc-13
i386         buildonly-randconfig-004-20240704   gcc-12
i386         buildonly-randconfig-005-20240704   gcc-12
i386         buildonly-randconfig-006-20240704   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240704   clang-18
i386                  randconfig-002-20240704   gcc-13
i386                  randconfig-003-20240704   clang-18
i386                  randconfig-004-20240704   gcc-13
i386                  randconfig-005-20240704   clang-18
i386                  randconfig-006-20240704   gcc-12
i386                  randconfig-011-20240704   gcc-13
i386                  randconfig-012-20240704   clang-18
i386                  randconfig-013-20240704   clang-18
i386                  randconfig-014-20240704   clang-18
i386                  randconfig-015-20240704   clang-18
i386                  randconfig-016-20240704   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240704   gcc-13.2.0
loongarch             randconfig-002-20240704   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                          atari_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           mtx1_defconfig   clang-16
mips                          rm200_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240704   gcc-13.2.0
nios2                 randconfig-002-20240704   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240704   gcc-13.2.0
parisc                randconfig-002-20240704   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   clang-17
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc               mpc834x_itxgp_defconfig   clang-14
powerpc                      ppc40x_defconfig   clang-19
powerpc               randconfig-001-20240704   gcc-13.2.0
powerpc               randconfig-002-20240704   gcc-13.2.0
powerpc               randconfig-003-20240704   clang-19
powerpc64             randconfig-001-20240704   gcc-13.2.0
powerpc64             randconfig-002-20240704   gcc-13.2.0
powerpc64             randconfig-003-20240704   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240704   clang-19
riscv                 randconfig-002-20240704   clang-16
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240704   clang-19
s390                  randconfig-002-20240704   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                    randconfig-001-20240704   gcc-13.2.0
sh                    randconfig-002-20240704   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc64               randconfig-001-20240704   gcc-13.2.0
sparc64               randconfig-002-20240704   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240704   gcc-10
um                    randconfig-002-20240704   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240704   clang-18
x86_64       buildonly-randconfig-002-20240704   gcc-12
x86_64       buildonly-randconfig-003-20240704   clang-18
x86_64       buildonly-randconfig-004-20240704   gcc-13
x86_64       buildonly-randconfig-005-20240704   gcc-12
x86_64       buildonly-randconfig-006-20240704   gcc-13
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240704   gcc-13.2.0
xtensa                randconfig-002-20240704   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


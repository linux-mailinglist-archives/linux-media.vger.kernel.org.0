Return-Path: <linux-media+bounces-17289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F2967335
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 22:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B1428334D
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 20:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C612C17DE15;
	Sat, 31 Aug 2024 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceanVtci"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D013C3DD
	for <linux-media@vger.kernel.org>; Sat, 31 Aug 2024 20:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725135022; cv=none; b=dG+m612YE4yItkh+eqehCuqWYRE2/gfJLljgSPQwVCng26cXthNxEFUSQ9G3YUGgzDfcK7BCkBf8xJ4RdNp/IXpYPA+XoM0NPP2s+FZFmOb22b6p2KZvILpPfo6WElnNl8ta+iljeCLi5t4uk6vMX3GNa65bxEe7R1a1lgFmEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725135022; c=relaxed/simple;
	bh=niMevgJxlHCflefsIfpUJn/6VXofZeQI/WOTjZfz3qY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J202YGEonjNlGh50hm180gWMGLpa8j8K5MmHlbW4QdBq2ZyccC+Lo9bJwFh7EnhOGDv8Zr3qJDdOmMmbAPEWjTZkMaf8jJwHqvUSeNdjR108rm+AhmVTCQAfuM7MsKrAoqwK/ap+BN9mh6Jk9gb4H7q1CxHy/nY0ewnopKBhfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceanVtci; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725135019; x=1756671019;
  h=date:from:to:cc:subject:message-id;
  bh=niMevgJxlHCflefsIfpUJn/6VXofZeQI/WOTjZfz3qY=;
  b=ceanVtci+o0ge31ai2iQxd2KGG94V716Vn6fqF4T7Ur5jRZz7vQjsUvL
   8usZi4hFlmM4meoWwdrKfm/dxtM1QIMUNWyz+Dz1vtO4/z9N3nqulcPsw
   1i7iJvnEh5liwhjA4sAUY62gEkptyOxuzx8fyGiIgiFl3D+Rpu1jtqrG+
   LGZ3GJEnMQnw7P+SgAPHMdxEKRGfEvMlxl8VwPvrMdKe0mYaL1PWLo7hM
   EaWdxpxzdJCa+Cc/ECU9O7gEfDdMeS/b4I/E6ExW+Ux2I++qlDtzStOeh
   pJjM7pS8FpZCQbBmajPszkT/xlexntap8HbERDefkU6fRzjfe7rRJIHni
   Q==;
X-CSE-ConnectionGUID: d/Wv7uhMREGQQ2ia5VMgiA==
X-CSE-MsgGUID: RVBl/xGSSrq3HPiCXNmQcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23924049"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23924049"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:10:19 -0700
X-CSE-ConnectionGUID: Jz+Wt8bFTEaXxZasHs0WDA==
X-CSE-MsgGUID: DGlBQ3+8TFmmty2VYsabGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94925973"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 13:10:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUQJ-000354-2m;
	Sat, 31 Aug 2024 20:10:15 +0000
Date: Sun, 01 Sep 2024 04:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 3f52e32445a1f63b788bc8969b7dc2386a80a24d
Message-ID: <202409010402.KfUTBtGi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 3f52e32445a1f63b788bc8969b7dc2386a80a24d  media: MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsystem

elapsed time: 728m

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
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                          ep93xx_defconfig   clang-20
arm                             mxs_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                          pxa3xx_defconfig   clang-20
arm                        realview_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   clang-20
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
i386         buildonly-randconfig-001-20240831   clang-18
i386         buildonly-randconfig-002-20240831   clang-18
i386         buildonly-randconfig-003-20240831   clang-18
i386         buildonly-randconfig-004-20240831   clang-18
i386         buildonly-randconfig-005-20240831   clang-18
i386         buildonly-randconfig-006-20240831   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240831   clang-18
i386                  randconfig-002-20240831   clang-18
i386                  randconfig-003-20240831   clang-18
i386                  randconfig-004-20240831   clang-18
i386                  randconfig-005-20240831   clang-18
i386                  randconfig-006-20240831   clang-18
i386                  randconfig-011-20240831   clang-18
i386                  randconfig-012-20240831   clang-18
i386                  randconfig-013-20240831   clang-18
i386                  randconfig-014-20240831   clang-18
i386                  randconfig-015-20240831   clang-18
i386                  randconfig-016-20240831   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                      bmips_stb_defconfig   clang-20
mips                          eyeq5_defconfig   clang-20
mips                           gcw0_defconfig   clang-20
mips                            gpr_defconfig   clang-20
mips                           ip28_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
mips                         rt305x_defconfig   clang-20
nios2                         10m50_defconfig   clang-20
nios2                            alldefconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                  or1klitex_defconfig   clang-20
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                generic-64bit_defconfig   clang-20
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   clang-20
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                       eiger_defconfig   clang-20
powerpc                    gamecube_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                     mpc512x_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                     sequoia_defconfig   clang-20
powerpc                     skiroot_defconfig   clang-20
powerpc                     tqm8540_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                    nommu_k210_defconfig   clang-20
s390                             alldefconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          kfr2r09_defconfig   clang-20
sh                           se7780_defconfig   clang-20
sh                   secureedge5410_defconfig   clang-20
sh                             shx3_defconfig   clang-20
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
x86_64       buildonly-randconfig-001-20240831   clang-18
x86_64       buildonly-randconfig-002-20240831   clang-18
x86_64       buildonly-randconfig-003-20240831   clang-18
x86_64       buildonly-randconfig-004-20240831   clang-18
x86_64       buildonly-randconfig-005-20240831   clang-18
x86_64       buildonly-randconfig-006-20240831   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240831   clang-18
x86_64                randconfig-002-20240831   clang-18
x86_64                randconfig-003-20240831   clang-18
x86_64                randconfig-004-20240831   clang-18
x86_64                randconfig-005-20240831   clang-18
x86_64                randconfig-006-20240831   clang-18
x86_64                randconfig-011-20240831   clang-18
x86_64                randconfig-012-20240831   clang-18
x86_64                randconfig-013-20240831   clang-18
x86_64                randconfig-014-20240831   clang-18
x86_64                randconfig-015-20240831   clang-18
x86_64                randconfig-016-20240831   clang-18
x86_64                randconfig-071-20240831   clang-18
x86_64                randconfig-072-20240831   clang-18
x86_64                randconfig-073-20240831   clang-18
x86_64                randconfig-074-20240831   clang-18
x86_64                randconfig-075-20240831   clang-18
x86_64                randconfig-076-20240831   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                          iss_defconfig   clang-20

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


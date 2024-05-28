Return-Path: <linux-media+bounces-12112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3D8D2387
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 20:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727301F24473
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 18:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A84816F91D;
	Tue, 28 May 2024 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDg4NwvL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266AB39FFB
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922457; cv=none; b=ltor/xIYTwTGOwmBLJxZ2Z4U+TxyS8c/wDdHP+RIu8SpWzk4h6J1k1kCfTrHx6TuRVu51tACcUZ3rBZlugkLYe2RE6MSktdSIY7UptxpfGwoq/tvr46ZlbPtKPufe1/pO3Oe+g8IKcrhscan8lX7TdWjsxkD11puZxF2FWTKbak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922457; c=relaxed/simple;
	bh=GXzI8kYhwuD/7Iwe5fF3nEJqTo1dsEAKg1fn/Vins8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BgxXyccTmTu0MnrP3YAK2wu71Jg8/qcI/5WYT838X5GZu/kXSraGDEdbuuBhoqaP7tKHaXzW/zYAgf16RHnxQMayyzEClbj6jn+TtzsUrcn27vYkx5d0JyH+a+9DjFMeTHj7lVKSdz7RKFJHI9e0vr8klYUxyUmAM91T2LFHZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDg4NwvL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716922455; x=1748458455;
  h=date:from:to:cc:subject:message-id;
  bh=GXzI8kYhwuD/7Iwe5fF3nEJqTo1dsEAKg1fn/Vins8k=;
  b=oDg4NwvLXOYoQ0TpKjGkAKI11zVCl6kkjiOaz5jP+yar5DoqXLPHiCYv
   ZmCK69v/Rnp6YWGl1HZykYRSwCZa9cWPcrTNzGEliT5mf4QZo5Xppe0Hc
   SYs6XArfxXCC7vOCzL7ixqOb9s2rS+T/X3OmamEFqXvPehPR5blc4Ym7z
   iTfgU7PY/e+Q5XyVuXAdzACsh6ba2AkfezRSA3Aa/eurmT9OZTBWmoxm7
   uJL35yeLxMnlfociXD4OWFLMaPtsL+amojONunAjHvkYCKqaSZACRJxby
   OLlj/DK8C/WKVWWZRGO3tJvqnatw2ryTO01u5hgg9bu5JSt08xHhuQCx7
   w==;
X-CSE-ConnectionGUID: oraKPIcoSEenpd16yFmNSg==
X-CSE-MsgGUID: reXPVY/xSuqHAFqUVoxZ1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13140035"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13140035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 11:54:15 -0700
X-CSE-ConnectionGUID: AH9Rnl4qS4qGXqo3f+eZJg==
X-CSE-MsgGUID: tR0ubUZHTzGuHZurMzVTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="66024858"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2024 11:54:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC1xb-000Cdl-0C;
	Tue, 28 May 2024 18:54:11 +0000
Date: Wed, 29 May 2024 02:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 c19fa08c1414644b0d9275d336bdaff90af57d0b
Message-ID: <202405290237.RCVogj3M-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: c19fa08c1414644b0d9275d336bdaff90af57d0b  media: intel/ipu6: fix the buffer flags caused by wrong parentheses

elapsed time: 771m

configs tested: 207
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240528   gcc  
arc                   randconfig-002-20240528   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          gemini_defconfig   clang
arm                      jornada720_defconfig   clang
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240528   gcc  
arm                   randconfig-002-20240528   gcc  
arm                   randconfig-004-20240528   clang
arm                        spear6xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240528   clang
arm64                 randconfig-002-20240528   clang
arm64                 randconfig-003-20240528   gcc  
arm64                 randconfig-004-20240528   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240528   gcc  
csky                  randconfig-002-20240528   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240528   clang
hexagon               randconfig-002-20240528   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240528   clang
i386         buildonly-randconfig-003-20240528   clang
i386         buildonly-randconfig-004-20240528   clang
i386         buildonly-randconfig-005-20240528   clang
i386         buildonly-randconfig-006-20240528   clang
i386                                defconfig   clang
i386                  randconfig-001-20240528   clang
i386                  randconfig-002-20240528   clang
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-011-20240528   clang
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240528   clang
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240528   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240528   gcc  
loongarch             randconfig-002-20240528   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240528   gcc  
nios2                 randconfig-002-20240528   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240528   gcc  
parisc                randconfig-002-20240528   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240528   gcc  
powerpc               randconfig-002-20240528   clang
powerpc               randconfig-003-20240528   clang
powerpc                     tqm8541_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240528   clang
powerpc64             randconfig-002-20240528   gcc  
powerpc64             randconfig-003-20240528   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240528   clang
riscv                 randconfig-002-20240528   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240528   gcc  
s390                  randconfig-002-20240528   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240528   gcc  
sh                    randconfig-002-20240528   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240528   gcc  
sparc64               randconfig-002-20240528   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240528   gcc  
um                    randconfig-002-20240528   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240528   clang
x86_64       buildonly-randconfig-002-20240528   clang
x86_64       buildonly-randconfig-003-20240528   clang
x86_64       buildonly-randconfig-004-20240528   gcc  
x86_64       buildonly-randconfig-005-20240528   clang
x86_64       buildonly-randconfig-006-20240528   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240528   clang
x86_64                randconfig-002-20240528   clang
x86_64                randconfig-003-20240528   clang
x86_64                randconfig-004-20240528   gcc  
x86_64                randconfig-005-20240528   clang
x86_64                randconfig-006-20240528   gcc  
x86_64                randconfig-011-20240528   gcc  
x86_64                randconfig-012-20240528   gcc  
x86_64                randconfig-013-20240528   clang
x86_64                randconfig-014-20240528   clang
x86_64                randconfig-015-20240528   clang
x86_64                randconfig-016-20240528   gcc  
x86_64                randconfig-071-20240528   clang
x86_64                randconfig-072-20240528   gcc  
x86_64                randconfig-073-20240528   gcc  
x86_64                randconfig-074-20240528   gcc  
x86_64                randconfig-075-20240528   clang
x86_64                randconfig-076-20240528   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240528   gcc  
xtensa                randconfig-002-20240528   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


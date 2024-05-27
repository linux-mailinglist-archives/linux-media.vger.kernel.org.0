Return-Path: <linux-media+bounces-12046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557B8D106D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 01:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939D91F21DDB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569F513B293;
	Mon, 27 May 2024 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFX1zqUU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8C13A412
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 23:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716850820; cv=none; b=XiElLuKOpKuev0gJxyk4r0FHCFoistvx3cdhaYr567ZXaoOGDx9YC+yq1KTC+3gjqeHVO290sgtJih4clEUzXRZ6c1lYDI8f2viDf1IH8qbK7j/+t3HF59F8N2IXwe0WuEGywDKUEODybWKpjN8VkhfJY5CT0GlfGU3n8Fs/OHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716850820; c=relaxed/simple;
	bh=72rrI+jyWWOUVfmt8wVNZFj12dMusrpY+D8zW1dzAOY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b3cpPrqopTEbjdLoZeDl3/NYb4MZueF5HhE1ToPS8rNseKcbBtbqnV3Y8eHeB0fq1gu8DPFf6INL96knh0n1GDKsw6gKucXvK/tzM/SkIPthiQSgVdsQtLhGkKfa/W1txGM+W9speeEUZsAA/raW5ORmUOpsp8K7uy3Ue2lAjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFX1zqUU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716850818; x=1748386818;
  h=date:from:to:cc:subject:message-id;
  bh=72rrI+jyWWOUVfmt8wVNZFj12dMusrpY+D8zW1dzAOY=;
  b=lFX1zqUUBforowl5r93Rs+jfuEupUjZbNVGDAArXbcrkW38sTjcmAd+L
   buAeKttaIIiJ7i/d3TEsifqSNin/C8Ynr+H8s/c7U+5D3bv4Q4/qRRIkD
   79tEWCqZz1BkgLtYYZFjbrjGzciyqIx6wKZH7rY8cllpsQARrfNXrGgWQ
   /USkG/84/kuqW8PEXD5z+SiQUN0ajZa17A+/dEGAuj6XlbKrVskgwGget
   NQHl0nIauATBjuI/4m70z+1GFgZBMEm+326ixCF2dtvXNHUsf43c4d3iP
   KpF3BOnnlTjN0OorMdinwuSoWqe+evOvn3EV0biZPOoZdHEwKJrbHXxyI
   Q==;
X-CSE-ConnectionGUID: ++VsBuVHR9C8RdJZCZYXQQ==
X-CSE-MsgGUID: XC6gx4acTr64R5iS4nlAuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17008989"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="17008989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 16:00:18 -0700
X-CSE-ConnectionGUID: 9gt9FT5HRJWlahAjHoxtyg==
X-CSE-MsgGUID: NnYwgVerRr20pD5dTXW30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39858462"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2024 16:00:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBjKA-000BAd-27;
	Mon, 27 May 2024 23:00:14 +0000
Date: Tue, 28 May 2024 07:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 825fc49497957310e421454fe3fb8b8d8d8e2dd2
Message-ID: <202405280659.LsBkswYC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 825fc49497957310e421454fe3fb8b8d8d8e2dd2  media: mgb4: Fix double debugfs remove

elapsed time: 745m

configs tested: 201
configs skipped: 3

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
arc                   randconfig-001-20240527   gcc  
arc                   randconfig-002-20240527   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      integrator_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240527   clang
arm                   randconfig-002-20240527   gcc  
arm                   randconfig-003-20240527   gcc  
arm                   randconfig-004-20240527   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240527   gcc  
arm64                 randconfig-002-20240527   gcc  
arm64                 randconfig-003-20240527   clang
arm64                 randconfig-004-20240527   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240527   gcc  
csky                  randconfig-002-20240527   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240527   clang
hexagon               randconfig-002-20240527   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240527   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240527   gcc  
i386         buildonly-randconfig-003-20240527   gcc  
i386         buildonly-randconfig-004-20240527   clang
i386         buildonly-randconfig-005-20240527   gcc  
i386         buildonly-randconfig-006-20240527   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240527   gcc  
i386                  randconfig-002-20240527   clang
i386                  randconfig-003-20240527   gcc  
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-004-20240527   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-005-20240527   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240527   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-011-20240527   gcc  
i386                  randconfig-012-20240527   clang
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240527   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240527   clang
i386                  randconfig-015-20240527   gcc  
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240527   clang
i386                  randconfig-016-20240528   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240527   gcc  
loongarch             randconfig-002-20240527   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                     loongson1b_defconfig   clang
mips                     loongson2k_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                   sb1250_swarm_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240527   gcc  
nios2                 randconfig-002-20240527   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240527   gcc  
parisc                randconfig-002-20240527   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                       holly_defconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240527   gcc  
powerpc               randconfig-002-20240527   gcc  
powerpc               randconfig-003-20240527   clang
powerpc64             randconfig-001-20240527   clang
powerpc64             randconfig-002-20240527   gcc  
powerpc64             randconfig-003-20240527   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240527   clang
riscv                 randconfig-002-20240527   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240527   clang
s390                  randconfig-002-20240527   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                    randconfig-001-20240527   gcc  
sh                    randconfig-002-20240527   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240527   gcc  
sparc64               randconfig-002-20240527   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240527   gcc  
um                    randconfig-002-20240527   gcc  
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
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240527   gcc  
xtensa                randconfig-002-20240527   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-10784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B368BBFEB
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 11:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D221C20A85
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74797482;
	Sun,  5 May 2024 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hj99dJhI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED455680
	for <linux-media@vger.kernel.org>; Sun,  5 May 2024 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714900617; cv=none; b=faOhTlfv19Z+noZ7J6PAmQ+0z0Skc2KYWTjDcqCfzo/6cImj1BnB4016FThbmCJgZz+YXFZcZZB9US1TEdEAVvhv3JK92IoNCZbNyAEIwl3q2W3uiaELsidnQzrBGjaimI5UL67kAjYjFXPx2QC9O0Su1N+h7D2RWFmJoQfM9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714900617; c=relaxed/simple;
	bh=bwi4ZWGsYgplalj1kA1CUp9YVFLejRZudIU3jgAqWp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CvsnfbjIsKxeAr892pI1IYynzPQoAszEe2rR4AAIDDQYO34HOGLF8YGzFR+xPDkj/v4vHppTftrzqbHwhwSISaXfQII8QXd9wc8C7PRbOFOVbU8KF+8oaiWeij0D6dREyYROrkvC9zxQnk7w71H4964JKVhViX1ePcUq2r3uZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hj99dJhI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714900615; x=1746436615;
  h=date:from:to:cc:subject:message-id;
  bh=bwi4ZWGsYgplalj1kA1CUp9YVFLejRZudIU3jgAqWp0=;
  b=Hj99dJhIYgQ/ejlrjsYwULaYm3vjNLOf0U7UAG0e93iQfrCeU1iEsxLz
   JPptm21GZlM5stMU9y7fsWjB3uJKTI+aYMZsD2oL4BdewAXFaLfaIBX45
   fseONQ7zunJPX5HbSjC6WoP6mzzixQ7c8LLgF8GDdAYqB7ger2BSgXzo5
   nWnpajiwKKHiihT2ckgm2xbM0vPL6l7Ptp72z4VowMrXBlZuTXZqdNbXR
   IrQxVdBgMDeZ7lOkdVxV/q2k7kgpqBnkN3OtrOxxeEXLMJvuuJ1nu5ahs
   xnyWtrJW9D4hzHzomKqSV6SxZBDmSA2WXe1uMsrJw7jaW3pMZZGGvfaP7
   A==;
X-CSE-ConnectionGUID: Moj3uqtLQbizNK1qbPSuBA==
X-CSE-MsgGUID: LeJRqGyEQ1mQAqfZ/FNqXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10536100"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10536100"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 02:16:54 -0700
X-CSE-ConnectionGUID: ajrUsUJUQ4axWnz1Nwgb9g==
X-CSE-MsgGUID: DTX2ptYrQdaBnWQ9GcUrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="27902673"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 May 2024 02:16:53 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3XzH-00006Q-1H;
	Sun, 05 May 2024 09:16:51 +0000
Date: Sun, 05 May 2024 17:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 e695668af8523b059127dfa8b261c76e7c9cde10
Message-ID: <202405051719.yZR1zXZ9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: e695668af8523b059127dfa8b261c76e7c9cde10  media: cec.h: Fix kerneldoc

elapsed time: 1454m

configs tested: 161
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
arc                   randconfig-001-20240504   gcc  
arc                   randconfig-002-20240504   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                            mps2_defconfig   clang
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240504   clang
arm                   randconfig-002-20240504   clang
arm                   randconfig-003-20240504   clang
arm                   randconfig-004-20240504   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240504   gcc  
arm64                 randconfig-002-20240504   gcc  
arm64                 randconfig-003-20240504   gcc  
arm64                 randconfig-004-20240504   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240504   gcc  
csky                  randconfig-002-20240504   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240504   clang
hexagon               randconfig-002-20240504   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240504   clang
i386         buildonly-randconfig-002-20240504   gcc  
i386         buildonly-randconfig-003-20240504   gcc  
i386         buildonly-randconfig-004-20240504   clang
i386         buildonly-randconfig-005-20240504   clang
i386         buildonly-randconfig-006-20240504   clang
i386                                defconfig   clang
i386                  randconfig-001-20240504   gcc  
i386                  randconfig-002-20240504   clang
i386                  randconfig-003-20240504   gcc  
i386                  randconfig-004-20240504   clang
i386                  randconfig-005-20240504   clang
i386                  randconfig-006-20240504   gcc  
i386                  randconfig-011-20240504   gcc  
i386                  randconfig-012-20240504   clang
i386                  randconfig-013-20240504   clang
i386                  randconfig-014-20240504   gcc  
i386                  randconfig-015-20240504   gcc  
i386                  randconfig-016-20240504   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240504   gcc  
loongarch             randconfig-002-20240504   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240504   gcc  
nios2                 randconfig-002-20240504   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240504   gcc  
parisc                randconfig-002-20240504   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       eiger_defconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240505   gcc  
x86_64       buildonly-randconfig-002-20240505   clang
x86_64       buildonly-randconfig-003-20240505   clang
x86_64       buildonly-randconfig-004-20240505   clang
x86_64       buildonly-randconfig-005-20240505   gcc  
x86_64       buildonly-randconfig-006-20240505   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240505   clang
x86_64                randconfig-002-20240505   gcc  
x86_64                randconfig-003-20240505   clang
x86_64                randconfig-004-20240505   gcc  
x86_64                randconfig-005-20240505   gcc  
x86_64                randconfig-006-20240505   gcc  
x86_64                randconfig-011-20240505   clang
x86_64                randconfig-012-20240505   clang
x86_64                randconfig-013-20240505   clang
x86_64                randconfig-014-20240505   clang
x86_64                randconfig-015-20240505   clang
x86_64                randconfig-016-20240505   clang
x86_64                randconfig-071-20240505   clang
x86_64                randconfig-072-20240505   gcc  
x86_64                randconfig-073-20240505   gcc  
x86_64                randconfig-074-20240505   gcc  
x86_64                randconfig-075-20240505   clang
x86_64                randconfig-076-20240505   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-12935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 888029037E9
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C4C1F27B84
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DE0176254;
	Tue, 11 Jun 2024 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjQ+dnzy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A411BF2A
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098454; cv=none; b=YvbA2MzcsuEnrGINleykEXDo04t8padbTYH4/9Gpg+IqtOhk8qYGt3UYJn4amhmsQqMG0u5YKoNrmo5YJ3jZiaoDc2wrWENdBGsneoUItyhZILroHMz52IECFw4VsnGGG+1h/FqMlFYrsoqke1GxKSbQLsR0V20D+QLTUituTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098454; c=relaxed/simple;
	bh=7C3tfhG6HzPifzmFOfKKyFSpPxt8c6o0oNQbKHabxxI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGkrzxBd8rbhUmTQJiEuuvZW1GWJJ8N5/7sBmQtDdBd/o03wIuV41WLcfIP9ZFMS8VTvBJJZpo6ENykgeaHuidavko5GU6n5aI0ZNtaimh5sjAa9GqtB/5H5zX97AhDy3diIYLQj1MLySs4tx4SC9HU1uh0dK/S4tnjem50Fsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjQ+dnzy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718098452; x=1749634452;
  h=date:from:to:cc:subject:message-id;
  bh=7C3tfhG6HzPifzmFOfKKyFSpPxt8c6o0oNQbKHabxxI=;
  b=YjQ+dnzyP/eICMrTT/G+85e2nfQbh4r6TVe94pcFwKZb/cfYEV0mSw8J
   cuCdwEbYRV9sdapvPWbAizVCJtH9fo449rRDtmbUq7dvyoSZ7zInIYSLM
   QyRNjvuXAtCB0WVe6e2re4lQm0+cYo/8bgXEp6+g3twvtWWdlklPYYhzd
   ogPRgJZp2Jw/YeVmrDbIv7BP4FKVhl1N+iIS97NzjGTncJOLZiLbSClhw
   smnoNWKqrx7y3/8lizYhMp3iuOroR9GFdOXwmh/qcr5rhoX86nkElR8Oi
   LDw1cBmXaxOSlNxBNHrRG182Uc+gi+QndfRghzM20dARgC+YMqnD67IqM
   w==;
X-CSE-ConnectionGUID: JMQwWRTLTK+KsvjLR3XqgQ==
X-CSE-MsgGUID: w2ZWPIluRyO9osGRhck37g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26199730"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="26199730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 02:34:11 -0700
X-CSE-ConnectionGUID: i447GgcfQi+o23oaDKyp9g==
X-CSE-MsgGUID: tmqVGhQdRYGJjxDE1SxVXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39318216"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2024 02:34:10 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGxtH-0000Gn-1i;
	Tue, 11 Jun 2024 09:34:07 +0000
Date: Tue, 11 Jun 2024 17:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 1034ead1a7333e65e516c583f757717f461eba43
Message-ID: <202406111701.Al7VbG8F-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 1034ead1a7333e65e516c583f757717f461eba43  media: amphion: Report the average QP of current encoded frame

elapsed time: 1456m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   alpha
allnoconfig                        gcc-13.2.0   alpha
allyesconfig                            alpha   defconfig
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   arc  
allnoconfig                        gcc-13.2.0   arc  
defconfig                                 arc   defconfig
gcc-13.2.0                                arc   randconfig-001-20240611
arc                   randconfig-002-20240611   arm  
allnoconfig                               arm   defconfig
arm                   randconfig-001-20240611   arm  
randconfig-002-20240611                              arm   randconfig-003-20240611
arm                   randconfig-004-20240611   arm64
allnoconfig                             arm64   defconfig
arm64                 randconfig-001-20240611   arm64
randconfig-002-20240611                            arm64   randconfig-003-20240611
arm64                 randconfig-004-20240611   csky 
allnoconfig                              csky   defconfig
csky                  randconfig-001-20240611   csky 
randconfig-002-20240611                          hexagon   allmodconfig
hexagon                           allnoconfig   hexagon
allyesconfig                          hexagon   defconfig
hexagon               randconfig-001-20240611   hexagon
randconfig-002-20240611                             i386   allmodconfig
i386                              allnoconfig   i386 
allyesconfig                             i386   buildonly-randconfig-001-20240610
i386         buildonly-randconfig-002-20240610   i386 
buildonly-randconfig-003-20240610                             i386   buildonly-randconfig-003-20240611
i386         buildonly-randconfig-004-20240610   i386 
buildonly-randconfig-005-20240610                             i386   buildonly-randconfig-006-20240610
i386                                defconfig   i386 
randconfig-001-20240610                             i386   randconfig-001-20240611
i386                  randconfig-002-20240610   i386 
randconfig-003-20240610                             i386   randconfig-004-20240610
i386                  randconfig-004-20240611   i386 
randconfig-005-20240610                             i386   randconfig-006-20240610
i386                  randconfig-006-20240611   i386 
randconfig-011-20240610                             i386   randconfig-011-20240611
i386                  randconfig-012-20240610   i386 
randconfig-013-20240610                             i386   randconfig-013-20240611
i386                  randconfig-014-20240610   i386 
randconfig-015-20240610                             i386   randconfig-015-20240611
i386                  randconfig-016-20240610   i386 
randconfig-016-20240611                        loongarch   allmodconfig
loongarch                         allnoconfig   loongarch
defconfig                           loongarch   randconfig-001-20240611
loongarch             randconfig-002-20240611   m68k 
allmodconfig                             m68k   allnoconfig
m68k                             allyesconfig   m68k 
defconfig                          microblaze   allmodconfig
microblaze                        allnoconfig   microblaze
allyesconfig                       microblaze   defconfig
mips                              allnoconfig   mips 
allyesconfig                            nios2   allmodconfig
nios2                             allnoconfig   nios2
allyesconfig                            nios2   defconfig
nios2                 randconfig-001-20240611   gcc-13.2.0
nios2                 randconfig-002-20240611   gcc-13.2.0
openrisc                          allnoconfig   openrisc
allyesconfig                         openrisc   defconfig
parisc                           allmodconfig   parisc
allnoconfig                            parisc   allyesconfig
gcc-13.2.0                             parisc   defconfig
parisc                randconfig-001-20240611   gcc-13.2.0
parisc                randconfig-002-20240611   gcc-13.2.0
parisc64                            defconfig   powerpc
allmodconfig                       gcc-13.2.0   powerpc
allnoconfig                           powerpc   allyesconfig
clang-19                              powerpc   randconfig-001-20240611
gcc-13.2.0                            powerpc   randconfig-002-20240611
clang-19                                riscv   allmodconfig
clang-19                                riscv   allnoconfig
riscv                            allyesconfig   clang-19
riscv                               defconfig   s390 
allmodconfig                             s390   allnoconfig
s390                             allyesconfig   s390 
defconfig                                  sh   allmodconfig
sh                                allnoconfig   sh   
allyesconfig                               sh   defconfig
sparc                            allmodconfig   sparc
allnoconfig                             sparc   defconfig
sparc64                          allmodconfig   sparc64
allyesconfig                          sparc64   defconfig
um                               allmodconfig   um   
allnoconfig                                um   allyesconfig
um                                  defconfig   um   
i386_defconfig                               um   x86_64_defconfig
x86_64                            allnoconfig   x86_64
allyesconfig                           x86_64   buildonly-randconfig-001-20240611
x86_64       buildonly-randconfig-002-20240611   x86_64
buildonly-randconfig-003-20240611                           x86_64   buildonly-randconfig-004-20240611
x86_64       buildonly-randconfig-005-20240611   x86_64
buildonly-randconfig-006-20240611                           x86_64   defconfig
x86_64                randconfig-001-20240611   x86_64
randconfig-002-20240611                           x86_64   randconfig-003-20240611
x86_64                randconfig-004-20240611   x86_64
randconfig-005-20240611                           x86_64   randconfig-006-20240611
x86_64                randconfig-011-20240611   x86_64
randconfig-012-20240611                           x86_64   randconfig-013-20240611
x86_64                randconfig-014-20240611   x86_64
randconfig-015-20240611                           x86_64   randconfig-016-20240611
x86_64                randconfig-071-20240611   x86_64
randconfig-072-20240611                           x86_64   randconfig-073-20240611
x86_64                randconfig-074-20240611   x86_64
randconfig-075-20240611                           x86_64   randconfig-076-20240611
x86_64                          rhel-8.3-rust   xtensa
allnoconfig                                          

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


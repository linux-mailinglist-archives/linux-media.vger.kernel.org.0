Return-Path: <linux-media+bounces-5334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB78858EE5
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385961F2252E
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D389160DC7;
	Sat, 17 Feb 2024 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="He5jalPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965559B56
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708167643; cv=none; b=NHAnufKZH9uu0na/OP5nZXvbGzcXCqMni12pgdyWgHY8pXvnjfIXnOuBwCw/KUlbzSgPyQQ9m1IBPacXeuaSf5PGumG2aYsvnYBFufwq8ZQ5OlfMc7yteizPeldAyqmnG6GVjVVF5iOH3IgZ20Nzbljb9O2tLxxljMxgCSFl4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708167643; c=relaxed/simple;
	bh=U1sEXcVPiYEOBeeaWFoixKZ/hlc93z7VKshZxLrdsu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mz2ol+h+ita4F1OsSUduo1ShzmjY1KgZrb2wWABZJiaLGxWNJBd2OuAUM1r+ed6ZrAPT4qGFg+JWNS2kfjURG4VcieyAUlXYGQLdLLSbQyM4QcHOxPWASqR8d8SsJFxOfUYw9sRo0NmFmQ723W/WuyMQfiszB6lwpc8uSb2eXgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=He5jalPE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708167640; x=1739703640;
  h=date:from:to:cc:subject:message-id;
  bh=U1sEXcVPiYEOBeeaWFoixKZ/hlc93z7VKshZxLrdsu4=;
  b=He5jalPEfovCfUuvJpE8BtKbQgU2wMCwGnURiXkEhDhYewfSAHjKiNKV
   NiGAYI9//2JCrZIqjaUfLy8r0wOncDKTzKId9zmfF/BXxuIAuwdOoomgs
   /juE/vuNWCFx3gLLu660ZgoHe0KE4lwRVGidwPhPNCjIDDvzvIF57HM68
   yr0NafOx3U2LySVuUs4DogAcFSDc0BSvBoGpiMOoZD46xTZOMJOeX9Ulm
   4/wZOzBmaJMQxxP7RQ2q9c5qTKByCer4KivpmDInBtaDZW1QyVxjgN/4S
   82pIyCVKyoyjM+XpqWOCXB7C1smH49Z9wEbYBp4iiy290IXknN/BVsIWR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2200686"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="2200686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 03:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4219631"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2024 03:00:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbIQr-00023n-2u;
	Sat, 17 Feb 2024 11:00:35 +0000
Date: Sat, 17 Feb 2024 19:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
Message-ID: <202402171902.gIF30V4k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0  media: visl: Add codec specific variability on output frames

elapsed time: 1449m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240217   gcc  
arc                   randconfig-002-20240217   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                            mps2_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                   randconfig-001-20240217   clang
arm                   randconfig-002-20240217   gcc  
arm                   randconfig-003-20240217   gcc  
arm                   randconfig-004-20240217   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240217   clang
arm64                 randconfig-002-20240217   gcc  
arm64                 randconfig-003-20240217   gcc  
arm64                 randconfig-004-20240217   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240217   gcc  
csky                  randconfig-002-20240217   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240217   clang
hexagon               randconfig-002-20240217   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240216   gcc  
i386         buildonly-randconfig-002-20240216   clang
i386         buildonly-randconfig-003-20240216   clang
i386         buildonly-randconfig-004-20240216   gcc  
i386         buildonly-randconfig-005-20240216   gcc  
i386         buildonly-randconfig-006-20240216   clang
i386                                defconfig   clang
i386                  randconfig-001-20240216   clang
i386                  randconfig-002-20240216   clang
i386                  randconfig-003-20240216   gcc  
i386                  randconfig-004-20240216   clang
i386                  randconfig-005-20240216   gcc  
i386                  randconfig-006-20240216   clang
i386                  randconfig-011-20240216   gcc  
i386                  randconfig-012-20240216   gcc  
i386                  randconfig-013-20240216   gcc  
i386                  randconfig-014-20240216   clang
i386                  randconfig-015-20240216   gcc  
i386                  randconfig-016-20240216   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240217   gcc  
loongarch             randconfig-002-20240217   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240217   gcc  
nios2                 randconfig-002-20240217   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240217   gcc  
parisc                randconfig-002-20240217   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                          g5_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc               randconfig-001-20240217   gcc  
powerpc               randconfig-002-20240217   gcc  
powerpc               randconfig-003-20240217   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240217   clang
powerpc64             randconfig-002-20240217   gcc  
powerpc64             randconfig-003-20240217   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240217   gcc  
riscv                 randconfig-002-20240217   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240217   clang
s390                  randconfig-002-20240217   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240217   gcc  
sh                    randconfig-002-20240217   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240217   gcc  
sparc64               randconfig-002-20240217   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240217   clang
um                    randconfig-002-20240217   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240217   gcc  
x86_64       buildonly-randconfig-002-20240217   clang
x86_64       buildonly-randconfig-003-20240217   gcc  
x86_64       buildonly-randconfig-004-20240217   gcc  
x86_64       buildonly-randconfig-005-20240217   clang
x86_64       buildonly-randconfig-006-20240217   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240217   gcc  
x86_64                randconfig-002-20240217   clang
x86_64                randconfig-003-20240217   clang
x86_64                randconfig-004-20240217   clang
x86_64                randconfig-005-20240217   clang
x86_64                randconfig-006-20240217   clang
x86_64                randconfig-011-20240217   gcc  
x86_64                randconfig-012-20240217   gcc  
x86_64                randconfig-013-20240217   clang
x86_64                randconfig-014-20240217   gcc  
x86_64                randconfig-015-20240217   gcc  
x86_64                randconfig-016-20240217   clang
x86_64                randconfig-071-20240217   gcc  
x86_64                randconfig-072-20240217   gcc  
x86_64                randconfig-073-20240217   gcc  
x86_64                randconfig-074-20240217   clang
x86_64                randconfig-075-20240217   gcc  
x86_64                randconfig-076-20240217   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240217   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


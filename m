Return-Path: <linux-media+bounces-4148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D914983AB30
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 14:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888CE293E5A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 13:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714D777F31;
	Wed, 24 Jan 2024 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La/+I5KR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40C5604B2
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706104446; cv=none; b=CC9/UBwS+Skkc87lqz9muIpoUAo5OlgPBHkFLJID+x2yb7Fkmd5AwDyDj18mwRAP8ySQE9/DwyAonmcRWsEDUMU+qoBDdN8hWodNEjRfpLEgq3QiH52r7UUt1swBFzFqoNlTuKIrhsFTrKXB0T7+gZjtaqcg1GemIm2MecO4xrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706104446; c=relaxed/simple;
	bh=Bl1pk1wmjU8E107l4KwRwoaEi+2J2flMnSX6p6WkLM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uMy/tQHpozK9dY9pNGmYHuUIXqR8qFlKJ5HnUEZdTb3bueDANqoRbto1AQziU+tcKmzoQsSSp7IjdgpaNB/kZ6kOzS6Ahdfa5FydVHKweEnd5wDvvozrzP3/NSL2BjBTciIwzAFqJTm0meS8jfs9vFPibAqGYI6eBJl4mbW76S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=La/+I5KR; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706104444; x=1737640444;
  h=date:from:to:cc:subject:message-id;
  bh=Bl1pk1wmjU8E107l4KwRwoaEi+2J2flMnSX6p6WkLM8=;
  b=La/+I5KRraEp63rar+izblzvQONDhXoG3aS9hEVRVVjnkaHn9FYi5Bj/
   Mpp5phhtpV4E8Ycf9nk/5i0WTmngAO2yGu6hwUF7ItleXpulaqpANHFl4
   KGPSx5ZjAwtvWoeiM2K/o4TqKPVaaCPU1z7/Hz4d70uaVpkj2zvbBXkNS
   bHbDqsb6FBwUH+TSxsE52iWCC3IEiwuflZhrBLfEUBk8ivvsQIewEWtvi
   CpcYmrqKHBK4j0WBxhEYTdpJVe2+htxeDu1UrjjylYtjvJ2L+I76bVEnN
   laVNgjwfiuGRQulFUkE8dypo2BNoiJ/Yp1iwZKdgxfLtYBIJNvhAHLS/S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405598684"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405598684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20732101"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2024 05:54:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSdhY-00088L-0u;
	Wed, 24 Jan 2024 13:54:00 +0000
Date: Wed, 24 Jan 2024 21:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD SUCCESS WITH WARNING
 a31f71a73822ffd82d3595f199a57894097bc98e
Message-ID: <202401242118.JjQzHcxV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: a31f71a73822ffd82d3595f199a57894097bc98e  media: mc: Add nop implementations of media_device_{init,cleanup}

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401240244.gFeVPHsb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202401241232.3sHqxkyA-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/media/pci/intel/ipu3/ipu3-cio2.c:1686:13: warning: 'cio2_media_release' defined but not used [-Wunused-function]
drivers/media/test-drivers/vim2m.c:1321:16: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'long unsigned int' [-Wformat=]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- i386-buildonly-randconfig-004-20240123
|   `-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:warning:cio2_media_release-defined-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
`-- riscv-allmodconfig
    `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int

elapsed time: 1465m

configs tested: 164
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240124   gcc  
arc                   randconfig-002-20240124   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   clang
arm                         nhk8815_defconfig   gcc  
arm                   randconfig-001-20240124   clang
arm                   randconfig-002-20240124   clang
arm                   randconfig-003-20240124   clang
arm                   randconfig-004-20240124   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240124   clang
arm64                 randconfig-002-20240124   clang
arm64                 randconfig-003-20240124   clang
arm64                 randconfig-004-20240124   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240124   gcc  
csky                  randconfig-002-20240124   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240124   clang
hexagon               randconfig-002-20240124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240123   gcc  
i386         buildonly-randconfig-002-20240123   gcc  
i386         buildonly-randconfig-003-20240123   gcc  
i386         buildonly-randconfig-004-20240123   gcc  
i386         buildonly-randconfig-005-20240123   gcc  
i386         buildonly-randconfig-006-20240123   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240123   gcc  
i386                  randconfig-002-20240123   gcc  
i386                  randconfig-003-20240123   gcc  
i386                  randconfig-004-20240123   gcc  
i386                  randconfig-005-20240123   gcc  
i386                  randconfig-006-20240123   gcc  
i386                  randconfig-011-20240123   clang
i386                  randconfig-012-20240123   clang
i386                  randconfig-013-20240123   clang
i386                  randconfig-014-20240123   clang
i386                  randconfig-015-20240123   clang
i386                  randconfig-016-20240123   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240124   gcc  
loongarch             randconfig-002-20240124   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240124   gcc  
nios2                 randconfig-002-20240124   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240124   gcc  
parisc                randconfig-002-20240124   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc               randconfig-001-20240124   clang
powerpc               randconfig-002-20240124   clang
powerpc               randconfig-003-20240124   clang
powerpc64             randconfig-001-20240124   clang
powerpc64             randconfig-002-20240124   clang
powerpc64             randconfig-003-20240124   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240124   clang
riscv                 randconfig-002-20240124   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240124   gcc  
s390                  randconfig-002-20240124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240124   gcc  
sh                    randconfig-002-20240124   gcc  
sh                           se7712_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240124   gcc  
sparc64               randconfig-002-20240124   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240124   clang
um                    randconfig-002-20240124   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240124   clang
x86_64       buildonly-randconfig-002-20240124   clang
x86_64       buildonly-randconfig-003-20240124   clang
x86_64       buildonly-randconfig-004-20240124   clang
x86_64       buildonly-randconfig-005-20240124   clang
x86_64       buildonly-randconfig-006-20240124   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240124   gcc  
x86_64                randconfig-002-20240124   gcc  
x86_64                randconfig-003-20240124   gcc  
x86_64                randconfig-004-20240124   gcc  
x86_64                randconfig-005-20240124   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240124   gcc  
xtensa                randconfig-002-20240124   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


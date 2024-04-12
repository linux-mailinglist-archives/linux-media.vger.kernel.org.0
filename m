Return-Path: <linux-media+bounces-9198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5858A323A
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 17:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 016442832C8
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 15:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26843148822;
	Fri, 12 Apr 2024 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZaiEgUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC271487EA
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712935156; cv=none; b=aE1Qg4yn6wUNmqOG+xshfooNSBeTi3BvQx/x1nV8KNMqXEHLzKA4ztxUTDTrzHATln1fqDsd0lSwPVVm5602tAERciabnzNmf61CB+wsDwbjR8zh6vG65C2wZ43IuHnerJ2u67G9UhKI1ax5H0Zak22/O6Kef4qVKb0aRISuPh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712935156; c=relaxed/simple;
	bh=oVlv/6xMSGL7ycPdYQ3Pfcz99cn81pUbPUqVjiD6TJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pPjFpvWYvJW5Kmi1P4teLe2VLJNLDEr4sIHp6OBx6HzKbq9iyjqELdL6MLhbnIAa4ih2SHaghg7xQf8QY7BKUuLNj94/mIvP6LMEtfAXvWJNHL/Ga4iFHWRBwMj6ymExk3j5mhlXbdZnMmDMpjSvr801hApqrsRhrohSu8nZV5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZaiEgUp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712935155; x=1744471155;
  h=date:from:to:cc:subject:message-id;
  bh=oVlv/6xMSGL7ycPdYQ3Pfcz99cn81pUbPUqVjiD6TJ0=;
  b=mZaiEgUpSf5hqWFwMeLRXQclYlg84mCNH41eaEp0wIT383lxB+7aWYGa
   wnm1q2TnTurqSuyMqDi+ZPI06jee+TlynEq5myuh6pPfz0jsubWQsXPzl
   FsZI3i8FNIrjHvdGELbWROwJ5y/6erCVy60ZrmrVs6f4CFNALOfF/jnwY
   BMKu3Yoptc6Vcj0q4Yuk+6RP1U2d+N8dkmvJvJTaHcZ9Zg5eyfo11Ih5P
   WSU5MtZrqApmjBJCC8/0uVDYciy9KTVfIGaiHjNolGQxHgOMotDH9XUg/
   IL4vvTWOufFTra4CpLHu1I00Mxo26nR8Yvjg5oe/X6eUCWS3vjVtms50S
   g==;
X-CSE-ConnectionGUID: mzaDyN87T9icN3yt4A+Upw==
X-CSE-MsgGUID: 7Y5FY8jHQcmzbp0+deMjQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="18952301"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="18952301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 08:19:13 -0700
X-CSE-ConnectionGUID: 1Nm4WJO7SZmFU5aZ3ZmIPA==
X-CSE-MsgGUID: 2SvaHwPTQEO8somRrCTpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="52411379"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2024 08:19:11 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvIgH-0000Aq-0m;
	Fri, 12 Apr 2024 15:19:09 +0000
Date: Fri, 12 Apr 2024 23:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8
Message-ID: <202404122317.Pv1Vssld-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 71b3ed53b08d87212fbbe51bdc3bf44eb8c462f8  media: atomisp: Implement link_setup() op for ISP subdev MC entity

elapsed time: 1473m

configs tested: 164
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
arc                   randconfig-001-20240412   gcc  
arc                   randconfig-002-20240412   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240412   gcc  
arm                   randconfig-004-20240412   gcc  
arm                           sama5_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240412   gcc  
arm64                 randconfig-002-20240412   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240412   gcc  
csky                  randconfig-002-20240412   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240412   gcc  
i386         buildonly-randconfig-002-20240412   clang
i386         buildonly-randconfig-003-20240412   gcc  
i386         buildonly-randconfig-004-20240412   gcc  
i386         buildonly-randconfig-005-20240412   gcc  
i386         buildonly-randconfig-006-20240412   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240412   clang
i386                  randconfig-002-20240412   gcc  
i386                  randconfig-003-20240412   clang
i386                  randconfig-004-20240412   clang
i386                  randconfig-005-20240412   clang
i386                  randconfig-006-20240412   gcc  
i386                  randconfig-011-20240412   clang
i386                  randconfig-012-20240412   gcc  
i386                  randconfig-013-20240412   clang
i386                  randconfig-014-20240412   gcc  
i386                  randconfig-015-20240412   gcc  
i386                  randconfig-016-20240412   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240412   gcc  
loongarch             randconfig-002-20240412   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240412   gcc  
nios2                 randconfig-002-20240412   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240412   gcc  
parisc                randconfig-002-20240412   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-003-20240412   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240412   gcc  
powerpc64             randconfig-002-20240412   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240412   gcc  
s390                  randconfig-002-20240412   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20240412   gcc  
sh                    randconfig-002-20240412   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240412   gcc  
sparc64               randconfig-002-20240412   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240412   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-004-20240412   clang
x86_64       buildonly-randconfig-005-20240412   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240412   clang
x86_64                randconfig-004-20240412   clang
x86_64                randconfig-005-20240412   clang
x86_64                randconfig-006-20240412   clang
x86_64                randconfig-011-20240412   clang
x86_64                randconfig-013-20240412   clang
x86_64                randconfig-014-20240412   clang
x86_64                randconfig-015-20240412   clang
x86_64                randconfig-072-20240412   clang
x86_64                randconfig-073-20240412   clang
x86_64                randconfig-076-20240412   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240412   gcc  
xtensa                randconfig-002-20240412   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


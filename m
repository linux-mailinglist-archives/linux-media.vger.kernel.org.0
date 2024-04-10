Return-Path: <linux-media+bounces-8959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A343F89E898
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 05:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4BF1F24EA0
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 03:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28468BE66;
	Wed, 10 Apr 2024 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItFByqcI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD5BE49
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712721096; cv=none; b=Zxt0guZlof8aIUdpIb4mf1u6mPPUxxewl/WOfY+BD53cYc63QiLi6d0O5uqrZrTx4771wMqedBaKPCY3amAGfJ2zY5YGU7Y0rRbHAKbqJAv4slhwx5jZEP/X/KYS7vbqeDrZAWWDYqfCQ9+5AxuaHcwxgH6oSfXvpmk5rAmKfxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712721096; c=relaxed/simple;
	bh=5DqZozAydx+G7nyfArox/3+Jw3oF0LgkIXEB/E2NbOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NzyBBaCWW24ei2V6tVUQp2OUsnJ0lbWBxplOzfzbnoKY2aJaEo7R17Kja344+t7aY0kNuLfhZccpI5A/B58wSep+Eu6fFsPkhjXesetbZOs4aRL+hcjngb6xURFwr1ycBOdCLNqFBodNBq5grABSAdDxEI/O2eEkDEKPV6M5/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItFByqcI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712721094; x=1744257094;
  h=date:from:to:cc:subject:message-id;
  bh=5DqZozAydx+G7nyfArox/3+Jw3oF0LgkIXEB/E2NbOQ=;
  b=ItFByqcIpUXkmZA/rh67jei2Y5LHmkrCQeFtkc3aR+AFi160CFA00gdF
   f+dVCX2E9C/SURq6iLufTCFdZ6jGn/Qr3xjtc7LpI1loacY3utzT56PXP
   ykrJ+XtMXnNMknKPj4bdrlUmobWY2ZfxnDaR6nuuGNdnk/2NpiStrDhno
   /vWBJLkgPODxLlGltRmlrmvlVWUBZraWBZCLfTOXL0fa+5JDtd+K5najd
   qT448RnkAbUnDTfhqoJ7vIFlEeeDI1pOZ378TAWTmEGfyXvCprK+rtomq
   y8EHsXA1fCdJ3hcHS2r22sjbx6XRxFEUzTrII+U6gYPkNDFlxE3VFN6I8
   w==;
X-CSE-ConnectionGUID: ES2F3lkBSpqtncrebpx6vw==
X-CSE-MsgGUID: Wm7j4NDGS7K8BZYn7DQCKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18630865"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18630865"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 20:51:33 -0700
X-CSE-ConnectionGUID: 5Pk+gRY6SQa1pWXU+u73Kw==
X-CSE-MsgGUID: UDXJeYIqRoiMk5LfMHmmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20451246"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2024 20:51:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruOzh-0006lY-2u;
	Wed, 10 Apr 2024 03:51:29 +0000
Date: Wed, 10 Apr 2024 11:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 682f4968084a3d3eed08718b23fe9b6777dd6c2a
Message-ID: <202404101151.zWOXbIjf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 682f4968084a3d3eed08718b23fe9b6777dd6c2a  media: qcom: camss: vfe-17x: Rename camss-vfe-170 to camss-vfe-17x

elapsed time: 1269m

configs tested: 207
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
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240409   gcc  
arc                   randconfig-001-20240410   gcc  
arc                   randconfig-002-20240409   gcc  
arc                   randconfig-002-20240410   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-001-20240410   gcc  
arm                   randconfig-003-20240410   gcc  
arm                   randconfig-004-20240409   gcc  
arm                         s3c6400_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-002-20240410   gcc  
arm64                 randconfig-003-20240410   gcc  
arm64                 randconfig-004-20240410   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240409   gcc  
csky                  randconfig-001-20240410   gcc  
csky                  randconfig-002-20240409   gcc  
csky                  randconfig-002-20240410   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240410   gcc  
i386         buildonly-randconfig-003-20240409   gcc  
i386         buildonly-randconfig-005-20240409   gcc  
i386         buildonly-randconfig-005-20240410   gcc  
i386         buildonly-randconfig-006-20240409   gcc  
i386         buildonly-randconfig-006-20240410   gcc  
i386                                defconfig   clang
i386                  randconfig-002-20240409   gcc  
i386                  randconfig-003-20240410   gcc  
i386                  randconfig-004-20240409   gcc  
i386                  randconfig-004-20240410   gcc  
i386                  randconfig-005-20240409   gcc  
i386                  randconfig-005-20240410   gcc  
i386                  randconfig-011-20240409   gcc  
i386                  randconfig-013-20240410   gcc  
i386                  randconfig-015-20240409   gcc  
i386                  randconfig-015-20240410   gcc  
i386                  randconfig-016-20240410   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240409   gcc  
loongarch             randconfig-001-20240410   gcc  
loongarch             randconfig-002-20240409   gcc  
loongarch             randconfig-002-20240410   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240409   gcc  
nios2                 randconfig-001-20240410   gcc  
nios2                 randconfig-002-20240409   gcc  
nios2                 randconfig-002-20240410   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240409   gcc  
parisc                randconfig-001-20240410   gcc  
parisc                randconfig-002-20240409   gcc  
parisc                randconfig-002-20240410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240410   gcc  
powerpc               randconfig-002-20240409   gcc  
powerpc               randconfig-002-20240410   gcc  
powerpc               randconfig-003-20240410   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240409   gcc  
powerpc64             randconfig-001-20240410   gcc  
powerpc64             randconfig-002-20240410   gcc  
powerpc64             randconfig-003-20240409   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240410   gcc  
riscv                 randconfig-002-20240409   gcc  
riscv                 randconfig-002-20240410   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240409   gcc  
s390                  randconfig-002-20240409   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240409   gcc  
sh                    randconfig-001-20240410   gcc  
sh                    randconfig-002-20240409   gcc  
sh                    randconfig-002-20240410   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240409   gcc  
sparc64               randconfig-001-20240410   gcc  
sparc64               randconfig-002-20240409   gcc  
sparc64               randconfig-002-20240410   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-002-20240409   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240409   clang
x86_64       buildonly-randconfig-002-20240409   clang
x86_64       buildonly-randconfig-002-20240410   clang
x86_64       buildonly-randconfig-003-20240410   clang
x86_64       buildonly-randconfig-005-20240409   clang
x86_64       buildonly-randconfig-005-20240410   clang
x86_64       buildonly-randconfig-006-20240409   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240409   clang
x86_64                randconfig-001-20240410   clang
x86_64                randconfig-002-20240409   clang
x86_64                randconfig-003-20240410   clang
x86_64                randconfig-004-20240410   clang
x86_64                randconfig-005-20240409   clang
x86_64                randconfig-006-20240409   clang
x86_64                randconfig-006-20240410   clang
x86_64                randconfig-012-20240409   clang
x86_64                randconfig-014-20240409   clang
x86_64                randconfig-014-20240410   clang
x86_64                randconfig-016-20240410   clang
x86_64                randconfig-072-20240409   clang
x86_64                randconfig-072-20240410   clang
x86_64                randconfig-073-20240409   clang
x86_64                randconfig-074-20240409   clang
x86_64                randconfig-074-20240410   clang
x86_64                randconfig-075-20240409   clang
x86_64                randconfig-076-20240410   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240409   gcc  
xtensa                randconfig-001-20240410   gcc  
xtensa                randconfig-002-20240409   gcc  
xtensa                randconfig-002-20240410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-7446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC67881ABB
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 02:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611361C20EAE
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 01:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58BC613C;
	Thu, 21 Mar 2024 01:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFFIFFvt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A7D4A2F
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 01:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710985774; cv=none; b=R1ecY7+aLudX0QRblwXmzuK54sLk4mnRGipQI+pIxNTXi72lee1tQ7WoTnuQwGiXfHjyQI2KKggBY2Fz7u7+EKibKId6b/Ya9XliT5NX6099bDP3ovD2S4m7UIdY3o5VMzLadoVOIJLG7+lnMKCPe0sJPSli8zEaHtXy2WLHhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710985774; c=relaxed/simple;
	bh=9WMkcLbVxd6xZtPWSOYrzzQC/0s0ZPh5a4TubniowHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZN4V91GN0rH9ji7pzpcfByV7+RHmDpxlZEjSGB7CxY9Ijk9myK6OLmerCM0yXcvRWQe6ghXnKNTRb3jhh9fQgdrJKPvMFPKq9OkTbdhkeFooypz3EnJ46OPFU7GnMMt7sMxcH+IgknrlDJdRtPs5r7KFc0YwolskU1xdlDxDZeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFFIFFvt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710985772; x=1742521772;
  h=date:from:to:cc:subject:message-id;
  bh=9WMkcLbVxd6xZtPWSOYrzzQC/0s0ZPh5a4TubniowHE=;
  b=mFFIFFvtczsmOsr+avg6UGMmHXLdAlyasln2oSa7+HTX71WYEj8HcyAO
   UyH/vQGqNYcxbb8aonO8dHqWFNU1zNSHu22mKvVihLhj3asjdJ8C7L8+Z
   OUxGrCA+OFBIyCCiLtGgX8FA3hEbvF7PhlUsEn8zFEvA75VEyQdFUpQdT
   +1tXSgU2iJC6OhZgITkFU5Nw1N0qhofvbPxl2OPVaK5aa70/adbpOu0I/
   0fDgya9okpPI+UTYNev/IOiQi3WfqsDVOs2sasunftiWfKdNfNj4GutSY
   jLyPcgj6RMnD2nuRExQ+wt8PvKgYA6OBflQ9enoS152C3Zyyz4H8RSazp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6557872"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6557872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 18:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="19075954"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2024 18:49:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn7Yd-000J4z-23;
	Thu, 21 Mar 2024 01:49:27 +0000
Date: Thu, 21 Mar 2024 09:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 7d4780300086c696a8884dc942446d5e61ffea96
Message-ID: <202403210958.f2fM36bZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 7d4780300086c696a8884dc942446d5e61ffea96  media: intel/ipu6: remove unnecessary clear before pages free

elapsed time: 729m

configs tested: 179
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240320   gcc  
arc                   randconfig-002-20240320   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                        multi_v5_defconfig   gcc  
arm                   randconfig-001-20240320   gcc  
arm                   randconfig-002-20240320   gcc  
arm                   randconfig-003-20240320   gcc  
arm                   randconfig-004-20240320   gcc  
arm                             rpc_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240320   clang
arm64                 randconfig-002-20240320   gcc  
arm64                 randconfig-003-20240320   clang
arm64                 randconfig-004-20240320   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240320   gcc  
csky                  randconfig-002-20240320   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240320   clang
hexagon               randconfig-002-20240320   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240321   gcc  
i386         buildonly-randconfig-002-20240321   gcc  
i386         buildonly-randconfig-003-20240321   clang
i386         buildonly-randconfig-004-20240321   clang
i386         buildonly-randconfig-005-20240321   gcc  
i386         buildonly-randconfig-006-20240321   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240321   clang
i386                  randconfig-002-20240321   gcc  
i386                  randconfig-003-20240321   gcc  
i386                  randconfig-004-20240321   clang
i386                  randconfig-005-20240321   clang
i386                  randconfig-006-20240321   gcc  
i386                  randconfig-011-20240321   clang
i386                  randconfig-012-20240321   gcc  
i386                  randconfig-013-20240321   gcc  
i386                  randconfig-014-20240321   gcc  
i386                  randconfig-015-20240321   gcc  
i386                  randconfig-016-20240321   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240320   gcc  
loongarch             randconfig-002-20240320   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                           ip28_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240320   gcc  
nios2                 randconfig-002-20240320   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240320   gcc  
parisc                randconfig-002-20240320   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                 mpc834x_itx_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240320   gcc  
powerpc               randconfig-002-20240320   clang
powerpc               randconfig-003-20240320   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240320   gcc  
powerpc64             randconfig-002-20240320   gcc  
powerpc64             randconfig-003-20240320   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240320   clang
riscv                 randconfig-002-20240320   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240320   clang
s390                  randconfig-002-20240320   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240320   gcc  
sh                    randconfig-002-20240320   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240320   gcc  
sparc64               randconfig-002-20240320   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240320   gcc  
um                    randconfig-002-20240320   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240321   gcc  
x86_64       buildonly-randconfig-002-20240321   clang
x86_64       buildonly-randconfig-003-20240321   clang
x86_64       buildonly-randconfig-004-20240321   clang
x86_64       buildonly-randconfig-005-20240321   clang
x86_64       buildonly-randconfig-006-20240321   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240321   gcc  
x86_64                randconfig-002-20240321   clang
x86_64                randconfig-003-20240321   gcc  
x86_64                randconfig-004-20240321   gcc  
x86_64                randconfig-005-20240321   gcc  
x86_64                randconfig-006-20240321   gcc  
x86_64                randconfig-011-20240321   clang
x86_64                randconfig-012-20240321   gcc  
x86_64                randconfig-013-20240321   clang
x86_64                randconfig-014-20240321   gcc  
x86_64                randconfig-015-20240321   gcc  
x86_64                randconfig-016-20240321   gcc  
x86_64                randconfig-071-20240321   clang
x86_64                randconfig-072-20240321   gcc  
x86_64                randconfig-073-20240321   gcc  
x86_64                randconfig-074-20240321   clang
x86_64                randconfig-075-20240321   clang
x86_64                randconfig-076-20240321   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240320   gcc  
xtensa                randconfig-002-20240320   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


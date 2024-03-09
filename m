Return-Path: <linux-media+bounces-6750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE382876EA7
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 02:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863DF281E38
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 01:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52795168B8;
	Sat,  9 Mar 2024 01:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtNLbW35"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBF134AA
	for <linux-media@vger.kernel.org>; Sat,  9 Mar 2024 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709949433; cv=none; b=rgI402cDFRYoHN1XKE1udhUFvr2uX88IBWCoZRSxyHePpRv38U1+vmE54MeA9ApCmDVNy5NOeFMJTlaGGJdq2Q2x/m3kX3S1luOpCv40Ol0m8bRxQfoakHK29VfbcHROxQmZEzNpWC4Pud/jx3QL0g7qhbfmx3HiGVKbJRvLbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709949433; c=relaxed/simple;
	bh=9BZE7UvxlmCbDOh7cInBGrVTrIyiYdol1s7BPuPG9ro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ow98MWl0n15bfUY9TcFvXIBwNsBwBSSWEY2QI/ya2SpWtU1j8FkAxgsHvyIOMTbLlZ3kg9vooN1cp+AocbA236csOnWzxIZb/Xr+WpHE4NKf8wDBX6UJcBCaHFP5JPSfIlsxbpEAojoG7TELsSS0hEVHiOi64+BLl3pucG1o6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtNLbW35; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709949431; x=1741485431;
  h=date:from:to:cc:subject:message-id;
  bh=9BZE7UvxlmCbDOh7cInBGrVTrIyiYdol1s7BPuPG9ro=;
  b=NtNLbW35EcG4Tv9nf7t7lW4cdSWvBUUXSh6cIfmfTcqke0rTJUS10uO7
   UqOOStImHEIcSRoDcgUo+bYQr3+P1SmOv3LN+jIHlJAWI834HglUXv0yB
   kkW2FhOQ953HZaq+rGqtJoUwKs1aCvaFO055Xfv2u65euxoyMkVLjkOos
   XpWSkN0X3HfYIuR4YLe5ta6hc6XPdeGjwV/2hpTGChEMTPq8MLlE+soJu
   /mQzT2czEcoIWLXtZS0gkPyG19Fttf7wWFYaAhNj1EyACbrRMkVpJPJGL
   M0FLJBe+6PqlIxoIe5n6fIxDmDxwZ33WL/c2/pwTOPdFWciKpcCxFuJl0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4571469"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4571469"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 17:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10633407"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 17:57:10 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rilxT-0006sn-1f;
	Sat, 09 Mar 2024 01:57:07 +0000
Date: Sat, 09 Mar 2024 09:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS WITH WARNING
 54ee11761885407056f4ca60309739e2db6b02dc
Message-ID: <202403090935.ev5ptPw5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 54ee11761885407056f4ca60309739e2db6b02dc  media: v4l: async: Properly check for a notifier initialised or registered

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403090851.cCiC7PN1-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/media/v4l2-core/v4l2-async.c:623:13: warning: unused variable 'ret' [-Wunused-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- m68k-allyesconfig
    `-- drivers-media-v4l2-core-v4l2-async.c:warning:unused-variable-ret
clang_recent_errors
|-- riscv-allmodconfig
|   `-- drivers-media-v4l2-core-v4l2-async.c:warning:unused-variable-ret
`-- riscv-allyesconfig
    `-- drivers-media-v4l2-core-v4l2-async.c:warning:unused-variable-ret

elapsed time: 742m

configs tested: 120
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240309   gcc  
arc                   randconfig-002-20240309   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240309   clang
arm                   randconfig-002-20240309   gcc  
arm                   randconfig-003-20240309   clang
arm                   randconfig-004-20240309   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240309   gcc  
arm64                 randconfig-002-20240309   clang
arm64                 randconfig-003-20240309   clang
arm64                 randconfig-004-20240309   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240309   gcc  
csky                  randconfig-002-20240309   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240309   clang
hexagon               randconfig-002-20240309   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240309   gcc  
loongarch             randconfig-002-20240309   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240309   gcc  
nios2                 randconfig-002-20240309   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240309   gcc  
parisc                randconfig-002-20240309   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240309   gcc  
powerpc               randconfig-002-20240309   clang
powerpc               randconfig-003-20240309   clang
powerpc64             randconfig-001-20240309   gcc  
powerpc64             randconfig-002-20240309   gcc  
powerpc64             randconfig-003-20240309   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240309   gcc  
riscv                 randconfig-002-20240309   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240309   clang
s390                  randconfig-002-20240309   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240309   gcc  
sh                    randconfig-002-20240309   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240309   gcc  
sparc64               randconfig-002-20240309   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240309   clang
um                    randconfig-002-20240309   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240309   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-10706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987E8BB14B
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 18:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67146B2181D
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488B1157A54;
	Fri,  3 May 2024 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvMkAvqv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AF155351
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714755527; cv=none; b=Toth5rRh/6JN/KOXPam8FfhP+CgLoOnGBqc438ebkYQT2EQ1AB3Oc9VVURKh+N0E55b+oYUAp2Uew+LlNH+objsdRY/H5j+07AtEKI3lItJuYJQaDihjAw0UpbSw6k3P06WZ/LZM8dFik6JkxaXOuUak0nIHwfjWO4k7wy8LtUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714755527; c=relaxed/simple;
	bh=iWA12mjdboxqudMSVC2hhme+YT/dS7Trdr76dYI8e0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mesJhuhDwf/yxyahPorvupv1W6A3F8/yKY5gKY6dvvy1qJBNcmPisRqvYdG+1x8por5NA5z6I/oCnJM2oQFBAakHy7Kph7bkaMuzyfUPJCx5xtygahWWZSZsY/5wsbsGeSdTTMsLi1lgVj92+ZeeNieayPMc4qQLmYMSQa122dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvMkAvqv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714755526; x=1746291526;
  h=date:from:to:cc:subject:message-id;
  bh=iWA12mjdboxqudMSVC2hhme+YT/dS7Trdr76dYI8e0Q=;
  b=DvMkAvqvIYLDfiCDXuc9RsrcHLEtqQGYX99kvQfp/q5KYXlqPsTPlQML
   ELl1HuX/PZwm7pnFhzDcv0+1zFpFYQ0vywdyDvnwRTuZY6ebuKoCLPv2w
   TughguvssuWVjL7UVNCYzU+KTNunkimwBl7rJhqoSPguy+ONo1q2d34b2
   kZ7gbehP+G4ZIKmHVXyZ12A4545NsxKHKzqmix+UD59jyfg41puDc7ldt
   YosGTqCUnWGuJNfahjkYo/MJq8+uTmxi2O+zjr51k3svld8PxLtekIovR
   xAx+SGzXOKMuYkBqTlW44JVr+hS7l5hVFEUUvveYpqrzAK9aivk+fow8K
   Q==;
X-CSE-ConnectionGUID: QF9L7XnhTAOxAManPSuCcg==
X-CSE-MsgGUID: vUjY2OngTUWrmd3AshJACQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10447467"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10447467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 09:58:45 -0700
X-CSE-ConnectionGUID: 5lJon8CSRgSiA8762Kwe9g==
X-CSE-MsgGUID: Bw81yU+xRLWLFFI27KsxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27563511"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2024 09:58:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2wF7-000Bv5-0c;
	Fri, 03 May 2024 16:58:41 +0000
Date: Sat, 04 May 2024 00:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-fix] BUILD SUCCESS
 40d272ee82fc8ec4d8b88c29d535c8e57c594fc4
Message-ID: <202405040019.Q4dZio5Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6-fix
branch HEAD: 40d272ee82fc8ec4d8b88c29d535c8e57c594fc4  media: intel/ipu6: Drop custom link validation code

elapsed time: 1440m

configs tested: 139
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
arc                   randconfig-001-20240503   gcc  
arc                   randconfig-002-20240503   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v5_defconfig   gcc  
arm                   randconfig-004-20240503   gcc  
arm                         s3c6400_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240503   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240503   gcc  
csky                  randconfig-002-20240503   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240503   clang
i386         buildonly-randconfig-002-20240503   clang
i386         buildonly-randconfig-006-20240503   clang
i386                                defconfig   clang
i386                  randconfig-002-20240503   clang
i386                  randconfig-003-20240503   clang
i386                  randconfig-005-20240503   clang
i386                  randconfig-006-20240503   clang
i386                  randconfig-011-20240503   clang
i386                  randconfig-016-20240503   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240503   gcc  
loongarch             randconfig-002-20240503   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240503   gcc  
nios2                 randconfig-002-20240503   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240503   gcc  
parisc                randconfig-002-20240503   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc               randconfig-003-20240503   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240503   gcc  
riscv                 randconfig-002-20240503   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240503   gcc  
s390                  randconfig-002-20240503   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20240503   gcc  
sh                    randconfig-002-20240503   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240503   gcc  
sparc64               randconfig-002-20240503   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240503   gcc  
x86_64       buildonly-randconfig-002-20240503   gcc  
x86_64       buildonly-randconfig-003-20240503   gcc  
x86_64       buildonly-randconfig-005-20240503   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-004-20240503   gcc  
x86_64                randconfig-005-20240503   gcc  
x86_64                randconfig-076-20240503   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240503   gcc  
xtensa                randconfig-002-20240503   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-12936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E095903962
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 12:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA2B289B17
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B074E179203;
	Tue, 11 Jun 2024 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilJWyIzv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E254750
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103379; cv=none; b=hZsflSSnNo0HEnGBgTawqdG6cs/zZWGLnuhVac7pHi0a8b74rK5+lFVOvbg4I8uAnZYwKLQPIkFQYNfT1z+j6z9grn3m6oYYsdnWisi0uM4vMU+hZKgU+w1P+ArnxMZCzws5N9+UH2aBWUOFPnhUVwDBg+CSxy3KXKo5bYZwWiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103379; c=relaxed/simple;
	bh=3HKaUL3+vx7yl3xx2iWljlGnf+Yj7nwei/d7+aGTxm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ngUBLidydp2tMk+mn+36GgZ1VdA3rxtb1KFTdEmzk8PGckKT2OXZNLyQRQ7dGjgYyIzGLn0oMcBhMb6lD9v8Fk7cRf5FR3K/q4sjc/QQfcyaLao3pW4VMBxsGOI0X53+IVxidIJ/HCK7qpaFl68L6HED7UxXDJxRBdW+H39ZHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilJWyIzv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718103378; x=1749639378;
  h=date:from:to:cc:subject:message-id;
  bh=3HKaUL3+vx7yl3xx2iWljlGnf+Yj7nwei/d7+aGTxm8=;
  b=ilJWyIzvITRe22ZFKnHPyDh8xtGZ/USeJadn/lyRDinzbLof2/sv6SVg
   38rFP8Zl79KrX3oKSbcNfD/QY+uyfasiH9RreUhy/GYZ1+/FXcWrFxXPt
   ItkLdzVojF9W3p1hEUSdhWziJ/K17FL02fQuJ3wp3sgmoaAAkCqnNEjcE
   7SQaObYUpTmLoWIdr/VQ4sAtGAVHpIILMWvSpByDEBrf4tSOE/LChGCXN
   7xh6MCXK2eZuR6mqgTTJLct2a3f1vzlRipIeu58xWDBE3beVH+/fYZ3CO
   dIFraYw4ct/fVUR125y1l/SJSRHAzuhHxXZyFXVgCZgA4JnZBlKmBeRFD
   w==;
X-CSE-ConnectionGUID: KqTymuXTQkmFe1Bf8GsFYg==
X-CSE-MsgGUID: d1mB23qdSKqdlSVUL/N53w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14931043"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14931043"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 03:56:17 -0700
X-CSE-ConnectionGUID: t3tid1Q7T9ujECNe8GBwYQ==
X-CSE-MsgGUID: dbwPIpiNR1e4Tk9EbeRF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="43790881"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2024 03:56:15 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGzAj-0000KM-2C;
	Tue, 11 Jun 2024 10:56:13 +0000
Date: Tue, 11 Jun 2024 18:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD SUCCESS
 65f1edd6431e11866c1a1d7daa14baba0993adb6
Message-ID: <202406111847.k1Uy99em-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: 65f1edd6431e11866c1a1d7daa14baba0993adb6  media: Documentation: Document media device memory safety helper

elapsed time: 1455m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc  
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc  
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc  
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc  
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc  
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc  
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc  
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc  
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc  
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240610   clang
i386         buildonly-randconfig-003-20240611   clang
i386         buildonly-randconfig-004-20240610   clang
i386         buildonly-randconfig-006-20240610   clang
i386                                defconfig   clang-18
i386                  randconfig-001-20240611   clang
i386                  randconfig-004-20240611   clang
i386                  randconfig-005-20240610   clang
i386                  randconfig-006-20240611   clang
i386                  randconfig-011-20240610   clang
i386                  randconfig-011-20240611   clang
i386                  randconfig-012-20240610   clang
i386                  randconfig-013-20240610   clang
i386                  randconfig-013-20240611   clang
i386                  randconfig-014-20240610   clang
i386                  randconfig-015-20240610   clang
i386                  randconfig-015-20240611   clang
i386                  randconfig-016-20240610   clang
i386                  randconfig-016-20240611   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                         allnoconfig   gcc-13.2.0
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
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
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240611   gcc  
x86_64       buildonly-randconfig-002-20240611   gcc  
x86_64       buildonly-randconfig-003-20240611   gcc  
x86_64       buildonly-randconfig-005-20240611   gcc  
x86_64       buildonly-randconfig-006-20240611   gcc  
x86_64                              defconfig   gcc  
x86_64                              defconfig   gcc-13
x86_64                randconfig-002-20240611   gcc  
x86_64                randconfig-003-20240611   gcc  
x86_64                randconfig-005-20240611   gcc  
x86_64                randconfig-012-20240611   gcc  
x86_64                randconfig-016-20240611   gcc  
x86_64                randconfig-072-20240611   gcc  
x86_64                randconfig-074-20240611   gcc  
x86_64                randconfig-075-20240611   gcc  
x86_64                randconfig-076-20240611   gcc  
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


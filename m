Return-Path: <linux-media+bounces-4857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC584DDD1
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 11:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48ABAB21281
	for <lists+linux-media@lfdr.de>; Thu,  8 Feb 2024 10:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF37F6D1D0;
	Thu,  8 Feb 2024 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKS5BCzg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B896D1C0
	for <linux-media@vger.kernel.org>; Thu,  8 Feb 2024 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386799; cv=none; b=VsCB3bMEj9uBqmuCZnI1CoLekfoR2b8gu/9zw/vIbvBo6i4cBIIq/bPF+NkX7r0uUE0qeaD1rr094otQDvLM76nSOQPLhf3xS4gmZ/XS3zVy6bc+35B8Bnb8+HdZq5VNdvt/skkCvxLulpxjmDgwKSsgAZ/6V9FWmG9UrGHiNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386799; c=relaxed/simple;
	bh=+2+ktwaOpRRgurZTPtFOvwEV1WiQY/vmzJ08ucy4tfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i/tnAba43VGsvD3u0Z2qGR3rYraUkhIHo40ITX92zWJ+ePMwgVH3JByl4uwTQPv8PMnBjW6xPw7noT7aIo4uRpxCbPSstUzhoold0SQOeQIcqxSiNYE5XHiXS2gkEdzuNXIiAXXFIkMPK49LiageS4pgKQwkoBRMA8Y7Zhxqt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKS5BCzg; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707386796; x=1738922796;
  h=date:from:to:cc:subject:message-id;
  bh=+2+ktwaOpRRgurZTPtFOvwEV1WiQY/vmzJ08ucy4tfY=;
  b=kKS5BCzg4dmnNDfGhUAhlN3dmHUFDoWMjYgr9NDubCe0cF+UHjG7J8xC
   r9hPkGMjwD9As1LITzkLKHSh5pEsvUHsZ3jZRJN3lgCjEfHIJJnGF2tCh
   DPvn/yEXfY/XiVT7Kepk+U1hCSpvXVjOh9Ljupr3B7y2PelODaeImUo03
   gSmejfvizeDtv98qv89FotNxmBA3eOtIT6t8FjCrklOTHw4+jrFFFzaQX
   IESwabcgxvDAPknzxkrs6WbI3BWdAJkExrxwT4RThaxB/Bn3bAgrElMUr
   4Z+BqREeluh4QCD2ztDkNu9fQDwiuaSibUELCp5lMBbfmcDaFsgFM8/jl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="436322898"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="436322898"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="934087877"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="934087877"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2024 02:06:34 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY1Ie-0003bc-2q;
	Thu, 08 Feb 2024 10:06:32 +0000
Date: Thu, 08 Feb 2024 18:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD SUCCESS
 f94611d22fa335b7dabf2e7356b4486e5a1f8907
Message-ID: <202402081826.RdYIfjRo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: f94611d22fa335b7dabf2e7356b4486e5a1f8907  media: mc: Add nop implementations of media_device_{init,cleanup}

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- alpha-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- i386-allmodconfig
|   `-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:warning:cio2_media_release-defined-but-not-used
|-- i386-allyesconfig
|   `-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:warning:cio2_media_release-defined-but-not-used
|-- i386-randconfig-013-20240207
|   `-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:warning:cio2_media_release-defined-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- loongarch-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- powerpc-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- s390-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- sparc-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- sparc64-allmodconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- sparc64-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- um-allyesconfig
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
|-- x86_64-randconfig-002-20240207
|   |-- drivers-media-pci-intel-ipu3-ipu3-cio2.c:warning:cio2_media_release-defined-but-not-used
|   `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int
`-- x86_64-randconfig-104-20240208
    `-- drivers-media-test-drivers-vim2m.c:warning:format-x-expects-argument-of-type-unsigned-int-but-argument-has-type-long-unsigned-int

elapsed time: 1459m

configs tested: 177
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
arc                   randconfig-001-20240207   gcc  
arc                   randconfig-002-20240207   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240207   clang
arm                   randconfig-002-20240207   clang
arm                   randconfig-003-20240207   clang
arm                   randconfig-004-20240207   gcc  
arm                         s3c6400_defconfig   gcc  
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240207   clang
arm64                 randconfig-002-20240207   clang
arm64                 randconfig-003-20240207   clang
arm64                 randconfig-004-20240207   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240207   gcc  
csky                  randconfig-002-20240207   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240207   clang
hexagon               randconfig-002-20240207   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240207   clang
i386         buildonly-randconfig-002-20240207   clang
i386         buildonly-randconfig-003-20240207   clang
i386         buildonly-randconfig-004-20240207   clang
i386         buildonly-randconfig-005-20240207   clang
i386         buildonly-randconfig-006-20240207   clang
i386                                defconfig   clang
i386                  randconfig-001-20240207   gcc  
i386                  randconfig-002-20240207   clang
i386                  randconfig-003-20240207   gcc  
i386                  randconfig-004-20240207   gcc  
i386                  randconfig-005-20240207   gcc  
i386                  randconfig-006-20240207   clang
i386                  randconfig-011-20240207   gcc  
i386                  randconfig-012-20240207   gcc  
i386                  randconfig-013-20240207   gcc  
i386                  randconfig-014-20240207   gcc  
i386                  randconfig-015-20240207   gcc  
i386                  randconfig-016-20240207   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240207   gcc  
loongarch             randconfig-002-20240207   gcc  
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
mips                        bcm63xx_defconfig   clang
mips                       lemote2f_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240207   gcc  
nios2                 randconfig-002-20240207   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240207   gcc  
parisc                randconfig-002-20240207   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                    gamecube_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                     mpc83xx_defconfig   clang
powerpc               randconfig-001-20240207   clang
powerpc               randconfig-002-20240207   clang
powerpc               randconfig-003-20240207   gcc  
powerpc64             randconfig-001-20240207   clang
powerpc64             randconfig-002-20240207   gcc  
powerpc64             randconfig-003-20240207   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240207   clang
riscv                 randconfig-002-20240207   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240207   gcc  
s390                  randconfig-002-20240207   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240207   gcc  
sh                    randconfig-002-20240207   gcc  
sh                          rsk7201_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240207   gcc  
sparc64               randconfig-002-20240207   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240207   clang
um                    randconfig-002-20240207   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240207   clang
x86_64       buildonly-randconfig-002-20240207   clang
x86_64       buildonly-randconfig-003-20240207   gcc  
x86_64       buildonly-randconfig-004-20240207   clang
x86_64       buildonly-randconfig-005-20240207   clang
x86_64       buildonly-randconfig-006-20240207   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240207   clang
x86_64                randconfig-002-20240207   gcc  
x86_64                randconfig-003-20240207   gcc  
x86_64                randconfig-004-20240207   gcc  
x86_64                randconfig-005-20240207   clang
x86_64                randconfig-006-20240207   clang
x86_64                randconfig-011-20240207   clang
x86_64                randconfig-012-20240207   gcc  
x86_64                randconfig-013-20240207   clang
x86_64                randconfig-014-20240207   clang
x86_64                randconfig-015-20240207   gcc  
x86_64                randconfig-016-20240207   gcc  
x86_64                randconfig-071-20240207   gcc  
x86_64                randconfig-072-20240207   clang
x86_64                randconfig-073-20240207   clang
x86_64                randconfig-074-20240207   gcc  
x86_64                randconfig-075-20240207   gcc  
x86_64                randconfig-076-20240207   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240207   gcc  
xtensa                randconfig-002-20240207   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


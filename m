Return-Path: <linux-media+bounces-98-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 173117E89FE
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 10:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73F39B20B2E
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A075F11701;
	Sat, 11 Nov 2023 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZl/pkaB"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390511703
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 09:03:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB88F3A98
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 01:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699693412; x=1731229412;
  h=date:from:to:cc:subject:message-id;
  bh=7y35elkgpXuNd9+4DDzAuhrjiOQoZVtKnuGcj8Jc7bA=;
  b=UZl/pkaBP5bxmsIvVx7RXmcFDjbwWUZ3ewa9KqQ01/AnswTW79ynz1LC
   Kyl2PutoLVvAuSZPGQxiZ/fGougFt6mUdpYoEpYApAu4tpOycPyUtp0S2
   vB7bAq9VU0wIMDRBudp1iK7AhwGCDnuBTh/9a1YaF80DFHHQVg06eOAfw
   ypFIdUOiHnp7JciVkp1u5o9i0if/UHCyOKQAP1R/WYa8BFIOy8Yveu6pW
   j9ue54yl1oIYloetauNzuMOeMMDpSwC0dJ+kieWF2NtUPIuzxiOsGoErL
   mVR1w4YUOKIrF+uQeMqNL7WsP9nQ0MUt9gUngS0C8XJwYl86CXU8F0E2T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476490280"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="476490280"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 01:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798764355"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="798764355"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 01:03:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1jto-000AL8-1s;
	Sat, 11 Nov 2023 09:03:28 +0000
Date: Sat, 11 Nov 2023 17:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 934b99f104cd40b6a2f467326e785a970c0c3ca8
Message-ID: <202311111734.y2ipaXLA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 934b99f104cd40b6a2f467326e785a970c0c3ca8  media: v4l: subdev: Always compile sub-device state access functions

elapsed time: 1444m

configs tested: 257
configs skipped: 2

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
arc                   randconfig-001-20231110   gcc  
arc                   randconfig-001-20231111   gcc  
arc                   randconfig-002-20231110   gcc  
arc                   randconfig-002-20231111   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                           omap1_defconfig   clang
arm                   randconfig-001-20231110   gcc  
arm                   randconfig-001-20231111   gcc  
arm                   randconfig-002-20231110   gcc  
arm                   randconfig-002-20231111   gcc  
arm                   randconfig-003-20231110   gcc  
arm                   randconfig-003-20231111   gcc  
arm                   randconfig-004-20231110   gcc  
arm                   randconfig-004-20231111   gcc  
arm                          sp7021_defconfig   clang
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231110   gcc  
arm64                 randconfig-001-20231111   gcc  
arm64                 randconfig-002-20231110   gcc  
arm64                 randconfig-002-20231111   gcc  
arm64                 randconfig-003-20231110   gcc  
arm64                 randconfig-003-20231111   gcc  
arm64                 randconfig-004-20231110   gcc  
arm64                 randconfig-004-20231111   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231110   gcc  
csky                  randconfig-001-20231111   gcc  
csky                  randconfig-002-20231110   gcc  
csky                  randconfig-002-20231111   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231110   gcc  
i386         buildonly-randconfig-001-20231111   gcc  
i386         buildonly-randconfig-002-20231110   gcc  
i386         buildonly-randconfig-002-20231111   gcc  
i386         buildonly-randconfig-003-20231110   gcc  
i386         buildonly-randconfig-003-20231111   gcc  
i386         buildonly-randconfig-004-20231110   gcc  
i386         buildonly-randconfig-004-20231111   gcc  
i386         buildonly-randconfig-005-20231110   gcc  
i386         buildonly-randconfig-005-20231111   gcc  
i386         buildonly-randconfig-006-20231110   gcc  
i386         buildonly-randconfig-006-20231111   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231110   gcc  
i386                  randconfig-001-20231111   gcc  
i386                  randconfig-002-20231110   gcc  
i386                  randconfig-002-20231111   gcc  
i386                  randconfig-003-20231110   gcc  
i386                  randconfig-003-20231111   gcc  
i386                  randconfig-004-20231110   gcc  
i386                  randconfig-004-20231111   gcc  
i386                  randconfig-005-20231110   gcc  
i386                  randconfig-005-20231111   gcc  
i386                  randconfig-006-20231110   gcc  
i386                  randconfig-006-20231111   gcc  
i386                  randconfig-011-20231110   gcc  
i386                  randconfig-011-20231111   gcc  
i386                  randconfig-012-20231110   gcc  
i386                  randconfig-012-20231111   gcc  
i386                  randconfig-013-20231110   gcc  
i386                  randconfig-013-20231111   gcc  
i386                  randconfig-014-20231110   gcc  
i386                  randconfig-014-20231111   gcc  
i386                  randconfig-015-20231110   gcc  
i386                  randconfig-015-20231111   gcc  
i386                  randconfig-016-20231110   gcc  
i386                  randconfig-016-20231111   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231110   gcc  
loongarch             randconfig-001-20231111   gcc  
loongarch             randconfig-002-20231110   gcc  
loongarch             randconfig-002-20231111   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231110   gcc  
nios2                 randconfig-001-20231111   gcc  
nios2                 randconfig-002-20231110   gcc  
nios2                 randconfig-002-20231111   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231110   gcc  
parisc                randconfig-001-20231111   gcc  
parisc                randconfig-002-20231110   gcc  
parisc                randconfig-002-20231111   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc               randconfig-001-20231110   gcc  
powerpc               randconfig-001-20231111   gcc  
powerpc               randconfig-002-20231110   gcc  
powerpc               randconfig-002-20231111   gcc  
powerpc               randconfig-003-20231110   gcc  
powerpc               randconfig-003-20231111   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                     tqm5200_defconfig   clang
powerpc64             randconfig-001-20231110   gcc  
powerpc64             randconfig-001-20231111   gcc  
powerpc64             randconfig-002-20231110   gcc  
powerpc64             randconfig-002-20231111   gcc  
powerpc64             randconfig-003-20231110   gcc  
powerpc64             randconfig-003-20231111   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231110   gcc  
riscv                 randconfig-001-20231111   gcc  
riscv                 randconfig-002-20231110   gcc  
riscv                 randconfig-002-20231111   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231110   gcc  
s390                  randconfig-001-20231111   gcc  
s390                  randconfig-002-20231110   gcc  
s390                  randconfig-002-20231111   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20231111   gcc  
sh                    randconfig-002-20231111   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231111   gcc  
sparc                 randconfig-002-20231111   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231111   gcc  
sparc64               randconfig-002-20231111   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231111   gcc  
um                    randconfig-002-20231111   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231110   gcc  
x86_64       buildonly-randconfig-001-20231111   gcc  
x86_64       buildonly-randconfig-002-20231110   gcc  
x86_64       buildonly-randconfig-002-20231111   gcc  
x86_64       buildonly-randconfig-003-20231110   gcc  
x86_64       buildonly-randconfig-003-20231111   gcc  
x86_64       buildonly-randconfig-004-20231110   gcc  
x86_64       buildonly-randconfig-004-20231111   gcc  
x86_64       buildonly-randconfig-005-20231110   gcc  
x86_64       buildonly-randconfig-005-20231111   gcc  
x86_64       buildonly-randconfig-006-20231110   gcc  
x86_64       buildonly-randconfig-006-20231111   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231110   gcc  
x86_64                randconfig-001-20231111   gcc  
x86_64                randconfig-002-20231110   gcc  
x86_64                randconfig-002-20231111   gcc  
x86_64                randconfig-003-20231110   gcc  
x86_64                randconfig-003-20231111   gcc  
x86_64                randconfig-004-20231110   gcc  
x86_64                randconfig-004-20231111   gcc  
x86_64                randconfig-005-20231110   gcc  
x86_64                randconfig-005-20231111   gcc  
x86_64                randconfig-006-20231110   gcc  
x86_64                randconfig-006-20231111   gcc  
x86_64                randconfig-011-20231110   gcc  
x86_64                randconfig-011-20231111   gcc  
x86_64                randconfig-012-20231110   gcc  
x86_64                randconfig-012-20231111   gcc  
x86_64                randconfig-013-20231110   gcc  
x86_64                randconfig-013-20231111   gcc  
x86_64                randconfig-014-20231110   gcc  
x86_64                randconfig-014-20231111   gcc  
x86_64                randconfig-015-20231110   gcc  
x86_64                randconfig-015-20231111   gcc  
x86_64                randconfig-016-20231110   gcc  
x86_64                randconfig-016-20231111   gcc  
x86_64                randconfig-071-20231110   gcc  
x86_64                randconfig-071-20231111   gcc  
x86_64                randconfig-072-20231110   gcc  
x86_64                randconfig-072-20231111   gcc  
x86_64                randconfig-073-20231110   gcc  
x86_64                randconfig-073-20231111   gcc  
x86_64                randconfig-074-20231110   gcc  
x86_64                randconfig-074-20231111   gcc  
x86_64                randconfig-075-20231110   gcc  
x86_64                randconfig-075-20231111   gcc  
x86_64                randconfig-076-20231110   gcc  
x86_64                randconfig-076-20231111   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231111   gcc  
xtensa                randconfig-002-20231111   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


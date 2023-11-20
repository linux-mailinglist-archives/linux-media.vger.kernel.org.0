Return-Path: <linux-media+bounces-585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0A7F0C0B
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 07:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FE5F1C204F6
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 06:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712032FB6;
	Mon, 20 Nov 2023 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGYJyZ6j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA5F126
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 22:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700463478; x=1731999478;
  h=date:from:to:cc:subject:message-id;
  bh=8vrOshaqyCl7cX1SLD4w/seD6mw0bs4ccqHqshbBpsQ=;
  b=KGYJyZ6j3w9lZp5ilxeATBi3rz7G4Iiw7MgL9bGKtbdLBdq3oxXlDrRJ
   Ri673GyBHJOUBpJFz9m4UmqzHktEB1dIZ9TqxxpXE1NXSIyBxp5aI2m73
   +qvmVDRYLHoHlYxjh0NcikT9N9cyprSAIf/nWC9HKA0I4YQN2x4AtJrQO
   fYLA1xFR+ZIQG7F+miyJPwv8Grkk5gVgniYQtLhZdYxLkl48qQCOuwvc5
   WQRXj8qVePpVUpCKg0FW+bUW9ZZ5g+0TQwgid4Pw+A9vXAFnagWWJ9EDU
   ZF79/BoDKJKq1E+qRTfD8eAeFOzUqQMGGXnPNOed17a+qEamG7cz0hIcL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="388703511"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="388703511"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 22:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="742635584"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="742635584"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Nov 2023 22:57:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4yEE-00066m-1G;
	Mon, 20 Nov 2023 06:57:54 +0000
Date: Mon, 20 Nov 2023 14:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 f7af8049dd072e89499a128956392419f92c17a9
Message-ID: <202311201412.6OZUptRP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: f7af8049dd072e89499a128956392419f92c17a9  media: Documentation: Initialisation finishes before subdev registration

elapsed time: 3897m

configs tested: 245
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231119   gcc  
arc                   randconfig-001-20231120   gcc  
arc                   randconfig-002-20231119   gcc  
arc                   randconfig-002-20231120   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                   randconfig-001-20231119   gcc  
arm                   randconfig-001-20231120   clang
arm                   randconfig-002-20231119   gcc  
arm                   randconfig-002-20231120   clang
arm                   randconfig-003-20231119   gcc  
arm                   randconfig-003-20231120   clang
arm                   randconfig-004-20231119   gcc  
arm                   randconfig-004-20231120   clang
arm                        spear6xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231119   gcc  
arm64                 randconfig-001-20231120   clang
arm64                 randconfig-002-20231119   gcc  
arm64                 randconfig-002-20231120   clang
arm64                 randconfig-003-20231119   gcc  
arm64                 randconfig-003-20231120   clang
arm64                 randconfig-004-20231119   gcc  
arm64                 randconfig-004-20231120   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231119   gcc  
csky                  randconfig-001-20231120   gcc  
csky                  randconfig-002-20231119   gcc  
csky                  randconfig-002-20231120   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231119   clang
hexagon               randconfig-001-20231120   clang
hexagon               randconfig-002-20231119   clang
hexagon               randconfig-002-20231120   clang
i386                             allmodconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231117   gcc  
i386         buildonly-randconfig-002-20231117   gcc  
i386         buildonly-randconfig-003-20231117   gcc  
i386         buildonly-randconfig-004-20231117   gcc  
i386         buildonly-randconfig-005-20231117   gcc  
i386         buildonly-randconfig-006-20231117   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231117   gcc  
i386                  randconfig-002-20231117   gcc  
i386                  randconfig-003-20231117   gcc  
i386                  randconfig-004-20231117   gcc  
i386                  randconfig-005-20231117   gcc  
i386                  randconfig-006-20231117   gcc  
i386                  randconfig-011-20231117   gcc  
i386                  randconfig-011-20231120   gcc  
i386                  randconfig-012-20231117   gcc  
i386                  randconfig-012-20231120   gcc  
i386                  randconfig-013-20231117   gcc  
i386                  randconfig-013-20231120   gcc  
i386                  randconfig-014-20231117   gcc  
i386                  randconfig-014-20231120   gcc  
i386                  randconfig-015-20231117   gcc  
i386                  randconfig-015-20231120   gcc  
i386                  randconfig-016-20231117   gcc  
i386                  randconfig-016-20231120   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231119   gcc  
loongarch             randconfig-001-20231120   gcc  
loongarch             randconfig-002-20231119   gcc  
loongarch             randconfig-002-20231120   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
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
nios2                 randconfig-001-20231119   gcc  
nios2                 randconfig-001-20231120   gcc  
nios2                 randconfig-002-20231119   gcc  
nios2                 randconfig-002-20231120   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231119   gcc  
parisc                randconfig-001-20231120   gcc  
parisc                randconfig-002-20231119   gcc  
parisc                randconfig-002-20231120   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          allyesconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20231119   gcc  
powerpc               randconfig-001-20231120   clang
powerpc               randconfig-002-20231119   gcc  
powerpc               randconfig-002-20231120   clang
powerpc               randconfig-003-20231119   gcc  
powerpc               randconfig-003-20231120   clang
powerpc                     sequoia_defconfig   gcc  
powerpc64             randconfig-001-20231119   gcc  
powerpc64             randconfig-001-20231120   clang
powerpc64             randconfig-002-20231119   gcc  
powerpc64             randconfig-002-20231120   clang
powerpc64             randconfig-003-20231119   gcc  
powerpc64             randconfig-003-20231120   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231119   gcc  
riscv                 randconfig-001-20231120   clang
riscv                 randconfig-002-20231119   gcc  
riscv                 randconfig-002-20231120   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231119   gcc  
s390                  randconfig-001-20231120   gcc  
s390                  randconfig-002-20231119   gcc  
s390                  randconfig-002-20231120   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20231119   gcc  
sh                    randconfig-001-20231120   gcc  
sh                    randconfig-002-20231119   gcc  
sh                    randconfig-002-20231120   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231119   gcc  
sparc64               randconfig-001-20231120   gcc  
sparc64               randconfig-002-20231119   gcc  
sparc64               randconfig-002-20231120   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231119   gcc  
um                    randconfig-001-20231120   clang
um                    randconfig-002-20231119   gcc  
um                    randconfig-002-20231120   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231118   gcc  
x86_64       buildonly-randconfig-001-20231120   clang
x86_64       buildonly-randconfig-002-20231118   gcc  
x86_64       buildonly-randconfig-002-20231120   clang
x86_64       buildonly-randconfig-003-20231118   gcc  
x86_64       buildonly-randconfig-003-20231120   clang
x86_64       buildonly-randconfig-004-20231118   gcc  
x86_64       buildonly-randconfig-004-20231120   clang
x86_64       buildonly-randconfig-005-20231118   gcc  
x86_64       buildonly-randconfig-005-20231120   clang
x86_64       buildonly-randconfig-006-20231118   gcc  
x86_64       buildonly-randconfig-006-20231120   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231118   gcc  
x86_64                randconfig-002-20231118   gcc  
x86_64                randconfig-003-20231118   gcc  
x86_64                randconfig-004-20231118   gcc  
x86_64                randconfig-005-20231118   gcc  
x86_64                randconfig-006-20231118   gcc  
x86_64                randconfig-011-20231118   gcc  
x86_64                randconfig-011-20231120   clang
x86_64                randconfig-012-20231118   gcc  
x86_64                randconfig-012-20231120   clang
x86_64                randconfig-013-20231118   gcc  
x86_64                randconfig-013-20231120   clang
x86_64                randconfig-014-20231118   gcc  
x86_64                randconfig-014-20231120   clang
x86_64                randconfig-015-20231118   gcc  
x86_64                randconfig-015-20231120   clang
x86_64                randconfig-016-20231118   gcc  
x86_64                randconfig-016-20231120   clang
x86_64                randconfig-071-20231118   gcc  
x86_64                randconfig-071-20231120   clang
x86_64                randconfig-072-20231118   gcc  
x86_64                randconfig-072-20231120   clang
x86_64                randconfig-073-20231118   gcc  
x86_64                randconfig-073-20231120   clang
x86_64                randconfig-074-20231118   gcc  
x86_64                randconfig-074-20231120   clang
x86_64                randconfig-075-20231118   gcc  
x86_64                randconfig-075-20231120   clang
x86_64                randconfig-076-20231118   gcc  
x86_64                randconfig-076-20231120   clang
x86_64                           rhel-8.3-bpf   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20231119   gcc  
xtensa                randconfig-001-20231120   gcc  
xtensa                randconfig-002-20231119   gcc  
xtensa                randconfig-002-20231120   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


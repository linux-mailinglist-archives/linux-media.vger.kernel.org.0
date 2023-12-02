Return-Path: <linux-media+bounces-1505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341B801E13
	for <lists+linux-media@lfdr.de>; Sat,  2 Dec 2023 19:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 781A11C20937
	for <lists+linux-media@lfdr.de>; Sat,  2 Dec 2023 18:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660ED8828;
	Sat,  2 Dec 2023 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHdzShlo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCB011D
	for <linux-media@vger.kernel.org>; Sat,  2 Dec 2023 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701541934; x=1733077934;
  h=date:from:to:cc:subject:message-id;
  bh=SwJgwPTofVQ+vDeKKTfYTySSnYF+V+NMVfCuYyh6ek0=;
  b=MHdzShlozZwBwmC3KqTNi4EheZuVoylKggKIkULzSU5+9JumlHRYiNAD
   qELUhaDPFtpS5p9dHjfeVds3UcaYb5HbrsIS+omyiOuTWYr/Lzfh2phKq
   VVkO583E9sUZgMG6eBXUUPgg2k9JUs5bGTP1i3e6A8YDaYtL105JULMbl
   VQ4duTh860QPKHN7EwaALk38xiuCpLNJuyh9PVGzl2fMy0d9osR4XQLyo
   5kB281HrUCB+Hp103y6GW15NiTwIKglh6LffBC4khkLZQ2+jsekmZrALN
   TXcpbFbBXiM3O52RAPVzx+b62EhysBFfIZ28wUuwPybVlp0816u5rmcb6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="460104717"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="460104717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 10:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="836130290"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="836130290"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2023 10:32:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9Umf-0005bw-2Z;
	Sat, 02 Dec 2023 18:32:09 +0000
Date: Sun, 03 Dec 2023 02:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 79adb3adb3316b6729a33e37a12006689a23a214
Message-ID: <202312030231.kew8GmaG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 79adb3adb3316b6729a33e37a12006689a23a214  media: stm32-dcmipp: STM32 DCMIPP camera interface driver

elapsed time: 1452m

configs tested: 138
configs skipped: 4

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
arc                   randconfig-001-20231202   gcc  
arc                   randconfig-002-20231202   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231202   clang
arm                   randconfig-002-20231202   clang
arm                   randconfig-003-20231202   clang
arm                   randconfig-004-20231202   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231202   clang
arm64                 randconfig-002-20231202   clang
arm64                 randconfig-003-20231202   clang
arm64                 randconfig-004-20231202   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231202   gcc  
csky                  randconfig-002-20231202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231202   clang
hexagon               randconfig-002-20231202   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-003-20231202   clang
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231202   gcc  
loongarch             randconfig-002-20231202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231202   gcc  
nios2                 randconfig-002-20231202   gcc  
openrisc                         allyesconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231202   gcc  
parisc                randconfig-002-20231202   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20231202   clang
powerpc               randconfig-002-20231202   clang
powerpc               randconfig-003-20231202   clang
powerpc64             randconfig-001-20231202   clang
powerpc64             randconfig-002-20231202   clang
powerpc64             randconfig-003-20231202   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20231202   clang
riscv                 randconfig-002-20231202   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231202   gcc  
s390                  randconfig-002-20231202   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                    randconfig-001-20231202   gcc  
sh                    randconfig-002-20231202   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231202   gcc  
sparc64               randconfig-002-20231202   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231202   clang
x86_64       buildonly-randconfig-002-20231202   clang
x86_64       buildonly-randconfig-003-20231202   clang
x86_64       buildonly-randconfig-004-20231202   clang
x86_64       buildonly-randconfig-005-20231202   clang
x86_64       buildonly-randconfig-006-20231202   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231202   gcc  
x86_64                randconfig-002-20231202   gcc  
x86_64                randconfig-003-20231202   gcc  
x86_64                randconfig-004-20231202   gcc  
x86_64                randconfig-005-20231202   gcc  
x86_64                randconfig-006-20231202   gcc  
x86_64                randconfig-011-20231202   clang
x86_64                randconfig-012-20231202   clang
x86_64                randconfig-013-20231202   clang
x86_64                randconfig-014-20231202   clang
x86_64                randconfig-015-20231202   clang
x86_64                randconfig-016-20231202   clang
x86_64                randconfig-071-20231202   clang
x86_64                randconfig-072-20231202   clang
x86_64                randconfig-073-20231202   clang
x86_64                randconfig-074-20231202   clang
x86_64                randconfig-075-20231202   clang
x86_64                randconfig-076-20231202   clang
x86_64                          rhel-8.3-rust   clang
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20231202   gcc  
xtensa                randconfig-002-20231202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


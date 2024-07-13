Return-Path: <linux-media+bounces-14983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9393039A
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 05:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419EA1C21339
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 03:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DCB182BD;
	Sat, 13 Jul 2024 03:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InJr6OjR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499CB2F23
	for <linux-media@vger.kernel.org>; Sat, 13 Jul 2024 03:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720842725; cv=none; b=W9nkFI4K8WwWY2/62uUP1NZGLJCkjD6ucJTlElFwJN/xTg5dV581mi2oHgQuY+QjiOm/3TAUqrY5UuVvGmr7RX0v5dV+ybVgBQ6YDD2pwt6PKM2fB4n55o+rgKXQzfYs9vT8gTYq/eK1S+It2fe/MXxAjirU/Pdz4eNTLw+yJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720842725; c=relaxed/simple;
	bh=z4xnhK6Y6x9ZJYteHPF3NtDj+Xfbxhd1Fl+3q8ZMAA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mF1+jP2DcbaKrpcpfhsFj19LGjgpoyjRGEsSKZN80TFOIhNbG+4nbNaMSOWmNMW1LhUACecRjVpQty0C/EEv6SI4L0mnYU9KplXKq+sxAXRg4dlm5X9wWon+YCXCWe/n5KQyKNysFrVYDmsGdWfVNJZIyc854DQSBGkp8CTZLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InJr6OjR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720842723; x=1752378723;
  h=date:from:to:cc:subject:message-id;
  bh=z4xnhK6Y6x9ZJYteHPF3NtDj+Xfbxhd1Fl+3q8ZMAA8=;
  b=InJr6OjRgXnU+zI9hzhzIipnQ56MmzR6XA/FoSonCOpL5wIW0K5RR79x
   6jxd6K6HEEZefnaupR9IeYrKySkSUlZpVGuNannI5JHF4oWMx6qAjHzH4
   oargFzq7UliEfENhLJr8E85lHMd8BPPzRo951WzT3Rhgt4J8SrJ+5/dZa
   mHDM0ksz7azNbPCt18m2hiYwg5qj9MC0BbAj4HQTb7lliQGwWcT2i/Nu9
   ZxU33T3wkAiUWN61JuGdIr5/zAN/qWXbhorihzTwJwpugRTmDNqw7NwYL
   qDBWbxZHrAX/pRDJSrdN2Y/s8PYr5/sysv97s9PoXlwWwoVPUhyiF/wqN
   w==;
X-CSE-ConnectionGUID: 9M5DC81SRLO75GT9RZvLZQ==
X-CSE-MsgGUID: iOrSLCjjSjeojog5NoWgCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18142746"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18142746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 20:52:03 -0700
X-CSE-ConnectionGUID: RiKmWnKiSDWa7L3r5qTO1Q==
X-CSE-MsgGUID: rxuLejmSQBGOfYUPWV8A8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48979206"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jul 2024 20:52:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSTnj-000be7-0b;
	Sat, 13 Jul 2024 03:51:59 +0000
Date: Sat, 13 Jul 2024 11:51:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 68a72104cbcf38ad16500216e213fa4eb21c4be2
Message-ID: <202407131158.BDHWvCTy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 68a72104cbcf38ad16500216e213fa4eb21c4be2  media: raspberrypi: Switch to remove_new

elapsed time: 1143m

configs tested: 209
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                          pxa168_defconfig   gcc-13.2.0
arm                             pxa_defconfig   gcc-13.2.0
arm                   randconfig-001-20240713   gcc-13.2.0
arm                   randconfig-002-20240713   gcc-13.2.0
arm                   randconfig-003-20240713   gcc-13.2.0
arm                   randconfig-004-20240713   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240713   gcc-13.2.0
arm64                 randconfig-002-20240713   gcc-13.2.0
arm64                 randconfig-003-20240713   gcc-13.2.0
arm64                 randconfig-004-20240713   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240713   gcc-13.2.0
csky                  randconfig-002-20240713   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240712   gcc-9
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240712   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240712   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-004-20240712   clang-18
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240712   gcc-11
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-006-20240712   clang-18
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240712   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-002-20240712   clang-18
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-003-20240712   clang-18
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-004-20240712   clang-18
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240712   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-006-20240712   clang-18
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-011-20240712   clang-18
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240712   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-013-20240712   clang-18
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-014-20240712   gcc-10
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-015-20240712   gcc-10
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-016-20240712   gcc-12
i386                  randconfig-016-20240713   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240713   gcc-13.2.0
loongarch             randconfig-002-20240713   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                      malta_kvm_defconfig   gcc-14.1.0
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                        omega2p_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240713   gcc-13.2.0
nios2                 randconfig-002-20240713   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240713   gcc-13.2.0
parisc                randconfig-002-20240713   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-14.1.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240713   gcc-13.2.0
powerpc               randconfig-002-20240713   gcc-13.2.0
powerpc               randconfig-003-20240713   gcc-13.2.0
powerpc                        warp_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240713   gcc-13.2.0
powerpc64             randconfig-002-20240713   gcc-13.2.0
powerpc64             randconfig-003-20240713   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240713   gcc-13.2.0
riscv                 randconfig-002-20240713   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240713   gcc-13.2.0
s390                  randconfig-002-20240713   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240713   gcc-13.2.0
sh                    randconfig-002-20240713   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240713   gcc-13.2.0
sparc64               randconfig-002-20240713   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240713   gcc-13.2.0
um                    randconfig-002-20240713   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240713   gcc-13.2.0
xtensa                randconfig-002-20240713   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


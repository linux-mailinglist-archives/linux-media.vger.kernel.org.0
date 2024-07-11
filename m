Return-Path: <linux-media+bounces-14899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A492E1D2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F99CB23E3D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 08:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4C61581F6;
	Thu, 11 Jul 2024 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewd964BD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35001156C78
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685658; cv=none; b=S5QBgEyWgMGQaI9ekc9HphjqQn3hGwdMaVKVbfd2Wnhzoe8qIJJtSRtcB08HU5F5HyOhPFEUq9UJJH9riVJnIZB+WBGPRzuR/ak3gHKj5IchnHhqBJQx4Tm38hY0ZE6qKJ/wykB2R6ZXTkGUwlDqJNQrVkmvZbRJGiDW0YlSmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685658; c=relaxed/simple;
	bh=Z4nt1yvIzV9S9sFMVvzwrfY2fmLvi+cCctROcbkUJoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QXnESX/1QA/FYMg/Ailn0HaQIxlX7GIB0bVSMe5v9Sh+L8skwgUFeh+CrWK8qw09z4gAk5c8kWoxYFLh2MUy6c9kTVbM4uIdjh7Jec5stdhif52x1ESOEM7ioO5YBCaJ/p8kYi7+N2uO2dgIccwQTKT5KX+P5Fry2ubKZ05QCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewd964BD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720685657; x=1752221657;
  h=date:from:to:cc:subject:message-id;
  bh=Z4nt1yvIzV9S9sFMVvzwrfY2fmLvi+cCctROcbkUJoo=;
  b=ewd964BDuRP43GFKxPZJR54iGx+GftUcVSfpxXY0bszD3rmPlim62tTM
   +r8SgBZe+poVDPevT4ljH/O6CLq67aCtAe4bhy441MOPMvz3Aw1a4HaX5
   hQxLq/1fidGuSws9nmgmBB0lGI9jtvSutgr6NP0qx9Xp6uXO9rgQe8xpq
   mofWarzLJlfLEAooEKlFpITXdirScgbPm7foERToMCZB8tZ/4J0VkpExi
   RGNBXljI37lJauAiPsx862VCUrYsrOsVch5jZXOS4nD0kravpEv8j8zuL
   0vp7b4e3MBO5liDUFLE7QteD1l1iOKVmaFrWVyhutOQDB5CRuGsg0hhOx
   Q==;
X-CSE-ConnectionGUID: nSz4HYOxRB6CnQvcgm+AbA==
X-CSE-MsgGUID: hc237Q22QbS95+rSO2DMtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17865754"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17865754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 01:14:16 -0700
X-CSE-ConnectionGUID: WpRzVBfnS3qkVI1iq0+aTQ==
X-CSE-MsgGUID: 69r2LTA8RTKRn499/V/6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="49138127"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jul 2024 01:14:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRowO-000Z0A-08;
	Thu, 11 Jul 2024 08:14:12 +0000
Date: Thu, 11 Jul 2024 16:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 93d27da27c2d1449d1c3cd2dee3ae840937836df
Message-ID: <202407111643.dxOjsgAj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 93d27da27c2d1449d1c3cd2dee3ae840937836df  media: raspberrypi: Switch to remove_new

elapsed time: 1458m

configs tested: 312
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240710   gcc-13.2.0
arc                   randconfig-001-20240711   gcc-13.2.0
arc                   randconfig-002-20240710   gcc-13.2.0
arc                   randconfig-002-20240711   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   gcc-13.2.0
arm                        clps711x_defconfig   clang-19
arm                                 defconfig   gcc-13.2.0
arm                   milbeaut_m10v_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   clang-19
arm                          moxart_defconfig   gcc-13.3.0
arm                            mps2_defconfig   clang-19
arm                        multi_v5_defconfig   clang-19
arm                       omap2plus_defconfig   clang-19
arm                            qcom_defconfig   clang-19
arm                   randconfig-001-20240710   gcc-13.2.0
arm                   randconfig-001-20240711   gcc-13.2.0
arm                   randconfig-002-20240710   gcc-13.2.0
arm                   randconfig-002-20240711   gcc-13.2.0
arm                   randconfig-003-20240710   gcc-13.2.0
arm                   randconfig-003-20240711   gcc-13.2.0
arm                   randconfig-004-20240710   gcc-13.2.0
arm                   randconfig-004-20240711   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.3.0
arm                          sp7021_defconfig   clang-19
arm                        spear3xx_defconfig   gcc-13.3.0
arm                           u8500_defconfig   gcc-13.3.0
arm                       versatile_defconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   clang-19
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240710   gcc-13.2.0
arm64                 randconfig-001-20240711   gcc-13.2.0
arm64                 randconfig-002-20240710   gcc-13.2.0
arm64                 randconfig-002-20240711   gcc-13.2.0
arm64                 randconfig-003-20240710   gcc-13.2.0
arm64                 randconfig-003-20240711   gcc-13.2.0
arm64                 randconfig-004-20240710   gcc-13.2.0
arm64                 randconfig-004-20240711   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240710   gcc-13.2.0
csky                  randconfig-001-20240711   gcc-13.2.0
csky                  randconfig-002-20240710   gcc-13.2.0
csky                  randconfig-002-20240711   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240710   clang-18
i386         buildonly-randconfig-001-20240711   gcc-13
i386         buildonly-randconfig-002-20240710   clang-18
i386         buildonly-randconfig-002-20240710   gcc-13
i386         buildonly-randconfig-002-20240711   gcc-13
i386         buildonly-randconfig-003-20240710   clang-18
i386         buildonly-randconfig-003-20240710   gcc-11
i386         buildonly-randconfig-003-20240711   gcc-13
i386         buildonly-randconfig-004-20240710   clang-18
i386         buildonly-randconfig-004-20240710   gcc-11
i386         buildonly-randconfig-004-20240711   gcc-13
i386         buildonly-randconfig-005-20240710   clang-18
i386         buildonly-randconfig-005-20240711   gcc-13
i386         buildonly-randconfig-006-20240710   clang-18
i386         buildonly-randconfig-006-20240711   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240710   clang-18
i386                  randconfig-001-20240711   gcc-13
i386                  randconfig-002-20240710   clang-18
i386                  randconfig-002-20240710   gcc-11
i386                  randconfig-002-20240711   gcc-13
i386                  randconfig-003-20240710   clang-18
i386                  randconfig-003-20240710   gcc-13
i386                  randconfig-003-20240711   gcc-13
i386                  randconfig-004-20240710   clang-18
i386                  randconfig-004-20240711   gcc-13
i386                  randconfig-005-20240710   clang-18
i386                  randconfig-005-20240711   gcc-13
i386                  randconfig-006-20240710   clang-18
i386                  randconfig-006-20240711   gcc-13
i386                  randconfig-011-20240710   clang-18
i386                  randconfig-011-20240710   gcc-13
i386                  randconfig-011-20240711   gcc-13
i386                  randconfig-012-20240710   clang-18
i386                  randconfig-012-20240710   gcc-12
i386                  randconfig-012-20240711   gcc-13
i386                  randconfig-013-20240710   clang-18
i386                  randconfig-013-20240710   gcc-12
i386                  randconfig-013-20240711   gcc-13
i386                  randconfig-014-20240710   clang-18
i386                  randconfig-014-20240710   gcc-13
i386                  randconfig-014-20240711   gcc-13
i386                  randconfig-015-20240710   clang-18
i386                  randconfig-015-20240710   gcc-8
i386                  randconfig-015-20240711   gcc-13
i386                  randconfig-016-20240710   clang-18
i386                  randconfig-016-20240711   gcc-13
loongarch                        allmodconfig   gcc-13.3.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.3.0
loongarch             randconfig-001-20240710   gcc-13.2.0
loongarch             randconfig-001-20240711   gcc-13.2.0
loongarch             randconfig-002-20240710   gcc-13.2.0
loongarch             randconfig-002-20240711   gcc-13.2.0
m68k                             allmodconfig   gcc-13.3.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.3.0
m68k                       bvme6000_defconfig   gcc-13.3.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.3.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.3.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm63xx_defconfig   gcc-13.3.0
mips                     cu1000-neo_defconfig   gcc-13.3.0
mips                         db1xxx_defconfig   clang-19
mips                  decstation_64_defconfig   gcc-13.3.0
mips                          eyeq5_defconfig   clang-19
mips                      malta_kvm_defconfig   clang-19
mips                malta_qemu_32r6_defconfig   gcc-13.3.0
mips                        qi_lb60_defconfig   clang-19
nios2                            allmodconfig   gcc-13.3.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.3.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240710   gcc-13.2.0
nios2                 randconfig-001-20240711   gcc-13.2.0
nios2                 randconfig-002-20240710   gcc-13.2.0
nios2                 randconfig-002-20240711   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.3.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.3.0
openrisc                         allyesconfig   gcc-13.3.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.3.0
parisc                            allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.3.0
parisc                           allyesconfig   gcc-13.3.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240710   gcc-13.2.0
parisc                randconfig-001-20240711   gcc-13.2.0
parisc                randconfig-002-20240710   gcc-13.2.0
parisc                randconfig-002-20240711   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   clang-19
powerpc                          allmodconfig   gcc-13.3.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.3.0
powerpc                          allyesconfig   gcc-13.3.0
powerpc                     asp8347_defconfig   clang-19
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                      chrp32_defconfig   gcc-13.3.0
powerpc                       ebony_defconfig   clang-19
powerpc                       maple_defconfig   clang-19
powerpc                   microwatt_defconfig   clang-19
powerpc                     mpc5200_defconfig   gcc-13.3.0
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                      pcm030_defconfig   gcc-13.2.0
powerpc                     powernv_defconfig   gcc-13.3.0
powerpc                         ps3_defconfig   clang-19
powerpc               randconfig-001-20240710   gcc-13.2.0
powerpc               randconfig-001-20240711   gcc-13.2.0
powerpc               randconfig-002-20240710   gcc-13.2.0
powerpc               randconfig-002-20240711   gcc-13.2.0
powerpc               randconfig-003-20240710   gcc-13.2.0
powerpc               randconfig-003-20240711   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   clang-19
powerpc                         wii_defconfig   clang-19
powerpc64             randconfig-001-20240710   gcc-13.2.0
powerpc64             randconfig-001-20240711   gcc-13.2.0
powerpc64             randconfig-002-20240710   gcc-13.2.0
powerpc64             randconfig-002-20240711   gcc-13.2.0
powerpc64             randconfig-003-20240710   gcc-13.2.0
powerpc64             randconfig-003-20240711   gcc-13.2.0
riscv                            allmodconfig   gcc-13.3.0
riscv                             allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.3.0
riscv                            allyesconfig   gcc-13.3.0
riscv                               defconfig   gcc-13.2.0
riscv             nommu_k210_sdcard_defconfig   gcc-13.2.0
riscv                 randconfig-001-20240710   gcc-13.2.0
riscv                 randconfig-001-20240711   gcc-13.2.0
riscv                 randconfig-002-20240710   gcc-13.2.0
riscv                 randconfig-002-20240711   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240710   gcc-13.2.0
s390                  randconfig-001-20240711   gcc-13.2.0
s390                  randconfig-002-20240710   gcc-13.2.0
s390                  randconfig-002-20240711   gcc-13.2.0
sh                               allmodconfig   gcc-13.3.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.3.0
sh                                  defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.2.0
sh                          polaris_defconfig   gcc-13.3.0
sh                    randconfig-001-20240710   gcc-13.2.0
sh                    randconfig-001-20240711   gcc-13.2.0
sh                    randconfig-002-20240710   gcc-13.2.0
sh                    randconfig-002-20240711   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.3.0
sh                           se7705_defconfig   gcc-13.3.0
sh                           se7751_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.3.0
sparc                            allyesconfig   gcc-13.3.0
sparc                       sparc64_defconfig   gcc-13.3.0
sparc64                          allmodconfig   gcc-13.3.0
sparc64                          allyesconfig   gcc-13.3.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240710   gcc-13.2.0
sparc64               randconfig-001-20240711   gcc-13.2.0
sparc64               randconfig-002-20240710   gcc-13.2.0
sparc64               randconfig-002-20240711   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240710   gcc-13.2.0
um                    randconfig-001-20240711   gcc-13.2.0
um                    randconfig-002-20240710   gcc-13.2.0
um                    randconfig-002-20240711   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240710   clang-18
x86_64       buildonly-randconfig-001-20240711   clang-18
x86_64       buildonly-randconfig-002-20240710   clang-18
x86_64       buildonly-randconfig-002-20240711   clang-18
x86_64       buildonly-randconfig-003-20240710   clang-18
x86_64       buildonly-randconfig-003-20240711   clang-18
x86_64       buildonly-randconfig-004-20240710   clang-18
x86_64       buildonly-randconfig-004-20240711   clang-18
x86_64       buildonly-randconfig-005-20240710   clang-18
x86_64       buildonly-randconfig-005-20240711   clang-18
x86_64       buildonly-randconfig-006-20240710   clang-18
x86_64       buildonly-randconfig-006-20240711   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240710   clang-18
x86_64                randconfig-001-20240711   clang-18
x86_64                randconfig-002-20240710   clang-18
x86_64                randconfig-002-20240711   clang-18
x86_64                randconfig-003-20240710   clang-18
x86_64                randconfig-003-20240711   clang-18
x86_64                randconfig-004-20240710   clang-18
x86_64                randconfig-004-20240711   clang-18
x86_64                randconfig-005-20240710   clang-18
x86_64                randconfig-005-20240711   clang-18
x86_64                randconfig-006-20240710   clang-18
x86_64                randconfig-006-20240711   clang-18
x86_64                randconfig-011-20240710   clang-18
x86_64                randconfig-011-20240711   clang-18
x86_64                randconfig-012-20240710   clang-18
x86_64                randconfig-012-20240711   clang-18
x86_64                randconfig-013-20240710   clang-18
x86_64                randconfig-013-20240711   clang-18
x86_64                randconfig-014-20240710   clang-18
x86_64                randconfig-014-20240711   clang-18
x86_64                randconfig-015-20240710   clang-18
x86_64                randconfig-015-20240711   clang-18
x86_64                randconfig-016-20240710   clang-18
x86_64                randconfig-016-20240711   clang-18
x86_64                randconfig-071-20240710   clang-18
x86_64                randconfig-071-20240711   clang-18
x86_64                randconfig-072-20240710   clang-18
x86_64                randconfig-072-20240711   clang-18
x86_64                randconfig-073-20240710   clang-18
x86_64                randconfig-073-20240711   clang-18
x86_64                randconfig-074-20240710   clang-18
x86_64                randconfig-074-20240711   clang-18
x86_64                randconfig-075-20240710   clang-18
x86_64                randconfig-075-20240711   clang-18
x86_64                randconfig-076-20240710   clang-18
x86_64                randconfig-076-20240711   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.3.0
xtensa                  cadence_csp_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240710   gcc-13.2.0
xtensa                randconfig-001-20240711   gcc-13.2.0
xtensa                randconfig-002-20240710   gcc-13.2.0
xtensa                randconfig-002-20240711   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


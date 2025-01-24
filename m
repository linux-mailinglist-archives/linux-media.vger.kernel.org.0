Return-Path: <linux-media+bounces-25247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEEEA1AEDE
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 03:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E442D16B894
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 02:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49341D5CD7;
	Fri, 24 Jan 2025 02:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afqNsvdY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0F28EA
	for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 02:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687275; cv=none; b=VF6dctGcrjDCDzIs2/h6Ki3OLULv8oxDcggrjM1oI6ONRuap826sY68t4ff58LkHsu8IsYOCZAbMHL2ti8rt63YWxWrAhppInLShpNMvNwPf1u8S54Kk5/A9ldygu/ElZ0bYy07caY/v0gazT5auR4EaTDXeoi81kmdqUNSh+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687275; c=relaxed/simple;
	bh=8bDXUPlkduZ1vF9Yv6cqObMOh0X7bfoWURXD4I68THc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hc/qFo6n6qjfWevUAPUWt3qdWA9IJxxYxCNPScjeU2kkuPMhraofVvGzvKBjLEmqjCr8LoojGQPel5g8SpONIApXyzh9sTKKMKW3c7Ejp6Wt+bg7B0NwHA3YZCKqgItTf/2kXoe+0jzaH7AtoLnd0390rvblf4d3ZFaIBXqJQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afqNsvdY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737687273; x=1769223273;
  h=date:from:to:cc:subject:message-id;
  bh=8bDXUPlkduZ1vF9Yv6cqObMOh0X7bfoWURXD4I68THc=;
  b=afqNsvdYi9TGukOLKdQcxUphuIAQSALHhMbGSJ+H2Ukl/8tTn4VoSfSa
   E9j3z/rb28fkH5pldd3w0KeLkkm9a4k12lQjKX9tzzyDYu9BCKNorLDSb
   qrN9D3q4uqB7lFzZifm4uJ3YSI/6F3XLulPtbfkUqIdLXlBpd/DaV1kcI
   ruY5IFWXsO0117eN2jNCb2Kqd64nZNK0VX5EZkiL41xMdKhjnlSrmBWi/
   aINdi9OFrpOUibQumhbkVD4hTT3TcAHoOmacWRCn1Adfvl8Be5Hx/4KfY
   i8UgoKXYQ2+nIWG0/LEbguae7c3JqfJBHycNcziUzl1BL1URxkb/sC72w
   g==;
X-CSE-ConnectionGUID: cRX+hMTtTTSg5Fmaupd+2g==
X-CSE-MsgGUID: 8X8SKYZGRBOAElShJ4HT7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38469677"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38469677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:54:32 -0800
X-CSE-ConnectionGUID: 3goMlrtKTzuIbsHARnPqHQ==
X-CSE-MsgGUID: fWmF1uwNQGuY26AWoLrweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138521382"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 18:54:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9q0-000c3f-22;
	Fri, 24 Jan 2025 02:54:28 +0000
Date: Fri, 24 Jan 2025 10:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 7351aa1ac45c049eff43fa6ed1b2af79fe6fbb74
Message-ID: <202501241001.wzPeNer0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 7351aa1ac45c049eff43fa6ed1b2af79fe6fbb74  media: i2c: imx219: Add embedded data support

elapsed time: 981m

configs tested: 172
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250123    gcc-13.2.0
arc                   randconfig-001-20250124    clang-20
arc                   randconfig-002-20250123    gcc-13.2.0
arc                   randconfig-002-20250124    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                   randconfig-001-20250123    clang-20
arm                   randconfig-001-20250124    clang-20
arm                   randconfig-002-20250123    gcc-14.2.0
arm                   randconfig-002-20250124    clang-20
arm                   randconfig-003-20250123    gcc-14.2.0
arm                   randconfig-003-20250124    clang-20
arm                   randconfig-004-20250123    gcc-14.2.0
arm                   randconfig-004-20250124    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250123    gcc-14.2.0
arm64                 randconfig-001-20250124    clang-20
arm64                 randconfig-002-20250123    clang-20
arm64                 randconfig-002-20250124    clang-20
arm64                 randconfig-003-20250123    clang-20
arm64                 randconfig-003-20250124    clang-20
arm64                 randconfig-004-20250123    clang-16
arm64                 randconfig-004-20250124    clang-20
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250123    gcc-14.2.0
csky                  randconfig-002-20250123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250123    clang-20
hexagon               randconfig-002-20250123    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250123    gcc-12
i386        buildonly-randconfig-001-20250124    clang-19
i386        buildonly-randconfig-002-20250123    clang-19
i386        buildonly-randconfig-002-20250124    clang-19
i386        buildonly-randconfig-003-20250123    gcc-12
i386        buildonly-randconfig-003-20250124    clang-19
i386        buildonly-randconfig-004-20250123    clang-19
i386        buildonly-randconfig-004-20250124    clang-19
i386        buildonly-randconfig-005-20250123    gcc-12
i386        buildonly-randconfig-005-20250124    clang-19
i386        buildonly-randconfig-006-20250123    clang-19
i386        buildonly-randconfig-006-20250124    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250124    clang-19
i386                  randconfig-002-20250124    clang-19
i386                  randconfig-003-20250124    clang-19
i386                  randconfig-004-20250124    clang-19
i386                  randconfig-005-20250124    clang-19
i386                  randconfig-006-20250124    clang-19
i386                  randconfig-007-20250124    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250123    gcc-14.2.0
loongarch             randconfig-002-20250123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250123    gcc-14.2.0
nios2                 randconfig-002-20250123    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250123    gcc-14.2.0
parisc                randconfig-002-20250123    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-20
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                    mvme5100_defconfig    clang-20
powerpc               randconfig-001-20250123    gcc-14.2.0
powerpc               randconfig-002-20250123    clang-18
powerpc               randconfig-003-20250123    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250123    gcc-14.2.0
powerpc64             randconfig-002-20250123    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250123    gcc-14.2.0
riscv                 randconfig-002-20250123    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250123    gcc-14.2.0
s390                  randconfig-002-20250123    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250123    gcc-14.2.0
sh                    randconfig-002-20250123    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250123    gcc-14.2.0
sparc                 randconfig-002-20250123    gcc-14.2.0
sparc64               randconfig-001-20250123    gcc-14.2.0
sparc64               randconfig-002-20250123    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20250123    gcc-12
um                    randconfig-002-20250123    gcc-11
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250123    clang-19
x86_64      buildonly-randconfig-001-20250124    gcc-12
x86_64      buildonly-randconfig-002-20250123    clang-19
x86_64      buildonly-randconfig-002-20250124    gcc-12
x86_64      buildonly-randconfig-003-20250123    gcc-12
x86_64      buildonly-randconfig-003-20250124    gcc-12
x86_64      buildonly-randconfig-004-20250123    gcc-12
x86_64      buildonly-randconfig-004-20250124    gcc-12
x86_64      buildonly-randconfig-005-20250123    clang-19
x86_64      buildonly-randconfig-005-20250124    gcc-12
x86_64      buildonly-randconfig-006-20250123    clang-19
x86_64      buildonly-randconfig-006-20250124    gcc-12
x86_64                              defconfig    gcc-11
x86_64                randconfig-071-20250124    gcc-12
x86_64                randconfig-072-20250124    gcc-12
x86_64                randconfig-073-20250124    gcc-12
x86_64                randconfig-074-20250124    gcc-12
x86_64                randconfig-075-20250124    gcc-12
x86_64                randconfig-076-20250124    gcc-12
x86_64                randconfig-077-20250124    gcc-12
x86_64                randconfig-078-20250124    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250123    gcc-14.2.0
xtensa                randconfig-002-20250123    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


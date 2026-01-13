Return-Path: <linux-media+bounces-50568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E769AD19963
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35F9309BC1A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB92A2C3768;
	Tue, 13 Jan 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNX/FxtJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4F2BF3F3
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315339; cv=none; b=VRrrHnEgxMEJVHLKbXM20mLUmkKtlXorbz7CnkQ1sKdaD2tB+WF3/0uqVTo/TY4C6WWphuLu2l94ZKmb7+ovwD9MzKJRzCkHunztSYNw+CoJmobIFwtd2sTBh0YE2IAFc/O507M3+zKip6aGaj7kQKN6IyEVOZ7oq3prFT3PRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315339; c=relaxed/simple;
	bh=heg59zI8gO+ykTJ6QeM1wGPSC8fxp5PUD7Ue2CcIJ0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NgE/a8zXLxwO620EZFYmfZHaAU0u69Q9B3fFAmaXI3AQr4/bHTU4+ka7HrUWmbWF5HQ1IKee7M+wK1VG1tTiTPo4nfb6ypPZm6T4q/S04DQbxtqzUplvb/Nrn1K0VaIDRE8RD+x16a8A9PzcukvdpVtqiia1E10oYBu+fqdLa3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNX/FxtJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768315337; x=1799851337;
  h=date:from:to:cc:subject:message-id;
  bh=heg59zI8gO+ykTJ6QeM1wGPSC8fxp5PUD7Ue2CcIJ0Y=;
  b=SNX/FxtJsgjlTSAnywZAxJJZwycKwuPsIVQ7Cuy/Nkhg2gJLUiFrq770
   ckOsgz0KFuViyJlvXH4M5h4YkaWOWkeal0iLtCxudkYlpZptjmx3J28FA
   zTyNqI+Rx4Z1roIYHrfdgH/IJq/le8122XacM9EJDToFQY7fi4vjR4vAS
   uLl74sENaU28AWWuMswYmLvemgYnRNjXS+n/ZftoWI3DWtdQdNbvfBaGa
   gNwt6qEldkT5kJ/dNGx4mDP6fUd1l2HHL4JzvGu8VTZLD3VQIsxm7NvsP
   PMtNRRZdCCAQY7AfuGAWSJX6iHlH92NfCJUYCcA/GeJCvfpo3gl5PmuRs
   g==;
X-CSE-ConnectionGUID: FOzOtrfYSKSTAbgwou5QHw==
X-CSE-MsgGUID: QJhKzruLRVifFLmLeOayAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69499171"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69499171"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:42:16 -0800
X-CSE-ConnectionGUID: vgVl+5EmTU6rhB1VQgsH5Q==
X-CSE-MsgGUID: AWNac2C/S9ugNldW/qB6Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204673889"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:42:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffb3-00000000Evk-0FOs;
	Tue, 13 Jan 2026 14:42:13 +0000
Date: Tue, 13 Jan 2026 22:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
Message-ID: <202601132217.yNAh2NVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c  media: i2c: add os05b10 image sensor driver

elapsed time: 1476m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-001-20260113    gcc-8.5.0
arc                   randconfig-002-20260113    clang-22
arc                   randconfig-002-20260113    gcc-10.5.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                   milbeaut_m10v_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260113    clang-19
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-004-20260113    clang-22
arm                             rpc_defconfig    clang-18
arm                           sunxi_defconfig    gcc-15.2.0
arm                       versatile_defconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-003-20260113    gcc-9.5.0
arm64                 randconfig-004-20260113    clang-22
arm64                 randconfig-004-20260113    gcc-12.5.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-001-20260113    gcc-15.2.0
csky                  randconfig-002-20260113    clang-22
csky                  randconfig-002-20260113    gcc-9.5.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260113    clang-22
hexagon               randconfig-002-20260113    clang-22
i386        buildonly-randconfig-001-20260112    gcc-14
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260112    clang-20
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260112    gcc-14
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260112    clang-20
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260112    gcc-14
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260112    gcc-14
i386        buildonly-randconfig-006-20260113    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260113    gcc-14
i386                  randconfig-002-20260113    clang-20
i386                  randconfig-003-20260113    clang-20
i386                  randconfig-004-20260113    gcc-14
i386                  randconfig-005-20260113    clang-20
i386                  randconfig-006-20260113    clang-20
i386                  randconfig-007-20260113    gcc-14
i386                  randconfig-011-20260113    clang-20
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-017-20260113    clang-20
i386                  randconfig-017-20260113    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260113    clang-22
loongarch             randconfig-001-20260113    gcc-15.2.0
loongarch             randconfig-002-20260113    clang-22
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                          eyeq6_defconfig    clang-22
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260113    clang-22
nios2                 randconfig-001-20260113    gcc-8.5.0
nios2                 randconfig-002-20260113    clang-22
nios2                 randconfig-002-20260113    gcc-11.5.0
openrisc                            defconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                generic-32bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260113    clang-19
parisc                randconfig-001-20260113    gcc-13.4.0
parisc                randconfig-002-20260113    clang-19
parisc                randconfig-002-20260113    gcc-14.3.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                     ep8248e_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    clang-22
powerpc               randconfig-001-20260113    clang-19
powerpc               randconfig-001-20260113    clang-22
powerpc               randconfig-002-20260113    clang-17
powerpc               randconfig-002-20260113    clang-19
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260113    clang-19
powerpc64             randconfig-002-20260113    clang-19
powerpc64             randconfig-002-20260113    clang-22
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-9.5.0
riscv                 randconfig-002-20260113    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-8.5.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-001-20260113    gcc-8.5.0
s390                  randconfig-002-20260113    gcc-14.3.0
s390                  randconfig-002-20260113    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-14.3.0
sh                    randconfig-002-20260113    gcc-15.2.0
sh                        sh7757lcr_defconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260113    gcc-14.3.0
sparc                 randconfig-001-20260113    gcc-8.5.0
sparc                 randconfig-002-20260113    gcc-14.3.0
sparc                 randconfig-002-20260113    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260113    gcc-14.3.0
sparc64               randconfig-002-20260113    gcc-14.3.0
sparc64               randconfig-002-20260113    gcc-8.5.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260113    gcc-14
um                    randconfig-001-20260113    gcc-14.3.0
um                    randconfig-002-20260113    clang-22
um                    randconfig-002-20260113    gcc-14.3.0
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    gcc-14
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    gcc-14
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-005-20260113    gcc-13
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-003-20260113    clang-20
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-006-20260113    gcc-14
x86_64                randconfig-011-20260113    clang-20
x86_64                randconfig-011-20260113    gcc-13
x86_64                randconfig-012-20260113    clang-20
x86_64                randconfig-013-20260113    clang-20
x86_64                randconfig-014-20260113    clang-20
x86_64                randconfig-014-20260113    gcc-13
x86_64                randconfig-015-20260113    clang-20
x86_64                randconfig-015-20260113    gcc-14
x86_64                randconfig-016-20260113    clang-20
x86_64                randconfig-071-20260113    clang-20
x86_64                randconfig-071-20260113    gcc-13
x86_64                randconfig-072-20260113    clang-20
x86_64                randconfig-072-20260113    gcc-14
x86_64                randconfig-073-20260113    clang-20
x86_64                randconfig-073-20260113    gcc-13
x86_64                randconfig-074-20260113    clang-20
x86_64                randconfig-075-20260113    clang-20
x86_64                randconfig-076-20260113    clang-20
xtensa                           alldefconfig    gcc-15.2.0
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260113    gcc-14.3.0
xtensa                randconfig-001-20260113    gcc-9.5.0
xtensa                randconfig-002-20260113    gcc-14.3.0
xtensa                randconfig-002-20260113    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


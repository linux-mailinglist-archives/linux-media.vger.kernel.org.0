Return-Path: <linux-media+bounces-47171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8AC60FA4
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 04:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1732F4E23D4
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 03:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DB0228CB8;
	Sun, 16 Nov 2025 03:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hiz3k9md"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A611E376C
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763264308; cv=none; b=CovJfakJpfDotaAy39vTTQmXfWyJoYxT6R8C0JBmQcEl35umqwCqPTenO9YSjArZqapGCJrJVnuv4oT90Csnlkg48AjPlwLGlKsMotlDAnwSkBtXURZsNnjanlTIZjg6dfH+5NVhhk37It5qc8i6yqMm2YKIzsN2IfZU5r8yiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763264308; c=relaxed/simple;
	bh=tbRvKIINFkv9QODndjPyL4tuSdBDz6XSHVJp54o/91U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tafBD0nJtOZMSMeuat6NhVCDgCA5q2FgXlfPltTweG4W6dftUb+kqFmyroz46+lx8VKQtrwZQqfuvGYpw0IQRc5X8ha+O53Q1oUem6X0To/xEUohyNaiCu62dbK8nELimglayXXNJw6ZUXtjBiILhXodc26wRKCMNFNIY9/J8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hiz3k9md; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763264306; x=1794800306;
  h=date:from:to:cc:subject:message-id;
  bh=tbRvKIINFkv9QODndjPyL4tuSdBDz6XSHVJp54o/91U=;
  b=Hiz3k9md1XsUTBYFjsnDPVR1Ir7rHSRzLWWygcNkmX7U4nfil+Xa3BkO
   q8t8ZLfYx8e99IKQrxRU4mSZm39ztc0o2Dlc/dESrgs12DHFbbkes4u9T
   q2ED6aQioRDNZhzc4FWeMR6vWRtUOVIqPc1X0f9rrHZXAOFmBfrKXFhYC
   i47JigIcvK3xFIPxgjiiGoKSmmE3vvjhCQuxIP121JTnmGim0fiJlhMm2
   jOJdlOrhvLNzO0FMiPJERlZBRRix+5I9vSBr3zePthHCn9r5Istb8iB/3
   MN8AQBWur1SZYpN0y4EbjdDKpZgAP7Ka0+yCoTQr0n8/mQYLDA0+bDmgl
   w==;
X-CSE-ConnectionGUID: UF+goJenRdqsyMyd3odk2w==
X-CSE-MsgGUID: Em/30ShjRr+K2z58tOnydw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65338104"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="65338104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 19:38:26 -0800
X-CSE-ConnectionGUID: GzcfNIGiQAyPfFRIjoUS0w==
X-CSE-MsgGUID: HEob7Gi4SOixIl02T3fPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="227483708"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2025 19:38:25 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKTap-0008Td-07;
	Sun, 16 Nov 2025 03:38:23 +0000
Date: Sun, 16 Nov 2025 11:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 d363bdfa0ec6b19a4f40b572cec70430d5b13ad6
Message-ID: <202511161136.Z3IGGYgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: d363bdfa0ec6b19a4f40b572cec70430d5b13ad6  media: i2c: add Sony IMX111 CMOS camera sensor driver

elapsed time: 3747m

configs tested: 104
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251115    gcc-13.4.0
arc                   randconfig-002-20251115    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251115    clang-22
arm                   randconfig-002-20251115    gcc-8.5.0
arm                   randconfig-003-20251115    gcc-10.5.0
arm                   randconfig-004-20251115    clang-22
arm                           sama7_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251115    gcc-8.5.0
arm64                 randconfig-002-20251115    clang-18
arm64                 randconfig-003-20251115    gcc-13.4.0
arm64                 randconfig-004-20251115    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251115    gcc-15.1.0
csky                  randconfig-002-20251115    gcc-9.5.0
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386                  randconfig-001-20251116    gcc-14
i386                  randconfig-002-20251116    clang-20
i386                  randconfig-003-20251116    gcc-14
i386                  randconfig-004-20251116    gcc-14
i386                  randconfig-005-20251116    clang-20
i386                  randconfig-006-20251116    clang-20
i386                  randconfig-007-20251116    clang-20
i386                  randconfig-011-20251116    clang-20
i386                  randconfig-012-20251116    gcc-14
i386                  randconfig-013-20251116    gcc-14
i386                  randconfig-014-20251116    clang-20
i386                  randconfig-015-20251116    gcc-12
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251114    gcc-12.5.0
parisc                randconfig-001-20251115    gcc-8.5.0
parisc                randconfig-002-20251114    gcc-11.5.0
parisc                randconfig-002-20251115    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-22
powerpc               randconfig-001-20251114    clang-17
powerpc               randconfig-001-20251115    clang-19
powerpc               randconfig-002-20251114    clang-22
powerpc               randconfig-002-20251115    gcc-8.5.0
powerpc64             randconfig-001-20251114    gcc-8.5.0
powerpc64             randconfig-001-20251115    gcc-11.5.0
powerpc64             randconfig-002-20251114    clang-22
powerpc64             randconfig-002-20251115    gcc-14.3.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251114    gcc-13.4.0
riscv                 randconfig-001-20251115    clang-22
riscv                 randconfig-002-20251114    clang-22
riscv                 randconfig-002-20251115    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251114    gcc-8.5.0
s390                  randconfig-001-20251115    clang-17
s390                  randconfig-002-20251114    gcc-11.5.0
s390                  randconfig-002-20251115    gcc-8.5.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251114    gcc-10.5.0
sh                    randconfig-001-20251115    gcc-12.5.0
sh                    randconfig-002-20251114    gcc-15.1.0
sh                    randconfig-002-20251115    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                   sh7770_generic_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251116    clang-20
x86_64      buildonly-randconfig-002-20251116    clang-20
x86_64      buildonly-randconfig-003-20251116    clang-20
x86_64      buildonly-randconfig-004-20251116    gcc-13
x86_64      buildonly-randconfig-005-20251116    clang-20
x86_64      buildonly-randconfig-006-20251116    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251116    clang-20
x86_64                randconfig-072-20251116    clang-20
x86_64                randconfig-073-20251116    clang-20
x86_64                randconfig-074-20251116    clang-20
x86_64                randconfig-075-20251116    clang-20
x86_64                randconfig-076-20251116    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


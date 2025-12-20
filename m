Return-Path: <linux-media+bounces-49236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E5CD2EE5
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 13:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C36330141CB
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 12:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064ED274676;
	Sat, 20 Dec 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZuODnZ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE186153BE9
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766234995; cv=none; b=DLh76Uf+ntlsSPhycGeFMUJD6jqGvvHh8SEhkFJCFspsN5i4nTvOkqa4mg6u9dHZUK6sHVcOfb0JPuRSvU5xoIFU183lwndW+NfRv2hqkCxR5P3xnCOwsXmvSDxM/oq3tCxQrBezMEEO72vLEAkwKrMTjVTvFTDOgwnoGFa4wE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766234995; c=relaxed/simple;
	bh=RVwQkz0ibFBwK8qfHFuQ/8OEptbmLFsWfQZ0uxA95fA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cXayglbU3wuUavnBxcUTdIuHcm6ahA0rApUW9X1IhnJtvCePapwUX6eS/UTY0jBxtceXhbXZpGvBYnRIfcHBA0+jiwRkC+SmQXdhWkj+y0L4HNXNNmogvzJ+/oO0F4dytoiumWaWFAS6LpkQo6FxSRTHIiEKoEJ4qvoL3r7VpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZuODnZ6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766234993; x=1797770993;
  h=date:from:to:cc:subject:message-id;
  bh=RVwQkz0ibFBwK8qfHFuQ/8OEptbmLFsWfQZ0uxA95fA=;
  b=mZuODnZ6BGL/BuiPsMIAdu+KmcmNV30CLduDNsIoya5a2pcWJf97lkIm
   L2aSHSXaDyMsaTFBbYS3MCJh01lpcEEdijxvELxL5TqELuLcenqw/VzRA
   xiWD2Jfsg/i8ScVN6Os8ishx8EpZ8W8ptX184e2Bc8ICZqWOwnguXcNTi
   PKKaYJz5RC77r5exY9hcUxhtveJq9sYTU0oIsxMKtI3xZxeHMRyBVev26
   sPg6E/2nkL8PXotCKDQhr4JW6mAth8ophFyV4Y53AeNhTWGip0AxMn8kO
   Qu9QVFAkgXmxEAYqIg7/R59uljGJvNbHTQI/pu5CU78wNHkKBhFlHnt19
   Q==;
X-CSE-ConnectionGUID: kmAU3RKEQHaRdhzF0hFdLw==
X-CSE-MsgGUID: 6djm8Ca1R3O9TtYtm12l2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="72018620"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72018620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 04:49:53 -0800
X-CSE-ConnectionGUID: yCDGcnCvQRqshJ8dxzuXyQ==
X-CSE-MsgGUID: qbG7SzUlTyKSV2gbH/fhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204033436"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 04:49:52 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWwP7-000000004Wv-2YwX;
	Sat, 20 Dec 2025 12:49:49 +0000
Date: Sat, 20 Dec 2025 20:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 bf698c414542de30fe7063dc0427c28df9aa824d
Message-ID: <202512202018.pZ2IcDSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: bf698c414542de30fe7063dc0427c28df9aa824d  media: ccs: Move ccs_validate_csi_data_format up

elapsed time: 1465m

configs tested: 94
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                           h3600_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   currituck_defconfig    gcc-15.1.0
powerpc                      tqm8xx_defconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                  sh7785lcr_32bit_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251220    clang-20
x86_64      buildonly-randconfig-002-20251220    clang-20
x86_64      buildonly-randconfig-003-20251220    clang-20
x86_64      buildonly-randconfig-004-20251220    clang-20
x86_64      buildonly-randconfig-005-20251220    clang-20
x86_64      buildonly-randconfig-006-20251220    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


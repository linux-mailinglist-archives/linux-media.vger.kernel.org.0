Return-Path: <linux-media+bounces-44138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E961BCAE04
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 22:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26CC93B2421
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 20:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6196627604B;
	Thu,  9 Oct 2025 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TShswRMd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BD726E146
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 20:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043589; cv=none; b=m7fOV7IEnY8l6NWFQn9FcXkZdJeNZUf4vQzmjSm2e9CLBHPSgvpUIEkg9JzfvtC+OoK2CKvKtvkjA3REemQVCip7jkV0DOFnip99upq0ZvFUHIRga2lo3RKlmJpko09+VngohJGmCPq8GK37ZZM+amrq6ngYSKLKOILSI56eHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043589; c=relaxed/simple;
	bh=iL22lKW+R8Bzym4QTlPFnlPdOsjzRIIsI/ZLD+8PYgg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PpTsDAwyStoi/KhrfjyufMR7TktFJ4Xd7djFALNyYtGIJFgnTvC+cutLmZYCaNRQS1ATlKLGtZS4aZsnmr5alamHf6QZVujJ0sgK3Mh3xqOUwAolInLx3NlTmqcXLdDHG2zUQ8UYsezOJXZyJReMAsij/WpPBCUvSmOtIsx3SNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TShswRMd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760043589; x=1791579589;
  h=date:from:to:cc:subject:message-id;
  bh=iL22lKW+R8Bzym4QTlPFnlPdOsjzRIIsI/ZLD+8PYgg=;
  b=TShswRMdBIneVpOAK68YyjdRV2vQVr99LNzZGYADN9onD/IR9FCG5me6
   i6a0mz4CO2HHNQy0jf4pFIxP9+gFVf1jtB2CE9ahP0EKIJGIIBUkzZGw4
   r0AApUjpAtZMsuE1SE0xRpmN8lbgz2Gt5G6xf46FK3Pg9ngmeNwqIuKEU
   YS9VpTa1OUl38QVGF1crqkZNlIP9DBdeN2AMX0jOo9c+ePehETagKTa9m
   6YnRWiN0UBRoSmPFJWm+E+3yiDBI+OCe7DheUvmCEm2vduE+lsOBU2L0R
   lkKA9TbcPQARAHFjV3D8c5tOBSQ2VVIe0JzwnhEBTEw4UCPcuM7T6Jk7f
   A==;
X-CSE-ConnectionGUID: E4YbXgQKRyCcD+hk3xw11g==
X-CSE-MsgGUID: pv0ARkQ7TAS2kKu7AGA7rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66095459"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66095459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 13:59:48 -0700
X-CSE-ConnectionGUID: VPh5bUczQzewhlKIuOk+8g==
X-CSE-MsgGUID: R5lFhfq9SWaMG4Qq25jJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="181584511"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2025 13:59:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6xjk-0001R9-0u;
	Thu, 09 Oct 2025 20:59:44 +0000
Date: Fri, 10 Oct 2025 04:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-fix] BUILD SUCCESS
 79977af187876b46a39c73e18040cca05cddaa20
Message-ID: <202510100439.9lkuNu5P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git async-fix
branch HEAD: 79977af187876b46a39c73e18040cca05cddaa20  media: v4l2-async: Rename functions according to what they do

elapsed time: 848m

configs tested: 156
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                       imx_v4_v5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251009    clang-16
csky                  randconfig-002-20251009    clang-16
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251009    clang-16
hexagon               randconfig-002-20251009    clang-16
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251009    gcc-14
i386        buildonly-randconfig-002-20251009    gcc-14
i386        buildonly-randconfig-003-20251009    gcc-14
i386        buildonly-randconfig-004-20251009    gcc-14
i386        buildonly-randconfig-005-20251009    gcc-14
i386        buildonly-randconfig-006-20251009    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251010    clang-20
i386                  randconfig-002-20251010    clang-20
i386                  randconfig-003-20251010    clang-20
i386                  randconfig-004-20251010    clang-20
i386                  randconfig-005-20251010    clang-20
i386                  randconfig-006-20251010    clang-20
i386                  randconfig-007-20251010    clang-20
i386                  randconfig-011-20251009    clang-20
i386                  randconfig-012-20251009    clang-20
i386                  randconfig-013-20251009    clang-20
i386                  randconfig-014-20251009    clang-20
i386                  randconfig-015-20251009    clang-20
i386                  randconfig-016-20251009    clang-20
i386                  randconfig-017-20251009    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251009    clang-16
loongarch             randconfig-002-20251009    clang-16
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251009    clang-16
nios2                 randconfig-002-20251009    clang-16
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251009    clang-16
parisc                randconfig-002-20251009    clang-16
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                        icon_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251009    clang-16
powerpc               randconfig-002-20251009    clang-16
powerpc               randconfig-003-20251009    clang-16
powerpc64             randconfig-002-20251009    clang-16
powerpc64             randconfig-003-20251009    clang-16
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                 randconfig-001-20251009    clang-22
riscv                 randconfig-001-20251010    gcc-9.5.0
riscv                 randconfig-002-20251009    clang-22
riscv                 randconfig-002-20251010    gcc-9.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251009    clang-22
s390                  randconfig-001-20251010    gcc-9.5.0
s390                  randconfig-002-20251009    clang-22
s390                  randconfig-002-20251010    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ecovec24_defconfig    gcc-15.1.0
sh                    randconfig-001-20251009    clang-22
sh                    randconfig-001-20251010    gcc-9.5.0
sh                    randconfig-002-20251009    clang-22
sh                    randconfig-002-20251010    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251009    clang-22
sparc                 randconfig-001-20251010    gcc-9.5.0
sparc                 randconfig-002-20251009    clang-22
sparc                 randconfig-002-20251010    gcc-9.5.0
sparc64               randconfig-001-20251009    clang-22
sparc64               randconfig-001-20251010    gcc-9.5.0
sparc64               randconfig-002-20251009    clang-22
sparc64               randconfig-002-20251010    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                    randconfig-001-20251009    clang-22
um                    randconfig-001-20251010    gcc-9.5.0
um                    randconfig-002-20251009    clang-22
um                    randconfig-002-20251010    gcc-9.5.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251009    clang-20
x86_64      buildonly-randconfig-002-20251009    clang-20
x86_64      buildonly-randconfig-003-20251009    clang-20
x86_64      buildonly-randconfig-004-20251009    clang-20
x86_64      buildonly-randconfig-005-20251009    clang-20
x86_64      buildonly-randconfig-006-20251009    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251009    gcc-14
x86_64                randconfig-072-20251009    gcc-14
x86_64                randconfig-073-20251009    gcc-14
x86_64                randconfig-074-20251009    gcc-14
x86_64                randconfig-075-20251009    gcc-14
x86_64                randconfig-076-20251009    gcc-14
x86_64                randconfig-077-20251009    gcc-14
x86_64                randconfig-078-20251009    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251009    clang-22
xtensa                randconfig-001-20251010    gcc-9.5.0
xtensa                randconfig-002-20251009    clang-22
xtensa                randconfig-002-20251010    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


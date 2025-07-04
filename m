Return-Path: <linux-media+bounces-36762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD4AF89A1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8171C87B3C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D98127F74C;
	Fri,  4 Jul 2025 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StikYP4J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBF1F5838
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614644; cv=none; b=ZcvDaCfMRFWKNkiZKpI23bwg9EBBXGFM2grihgOOWXT2/5hkhH78OZbzH/tOiM6XUBAJ2XZY1iDa4B/wcNTGum/5fdGu9hUv3F6zAtxEI8fQr7da+ZsBO34K6VmVElhBdpuCReh3uqby5X7IfQZD2rEurQlVucU91KKdLxeQg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614644; c=relaxed/simple;
	bh=Ao6eVQZ6KMseJg02tWLT3+BSILzZm/PlIiE+rzjnR8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UQ8R8NFz3NKV0/PB5RpSTJ5EsDiD0r+ZQHvBF/35hTbf2v4RAEkOA2YjyHp6z9f6eh02gz8FYJcy0ULCmvvHsnT5oikyszIr9kf9ceBn1bTqhPhuAXj8dv/eG8IY/5gcWc9dZdQlDVJxYOe61r/41KZ3/bVbOme3nGv9TdnEWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StikYP4J; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751614643; x=1783150643;
  h=date:from:to:cc:subject:message-id;
  bh=Ao6eVQZ6KMseJg02tWLT3+BSILzZm/PlIiE+rzjnR8U=;
  b=StikYP4JyUNF44gM7f3kblk30Nu5ZYgtUwiNjbgGLf/N7T7HWIZHhCJ5
   fvDek47WcK8sPMYwekMV8tviELHjzhGNYjXa+1W9e1xHzuxkYZNnC4qfb
   +/x+UUX7cSXP8g8ofcc+hxSD+PJUyzdSBdROkpGxFk4NtabKMUlQoONv6
   MdO6bc5NHVoeqHf/bZsA362G913vA+tyz78HBoW03vnHgIIcy9UDplj99
   sJIMGjP7aakntptLreK1oLuPALyCMV3aFDo3GYXKzj8lDH+ZKXMbJxsFp
   xujRn+G2I9zQBPFaPvt2MacS8ib1do/TeivwX51KEVpiRt/f5qNirvUTP
   g==;
X-CSE-ConnectionGUID: 4Zw4Gz8jRxq3evEXvXp5UA==
X-CSE-MsgGUID: HEGGzz2YSf6za1xYNYZTZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57619927"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="57619927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:37:22 -0700
X-CSE-ConnectionGUID: uK5Bi17RSOKL2GY4OnDAew==
X-CSE-MsgGUID: eEqtQkTHRrSjq4g8vXYCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="185530649"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2025 00:37:22 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXaz1-0003SF-2f;
	Fri, 04 Jul 2025 07:37:19 +0000
Date: Fri, 04 Jul 2025 15:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067
Message-ID: <202507041523.59PQ0gCB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c26e8dcd9d4e86d788c5bf7a5dd0ea70a95ab067  media: qcom: camss: Remove extraneous -supply postfix on supply names

elapsed time: 1088m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                      axs103_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250703    gcc-11.5.0
arc                   randconfig-002-20250703    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250703    clang-21
arm                   randconfig-002-20250703    gcc-8.5.0
arm                   randconfig-003-20250703    clang-17
arm                   randconfig-004-20250703    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250703    clang-21
arm64                 randconfig-002-20250703    gcc-14.3.0
arm64                 randconfig-003-20250703    clang-21
arm64                 randconfig-004-20250703    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250703    gcc-14.3.0
csky                  randconfig-002-20250703    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250703    clang-21
hexagon               randconfig-002-20250703    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250703    clang-20
i386        buildonly-randconfig-002-20250703    gcc-12
i386        buildonly-randconfig-003-20250703    gcc-12
i386        buildonly-randconfig-004-20250703    clang-20
i386        buildonly-randconfig-005-20250703    gcc-12
i386        buildonly-randconfig-006-20250703    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250703    clang-18
loongarch             randconfig-002-20250703    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250703    gcc-8.5.0
nios2                 randconfig-002-20250703    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250703    gcc-8.5.0
parisc                randconfig-002-20250703    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250703    gcc-10.5.0
powerpc               randconfig-002-20250703    clang-21
powerpc               randconfig-003-20250703    gcc-8.5.0
powerpc64             randconfig-001-20250703    clang-18
powerpc64             randconfig-002-20250703    clang-21
powerpc64             randconfig-003-20250703    gcc-14.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250703    gcc-13.4.0
riscv                 randconfig-002-20250703    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250703    gcc-12.4.0
s390                  randconfig-002-20250703    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250703    gcc-9.3.0
sh                    randconfig-002-20250703    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250703    gcc-8.5.0
sparc                 randconfig-002-20250703    gcc-13.4.0
sparc64               randconfig-001-20250703    gcc-8.5.0
sparc64               randconfig-002-20250703    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250703    gcc-12
um                    randconfig-002-20250703    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250703    gcc-11
x86_64      buildonly-randconfig-002-20250703    gcc-12
x86_64      buildonly-randconfig-003-20250703    clang-20
x86_64      buildonly-randconfig-004-20250703    clang-20
x86_64      buildonly-randconfig-005-20250703    gcc-12
x86_64      buildonly-randconfig-006-20250703    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250703    gcc-14.3.0
xtensa                randconfig-002-20250703    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


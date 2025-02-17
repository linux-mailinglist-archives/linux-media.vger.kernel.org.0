Return-Path: <linux-media+bounces-26200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81907A37BAD
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 07:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EC083ABA8A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 06:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5420618FDAE;
	Mon, 17 Feb 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLAadkAB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185118A95A
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 06:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775057; cv=none; b=CClYNvdlHpGZuQ3o50qG4WilArVVa/gK3331ueeFlV9gScwgs2bcRjfZH5Ad76dBI4N+mQUoQlNJy9QiCtjH+/zRXvKqxHJ4loBSTd/y+AlEF7mDpT1dYtrn0k07WWfvKsfJRcW24psh7ToKmVf2+kymkCRaFuWMpLz/0whp1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775057; c=relaxed/simple;
	bh=9I1WQ+8QUjcIxMqpVIBfe3c0dHAqo3/erzzXQao64Ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WgZWihImp6Mc8HVn4Q2mL/5V54GExddYNPwrHlE2KF6sUMNYZeshm5wTKSjkmxrhHFzLk+8b3pAOYLyW5ekYfPiTXIqp539cTm1DGZAflzZ1EeOCVdmNGi7CRqDwkRJSxJmbJDYHekiIhq/2CkeCBsjEiEgAg734oTLaKo5wQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLAadkAB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739775056; x=1771311056;
  h=date:from:to:cc:subject:message-id;
  bh=9I1WQ+8QUjcIxMqpVIBfe3c0dHAqo3/erzzXQao64Ng=;
  b=WLAadkABLa038RMr5JOlstD1U7dYl+A/Gnt54Va66knmqK7PaHhSYgXx
   fyl+OzYiVXtXfehj3NJKPwWiXePer5U91RXdLf/42sYRxWaFnOtSMk6+z
   +qAbxG6bWH2t+58gwOAD7HQuVSFKE/IVMQVHTGdP+54uCtHcLjjZBCsZ+
   QO7ZXMesmMVD5Ug5QCwVh44ZnOnKDr9Ckm3AHtxQx+620fl5q0HGba6Dm
   K90/rQhJU4U6Cm+oZZicUqQfplOdjAISrPPQcYEm324p5Mu/SdbJc4dZf
   bR4EdiRvLrb+9LHoh+/mCq3Sh95tIuq/4DlGF3UHyxAAPVnCiKO2AmAbv
   g==;
X-CSE-ConnectionGUID: DFG0dHcaS5G7Rvio/FMlTQ==
X-CSE-MsgGUID: QfAz1FTIRUm/dKYJHnve5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65801702"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="65801702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 22:50:54 -0800
X-CSE-ConnectionGUID: sX1k2uEETnyXGTUVNVXFnw==
X-CSE-MsgGUID: shMdI5eBS1upfXojcq5rIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118183950"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2025 22:50:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjuxv-001ChP-0u;
	Mon, 17 Feb 2025 06:50:51 +0000
Date: Mon, 17 Feb 2025 14:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 96754c7302bab2ec9d9227baeb84a7bc68f1b725
Message-ID: <202502171432.N6xUYNNw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 96754c7302bab2ec9d9227baeb84a7bc68f1b725  media: omap3isp: Use syscon_regmap_lookup_by_phandle_args

elapsed time: 1188m

configs tested: 138
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250216    gcc-13.2.0
arc                   randconfig-002-20250216    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                            qcom_defconfig    clang-17
arm                   randconfig-001-20250216    gcc-14.2.0
arm                   randconfig-002-20250216    gcc-14.2.0
arm                   randconfig-003-20250216    gcc-14.2.0
arm                   randconfig-004-20250216    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250216    gcc-14.2.0
arm64                 randconfig-002-20250216    clang-21
arm64                 randconfig-003-20250216    gcc-14.2.0
arm64                 randconfig-004-20250216    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250216    gcc-14.2.0
csky                  randconfig-002-20250216    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250216    clang-15
hexagon               randconfig-002-20250216    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250216    gcc-12
i386        buildonly-randconfig-002-20250216    gcc-12
i386        buildonly-randconfig-003-20250216    clang-19
i386        buildonly-randconfig-004-20250216    gcc-12
i386        buildonly-randconfig-005-20250216    gcc-12
i386        buildonly-randconfig-006-20250216    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250216    gcc-14.2.0
loongarch             randconfig-002-20250216    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250216    gcc-14.2.0
nios2                 randconfig-002-20250216    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250216    gcc-14.2.0
parisc                randconfig-002-20250216    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    clang-21
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250216    gcc-14.2.0
powerpc               randconfig-002-20250216    gcc-14.2.0
powerpc               randconfig-003-20250216    gcc-14.2.0
powerpc64             randconfig-001-20250216    gcc-14.2.0
powerpc64             randconfig-002-20250216    gcc-14.2.0
powerpc64             randconfig-003-20250216    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250216    clang-21
riscv                 randconfig-002-20250216    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250216    clang-19
s390                  randconfig-002-20250216    clang-17
s390                       zfcpdump_defconfig    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                         apsh4a3a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250216    gcc-14.2.0
sh                    randconfig-002-20250216    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250216    gcc-14.2.0
sparc                 randconfig-002-20250216    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250216    gcc-14.2.0
sparc64               randconfig-002-20250216    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250216    gcc-12
um                    randconfig-002-20250216    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250216    clang-19
x86_64      buildonly-randconfig-002-20250216    gcc-12
x86_64      buildonly-randconfig-003-20250216    gcc-12
x86_64      buildonly-randconfig-004-20250216    gcc-12
x86_64      buildonly-randconfig-005-20250216    gcc-12
x86_64      buildonly-randconfig-006-20250216    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250216    gcc-14.2.0
xtensa                randconfig-002-20250216    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


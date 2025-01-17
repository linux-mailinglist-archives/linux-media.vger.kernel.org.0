Return-Path: <linux-media+bounces-24879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB38A150A4
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 14:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63CE21884F9C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 13:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921EF1FF7D8;
	Fri, 17 Jan 2025 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKHCvza6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E1149DF4
	for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737121127; cv=none; b=nueGMogzYeirW4W/Rrlt0InkgsuRwe9YSvQ0QkmBuDOCmJPB4CWt5G1CUsLkszYXyBCkxqOK68jd5fdJGFaw50K4YFXOIM0+6m2zRyWZbFa85voD9QO5KZlP+HVs31p7X22RjCITY0m1wLI7fi0+1ASYzkASlSN7Mqd0wGFRYEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737121127; c=relaxed/simple;
	bh=pzxXS5JHWXq+4LtzhG14KSYXevYQfYiPtMpf6VWelvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dCK5fggoIu1fdfjWhGmkpTE2e5vLsjrj654TUAd5fdAl7GB07UvUWYkkUTIeYVGLlqEDdgDZuK8INilwjwVMnKordaBdKU2xpiWoDV8McNfvxeayuTOuOk3LXR1dEX3jjFslWFV//wtB3//ApKTqNnJc2jFzmJf9XNCG7Dntkk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKHCvza6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737121125; x=1768657125;
  h=date:from:to:cc:subject:message-id;
  bh=pzxXS5JHWXq+4LtzhG14KSYXevYQfYiPtMpf6VWelvo=;
  b=CKHCvza6eayQxkA62/sUa/tpiwcq1YegYPPS1Bmeqbix6wrrukj3JnKa
   KCUH/6YTbOD4SQsuvoh978oV8mJHNXlJdnyRf3eR9gnHsQRPBwAZ0JeJc
   cQ25FzSDVDS8l8dCL6KNieRVQhQ2KLbgsCRNonI+v9GwW+DssOjdl+fKZ
   FjHCegfsJ+UndsZvlpiuupJrPsZfT0c/cpWRyShOCwyR5oRXz1Da/OjiP
   d7OPSeej80Mu54qhHn/1aE/WCb1Qn9zgRGfhs84o+8OEYTi8dZsUXlzHh
   ilA60e2OrWdFLBndFnANPo7CwzFDEPrDmcwPRwdjkdxS3k/7JtWhnvh6t
   w==;
X-CSE-ConnectionGUID: LIjXwzBKTn29B6HyfEXeng==
X-CSE-MsgGUID: GmMuabj1S/OYzIXrdLFnAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36831808"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="36831808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:38:45 -0800
X-CSE-ConnectionGUID: CF7zB5ukQZq9kxsw0GzWtA==
X-CSE-MsgGUID: 8oz0HqlIROaf1F8P7vpnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136693450"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2025 05:38:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYmYc-000TGR-0U;
	Fri, 17 Jan 2025 13:38:42 +0000
Date: Fri, 17 Jan 2025 21:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 73ea5f5031499252f43ad046de42a9c6efea81b6
Message-ID: <202501172158.rhoa0aL0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 73ea5f5031499252f43ad046de42a9c6efea81b6  media: stm32: dcmipp: add has_csi2 & needs_mclk in match data

elapsed time: 1443m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250116    gcc-13.2.0
arc                   randconfig-002-20250116    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-15
arm                   randconfig-001-20250116    gcc-14.2.0
arm                   randconfig-002-20250116    clang-15
arm                   randconfig-003-20250116    gcc-14.2.0
arm                   randconfig-004-20250116    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250116    gcc-14.2.0
arm64                 randconfig-002-20250116    gcc-14.2.0
arm64                 randconfig-003-20250116    clang-15
arm64                 randconfig-004-20250116    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250116    gcc-14.2.0
csky                  randconfig-002-20250116    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250116    clang-20
hexagon               randconfig-002-20250116    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250116    clang-19
i386        buildonly-randconfig-002-20250116    clang-19
i386        buildonly-randconfig-003-20250116    clang-19
i386        buildonly-randconfig-004-20250116    clang-19
i386        buildonly-randconfig-005-20250116    clang-19
i386        buildonly-randconfig-006-20250116    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250116    gcc-14.2.0
loongarch             randconfig-002-20250116    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250116    gcc-14.2.0
nios2                 randconfig-002-20250116    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250116    gcc-14.2.0
parisc                randconfig-002-20250116    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250116    clang-20
powerpc               randconfig-002-20250116    gcc-14.2.0
powerpc               randconfig-003-20250116    clang-20
powerpc64             randconfig-001-20250116    clang-19
powerpc64             randconfig-002-20250116    clang-20
powerpc64             randconfig-003-20250116    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250116    gcc-14.2.0
riscv                 randconfig-002-20250116    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250116    gcc-14.2.0
s390                  randconfig-002-20250116    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250116    gcc-14.2.0
sh                    randconfig-002-20250116    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250116    gcc-14.2.0
sparc                 randconfig-002-20250116    gcc-14.2.0
sparc64               randconfig-001-20250116    gcc-14.2.0
sparc64               randconfig-002-20250116    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250116    clang-19
um                    randconfig-002-20250116    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250116    gcc-12
x86_64      buildonly-randconfig-002-20250116    gcc-12
x86_64      buildonly-randconfig-003-20250116    gcc-12
x86_64      buildonly-randconfig-004-20250116    clang-19
x86_64      buildonly-randconfig-005-20250116    clang-19
x86_64      buildonly-randconfig-006-20250116    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250116    gcc-14.2.0
xtensa                randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


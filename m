Return-Path: <linux-media+bounces-34376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E5AD29C7
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 00:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9D997A14F8
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 22:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15B1225412;
	Mon,  9 Jun 2025 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeHWQoas"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C838225401
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509589; cv=none; b=M8jL5j1ufBc1HcmR8dA5J/wzcbsaRbnACnc5KhcylTOZjOmt8y7EJhkICpzaFKhl7ZMlrikpAdXvgmoNuAj4+bVQ5nBB/T/fMhLUiXrUWnMSPU5JnnaPI6VWyXU1i1s/jypYF0S2szwCOddGAuU8RWHbKaeKCIJvJM8K4AOTEWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509589; c=relaxed/simple;
	bh=cYk9V30wUMtaFebCqvsiGvTiFYNDnzdRlcMdMjvD1zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ecah1c3E/Y2fSpNzZ2TmHDB2wUTIrzLTqcsYfSTYafxW8+4F2NRl7pI2LpKPRxBD2MLEBe/WtXEu5f27pNEny6qNeamVpb2KRGQtBgKOz7GN6FDLLqVKBirMoIfDgrXGqZDvxAO0gQilhnEG+yD7etEAgw1kgR9YE4hqn3CV2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeHWQoas; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749509587; x=1781045587;
  h=date:from:to:cc:subject:message-id;
  bh=cYk9V30wUMtaFebCqvsiGvTiFYNDnzdRlcMdMjvD1zw=;
  b=DeHWQoasOGBObT3EgetNHsrDIjnwLABD2fWgs+ycCFRjcG6ypwRZ4AhV
   NSMPDslvSih3oJx8BSK6kNDcZ1meKjCh9tJXvYjWlpUP7GcT3bfaS7xog
   A4FkgtiN8YGo6UP9khLiJi9lsKMIvNtJh46RgzWOjrOXxAqf4ww5vjgHM
   3m1n3JiFkP963gLllx3ShDOavtN+qBrd2luTtAwlP5apKmpgUa5+9Sj2v
   O85Uj5L5/OYiBWJWQ4aoeyKCfiUF+cGKZWxt6eOo2ispO+pwjH+Syhavo
   Yx92sXJt5lR9F2lwzDFXrocps92/woqBpljWd9b+Q97/DSBKpltyGjCel
   A==;
X-CSE-ConnectionGUID: RMu608FXQQKGAMpenjqoYw==
X-CSE-MsgGUID: ZZjeYtJhRQGvTx6KOknv8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39219709"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="39219709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 15:53:07 -0700
X-CSE-ConnectionGUID: eejAL9SbQj6ZxQTMdELJJg==
X-CSE-MsgGUID: kibQb39DRoSjOPagjnn1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151789487"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2025 15:53:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOlMV-0007U5-39;
	Mon, 09 Jun 2025 22:53:03 +0000
Date: Tue, 10 Jun 2025 06:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 7b033011b27be9621f15d7a0dfe05a723d1258da
Message-ID: <202506100619.I9yEyLwo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 7b033011b27be9621f15d7a0dfe05a723d1258da  media: ipu3-cio2: Use V4L2 subdev active state

elapsed time: 732m

configs tested: 189
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250609    gcc-12.4.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250609    gcc-10.5.0
arc                   randconfig-002-20250610    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                     davinci_all_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-21
arm                      integrator_defconfig    gcc-15.1.0
arm                         lpc18xx_defconfig    clang-21
arm                         lpc32xx_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250609    clang-21
arm                   randconfig-001-20250610    gcc-12.4.0
arm                   randconfig-002-20250609    clang-17
arm                   randconfig-002-20250610    gcc-12.4.0
arm                   randconfig-003-20250609    clang-21
arm                   randconfig-003-20250610    gcc-12.4.0
arm                   randconfig-004-20250609    gcc-7.5.0
arm                   randconfig-004-20250610    gcc-12.4.0
arm                             rpc_defconfig    gcc-15.1.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250609    clang-21
arm64                 randconfig-001-20250610    gcc-12.4.0
arm64                 randconfig-002-20250609    clang-21
arm64                 randconfig-002-20250610    gcc-12.4.0
arm64                 randconfig-003-20250609    gcc-14.3.0
arm64                 randconfig-003-20250610    gcc-12.4.0
arm64                 randconfig-004-20250609    gcc-9.5.0
arm64                 randconfig-004-20250610    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250609    gcc-15.1.0
csky                  randconfig-002-20250609    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250609    clang-20
hexagon               randconfig-002-20250609    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250609    clang-20
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-002-20250609    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-003-20250609    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-004-20250609    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-005-20250609    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-006-20250609    gcc-12
i386        buildonly-randconfig-006-20250610    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250610    clang-20
i386                  randconfig-002-20250610    clang-20
i386                  randconfig-003-20250610    clang-20
i386                  randconfig-004-20250610    clang-20
i386                  randconfig-005-20250610    clang-20
i386                  randconfig-006-20250610    clang-20
i386                  randconfig-007-20250610    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250609    gcc-15.1.0
loongarch             randconfig-002-20250609    gcc-12.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         amcore_defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
m68k                            q40_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                 randconfig-001-20250609    gcc-5.5.0
nios2                 randconfig-002-20250609    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250609    gcc-6.5.0
parisc                randconfig-002-20250609    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      ep88xc_defconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250609    clang-21
powerpc               randconfig-002-20250609    clang-21
powerpc               randconfig-003-20250609    gcc-9.3.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250609    clang-21
powerpc64             randconfig-002-20250609    clang-21
powerpc64             randconfig-003-20250609    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250609    gcc-12.4.0
riscv                 randconfig-001-20250610    gcc-9.3.0
riscv                 randconfig-002-20250609    clang-21
riscv                 randconfig-002-20250610    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250609    clang-21
s390                  randconfig-001-20250610    gcc-9.3.0
s390                  randconfig-002-20250609    clang-21
s390                  randconfig-002-20250610    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250609    gcc-11.5.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250609    gcc-13.3.0
sh                    randconfig-002-20250610    gcc-9.3.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250609    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-9.3.0
sparc                 randconfig-002-20250609    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-9.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250609    gcc-12.4.0
sparc64               randconfig-001-20250610    gcc-9.3.0
sparc64               randconfig-002-20250609    gcc-9.3.0
sparc64               randconfig-002-20250610    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250609    clang-21
um                    randconfig-001-20250610    gcc-9.3.0
um                    randconfig-002-20250609    gcc-12
um                    randconfig-002-20250610    gcc-9.3.0
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250609    clang-20
x86_64      buildonly-randconfig-002-20250609    gcc-12
x86_64      buildonly-randconfig-003-20250609    clang-20
x86_64      buildonly-randconfig-004-20250609    clang-20
x86_64      buildonly-randconfig-005-20250609    clang-20
x86_64      buildonly-randconfig-006-20250609    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250609    gcc-11.5.0
xtensa                randconfig-001-20250610    gcc-9.3.0
xtensa                randconfig-002-20250609    gcc-15.1.0
xtensa                randconfig-002-20250610    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


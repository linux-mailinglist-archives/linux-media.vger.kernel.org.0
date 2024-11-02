Return-Path: <linux-media+bounces-20709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 330779B9B96
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 01:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B810B1F21E73
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 00:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CDE1CAAC;
	Sat,  2 Nov 2024 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWcZ5QEp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01904A920
	for <linux-media@vger.kernel.org>; Sat,  2 Nov 2024 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730507952; cv=none; b=eJSW0xWOouCDvyP8tXFYsIk5d2jk80thPX3A23MWi3rKyb+Kcc0Y07tRiX8Ajz08h7ZPtqSIrNmDQon+ee27RNvVgyEkoBGvxHmgvYuweHFH5L84mUiot2+H4OMAYOjMlhZnEUt3CA+fkGe5/Uj9VcmJ7opTn/FblNwQrkfqb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730507952; c=relaxed/simple;
	bh=XuxkeI/gv4i3e7muKcCM2A4+iPF3sfMDU1QmWr4f/ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9hfeVyf3dkuMA3WQGzW32n9ttt2g/xXkgYGNNWQDjYLSsxYzM4e3EjwtQ+Jc1BeEAI4Bhqn5qvtOyErd0dIR/h/jnc8mNnKIAI7R8BFPkW3buwIuDJ0w0ryaqBgQt71eyC4mD2dTRl/3N8J6e/jP/t9krebG0AAxN3ohpogKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWcZ5QEp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730507951; x=1762043951;
  h=date:from:to:cc:subject:message-id;
  bh=XuxkeI/gv4i3e7muKcCM2A4+iPF3sfMDU1QmWr4f/ug=;
  b=cWcZ5QEptia5zuDad1+hQSBHLQdO1G1DTJdxXzDqbViBy1DtD4iKKkfX
   k8sxyoTPcO+prOqIbxZ6F5geuErjOo26nbC9TXq0IWR8oCen92gKdRPdd
   yGaCCBHL/Qq2NUoY/mpCb66WzL0Vup08Uw8ZpgPIfbBN9yDhWTL8Zjp/W
   eUaA7D4/isreOxZmvenWjbi2B2wYlb3gFF/FnGq3wtV6jE00o1RS4SXUl
   6AiiGhXKPaFPEPmcxldAazMbYtlePUiWZMU4Zm3j3qxgsxennfCaaVy9e
   9geRZ6wZFmid8U1jz/yBrOnpAr0lEvprn/RIwowbepKL7vgR4LXPO3zZ4
   w==;
X-CSE-ConnectionGUID: 4UWxrwStQIiHR9lAVUC26w==
X-CSE-MsgGUID: TqEEGOwISRORK0m2mxwR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="17908446"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="17908446"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 17:39:08 -0700
X-CSE-ConnectionGUID: jnfVDTe3RMCJpDNUwRCPeQ==
X-CSE-MsgGUID: h2mVC+iUTxiuYRTgOVLPdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="120582118"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2024 17:39:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t72AS-000iEF-2l;
	Sat, 02 Nov 2024 00:39:04 +0000
Date: Sat, 02 Nov 2024 08:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 c7ccf3683ac9746b263b0502255f5ce47f64fe0a
Message-ID: <202411020815.PZK3jXn3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: c7ccf3683ac9746b263b0502255f5ce47f64fe0a  media: ati_remote: don't push static constants on stack for %*ph

elapsed time: 753m

configs tested: 108
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                           tb10x_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                        multi_v5_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241102    gcc-12
i386        buildonly-randconfig-002-20241102    gcc-12
i386        buildonly-randconfig-003-20241102    gcc-12
i386        buildonly-randconfig-004-20241102    gcc-12
i386        buildonly-randconfig-005-20241102    gcc-12
i386        buildonly-randconfig-006-20241102    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241102    gcc-12
i386                  randconfig-002-20241102    gcc-12
i386                  randconfig-003-20241102    gcc-12
i386                  randconfig-004-20241102    gcc-12
i386                  randconfig-005-20241102    gcc-12
i386                  randconfig-006-20241102    gcc-12
i386                  randconfig-011-20241102    gcc-12
i386                  randconfig-012-20241102    gcc-12
i386                  randconfig-013-20241102    gcc-12
i386                  randconfig-014-20241102    gcc-12
i386                  randconfig-015-20241102    gcc-12
i386                  randconfig-016-20241102    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5307c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
nios2                            alldefconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                    mvme5100_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                        sh7785lcr_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                          iss_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


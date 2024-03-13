Return-Path: <linux-media+bounces-6917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16587A017
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 01:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF7A1F23408
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 00:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C35399;
	Wed, 13 Mar 2024 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjKsU9xR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE416383
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288990; cv=none; b=hUvEtpOcvTvXCD79LwIH3xnOsMAjjuJ7EGu5NjJXqoN0MOi6KPKSTP3N88I9XlYuvjCSCeMy4OSXk1reuQGjiAyN/FJJDUNstzBnEtFgOTIBiU5l80nppge7rsRLpj1gsmG412GvNHzxT+yNQQZY0KOrhQQmrmwa+r+x0fi7Gp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288990; c=relaxed/simple;
	bh=u/Ynjxg5vzVkULHpV+Tph/C+i5A1JrmOlGesM5Qr5IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GpjJq0KGPuaWb9Sxy4OJgmFEYxsb3hBjy6Nx4P4tocEgKTeJc4MOyzOzaoBcutnIn0BLwrbG9J96foNGTHBBcW/SLLp2mOA8uWuv0PNXO6oRNpiTAQ4qUMnzjLP9HVPAr9KNICZBzSJ5hHdhqUwyR5m56lrY/YRInA6jDbxHtJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjKsU9xR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710288989; x=1741824989;
  h=date:from:to:cc:subject:message-id;
  bh=u/Ynjxg5vzVkULHpV+Tph/C+i5A1JrmOlGesM5Qr5IU=;
  b=RjKsU9xRo08JPyTrbtGvdqumQGg3ax8I7RunPLbj7ENbsucKO9A8/0Uf
   aCIkjcvtzo5sZ5s0n4smVXPDYDbQsPM8P4Uevv687QPGM4+7E7RSKdhH+
   fyTUGDQ2Wq1HJHJJMrwFJZwKyHPJ82XRsLP4L47lOxdBrLtqkKnKTxMcH
   fYJ+sm7n8adBdQLdnJ49NSf72Z2zKesrRodQ5p3CAcNVfrW1f7ETdmnT1
   MrekvXFWFDOD+rPM1rn9hqx5zYZPmNllOlcpI4+ADEEH5XLoAgBK88qCA
   xA6psDH4fQUvPFq7NIHItuZ4EZgNGR0OfiecV8ArszfYtesVeg+iYZRn+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4959197"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4959197"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 17:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11758947"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2024 17:16:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkCIC-000Bol-0p;
	Wed, 13 Mar 2024 00:16:24 +0000
Date: Wed, 13 Mar 2024 08:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD SUCCESS
 18d0208c13b2e2d24cdd07b3b97b884570036df9
Message-ID: <202403130809.KH56lGeV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: 18d0208c13b2e2d24cdd07b3b97b884570036df9  media: Documentation: Document media device memory safety helper

elapsed time: 728m

configs tested: 180
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240312   gcc  
arc                   randconfig-002-20240312   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240312   clang
arm                   randconfig-002-20240312   gcc  
arm                   randconfig-003-20240312   gcc  
arm                   randconfig-004-20240312   clang
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240312   gcc  
arm64                 randconfig-002-20240312   gcc  
arm64                 randconfig-003-20240312   gcc  
arm64                 randconfig-004-20240312   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240312   gcc  
csky                  randconfig-002-20240312   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240312   clang
hexagon               randconfig-002-20240312   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240312   gcc  
i386         buildonly-randconfig-002-20240312   gcc  
i386         buildonly-randconfig-003-20240312   gcc  
i386         buildonly-randconfig-004-20240312   gcc  
i386         buildonly-randconfig-005-20240312   clang
i386         buildonly-randconfig-006-20240312   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240312   gcc  
i386                  randconfig-002-20240312   clang
i386                  randconfig-003-20240312   gcc  
i386                  randconfig-004-20240312   gcc  
i386                  randconfig-005-20240312   gcc  
i386                  randconfig-006-20240312   gcc  
i386                  randconfig-011-20240312   gcc  
i386                  randconfig-012-20240312   gcc  
i386                  randconfig-013-20240312   clang
i386                  randconfig-014-20240312   clang
i386                  randconfig-015-20240312   gcc  
i386                  randconfig-016-20240312   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240312   gcc  
loongarch             randconfig-002-20240312   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                           ip32_defconfig   clang
mips                          rb532_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240312   gcc  
nios2                 randconfig-002-20240312   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240312   gcc  
parisc                randconfig-002-20240312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc               randconfig-001-20240312   gcc  
powerpc               randconfig-002-20240312   clang
powerpc               randconfig-003-20240312   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240312   clang
powerpc64             randconfig-002-20240312   clang
powerpc64             randconfig-003-20240312   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240312   clang
riscv                 randconfig-002-20240312   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240312   clang
s390                  randconfig-002-20240312   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240312   gcc  
sh                    randconfig-002-20240312   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240312   gcc  
sparc64               randconfig-002-20240312   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240312   gcc  
um                    randconfig-002-20240312   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240312   clang
x86_64       buildonly-randconfig-002-20240312   clang
x86_64       buildonly-randconfig-003-20240312   clang
x86_64       buildonly-randconfig-004-20240312   clang
x86_64       buildonly-randconfig-005-20240312   gcc  
x86_64       buildonly-randconfig-006-20240312   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240312   clang
x86_64                randconfig-002-20240312   clang
x86_64                randconfig-003-20240312   gcc  
x86_64                randconfig-004-20240312   gcc  
x86_64                randconfig-005-20240312   gcc  
x86_64                randconfig-006-20240312   clang
x86_64                randconfig-011-20240312   gcc  
x86_64                randconfig-012-20240312   clang
x86_64                randconfig-013-20240312   gcc  
x86_64                randconfig-014-20240312   gcc  
x86_64                randconfig-015-20240312   clang
x86_64                randconfig-016-20240312   clang
x86_64                randconfig-071-20240312   gcc  
x86_64                randconfig-072-20240312   gcc  
x86_64                randconfig-073-20240312   clang
x86_64                randconfig-074-20240312   gcc  
x86_64                randconfig-075-20240312   gcc  
x86_64                randconfig-076-20240312   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240312   gcc  
xtensa                randconfig-002-20240312   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-12492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506408FA8BC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F7F1C2350C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 03:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE71913D2B7;
	Tue,  4 Jun 2024 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdajcGyg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C633F6
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 03:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717471307; cv=none; b=eKrnbrkU/ydbnQSLD2TcMz5wq1kmqssel8iCQ9JacuSLI6mjc6LY74PGgpJBE2IjTc4KpplEiBFWrNnScsUHNuzIZig13h4FCJSWAHF0CR3gSYA3Zmifyrbyn7O8aYEp0YSArxy2SXHRITmS3wCYECtLeh6RJh6X8ZGqylhgi8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717471307; c=relaxed/simple;
	bh=vV1o19JP0XPfW3qBlb1HMJ6ss5A2+R7PFgQn4GL/8I0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dSgDOBHEpyhA0VYmLNTiE50ryBvYIyaEEQ8a42HoY31u76xhI8cacuZM6bz1DMqCMabIpRRYN/+hanxCX7UzR8udDqaAzUaflSbBo2Trik6Tj2AvO81DIFwurshSNiDMbw3LdysBBrsms87i4RWce9X+h5zCi/83IUNtu0QEpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdajcGyg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717471306; x=1749007306;
  h=date:from:to:cc:subject:message-id;
  bh=vV1o19JP0XPfW3qBlb1HMJ6ss5A2+R7PFgQn4GL/8I0=;
  b=hdajcGygRETFgmGEsrsKp+vAEGQH/lIA3NwJk6yGKB5v0Lazdy9u5l0W
   oeEwc1SvVSAJGLIi/rz6bwXOMw94eHUBfQ1al+g8m+jgXOs9rVlTO5YXV
   Fic8qgTSFMFkrhjlqGXDpJUalzA7rx05JYLK7le7u47RJe70oJ/ClnPXj
   X2752WPr723C+ESxTrhpunNs8r7AUqMeuYFj41xURxSm8Ks2PFY6EsVDd
   /RK/RiFJzYJeHOPBvvXm9ZA0CEimdmKHWSQ/DMoBAqikWTPx3Z07PukR6
   7y4aeRSyQnd38Z0bjrzqzieq4+Rhs2MohVJnXtXm8kGqxhJD0oFRi58Bb
   A==;
X-CSE-ConnectionGUID: sVc+jV96RBefTULZBj/8Cw==
X-CSE-MsgGUID: UnEdxQcnQJu0kZsoU89SMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17827415"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="17827415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 20:21:45 -0700
X-CSE-ConnectionGUID: 9P+xYDPVTy+pyaDL9Fnzyg==
X-CSE-MsgGUID: KixPv/cMS6SKuX2lYr0OxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37203021"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2024 20:21:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEKk1-000MVN-1w;
	Tue, 04 Jun 2024 03:21:41 +0000
Date: Tue, 04 Jun 2024 11:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:test] BUILD SUCCESS
 b343f7f791d61ed0942a8a25cb716b525d932cff
Message-ID: <202406041132.EkXFa7TD-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git test
branch HEAD: b343f7f791d61ed0942a8a25cb716b525d932cff  drivers: media: max96717: stop the csi receiver before the source

elapsed time: 1133m

configs tested: 182
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240603   gcc  
arc                   randconfig-002-20240603   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240603   gcc  
arm                   randconfig-002-20240603   gcc  
arm                   randconfig-003-20240603   gcc  
arm                   randconfig-004-20240603   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240603   gcc  
arm64                 randconfig-002-20240603   gcc  
arm64                 randconfig-003-20240603   clang
arm64                 randconfig-004-20240603   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240603   gcc  
csky                  randconfig-002-20240603   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240603   clang
hexagon               randconfig-002-20240603   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240603   clang
i386         buildonly-randconfig-002-20240603   clang
i386         buildonly-randconfig-006-20240603   clang
i386                                defconfig   clang
i386                  randconfig-001-20240603   clang
i386                  randconfig-004-20240603   clang
i386                  randconfig-005-20240603   clang
i386                  randconfig-011-20240603   clang
i386                  randconfig-012-20240603   clang
i386                  randconfig-013-20240603   clang
i386                  randconfig-014-20240603   clang
i386                  randconfig-015-20240603   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240603   gcc  
loongarch             randconfig-002-20240603   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240603   gcc  
nios2                 randconfig-002-20240603   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240603   gcc  
parisc                randconfig-002-20240603   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       holly_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20240603   gcc  
powerpc               randconfig-002-20240603   gcc  
powerpc               randconfig-003-20240603   gcc  
powerpc64             randconfig-001-20240603   gcc  
powerpc64             randconfig-002-20240603   gcc  
powerpc64             randconfig-003-20240603   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240603   clang
riscv                 randconfig-002-20240603   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240603   clang
s390                  randconfig-002-20240603   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240603   gcc  
sh                    randconfig-002-20240603   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240603   gcc  
sparc64               randconfig-002-20240603   gcc  
um                               alldefconfig   clang
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240603   clang
um                    randconfig-002-20240603   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240603   gcc  
x86_64       buildonly-randconfig-002-20240603   gcc  
x86_64       buildonly-randconfig-003-20240603   gcc  
x86_64       buildonly-randconfig-004-20240603   clang
x86_64       buildonly-randconfig-005-20240603   clang
x86_64       buildonly-randconfig-006-20240603   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240603   gcc  
x86_64                randconfig-002-20240603   clang
x86_64                randconfig-003-20240603   clang
x86_64                randconfig-004-20240603   gcc  
x86_64                randconfig-005-20240603   gcc  
x86_64                randconfig-006-20240603   gcc  
x86_64                randconfig-011-20240603   gcc  
x86_64                randconfig-012-20240603   gcc  
x86_64                randconfig-013-20240603   clang
x86_64                randconfig-014-20240603   gcc  
x86_64                randconfig-015-20240603   gcc  
x86_64                randconfig-016-20240603   clang
x86_64                randconfig-071-20240603   clang
x86_64                randconfig-072-20240603   clang
x86_64                randconfig-073-20240603   clang
x86_64                randconfig-074-20240603   clang
x86_64                randconfig-075-20240603   gcc  
x86_64                randconfig-076-20240603   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240603   gcc  
xtensa                randconfig-002-20240603   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


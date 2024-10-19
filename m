Return-Path: <linux-media+bounces-19922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BBA9A51A0
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 00:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB10C1F21BC5
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 22:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AC9192B99;
	Sat, 19 Oct 2024 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaGRFjqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B998192B88
	for <linux-media@vger.kernel.org>; Sat, 19 Oct 2024 22:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729378209; cv=none; b=bV+Rr0wKFWOiEP9Vv57ch8bwUj0ufYgHMyA7wO5eROBtEMCPKTYYzB/w39mZZsqXvDNL9pMggqo7z4muuktE9/ipHjZs7guR6kIphbaA6SpWDKCktGFwwz7G2qNEzV66xoiND4NxCxv530Deh0cZ5aCGuvRXT9PXGTsoPIEY0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729378209; c=relaxed/simple;
	bh=/t3jGY7TcUfCiRFvNEad0LRCNsEwVNVJNaHj1E6eieY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDUAuhRkUOP2OgLy+v2ScNPhxpoNsrKLbJHJTbFgUtitYLkeNdgpWbne1xRZB5z/Eix2lzVMMzX2QAC/P9V9gJUfj29JbdnWTvPC0nrgDQ503lt/ADldOQq5J6CDqGqqtK/GCh3ZV7vro0u/PLm5UQa8o0jh3GCeW8e+8JIJ7/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaGRFjqs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729378206; x=1760914206;
  h=date:from:to:cc:subject:message-id;
  bh=/t3jGY7TcUfCiRFvNEad0LRCNsEwVNVJNaHj1E6eieY=;
  b=KaGRFjqsN5EF1rR19rUMcxNUzUtn/aqovgh7dz28oNXd5s3BemcRyl4o
   UKbyz9OJfrfJwNzupwDBIpc6NkT7IMzohTzmadyE4AqnZJiX8SFDc0lij
   MwxplSUEEZCYOIstjkXooRA80wTpdCweeBtmF696tT2H2xXmsE32q4D2q
   Vv4bWfaiyuVXQYlUhi/LgLwu6rrDWkWTdUZ8b4Kh93E1Q+W8vE0y5x4ax
   jUtohg7sYR4rod88uelGtuolHrWsShh7h/M0HccyNhKgTOfbndCH42xck
   A3ixWE2R/nC4BwFHlnn2SpGbCnvhiyJhC95pqFg9goG941B5kRh9WKvDF
   Q==;
X-CSE-ConnectionGUID: dJzdtCdgSQmXFMN7lXVmoQ==
X-CSE-MsgGUID: rk3zCMMJR1S4ZBtFsAKXwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40249527"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40249527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:50:05 -0700
X-CSE-ConnectionGUID: v7BkclvVQxOl5TnoXbTWog==
X-CSE-MsgGUID: khWPDWhRT3maf28q30tUmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="110014166"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2024 15:50:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2IGn-000Pcn-26;
	Sat, 19 Oct 2024 22:50:01 +0000
Date: Sun, 20 Oct 2024 06:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 698b6e3163bafd61e1b7d13572e2c42974ac85ec
Message-ID: <202410200648.ksFsBB7O-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 698b6e3163bafd61e1b7d13572e2c42974ac85ec  media: atomisp: Replace ternary operator with if

elapsed time: 1893m

configs tested: 129
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    gcc-14.1.0
arm                         bcm2835_defconfig    clang-20
arm                            dove_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm                          gemini_defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm                           sama5_defconfig    gcc-14.1.0
arm                           stm32_defconfig    gcc-14.1.0
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    clang-20
m68k                           sun3_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
mips                  cavium_octeon_defconfig    clang-20
mips                           ci20_defconfig    gcc-14.1.0
mips                          eyeq6_defconfig    clang-20
mips                           mtx1_defconfig    gcc-14.1.0
nios2                         3c120_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                   bluestone_defconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc                     tqm8540_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    clang-20
sh                         apsh4a3a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                           se7780_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                        sh7785lcr_defconfig    gcc-14.1.0
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241019    clang-18
x86_64      buildonly-randconfig-002-20241019    clang-18
x86_64      buildonly-randconfig-003-20241019    clang-18
x86_64      buildonly-randconfig-004-20241019    clang-18
x86_64      buildonly-randconfig-005-20241019    clang-18
x86_64      buildonly-randconfig-006-20241019    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241019    clang-18
x86_64                randconfig-002-20241019    clang-18
x86_64                randconfig-003-20241019    clang-18
x86_64                randconfig-004-20241019    clang-18
x86_64                randconfig-005-20241019    clang-18
x86_64                randconfig-006-20241019    clang-18
x86_64                randconfig-011-20241019    clang-18
x86_64                randconfig-012-20241019    clang-18
x86_64                randconfig-013-20241019    clang-18
x86_64                randconfig-014-20241019    clang-18
x86_64                randconfig-015-20241019    clang-18
x86_64                randconfig-016-20241019    clang-18
x86_64                randconfig-071-20241019    clang-18
x86_64                randconfig-072-20241019    clang-18
x86_64                randconfig-073-20241019    clang-18
x86_64                randconfig-074-20241019    clang-18
x86_64                randconfig-075-20241019    clang-18
x86_64                randconfig-076-20241019    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


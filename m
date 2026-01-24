Return-Path: <linux-media+bounces-51467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y3dXDLsndWl+BQEAu9opvQ
	(envelope-from <linux-media+bounces-51467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 21:12:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC3E7ED6D
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 21:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5796300334C
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 20:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A89727B327;
	Sat, 24 Jan 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMIvfs/D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93500212564
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769285558; cv=none; b=KqPNgTSjPkvqBnhh+So1PDE/zUkXRDgiCfthHHBPyXlysVougXte3+Th/ym4tFhGfAXRNaSDm6qveW3R3hD1b+qjnAOhButtOMM3tMpuOtf4b6qhoeoaFL2rCcypzlu9CMtbyNCbrupHojZzGgExvjNrUrkAiWn1nqmfUMDqWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769285558; c=relaxed/simple;
	bh=jqabG+G48RY1XFKkM/k/belOtbGjO9T+/Y34K3qy+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMH5pczkgv2w5w3hP18F6ZoRD3qiAjnaqZW8dypI5mm6pbGbOcVhT+VP1B6MoPBp/56UA2O9V/ZN9C7gg8GBQa9GgWdNbHpM2LuxfjgAjmkYc3tg9BPG8YoGrzOzhaARmlUrMFD3TO6PYK1HMFJZq5q2ZLUrEbnu+LpY5qZxA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMIvfs/D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769285557; x=1800821557;
  h=date:from:to:cc:subject:message-id;
  bh=jqabG+G48RY1XFKkM/k/belOtbGjO9T+/Y34K3qy+Xg=;
  b=OMIvfs/D9HCjnH05ykoRL5c4/qXV0lfcbI7H9ckLJ/Nb2qX88i588Q1V
   xA/QLcJGwhPG9RZsVdWiYvS7ua1ySa/YPdjBNzxiGPXbh+X2ML8O77sIG
   EiJrtM3X6RbNWpuxFc1jj1pKOtihStQXADJiHJLWRdwU6OHgE5c69rcrO
   Cs+1U2+zyfuAjFqJiBLeQL3LYZ0PHHy450h6+L4COFXR6Al806owRZZXg
   QHs2388TDx0+zqvks4xBhvnZTavYIQCONbKnXv8JXQuF/N6ATz1pa3i3/
   4hqKPzpeYxMytvLswbw8sOUJ6UFtNd7MEBLeLe8+SM5jKC6KExC+GLZ7+
   g==;
X-CSE-ConnectionGUID: hPXy16WRShmFQ88UMt/kzA==
X-CSE-MsgGUID: qlCf/N2tQQijyPJnApSamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70478204"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70478204"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 12:12:36 -0800
X-CSE-ConnectionGUID: 5GLrHjIkR5OL2iiulF1dzw==
X-CSE-MsgGUID: U74RcnSQSB6IfjMDfAhmhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="212174601"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2026 12:12:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjjzk-00000000VWA-2s7u;
	Sat, 24 Jan 2026 20:12:32 +0000
Date: Sun, 25 Jan 2026 04:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 6ee54e03d97bce5168b4ac87cdf7ac88b3f944a8
Message-ID: <202601250449.m8xu18RM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51467-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 6CC3E7ED6D
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 6ee54e03d97bce5168b4ac87cdf7ac88b3f944a8  media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code

elapsed time: 1333m

configs tested: 256
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260124    clang-18
arc                   randconfig-001-20260124    gcc-14.3.0
arc                   randconfig-002-20260124    clang-18
arc                   randconfig-002-20260124    gcc-13.4.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                          pxa168_defconfig    clang-22
arm                   randconfig-001-20260124    clang-18
arm                   randconfig-001-20260124    gcc-8.5.0
arm                   randconfig-002-20260124    clang-18
arm                   randconfig-002-20260124    clang-22
arm                   randconfig-003-20260124    clang-18
arm                   randconfig-004-20260124    clang-18
arm                   randconfig-004-20260124    gcc-15.2.0
arm                         socfpga_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    clang-22
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260124    clang-22
arm64                 randconfig-001-20260124    gcc-15.2.0
arm64                 randconfig-002-20260124    clang-22
arm64                 randconfig-002-20260124    gcc-15.2.0
arm64                 randconfig-003-20260124    clang-22
arm64                 randconfig-003-20260124    gcc-15.2.0
arm64                 randconfig-004-20260124    gcc-15.2.0
arm64                 randconfig-004-20260124    gcc-9.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260124    gcc-13.4.0
csky                  randconfig-001-20260124    gcc-15.2.0
csky                  randconfig-002-20260124    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260124    clang-22
hexagon               randconfig-001-20260124    gcc-15.2.0
hexagon               randconfig-002-20260124    clang-22
hexagon               randconfig-002-20260124    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260124    gcc-14
i386        buildonly-randconfig-002-20260124    gcc-14
i386        buildonly-randconfig-003-20260124    gcc-14
i386        buildonly-randconfig-004-20260124    clang-20
i386        buildonly-randconfig-004-20260124    gcc-14
i386        buildonly-randconfig-005-20260124    gcc-14
i386        buildonly-randconfig-006-20260124    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260124    gcc-14
i386                  randconfig-002-20260124    gcc-14
i386                  randconfig-003-20260124    gcc-14
i386                  randconfig-004-20260124    gcc-12
i386                  randconfig-005-20260124    clang-20
i386                  randconfig-006-20260124    gcc-14
i386                  randconfig-007-20260124    gcc-14
i386                  randconfig-011-20260124    clang-20
i386                  randconfig-012-20260124    clang-20
i386                  randconfig-013-20260124    clang-20
i386                  randconfig-014-20260124    clang-20
i386                  randconfig-014-20260124    gcc-14
i386                  randconfig-015-20260124    clang-20
i386                  randconfig-016-20260124    clang-20
i386                  randconfig-016-20260124    gcc-14
i386                  randconfig-017-20260124    clang-20
i386                  randconfig-017-20260124    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260124    gcc-15.2.0
loongarch             randconfig-002-20260124    gcc-14.3.0
loongarch             randconfig-002-20260124    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-22
mips                       rbtx49xx_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260124    gcc-15.2.0
nios2                 randconfig-001-20260124    gcc-8.5.0
nios2                 randconfig-002-20260124    gcc-11.5.0
nios2                 randconfig-002-20260124    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260124    gcc-8.5.0
parisc                randconfig-002-20260124    gcc-14.3.0
parisc                randconfig-002-20260124    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                        cell_defconfig    clang-22
powerpc                      cm5200_defconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    clang-22
powerpc               randconfig-001-20260124    clang-22
powerpc               randconfig-001-20260124    gcc-8.5.0
powerpc               randconfig-002-20260124    clang-22
powerpc               randconfig-002-20260124    gcc-8.5.0
powerpc64             randconfig-001-20260124    gcc-10.5.0
powerpc64             randconfig-001-20260124    gcc-8.5.0
powerpc64             randconfig-002-20260124    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260124    gcc-8.5.0
riscv                 randconfig-002-20260124    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260124    gcc-15.2.0
s390                  randconfig-002-20260124    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                            hp6xx_defconfig    gcc-15.2.0
sh                          r7785rp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260124    gcc-15.2.0
sh                    randconfig-002-20260124    gcc-13.4.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260124    gcc-14.3.0
sparc                 randconfig-002-20260124    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260124    clang-22
sparc64               randconfig-002-20260124    clang-22
um                               alldefconfig    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260124    gcc-14
um                    randconfig-002-20260124    clang-18
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260124    clang-20
x86_64      buildonly-randconfig-002-20260124    clang-20
x86_64      buildonly-randconfig-002-20260124    gcc-14
x86_64      buildonly-randconfig-003-20260124    clang-20
x86_64      buildonly-randconfig-004-20260124    clang-20
x86_64      buildonly-randconfig-005-20260124    clang-20
x86_64      buildonly-randconfig-006-20260124    clang-20
x86_64      buildonly-randconfig-006-20260124    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260124    clang-20
x86_64                randconfig-001-20260124    gcc-13
x86_64                randconfig-002-20260124    clang-20
x86_64                randconfig-002-20260124    gcc-13
x86_64                randconfig-003-20260124    clang-20
x86_64                randconfig-003-20260124    gcc-13
x86_64                randconfig-004-20260124    clang-20
x86_64                randconfig-004-20260124    gcc-13
x86_64                randconfig-005-20260124    gcc-13
x86_64                randconfig-006-20260124    clang-20
x86_64                randconfig-006-20260124    gcc-13
x86_64                randconfig-011-20260124    gcc-12
x86_64                randconfig-011-20260124    gcc-14
x86_64                randconfig-012-20260124    gcc-12
x86_64                randconfig-012-20260124    gcc-14
x86_64                randconfig-013-20260124    clang-20
x86_64                randconfig-013-20260124    gcc-12
x86_64                randconfig-014-20260124    gcc-12
x86_64                randconfig-015-20260124    gcc-12
x86_64                randconfig-015-20260124    gcc-14
x86_64                randconfig-016-20260124    gcc-12
x86_64                randconfig-016-20260124    gcc-14
x86_64                randconfig-071-20260124    gcc-14
x86_64                randconfig-072-20260124    clang-20
x86_64                randconfig-073-20260124    clang-20
x86_64                randconfig-074-20260124    gcc-12
x86_64                randconfig-075-20260124    clang-20
x86_64                randconfig-076-20260124    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260124    gcc-8.5.0
xtensa                randconfig-002-20260124    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


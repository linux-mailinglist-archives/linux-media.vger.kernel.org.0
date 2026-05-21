Return-Path: <linux-media+bounces-62424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBdHAKfQDmrOCQYAu9opvQ
	(envelope-from <linux-media+bounces-62424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:30:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7450A5A25BC
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C0333063816
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A3235DA64;
	Thu, 21 May 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdeHjqd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF232B103
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354027; cv=none; b=m9ltlvU0CSzs8uCAmdNh2s1VVWzNSFGsDeuUpIBVu6X8B/9uMvLKcL0Q53AKKtS/y8Kf3jUeFCrCYsWbD1DLecNTn8FHnbz4XhOzUuEswMVtK9QS2c2xqScox/EVCLaX5oCvXHXACqLEuk7GbGJkq5FI5eYjnrIiHMN3izWTdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354027; c=relaxed/simple;
	bh=lQldl2Zd5g81Wh/WcWWhDHxT5IbtunYJvKutPMbb6ZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SykkSpZco7EVQ3ef5zBy6gkuJTcAowqE+/9v+shjllKcLm2ri044Q8jTON/FB/UaBC4i1PDkxpmeXOqyConQCGFlNvtoKcEjIVZFKMPDtKQ9m2KF1kfhtyQDhW1v1x8SKHCsEeZTStlzYJthdwKvYVu2uuokYiWVkq08FTgEJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdeHjqd6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779354025; x=1810890025;
  h=date:from:to:cc:subject:message-id;
  bh=lQldl2Zd5g81Wh/WcWWhDHxT5IbtunYJvKutPMbb6ZI=;
  b=gdeHjqd6Ms8MRR2Nq0/erulPagorSwlP+KaqF4PPlkmmoEbhD9VldMbj
   OxVludzwB4GbIkJhpQay5yx3rET2s4DkRCU0yY0xhIiOcysN8LG0avByR
   zD6tu/Jb5dXb0ZNVU69WWFASXkM5pBw6mj6BEJO8upjnLlnLuHUfU8piH
   JtgWm/61KFw7+YBeXuA3+plG9aC/jarI61FKx814KJGartYercvrXKDum
   SDvoik67d5i4x0X+1fv02Ca00B9ywGe9YMJp/IvLwlrc+Po1AFAW29PC1
   Jk9bkEtF9hKuUfGqhBW89eu60x4+hxb6eqSE2jAqx3N33AesOyUVqgxl8
   w==;
X-CSE-ConnectionGUID: 1t6VZqp+SLqrQ45ORvkYwQ==
X-CSE-MsgGUID: 3WZoNgawQ5Kjt3Lu1ll64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82846712"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="82846712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:00:25 -0700
X-CSE-ConnectionGUID: 3Bt2LEBfSbioEBUsbDfPug==
X-CSE-MsgGUID: +Y5/tzCHTdKOHJOpR7d3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234123117"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2026 02:00:23 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzGP-000000004hl-1sMx;
	Thu, 21 May 2026 09:00:21 +0000
Date: Thu, 21 May 2026 16:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 c2d1a2130c93f6d758af58590b86b2254c7a1dec
Message-ID: <202605211630.luFwdacU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-62424-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7450A5A25BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c2d1a2130c93f6d758af58590b86b2254c7a1dec  media: vivid: check for vb2_is_busy() when toggling caps

elapsed time: 929m

configs tested: 195
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260521    gcc-13.4.0
arc                   randconfig-002-20260521    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      footbridge_defconfig    clang-17
arm                   randconfig-001-20260521    clang-23
arm                   randconfig-002-20260521    gcc-12.5.0
arm                   randconfig-003-20260521    gcc-13.4.0
arm                   randconfig-004-20260521    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260521    gcc-8.5.0
arm64                 randconfig-002-20260521    gcc-8.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260521    gcc-8.5.0
arm64                 randconfig-004-20260521    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260521    gcc-15.2.0
csky                  randconfig-001-20260521    gcc-8.5.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260521    gcc-15.2.0
csky                  randconfig-002-20260521    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260521    clang-23
hexagon               randconfig-001-20260521    gcc-11.5.0
hexagon               randconfig-002-20260521    clang-23
hexagon               randconfig-002-20260521    gcc-11.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260521    clang-20
i386                  randconfig-002-20260521    gcc-14
i386                  randconfig-003-20260521    clang-20
i386                  randconfig-004-20260521    gcc-14
i386                  randconfig-005-20260521    clang-20
i386                  randconfig-006-20260521    clang-20
i386                  randconfig-007-20260521    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260521    gcc-11.5.0
loongarch             randconfig-001-20260521    gcc-12.5.0
loongarch             randconfig-002-20260521    gcc-11.5.0
loongarch             randconfig-002-20260521    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260521    gcc-11.5.0
nios2                 randconfig-002-20260521    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260521    gcc-12.5.0
parisc                randconfig-002-20260521    gcc-12.5.0
parisc                randconfig-002-20260521    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260521    clang-23
powerpc               randconfig-001-20260521    gcc-12.5.0
powerpc               randconfig-002-20260521    clang-17
powerpc               randconfig-002-20260521    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260521    clang-23
powerpc64             randconfig-001-20260521    gcc-12.5.0
powerpc64             randconfig-002-20260521    gcc-12.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260521    clang-23
riscv                 randconfig-001-20260521    gcc-15.2.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260521    gcc-13.4.0
riscv                 randconfig-002-20260521    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260521    gcc-15.2.0
s390                  randconfig-001-20260521    gcc-8.5.0
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260521    clang-17
s390                  randconfig-002-20260521    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260521    gcc-15.2.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260521    gcc-12.5.0
sh                    randconfig-002-20260521    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260521    gcc-8.5.0
sparc                 randconfig-002-20260521    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260521    gcc-8.5.0
sparc64               randconfig-002-20260521    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260521    gcc-14
um                    randconfig-001-20260521    gcc-8.5.0
um                    randconfig-002-20260521    gcc-14
um                    randconfig-002-20260521    gcc-8.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260521    clang-20
x86_64      buildonly-randconfig-001-20260521    gcc-12
x86_64      buildonly-randconfig-002-20260521    clang-20
x86_64      buildonly-randconfig-002-20260521    gcc-14
x86_64      buildonly-randconfig-003-20260521    clang-20
x86_64      buildonly-randconfig-004-20260521    clang-20
x86_64      buildonly-randconfig-004-20260521    gcc-14
x86_64      buildonly-randconfig-005-20260521    clang-20
x86_64      buildonly-randconfig-006-20260521    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260521    clang-20
x86_64                randconfig-002-20260521    clang-20
x86_64                randconfig-003-20260521    gcc-14
x86_64                randconfig-004-20260521    clang-20
x86_64                randconfig-005-20260521    clang-20
x86_64                randconfig-006-20260521    clang-20
x86_64                randconfig-071-20260521    clang-20
x86_64                randconfig-072-20260521    clang-20
x86_64                randconfig-073-20260521    clang-20
x86_64                randconfig-074-20260521    gcc-14
x86_64                randconfig-075-20260521    clang-20
x86_64                randconfig-076-20260521    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260521    gcc-8.5.0
xtensa                randconfig-002-20260521    gcc-11.5.0
xtensa                randconfig-002-20260521    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-54908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOJMFPwyrmlrAQIAu9opvQ
	(envelope-from <linux-media+bounces-54908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 03:39:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA2233570
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 03:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 329F1300823A
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 02:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D32227467F;
	Mon,  9 Mar 2026 02:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRRxab5f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35023EAB3
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 02:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023988; cv=none; b=KSuiw2o+lNHisKPaBj6LWrrUJM/P/Iw5egT8Bmk/+XtTTJdXdKU3+zx03VK/W9YO3SUDZ4CaRV0g1DyhJHF/kD9HR6PTCkYWuep2Q0o8/l+XFKJTW1FVn0mdo+dMr8X9cJWil2kHA/85OeYZFnrJOr/LK2i2qt9Mta4FggSPTF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023988; c=relaxed/simple;
	bh=Qlq7klAEsQmCWwMNr2pAKIa4WnMaspGvu/AieuNs8rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bGTawtyGVzJiiV+dim/Kxiyc8ttqmtsV8AUQEf9fPHP/aOAAgjQi3M8iyTqIFOJOQKGpaBLur5sqdb1rxap3DKVdJhdmdElVxERi6+vqheBBHg6ycdT+AnPkBK+ytknhEA8+6tbus+nN2lq3Jd1yJS3xW8Rd4Avs4FXc/T5sGjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRRxab5f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773023985; x=1804559985;
  h=date:from:to:cc:subject:message-id;
  bh=Qlq7klAEsQmCWwMNr2pAKIa4WnMaspGvu/AieuNs8rg=;
  b=hRRxab5fibfgzrXK1WZzYX6NM8ZZsJJTp5KTgxVzFl1hMixRPHy7HrK0
   wxDpqK/y4VIrcxlF1m3/j0JFoRFzjpN4Cb0JWbmmOuOVFoNz6YTgCW2UK
   SYT9jtbnMvV3Ae7AomIUgO1c7oxPxHi3phb28GRxaS9JQdnNb1pRid1dp
   mm5DjtwbmcnKXCUgbLv50qtAW7Bfv4OM5ExdQJeqPVx5E53+b8TonZSkn
   R6eCK3B4Jq/p++UZG6gyVcmzcpCyZPopa64z0W5zj0vcdob7mcX4RGwMh
   o3qBy+uHuwhB6I6UVrYghxnN2Pfm02yBfdk8BLLa0awpJlYsIx9RE2JqT
   w==;
X-CSE-ConnectionGUID: beqY8qJ1SpC6/QSgCMlwIA==
X-CSE-MsgGUID: Qfl/piERTgyiGoMgWHaUhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73915723"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73915723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 19:39:45 -0700
X-CSE-ConnectionGUID: 2QxEw/n6S82M/C+iXyoBZg==
X-CSE-MsgGUID: sqi+M+DfSsOFnaZFMpSwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224309083"
Received: from lkp-server01.sh.intel.com (HELO 17db2bb44c9a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Mar 2026 19:39:43 -0700
Received: from kbuild by 17db2bb44c9a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzQWy-0000000004n-0JfS;
	Mon, 09 Mar 2026 02:39:40 +0000
Date: Mon, 09 Mar 2026 10:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 cac4bba4b17e7142f40557034b546614ef064928
Message-ID: <202603091046.DCtDP9dk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: A4FA2233570
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-54908-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: cac4bba4b17e7142f40557034b546614ef064928  media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex

elapsed time: 811m

configs tested: 255
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260308    gcc-8.5.0
arc                   randconfig-001-20260309    clang-17
arc                   randconfig-002-20260308    gcc-8.5.0
arc                   randconfig-002-20260309    clang-17
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260308    gcc-8.5.0
arm                   randconfig-001-20260309    clang-17
arm                   randconfig-002-20260308    gcc-8.5.0
arm                   randconfig-002-20260309    clang-17
arm                   randconfig-003-20260308    gcc-8.5.0
arm                   randconfig-003-20260309    clang-17
arm                   randconfig-004-20260308    gcc-8.5.0
arm                   randconfig-004-20260309    clang-17
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260308    clang-23
arm64                 randconfig-002-20260308    clang-23
arm64                 randconfig-003-20260308    clang-23
arm64                 randconfig-004-20260308    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260308    clang-23
csky                  randconfig-002-20260308    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260308    clang-23
hexagon               randconfig-002-20260308    clang-16
hexagon               randconfig-002-20260308    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260308    clang-20
i386        buildonly-randconfig-002-20260308    clang-20
i386        buildonly-randconfig-003-20260308    clang-20
i386        buildonly-randconfig-004-20260308    clang-20
i386        buildonly-randconfig-005-20260308    clang-20
i386        buildonly-randconfig-006-20260308    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260308    gcc-13
i386                  randconfig-001-20260308    gcc-14
i386                  randconfig-001-20260309    gcc-14
i386                  randconfig-002-20260308    gcc-14
i386                  randconfig-002-20260309    gcc-14
i386                  randconfig-003-20260308    gcc-14
i386                  randconfig-003-20260309    gcc-14
i386                  randconfig-004-20260308    clang-20
i386                  randconfig-004-20260308    gcc-14
i386                  randconfig-004-20260309    gcc-14
i386                  randconfig-005-20260308    clang-20
i386                  randconfig-005-20260308    gcc-14
i386                  randconfig-005-20260309    gcc-14
i386                  randconfig-006-20260308    gcc-14
i386                  randconfig-006-20260309    gcc-14
i386                  randconfig-007-20260308    clang-20
i386                  randconfig-007-20260308    gcc-14
i386                  randconfig-007-20260309    gcc-14
i386                  randconfig-011-20260308    clang-20
i386                  randconfig-012-20260308    clang-20
i386                  randconfig-013-20260308    clang-20
i386                  randconfig-014-20260308    clang-20
i386                  randconfig-015-20260308    clang-20
i386                  randconfig-016-20260308    clang-20
i386                  randconfig-017-20260308    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260308    clang-19
loongarch             randconfig-001-20260308    clang-23
loongarch             randconfig-002-20260308    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260308    clang-23
nios2                 randconfig-001-20260308    gcc-11.5.0
nios2                 randconfig-002-20260308    clang-23
nios2                 randconfig-002-20260308    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260308    gcc-8.5.0
parisc                randconfig-001-20260309    gcc-8.5.0
parisc                randconfig-002-20260308    gcc-8.5.0
parisc                randconfig-002-20260309    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260308    gcc-8.5.0
powerpc               randconfig-001-20260309    gcc-8.5.0
powerpc               randconfig-002-20260308    gcc-8.5.0
powerpc               randconfig-002-20260309    gcc-8.5.0
powerpc64             randconfig-001-20260308    gcc-8.5.0
powerpc64             randconfig-001-20260309    gcc-8.5.0
powerpc64             randconfig-002-20260308    gcc-8.5.0
powerpc64             randconfig-002-20260309    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260308    gcc-12.5.0
riscv                 randconfig-002-20260308    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260308    gcc-12.5.0
s390                  randconfig-002-20260308    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260308    gcc-12.5.0
sh                    randconfig-002-20260308    gcc-12.5.0
sh                            titan_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260308    gcc-15.2.0
sparc                 randconfig-001-20260308    gcc-8.5.0
sparc                 randconfig-001-20260309    gcc-13.4.0
sparc                 randconfig-002-20260308    gcc-11.5.0
sparc                 randconfig-002-20260308    gcc-15.2.0
sparc                 randconfig-002-20260309    gcc-13.4.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260308    clang-20
sparc64               randconfig-001-20260308    gcc-15.2.0
sparc64               randconfig-001-20260309    gcc-13.4.0
sparc64               randconfig-002-20260308    gcc-15.2.0
sparc64               randconfig-002-20260308    gcc-8.5.0
sparc64               randconfig-002-20260309    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260308    gcc-14
um                    randconfig-001-20260308    gcc-15.2.0
um                    randconfig-001-20260309    gcc-13.4.0
um                    randconfig-002-20260308    gcc-14
um                    randconfig-002-20260308    gcc-15.2.0
um                    randconfig-002-20260309    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260308    clang-20
x86_64      buildonly-randconfig-001-20260309    gcc-14
x86_64      buildonly-randconfig-002-20260308    clang-20
x86_64      buildonly-randconfig-002-20260309    gcc-14
x86_64      buildonly-randconfig-003-20260308    clang-20
x86_64      buildonly-randconfig-003-20260308    gcc-14
x86_64      buildonly-randconfig-003-20260309    gcc-14
x86_64      buildonly-randconfig-004-20260308    clang-20
x86_64      buildonly-randconfig-004-20260309    gcc-14
x86_64      buildonly-randconfig-005-20260308    clang-20
x86_64      buildonly-randconfig-005-20260308    gcc-14
x86_64      buildonly-randconfig-005-20260309    gcc-14
x86_64      buildonly-randconfig-006-20260308    clang-20
x86_64      buildonly-randconfig-006-20260308    gcc-14
x86_64      buildonly-randconfig-006-20260309    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260308    gcc-14
x86_64                randconfig-001-20260309    gcc-13
x86_64                randconfig-002-20260308    gcc-14
x86_64                randconfig-002-20260309    gcc-13
x86_64                randconfig-003-20260308    gcc-14
x86_64                randconfig-003-20260309    gcc-13
x86_64                randconfig-004-20260308    gcc-14
x86_64                randconfig-004-20260309    gcc-13
x86_64                randconfig-005-20260308    gcc-14
x86_64                randconfig-005-20260309    gcc-13
x86_64                randconfig-006-20260308    gcc-14
x86_64                randconfig-006-20260309    gcc-13
x86_64                randconfig-011-20260308    clang-20
x86_64                randconfig-012-20260308    clang-20
x86_64                randconfig-013-20260308    clang-20
x86_64                randconfig-014-20260308    clang-20
x86_64                randconfig-015-20260308    clang-20
x86_64                randconfig-016-20260308    clang-20
x86_64                randconfig-071-20260308    clang-20
x86_64                randconfig-071-20260309    gcc-14
x86_64                randconfig-072-20260308    clang-20
x86_64                randconfig-072-20260309    gcc-14
x86_64                randconfig-073-20260308    clang-20
x86_64                randconfig-073-20260309    gcc-14
x86_64                randconfig-074-20260308    gcc-14
x86_64                randconfig-074-20260309    gcc-14
x86_64                randconfig-075-20260308    clang-20
x86_64                randconfig-075-20260309    gcc-14
x86_64                randconfig-076-20260308    gcc-14
x86_64                randconfig-076-20260309    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260308    gcc-11.5.0
xtensa                randconfig-001-20260308    gcc-15.2.0
xtensa                randconfig-001-20260309    gcc-13.4.0
xtensa                randconfig-002-20260308    gcc-15.2.0
xtensa                randconfig-002-20260309    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-55027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGrbAtOCr2lJaAIAu9opvQ
	(envelope-from <linux-media+bounces-55027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 03:32:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CE2443C0
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 03:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70CF5302F698
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 02:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2239B49B;
	Tue, 10 Mar 2026 02:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Ev8Elx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A273939A813
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109966; cv=none; b=gBdDs2kzIbA/Yfuh31U31vHBfU82k7ibNGyJ2D3BIhJ9MUvriN0mnBwnTxR8pV4c16tHW4OJZizmXGjH01xE7Cq1UG5IBxUSoHvwYv2vLtEe8v/3LHiX6LcJk+CUDnjBzcoYhC8W+fIy/2VOJrXLouCkxuHyM0vX5Tck/aeFDzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109966; c=relaxed/simple;
	bh=Fi7uJopbjA7fBsfhMQm3KH5JtMC2ayJ/GsjrZOOMSe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qWAI4sAYQcjmLX9+QSDC07Wgywe03slZQTWiXMa/ehB0MUYe4YM8F7IdNi81PDMpk5t6pBG3M7Q07dtqNWHfekLRLQmyC8Jx7VywImZEDSE2kNvNNdFaTftCQvx3Xquc/TCeJ7EYCgSC5zmFP9Z+hBeId+7fUV75PZW6sgik900=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Ev8Elx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773109964; x=1804645964;
  h=date:from:to:cc:subject:message-id;
  bh=Fi7uJopbjA7fBsfhMQm3KH5JtMC2ayJ/GsjrZOOMSe8=;
  b=M5Ev8Elx5vmS/TCssBI8qGH5FYI1PZTr8CRCRzHNnBm8tbg7Ul0MTUs4
   8MTo5/f0R8z5xb9iJaTOC2phwqFLTm/NUrEkbakhE/y9NDq+lJycPGrzJ
   6ABOHDHqEreNq3Bj7OCVb4DPICeIRCG5ilP/UtRIxOrylBrFOQwdiWdH/
   RvbLCInX/AnUAylr89GZGgxv2mIGQPleymkL/EZH4u8TeOjmN/xIzdnAw
   fQB8yvCx0x4pJntUYHwR72W+RM8PRb6R2aefNPYiMK+KVAl+I9EWu9HsJ
   oJSgwx+ktF8GctTpAb9QrdJINPE8zDA+3DSr7K/DgxdNrlBNoHjBJPehk
   Q==;
X-CSE-ConnectionGUID: TEQ62DEPRfqmBORQwZ5seg==
X-CSE-MsgGUID: v4pK8O0wSwKEiQStgH6MYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73170584"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73170584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 19:32:43 -0700
X-CSE-ConnectionGUID: lSxEINNMSnqfElK3QviYdA==
X-CSE-MsgGUID: CfNHQmgkTQGCF1Vul29iDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="217519362"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 19:32:42 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzmtk-0000000019I-2F32;
	Tue, 10 Mar 2026 02:32:40 +0000
Date: Tue, 10 Mar 2026 10:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:atomisp] BUILD SUCCESS
 34aea168e0601bbd2c018a23566e837bfe6e1c33
Message-ID: <202603101048.L8DFmccq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 734CE2443C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-55027-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git atomisp
branch HEAD: 34aea168e0601bbd2c018a23566e837bfe6e1c33  staging: media: atomisp: fix block comment style in atomisp_cmd.c

elapsed time: 757m

configs tested: 237
configs skipped: 3

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
arc                   randconfig-001-20260310    gcc-8.5.0
arc                   randconfig-001-20260310    gcc-9.5.0
arc                   randconfig-002-20260310    gcc-15.2.0
arc                   randconfig-002-20260310    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260310    clang-23
arm                   randconfig-001-20260310    gcc-8.5.0
arm                   randconfig-002-20260310    gcc-12.5.0
arm                   randconfig-002-20260310    gcc-8.5.0
arm                   randconfig-003-20260310    gcc-10.5.0
arm                   randconfig-003-20260310    gcc-8.5.0
arm                   randconfig-004-20260310    gcc-8.5.0
arm                           sama7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260310    clang-16
arm64                 randconfig-001-20260310    gcc-11.5.0
arm64                 randconfig-002-20260310    gcc-11.5.0
arm64                 randconfig-002-20260310    gcc-13.4.0
arm64                 randconfig-003-20260310    gcc-11.5.0
arm64                 randconfig-004-20260310    gcc-11.5.0
arm64                 randconfig-004-20260310    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260310    gcc-11.5.0
csky                  randconfig-001-20260310    gcc-15.2.0
csky                  randconfig-002-20260310    gcc-11.5.0
csky                  randconfig-002-20260310    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-002-20260310    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260309    clang-20
i386        buildonly-randconfig-001-20260310    clang-20
i386        buildonly-randconfig-002-20260309    clang-20
i386        buildonly-randconfig-002-20260310    clang-20
i386        buildonly-randconfig-003-20260309    clang-20
i386        buildonly-randconfig-003-20260310    clang-20
i386        buildonly-randconfig-004-20260309    clang-20
i386        buildonly-randconfig-004-20260310    clang-20
i386        buildonly-randconfig-005-20260309    gcc-14
i386        buildonly-randconfig-005-20260310    clang-20
i386        buildonly-randconfig-006-20260309    clang-20
i386        buildonly-randconfig-006-20260310    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-001-20260310    gcc-14
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-002-20260310    gcc-14
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-005-20260310    gcc-14
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-006-20260310    gcc-14
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-007-20260310    gcc-12
i386                  randconfig-011-20260310    clang-20
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-013-20260310    clang-20
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-016-20260310    clang-20
i386                  randconfig-017-20260310    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-002-20260310    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-002-20260310    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-002-20260310    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260310    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-15.2.0
s390                  randconfig-002-20260310    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260310    gcc-15.2.0
sh                    randconfig-002-20260310    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-001-20260310    gcc-15.2.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260310    clang-20
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-002-20260310    clang-23
sparc64               randconfig-002-20260310    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-001-20260310    gcc-14
um                    randconfig-002-20260310    clang-23
um                    randconfig-002-20260310    gcc-12.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260310    gcc-12
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260310    gcc-12
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260310    clang-20
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-006-20260310    gcc-14
x86_64                randconfig-011-20260310    clang-20
x86_64                randconfig-011-20260310    gcc-14
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-013-20260310    clang-20
x86_64                randconfig-013-20260310    gcc-14
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-015-20260310    clang-20
x86_64                randconfig-015-20260310    gcc-14
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-071-20260310    clang-20
x86_64                randconfig-072-20260310    clang-20
x86_64                randconfig-073-20260310    clang-20
x86_64                randconfig-074-20260310    clang-20
x86_64                randconfig-074-20260310    gcc-14
x86_64                randconfig-075-20260310    clang-20
x86_64                randconfig-075-20260310    gcc-14
x86_64                randconfig-076-20260310    clang-20
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
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-001-20260310    gcc-15.2.0
xtensa                randconfig-002-20260310    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


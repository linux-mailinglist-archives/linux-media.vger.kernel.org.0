Return-Path: <linux-media+bounces-65891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d+CyLoJGQmou3gkAu9opvQ
	(envelope-from <linux-media+bounces-65891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:18:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 285B06D8CE3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=h0LylIXx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65891-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65891-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91519303E2CA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB963DB639;
	Mon, 29 Jun 2026 10:14:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4873B7756
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 10:14:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728084; cv=none; b=urdEZ4oyIo+wYhi0DUfKvhm/Tbi6hnlfrbzFs0k5k6osXV171EzsMZGHeNMwsHQK6qzPkHZMiCetTSNaVza284hAEQvOquxwwEJ2RDnbIARcoJz42DeXw4q/i9YayemxzRAU4VnsqAMFPCFOhEutz2+QUfLLd1p8PVKUIwhhAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728084; c=relaxed/simple;
	bh=/nQ8twCsYgJeGy0fwznw5ALvmIypKScpyIyuAaCxY4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kraYBIvlxJ1Am/mMfjro6zFAseCOiAwLT7CvZ6ztz9WIO/1kTX/I3p2eLRYRSeVcX0sBSSGiaN36GinTwwyPGySPgc6Z/fmqwWZsf/EtvdIWitexQyXcqJCvQNadxqZerv/Bbbf1jMFhvmSIppJsdJ+2N5Ig4snxdhN/FtVJKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0LylIXx; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782728083; x=1814264083;
  h=date:from:to:cc:subject:message-id;
  bh=/nQ8twCsYgJeGy0fwznw5ALvmIypKScpyIyuAaCxY4A=;
  b=h0LylIXx3emD+V+vFXud5PQbo1O6CX4NIg5r8Nbn56YaT3tfpxv5vzCA
   0n7yN68rj7MsACxbqH6TwBgo65PBj7VhGMmet5zXzr6NPHOYMy2FYwLrm
   wP3ZkgjFFPHAtIh0PK8heGuf75UjfQM5F2kb+qJrYinJriYrdQEC+XBHD
   ARbWMDvwGI4ZRmBLBCswCs3tPxxK10q8wMj5cGqovw/XWMF/vwpyvijjf
   IbhA8E8l6LzHolSHdvJWCEWG+npJRV3fuGg0c6ad26ehadbIuyBT3cgXe
   UqO9LGcSgEUIwn+80mqzLdzlVFMKVxDiGH8b7J7qZ0I5qcpV5E+p+dfJt
   g==;
X-CSE-ConnectionGUID: CoRBYnBjSFqRDSGRcg1hAA==
X-CSE-MsgGUID: agYSd7tJSNeyhJZXwqcVeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="93761905"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="93761905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 03:14:42 -0700
X-CSE-ConnectionGUID: wWMn/cxJTqehlisJ8k9KNA==
X-CSE-MsgGUID: Io7dSXLEQmazZeAPhm1ARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247462586"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 03:14:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we90c-000000007Hh-39jw;
	Mon, 29 Jun 2026 10:14:35 +0000
Date: Mon, 29 Jun 2026 18:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 e9c44d4eccc735b9b3a2c7e6324207d5ccb2d821
Message-ID: <202606291803.AspE6Qg6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65891-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 285B06D8CE3

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: e9c44d4eccc735b9b3a2c7e6324207d5ccb2d821  media: mc-entity: Add missing kerneldoc

elapsed time: 731m

configs tested: 219
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260629    clang-17
arc                   randconfig-001-20260629    gcc-16.1.0
arc                   randconfig-002-20260629    clang-17
arc                   randconfig-002-20260629    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260629    clang-17
arm                   randconfig-001-20260629    gcc-10.5.0
arm                   randconfig-002-20260629    clang-17
arm                   randconfig-003-20260629    clang-17
arm                   randconfig-004-20260629    clang-17
arm                   randconfig-004-20260629    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260629    gcc-16.1.0
arm64                 randconfig-002-20260629    clang-22
arm64                 randconfig-002-20260629    gcc-16.1.0
arm64                 randconfig-003-20260629    clang-23
arm64                 randconfig-003-20260629    gcc-16.1.0
arm64                 randconfig-004-20260629    clang-20
arm64                 randconfig-004-20260629    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260629    gcc-10.5.0
csky                  randconfig-001-20260629    gcc-16.1.0
csky                  randconfig-002-20260629    gcc-12.5.0
csky                  randconfig-002-20260629    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260629    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260629    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260629    gcc-14
i386        buildonly-randconfig-002-20260629    gcc-14
i386        buildonly-randconfig-003-20260629    gcc-14
i386        buildonly-randconfig-004-20260629    gcc-14
i386        buildonly-randconfig-005-20260629    gcc-14
i386        buildonly-randconfig-006-20260629    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260629    clang-22
i386                  randconfig-002-20260629    clang-22
i386                  randconfig-003-20260629    clang-22
i386                  randconfig-004-20260629    clang-22
i386                  randconfig-005-20260629    clang-22
i386                  randconfig-006-20260629    clang-22
i386                  randconfig-007-20260629    clang-22
i386                  randconfig-011-20260629    gcc-14
i386                  randconfig-012-20260629    gcc-14
i386                  randconfig-013-20260629    gcc-14
i386                  randconfig-014-20260629    gcc-14
i386                  randconfig-015-20260629    gcc-14
i386                  randconfig-016-20260629    gcc-14
i386                  randconfig-017-20260629    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260629    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260629    gcc-11.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                       m5475evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260629    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260629    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260629    gcc-9.5.0
parisc                randconfig-002-20260629    gcc-11.5.0
parisc                randconfig-002-20260629    gcc-9.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     ksi8560_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260629    gcc-10.5.0
powerpc               randconfig-001-20260629    gcc-9.5.0
powerpc               randconfig-002-20260629    gcc-8.5.0
powerpc               randconfig-002-20260629    gcc-9.5.0
powerpc64             randconfig-001-20260629    gcc-8.5.0
powerpc64             randconfig-001-20260629    gcc-9.5.0
powerpc64             randconfig-002-20260629    gcc-8.5.0
powerpc64             randconfig-002-20260629    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260629    clang-17
riscv                 randconfig-002-20260629    clang-17
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260629    clang-17
s390                  randconfig-002-20260629    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                               j2_defconfig    gcc-16.1.0
sh                    randconfig-001-20260629    clang-17
sh                    randconfig-002-20260629    clang-17
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260629    gcc-15.2.0
sparc                 randconfig-002-20260629    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260629    gcc-15.2.0
sparc64               randconfig-002-20260629    gcc-15.2.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260629    gcc-15.2.0
um                    randconfig-002-20260629    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260629    clang-22
x86_64      buildonly-randconfig-002-20260629    clang-22
x86_64      buildonly-randconfig-003-20260629    clang-22
x86_64      buildonly-randconfig-004-20260629    clang-22
x86_64      buildonly-randconfig-005-20260629    clang-22
x86_64      buildonly-randconfig-006-20260629    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260629    gcc-14
x86_64                randconfig-002-20260629    gcc-14
x86_64                randconfig-003-20260629    gcc-14
x86_64                randconfig-004-20260629    gcc-14
x86_64                randconfig-005-20260629    gcc-14
x86_64                randconfig-006-20260629    gcc-14
x86_64                randconfig-011-20260629    gcc-13
x86_64                randconfig-012-20260629    gcc-13
x86_64                randconfig-013-20260629    gcc-13
x86_64                randconfig-014-20260629    gcc-13
x86_64                randconfig-015-20260629    gcc-13
x86_64                randconfig-016-20260629    gcc-13
x86_64                randconfig-071-20260629    clang-22
x86_64                randconfig-072-20260629    clang-22
x86_64                randconfig-073-20260629    clang-22
x86_64                randconfig-074-20260629    clang-22
x86_64                randconfig-075-20260629    clang-22
x86_64                randconfig-076-20260629    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260629    gcc-15.2.0
xtensa                randconfig-002-20260629    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


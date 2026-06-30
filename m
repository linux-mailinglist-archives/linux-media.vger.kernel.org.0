Return-Path: <linux-media+bounces-66053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /xZzHnWJQ2p8agoAu9opvQ
	(envelope-from <linux-media+bounces-66053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:16:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2676E202B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:16:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aMQFBA0q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66053-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66053-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B011304EBE0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021EC3EB10B;
	Tue, 30 Jun 2026 09:12:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42E3E168F
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:12:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810731; cv=none; b=sffErgv14D1Il9jSEdrX0pQNobG7pEnfkFvzNbXUxtOy7d4+69/5jk+ZlczL8koE7vH0rmzT4qeEBwk/219zo86Uvib0KD033eUmxko3oNK1aJGUucMNx+Yaw/ECqgPt2UhCw9nZYt//E9/HSstpeDeaHBuDC+11HV9yXQ9ROgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810731; c=relaxed/simple;
	bh=88afhM3ZHlVbYvTAmz9FQz0j6FhlnJFP56fDX/CwQ/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lk9akDbQRJNnkU8o2URperildUA9Fa/gSC2e+1rBQyGK/IOLZfaz6v97HiXdsBq21U+252y0kOjyM/zBG0h1cAAcxrPBXD6FKpUiK2dwJ+MKpc/w/dg/LA1te4lJRSAO6Lwf0cUu+4BKQ0TtXeAZ2n59rKhgfqKn2Jqbw07FWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMQFBA0q; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782810730; x=1814346730;
  h=date:from:to:cc:subject:message-id;
  bh=88afhM3ZHlVbYvTAmz9FQz0j6FhlnJFP56fDX/CwQ/Q=;
  b=aMQFBA0qoaGkjd1DAF4KmwRPyTmsBaq9TzR36Pn8F5yD5voGfdqdk9gJ
   DNvue6ZPO2V1AOMLTmJXBciDY7Nj1BjVttxJBzNutU7z0ufktiZp4LkjH
   XznlNkEh9Jws+RkQiRs49lFaIgu1G6zkSAO7V5dZOe2r1+/kBCe8R3OVc
   MWNZqbJf3WvBZXcD3HwZ4OhDFcnZYfWrOEETbbDv2uPow+HkkdyXGgeIU
   5lfr9kq+LfoVU5mYWPER2Z25dwtoqEhUxp4jznWv6PwXzol2gMdQMZI0N
   vmnBxUCIAVfyH/6M+edVYGEm7ONcsbPZIvrlCcGO4FFVqdlpMYuCWkJHZ
   g==;
X-CSE-ConnectionGUID: YAqDjNMOSoGZrm8/rqORHg==
X-CSE-MsgGUID: qV+9AmJgTd6A+MlJzQnDFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94900721"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94900721"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:11:55 -0700
X-CSE-ConnectionGUID: 0UTT1np0SC23hnVFijhT7g==
X-CSE-MsgGUID: 70kmXpSdTq2EkQR9bn4P/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="256605645"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2026 02:11:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weUVT-000000008B9-2osI;
	Tue, 30 Jun 2026 09:11:51 +0000
Date: Tue, 30 Jun 2026 17:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a1d83d1b810665bd53ce8a7b7867e054d68676c7
Message-ID: <202606301701.tm5Yb21l-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66053-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F2676E202B

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a1d83d1b810665bd53ce8a7b7867e054d68676c7  media: cec-pin: Fix event FIFO ordering

elapsed time: 733m

configs tested: 206
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260630    clang-23
arc                   randconfig-002-20260630    clang-23
arc                    vdk_hs38_smp_defconfig    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260630    clang-23
arm                   randconfig-002-20260630    clang-23
arm                   randconfig-003-20260630    clang-23
arm                   randconfig-004-20260630    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260630    clang-23
arm64                 randconfig-002-20260630    clang-23
arm64                 randconfig-003-20260630    clang-23
arm64                 randconfig-004-20260630    clang-23
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260630    clang-23
csky                  randconfig-002-20260630    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260630    clang-18
hexagon               randconfig-002-20260630    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260630    clang-22
i386        buildonly-randconfig-002-20260630    clang-22
i386        buildonly-randconfig-003-20260630    clang-22
i386        buildonly-randconfig-004-20260630    clang-22
i386        buildonly-randconfig-005-20260630    clang-22
i386        buildonly-randconfig-006-20260630    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260630    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260630    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260630    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260630    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260630    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260630    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260630    clang-22
i386                  randconfig-011-20260630    gcc-12
i386                  randconfig-012-20260630    gcc-12
i386                  randconfig-013-20260630    gcc-12
i386                  randconfig-014-20260630    gcc-12
i386                  randconfig-015-20260630    gcc-12
i386                  randconfig-016-20260630    gcc-12
i386                  randconfig-017-20260630    gcc-12
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260630    clang-18
loongarch             randconfig-002-20260630    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                      bmips_stb_defconfig    clang-17
mips                      malta_kvm_defconfig    gcc-16.1.0
mips                        qi_lb60_defconfig    clang-17
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260630    clang-18
nios2                 randconfig-002-20260630    clang-18
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-22
parisc                randconfig-001-20260630    clang-22
parisc                         randconfig-002    clang-22
parisc                randconfig-002-20260630    clang-22
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-22
powerpc               randconfig-001-20260630    clang-22
powerpc                        randconfig-002    clang-22
powerpc               randconfig-002-20260630    clang-22
powerpc                        warp_defconfig    gcc-16.1.0
powerpc64                      randconfig-001    clang-22
powerpc64             randconfig-001-20260630    clang-22
powerpc64                      randconfig-002    clang-22
powerpc64             randconfig-002-20260630    clang-22
riscv                            alldefconfig    gcc-16.1.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260630    gcc-9.5.0
riscv                 randconfig-002-20260630    gcc-9.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260630    gcc-9.5.0
s390                  randconfig-002-20260630    gcc-9.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260630    gcc-9.5.0
sh                    randconfig-002-20260630    gcc-9.5.0
sh                          rsk7201_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260630    clang-17
sparc                 randconfig-002-20260630    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260630    clang-17
sparc64               randconfig-002-20260630    clang-17
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260630    clang-17
um                    randconfig-002-20260630    clang-17
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260630    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260630    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260630    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260630    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260630    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260630    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260630    gcc-14
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260630    gcc-14
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260630    gcc-14
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260630    gcc-14
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260630    gcc-14
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260630    gcc-14
x86_64                randconfig-011-20260630    gcc-14
x86_64                randconfig-012-20260630    gcc-14
x86_64                randconfig-013-20260630    gcc-14
x86_64                randconfig-014-20260630    gcc-14
x86_64                randconfig-015-20260630    gcc-14
x86_64                randconfig-016-20260630    gcc-14
x86_64                randconfig-071-20260630    clang-22
x86_64                randconfig-072-20260630    clang-22
x86_64                randconfig-073-20260630    clang-22
x86_64                randconfig-074-20260630    clang-22
x86_64                randconfig-075-20260630    clang-22
x86_64                randconfig-076-20260630    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260630    clang-17
xtensa                randconfig-002-20260630    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


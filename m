Return-Path: <linux-media+bounces-66325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CF/GBOgtRmq/LAsAu9opvQ
	(envelope-from <linux-media+bounces-66325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:22:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681C6F530A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 11:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Z/w9rH8n";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66325-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66325-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D458C31AA4E3
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 09:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054D547D926;
	Thu,  2 Jul 2026 09:09:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170042DFF2
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 09:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983357; cv=none; b=PupZpASExaEmPb1Ea0CErHCDuJuHiqoIz6GGlff8zWAnY7OHTl9sUNCejodJ7w0GzBEQN5s4ZnOPqsiBGaYR/BUobc242ZiImWDuYM9l+yHlopumS6fQV1lR6QKLjN3rQNAWcgQr97oyJNI5eY2c09ovCriGmG5L7ApT+21XMJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983357; c=relaxed/simple;
	bh=dmRvRvj1XXCrt1fZavQ2pIGFim13kSReDUJB05JeNIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=onI6rbpLCeOfy5z0GrkDnaXM18olVhvk8cmF+fDZVzuUHJ9hqfBCoU2xMwEKA6+rj7EMSFuECoJyPfEhJtkWXnD3CIsVHrLbaC+Rrbcqk7gnxVca2Fff0WqWW4wvO3W884R6NTev0hceczFjnyaoNlW5F6b8NIl2IUhHMxlAT2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/w9rH8n; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782983356; x=1814519356;
  h=date:from:to:cc:subject:message-id;
  bh=dmRvRvj1XXCrt1fZavQ2pIGFim13kSReDUJB05JeNIY=;
  b=Z/w9rH8nxRd8V4j+CP9NXzrJ9bCsHPo1QKR7rL1StBrMyl9w0LRO/B1c
   UCJvKaYgqIS3vkog7/IlL2/w7/EO0tcCQOLLVHvgujxm2e3tCYKicGcTR
   RC8vTpqs2mXG1mxE8zmVlEQ9pbUioD3yhkHfvijLleJ3v0nz/Lhk2IR2B
   Y3TlOhzOQojgSYN02z0I4L0F+jFzV/FTT2e0V5oneTZafm+Qbt5FzVusw
   ANV7mOgGFKfUXPdyn+yt5qDAOhA41jDMv+XgvipyyUyUNd4RoS/Jisn0m
   ZoAXH+Jlh0hLKNL7b9Zkt0fJe38+Gg6kiFvLctXo/MZNnonUwLaG3mCab
   g==;
X-CSE-ConnectionGUID: /DzLQTcjS+230bbIXxsQZg==
X-CSE-MsgGUID: JgCiLoAyT5KJKgSsVwsh0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106526841"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="106526841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:09:16 -0700
X-CSE-ConnectionGUID: z5/Cx5/dQvqBm9waDkS1Zg==
X-CSE-MsgGUID: qqwnw7/MQuqqNyJI00YxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="246454788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2026 02:09:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfDPT-00000000Aa1-0vyp;
	Thu, 02 Jul 2026 09:08:46 +0000
Date: Thu, 02 Jul 2026 17:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 7ada4a9817804426a4e27306ee1b4702f054cb35
Message-ID: <202607021738.F0uOr44I-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66325-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6681C6F530A

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 7ada4a9817804426a4e27306ee1b4702f054cb35  media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops

elapsed time: 732m

configs tested: 206
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
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260702    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260702    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260702    gcc-8.5.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260702    gcc-8.5.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260702    gcc-8.5.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260702    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260702    gcc-15.2.0
arm64                 randconfig-002-20260702    gcc-15.2.0
arm64                 randconfig-003-20260702    gcc-15.2.0
arm64                 randconfig-004-20260702    gcc-15.2.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260702    gcc-15.2.0
csky                  randconfig-002-20260702    gcc-15.2.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260702    clang-23
hexagon               randconfig-002-20260702    clang-23
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260702    clang-22
i386        buildonly-randconfig-002-20260702    clang-22
i386        buildonly-randconfig-003-20260702    clang-22
i386        buildonly-randconfig-004-20260702    clang-22
i386        buildonly-randconfig-005-20260702    clang-22
i386        buildonly-randconfig-006-20260702    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260702    gcc-14
i386                  randconfig-002-20260702    gcc-14
i386                  randconfig-003-20260702    gcc-14
i386                  randconfig-004-20260702    gcc-14
i386                  randconfig-005-20260702    gcc-14
i386                  randconfig-006-20260702    gcc-14
i386                  randconfig-007-20260702    gcc-14
i386                  randconfig-011-20260702    clang-22
i386                  randconfig-012-20260702    clang-22
i386                  randconfig-013-20260702    clang-22
i386                  randconfig-014-20260702    clang-22
i386                  randconfig-015-20260702    clang-22
i386                  randconfig-016-20260702    clang-22
i386                  randconfig-017-20260702    clang-22
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                loongson32_defconfig    clang-18
loongarch             randconfig-001-20260702    clang-23
loongarch             randconfig-002-20260702    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                           ci20_defconfig    clang-23
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260702    clang-23
nios2                 randconfig-002-20260702    clang-23
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260702    clang-17
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260702    clang-17
parisc64                            defconfig    clang-23
powerpc                    adder875_defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260702    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260702    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260702    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260702    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-12.5.0
riscv                 randconfig-001-20260702    gcc-12.5.0
riscv                          randconfig-002    gcc-12.5.0
riscv                 randconfig-002-20260702    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-12.5.0
s390                  randconfig-001-20260702    gcc-12.5.0
s390                           randconfig-002    gcc-12.5.0
s390                  randconfig-002-20260702    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-12.5.0
sh                    randconfig-001-20260702    gcc-12.5.0
sh                             randconfig-002    gcc-12.5.0
sh                    randconfig-002-20260702    gcc-12.5.0
sh                           se7619_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260702    gcc-16.1.0
sparc                 randconfig-002-20260702    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260702    gcc-16.1.0
sparc64               randconfig-002-20260702    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260702    gcc-16.1.0
um                    randconfig-002-20260702    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260702    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260702    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260702    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260702    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260702    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260702    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260702    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260702    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260702    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260702    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260702    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260702    clang-22
x86_64                randconfig-011-20260702    clang-22
x86_64                randconfig-012-20260702    clang-22
x86_64                randconfig-013-20260702    clang-22
x86_64                randconfig-014-20260702    clang-22
x86_64                randconfig-015-20260702    clang-22
x86_64                randconfig-016-20260702    clang-22
x86_64                randconfig-071-20260702    clang-22
x86_64                randconfig-072-20260702    clang-22
x86_64                randconfig-073-20260702    clang-22
x86_64                randconfig-074-20260702    clang-22
x86_64                randconfig-075-20260702    clang-22
x86_64                randconfig-076-20260702    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260702    gcc-16.1.0
xtensa                randconfig-002-20260702    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


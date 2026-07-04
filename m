Return-Path: <linux-media+bounces-66576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k2uEOU3rSGptvQAAu9opvQ
	(envelope-from <linux-media+bounces-66576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 13:15:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684B707673
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 13:15:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=e4frcwei;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66576-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66576-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B2173016255
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854DD3A6EEE;
	Sat,  4 Jul 2026 11:15:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C5346771
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 11:15:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783163718; cv=none; b=HhMi0xfHTS7lG+MZkTs04UDC8UstfaAXYpf9od+pJYZyGduzNKZliaPsNCSYf2uTKq2ugebg8QM5oP97Ww0BWNCeDIR4Nix1ln125xxcyR20uDJvp2P8rfuuqYWNdtxCYXwybCGvV+MqgMATiKzCcHyO+WH7NcXUFweC1bTqC0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783163718; c=relaxed/simple;
	bh=YV7GSsEJO+lF3TgBBBDYGJveNrl/TOZPvASG2K6YqYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H5iQbix2MdD0kac/axplz+KwLEGVvt/361yv2zSJBbSIitrb0r2OiE5e16wVVHvRuBThNA8XTTUYY6rae4fqDMDjD78y5w44OjaQ6QFNW4mOFl2HtvT8kOiy1jloUuCmmqcozu3vS5NFpQfW9y5J05R11hIJ4pWOUMey6M++s34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4frcwei; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783163715; x=1814699715;
  h=date:from:to:cc:subject:message-id;
  bh=YV7GSsEJO+lF3TgBBBDYGJveNrl/TOZPvASG2K6YqYk=;
  b=e4frcweih1NapDK1QCml2wS6VHQpmtzLOD8xvqjZu+sgHear6/o3DFwe
   qsYbO9m5aSYNQMsJsyQ/qiXnQ4drRedNS3BhfeMJ96cto9AC+sJ8zD2C3
   qGX6wPuwZUJOcdw5VX760Tg0/aZDZdasCHa15hHWMXiGbfWqj2ruSGYfZ
   J1dLLr3J4nFjgSbCQUZJnQdkkyglXkiwbtEfa2zquE6PkCAKqqCA9FNnE
   QN2j7Fd/nuoEPlH7dqzArtKg/ZLrBbvsQTNDdHj/4TpKBddefTtzaUzZT
   Yuq+z156b+slwiz6U9gP8/ugBJR6zJs9XzMY9m0JTZ7lJAV8/brYo887K
   w==;
X-CSE-ConnectionGUID: hBku2qVsQkaP+PBIh7zt4g==
X-CSE-MsgGUID: eswAmpU1Tlimi4GmdB0YYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83911627"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83911627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 04:15:15 -0700
X-CSE-ConnectionGUID: xlsLB+FBQhebWgpZg0DQpw==
X-CSE-MsgGUID: 8wzUK7BQRj+8ns8q4puwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="246907774"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2026 04:15:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfyL1-00000000D1h-0DuX;
	Sat, 04 Jul 2026 11:15:11 +0000
Date: Sat, 04 Jul 2026 19:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 14651ebf6e9793d5ca0341297e0547ce5ceaf1bc
Message-ID: <202607041900.tcNYgR7j-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66576-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7684B707673

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 14651ebf6e9793d5ca0341297e0547ce5ceaf1bc  Documentation: media: Reword blanking control documentation

elapsed time: 730m

configs tested: 242
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
arc                         haps_hs_defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-16.1.0
arc                   randconfig-001-20260704    gcc-16.1.0
arc                   randconfig-001-20260704    gcc-8.5.0
arc                            randconfig-002    gcc-16.1.0
arc                   randconfig-002-20260704    gcc-16.1.0
arc                   randconfig-002-20260704    gcc-8.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                         at91_dt_defconfig    clang-17
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    gcc-16.1.0
arm                   randconfig-001-20260704    gcc-16.1.0
arm                   randconfig-001-20260704    gcc-8.5.0
arm                            randconfig-002    gcc-16.1.0
arm                   randconfig-002-20260704    gcc-16.1.0
arm                   randconfig-002-20260704    gcc-8.5.0
arm                            randconfig-003    gcc-16.1.0
arm                   randconfig-003-20260704    gcc-16.1.0
arm                   randconfig-003-20260704    gcc-8.5.0
arm                            randconfig-004    gcc-16.1.0
arm                   randconfig-004-20260704    gcc-16.1.0
arm                   randconfig-004-20260704    gcc-8.5.0
arm                         s3c6400_defconfig    gcc-16.1.0
arm                          sp7021_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    gcc-16.1.0
arm64                 randconfig-001-20260704    gcc-16.1.0
arm64                          randconfig-002    gcc-16.1.0
arm64                 randconfig-002-20260704    gcc-16.1.0
arm64                          randconfig-003    gcc-16.1.0
arm64                 randconfig-003-20260704    gcc-16.1.0
arm64                          randconfig-004    gcc-16.1.0
arm64                 randconfig-004-20260704    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    gcc-16.1.0
csky                  randconfig-001-20260704    gcc-16.1.0
csky                           randconfig-002    gcc-16.1.0
csky                  randconfig-002-20260704    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260704    gcc-11.5.0
hexagon               randconfig-001-20260704    gcc-16.1.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260704    gcc-11.5.0
hexagon               randconfig-002-20260704    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260704    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260704    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260704    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260704    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260704    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260704    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260704    gcc-14
i386                  randconfig-002-20260704    gcc-14
i386                  randconfig-003-20260704    gcc-14
i386                  randconfig-004-20260704    gcc-14
i386                  randconfig-005-20260704    gcc-14
i386                  randconfig-006-20260704    gcc-14
i386                  randconfig-007-20260704    gcc-14
i386                           randconfig-011    gcc-13
i386                  randconfig-011-20260704    gcc-13
i386                           randconfig-012    gcc-13
i386                  randconfig-012-20260704    gcc-13
i386                           randconfig-013    gcc-13
i386                  randconfig-013-20260704    gcc-13
i386                           randconfig-014    gcc-13
i386                  randconfig-014-20260704    gcc-13
i386                           randconfig-015    gcc-13
i386                  randconfig-015-20260704    gcc-13
i386                           randconfig-016    gcc-13
i386                  randconfig-016-20260704    gcc-13
i386                           randconfig-017    gcc-13
i386                  randconfig-017-20260704    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260704    gcc-11.5.0
loongarch             randconfig-001-20260704    gcc-16.1.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260704    gcc-11.5.0
loongarch             randconfig-002-20260704    gcc-16.1.0
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
mips                          eyeq5_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260704    gcc-11.5.0
nios2                 randconfig-001-20260704    gcc-16.1.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260704    gcc-11.5.0
nios2                 randconfig-002-20260704    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260704    clang-23
parisc                randconfig-002-20260704    clang-23
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260704    clang-23
powerpc               randconfig-002-20260704    clang-23
powerpc64             randconfig-001-20260704    clang-23
powerpc64             randconfig-002-20260704    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260704    gcc-10.5.0
riscv                 randconfig-002-20260704    gcc-10.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260704    gcc-10.5.0
s390                  randconfig-002-20260704    gcc-10.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                            hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-001-20260704    gcc-10.5.0
sh                    randconfig-002-20260704    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-16.1.0
sparc                 randconfig-001-20260704    gcc-16.1.0
sparc                          randconfig-002    gcc-16.1.0
sparc                 randconfig-002-20260704    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-16.1.0
sparc64               randconfig-001-20260704    gcc-16.1.0
sparc64                        randconfig-002    gcc-16.1.0
sparc64               randconfig-002-20260704    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-16.1.0
um                    randconfig-001-20260704    gcc-16.1.0
um                             randconfig-002    gcc-16.1.0
um                    randconfig-002-20260704    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260704    gcc-14
x86_64      buildonly-randconfig-002-20260704    gcc-14
x86_64      buildonly-randconfig-003-20260704    gcc-14
x86_64      buildonly-randconfig-004-20260704    gcc-14
x86_64      buildonly-randconfig-005-20260704    gcc-14
x86_64      buildonly-randconfig-006-20260704    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260704    clang-22
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260704    clang-22
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260704    clang-22
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260704    clang-22
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260704    clang-22
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260704    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260704    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260704    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260704    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260704    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260704    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260704    clang-22
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260704    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260704    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260704    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260704    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260704    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260704    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-16.1.0
xtensa                randconfig-001-20260704    gcc-16.1.0
xtensa                         randconfig-002    gcc-16.1.0
xtensa                randconfig-002-20260704    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


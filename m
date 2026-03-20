Return-Path: <linux-media+bounces-56580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIiAAkDKvWkrBgMAu9opvQ
	(envelope-from <linux-media+bounces-56580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 23:29:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCA22E1C9D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 23:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 507DC3042B6E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFFD383C82;
	Fri, 20 Mar 2026 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+70ZNmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2F3806DE
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045588; cv=none; b=boCFvVjcvimOEaq5AFuNp+HE5pzFNwy/aoY9yvRhYes4UghbujEn96AMm9dTF5Wtz7uEs0hr6u6yKnakWee4lds+qcKa1Y64017VZddzCVd8PAsML/pilxFn3K23mbNQI0JFm1PEEkJbGnwvprhlKwZus3OZFM3KjsCyZoouGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045588; c=relaxed/simple;
	bh=wSX4VYe9H7z5qI7+a69ka4rICiNHNDx0/g5CafG/ef4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D2hc+rK/MtueTVL219yd9kz1f6QukU7M03rMjIjnsB0Q4bY5hVuxdR64qok8brgsk8X9/LSfhCa2Ajkpvbi1pPp+ujjX88h/lq9orlXR+H/nHUr3WDMLi7HwogGhviFzmLPxCMOUGGEyTVN4kEVAp0lNzBvUBNfLl8VyBtu4ANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+70ZNmQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774045583; x=1805581583;
  h=date:from:to:cc:subject:message-id;
  bh=wSX4VYe9H7z5qI7+a69ka4rICiNHNDx0/g5CafG/ef4=;
  b=J+70ZNmQnVBPniDiLarNJdWfQv5j+ikEVuRFMTU5rWE7TCbY8qWa/IN1
   Y6pyBBIY19b5epW2GfaJkob0WIZXRpROmzHMTmMnkrTjv9RIwxMmDOjH/
   F/0rnYcXcpv/JK0+lB/GFCeUbUiVMS0AjSSJUKLgaZ8m31g11KfF5QGst
   IZaKckoXS+qGVyz5SuCbKVuDrs6CaRjyjx1WqDlq51GCbSL+mMsIgof7W
   7cjL9ruzYbd5fuQloLibyrftRN251GSvpQ7UTeseX5BGKcTvk8Kp6vPsE
   bILu7TRx9XoI8Sz8KiCT2HTceLekWEJgj8hGI2c4J3FBVVncbaVicLnC5
   w==;
X-CSE-ConnectionGUID: JgUabKzBTBWKQQDgA1Z7EA==
X-CSE-MsgGUID: m6cWE6PBTOOvrSCjzb8jkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="78996979"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="78996979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:26:22 -0700
X-CSE-ConnectionGUID: 9hcyzasLQPOx9ATWip0+PA==
X-CSE-MsgGUID: EahaUTADS4y+pv3e174GUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="227900096"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2026 15:26:20 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3iIM-000000000In-23oX;
	Fri, 20 Mar 2026 22:26:18 +0000
Date: Sat, 21 Mar 2026 06:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:int3472] BUILD SUCCESS
 c7ca2b07d07b479151276a6d1eaaf17b32799281
Message-ID: <202603210651.CGPTmqSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56580-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DCA22E1C9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git int3472
branch HEAD: c7ca2b07d07b479151276a6d1eaaf17b32799281  platform: int3472: Drop redundant initialisation to 0 and NULL

elapsed time: 1378m

configs tested: 182
configs skipped: 2

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
arc                   randconfig-001-20260321    gcc-8.5.0
arc                   randconfig-002-20260321    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260321    gcc-8.5.0
arm                   randconfig-002-20260321    gcc-8.5.0
arm                   randconfig-003-20260321    gcc-8.5.0
arm                   randconfig-004-20260321    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260321    clang-23
arm64                 randconfig-002-20260321    clang-23
arm64                 randconfig-003-20260321    clang-23
arm64                 randconfig-004-20260321    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260321    clang-23
csky                  randconfig-002-20260321    clang-23
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260321    gcc-11.5.0
hexagon               randconfig-002-20260321    gcc-11.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260321    clang-20
i386        buildonly-randconfig-002-20260321    clang-20
i386        buildonly-randconfig-003-20260321    clang-20
i386        buildonly-randconfig-004-20260321    clang-20
i386        buildonly-randconfig-005-20260321    clang-20
i386        buildonly-randconfig-006-20260321    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260321    gcc-14
i386                  randconfig-002-20260321    gcc-14
i386                  randconfig-003-20260321    gcc-14
i386                  randconfig-004-20260321    gcc-14
i386                  randconfig-005-20260321    gcc-14
i386                  randconfig-006-20260321    gcc-14
i386                  randconfig-007-20260321    gcc-14
i386                  randconfig-011-20260321    gcc-12
i386                  randconfig-012-20260321    gcc-12
i386                  randconfig-013-20260321    gcc-12
i386                  randconfig-014-20260321    gcc-12
i386                  randconfig-015-20260321    gcc-12
i386                  randconfig-016-20260321    gcc-12
i386                  randconfig-017-20260321    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260321    gcc-11.5.0
loongarch             randconfig-002-20260321    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        m5407c3_defconfig    gcc-15.2.0
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
nios2                 randconfig-001-20260321    gcc-11.5.0
nios2                 randconfig-002-20260321    gcc-11.5.0
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
parisc                randconfig-001-20260321    clang-23
parisc                randconfig-002-20260321    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260321    clang-23
powerpc               randconfig-002-20260321    clang-23
powerpc64             randconfig-001-20260321    clang-23
powerpc64             randconfig-002-20260321    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260321    clang-23
riscv                 randconfig-002-20260321    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260321    clang-23
s390                  randconfig-002-20260321    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260321    clang-23
sh                    randconfig-002-20260321    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260321    gcc-14
sparc                 randconfig-002-20260321    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260321    gcc-14
sparc64               randconfig-002-20260321    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260321    gcc-14
um                    randconfig-002-20260321    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260321    clang-20
x86_64                randconfig-012-20260321    clang-20
x86_64                randconfig-013-20260321    clang-20
x86_64                randconfig-014-20260321    clang-20
x86_64                randconfig-015-20260321    clang-20
x86_64                randconfig-016-20260321    clang-20
x86_64                randconfig-071-20260321    gcc-14
x86_64                randconfig-072-20260321    gcc-14
x86_64                randconfig-073-20260321    gcc-14
x86_64                randconfig-074-20260321    gcc-14
x86_64                randconfig-075-20260321    gcc-14
x86_64                randconfig-076-20260321    gcc-14
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
xtensa                randconfig-001-20260321    gcc-14
xtensa                randconfig-002-20260321    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


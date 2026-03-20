Return-Path: <linux-media+bounces-56551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAJPE6mBvWk4+gIAu9opvQ
	(envelope-from <linux-media+bounces-56551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:19:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF52DE79E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5492930DD361
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148CC2EBBB2;
	Fri, 20 Mar 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8AoCI7O"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702823D1CD7
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026835; cv=none; b=amEa1bBniiO6OwNPRug22Sou34ZilHubCslLuM9cIktAhwHcLCfMCzUb08+PSzozYOUd0HxpcYQbOSN4UKVnijd5MilgYrCWhaFa/ZZM0fh8JGwO+shipdkuT9wFiHw6AE+GpaRCgMQ8+a2DCliqDyMPypSDDxAeUMALRuOxFsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026835; c=relaxed/simple;
	bh=t0zloXhTo5A95YeLw05JmJz29huIqONhS/cy7kwAlto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uLW4MFkrf+2kk3kFRZB1dm+u251V2acw02pAIw9vyFbcxhRmEeixWcnEG2Cj0xudSRxMD+T/YJpCZOjJm0p6B1y01KFlrs9Uj97KbHYvcSbSwD6c8/de+P9tdJdH9iYbMUQRGNUh1ZrbytmLc4Cwbv4TM9gb1GI3w8CA60Ergb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8AoCI7O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774026834; x=1805562834;
  h=date:from:to:cc:subject:message-id;
  bh=t0zloXhTo5A95YeLw05JmJz29huIqONhS/cy7kwAlto=;
  b=j8AoCI7O5lGOyIX+9cTvoaoIBHU+MY++5NgcPwA8FuvLM9Ohfh5WV220
   +xuwAA+bosZjWjjC8uk2OMFnEU5+uOVyZI5Gd1Y8WtON4LFaG6GMT/IcZ
   w9dClhjuN2eSvFpmHkEFCShJLQ8axvFG6Tkdp5pcj9E9uIy3yK+Air8XK
   02LVR1FAK6KTitxOXDUe16NJQk3Q00Db1qhmXTgb8UwKWanWWVxENEJCA
   O6kEuhV7beuo5XagYMnKZtPv3Zj76u/JGWQX4R+87KdynXh4liVViSM7c
   T7qu9R23o2zEhNXxDhU0oYtESFLZR5N4QPtvjLkxn0vcnmHFoP9OPeASK
   w==;
X-CSE-ConnectionGUID: cr0W/jJHQAKXzltQbTWc9Q==
X-CSE-MsgGUID: ZPqOfRqMQ6KKQZdLBsrtTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75309398"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75309398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 10:13:53 -0700
X-CSE-ConnectionGUID: tuTFAlEwT1u9SSyhzNPW9Q==
X-CSE-MsgGUID: YmgSQ7c9QAyZvwtEKtAPQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228067634"
Received: from lkp-server01.sh.intel.com (HELO ba623fe84fe1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 10:13:51 -0700
Received: from kbuild by ba623fe84fe1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3dPx-000000000Cl-1VVs;
	Fri, 20 Mar 2026 17:13:49 +0000
Date: Sat, 21 Mar 2026 01:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 c6b2fcd768b8e417ff061e7a78c5334c7bbf211b
Message-ID: <202603210148.f9ZS9oLT-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56551-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1DF52DE79E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: c6b2fcd768b8e417ff061e7a78c5334c7bbf211b  media: i2c: Add ov2732 image sensor driver

elapsed time: 1076m

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
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260320    gcc-13.4.0
arc                   randconfig-002-20260320    gcc-13.4.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260320    gcc-13.4.0
arm                   randconfig-002-20260320    gcc-13.4.0
arm                   randconfig-003-20260320    gcc-13.4.0
arm                   randconfig-004-20260320    gcc-13.4.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260320    clang-17
arm64                 randconfig-002-20260320    clang-17
arm64                 randconfig-003-20260320    clang-17
arm64                 randconfig-004-20260320    clang-17
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260320    clang-17
csky                  randconfig-002-20260320    clang-17
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260320    gcc-8.5.0
hexagon               randconfig-002-20260320    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260320    gcc-14
i386        buildonly-randconfig-002-20260320    gcc-14
i386        buildonly-randconfig-003-20260320    gcc-14
i386        buildonly-randconfig-004-20260320    gcc-14
i386        buildonly-randconfig-005-20260320    gcc-14
i386        buildonly-randconfig-006-20260320    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260320    clang-20
i386                  randconfig-002-20260320    clang-20
i386                  randconfig-003-20260320    clang-20
i386                  randconfig-004-20260320    clang-20
i386                  randconfig-005-20260320    clang-20
i386                  randconfig-006-20260320    clang-20
i386                  randconfig-007-20260320    clang-20
i386                  randconfig-011-20260320    clang-20
i386                  randconfig-012-20260320    clang-20
i386                  randconfig-013-20260320    clang-20
i386                  randconfig-014-20260320    clang-20
i386                  randconfig-015-20260320    clang-20
i386                  randconfig-016-20260320    clang-20
i386                  randconfig-017-20260320    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260320    gcc-8.5.0
loongarch             randconfig-002-20260320    gcc-8.5.0
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
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260320    gcc-8.5.0
nios2                 randconfig-002-20260320    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260320    gcc-10.5.0
parisc                randconfig-002-20260320    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260320    gcc-10.5.0
powerpc               randconfig-002-20260320    gcc-10.5.0
powerpc64             randconfig-001-20260320    gcc-10.5.0
powerpc64             randconfig-002-20260320    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260320    gcc-8.5.0
riscv                 randconfig-002-20260320    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260320    gcc-8.5.0
s390                  randconfig-002-20260320    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260320    gcc-8.5.0
sh                    randconfig-002-20260320    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260320    gcc-14
sparc                 randconfig-002-20260320    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260320    gcc-14
sparc64               randconfig-002-20260320    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260320    gcc-14
um                    randconfig-002-20260320    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260320    clang-20
x86_64      buildonly-randconfig-002-20260320    clang-20
x86_64      buildonly-randconfig-003-20260320    clang-20
x86_64      buildonly-randconfig-004-20260320    clang-20
x86_64      buildonly-randconfig-005-20260320    clang-20
x86_64      buildonly-randconfig-006-20260320    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-011-20260320    gcc-14
x86_64                randconfig-012-20260320    gcc-14
x86_64                randconfig-013-20260320    gcc-14
x86_64                randconfig-014-20260320    gcc-14
x86_64                randconfig-015-20260320    gcc-14
x86_64                randconfig-016-20260320    gcc-14
x86_64                randconfig-071-20260320    gcc-14
x86_64                randconfig-072-20260320    gcc-14
x86_64                randconfig-073-20260320    gcc-14
x86_64                randconfig-074-20260320    gcc-14
x86_64                randconfig-075-20260320    gcc-14
x86_64                randconfig-076-20260320    gcc-14
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
xtensa                randconfig-001-20260320    gcc-14
xtensa                randconfig-002-20260320    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-media+bounces-56589-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMcABMuCvmnERgMAu9opvQ
	(envelope-from <linux-media+bounces-56589-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 12:36:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1E2E5083
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 12:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A99D03007AF5
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 11:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23509383C65;
	Sat, 21 Mar 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3N/Fd6o"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38636CE03
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774092996; cv=none; b=olSdKOfKo8VjsbjvLLOEw5r5S+HhqC77vOZXuON46K3LlzKM5R77HTZ+QYMdgue1wOyZ3YtDRf+yDLUjJh6CdmGXi+JbTZz+OzfRFDNqiwxgyGyaPS799ny382DqycYtWgysRPJ7mW9w7TdNjyEcfODEmpZW2DCBgLZ+SzyqAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774092996; c=relaxed/simple;
	bh=jcwm4iZ2xiUzCdA9p06Ao6id/93YyAI2Q9RaqXvvdVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZXC/9XBUAF41rYH9N9rgnSjg1wfZUh3Ouoc2DKUytFV3Whl2b4Vmjcm+Ud9jueVoM7xsx5Dn8+r0g0m3OPuQX1M6bBHyuST4+4oN9IIs2C5ziSoZD6No4yXrutDbmCMSnewUMBWK/cVemRwkUdc4sma8W7SFf1xNU8tLOx95Nqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3N/Fd6o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774092994; x=1805628994;
  h=date:from:to:cc:subject:message-id;
  bh=jcwm4iZ2xiUzCdA9p06Ao6id/93YyAI2Q9RaqXvvdVc=;
  b=k3N/Fd6oY/j65Kpl5uhmwLYN1SZ4A1xMf+qHE5QNeAGJTrW6ZagnwZHC
   M5dQN7EQt1rhAjdEQFM052dDNt8m3tOZkKOw/bnYu/p64ldovTTM1cwz9
   eALlhd6H//uZG+fvl2OZdGU4vKIN3lCLjn1cu7OeD+D/UGheesjTtOG29
   5+14+C1EebDT7C0Slr0MlovfjWh3/2fnRLIbO66XgCALbJpsWZH93fB8l
   9hDU7N+324HK3mIp2Gl3Asuaha7LHfrLpVJ3qFnaFlk6k82+DsuPzHWl2
   JQg40kNQaDxNUhIihCcEjwmMK9+kodc7nvjf2RrBPOT19RflIqNzpBLdo
   Q==;
X-CSE-ConnectionGUID: C1YbjpSfSxmUpeD56vrBLg==
X-CSE-MsgGUID: UFSIsk9NQ1GOkq66xTFNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75133170"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75133170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 04:36:34 -0700
X-CSE-ConnectionGUID: rIGUeCJgSxSABCpcWSsnIg==
X-CSE-MsgGUID: RZzA9lukSYyrVI9B2Jf/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="219271506"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Mar 2026 04:36:32 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ucv-000000000gT-2gWy;
	Sat, 21 Mar 2026 11:36:26 +0000
Date: Sat, 21 Mar 2026 19:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD SUCCESS
 9dfa24f341db7c3f4f6512ce1d14c655454b88f0
Message-ID: <202603211958.J00UzGsN-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-56589-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: CDB1E2E5083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 9dfa24f341db7c3f4f6512ce1d14c655454b88f0  media: i2c: Add ov2732 image sensor driver

elapsed time: 803m

configs tested: 170
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260321    gcc-8.5.0
arc                   randconfig-002-20260321    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                   randconfig-001-20260321    gcc-8.5.0
arm                   randconfig-002-20260321    gcc-8.5.0
arm                   randconfig-003-20260321    gcc-8.5.0
arm                   randconfig-004-20260321    gcc-8.5.0
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
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260321    gcc-11.5.0
hexagon               randconfig-002-20260321    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
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
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260321    gcc-11.5.0
loongarch             randconfig-002-20260321    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260321    gcc-11.5.0
nios2                 randconfig-002-20260321    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260321    clang-23
parisc                randconfig-002-20260321    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                      ppc44x_defconfig    clang-23
powerpc               randconfig-001-20260321    clang-23
powerpc               randconfig-002-20260321    clang-23
powerpc64             randconfig-001-20260321    clang-23
powerpc64             randconfig-002-20260321    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260321    clang-23
riscv                 randconfig-002-20260321    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260321    clang-23
s390                  randconfig-002-20260321    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    gcc-15.2.0
sh                    randconfig-001-20260321    clang-23
sh                    randconfig-002-20260321    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260321    gcc-14
sparc                 randconfig-002-20260321    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260321    gcc-14
sparc64               randconfig-002-20260321    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260321    gcc-14
um                    randconfig-002-20260321    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260321    clang-20
x86_64      buildonly-randconfig-002-20260321    clang-20
x86_64      buildonly-randconfig-003-20260321    clang-20
x86_64      buildonly-randconfig-004-20260321    clang-20
x86_64      buildonly-randconfig-005-20260321    clang-20
x86_64      buildonly-randconfig-006-20260321    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260321    clang-20
x86_64                randconfig-002-20260321    clang-20
x86_64                randconfig-003-20260321    clang-20
x86_64                randconfig-004-20260321    clang-20
x86_64                randconfig-005-20260321    clang-20
x86_64                randconfig-006-20260321    clang-20
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
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260321    gcc-14
xtensa                randconfig-002-20260321    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


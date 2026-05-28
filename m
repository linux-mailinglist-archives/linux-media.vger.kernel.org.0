Return-Path: <linux-media+bounces-62976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F4kJ/6VGGoMlQgAu9opvQ
	(envelope-from <linux-media+bounces-62976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:22:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744495F701A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 21:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EEA93018BCD
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF513FF1B4;
	Thu, 28 May 2026 19:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoVmn8tb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF351348C61
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995822; cv=none; b=giW/uaV/W5NxVt4dfC68ttMyTVg6ixYeRGTrqeHF27giC1fJjKSX7tYr2+F6ywsM50eQ/Y5ALsqn9LV0ByV29+v9YbiMZQASDsvj7UR9E84oufr1RJIoKArQf2EOYertjXxj8NomeqoLNU/Qzq32KgIFt8lneuvX15z9+lqpsPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995822; c=relaxed/simple;
	bh=FUhYJQD9L2BWK2UX1IWSLQLDIsNrSwYQPUMSsjhOx6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ckooGyyvkpb5IwcbtXEgrveq4L7dFKXG7dyvsDeZm+hncgH1ipmSBf7U/aEUR7QQV/PtBN+wZkz16MstHCnP8G8SWAhfeUrQo378sZAi61nOa+wulh9U7Nys7YDYQjUirTGWapyah3YvA0mLHAZj4OhtPkIX6EH7tf7ctrOgoTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoVmn8tb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779995821; x=1811531821;
  h=date:from:to:cc:subject:message-id;
  bh=FUhYJQD9L2BWK2UX1IWSLQLDIsNrSwYQPUMSsjhOx6A=;
  b=eoVmn8tbl0DR88JYzKUgB8XjkKlUaVjW79oSbd3LJiCiQWrWZc3HJLKK
   YuHJyH+DTPNCyYd5wrmyGW8mElfaMikpr8z2IyZJPhhY0Pb7LAOjQEV3l
   b4u3ELKOox9LWYmcVOOyOT4ZXO0PkWq37p9O2RsGCZ3w85uUD7KIMtuJL
   1MgNBsE4YvJVwYo/DhPwwndXXEevgdYebip0KoZb4oFwBLvXip0X+WolZ
   smx0MlNHIkU0RFP7AQpVwlUfjvwo9XEhDPhI6fP07gSWEeVHiCru8EYS7
   L+K/NdUQO4HYxvRUYDCB/lYOGgj4IBIwZkJ8T6RApMb9gehIiNZF/EGc8
   g==;
X-CSE-ConnectionGUID: dPuUnHe5QeuegAkyuNpSeQ==
X-CSE-MsgGUID: /+CdPkMhR8WqPhrYa81FNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80960076"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80960076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:17:00 -0700
X-CSE-ConnectionGUID: lPwyW4uuSuOZT+bSdLsaTA==
X-CSE-MsgGUID: +FjA18rWQ/qzTfu5PleMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247717212"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2026 12:16:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSgDx-000000006M0-03BF;
	Thu, 28 May 2026 19:16:57 +0000
Date: Fri, 29 May 2026 03:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a96fcde9fa9a6696991d1f172a8bc2bade82a6d9
Message-ID: <202605290349.gUy37Ivk-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-62976-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 744495F701A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a96fcde9fa9a6696991d1f172a8bc2bade82a6d9  media: staging: imx: remove unnecessary out-of-memory error message

elapsed time: 1578m

configs tested: 184
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
arc                   randconfig-001-20260528    clang-23
arc                   randconfig-002-20260528    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     davinci_all_defconfig    clang-19
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260528    clang-23
arm                   randconfig-002-20260528    clang-23
arm                   randconfig-003-20260528    clang-23
arm                   randconfig-004-20260528    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260528    gcc-15.2.0
arm64                 randconfig-002-20260528    gcc-15.2.0
arm64                 randconfig-003-20260528    gcc-15.2.0
arm64                 randconfig-004-20260528    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260528    gcc-15.2.0
csky                  randconfig-002-20260528    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260528    gcc-11.5.0
hexagon               randconfig-002-20260528    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260528    clang-20
i386        buildonly-randconfig-002-20260528    clang-20
i386        buildonly-randconfig-003-20260528    clang-20
i386        buildonly-randconfig-004-20260528    clang-20
i386        buildonly-randconfig-005-20260528    clang-20
i386        buildonly-randconfig-006-20260528    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260528    gcc-14
i386                  randconfig-002-20260528    gcc-14
i386                  randconfig-003-20260528    gcc-14
i386                  randconfig-004-20260528    gcc-14
i386                  randconfig-005-20260528    gcc-14
i386                  randconfig-006-20260528    gcc-14
i386                  randconfig-007-20260528    gcc-14
i386                  randconfig-011-20260528    clang-20
i386                  randconfig-012-20260528    clang-20
i386                  randconfig-013-20260528    clang-20
i386                  randconfig-014-20260528    clang-20
i386                  randconfig-015-20260528    clang-20
i386                  randconfig-016-20260528    clang-20
i386                  randconfig-017-20260528    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260528    gcc-11.5.0
loongarch             randconfig-002-20260528    gcc-11.5.0
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
nios2                 randconfig-001-20260528    gcc-11.5.0
nios2                 randconfig-002-20260528    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
openrisc                  or1klitex_defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                         randconfig-001    clang-23
parisc                randconfig-001-20260528    clang-23
parisc                         randconfig-002    clang-23
parisc                randconfig-002-20260528    clang-23
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                        randconfig-001    clang-23
powerpc               randconfig-001-20260528    clang-23
powerpc                        randconfig-002    clang-23
powerpc               randconfig-002-20260528    clang-23
powerpc64                      randconfig-001    clang-23
powerpc64             randconfig-001-20260528    clang-23
powerpc64                      randconfig-002    clang-23
powerpc64             randconfig-002-20260528    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260528    gcc-13.4.0
riscv                 randconfig-002-20260528    gcc-13.4.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260528    gcc-13.4.0
s390                  randconfig-002-20260528    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260528    gcc-13.4.0
sh                    randconfig-002-20260528    gcc-13.4.0
sh                        sh7763rdp_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-15.2.0
sparc                 randconfig-001-20260528    gcc-15.2.0
sparc                          randconfig-002    gcc-15.2.0
sparc                 randconfig-002-20260528    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-15.2.0
sparc64               randconfig-001-20260528    gcc-15.2.0
sparc64                        randconfig-002    gcc-15.2.0
sparc64               randconfig-002-20260528    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-15.2.0
um                    randconfig-001-20260528    gcc-15.2.0
um                             randconfig-002    gcc-15.2.0
um                    randconfig-002-20260528    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260528    gcc-14
x86_64      buildonly-randconfig-002-20260528    gcc-14
x86_64      buildonly-randconfig-003-20260528    gcc-14
x86_64      buildonly-randconfig-004-20260528    gcc-14
x86_64      buildonly-randconfig-005-20260528    gcc-14
x86_64      buildonly-randconfig-006-20260528    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260528    gcc-14
x86_64                randconfig-002-20260528    gcc-14
x86_64                randconfig-003-20260528    gcc-14
x86_64                randconfig-004-20260528    gcc-14
x86_64                randconfig-005-20260528    gcc-14
x86_64                randconfig-006-20260528    gcc-14
x86_64                randconfig-011-20260528    gcc-14
x86_64                randconfig-012-20260528    gcc-14
x86_64                randconfig-013-20260528    gcc-14
x86_64                randconfig-014-20260528    gcc-14
x86_64                randconfig-015-20260528    gcc-14
x86_64                randconfig-016-20260528    gcc-14
x86_64                randconfig-071-20260528    gcc-14
x86_64                randconfig-072-20260528    gcc-14
x86_64                randconfig-073-20260528    gcc-14
x86_64                randconfig-074-20260528    gcc-14
x86_64                randconfig-075-20260528    gcc-14
x86_64                randconfig-076-20260528    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                         randconfig-001    gcc-15.2.0
xtensa                randconfig-001-20260528    gcc-15.2.0
xtensa                         randconfig-002    gcc-15.2.0
xtensa                randconfig-002-20260528    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


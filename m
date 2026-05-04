Return-Path: <linux-media+bounces-60322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJMgE8oH+Wnx4QIAu9opvQ
	(envelope-from <linux-media+bounces-60322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 22:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE844C3CA1
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 22:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A144A301C938
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 20:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94ED328B56;
	Mon,  4 May 2026 20:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmIKYx22"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631823264FF
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928130; cv=none; b=fRegzhWyQJqtOsfNDrZVI4MejCzAL3bqW1XDf6nPTrRdKB+6jZOd/Jxh66BA6PleAukEyhhbJtq/chmyTqQRMowjGagxvdeXSzh6yf2jaCIWC93NaYLAmuOqllt/irFd2LqZgVNG20Emp6A5soMFEsYA+7aoXBISYuFF9ftngfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928130; c=relaxed/simple;
	bh=xAB7zibT/K6kKu/TgJJ9b+lj+Mi5Pp6ra5uwJrDTTcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YBx/zuSbcP0SBMWBZLhXrhyiJnsCqOiEn6aYlPrVN8xvPfsSI2GLNNmAO9Qu+GrKWSxZDAhbgSdHHjlVpKsdimWEs+lFTtFulSW3a6wKE+1DF2typOfrJ/WnPZEsOKC1Id5ZZF0rpfcALmwapzleLLniYB0Cir3MnnSd0YU2OWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmIKYx22; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777928126; x=1809464126;
  h=date:from:to:cc:subject:message-id;
  bh=xAB7zibT/K6kKu/TgJJ9b+lj+Mi5Pp6ra5uwJrDTTcc=;
  b=CmIKYx22pzLzx+UMayJrZPpqfstA25S/5ZRHWm39I3fsoUINcndNUCDh
   hAWejGVYjFrA0BJ881yigNF0fUN1e4p1veVwTt6g2NEAr9uAiOg2JPcG9
   e1Z7FQmLJqMnZh4ZKIXH+xmW9caAEr+Ts9RvNbR6ivAahPloUSp29SCz3
   NL02tWEcN6mQMbsGxoOvI1ZpBYrd4UpM5aaiIf8Q27wbdpZPJgE7JMnLM
   aE1M7vMZc1VFtfxWsqIT4zHQfOSJeCA5Zkib7/cSnv25CWGbWvHAEviVv
   /Uj1gmBQ898uUTBR5lIDpd+EGcWPQRVp4iE9XDk354RT+Dli3rtDy+Exy
   g==;
X-CSE-ConnectionGUID: 5wF0kYbSQRGzk3sMcQgwcQ==
X-CSE-MsgGUID: yMRBVJk4SbKZhVQTRq9bFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78841950"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78841950"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:55:24 -0700
X-CSE-ConnectionGUID: QsY/4JCPRDGQMEhcou1vmg==
X-CSE-MsgGUID: XemLf8oNT+ihsGXUc17Wjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="234749814"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 May 2026 13:55:22 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK0Js-0000000040L-33cf;
	Mon, 04 May 2026 20:55:14 +0000
Date: Tue, 05 May 2026 04:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 646ebdd3105809d84ed04aa9e92e47e89cc44502
Message-ID: <202605050438.ZDQEI6f0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 9BE844C3CA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60322-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 646ebdd3105809d84ed04aa9e92e47e89cc44502  media: rc: ttusbir: fix inverted error logic

elapsed time: 733m

configs tested: 298
configs skipped: 41

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260504    gcc-12.5.0
arc                   randconfig-001-20260504    gcc-13.4.0
arc                   randconfig-001-20260504    gcc-8.5.0
arc                   randconfig-001-20260505    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260504    gcc-13.4.0
arc                   randconfig-002-20260504    gcc-8.5.0
arc                   randconfig-002-20260505    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260504    clang-20
arm                   randconfig-001-20260504    gcc-13.4.0
arm                   randconfig-001-20260504    gcc-8.5.0
arm                   randconfig-001-20260505    gcc-8.5.0
arm                            randconfig-002    gcc-11.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260504    clang-23
arm                   randconfig-002-20260504    gcc-13.4.0
arm                   randconfig-002-20260504    gcc-8.5.0
arm                   randconfig-002-20260505    gcc-8.5.0
arm                            randconfig-003    clang-20
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260504    gcc-13.4.0
arm                   randconfig-003-20260504    gcc-8.5.0
arm                   randconfig-003-20260505    gcc-8.5.0
arm                            randconfig-004    gcc-14.3.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260504    clang-23
arm                   randconfig-004-20260504    gcc-13.4.0
arm                   randconfig-004-20260504    gcc-8.5.0
arm                   randconfig-004-20260505    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-8.5.0
arm64                 randconfig-001-20260504    gcc-15.2.0
arm64                 randconfig-001-20260504    gcc-8.5.0
arm64                 randconfig-001-20260505    gcc-14.3.0
arm64                          randconfig-002    gcc-14.3.0
arm64                 randconfig-002-20260504    gcc-15.2.0
arm64                 randconfig-002-20260504    gcc-8.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260504    clang-23
arm64                 randconfig-003-20260504    gcc-15.2.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260504    clang-23
arm64                 randconfig-004-20260504    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-10.5.0
csky                  randconfig-001-20260504    gcc-15.2.0
csky                  randconfig-001-20260505    gcc-14.3.0
csky                           randconfig-002    gcc-10.5.0
csky                  randconfig-002-20260504    gcc-15.2.0
csky                  randconfig-002-20260505    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260504    clang-23
hexagon               randconfig-001-20260505    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260504    clang-23
hexagon               randconfig-002-20260505    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    gcc-14
i386        buildonly-randconfig-001-20260504    gcc-14
i386        buildonly-randconfig-001-20260505    gcc-14
i386                 buildonly-randconfig-002    gcc-14
i386        buildonly-randconfig-002-20260504    gcc-14
i386        buildonly-randconfig-002-20260505    gcc-14
i386                 buildonly-randconfig-003    gcc-14
i386        buildonly-randconfig-003-20260504    gcc-12
i386        buildonly-randconfig-003-20260504    gcc-14
i386        buildonly-randconfig-003-20260505    gcc-14
i386                 buildonly-randconfig-004    gcc-14
i386        buildonly-randconfig-004-20260504    gcc-14
i386        buildonly-randconfig-004-20260505    gcc-14
i386                 buildonly-randconfig-005    gcc-14
i386        buildonly-randconfig-005-20260504    gcc-14
i386        buildonly-randconfig-005-20260505    gcc-14
i386                 buildonly-randconfig-006    gcc-14
i386        buildonly-randconfig-006-20260504    gcc-14
i386        buildonly-randconfig-006-20260505    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    clang-20
i386                  randconfig-001-20260504    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260504    clang-20
i386                  randconfig-002-20260504    gcc-14
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260504    clang-20
i386                  randconfig-003-20260504    gcc-14
i386                           randconfig-004    clang-20
i386                  randconfig-004-20260504    clang-20
i386                  randconfig-004-20260504    gcc-14
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260504    clang-20
i386                  randconfig-005-20260504    gcc-14
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260504    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260504    clang-20
i386                  randconfig-011-20260504    clang-20
i386                  randconfig-011-20260505    clang-20
i386                  randconfig-012-20260504    clang-20
i386                  randconfig-012-20260505    clang-20
i386                  randconfig-013-20260504    clang-20
i386                  randconfig-013-20260505    clang-20
i386                  randconfig-014-20260504    clang-20
i386                  randconfig-014-20260505    clang-20
i386                  randconfig-015-20260504    clang-20
i386                  randconfig-015-20260505    clang-20
i386                  randconfig-016-20260504    clang-20
i386                  randconfig-016-20260505    clang-20
i386                  randconfig-017-20260504    clang-20
i386                  randconfig-017-20260505    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260504    clang-23
loongarch             randconfig-001-20260505    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260504    clang-23
loongarch             randconfig-002-20260505    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260504    clang-23
nios2                 randconfig-001-20260504    gcc-11.5.0
nios2                 randconfig-001-20260505    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260504    clang-23
nios2                 randconfig-002-20260504    gcc-11.5.0
nios2                 randconfig-002-20260505    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260504    gcc-13.4.0
parisc                randconfig-001-20260505    gcc-14.3.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260504    gcc-13.4.0
parisc                randconfig-002-20260505    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      pmac32_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260504    gcc-13.4.0
powerpc               randconfig-001-20260505    gcc-14.3.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260504    gcc-13.4.0
powerpc               randconfig-002-20260505    gcc-14.3.0
powerpc                     tqm8560_defconfig    gcc-15.2.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260504    gcc-13.4.0
powerpc64             randconfig-001-20260505    gcc-14.3.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260504    gcc-13.4.0
powerpc64             randconfig-002-20260505    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260504    gcc-8.5.0
riscv                 randconfig-002-20260504    gcc-8.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260504    gcc-8.5.0
s390                  randconfig-002-20260504    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260504    gcc-8.5.0
sh                    randconfig-002-20260504    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260504    gcc-8.5.0
sparc                 randconfig-002-20260504    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260504    gcc-8.5.0
sparc64               randconfig-002-20260504    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260504    gcc-8.5.0
um                    randconfig-002-20260504    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260504    gcc-12
x86_64               buildonly-randconfig-002    gcc-12
x86_64      buildonly-randconfig-002-20260504    gcc-12
x86_64               buildonly-randconfig-003    gcc-12
x86_64      buildonly-randconfig-003-20260504    gcc-12
x86_64               buildonly-randconfig-004    gcc-12
x86_64      buildonly-randconfig-004-20260504    gcc-12
x86_64               buildonly-randconfig-005    gcc-12
x86_64      buildonly-randconfig-005-20260504    gcc-12
x86_64               buildonly-randconfig-006    gcc-12
x86_64      buildonly-randconfig-006-20260504    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260504    gcc-14
x86_64                randconfig-002-20260504    gcc-14
x86_64                randconfig-003-20260504    gcc-14
x86_64                randconfig-004-20260504    gcc-14
x86_64                randconfig-005-20260504    gcc-14
x86_64                randconfig-006-20260504    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260504    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260504    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260504    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260504    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260504    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260504    gcc-14
x86_64                randconfig-071-20260504    clang-20
x86_64                randconfig-072-20260504    clang-20
x86_64                randconfig-072-20260504    gcc-14
x86_64                randconfig-073-20260504    clang-20
x86_64                randconfig-074-20260504    clang-20
x86_64                randconfig-075-20260504    clang-20
x86_64                randconfig-075-20260504    gcc-14
x86_64                randconfig-076-20260504    clang-20
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
xtensa                           allyesconfig    gcc-11.5.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260504    gcc-8.5.0
xtensa                randconfig-002-20260504    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


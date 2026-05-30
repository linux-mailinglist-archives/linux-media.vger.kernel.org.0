Return-Path: <linux-media+bounces-63094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DCCCB0NDGmpy2ggAu9opvQ
	(envelope-from <linux-media+bounces-63094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 03:54:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B151560AD78
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 03:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1559A30180BB
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 01:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6743090F4;
	Sat, 30 May 2026 01:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bln1yPc9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2611EB5FD
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 01:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780105927; cv=none; b=boSIBGeTDRiK/Yik624QTN66c6XL774HtMARdClwFiidNX4nZnKVfE4r0NOKt6M/OOeudwr/pmwnBJRhcmITnwORvbYLLfiH7+g3NrOtJOrLhDdZ2bOLFPmIU6/QwwpRiYvpL5YKgPETUAXl4NRtd1+2tuRGShSSOxLKPv0hV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780105927; c=relaxed/simple;
	bh=bMrkPrcIgUUBoxnPGxbtwORBe8hBlyge55cuq3XiLu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGlKAizH64jJ/LROMe/yulXvZXHJIjxZX0Uhc3COJv8eKHFgHcGYv46i3+QP0ZQKahrRITdxfKT7Twu3sx31NkrHNH2s+r4hI/7TTe7rBuhPQ+pAGdmP5R11SRPgzfQTcJkjUdd/+UWG5RDrB3SY/Zz07uN7K903zwEjT42dXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bln1yPc9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780105926; x=1811641926;
  h=date:from:to:cc:subject:message-id;
  bh=bMrkPrcIgUUBoxnPGxbtwORBe8hBlyge55cuq3XiLu8=;
  b=bln1yPc9uKZ+P+9iCXz3/irkWOF5sEsJ5vhlBXj4Dti+e7Nd1MKHZxiG
   6rsspuZSq54wGqa7KnI5WCAI3LEa6y5936AY2NZFqJqZg8BvylmT3LdZE
   Nqa7BYNuOaDB23X1yL4IVs3HmrAOG2hnlswIrOyeza91acXcIq0hvJbwd
   FNdrjOmxVW4UIF9o7O05NcaL3CPXIQ41R7Ri20ZwyYp+4EivA8JYfMLQ0
   heaWcrIC+OyYV8KPBzt/Gk60lbNLKoIdi6kSLOrDyeXCY5Pky2NWSy2eC
   wdE/qJqMRtwN9taivL+L3eKyjmt/Xa0onukwNHyNJWJjeea361JyVKfsD
   Q==;
X-CSE-ConnectionGUID: gGudykDrStuO8dB/lOC6Zg==
X-CSE-MsgGUID: 2AYcSUVGQT+ZB+oTSp3VSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80932768"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80932768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 18:52:06 -0700
X-CSE-ConnectionGUID: I1J4S5nXTxqJltUI6NeegQ==
X-CSE-MsgGUID: DXsjEa2TQA6dDM3af2EdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="266641939"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 May 2026 18:52:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT8rp-000000007te-37rz;
	Sat, 30 May 2026 01:52:01 +0000
Date: Sat, 30 May 2026 09:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 f78073e84c800ae146ce62447e7a685a5ceeb92d
Message-ID: <202605300914.U4IJjPbT-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63094-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url]
X-Rspamd-Queue-Id: B151560AD78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: f78073e84c800ae146ce62447e7a685a5ceeb92d  Revert "media: renesas: vsp1: brx: Fix format propagation"

elapsed time: 742m

configs tested: 158
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
arc                   randconfig-001-20260530    gcc-14.3.0
arc                   randconfig-002-20260530    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260530    gcc-14.3.0
arm                   randconfig-002-20260530    gcc-14.3.0
arm                   randconfig-003-20260530    gcc-14.3.0
arm                   randconfig-004-20260530    gcc-14.3.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260530    gcc-8.5.0
arm64                 randconfig-002-20260530    gcc-8.5.0
arm64                 randconfig-003-20260530    gcc-8.5.0
arm64                 randconfig-004-20260530    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260530    gcc-8.5.0
csky                  randconfig-002-20260530    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260530    clang-23
hexagon               randconfig-002-20260530    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260530    clang-20
i386        buildonly-randconfig-002-20260530    clang-20
i386        buildonly-randconfig-003-20260530    clang-20
i386        buildonly-randconfig-004-20260530    clang-20
i386        buildonly-randconfig-005-20260530    clang-20
i386        buildonly-randconfig-006-20260530    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260530    clang-20
i386                  randconfig-002-20260530    clang-20
i386                  randconfig-003-20260530    clang-20
i386                  randconfig-004-20260530    clang-20
i386                  randconfig-005-20260530    clang-20
i386                  randconfig-006-20260530    clang-20
i386                  randconfig-007-20260530    clang-20
i386                  randconfig-011-20260530    clang-20
i386                  randconfig-012-20260530    clang-20
i386                  randconfig-013-20260530    clang-20
i386                  randconfig-014-20260530    clang-20
i386                  randconfig-015-20260530    clang-20
i386                  randconfig-016-20260530    clang-20
i386                  randconfig-017-20260530    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260530    clang-23
loongarch             randconfig-002-20260530    clang-23
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
nios2                 randconfig-001-20260530    clang-23
nios2                 randconfig-002-20260530    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                randconfig-002-20260530    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc                    socrates_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260530    gcc-12.5.0
sh                    randconfig-002-20260530    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260530    gcc-9.5.0
sparc                 randconfig-002-20260530    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260530    gcc-9.5.0
sparc64               randconfig-002-20260530    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260530    gcc-9.5.0
um                    randconfig-002-20260530    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260530    gcc-14
x86_64                randconfig-072-20260530    gcc-14
x86_64                randconfig-073-20260530    gcc-14
x86_64                randconfig-074-20260530    gcc-14
x86_64                randconfig-075-20260530    gcc-14
x86_64                randconfig-076-20260530    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260530    gcc-9.5.0
xtensa                randconfig-002-20260530    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


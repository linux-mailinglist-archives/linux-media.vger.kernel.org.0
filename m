Return-Path: <linux-media+bounces-54675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAzFOckaqmmFLQEAu9opvQ
	(envelope-from <linux-media+bounces-54675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 01:07:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973A219B1E
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 01:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8E2305F667
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 00:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99181187346;
	Fri,  6 Mar 2026 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3gCZX56"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C379CD
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755357; cv=none; b=ZI+Ez0un2zCzS6KT/xvi4DgFKptJu78x9pO/cg4/gstCAvCWmPwgRkhFRxzDgEC/CK8Q92QiMHmtTewjF4vFH781vLpqy3iZKxnzyHbFpw7PQhuRW8FcQJPDQjl7JgcVEv7ZyIafCI7tNc3WYbfw4uW9QI06E/aj6PIiglImTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755357; c=relaxed/simple;
	bh=a/gWC1Pd9gOcXsmWpUnaPClh4nCyjwNW0usTetagsx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UZsLXEBnjRW3+CkjqKPiHEzvtsXqBv088G7lzlS9KR1k4H4smqHfrj8tskcVg2HBJbSjQe0GPgeN+JPTu6P7r6JMogqOJ0BB1A/hBIUelk2uRv74Tgk28univWFJDHQ0u6NuNy7+3G8toDrTpEb7dppNwmZr1UuAoq3bIiWVMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3gCZX56; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772755356; x=1804291356;
  h=date:from:to:cc:subject:message-id;
  bh=a/gWC1Pd9gOcXsmWpUnaPClh4nCyjwNW0usTetagsx8=;
  b=H3gCZX56O0Zy+eqJut3uN1+GllBdNnjm94fFdimYY+Nv7AXrI4FzvdWD
   PYFpLJFIfiCM7A5acRjMfkTzA3AzrS8FwS/H2TBR6WECJeN3bErmiQdDF
   gIiYDU/SdUHbB3sNRJ84+XDNmQOimYmncyBKALiL4zHKauajf1mPQDJyO
   9sUyI2R8WSbVMum7dFdNEnKpp+ob96n4c7dFlFhR7128o0YoSqh/Ns61P
   zFcjgrpia/VZwi3qyqHT8PKdUeamqThgOCSLL4dcQGGz4k4Cg7YeDYfnT
   oZNkYBQhs0pOxnnUBJU99QNY68zJ6ajd8/1FqBEit/q94k53WvrBm8uUS
   A==;
X-CSE-ConnectionGUID: XlfMn88cRg2l2k8JYT1xNw==
X-CSE-MsgGUID: SzlQd5zuRbGVPallraTXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84944500"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84944500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 16:02:32 -0800
X-CSE-ConnectionGUID: 5PlZqSk1QfSzKlgPF3ChXA==
X-CSE-MsgGUID: RidI+myxRpC7mwWL2r+2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="222976357"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2026 16:02:25 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyIe6-0000000005Z-0G5G;
	Fri, 06 Mar 2026 00:02:22 +0000
Date: Fri, 06 Mar 2026 08:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 a7da7fb57f2a787412da1a62292a17fa00fbfbdf
Message-ID: <202603060814.J92Bv6tp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 4973A219B1E
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54675-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxtv.org:url]
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: a7da7fb57f2a787412da1a62292a17fa00fbfbdf  Merge tag 'v7.0-rc2' into __tmp-hverkuil-media-tags_br_v7_1a

elapsed time: 814m

configs tested: 227
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
arc                   randconfig-001-20260305    clang-19
arc                   randconfig-001-20260306    gcc-14.3.0
arc                   randconfig-002-20260305    clang-19
arc                   randconfig-002-20260306    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260305    clang-19
arm                   randconfig-001-20260306    gcc-14.3.0
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-002-20260306    gcc-14.3.0
arm                   randconfig-003-20260305    clang-19
arm                   randconfig-003-20260306    gcc-14.3.0
arm                   randconfig-004-20260305    clang-19
arm                   randconfig-004-20260306    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-8.5.0
arm64                 randconfig-002-20260305    gcc-8.5.0
arm64                 randconfig-003-20260305    gcc-8.5.0
arm64                 randconfig-004-20260305    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260305    gcc-8.5.0
csky                  randconfig-002-20260305    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260305    gcc-15.2.0
hexagon               randconfig-001-20260306    clang-23
hexagon               randconfig-002-20260305    gcc-15.2.0
hexagon               randconfig-002-20260306    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260306    gcc-14
i386        buildonly-randconfig-002-20260306    gcc-14
i386        buildonly-randconfig-003-20260306    gcc-14
i386        buildonly-randconfig-004-20260306    gcc-14
i386        buildonly-randconfig-005-20260306    gcc-14
i386        buildonly-randconfig-006-20260306    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260305    gcc-14
i386                  randconfig-001-20260306    clang-20
i386                  randconfig-002-20260305    gcc-14
i386                  randconfig-002-20260306    clang-20
i386                  randconfig-003-20260305    gcc-14
i386                  randconfig-003-20260306    clang-20
i386                  randconfig-004-20260305    gcc-14
i386                  randconfig-004-20260306    clang-20
i386                  randconfig-005-20260305    gcc-14
i386                  randconfig-005-20260306    clang-20
i386                  randconfig-006-20260305    gcc-14
i386                  randconfig-006-20260306    clang-20
i386                  randconfig-007-20260305    gcc-14
i386                  randconfig-007-20260306    clang-20
i386                  randconfig-011-20260306    gcc-14
i386                  randconfig-012-20260306    gcc-14
i386                  randconfig-013-20260306    gcc-14
i386                  randconfig-014-20260306    gcc-14
i386                  randconfig-015-20260306    gcc-14
i386                  randconfig-016-20260306    gcc-14
i386                  randconfig-017-20260306    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260305    gcc-15.2.0
loongarch             randconfig-001-20260306    clang-23
loongarch             randconfig-002-20260305    gcc-15.2.0
loongarch             randconfig-002-20260306    clang-23
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
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260305    gcc-15.2.0
nios2                 randconfig-001-20260306    clang-23
nios2                 randconfig-002-20260305    gcc-15.2.0
nios2                 randconfig-002-20260306    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-001-20260306    gcc-14.3.0
parisc                randconfig-002-20260305    gcc-9.5.0
parisc                randconfig-002-20260306    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260305    gcc-9.5.0
powerpc               randconfig-001-20260306    gcc-14.3.0
powerpc               randconfig-002-20260305    gcc-9.5.0
powerpc               randconfig-002-20260306    gcc-14.3.0
powerpc64             randconfig-001-20260305    gcc-9.5.0
powerpc64             randconfig-001-20260306    gcc-14.3.0
powerpc64             randconfig-002-20260305    gcc-9.5.0
powerpc64             randconfig-002-20260306    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-001-20260306    clang-19
riscv                 randconfig-002-20260305    clang-23
riscv                 randconfig-002-20260306    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-001-20260306    clang-19
s390                  randconfig-002-20260305    clang-23
s390                  randconfig-002-20260306    clang-19
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-001-20260306    clang-19
sh                    randconfig-002-20260305    clang-23
sh                    randconfig-002-20260306    clang-19
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-14.3.0
sparc                 randconfig-001-20260306    gcc-9.5.0
sparc                 randconfig-002-20260305    gcc-14.3.0
sparc                 randconfig-002-20260306    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260305    gcc-14.3.0
sparc64               randconfig-001-20260306    gcc-9.5.0
sparc64               randconfig-002-20260305    gcc-14.3.0
sparc64               randconfig-002-20260306    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260305    gcc-14.3.0
um                    randconfig-001-20260306    gcc-9.5.0
um                    randconfig-002-20260305    gcc-14.3.0
um                    randconfig-002-20260306    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260305    clang-20
x86_64      buildonly-randconfig-001-20260306    clang-20
x86_64      buildonly-randconfig-002-20260305    clang-20
x86_64      buildonly-randconfig-002-20260306    clang-20
x86_64      buildonly-randconfig-003-20260305    clang-20
x86_64      buildonly-randconfig-003-20260306    clang-20
x86_64      buildonly-randconfig-004-20260305    clang-20
x86_64      buildonly-randconfig-004-20260306    clang-20
x86_64      buildonly-randconfig-005-20260305    clang-20
x86_64      buildonly-randconfig-005-20260306    clang-20
x86_64      buildonly-randconfig-006-20260305    clang-20
x86_64      buildonly-randconfig-006-20260306    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-001-20260306    gcc-14
x86_64                randconfig-002-20260305    clang-20
x86_64                randconfig-002-20260306    gcc-14
x86_64                randconfig-003-20260305    clang-20
x86_64                randconfig-003-20260306    gcc-14
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-004-20260306    gcc-14
x86_64                randconfig-005-20260305    clang-20
x86_64                randconfig-005-20260306    gcc-14
x86_64                randconfig-006-20260305    clang-20
x86_64                randconfig-006-20260306    gcc-14
x86_64                randconfig-011-20260305    clang-20
x86_64                randconfig-012-20260305    clang-20
x86_64                randconfig-013-20260305    clang-20
x86_64                randconfig-014-20260305    clang-20
x86_64                randconfig-015-20260305    clang-20
x86_64                randconfig-016-20260305    clang-20
x86_64                randconfig-071-20260305    gcc-14
x86_64                randconfig-071-20260306    gcc-14
x86_64                randconfig-072-20260305    gcc-14
x86_64                randconfig-072-20260306    gcc-14
x86_64                randconfig-073-20260305    gcc-14
x86_64                randconfig-073-20260306    gcc-14
x86_64                randconfig-074-20260305    gcc-14
x86_64                randconfig-074-20260306    gcc-14
x86_64                randconfig-075-20260305    gcc-14
x86_64                randconfig-075-20260306    gcc-14
x86_64                randconfig-076-20260305    gcc-14
x86_64                randconfig-076-20260306    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260305    gcc-14.3.0
xtensa                randconfig-001-20260306    gcc-9.5.0
xtensa                randconfig-002-20260305    gcc-14.3.0
xtensa                randconfig-002-20260306    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


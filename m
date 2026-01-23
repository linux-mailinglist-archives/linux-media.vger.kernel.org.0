Return-Path: <linux-media+bounces-51369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOb9MBnGcmmJpQAAu9opvQ
	(envelope-from <linux-media+bounces-51369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 01:51:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104686EDB5
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 01:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF8B8301104B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 00:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9797D34FF41;
	Fri, 23 Jan 2026 00:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYrqO1RF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054E346AD6
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 00:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769129492; cv=none; b=Mgw9JWFYREAf4gyeaCGfWUwghPxq1hI/073ZkfiBOwk8fpI8tBDMzJqq0opvHH9yEJxwOv0tNHVtYfrbKnOPneACdlzt91kpJ3RA8RMd7NcI0OgtI4DlPaHoS1nvQ4z45xxVRjnbbHcS7Bvuz0jju3VIylOM8pP9Uc46/400ETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769129492; c=relaxed/simple;
	bh=mfKTj8UrFfU836td2S/yrjEdN083lvPIvg+QgJ+B04I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G1V+CDKYrzAfVDCMzQhFq2I2kyw34KmQ1t5m8/MUDICmz5QzRAKnNyHrSZpslTdei7oFz+bP+iRBrFUNZ4U5EuyZAndGGhq6lvz25HEermK4KcJthWpdUIheMB1SU2SkkESX3aLxFxD4VWzV+UehjRXwHyIo+hHRNtiRZwbKCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYrqO1RF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769129489; x=1800665489;
  h=date:from:to:cc:subject:message-id;
  bh=mfKTj8UrFfU836td2S/yrjEdN083lvPIvg+QgJ+B04I=;
  b=QYrqO1RFgN89q4y5kjTACB8vMjirMWYoBhr1+FabF81j8nO53N4jv3gZ
   G0JebFnGwh5Y6IrAnUoMBqmV+gmKIVz3WlftIMmY1QOq4HP4acdZylWL1
   EeZFf1AO6rfOlMahjPO4GRrBoVsM4YC6r8SlaE70Yn7VWE6TMhvJge9kL
   3zHOdrUWSCtWA07DhTOWENJUbOUoPIy1iaZ6aDDYyGyn7ik0HWLBEpbTx
   uRq0RTQpKj+jLBvtOZlFpYYbcEYg/rUiNww3kbnC1jaqLIbXtG8Nwh2kq
   48EIrqQU7kNBXpwCwlydzy3UHLf0obtxTEIHonfDMhVli3pnud0ueFVkm
   w==;
X-CSE-ConnectionGUID: 1flGdDP/QMyiZj3da2xyGA==
X-CSE-MsgGUID: QNKw9FITTnCkpnkIdLkLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70288401"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70288401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:51:27 -0800
X-CSE-ConnectionGUID: qbr3uFfPTnKzUWzMQdRq4A==
X-CSE-MsgGUID: se6S6Mv+Sr+6VQmnaunAOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211337061"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 16:51:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj5OV-00000000TNC-2uL9;
	Fri, 23 Jan 2026 00:51:23 +0000
Date: Fri, 23 Jan 2026 08:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 c824345288d11e269ce41b36c105715bc2286050
Message-ID: <202601230841.1aYcI8W3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51369-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 104686EDB5
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c824345288d11e269ce41b36c105715bc2286050  media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer

elapsed time: 847m

configs tested: 257
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs103_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260123    gcc-10.5.0
arc                   randconfig-002-20260123    gcc-10.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                     davinci_all_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    clang-22
arm                           h3600_defconfig    gcc-15.2.0
arm                      integrator_defconfig    gcc-15.2.0
arm                            mmp2_defconfig    clang-22
arm                        mvebu_v7_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260123    gcc-10.5.0
arm                   randconfig-002-20260123    gcc-10.5.0
arm                   randconfig-003-20260123    gcc-10.5.0
arm                   randconfig-004-20260123    gcc-10.5.0
arm                           u8500_defconfig    gcc-15.2.0
arm                       versatile_defconfig    clang-22
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260122    gcc-15.2.0
arm64                 randconfig-001-20260123    gcc-15.2.0
arm64                 randconfig-002-20260122    gcc-15.2.0
arm64                 randconfig-002-20260123    gcc-15.2.0
arm64                 randconfig-003-20260122    gcc-15.2.0
arm64                 randconfig-003-20260123    gcc-15.2.0
arm64                 randconfig-004-20260122    gcc-15.2.0
arm64                 randconfig-004-20260123    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260122    gcc-15.2.0
csky                  randconfig-001-20260123    gcc-15.2.0
csky                  randconfig-002-20260122    gcc-15.2.0
csky                  randconfig-002-20260123    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260123    gcc-12.5.0
hexagon               randconfig-002-20260123    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260122    clang-20
i386        buildonly-randconfig-001-20260123    clang-20
i386        buildonly-randconfig-002-20260122    clang-20
i386        buildonly-randconfig-002-20260123    clang-20
i386        buildonly-randconfig-003-20260122    clang-20
i386        buildonly-randconfig-003-20260123    clang-20
i386        buildonly-randconfig-004-20260122    clang-20
i386        buildonly-randconfig-004-20260123    clang-20
i386        buildonly-randconfig-005-20260122    clang-20
i386        buildonly-randconfig-005-20260123    clang-20
i386        buildonly-randconfig-006-20260122    clang-20
i386        buildonly-randconfig-006-20260123    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260123    gcc-14
i386                  randconfig-002-20260123    gcc-14
i386                  randconfig-003-20260123    gcc-14
i386                  randconfig-004-20260123    gcc-14
i386                  randconfig-005-20260123    gcc-14
i386                  randconfig-006-20260123    gcc-14
i386                  randconfig-007-20260123    gcc-14
i386                  randconfig-011-20260122    clang-20
i386                  randconfig-011-20260123    clang-20
i386                  randconfig-012-20260122    clang-20
i386                  randconfig-012-20260123    clang-20
i386                  randconfig-013-20260122    clang-20
i386                  randconfig-013-20260123    clang-20
i386                  randconfig-014-20260122    clang-20
i386                  randconfig-014-20260123    clang-20
i386                  randconfig-015-20260122    clang-20
i386                  randconfig-015-20260123    clang-20
i386                  randconfig-016-20260122    clang-20
i386                  randconfig-016-20260123    clang-20
i386                  randconfig-017-20260122    clang-20
i386                  randconfig-017-20260123    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260123    gcc-12.5.0
loongarch             randconfig-002-20260123    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          sun3x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath25_defconfig    clang-22
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260123    gcc-12.5.0
nios2                 randconfig-002-20260123    gcc-12.5.0
openrisc                         alldefconfig    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260123    gcc-12.5.0
parisc                randconfig-002-20260123    gcc-12.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc5200_defconfig    clang-22
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260123    gcc-12.5.0
powerpc               randconfig-002-20260123    gcc-12.5.0
powerpc64             randconfig-001-20260123    gcc-12.5.0
powerpc64             randconfig-002-20260123    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260123    clang-22
riscv                 randconfig-002-20260123    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260123    clang-22
s390                  randconfig-002-20260123    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    clang-22
sh                    randconfig-001-20260123    clang-22
sh                    randconfig-002-20260123    clang-22
sh                          sdk7786_defconfig    clang-22
sparc                            alldefconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260122    gcc-14.3.0
sparc                 randconfig-001-20260122    gcc-8.5.0
sparc                 randconfig-001-20260123    gcc-13.4.0
sparc                 randconfig-002-20260122    gcc-8.5.0
sparc                 randconfig-002-20260123    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260122    clang-22
sparc64               randconfig-001-20260122    gcc-8.5.0
sparc64               randconfig-001-20260123    gcc-13.4.0
sparc64               randconfig-002-20260122    clang-20
sparc64               randconfig-002-20260122    gcc-8.5.0
sparc64               randconfig-002-20260123    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260122    clang-22
um                    randconfig-001-20260122    gcc-8.5.0
um                    randconfig-001-20260123    gcc-13.4.0
um                    randconfig-002-20260122    gcc-14
um                    randconfig-002-20260122    gcc-8.5.0
um                    randconfig-002-20260123    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260123    clang-20
x86_64      buildonly-randconfig-002-20260123    clang-20
x86_64      buildonly-randconfig-003-20260123    clang-20
x86_64      buildonly-randconfig-004-20260123    clang-20
x86_64      buildonly-randconfig-005-20260123    clang-20
x86_64      buildonly-randconfig-006-20260123    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260122    clang-20
x86_64                randconfig-001-20260123    gcc-14
x86_64                randconfig-002-20260122    clang-20
x86_64                randconfig-002-20260123    gcc-14
x86_64                randconfig-003-20260122    clang-20
x86_64                randconfig-003-20260123    gcc-14
x86_64                randconfig-004-20260122    clang-20
x86_64                randconfig-004-20260123    gcc-14
x86_64                randconfig-005-20260122    clang-20
x86_64                randconfig-005-20260123    gcc-14
x86_64                randconfig-006-20260122    clang-20
x86_64                randconfig-006-20260123    gcc-14
x86_64                randconfig-011-20260122    clang-20
x86_64                randconfig-011-20260123    gcc-14
x86_64                randconfig-012-20260122    clang-20
x86_64                randconfig-012-20260123    gcc-14
x86_64                randconfig-013-20260122    clang-20
x86_64                randconfig-013-20260123    gcc-14
x86_64                randconfig-014-20260122    clang-20
x86_64                randconfig-014-20260123    gcc-14
x86_64                randconfig-015-20260122    clang-20
x86_64                randconfig-015-20260123    gcc-14
x86_64                randconfig-016-20260122    clang-20
x86_64                randconfig-016-20260123    gcc-14
x86_64                randconfig-071-20260123    clang-20
x86_64                randconfig-072-20260123    clang-20
x86_64                randconfig-073-20260123    clang-20
x86_64                randconfig-074-20260123    clang-20
x86_64                randconfig-075-20260123    clang-20
x86_64                randconfig-076-20260123    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260122    gcc-8.5.0
xtensa                randconfig-001-20260123    gcc-13.4.0
xtensa                randconfig-002-20260122    gcc-8.5.0
xtensa                randconfig-002-20260123    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


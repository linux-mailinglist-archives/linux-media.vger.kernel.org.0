Return-Path: <linux-media+bounces-56330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M+iCbrju2njpQIAu9opvQ
	(envelope-from <linux-media+bounces-56330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:53:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D92CAA95
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2898307811D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 11:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD57C379EFD;
	Thu, 19 Mar 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVf4TMDs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F73CB2CC
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921025; cv=none; b=LR6dFSAFf9M8Der7sWJNiw5sjuvGKWtpsdVonCcL7JHaaGU/HmonOYCSZgPbxj/PDlW414aLKuXywTbK5dk2mANclZGUZrwTyaSsmrz2gkwVkfiRavxS6n40sFm1hXtB2lEfoayxJ/3GXmsjmxN/QoMqJICN50VjIxte6a0C+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921025; c=relaxed/simple;
	bh=4No9jHcLucZz5Y6qhxF2VscVMp1VC+yGU8FIp2/cXpY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKZv620Opez4tfYxGACdTGs8OBwKgme4NuJlbFRTl1/vyl/19HH+ivuVWop/kYEgHZPZBp7Yd3fATR2bNr1s+8/FXl98DJBiMh8buI/hQB/yVIFSjLFbCdlbPDsqwPoho9A4RgZLrNR4LXM+XtUYPU+m2VopJz9ASYlaXr5ofzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVf4TMDs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773921022; x=1805457022;
  h=date:from:to:cc:subject:message-id;
  bh=4No9jHcLucZz5Y6qhxF2VscVMp1VC+yGU8FIp2/cXpY=;
  b=WVf4TMDsBGy6SSeNREViJiwHVw+AUNjhnoijKcWRhvSlVHGWJ1cIVOWz
   hbPlJJF7u0u+tE8OGSN/yTIGjXYLnuHa9eQzHpAS6Qd3gX/SQ455PEU7k
   7XIbsWx3fVeKIHx6xZVLK7fUWCjzSEdrzW3K9oX+CbmK4tZIA0t1NLFfA
   5Jw4U7YdCgpwPHRv01/ak+tr+7uSz9EqU14TDKt4oq6Z6RyVDuWyVOpBB
   Ty5OnaVt44wQusppBvoHKE6xGoHaBivd5YhN7RD+qoPEuBvei+lSOZe27
   6tfbQl7YN7IoiIBIZcIyLC1COqklhv9RhDJh9HPi3vxV/t8LJIek2MIuo
   g==;
X-CSE-ConnectionGUID: 7tvkgqIwRrS/cfmuGdTjAQ==
X-CSE-MsgGUID: mP874W4QRzOrio6BOL+TuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92371450"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="92371450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 04:50:22 -0700
X-CSE-ConnectionGUID: CoHcZ188T6+yOo2nTMsxYw==
X-CSE-MsgGUID: oDFVC08bRtueSRU/GCy0tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227880320"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2026 04:50:21 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3BtK-000000000uB-01kL;
	Thu, 19 Mar 2026 11:50:18 +0000
Date: Thu, 19 Mar 2026 19:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 e8d97c270cb46a2a88739019d0f8547adc7d97da
Message-ID: <202603191931.pss86iFP-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56330-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: 883D92CAA95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: e8d97c270cb46a2a88739019d0f8547adc7d97da  media: verisilicon: Fix kernel panic due to __initconst misuse

elapsed time: 1130m

configs tested: 169
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260319    gcc-11.5.0
arc                   randconfig-002-20260319    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260319    gcc-11.5.0
arm                   randconfig-002-20260319    gcc-11.5.0
arm                   randconfig-003-20260319    gcc-11.5.0
arm                   randconfig-004-20260319    gcc-11.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260319    gcc-15.2.0
arm64                 randconfig-002-20260319    gcc-15.2.0
arm64                 randconfig-003-20260319    gcc-15.2.0
arm64                 randconfig-004-20260319    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260319    gcc-15.2.0
csky                  randconfig-002-20260319    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260319    gcc-11.5.0
hexagon               randconfig-002-20260319    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260319    gcc-14
i386        buildonly-randconfig-002-20260319    gcc-14
i386        buildonly-randconfig-003-20260319    gcc-14
i386        buildonly-randconfig-004-20260319    gcc-14
i386        buildonly-randconfig-005-20260319    gcc-14
i386        buildonly-randconfig-006-20260319    gcc-14
i386                  randconfig-001-20260319    gcc-14
i386                  randconfig-002-20260319    gcc-14
i386                  randconfig-003-20260319    gcc-14
i386                  randconfig-004-20260319    gcc-14
i386                  randconfig-005-20260319    gcc-14
i386                  randconfig-006-20260319    gcc-14
i386                  randconfig-007-20260319    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260319    gcc-11.5.0
loongarch             randconfig-002-20260319    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          sun3x_defconfig    gcc-15.2.0
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
nios2                 randconfig-001-20260319    gcc-11.5.0
nios2                 randconfig-002-20260319    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260319    clang-19
parisc                randconfig-002-20260319    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260319    clang-19
powerpc               randconfig-002-20260319    clang-19
powerpc64             randconfig-001-20260319    clang-19
powerpc64             randconfig-002-20260319    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260319    gcc-8.5.0
sparc                 randconfig-002-20260319    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260319    gcc-8.5.0
sparc64               randconfig-002-20260319    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260319    gcc-8.5.0
um                    randconfig-002-20260319    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260319    clang-20
x86_64      buildonly-randconfig-002-20260319    clang-20
x86_64      buildonly-randconfig-003-20260319    clang-20
x86_64      buildonly-randconfig-004-20260319    clang-20
x86_64      buildonly-randconfig-005-20260319    clang-20
x86_64      buildonly-randconfig-006-20260319    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260319    gcc-14
x86_64                randconfig-002-20260319    gcc-14
x86_64                randconfig-003-20260319    gcc-14
x86_64                randconfig-004-20260319    gcc-14
x86_64                randconfig-005-20260319    gcc-14
x86_64                randconfig-006-20260319    gcc-14
x86_64                randconfig-011-20260319    gcc-13
x86_64                randconfig-012-20260319    gcc-13
x86_64                randconfig-013-20260319    gcc-13
x86_64                randconfig-014-20260319    gcc-13
x86_64                randconfig-015-20260319    gcc-13
x86_64                randconfig-016-20260319    gcc-13
x86_64                randconfig-071-20260319    clang-20
x86_64                randconfig-072-20260319    clang-20
x86_64                randconfig-073-20260319    clang-20
x86_64                randconfig-074-20260319    clang-20
x86_64                randconfig-075-20260319    clang-20
x86_64                randconfig-076-20260319    clang-20
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
xtensa                randconfig-001-20260319    gcc-8.5.0
xtensa                randconfig-002-20260319    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


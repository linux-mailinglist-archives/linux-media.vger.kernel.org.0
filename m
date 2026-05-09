Return-Path: <linux-media+bounces-61000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GK/K1BU/2mo4wAAu9opvQ
	(envelope-from <linux-media+bounces-61000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 17:35:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FE5004ED
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 17:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA0843004601
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 15:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7737288C08;
	Sat,  9 May 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfD/U6Vc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AB15B0EC
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778340941; cv=none; b=Lom7GRW7aH9keVZzn2l0JHUa0vxAhcjJToIfoQ7CeTwCHXgoMIPk8qsekvObfUdzRRdAP2xpt4S2/PT71djVMzIuHVzzkkbbLfiAoOULaS+bkIpkmiX4gEZnu7KexW7cW/3bbCMROC3Tp89tqzIjvXgfdKUVqW60p+4EjALUJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778340941; c=relaxed/simple;
	bh=i+xRDG6fsG7dAMvDozudhi7DPFYZTZpXEIvytAOM8R8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UsfXhe713t04VoRLHDvTWGmB4c4R2QrTVEfOPZvc0VeLK8/txWHsG9U1bMHRn+tYK1SBoGnyQaCYsIOA0eHP6dJGiZ074WdvOG3wLnsBTFC+V04vbmCKRuRan/bVYG2w79k/3UKadKNlYNJgcnnk440WSWX4mH8d7InRZn9VSIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfD/U6Vc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778340939; x=1809876939;
  h=date:from:to:cc:subject:message-id;
  bh=i+xRDG6fsG7dAMvDozudhi7DPFYZTZpXEIvytAOM8R8=;
  b=kfD/U6VcFUKqkVg8/cOicEuKsTXQ+co9N6YSkV3dLJGaUZZ/E3NklKk3
   whJ7IoDHwAQLOQSx6wxoD/k6XljHBGOjfzTTB8+F3D2qfymMgVuTnQ7TJ
   HEOEnFAV4ZqAhO3va+glQXyUvt763l9/QFRAb+N0uxaWVOyfLyH0tJ8NW
   ZF17uab8OA2v3l+WCuWPzAQ/JLpdbr7bZtTWIZr5wPUG15po/1wvrX96+
   A6T2NTLA5h0+dTdoyADppfH2Rx1Bi4t0DN19GZvIVtwFwkubQTspUbY+u
   NVTEDhjN8bVreeYLNMl8bnAvBRrw9BjvXHOz8982mInrToZoQyoZKvnks
   Q==;
X-CSE-ConnectionGUID: yUDFlyDtS3+9i416x5ZUGg==
X-CSE-MsgGUID: L+1FxLMWRFqLNrOvarVdtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="104752475"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="104752475"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 08:35:39 -0700
X-CSE-ConnectionGUID: B2mv9TCXThy3A9x+S5Sh5Q==
X-CSE-MsgGUID: a+KkSC2ySnWyk5jKiEMmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241024517"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2026 08:35:37 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLjiI-0000000017l-0oGg;
	Sat, 09 May 2026 15:35:34 +0000
Date: Sat, 09 May 2026 23:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 084973ebd67b28f0945c5d45408f86c58b540110
Message-ID: <202605092313.Lhn5Fhlc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 547FE5004ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61000-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 084973ebd67b28f0945c5d45408f86c58b540110  media: stm32: dcmi: unregister notifier on probe failure

elapsed time: 5114m

configs tested: 433
configs skipped: 71

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260506    gcc-12.5.0
arc                   randconfig-001-20260506    gcc-8.5.0
arc                   randconfig-001-20260507    gcc-14.3.0
arc                   randconfig-001-20260509    gcc-8.5.0
arc                   randconfig-001-20260509    gcc-9.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260506    gcc-12.5.0
arc                   randconfig-002-20260506    gcc-8.5.0
arc                   randconfig-002-20260507    gcc-14.3.0
arc                   randconfig-002-20260509    gcc-8.5.0
arc                   randconfig-002-20260509    gcc-9.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260506    gcc-12.5.0
arm                   randconfig-001-20260506    gcc-8.5.0
arm                   randconfig-001-20260507    gcc-14.3.0
arm                   randconfig-001-20260509    gcc-8.5.0
arm                   randconfig-001-20260509    gcc-9.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260506    gcc-12.5.0
arm                   randconfig-002-20260506    gcc-8.5.0
arm                   randconfig-002-20260507    gcc-14.3.0
arm                   randconfig-002-20260509    gcc-8.5.0
arm                   randconfig-002-20260509    gcc-9.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260506    gcc-12.5.0
arm                   randconfig-003-20260506    gcc-8.5.0
arm                   randconfig-003-20260507    gcc-14.3.0
arm                   randconfig-003-20260509    gcc-8.5.0
arm                   randconfig-003-20260509    gcc-9.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260506    gcc-12.5.0
arm                   randconfig-004-20260506    gcc-8.5.0
arm                   randconfig-004-20260507    gcc-14.3.0
arm                   randconfig-004-20260509    gcc-8.5.0
arm                   randconfig-004-20260509    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-10.5.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260506    gcc-15.2.0
arm64                 randconfig-001-20260509    gcc-10.5.0
arm64                          randconfig-002    gcc-10.5.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260506    gcc-15.2.0
arm64                 randconfig-002-20260509    gcc-10.5.0
arm64                          randconfig-003    gcc-10.5.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260506    gcc-15.2.0
arm64                 randconfig-003-20260509    gcc-10.5.0
arm64                          randconfig-004    gcc-10.5.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260506    gcc-15.2.0
arm64                 randconfig-004-20260509    gcc-10.5.0
csky                             alldefconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-10.5.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260506    gcc-15.2.0
csky                  randconfig-001-20260509    gcc-10.5.0
csky                           randconfig-002    gcc-10.5.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260506    gcc-15.2.0
csky                  randconfig-002-20260509    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260506    clang-23
hexagon               randconfig-001-20260506    gcc-11.5.0
hexagon               randconfig-001-20260509    clang-17
hexagon               randconfig-001-20260509    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260506    clang-23
hexagon               randconfig-002-20260506    gcc-11.5.0
hexagon               randconfig-002-20260509    clang-17
hexagon               randconfig-002-20260509    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260506    clang-20
i386        buildonly-randconfig-001-20260509    gcc-14
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260506    clang-20
i386        buildonly-randconfig-002-20260509    gcc-14
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260506    clang-20
i386        buildonly-randconfig-003-20260509    gcc-14
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260506    clang-20
i386        buildonly-randconfig-004-20260509    gcc-14
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260506    clang-20
i386        buildonly-randconfig-005-20260509    gcc-14
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260506    clang-20
i386        buildonly-randconfig-006-20260509    gcc-14
i386                                defconfig    gcc-15.2.0
i386                           randconfig-001    gcc-14
i386                  randconfig-001-20260506    gcc-14
i386                  randconfig-001-20260509    clang-20
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260506    gcc-14
i386                  randconfig-002-20260509    clang-20
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260506    gcc-14
i386                  randconfig-003-20260509    clang-20
i386                           randconfig-004    gcc-14
i386                  randconfig-004-20260506    gcc-14
i386                  randconfig-004-20260509    clang-20
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260506    gcc-14
i386                  randconfig-005-20260509    clang-20
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260506    gcc-14
i386                  randconfig-006-20260509    clang-20
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260506    gcc-14
i386                  randconfig-007-20260509    clang-20
i386                  randconfig-007-20260509    gcc-14
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260506    clang-20
i386                  randconfig-011-20260509    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260506    clang-20
i386                  randconfig-012-20260509    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260506    clang-20
i386                  randconfig-013-20260509    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260506    clang-20
i386                  randconfig-014-20260509    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260506    clang-20
i386                  randconfig-015-20260509    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260506    clang-20
i386                  randconfig-016-20260509    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260506    clang-20
i386                  randconfig-017-20260509    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260506    clang-23
loongarch             randconfig-001-20260506    gcc-11.5.0
loongarch             randconfig-001-20260509    clang-17
loongarch             randconfig-001-20260509    gcc-11.5.0
loongarch             randconfig-001-20260509    gcc-15.2.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260506    clang-23
loongarch             randconfig-002-20260506    gcc-11.5.0
loongarch             randconfig-002-20260509    clang-17
loongarch             randconfig-002-20260509    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
microblaze                       alldefconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    clang-23
mips                          eyeq5_defconfig    gcc-15.2.0
mips                           ip32_defconfig    clang-23
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260506    clang-23
nios2                 randconfig-001-20260506    gcc-11.5.0
nios2                 randconfig-001-20260506    gcc-8.5.0
nios2                 randconfig-001-20260509    clang-17
nios2                 randconfig-001-20260509    gcc-11.5.0
nios2                 randconfig-001-20260509    gcc-15.2.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260506    clang-23
nios2                 randconfig-002-20260506    gcc-11.5.0
nios2                 randconfig-002-20260506    gcc-8.5.0
nios2                 randconfig-002-20260509    clang-17
nios2                 randconfig-002-20260509    gcc-11.5.0
nios2                 randconfig-002-20260509    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
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
parisc                         randconfig-001    gcc-11.5.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260506    gcc-13.4.0
parisc                randconfig-001-20260509    gcc-11.5.0
parisc                         randconfig-002    gcc-11.5.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260506    gcc-13.4.0
parisc                randconfig-002-20260509    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       eiger_defconfig    clang-23
powerpc                      ppc64e_defconfig    gcc-15.2.0
powerpc                        randconfig-001    gcc-11.5.0
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260506    gcc-13.4.0
powerpc               randconfig-001-20260509    gcc-11.5.0
powerpc                        randconfig-002    gcc-11.5.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260506    gcc-13.4.0
powerpc               randconfig-002-20260509    gcc-11.5.0
powerpc64                      randconfig-001    gcc-11.5.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260506    gcc-13.4.0
powerpc64             randconfig-001-20260509    gcc-11.5.0
powerpc64                      randconfig-002    gcc-11.5.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260506    gcc-13.4.0
powerpc64             randconfig-002-20260509    gcc-11.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260506    gcc-8.5.0
riscv                 randconfig-001-20260507    clang-23
riscv                 randconfig-001-20260509    clang-23
riscv                          randconfig-002    gcc-8.5.0
riscv                 randconfig-002-20260506    gcc-8.5.0
riscv                 randconfig-002-20260507    clang-23
riscv                 randconfig-002-20260509    clang-23
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-15.2.0
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-8.5.0
s390                  randconfig-001-20260506    gcc-8.5.0
s390                  randconfig-001-20260507    clang-23
s390                  randconfig-001-20260509    clang-23
s390                           randconfig-002    gcc-8.5.0
s390                  randconfig-002-20260506    gcc-8.5.0
s390                  randconfig-002-20260507    clang-23
s390                  randconfig-002-20260509    clang-23
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.2.0
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                             randconfig-001    gcc-8.5.0
sh                    randconfig-001-20260506    gcc-8.5.0
sh                    randconfig-001-20260507    clang-23
sh                    randconfig-001-20260509    clang-23
sh                             randconfig-002    gcc-8.5.0
sh                    randconfig-002-20260506    gcc-8.5.0
sh                    randconfig-002-20260507    clang-23
sh                    randconfig-002-20260509    clang-23
sh                             shx3_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    clang-23
sparc                 randconfig-001-20260506    gcc-11.5.0
sparc                 randconfig-001-20260509    clang-23
sparc                          randconfig-002    clang-23
sparc                 randconfig-002-20260506    gcc-11.5.0
sparc                 randconfig-002-20260509    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    clang-23
sparc64               randconfig-001-20260506    gcc-11.5.0
sparc64               randconfig-001-20260509    clang-23
sparc64                        randconfig-002    clang-23
sparc64               randconfig-002-20260506    gcc-11.5.0
sparc64               randconfig-002-20260509    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    clang-23
um                    randconfig-001-20260506    gcc-11.5.0
um                    randconfig-001-20260509    clang-23
um                             randconfig-002    clang-23
um                    randconfig-002-20260506    gcc-11.5.0
um                    randconfig-002-20260509    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260506    clang-20
x86_64      buildonly-randconfig-001-20260509    clang-20
x86_64      buildonly-randconfig-002-20260506    clang-20
x86_64      buildonly-randconfig-002-20260506    gcc-14
x86_64      buildonly-randconfig-002-20260509    clang-20
x86_64      buildonly-randconfig-003-20260506    clang-20
x86_64      buildonly-randconfig-003-20260509    clang-20
x86_64      buildonly-randconfig-004-20260506    clang-20
x86_64      buildonly-randconfig-004-20260509    clang-20
x86_64      buildonly-randconfig-005-20260506    clang-20
x86_64      buildonly-randconfig-005-20260506    gcc-14
x86_64      buildonly-randconfig-005-20260509    clang-20
x86_64      buildonly-randconfig-006-20260506    clang-20
x86_64      buildonly-randconfig-006-20260509    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260506    clang-20
x86_64                randconfig-001-20260509    clang-20
x86_64                randconfig-001-20260509    gcc-14
x86_64                         randconfig-002    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260506    clang-20
x86_64                randconfig-002-20260509    clang-20
x86_64                randconfig-002-20260509    gcc-14
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260506    clang-20
x86_64                randconfig-003-20260509    clang-20
x86_64                randconfig-003-20260509    gcc-14
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260506    clang-20
x86_64                randconfig-004-20260509    clang-20
x86_64                randconfig-004-20260509    gcc-14
x86_64                         randconfig-005    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260506    clang-20
x86_64                randconfig-005-20260509    clang-20
x86_64                randconfig-005-20260509    gcc-14
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260506    clang-20
x86_64                randconfig-006-20260509    clang-20
x86_64                randconfig-006-20260509    gcc-14
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260506    clang-20
x86_64                randconfig-011-20260509    gcc-14
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260506    clang-20
x86_64                randconfig-012-20260509    gcc-14
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260506    clang-20
x86_64                randconfig-013-20260509    gcc-14
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260506    clang-20
x86_64                randconfig-014-20260509    gcc-14
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260506    clang-20
x86_64                randconfig-015-20260506    gcc-12
x86_64                randconfig-015-20260509    gcc-14
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260506    clang-20
x86_64                randconfig-016-20260506    gcc-12
x86_64                randconfig-016-20260509    gcc-14
x86_64                         randconfig-071    clang-20
x86_64                randconfig-071-20260506    clang-20
x86_64                randconfig-071-20260509    clang-20
x86_64                randconfig-071-20260509    gcc-14
x86_64                         randconfig-072    clang-20
x86_64                randconfig-072-20260506    clang-20
x86_64                randconfig-072-20260509    clang-20
x86_64                randconfig-072-20260509    gcc-14
x86_64                         randconfig-073    clang-20
x86_64                randconfig-073-20260506    clang-20
x86_64                randconfig-073-20260509    clang-20
x86_64                         randconfig-074    clang-20
x86_64                randconfig-074-20260506    clang-20
x86_64                randconfig-074-20260509    clang-20
x86_64                         randconfig-075    clang-20
x86_64                randconfig-075-20260506    clang-20
x86_64                randconfig-075-20260509    clang-20
x86_64                         randconfig-076    clang-20
x86_64                randconfig-076-20260506    clang-20
x86_64                randconfig-076-20260509    clang-20
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                         randconfig-001    clang-23
xtensa                randconfig-001-20260506    gcc-11.5.0
xtensa                randconfig-001-20260509    clang-23
xtensa                         randconfig-002    clang-23
xtensa                randconfig-002-20260506    gcc-11.5.0
xtensa                randconfig-002-20260509    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


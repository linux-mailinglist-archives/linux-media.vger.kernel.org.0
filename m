Return-Path: <linux-media+bounces-53758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABO3HEHfoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:15:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BD1BBDBA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D42B30E4DC0
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C999636AB5A;
	Fri, 27 Feb 2026 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/duHgKF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C236C0BB
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215950; cv=none; b=IbVomSJGeDHiHHpILFxf7qADhDVFk72GW3ALM2ysdKZmHVxCF3G5m7NQu5Y9KNQIpb4XbpPtEZJ2dJCli+0malGqppbWyPO8RvCvtQDcmKaR3C2zmJHlTLfq3W33HUYMOUpCXT2DnYiVwutAd28PsswUI6xrZ09cuIRcKljTMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215950; c=relaxed/simple;
	bh=a+d33furGH2HIUq7/2uVZKtWEMujlWxywOVPyeVpErA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QDoO8+LQZpnkfO1Y/eHFeTj/UVZiz1odBFrTHrGjW1VmgjvElIdZjiID3dymEWPJ7Rvh/kaa4ZvgBOAr7VdkPCPwuc1WypBLv5g9uaE9HO488iUsb7gBdoBedy8sdxtm9tm9DmZrIo4UZgdTXaoC/1FwxGi1BB5CcAefXIVTsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/duHgKF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772215945; x=1803751945;
  h=date:from:to:cc:subject:message-id;
  bh=a+d33furGH2HIUq7/2uVZKtWEMujlWxywOVPyeVpErA=;
  b=a/duHgKF0oVkpM0oeqUCUwCj/6ZHBha18h7oFCEn217At91wB3k6Vkbv
   z1wFWJHYtWvNxQgFoaAFGGm2mYb0zxuSyTpz+VfbI3t8tHFM43SlJexhl
   HAmGHuphXpmj73lFsRpWg8flke0C0p8nc3gtEXtK7s+IRdNFetifHy+lz
   82vY2FXtboRUDkR8CeO0aLji6N0d4VusXyeiRsbZJ9S+868JBaN+eNqkJ
   sfIK5gChrsD1p2N71rRNRdFxre5KVR8F5S9tvLYZnRcgdfI879n966Atu
   taNQnhs7go4Y+9vIAJlY21w9a6XVMMa/8VMqMcM3ZjBKQLnWRkrQWWN92
   w==;
X-CSE-ConnectionGUID: zW6zLNEVTz+QOuvNpkjdkA==
X-CSE-MsgGUID: vA/zZ5fVSD2QEPjkf46/gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73008547"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73008547"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 10:12:24 -0800
X-CSE-ConnectionGUID: /PCJAHFCSPyhhPo7J/UL5g==
X-CSE-MsgGUID: 7jWaQnkSSRCLXZgYXIwmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="239969595"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2026 10:12:22 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vw2K3-00000000Asx-3ut4;
	Fri, 27 Feb 2026 18:12:19 +0000
Date: Sat, 28 Feb 2026 02:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 f505e978d1a0442adbbde48aed38c084ddea6d6e
Message-ID: <202602280250.c540NYDU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-53758-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: E09BD1BBDBA
X-Rspamd-Action: no action

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: f505e978d1a0442adbbde48aed38c084ddea6d6e  docs: media: document media multi-committers rules and process

elapsed time: 724m

configs tested: 316
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.2.0
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                          axs101_defconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                     haps_hs_smp_defconfig    clang-23
arc                     haps_hs_smp_defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    clang-23
arc                   randconfig-001-20260227    gcc-8.5.0
arc                   randconfig-002-20260227    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    gcc-14
arm                            mmp2_defconfig    gcc-15.2.0
arm                        multi_v5_defconfig    clang-23
arm                        mvebu_v5_defconfig    gcc-15.2.0
arm                             mxs_defconfig    clang-23
arm                           omap1_defconfig    gcc-15.2.0
arm                   randconfig-001-20260227    gcc-14.3.0
arm                   randconfig-001-20260227    gcc-8.5.0
arm                   randconfig-002-20260227    clang-23
arm                   randconfig-002-20260227    gcc-8.5.0
arm                   randconfig-003-20260227    gcc-15.2.0
arm                   randconfig-003-20260227    gcc-8.5.0
arm                   randconfig-004-20260227    clang-23
arm                   randconfig-004-20260227    gcc-8.5.0
arm                           u8500_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260227    clang-23
arm64                 randconfig-002-20260227    clang-23
arm64                 randconfig-003-20260227    clang-23
arm64                 randconfig-004-20260227    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260227    clang-23
csky                  randconfig-002-20260227    clang-23
hexagon                          alldefconfig    gcc-14
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260227    clang-23
hexagon               randconfig-001-20260228    clang-23
hexagon               randconfig-002-20260227    clang-23
hexagon               randconfig-002-20260228    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260227    clang-20
i386        buildonly-randconfig-002-20260227    clang-20
i386        buildonly-randconfig-003-20260227    clang-20
i386        buildonly-randconfig-004-20260227    clang-20
i386        buildonly-randconfig-005-20260227    clang-20
i386        buildonly-randconfig-006-20260227    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260227    clang-20
i386                  randconfig-002-20260227    clang-20
i386                  randconfig-003-20260227    clang-20
i386                  randconfig-003-20260227    gcc-14
i386                  randconfig-004-20260227    clang-20
i386                  randconfig-004-20260227    gcc-14
i386                  randconfig-005-20260227    clang-20
i386                  randconfig-005-20260227    gcc-12
i386                  randconfig-006-20260227    clang-20
i386                  randconfig-006-20260227    gcc-14
i386                  randconfig-007-20260227    clang-20
i386                  randconfig-011-20260227    clang-20
i386                  randconfig-011-20260227    gcc-14
i386                  randconfig-012-20260227    gcc-14
i386                  randconfig-013-20260227    clang-20
i386                  randconfig-013-20260227    gcc-14
i386                  randconfig-014-20260227    gcc-14
i386                  randconfig-015-20260227    gcc-13
i386                  randconfig-015-20260227    gcc-14
i386                  randconfig-016-20260227    clang-20
i386                  randconfig-016-20260227    gcc-14
i386                  randconfig-017-20260227    gcc-14
loongarch                        alldefconfig    clang-20
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260227    clang-23
loongarch             randconfig-001-20260227    gcc-15.2.0
loongarch             randconfig-001-20260228    clang-23
loongarch             randconfig-002-20260227    clang-20
loongarch             randconfig-002-20260227    clang-23
loongarch             randconfig-002-20260228    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          amiga_defconfig    clang-23
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                       m5249evb_defconfig    gcc-14
m68k                       m5475evb_defconfig    gcc-15.2.0
m68k                          multi_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          eyeq5_defconfig    gcc-14
mips                          rb532_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260227    clang-23
nios2                 randconfig-001-20260227    gcc-11.5.0
nios2                 randconfig-001-20260228    clang-23
nios2                 randconfig-002-20260227    clang-23
nios2                 randconfig-002-20260227    gcc-11.5.0
nios2                 randconfig-002-20260228    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                   de0_nano_defconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260227    clang-17
parisc                randconfig-001-20260227    gcc-8.5.0
parisc                randconfig-001-20260228    gcc-8.5.0
parisc                randconfig-002-20260227    clang-17
parisc                randconfig-002-20260227    gcc-8.5.0
parisc                randconfig-002-20260228    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      arches_defconfig    clang-23
powerpc                      bamboo_defconfig    gcc-15.2.0
powerpc                        cell_defconfig    gcc-14
powerpc                       ebony_defconfig    clang-23
powerpc                      ep88xc_defconfig    gcc-15.2.0
powerpc                        fsp2_defconfig    gcc-15.2.0
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-23
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                     mpc5200_defconfig    clang-23
powerpc                       ppc64_defconfig    clang-23
powerpc                       ppc64_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260227    clang-17
powerpc               randconfig-001-20260227    gcc-11.5.0
powerpc               randconfig-001-20260228    gcc-8.5.0
powerpc               randconfig-002-20260227    clang-17
powerpc               randconfig-002-20260228    gcc-8.5.0
powerpc                     tqm5200_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260227    clang-17
powerpc64             randconfig-001-20260227    gcc-10.5.0
powerpc64             randconfig-001-20260228    gcc-8.5.0
powerpc64             randconfig-002-20260227    clang-17
powerpc64             randconfig-002-20260227    gcc-14.3.0
powerpc64             randconfig-002-20260228    gcc-8.5.0
riscv                            alldefconfig    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260227    clang-23
riscv                 randconfig-001-20260227    gcc-12.5.0
riscv                 randconfig-001-20260228    gcc-15.2.0
riscv                 randconfig-002-20260227    gcc-12.5.0
riscv                 randconfig-002-20260227    gcc-8.5.0
riscv                 randconfig-002-20260228    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260227    gcc-11.5.0
s390                  randconfig-001-20260227    gcc-12.5.0
s390                  randconfig-001-20260228    gcc-15.2.0
s390                  randconfig-002-20260227    gcc-12.5.0
s390                  randconfig-002-20260227    gcc-9.5.0
s390                  randconfig-002-20260228    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                         apsh4a3a_defconfig    clang-23
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-15.2.0
sh                             espt_defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                          lboxre2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260227    gcc-12.5.0
sh                    randconfig-001-20260228    gcc-15.2.0
sh                    randconfig-002-20260227    gcc-12.5.0
sh                    randconfig-002-20260227    gcc-15.2.0
sh                    randconfig-002-20260228    gcc-15.2.0
sh                          sdk7786_defconfig    gcc-15.2.0
sh                           se7750_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    clang-23
sh                              ul2_defconfig    gcc-14
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260227    clang-23
sparc                 randconfig-001-20260227    gcc-11.5.0
sparc                 randconfig-002-20260227    clang-23
sparc                 randconfig-002-20260227    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260227    clang-23
sparc64               randconfig-002-20260227    clang-23
um                               alldefconfig    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260227    clang-23
um                    randconfig-002-20260227    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260227    gcc-14
x86_64      buildonly-randconfig-002-20260227    gcc-14
x86_64      buildonly-randconfig-003-20260227    clang-20
x86_64      buildonly-randconfig-003-20260227    gcc-14
x86_64      buildonly-randconfig-004-20260227    gcc-14
x86_64      buildonly-randconfig-005-20260227    gcc-14
x86_64      buildonly-randconfig-006-20260227    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260227    clang-20
x86_64                randconfig-001-20260227    gcc-13
x86_64                randconfig-002-20260227    clang-20
x86_64                randconfig-002-20260227    gcc-13
x86_64                randconfig-003-20260227    gcc-13
x86_64                randconfig-003-20260227    gcc-14
x86_64                randconfig-004-20260227    gcc-13
x86_64                randconfig-005-20260227    gcc-13
x86_64                randconfig-005-20260227    gcc-14
x86_64                randconfig-006-20260227    gcc-13
x86_64                randconfig-006-20260227    gcc-14
x86_64                randconfig-011-20260227    gcc-14
x86_64                randconfig-012-20260227    gcc-14
x86_64                randconfig-013-20260227    clang-20
x86_64                randconfig-013-20260227    gcc-14
x86_64                randconfig-014-20260227    clang-20
x86_64                randconfig-014-20260227    gcc-14
x86_64                randconfig-015-20260227    clang-20
x86_64                randconfig-015-20260227    gcc-14
x86_64                randconfig-016-20260227    gcc-14
x86_64                randconfig-071-20260227    gcc-12
x86_64                randconfig-071-20260227    gcc-14
x86_64                randconfig-072-20260227    clang-20
x86_64                randconfig-072-20260227    gcc-14
x86_64                randconfig-073-20260227    gcc-14
x86_64                randconfig-074-20260227    clang-20
x86_64                randconfig-074-20260227    gcc-14
x86_64                randconfig-075-20260227    clang-20
x86_64                randconfig-075-20260227    gcc-14
x86_64                randconfig-076-20260227    clang-20
x86_64                randconfig-076-20260227    gcc-14
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
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                generic_kc705_defconfig    gcc-15.2.0
xtensa                  nommu_kc705_defconfig    clang-23
xtensa                randconfig-001-20260227    clang-23
xtensa                randconfig-001-20260227    gcc-15.2.0
xtensa                randconfig-002-20260227    clang-23
xtensa                randconfig-002-20260227    gcc-10.5.0
xtensa                    smp_lx200_defconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


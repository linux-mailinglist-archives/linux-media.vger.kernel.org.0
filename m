Return-Path: <linux-media+bounces-59088-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jN0DMydN5GlZTwEAu9opvQ
	(envelope-from <linux-media+bounces-59088-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 05:33:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994A42301E
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 05:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C47F6300E701
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 03:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA874361DAB;
	Sun, 19 Apr 2026 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcQdNoh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DF226C3BD
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776569605; cv=none; b=Ygs1GDO9shp5B91idYCm0SDAyirSKfgpy83TATq5QddDGe03E7qW9SbT8Tu+ZW2WZIqHLivMlQBuZx5PVbXojTY7rI+vqjlxWoyTOflUTRsAufQ8Jgk/Gw/5kmfD0VydZk5rKpPpEulNuI9//TONLPbn4QSLoBdlAMoew8OJBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776569605; c=relaxed/simple;
	bh=5CoeFzvi9hz0nqykMw0GpiFARTCXayIQXzVcZeTrYrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MiiCULBsaTnwCBpa7ipz0jnE9FuaqZdQ3T4V3W5VsaN0fl4dPumWJlAUC6DxCA3DrVQXwj0EsPLVtCbOK2lGXpFz6jXD6XPuH8+Lg/XZV70YTBunTCcVDboPzexjUNLRR1oeFaj7Jfx9v3PJLvNuml8MM06lpi2KccaMihjeb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcQdNoh7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776569598; x=1808105598;
  h=date:from:to:cc:subject:message-id;
  bh=5CoeFzvi9hz0nqykMw0GpiFARTCXayIQXzVcZeTrYrY=;
  b=EcQdNoh7a1dVwqb2+yjuwuSUSA64C+76fxyBDrzjc7C/UtDXcqEKuHeS
   JJE2mGMbA6+AKcc4EzsQRVgaXzpBOHV0FgencnjRrU3Q+EDN5fM4jbFH2
   nX9xHgZAunFv9M1qKd0EOLxNgVn+dw0i++Fy6vwVOpAxgdpqO08lTaxGx
   FUxT/imQW071UoQ1DPKw/Dqq5916/d2PoMYZ8Vd+gVALica8Iv7u//E07
   1vgP2l+gHilKf413JPsrfgUjgdmAAsWg9qdiTSV4+bEQA7K03yDyt9QEo
   R2xt8OMhjp6Bn6E0yjAyiv6FXukBgbA/9ixn02fwNpTIHo5QfNsMGbsP9
   g==;
X-CSE-ConnectionGUID: +8DlRtQiTS6gcWCT2SkS3w==
X-CSE-MsgGUID: ccXvasFcRpqytCipZsVohg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81406755"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="81406755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 20:33:15 -0700
X-CSE-ConnectionGUID: gv/eYZzQRu6Z/A8AF5wIlg==
X-CSE-MsgGUID: nCI9FjDrR7qbFKGMwGIr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="261795041"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Apr 2026 20:33:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEIuE-000000001j6-2Yml;
	Sun, 19 Apr 2026 03:33:10 +0000
Date: Sun, 19 Apr 2026 11:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:atomisp] BUILD SUCCESS
 90055b02374f88a176f5340da4b4afa9117167f4
Message-ID: <202604191144.rBbhPBID-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-59088-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.936];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 1994A42301E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git atomisp
branch HEAD: 90055b02374f88a176f5340da4b4afa9117167f4  staging: media: atomisp: remove dead code in ov2722.h

elapsed time: 862m

configs tested: 155
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260418    gcc-9.5.0
arc                   randconfig-002-20260418    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                       omap2plus_defconfig    gcc-15.2.0
arm                   randconfig-001-20260418    gcc-8.5.0
arm                   randconfig-002-20260418    gcc-11.5.0
arm                   randconfig-004-20260418    clang-20
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260418    clang-23
arm64                 randconfig-002-20260418    gcc-8.5.0
arm64                 randconfig-003-20260418    clang-23
arm64                 randconfig-004-20260418    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260418    gcc-15.2.0
csky                  randconfig-002-20260418    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260418    clang-23
hexagon               randconfig-002-20260418    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260419    clang-20
i386        buildonly-randconfig-002-20260419    clang-20
i386        buildonly-randconfig-003-20260419    gcc-14
i386        buildonly-randconfig-004-20260419    clang-20
i386        buildonly-randconfig-005-20260419    clang-20
i386        buildonly-randconfig-006-20260419    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260419    clang-20
i386                  randconfig-002-20260419    gcc-14
i386                  randconfig-003-20260419    gcc-14
i386                  randconfig-004-20260419    clang-20
i386                  randconfig-005-20260419    gcc-14
i386                  randconfig-006-20260419    clang-20
i386                  randconfig-007-20260419    clang-20
i386                  randconfig-011-20260418    clang-20
i386                  randconfig-012-20260418    clang-20
i386                  randconfig-013-20260418    gcc-13
i386                  randconfig-014-20260418    clang-20
i386                  randconfig-015-20260418    gcc-14
i386                  randconfig-016-20260418    clang-20
i386                  randconfig-017-20260418    clang-20
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260418    gcc-15.2.0
loongarch             randconfig-002-20260418    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260418    gcc-11.5.0
nios2                 randconfig-002-20260418    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260419    gcc-15.2.0
parisc                randconfig-002-20260419    gcc-11.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260419    clang-23
powerpc               randconfig-002-20260419    gcc-8.5.0
powerpc64             randconfig-001-20260419    gcc-8.5.0
powerpc64             randconfig-002-20260419    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260418    clang-23
riscv                 randconfig-002-20260418    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260418    clang-19
s390                  randconfig-002-20260418    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260418    gcc-11.5.0
sh                    randconfig-002-20260418    gcc-11.5.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260418    gcc-15.2.0
sparc                 randconfig-002-20260418    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-002-20260418    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260418    gcc-12
um                    randconfig-002-20260418    gcc-12
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260419    gcc-14
x86_64      buildonly-randconfig-002-20260419    clang-20
x86_64      buildonly-randconfig-003-20260419    clang-20
x86_64      buildonly-randconfig-004-20260419    clang-20
x86_64      buildonly-randconfig-005-20260419    gcc-14
x86_64      buildonly-randconfig-006-20260419    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260418    clang-20
x86_64                randconfig-002-20260418    clang-20
x86_64                randconfig-003-20260418    clang-20
x86_64                randconfig-004-20260418    gcc-14
x86_64                randconfig-005-20260418    clang-20
x86_64                randconfig-006-20260418    clang-20
x86_64                randconfig-011-20260418    gcc-14
x86_64                randconfig-012-20260418    clang-20
x86_64                randconfig-013-20260418    clang-20
x86_64                randconfig-014-20260418    clang-20
x86_64                randconfig-015-20260418    gcc-14
x86_64                randconfig-016-20260418    clang-20
x86_64                randconfig-071-20260418    clang-20
x86_64                randconfig-072-20260418    gcc-14
x86_64                randconfig-073-20260418    clang-20
x86_64                randconfig-074-20260418    clang-20
x86_64                randconfig-075-20260418    clang-20
x86_64                randconfig-076-20260418    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260418    gcc-12.5.0
xtensa                randconfig-002-20260418    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


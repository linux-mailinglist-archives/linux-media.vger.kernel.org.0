Return-Path: <linux-media+bounces-59078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGL/L1N542lhHQEAu9opvQ
	(envelope-from <linux-media+bounces-59078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 14:30:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906D421179
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 14:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FE0230046BF
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7326363C51;
	Sat, 18 Apr 2026 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtOpggpK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801A36212E
	for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776515403; cv=none; b=tZ7WJSEtJ/GM6hPNraXWb9RglkgTCxl43yCJKMyFRDYAlHctvrz6K+9Gp3ps9CRPFFIL8700u95KcytOFuiD2pRxyBUgO9q6VY8SvzR2tAW07LZN1B0twu3O/Ce4zpL5z9nULrF3PTEUuu2lAxVGj/rqmcM9ALnOpBWH/4Iksrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776515403; c=relaxed/simple;
	bh=qnFMo0nnrAaRyWqlMFgjRuO9WUObS2oXgFFjjYuhZ5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A5WbPXtIXIzFe4oSKZyILa9bfk4vk2b8bggko4dauI0nwNQ0AQfjHr/kAD/uKDSXf/NCuUMwfbr+S05BTeB3GlKD4Rzq1m6Br9OcD+JMnQQ7UFz6sXsKitrbfLDRj0+bT+CyADSbNMD53fvQK4fcR9QP++8UvdNhACbVSG/HCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtOpggpK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776515400; x=1808051400;
  h=date:from:to:cc:subject:message-id;
  bh=qnFMo0nnrAaRyWqlMFgjRuO9WUObS2oXgFFjjYuhZ5U=;
  b=OtOpggpKi8ByuTwEGGJIPFgCRmqQuILF9tV3VN/sZi9UJ9n/kkPtY8oG
   rNAdDiDgfE1OqzW/94ekJPhprbU5yHaQhMsprg9U0we60uGifm2yTFUyZ
   Y2792xzDN+IxuwuIjgXDNTJcdB4qI42eRzQRymAhV9AgVAoTxwgg8Z+FY
   /yvkDyAUfnWbGJ6a0uIPIGUcvFW/szxc2YFSwi07vf7SB/9ahriCtw96t
   rsdJcYVWybVSvPTJXijZ8pjPRy99KBxm2P4aCOjx93HU392zijkuGTGks
   3kt8FLfgw7EwD2bNnlSLO+wHN4n20G7jbYQ0OTqp2DQOlT5oJXe+6KTfq
   g==;
X-CSE-ConnectionGUID: dOTTOm/3SMqtd6svGlCOvw==
X-CSE-MsgGUID: GuYpoFpJR3Gqb93/kGMRmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88122412"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="88122412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 05:29:59 -0700
X-CSE-ConnectionGUID: 0+NmU0GKRrSgtzyJSj3bYw==
X-CSE-MsgGUID: 34ruQdmhSemQs7cavQd69w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="254743809"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Apr 2026 05:29:58 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE4o7-000000001EG-2iTc;
	Sat, 18 Apr 2026 12:29:55 +0000
Date: Sat, 18 Apr 2026 20:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-new] BUILD SUCCESS
 7bb838184fdc0d716c2a06795fc6ef1f1fb8350b
Message-ID: <202604182059.bYYP4rCu-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59078-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4906D421179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-new
branch HEAD: 7bb838184fdc0d716c2a06795fc6ef1f1fb8350b  media: bcm2835-unicam: Support generic raw formats

elapsed time: 733m

configs tested: 156
configs skipped: 4

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
arm                   randconfig-001-20260418    gcc-8.5.0
arm                   randconfig-002-20260418    gcc-11.5.0
arm                   randconfig-003-20260418    clang-23
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
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260418    clang-23
hexagon               randconfig-002-20260418    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260418    clang-20
i386        buildonly-randconfig-002-20260418    gcc-14
i386        buildonly-randconfig-003-20260418    clang-20
i386        buildonly-randconfig-004-20260418    clang-20
i386        buildonly-randconfig-005-20260418    gcc-14
i386        buildonly-randconfig-006-20260418    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260418    gcc-14
i386                  randconfig-002-20260418    gcc-12
i386                  randconfig-003-20260418    gcc-14
i386                  randconfig-004-20260418    gcc-12
i386                  randconfig-005-20260418    gcc-12
i386                  randconfig-006-20260418    gcc-14
i386                  randconfig-011-20260418    clang-20
i386                  randconfig-012-20260418    clang-20
i386                  randconfig-013-20260418    gcc-13
i386                  randconfig-014-20260418    clang-20
i386                  randconfig-015-20260418    gcc-14
i386                  randconfig-016-20260418    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
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
parisc                randconfig-001-20260418    gcc-15.2.0
parisc                randconfig-002-20260418    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260418    clang-23
powerpc               randconfig-002-20260418    gcc-12.5.0
powerpc64             randconfig-001-20260418    gcc-10.5.0
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
s390                       zfcpdump_defconfig    clang-23
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
sparc64               randconfig-001-20260418    clang-23
sparc64               randconfig-002-20260418    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260418    gcc-12
um                    randconfig-002-20260418    gcc-12
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260418    gcc-14
x86_64      buildonly-randconfig-002-20260418    gcc-14
x86_64      buildonly-randconfig-003-20260418    gcc-14
x86_64      buildonly-randconfig-004-20260418    gcc-14
x86_64      buildonly-randconfig-005-20260418    clang-20
x86_64      buildonly-randconfig-006-20260418    gcc-14
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
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260418    gcc-12.5.0
xtensa                randconfig-002-20260418    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


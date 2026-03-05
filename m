Return-Path: <linux-media+bounces-54655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCRxL8WUqWmKAQEAu9opvQ
	(envelope-from <linux-media+bounces-54655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:35:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D7213914
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 15:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA7E831FCC55
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 14:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818F03822BC;
	Thu,  5 Mar 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpS9qYUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1C3375F6D
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720951; cv=none; b=tNR+wnfKVaCyTofR81cCoFU/fEqeO5yB/5a/Os3vO/zwt20Hqppkj867RBYV3ppMgR28zbvzkvlWcslKJMRqmDFVzyxbzqeS7Xon3uLnKYp/3vnG6lk1UbzSXzC6Vr2J0JAcAEW2J5JZLd6yjefmtkvEfr1uzRlGmzdOwyALVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720951; c=relaxed/simple;
	bh=N2wikGAPv1lHDt7WmYfLEwqMZNyLNyrpFq6ImiHYVZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sIq9SxIVDYxMCbiImGSAr6vI1WxLqxskizxeOjIORkMgeCGfEgAYUAGn0VDZPPhKdE0qmc/UAGGvJC6iN+P/yR57aWy3iAGQmcSXxCkxcwnjfBt5Zaz3EoBWC+j7ruE0ROJciSUjBF0st5DW+sAgepKX8DeZ/cYSQRPggpCds7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpS9qYUu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772720948; x=1804256948;
  h=date:from:to:cc:subject:message-id;
  bh=N2wikGAPv1lHDt7WmYfLEwqMZNyLNyrpFq6ImiHYVZQ=;
  b=HpS9qYUu6guVc/mXfSCubIJr4S9b6SggKOvO4dZP90crFv5kSIyPoW6F
   tH6BtUVyE8vWKmiI1+3koe0cbQzoM/XyBamkdMO/sQ5yEy2pMtlx+TL+m
   u0wZGVoVkE+Yc1WCykSvJB7bl2oP31IbsaT52JcgYf1PgYD2RvAkfPY/l
   uCBwpojUBQffWZpgtUOAts2MJlJbG/2OZSBE6FQKWpCaHhCLsW86VWX5t
   iwFNTaZVYrJWkFQkUz69jXDfMFZR+XZLlGEez6LV/bj4NSm4xsr9U2aO0
   oUpcO9TslH5Cx1OQdMoZhoeHR+qe6I4YAftCTanDPBs1ymE7whjlDPKai
   g==;
X-CSE-ConnectionGUID: mO79a2moRuWJU81fZCgKcg==
X-CSE-MsgGUID: KjJ24gWDS0yaQwnx6yyQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73777571"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73777571"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:29:08 -0800
X-CSE-ConnectionGUID: nnUJK3bLSiGHOCw/jLT1tQ==
X-CSE-MsgGUID: n3R2moUVQ6W7ke8+FvkmUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="241716305"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2026 06:29:06 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9hI-000000000jq-176I;
	Thu, 05 Mar 2026 14:29:04 +0000
Date: Thu, 05 Mar 2026 22:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 ed67c5e93fe17822c73a13a106625b77a0aca85f
Message-ID: <202603052226.otuwIPJL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 2C2D7213914
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54655-lists,linux-media=lfdr.de];
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
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: ed67c5e93fe17822c73a13a106625b77a0aca85f  media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough

elapsed time: 1457m

configs tested: 160
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                   randconfig-001-20260305    clang-19
arc                   randconfig-002-20260305    clang-19
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                   randconfig-001-20260305    clang-19
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-003-20260305    clang-19
arm                   randconfig-004-20260305    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-8.5.0
arm64                 randconfig-002-20260305    gcc-8.5.0
arm64                 randconfig-003-20260305    gcc-8.5.0
arm64                 randconfig-004-20260305    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                  randconfig-001-20260305    gcc-8.5.0
csky                  randconfig-002-20260305    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260305    clang-20
i386        buildonly-randconfig-002-20260305    clang-20
i386        buildonly-randconfig-003-20260305    clang-20
i386        buildonly-randconfig-004-20260305    clang-20
i386        buildonly-randconfig-005-20260305    clang-20
i386        buildonly-randconfig-006-20260305    clang-20
i386                  randconfig-001-20260305    gcc-14
i386                  randconfig-002-20260305    gcc-14
i386                  randconfig-003-20260305    gcc-14
i386                  randconfig-004-20260305    gcc-14
i386                  randconfig-005-20260305    gcc-14
i386                  randconfig-006-20260305    gcc-14
i386                  randconfig-007-20260305    gcc-14
i386                  randconfig-011-20260305    clang-20
i386                  randconfig-012-20260305    clang-20
i386                  randconfig-013-20260305    clang-20
i386                  randconfig-014-20260305    clang-20
i386                  randconfig-015-20260305    clang-20
i386                  randconfig-016-20260305    clang-20
i386                  randconfig-017-20260305    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-002-20260305    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc               randconfig-001-20260305    gcc-9.5.0
powerpc               randconfig-002-20260305    gcc-9.5.0
powerpc64             randconfig-001-20260305    gcc-9.5.0
powerpc64             randconfig-002-20260305    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-002-20260305    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-002-20260305    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-002-20260305    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-14.3.0
sparc                 randconfig-002-20260305    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260305    gcc-14.3.0
sparc64               randconfig-002-20260305    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260305    gcc-14.3.0
um                    randconfig-002-20260305    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260305    clang-20
x86_64      buildonly-randconfig-002-20260305    clang-20
x86_64      buildonly-randconfig-003-20260305    clang-20
x86_64      buildonly-randconfig-004-20260305    clang-20
x86_64      buildonly-randconfig-005-20260305    clang-20
x86_64      buildonly-randconfig-006-20260305    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-002-20260305    clang-20
x86_64                randconfig-003-20260305    clang-20
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-005-20260305    clang-20
x86_64                randconfig-006-20260305    clang-20
x86_64                randconfig-011-20260305    clang-20
x86_64                randconfig-012-20260305    clang-20
x86_64                randconfig-013-20260305    clang-20
x86_64                randconfig-014-20260305    clang-20
x86_64                randconfig-015-20260305    clang-20
x86_64                randconfig-016-20260305    clang-20
x86_64                randconfig-071-20260305    gcc-14
x86_64                randconfig-072-20260305    gcc-14
x86_64                randconfig-073-20260305    gcc-14
x86_64                randconfig-074-20260305    gcc-14
x86_64                randconfig-075-20260305    gcc-14
x86_64                randconfig-076-20260305    gcc-14
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
xtensa                randconfig-002-20260305    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


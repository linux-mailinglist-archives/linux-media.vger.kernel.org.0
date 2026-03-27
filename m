Return-Path: <linux-media+bounces-57362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGebOizsxmkIQQUAu9opvQ
	(envelope-from <linux-media+bounces-57362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 131DE34B389
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 133A7303942C
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A04637F749;
	Fri, 27 Mar 2026 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzPjUY0n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B834252C
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643119; cv=none; b=GHolkyYAwmImTGWj2RyAHAm0cb/82vGwLhDzxDehTCmimBj5IUJvqIxORYoO7mYQGvaOJx8UYQGwwfncu78tgcquw4TJedAdpvQt23wFRdKHKeGwtYBCjDjSDPoLWegeWDRDQ/9N+v8YcMSzCOOzsYq+j8ZBKa90D8YETYjqyzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643119; c=relaxed/simple;
	bh=tuJ4CEfdgq7GyeRgPbS//nkXwXaGEFzaSY7skbEn2C4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dc83Ax7ndszaWQQoCZEbp4NxpsF9w5CfTqixCwvFLL7d5V+VE4zMzj4F3XhmItBz0rA2Or2EwJvNkV52hzLI3rAVZg8Bw+xmVZ0yq4lfh1VYYyle3zIDM56U2IyQf+Nb4yl0/+XWqRjCopdplc5Q/rRUyLBNFugZdHFxPMSyMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzPjUY0n; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774643118; x=1806179118;
  h=date:from:to:cc:subject:message-id;
  bh=tuJ4CEfdgq7GyeRgPbS//nkXwXaGEFzaSY7skbEn2C4=;
  b=VzPjUY0n/vwXwTOdR0mqLywDPh8KxR2OgA9sp78xhR/heKDRURRAfHu4
   hImYHzmZ63/Hq7oRDlUbqzNd1NloFz/E/afk0//HGQNgskIB9woD9rLqQ
   vEeG3YHq4S+BLZbmgJEooYT7UwhysT9JtkcmdGFh7IhPPKCU6yX+BNJWN
   pGkXcgX5XH6izlGuc3qn7ZBfZZMV1Fhl0VhtOp9M+bLKkkAHQNzUOdTyY
   2ORJ5azW2H2J8YCbX9Vr84vBcMuquNuTABqWXpI0MHTL2VNlBuUoksNst
   K2LtUtKFEwm+OHXIilttjJgpIvh/dFXZWEV9Ua00ejzeRJsItmb53k4KA
   A==;
X-CSE-ConnectionGUID: jHFjWL6OScapyho+2Sm6kA==
X-CSE-MsgGUID: i9wHaEkrSk+dg4Rc/LRjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86414619"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86414619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:25:17 -0700
X-CSE-ConnectionGUID: IUHyduVwQYq3R/k+H8bqjg==
X-CSE-MsgGUID: RThjhtJ6TRCqySyJ2HpARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248687729"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2026 13:25:15 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Dk1-00000000AiD-1qpY;
	Fri, 27 Mar 2026 20:25:13 +0000
Date: Sat, 28 Mar 2026 04:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:amdisp4] BUILD SUCCESS
 94dbdb3eed22631820e9f3ec7196205b4e51d41d
Message-ID: <202603280406.MBKTNagS-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57362-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 131DE34B389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git amdisp4
branch HEAD: 94dbdb3eed22631820e9f3ec7196205b4e51d41d  Documentation: add documentation of AMD isp 4 driver

elapsed time: 763m

configs tested: 240
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
arc                   randconfig-001-20260327    gcc-8.5.0
arc                   randconfig-001-20260328    gcc-15.2.0
arc                   randconfig-002-20260327    gcc-8.5.0
arc                   randconfig-002-20260328    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-001-20260328    gcc-15.2.0
arm                   randconfig-002-20260327    gcc-8.5.0
arm                   randconfig-002-20260328    gcc-15.2.0
arm                   randconfig-003-20260327    gcc-8.5.0
arm                   randconfig-003-20260328    gcc-15.2.0
arm                   randconfig-004-20260327    gcc-8.5.0
arm                   randconfig-004-20260328    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-001-20260328    gcc-14.3.0
arm64                 randconfig-002-20260327    clang-23
arm64                 randconfig-002-20260328    gcc-14.3.0
arm64                 randconfig-003-20260327    clang-23
arm64                 randconfig-003-20260328    gcc-14.3.0
arm64                 randconfig-004-20260327    clang-23
arm64                 randconfig-004-20260328    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    clang-23
csky                  randconfig-001-20260328    gcc-14.3.0
csky                  randconfig-002-20260327    clang-23
csky                  randconfig-002-20260328    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260327    gcc-8.5.0
hexagon               randconfig-001-20260328    gcc-11.5.0
hexagon               randconfig-002-20260327    gcc-8.5.0
hexagon               randconfig-002-20260328    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-001-20260328    clang-20
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-002-20260328    clang-20
i386        buildonly-randconfig-003-20260327    clang-20
i386        buildonly-randconfig-003-20260328    clang-20
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-004-20260328    clang-20
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-005-20260328    clang-20
i386        buildonly-randconfig-006-20260327    clang-20
i386        buildonly-randconfig-006-20260328    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260327    clang-20
i386                  randconfig-002-20260327    clang-20
i386                  randconfig-003-20260327    clang-20
i386                  randconfig-004-20260327    clang-20
i386                  randconfig-005-20260327    clang-20
i386                  randconfig-006-20260327    clang-20
i386                  randconfig-007-20260327    clang-20
i386                  randconfig-011-20260327    gcc-14
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-013-20260327    gcc-14
i386                  randconfig-014-20260327    gcc-14
i386                  randconfig-015-20260327    gcc-14
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-017-20260327    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260327    gcc-8.5.0
loongarch             randconfig-001-20260328    gcc-11.5.0
loongarch             randconfig-002-20260327    gcc-8.5.0
loongarch             randconfig-002-20260328    gcc-11.5.0
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
mips                           ci20_defconfig    clang-23
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260327    gcc-8.5.0
nios2                 randconfig-001-20260328    gcc-11.5.0
nios2                 randconfig-002-20260327    gcc-8.5.0
nios2                 randconfig-002-20260328    gcc-11.5.0
openrisc                         allmodconfig    clang-23
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
parisc                randconfig-001-20260327    clang-18
parisc                randconfig-001-20260328    gcc-10.5.0
parisc                randconfig-002-20260327    clang-18
parisc                randconfig-002-20260328    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260327    clang-18
powerpc               randconfig-001-20260328    gcc-10.5.0
powerpc               randconfig-002-20260327    clang-18
powerpc               randconfig-002-20260328    gcc-10.5.0
powerpc64             randconfig-001-20260327    clang-18
powerpc64             randconfig-001-20260328    gcc-10.5.0
powerpc64             randconfig-002-20260327    clang-18
powerpc64             randconfig-002-20260328    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260327    gcc-12.5.0
riscv                 randconfig-001-20260328    clang-23
riscv                 randconfig-002-20260327    gcc-12.5.0
riscv                 randconfig-002-20260328    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260327    gcc-12.5.0
s390                  randconfig-001-20260328    clang-23
s390                  randconfig-002-20260327    gcc-12.5.0
s390                  randconfig-002-20260328    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260327    gcc-12.5.0
sh                    randconfig-001-20260328    clang-23
sh                    randconfig-002-20260327    gcc-12.5.0
sh                    randconfig-002-20260328    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260327    gcc-14
sparc                 randconfig-001-20260328    gcc-14
sparc                 randconfig-002-20260327    gcc-14
sparc                 randconfig-002-20260328    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260327    gcc-14
sparc64               randconfig-001-20260328    gcc-14
sparc64               randconfig-002-20260327    gcc-14
sparc64               randconfig-002-20260328    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260327    gcc-14
um                    randconfig-001-20260328    gcc-14
um                    randconfig-002-20260327    gcc-14
um                    randconfig-002-20260328    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260327    clang-20
x86_64      buildonly-randconfig-001-20260328    clang-20
x86_64      buildonly-randconfig-002-20260327    clang-20
x86_64      buildonly-randconfig-002-20260328    clang-20
x86_64      buildonly-randconfig-003-20260327    clang-20
x86_64      buildonly-randconfig-003-20260328    clang-20
x86_64      buildonly-randconfig-004-20260327    clang-20
x86_64      buildonly-randconfig-004-20260328    clang-20
x86_64      buildonly-randconfig-005-20260327    clang-20
x86_64      buildonly-randconfig-005-20260328    clang-20
x86_64      buildonly-randconfig-006-20260327    clang-20
x86_64      buildonly-randconfig-006-20260328    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260327    gcc-14
x86_64                randconfig-002-20260327    gcc-14
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-004-20260327    gcc-14
x86_64                randconfig-005-20260327    gcc-14
x86_64                randconfig-006-20260327    gcc-14
x86_64                randconfig-011-20260327    gcc-14
x86_64                randconfig-012-20260327    gcc-14
x86_64                randconfig-013-20260327    gcc-14
x86_64                randconfig-014-20260327    gcc-14
x86_64                randconfig-015-20260327    gcc-14
x86_64                randconfig-016-20260327    gcc-14
x86_64                randconfig-071-20260327    gcc-13
x86_64                randconfig-072-20260327    gcc-13
x86_64                randconfig-073-20260327    gcc-13
x86_64                randconfig-074-20260327    gcc-13
x86_64                randconfig-075-20260327    gcc-13
x86_64                randconfig-076-20260327    gcc-13
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
xtensa                randconfig-001-20260327    gcc-14
xtensa                randconfig-001-20260328    gcc-14
xtensa                randconfig-002-20260327    gcc-14
xtensa                randconfig-002-20260328    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


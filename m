Return-Path: <linux-media+bounces-55026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIhzLMd/r2nZZwIAu9opvQ
	(envelope-from <linux-media+bounces-55026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 03:19:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7962244270
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 03:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FCF1300E69D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 02:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D351DE887;
	Tue, 10 Mar 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIc+p8tb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E533A70F
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109185; cv=none; b=fY0mDLr2dOIlP1DdxkuMbzncDXmnaXJG3UtDJtnHAays8+sFz/GF7TZcPmFsk+tDVT1zDzkiwj/XdVUWmHaiUyUFwwTw++1KTiPPmljhisd9TGbq5QBHU77TZnJ/tsZ15bzLXJv+S+zG6OZX6yqSr2Jpenwb0X4XIh/AKY+ixR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109185; c=relaxed/simple;
	bh=bT2hfmGxjZ5V/hctT6wkHH5DtYmE9UCG6A8fd9CJR7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PJb/Iv1Gdl1ju9QULtD7MJEg0Hwe/QYjBf4aZO9XXl4r8MA38CcbVpQhgOKmfX6AaOVSLnUvxSIxGACH7DJEkE5kuK01J2S9CpBA065y6N6pXrQscE+H4JAjugo0r3TTFpqKtBhJrIAV3BIqlz6z9ZREO0GTUHOUjk39as4GSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIc+p8tb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773109184; x=1804645184;
  h=date:from:to:cc:subject:message-id;
  bh=bT2hfmGxjZ5V/hctT6wkHH5DtYmE9UCG6A8fd9CJR7E=;
  b=PIc+p8tbT+SNery5WZu/Fi6Ue3qtM3UocSbWbNWnrlGAI8W9Il44nezB
   kjvIGj5tS4ROrt5UrI6idZLjrKMGbhGXRl2l1CxB+ARak6uKR5XGDBI2e
   yVMX3ZpUmIJG8BQ/ROSxR1msBs/VZ/Rsl40fCc987bqdeM+xALtiVq4r4
   yRSYqDEO1sihN2uAKjfWebVmhzzHWg6AWvOERhbAmez/zVFcG1SFYFzID
   mz/QOKhga5opV7IQALszzNwitCzNVyGOejklz+uP78WobBkQtHpg0ExLV
   Xmv55MorzbG+GCvyWTF0XiHrwBOk4Q9yE3IGeej7oelD4eEEGfsqDxchU
   g==;
X-CSE-ConnectionGUID: UGpQJo7wS72h8kNFpgnB+w==
X-CSE-MsgGUID: RGJJem93RJOIA2paimLyvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85622165"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="85622165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 19:19:43 -0700
X-CSE-ConnectionGUID: HEl2hQR5TpyY0PtMY+/z5w==
X-CSE-MsgGUID: ErE+/6qhRjmggCXVnqx9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="250406228"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Mar 2026 19:19:42 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzmh9-00000000184-0XAX;
	Tue, 10 Mar 2026 02:19:39 +0000
Date: Tue, 10 Mar 2026 10:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 f5e783bcf2d217b607e71e9274dbd5eaf24d41cf
Message-ID: <202603101058.3tTti4AL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: A7962244270
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55026-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.64.159.142:received];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: f5e783bcf2d217b607e71e9274dbd5eaf24d41cf  media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints

elapsed time: 743m

configs tested: 269
configs skipped: 5

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
arc                   randconfig-001-20260310    gcc-8.5.0
arc                   randconfig-001-20260310    gcc-9.5.0
arc                   randconfig-002-20260310    gcc-15.2.0
arc                   randconfig-002-20260310    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-23
arm                   randconfig-001-20260310    clang-23
arm                   randconfig-001-20260310    gcc-8.5.0
arm                   randconfig-002-20260310    gcc-12.5.0
arm                   randconfig-002-20260310    gcc-8.5.0
arm                   randconfig-003-20260310    gcc-10.5.0
arm                   randconfig-003-20260310    gcc-8.5.0
arm                   randconfig-004-20260310    gcc-8.5.0
arm                           sama7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260310    clang-16
arm64                 randconfig-001-20260310    gcc-11.5.0
arm64                 randconfig-002-20260310    gcc-11.5.0
arm64                 randconfig-002-20260310    gcc-13.4.0
arm64                 randconfig-003-20260310    gcc-11.5.0
arm64                 randconfig-004-20260310    gcc-11.5.0
arm64                 randconfig-004-20260310    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260310    gcc-11.5.0
csky                  randconfig-001-20260310    gcc-15.2.0
csky                  randconfig-002-20260310    gcc-11.5.0
csky                  randconfig-002-20260310    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260309    clang-19
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-002-20260309    clang-23
hexagon               randconfig-002-20260310    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260309    clang-20
i386        buildonly-randconfig-001-20260310    clang-20
i386        buildonly-randconfig-002-20260309    clang-20
i386        buildonly-randconfig-002-20260310    clang-20
i386        buildonly-randconfig-003-20260309    clang-20
i386        buildonly-randconfig-003-20260310    clang-20
i386        buildonly-randconfig-004-20260309    clang-20
i386        buildonly-randconfig-004-20260310    clang-20
i386        buildonly-randconfig-005-20260309    gcc-14
i386        buildonly-randconfig-005-20260310    clang-20
i386        buildonly-randconfig-006-20260309    clang-20
i386        buildonly-randconfig-006-20260310    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-001-20260310    gcc-14
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-002-20260310    gcc-14
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-005-20260310    gcc-14
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-006-20260310    gcc-14
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-007-20260310    gcc-12
i386                  randconfig-011-20260310    clang-20
i386                  randconfig-011-20260310    gcc-14
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-013-20260310    clang-20
i386                  randconfig-013-20260310    gcc-14
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-016-20260310    clang-20
i386                  randconfig-016-20260310    gcc-14
i386                  randconfig-017-20260310    clang-20
i386                  randconfig-017-20260310    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260309    gcc-13.4.0
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-002-20260309    gcc-15.2.0
loongarch             randconfig-002-20260310    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     decstation_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260309    gcc-10.5.0
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-002-20260309    gcc-11.5.0
nios2                 randconfig-002-20260310    gcc-11.5.0
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
parisc                randconfig-001-20260310    gcc-14.3.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-002-20260310    gcc-13.4.0
parisc                randconfig-002-20260310    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-001-20260310    gcc-9.5.0
powerpc               randconfig-002-20260310    clang-23
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260310    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-15.2.0
riscv                 randconfig-002-20260310    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-15.2.0
s390                  randconfig-001-20260310    gcc-9.5.0
s390                  randconfig-002-20260310    clang-19
s390                  randconfig-002-20260310    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260310    gcc-15.2.0
sh                    randconfig-002-20260310    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260309    gcc-12.5.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-002-20260309    gcc-13.4.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260309    clang-23
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-002-20260309    clang-20
sparc64               randconfig-002-20260310    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260309    clang-23
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-002-20260309    gcc-14
um                    randconfig-002-20260310    gcc-12.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260310    gcc-12
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260310    gcc-12
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260310    clang-20
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-001-20260310    gcc-14
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-006-20260310    gcc-14
x86_64                randconfig-011-20260309    clang-20
x86_64                randconfig-011-20260310    clang-20
x86_64                randconfig-012-20260309    clang-20
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-013-20260309    gcc-14
x86_64                randconfig-013-20260310    clang-20
x86_64                randconfig-014-20260309    gcc-14
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-015-20260309    gcc-14
x86_64                randconfig-015-20260310    clang-20
x86_64                randconfig-016-20260309    gcc-12
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-071-20260309    gcc-14
x86_64                randconfig-071-20260310    clang-20
x86_64                randconfig-072-20260309    gcc-14
x86_64                randconfig-072-20260310    clang-20
x86_64                randconfig-073-20260309    gcc-14
x86_64                randconfig-073-20260310    clang-20
x86_64                randconfig-074-20260309    clang-20
x86_64                randconfig-074-20260310    clang-20
x86_64                randconfig-075-20260309    gcc-14
x86_64                randconfig-075-20260310    clang-20
x86_64                randconfig-076-20260309    gcc-14
x86_64                randconfig-076-20260310    clang-20
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
xtensa                randconfig-001-20260309    gcc-13.4.0
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-002-20260309    gcc-13.4.0
xtensa                randconfig-002-20260310    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


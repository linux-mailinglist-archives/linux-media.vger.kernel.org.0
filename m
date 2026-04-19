Return-Path: <linux-media+bounces-59086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DHyOmEw5Gk4SQEAu9opvQ
	(envelope-from <linux-media+bounces-59086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 03:31:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E0422D51
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 03:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83A033009E1F
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 01:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE9202C5C;
	Sun, 19 Apr 2026 01:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpjpw3Y9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346E2264A9
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776562264; cv=none; b=TmoY9pADscWY3WLDFaPEb+SOlj5J6oOvNXmbD57GvjtZ8kMM7g7BuPD5CIk9oxEd/07ECSvaV3UazMULD1dOXmuT/UKuPdp9VoH/WfEqRdIeNyE2BEliKlJqt1NGw1LfkCltNL1Ee4DmOgsBrF8tGKC6WexxC6HEp/XrwmSEUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776562264; c=relaxed/simple;
	bh=kTGaV1eoP1ymB+0fw04absCvSVQo+MuSK5IGl+z4vtc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OIS/qApoelH7jBq7P/YZlgjbbdRUQUyfWVvs+fuBz/yVME0iibtcQpQGpDaQbdXeY5x6lcUZDMXx6ktirTaeb3rIFBKDukSm0j9wm3oxydwLybnW3RjvpCpnqzZkWL757Vx266TtIUPiVCEm5pzl4il/7BRAD1xWYzE6aTruqF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpjpw3Y9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776562263; x=1808098263;
  h=date:from:to:cc:subject:message-id;
  bh=kTGaV1eoP1ymB+0fw04absCvSVQo+MuSK5IGl+z4vtc=;
  b=Jpjpw3Y9ol8/rnU3A2WG0a6lT28HQkTm95DF5kOfE/k0bDzJm18Ab7oy
   ikxP3kble8k0oAer3z5k1UDWRTVdC3NJ2fpkQfSZ9fY/gsaAKNoCEAJqm
   iUpejqrIYv+q2qPb1n3+T1BMgi5YQLyI8S0FX53SN9n8eUFGrHe+sWIvl
   P6x2F3Dl9+GqvOJOE964h/0tbv+dKuUhMLpX9ie4VVF5NMhRLj6IVyqDM
   v/KdYNjXL5gqHgO3AxpPvyLJXFdhcJ6HnvRnifEuYQjsQ3z7Fa7yKr127
   hfKbHuYby81URvNdZLF97/kUCj9T3KTs1gddblqFGD9yF067WXdrxljgx
   g==;
X-CSE-ConnectionGUID: T0CHkXuMR/q1Pz0M8KblXw==
X-CSE-MsgGUID: flbIBlgeQf+Rkzb0VzeZlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88982188"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="88982188"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 18:31:02 -0700
X-CSE-ConnectionGUID: 9D91L2poRVi4/9+qkQGZog==
X-CSE-MsgGUID: B/kzjmWZS/O47I9xQ1W1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="269421719"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2026 18:31:01 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEGzx-000000001ea-2tFX;
	Sun, 19 Apr 2026 01:30:57 +0000
Date: Sun, 19 Apr 2026 09:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup] BUILD SUCCESS
 f1c66827db335e9da6fa09fd57f357385f3b4b02
Message-ID: <202604190907.tZd6eprT-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-59086-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 745E0422D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git cleanup
branch HEAD: f1c66827db335e9da6fa09fd57f357385f3b4b02  media: Documentation: Improve PIXEL_RATE control documentation

elapsed time: 739m

configs tested: 153
configs skipped: 10

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
arc                   randconfig-001-20260419    gcc-12.5.0
arc                   randconfig-002-20260419    gcc-12.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260419    gcc-8.5.0
arm                   randconfig-002-20260419    gcc-11.5.0
arm                   randconfig-003-20260419    clang-23
arm                   randconfig-004-20260419    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-002-20260418    gcc-8.5.0
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
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260418    gcc-15.2.0
loongarch             randconfig-002-20260418    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
m68k                       m5208evb_defconfig    gcc-15.2.0
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
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-002-20260418    gcc-12.5.0
powerpc64             randconfig-001-20260418    gcc-10.5.0
powerpc64             randconfig-002-20260418    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
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
x86_64                randconfig-072-20260418    gcc-14
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


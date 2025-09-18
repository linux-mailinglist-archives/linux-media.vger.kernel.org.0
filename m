Return-Path: <linux-media+bounces-39769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF6B245D5
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4EA91BC2256
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B3B2FDC55;
	Wed, 13 Aug 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPFc8/s7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B982F3C13
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077951; cv=none; b=k6Nda1JEPPFNgMmjS1069tNljEd4sVU/pcwHl6TQby4F0kyZbg5YxD4pXiZ7fv0ogCWVQ1FHeg9+8ZVb2I14P3jqZyl4auRyDq3bSMj//4fU/B1hIULdN/GKnR3fs03Pjox7x+T6UkPQ3p+lBhUjR79h1ydwilbxGJhcGia2lvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077951; c=relaxed/simple;
	bh=tzyLCH4Q0ErGNidrTs21sclRw+vv98weRdF+lIug6ps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ta4+9U2zBKyoW+WXU8rV+iuQQq0W7jvD0O5xkQCxIgEWbEYSuWi1fzQN4VulZ8bZG7iMZoarz8gEvfCpj9c5WDATw+Iztf24M1ULigbjU0ulBZuS871QYHK08ed1SE1FkIveM0zhFjuWl6lBs4Io0S6XV3IbwVygGSR4ndUUKio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPFc8/s7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755077950; x=1786613950;
  h=date:from:to:cc:subject:message-id;
  bh=tzyLCH4Q0ErGNidrTs21sclRw+vv98weRdF+lIug6ps=;
  b=GPFc8/s7HBzPGF/NCFe4WwDKv9ycVHJiFSH/U4dT/kH1B9PEcozy9Q6a
   3BrI7LWYO9iEcYdSELD9GVqDbfb6DLoU1UF7gUNCgzecQm0oMDH1aOA+L
   sk60M/3C0VDVv9JRmJmJLIyFwPTFTeegKipvfUC8yz9X1hgtueQX/vByG
   eQ9IDQiIvgCw3HcX2LzHmcsSjzN02qradmbzVFH5ruJFaObfV3kyG9kNi
   jjsuGZld5BSq2WMI6MviaZN/J57bJKz+oynHSIrbKFaHtcz4WhIKuS2BP
   y18rkQnIIST8j73ah0t0DMfJRIPjjJsPMKEo/ECieIDmqSaMRq18O5FkG
   w==;
X-CSE-ConnectionGUID: qSmz9+SqSneiyDvvUlrEZw==
X-CSE-MsgGUID: 7W+6KrAXSnGBoOu4bD59qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57232569"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57232569"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 02:39:09 -0700
X-CSE-ConnectionGUID: vCLscGcZRDesdnLjtGc2Vg==
X-CSE-MsgGUID: QZYIhV/MQs+ScJ/hhHFAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="167215829"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2025 02:39:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um7wn-0009kS-1c;
	Wed, 13 Aug 2025 09:39:05 +0000
Date: Wed, 13 Aug 2025 17:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 7947309bafb07bc1b2eb63c69aae13003b53dad1
Message-ID: <202508131759.4gM5oYdu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 7947309bafb07bc1b2eb63c69aae13003b53dad1  media: Remove redundant pm_runtime_mark_last_busy() calls

elapsed time: 2261m

configs tested: 291
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250812    gcc-14.3.0
arc                   randconfig-001-20250812    gcc-8.5.0
arc                   randconfig-001-20250813    clang-22
arc                   randconfig-002-20250812    gcc-12.5.0
arc                   randconfig-002-20250812    gcc-14.3.0
arc                   randconfig-002-20250813    clang-22
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                          collie_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    gcc-15.1.0
arm                        keystone_defconfig    gcc-15.1.0
arm                   randconfig-001-20250812    clang-22
arm                   randconfig-001-20250812    gcc-14.3.0
arm                   randconfig-001-20250813    clang-22
arm                   randconfig-002-20250812    clang-22
arm                   randconfig-002-20250812    gcc-14.3.0
arm                   randconfig-002-20250813    clang-22
arm                   randconfig-003-20250812    gcc-14.3.0
arm                   randconfig-003-20250813    clang-22
arm                   randconfig-004-20250812    gcc-10.5.0
arm                   randconfig-004-20250812    gcc-14.3.0
arm                   randconfig-004-20250813    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250812    gcc-14.3.0
arm64                 randconfig-001-20250812    gcc-8.5.0
arm64                 randconfig-001-20250813    clang-22
arm64                 randconfig-002-20250812    gcc-14.3.0
arm64                 randconfig-002-20250812    gcc-8.5.0
arm64                 randconfig-002-20250813    clang-22
arm64                 randconfig-003-20250812    gcc-14.3.0
arm64                 randconfig-003-20250813    clang-22
arm64                 randconfig-004-20250812    gcc-14.3.0
arm64                 randconfig-004-20250812    gcc-8.5.0
arm64                 randconfig-004-20250813    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250812    gcc-13.4.0
csky                  randconfig-001-20250813    clang-20
csky                  randconfig-002-20250812    gcc-10.5.0
csky                  randconfig-002-20250813    clang-20
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250812    clang-22
hexagon               randconfig-001-20250813    clang-20
hexagon               randconfig-002-20250812    clang-22
hexagon               randconfig-002-20250813    clang-20
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250812    gcc-12
i386        buildonly-randconfig-002-20250812    gcc-12
i386        buildonly-randconfig-003-20250812    gcc-12
i386        buildonly-randconfig-004-20250812    clang-20
i386        buildonly-randconfig-004-20250812    gcc-12
i386        buildonly-randconfig-005-20250812    clang-20
i386        buildonly-randconfig-005-20250812    gcc-12
i386        buildonly-randconfig-006-20250812    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250812    clang-20
i386                  randconfig-001-20250813    clang-20
i386                  randconfig-002-20250812    clang-20
i386                  randconfig-002-20250813    clang-20
i386                  randconfig-003-20250812    clang-20
i386                  randconfig-003-20250813    clang-20
i386                  randconfig-004-20250812    clang-20
i386                  randconfig-004-20250813    clang-20
i386                  randconfig-005-20250812    clang-20
i386                  randconfig-005-20250813    clang-20
i386                  randconfig-006-20250812    clang-20
i386                  randconfig-006-20250813    clang-20
i386                  randconfig-007-20250812    clang-20
i386                  randconfig-007-20250813    clang-20
i386                  randconfig-011-20250812    gcc-12
i386                  randconfig-011-20250813    gcc-11
i386                  randconfig-012-20250812    gcc-12
i386                  randconfig-012-20250813    gcc-11
i386                  randconfig-013-20250812    gcc-12
i386                  randconfig-013-20250813    gcc-11
i386                  randconfig-014-20250812    gcc-12
i386                  randconfig-014-20250813    gcc-11
i386                  randconfig-015-20250812    gcc-12
i386                  randconfig-015-20250813    gcc-11
i386                  randconfig-016-20250812    gcc-12
i386                  randconfig-016-20250813    gcc-11
i386                  randconfig-017-20250812    gcc-12
i386                  randconfig-017-20250813    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250812    gcc-15.1.0
loongarch             randconfig-001-20250813    clang-20
loongarch             randconfig-002-20250812    gcc-15.1.0
loongarch             randconfig-002-20250813    clang-20
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath25_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250812    gcc-10.5.0
nios2                 randconfig-001-20250813    clang-20
nios2                 randconfig-002-20250812    gcc-11.5.0
nios2                 randconfig-002-20250813    clang-20
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250812    gcc-10.5.0
parisc                randconfig-001-20250813    clang-20
parisc                randconfig-002-20250812    gcc-14.3.0
parisc                randconfig-002-20250813    clang-20
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-15.1.0
powerpc                     ppa8548_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250812    clang-19
powerpc               randconfig-001-20250813    clang-20
powerpc               randconfig-002-20250812    clang-22
powerpc               randconfig-002-20250813    clang-20
powerpc               randconfig-003-20250812    gcc-12.5.0
powerpc               randconfig-003-20250813    clang-20
powerpc64             randconfig-001-20250812    clang-22
powerpc64             randconfig-001-20250813    clang-20
powerpc64             randconfig-002-20250812    clang-16
powerpc64             randconfig-002-20250813    clang-20
powerpc64             randconfig-003-20250812    clang-18
powerpc64             randconfig-003-20250813    clang-20
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250812    clang-18
riscv                 randconfig-001-20250812    gcc-9.5.0
riscv                 randconfig-002-20250812    clang-18
riscv                 randconfig-002-20250812    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250812    clang-18
s390                  randconfig-002-20250812    clang-18
s390                  randconfig-002-20250812    clang-22
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250812    clang-18
sh                    randconfig-001-20250812    gcc-15.1.0
sh                    randconfig-002-20250812    clang-18
sh                    randconfig-002-20250812    gcc-15.1.0
sh                           se7343_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250812    clang-18
sparc                 randconfig-001-20250812    gcc-8.5.0
sparc                 randconfig-002-20250812    clang-18
sparc                 randconfig-002-20250812    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250812    clang-18
sparc64               randconfig-001-20250812    clang-22
sparc64               randconfig-002-20250812    clang-18
sparc64               randconfig-002-20250812    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250812    clang-18
um                    randconfig-001-20250812    gcc-11
um                    randconfig-002-20250812    clang-18
um                    randconfig-002-20250812    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250812    clang-20
x86_64      buildonly-randconfig-001-20250812    gcc-12
x86_64      buildonly-randconfig-002-20250812    gcc-12
x86_64      buildonly-randconfig-003-20250812    gcc-12
x86_64      buildonly-randconfig-004-20250812    gcc-12
x86_64      buildonly-randconfig-005-20250812    clang-20
x86_64      buildonly-randconfig-005-20250812    gcc-12
x86_64      buildonly-randconfig-006-20250812    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250812    gcc-11
x86_64                randconfig-001-20250813    gcc-12
x86_64                randconfig-002-20250812    gcc-11
x86_64                randconfig-002-20250813    gcc-12
x86_64                randconfig-003-20250812    gcc-11
x86_64                randconfig-003-20250813    gcc-12
x86_64                randconfig-004-20250812    gcc-11
x86_64                randconfig-004-20250813    gcc-12
x86_64                randconfig-005-20250812    gcc-11
x86_64                randconfig-005-20250813    gcc-12
x86_64                randconfig-006-20250812    gcc-11
x86_64                randconfig-006-20250813    gcc-12
x86_64                randconfig-007-20250812    gcc-11
x86_64                randconfig-007-20250813    gcc-12
x86_64                randconfig-008-20250812    gcc-11
x86_64                randconfig-008-20250813    gcc-12
x86_64                randconfig-071-20250812    clang-20
x86_64                randconfig-071-20250813    clang-20
x86_64                randconfig-072-20250812    clang-20
x86_64                randconfig-072-20250813    clang-20
x86_64                randconfig-073-20250812    clang-20
x86_64                randconfig-073-20250813    clang-20
x86_64                randconfig-074-20250812    clang-20
x86_64                randconfig-074-20250813    clang-20
x86_64                randconfig-075-20250812    clang-20
x86_64                randconfig-075-20250813    clang-20
x86_64                randconfig-076-20250812    clang-20
x86_64                randconfig-076-20250813    clang-20
x86_64                randconfig-077-20250812    clang-20
x86_64                randconfig-077-20250813    clang-20
x86_64                randconfig-078-20250812    clang-20
x86_64                randconfig-078-20250813    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20250812    clang-18
xtensa                randconfig-001-20250812    gcc-10.5.0
xtensa                randconfig-002-20250812    clang-18
xtensa                randconfig-002-20250812    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


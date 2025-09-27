Return-Path: <linux-media+bounces-43280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBDBA59FA
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 08:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2DC4C6F99
	for <lists+linux-media@lfdr.de>; Sat, 27 Sep 2025 06:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5ACD1EFF8B;
	Sat, 27 Sep 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8Ikd4cu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D427A11A
	for <linux-media@vger.kernel.org>; Sat, 27 Sep 2025 06:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758955803; cv=none; b=qpHMow+98pW6euGXHsvLq/l4JlKO9VJfwWz18kwjinQ4fIS63b5nEsyek8nclceqnyUjnyzJcoe82HqD7elFlWem7hHSAvQc7eG0xvyN6lrsuzdG16JjDBXd9RuuhC4m1dtYnG8fvFH6wpgPkX6CbJ8E1B2Ic+joOS4u+iMETEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758955803; c=relaxed/simple;
	bh=QWT4E5CjWAdP/kUNXSKa7GO/4fiOhg5XZvYfjAI+rG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b7081UgovRSxZc4iQj9xt304JHjF8lJx8ehd+hxXMPCqIDLqQTzFB23tuAc2M6KcIJm//L1lImy6zsf75pllwMbXw1uzbyYeFj/Cuo1WeGIEsMwIsX6QINmIpJ4JjvgsXXzPoxy/Tl8lOK7eaET0izaNW/sXOAXWe8xf5O1Drxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8Ikd4cu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758955802; x=1790491802;
  h=date:from:to:cc:subject:message-id;
  bh=QWT4E5CjWAdP/kUNXSKa7GO/4fiOhg5XZvYfjAI+rG8=;
  b=C8Ikd4cueOVQ56xIZVc+XuBqn0XmW6kT0IG+wubqtYcWWUbYMA7cj7jA
   QO/OxnVZtyaeQYr+SlcRUjyLARLvQBNlcjwY3JvEIFevValqnfn/RKeor
   aqmR9LFEy0wO2Ikp6Ke1gYV2aQjMOZbDdVGcdvZSPJQDHJsr9UigFmsDk
   buspXQxyOJA57+U/nZAKiqiMC0GjqE1measV+tPSYCSOUIOq43qx8GsOj
   LLMtxmdjEK7k0ipvcr36ax50a1R6LhgRFULf/U/3oGgPHbReSEfihvVnd
   atGo7jLE6Qtkkb406iCm2KV8SCz0vuZ1x7yxrOtcdGMsdPgsjVdXJ97E7
   g==;
X-CSE-ConnectionGUID: MauNiU/ATBiinzhD1hwe1A==
X-CSE-MsgGUID: 3Pc62vFOSNqyPvOGzIPbwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61169391"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61169391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 23:50:01 -0700
X-CSE-ConnectionGUID: k1k37Jg8T/ONRIxWn1rLvA==
X-CSE-MsgGUID: /TrLd+TtRkqvlI6DwwseLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="181800244"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Sep 2025 23:50:00 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Okm-0006qp-2u;
	Sat, 27 Sep 2025 06:49:56 +0000
Date: Sat, 27 Sep 2025 14:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 3e8a67ab0a6e8e8e9c9f0fa5910c9259ac99e971
Message-ID: <202509271423.H2ICefFP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 3e8a67ab0a6e8e8e9c9f0fa5910c9259ac99e971  media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the privacy LED

elapsed time: 1446m

configs tested: 243
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
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-001-20250927    gcc-10.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arc                   randconfig-002-20250927    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                            dove_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                          pxa910_defconfig    clang-22
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-001-20250927    gcc-10.5.0
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-002-20250927    gcc-10.5.0
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-003-20250927    gcc-10.5.0
arm                   randconfig-004-20250926    clang-22
arm                   randconfig-004-20250927    gcc-10.5.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            alldefconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-001-20250927    gcc-10.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-002-20250927    gcc-10.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-003-20250927    gcc-10.5.0
arm64                 randconfig-004-20250926    clang-22
arm64                 randconfig-004-20250927    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-001-20250927    clang-22
csky                  randconfig-002-20250926    gcc-14.3.0
csky                  randconfig-002-20250927    clang-22
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-001-20250927    clang-22
hexagon               randconfig-002-20250926    clang-22
hexagon               randconfig-002-20250927    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-001-20250927    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-002-20250927    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-003-20250927    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-004-20250927    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-005-20250927    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386        buildonly-randconfig-006-20250927    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250927    gcc-14
i386                  randconfig-002-20250927    gcc-14
i386                  randconfig-003-20250927    gcc-14
i386                  randconfig-004-20250927    gcc-14
i386                  randconfig-005-20250927    gcc-14
i386                  randconfig-006-20250927    gcc-14
i386                  randconfig-007-20250927    gcc-14
i386                  randconfig-011-20250927    clang-20
i386                  randconfig-012-20250927    clang-20
i386                  randconfig-013-20250927    clang-20
i386                  randconfig-014-20250927    clang-20
i386                  randconfig-015-20250927    clang-20
i386                  randconfig-016-20250927    clang-20
i386                  randconfig-017-20250927    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-001-20250927    clang-22
loongarch             randconfig-002-20250926    clang-22
loongarch             randconfig-002-20250927    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
m68k                       bvme6000_defconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          multi_defconfig    clang-22
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-22
mips                          rb532_defconfig    gcc-15.1.0
nios2                         3c120_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-001-20250927    clang-22
nios2                 randconfig-002-20250926    gcc-8.5.0
nios2                 randconfig-002-20250927    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-001-20250927    clang-22
parisc                randconfig-002-20250926    gcc-10.5.0
parisc                randconfig-002-20250927    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-001-20250927    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-002-20250927    clang-22
powerpc               randconfig-003-20250926    clang-22
powerpc               randconfig-003-20250927    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-001-20250927    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-002-20250927    clang-22
powerpc64             randconfig-003-20250926    gcc-15.1.0
powerpc64             randconfig-003-20250927    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-001-20250927    gcc-11.5.0
riscv                 randconfig-002-20250926    clang-22
riscv                 randconfig-002-20250927    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-001-20250927    gcc-11.5.0
s390                  randconfig-002-20250926    gcc-8.5.0
s390                  randconfig-002-20250927    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-001-20250927    gcc-11.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sh                    randconfig-002-20250927    gcc-11.5.0
sh                           se7343_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-001-20250927    gcc-11.5.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc                 randconfig-002-20250927    gcc-11.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-001-20250927    gcc-11.5.0
sparc64               randconfig-002-20250926    clang-22
sparc64               randconfig-002-20250927    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-001-20250927    gcc-11.5.0
um                    randconfig-002-20250926    clang-22
um                    randconfig-002-20250927    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-001-20250927    gcc-14
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-002-20250927    gcc-14
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-003-20250927    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250927    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250927    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250927    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250927    clang-20
x86_64                randconfig-002-20250927    clang-20
x86_64                randconfig-003-20250927    clang-20
x86_64                randconfig-004-20250927    clang-20
x86_64                randconfig-005-20250927    clang-20
x86_64                randconfig-006-20250927    clang-20
x86_64                randconfig-007-20250927    clang-20
x86_64                randconfig-008-20250927    clang-20
x86_64                randconfig-071-20250927    gcc-14
x86_64                randconfig-072-20250927    gcc-14
x86_64                randconfig-073-20250927    gcc-14
x86_64                randconfig-074-20250927    gcc-14
x86_64                randconfig-075-20250927    gcc-14
x86_64                randconfig-076-20250927    gcc-14
x86_64                randconfig-077-20250927    gcc-14
x86_64                randconfig-078-20250927    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-001-20250927    gcc-11.5.0
xtensa                randconfig-002-20250926    gcc-8.5.0
xtensa                randconfig-002-20250927    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


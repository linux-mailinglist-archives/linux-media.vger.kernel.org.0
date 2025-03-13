Return-Path: <linux-media+bounces-28152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1C6A5FBEA
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 17:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B4C1887721
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 16:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63026563C;
	Thu, 13 Mar 2025 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QptlvW8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3713BAF1
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883816; cv=none; b=rgSwQ/+OXWFU5OG07Vn/FP2KJsJJTlNA0E94ORneSf0bPA+tWeUgSj21hNHvu1q1vfveyAl3EMEM63JgWSG73ah3pR8/c1yOW/QVL4CiTwZ5uMsZdvOAb6+FBKTJo5DHvpoUfP4lLTXuOV8wZyiWGgln0W4LUyh+b5keub7QIHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883816; c=relaxed/simple;
	bh=4Te5evmI70f2hGJKNB13KIwnwNh1FgouImLiLE4Syo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kb5htWlU7t06tiox48IJ6nOmLt9GYyYCiyGdFQY1Mp7C+Zc1Fpn53Tw7wR+T7TJeO5GcV2Kztb5mq7SpmSFudUByizwoScGJoGGjnRh8Z+an6f8c0mwS/SkZ9+xwssMByLHp1yLtAIdBQgr6ujRpXAKShXbVURAcLZZTxpS+/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QptlvW8s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741883815; x=1773419815;
  h=date:from:to:cc:subject:message-id;
  bh=4Te5evmI70f2hGJKNB13KIwnwNh1FgouImLiLE4Syo8=;
  b=QptlvW8sAUarCqUawc/8BXQecQa+pkjqlHFMW0BAeusaXXVlpsKm1YkE
   dDPIkOUVooVwV+7doQH4JhOdz7kQxIl4vS29sjK2ONln04IUzMsB7I6Ey
   AbUsIZ8jfPi5PYil6Y7mjcUpnaR220WQF+YmuS2tlUbJ3jxKc1iL1Nz0e
   tKbGgadl+lJwbzs6EPs9WugcSADBx/hirtZu05G9QYKpd7J2KfMfPfXMT
   HqrcpVg6kq2x9WfurSvB/Mmmx3qdbgD1OfqXu+jBWJEmh4pywpO4aT4xs
   UHhgbfxr3ibBYKJp3cca08pfK4quCUlSFa/deYwz0o4aNwi/nJQX1ofCq
   Q==;
X-CSE-ConnectionGUID: yjl+060dSzmHHwLhKJ0VfA==
X-CSE-MsgGUID: Fjfm2hKQR7K924vxMlsfcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68375530"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="68375530"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 09:36:54 -0700
X-CSE-ConnectionGUID: eX5Ps2LLS3qPU8IhqX+25w==
X-CSE-MsgGUID: z9RiWkeOR1K9eepm5LGf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="120738414"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Mar 2025 09:36:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tslYA-0009fa-0p;
	Thu, 13 Mar 2025 16:36:50 +0000
Date: Fri, 14 Mar 2025 00:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 d9e7c172a7f247f7ef0b151fa8c8f044b6a2a070
Message-ID: <202503140012.FB1bqbiV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: d9e7c172a7f247f7ef0b151fa8c8f044b6a2a070  media: rtl2832_sdr: assign vb2 lock before vb2_queue_init

elapsed time: 1448m

configs tested: 185
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20250313    clang-18
arc                   randconfig-001-20250313    gcc-13.2.0
arc                   randconfig-002-20250313    clang-18
arc                   randconfig-002-20250313    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250313    clang-16
arm                   randconfig-001-20250313    clang-18
arm                   randconfig-002-20250313    clang-18
arm                   randconfig-003-20250313    clang-18
arm                   randconfig-003-20250313    gcc-14.2.0
arm                   randconfig-004-20250313    clang-18
arm                   randconfig-004-20250313    clang-21
arm                           sama5_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250313    clang-18
arm64                 randconfig-002-20250313    clang-16
arm64                 randconfig-002-20250313    clang-18
arm64                 randconfig-003-20250313    clang-18
arm64                 randconfig-003-20250313    gcc-14.2.0
arm64                 randconfig-004-20250313    clang-18
arm64                 randconfig-004-20250313    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250313    gcc-14.2.0
csky                  randconfig-002-20250313    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250313    clang-17
hexagon               randconfig-001-20250313    gcc-14.2.0
hexagon               randconfig-002-20250313    clang-21
hexagon               randconfig-002-20250313    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250313    clang-19
i386        buildonly-randconfig-001-20250313    gcc-12
i386        buildonly-randconfig-002-20250313    clang-19
i386        buildonly-randconfig-002-20250313    gcc-12
i386        buildonly-randconfig-003-20250313    clang-19
i386        buildonly-randconfig-004-20250313    clang-19
i386        buildonly-randconfig-004-20250313    gcc-12
i386        buildonly-randconfig-005-20250313    clang-19
i386        buildonly-randconfig-006-20250313    clang-19
i386        buildonly-randconfig-006-20250313    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250313    clang-19
i386                  randconfig-002-20250313    clang-19
i386                  randconfig-003-20250313    clang-19
i386                  randconfig-004-20250313    clang-19
i386                  randconfig-005-20250313    clang-19
i386                  randconfig-006-20250313    clang-19
i386                  randconfig-007-20250313    clang-19
i386                  randconfig-011-20250313    clang-19
i386                  randconfig-012-20250313    clang-19
i386                  randconfig-013-20250313    clang-19
i386                  randconfig-014-20250313    clang-19
i386                  randconfig-015-20250313    clang-19
i386                  randconfig-016-20250313    clang-19
i386                  randconfig-017-20250313    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250313    gcc-14.2.0
loongarch             randconfig-002-20250313    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250313    gcc-14.2.0
nios2                 randconfig-002-20250313    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250313    gcc-14.2.0
parisc                randconfig-002-20250313    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                   currituck_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250313    clang-16
powerpc               randconfig-001-20250313    gcc-14.2.0
powerpc               randconfig-002-20250313    clang-18
powerpc               randconfig-002-20250313    gcc-14.2.0
powerpc               randconfig-003-20250313    gcc-14.2.0
powerpc64             randconfig-001-20250313    gcc-14.2.0
powerpc64             randconfig-002-20250313    gcc-14.2.0
powerpc64             randconfig-003-20250313    gcc-14.2.0
riscv                             allnoconfig    clang-15
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250313    clang-21
riscv                 randconfig-001-20250313    gcc-14.2.0
riscv                 randconfig-002-20250313    clang-21
riscv                 randconfig-002-20250313    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250313    clang-15
s390                  randconfig-001-20250313    gcc-14.2.0
s390                  randconfig-002-20250313    clang-15
s390                  randconfig-002-20250313    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250313    gcc-14.2.0
sh                    randconfig-002-20250313    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250313    gcc-14.2.0
sparc                 randconfig-002-20250313    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250313    gcc-14.2.0
sparc64               randconfig-002-20250313    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250313    clang-21
um                    randconfig-001-20250313    gcc-14.2.0
um                    randconfig-002-20250313    clang-21
um                    randconfig-002-20250313    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250313    clang-19
x86_64      buildonly-randconfig-002-20250313    clang-19
x86_64      buildonly-randconfig-003-20250313    clang-19
x86_64      buildonly-randconfig-004-20250313    clang-19
x86_64      buildonly-randconfig-004-20250313    gcc-12
x86_64      buildonly-randconfig-005-20250313    clang-19
x86_64      buildonly-randconfig-006-20250313    clang-19
x86_64      buildonly-randconfig-006-20250313    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250313    gcc-12
x86_64                randconfig-002-20250313    gcc-12
x86_64                randconfig-003-20250313    gcc-12
x86_64                randconfig-004-20250313    gcc-12
x86_64                randconfig-005-20250313    gcc-12
x86_64                randconfig-006-20250313    gcc-12
x86_64                randconfig-007-20250313    gcc-12
x86_64                randconfig-008-20250313    gcc-12
x86_64                randconfig-071-20250313    gcc-12
x86_64                randconfig-072-20250313    gcc-12
x86_64                randconfig-073-20250313    gcc-12
x86_64                randconfig-074-20250313    gcc-12
x86_64                randconfig-075-20250313    gcc-12
x86_64                randconfig-076-20250313    gcc-12
x86_64                randconfig-077-20250313    gcc-12
x86_64                randconfig-078-20250313    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250313    gcc-14.2.0
xtensa                randconfig-002-20250313    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


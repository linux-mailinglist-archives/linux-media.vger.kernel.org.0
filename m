Return-Path: <linux-media+bounces-13766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E357E90FC27
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 07:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F061F25419
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 05:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908062C694;
	Thu, 20 Jun 2024 05:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3x8D+JX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CE4628
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718860837; cv=none; b=QrQjMA117wBISS8lJ8VadMU2B2eIPAZDKnwd7P8K+ICjvc6LNejsEb+Td61KK/7aScHqGv10/T1e6QqF4HR5xl0AtmzN9GTwNpQ+lEU+lJqFcdnuXTpyWhDQLkAaUdOFU9jnckfb9Or7VRjP2toxMvk988DskXlv105SmLjcXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718860837; c=relaxed/simple;
	bh=zvM1TpI9Q1JHCXoILMFpwv48syTcviNPyQDRE7dJgEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LUr4lD/I6Of5jps1iX/AOhUUU793vOvE4zzWk8d0FCjc/NB2dkFjmH7+3mu15EOdu79TzxU5R7Qjm1s1uDm9mH0PsJ58hG+DyvC33aGbSxYYkG/HrOieFZdvgE6FYL8YqNu0+4Hs1PUCI1UQGWrVI2Xy9zcBiArUSnJNKFfa/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3x8D+JX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718860835; x=1750396835;
  h=date:from:to:cc:subject:message-id;
  bh=zvM1TpI9Q1JHCXoILMFpwv48syTcviNPyQDRE7dJgEs=;
  b=E3x8D+JXXGKrahzO0KDMYRvuec1j8zZxz7PiF0ZNVq5ObA0lO14v+6VK
   9vls2QffB8c9VOZMCKFDzNsJyGTCVLfoeidhAkNhM6BWZgOMZC4gAdCMg
   33Fh/8N+QZbLGeFVyDYbGOTNFUm1zzpX5OWcnDVhhwQ4k3opvNgF9hnVX
   BL15/F4WlW97INvi7WyRWXkK7oiORV4NALVmE6XXSRPsjk5Vqm4s7Z6Ou
   kJNVU/DWrwmje1mx10OjLYd2mAZDNzfpYIhlGmcMrvkFs7mPG9a+z6j1G
   f08FB30Qswiwdy1dATJpQzuUb5BS+FxHqXxxoVxOPnNjvLKdUQfM6KKZv
   w==;
X-CSE-ConnectionGUID: K/NAq7NVRA6v5/MLUKdniw==
X-CSE-MsgGUID: kJm1mtmLTVy0PnmaZijKhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15647568"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15647568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 22:20:34 -0700
X-CSE-ConnectionGUID: BAi8j7fDT7OTtDsChKyAoA==
X-CSE-MsgGUID: 4ai88ZwqQxGmRvQ7Bv1eEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="41944233"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2024 22:20:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKADm-0007Ko-2R;
	Thu, 20 Jun 2024 05:20:30 +0000
Date: Thu, 20 Jun 2024 13:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 fd404435d44b453d62afe77545b9252c2cc72c8a
Message-ID: <202406201311.9H2Ec4Yy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: fd404435d44b453d62afe77545b9252c2cc72c8a  media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE

elapsed time: 6881m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240616   gcc-13.2.0
arc                   randconfig-002-20240616   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                                 defconfig   clang-14
arm                   randconfig-001-20240616   gcc-13.2.0
arm                   randconfig-002-20240616   gcc-13.2.0
arm                   randconfig-003-20240616   clang-16
arm                   randconfig-004-20240616   clang-19
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240616   gcc-13.2.0
arm64                 randconfig-002-20240616   clang-19
arm64                 randconfig-003-20240616   clang-19
arm64                 randconfig-004-20240616   clang-19
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240616   gcc-13.2.0
csky                  randconfig-002-20240616   gcc-13.2.0
hexagon                           allnoconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240616   clang-19
hexagon               randconfig-002-20240616   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240615   clang-18
i386         buildonly-randconfig-002-20240615   gcc-9
i386         buildonly-randconfig-003-20240615   gcc-7
i386         buildonly-randconfig-004-20240615   clang-18
i386         buildonly-randconfig-005-20240615   clang-18
i386         buildonly-randconfig-006-20240615   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240615   clang-18
i386                  randconfig-002-20240615   gcc-13
i386                  randconfig-003-20240615   clang-18
i386                  randconfig-004-20240615   clang-18
i386                  randconfig-005-20240615   clang-18
i386                  randconfig-006-20240615   clang-18
i386                  randconfig-011-20240615   clang-18
i386                  randconfig-012-20240615   gcc-12
i386                  randconfig-013-20240615   gcc-13
i386                  randconfig-014-20240615   clang-18
i386                  randconfig-015-20240615   clang-18
i386                  randconfig-016-20240615   gcc-13
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240616   gcc-13.2.0
loongarch             randconfig-002-20240616   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240616   gcc-13.2.0
nios2                 randconfig-002-20240616   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240616   gcc-13.2.0
parisc                randconfig-002-20240616   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240616   gcc-13.2.0
powerpc               randconfig-002-20240616   clang-19
powerpc               randconfig-003-20240616   gcc-13.2.0
powerpc64             randconfig-001-20240616   gcc-13.2.0
powerpc64             randconfig-002-20240616   clang-19
powerpc64             randconfig-003-20240616   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240616   clang-14
riscv                 randconfig-002-20240616   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240616   clang-19
s390                  randconfig-002-20240616   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240616   gcc-13.2.0
sh                    randconfig-002-20240616   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240616   gcc-13.2.0
sparc64               randconfig-002-20240616   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240616   gcc-13
um                    randconfig-002-20240616   gcc-10
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240616   gcc-13.2.0
xtensa                randconfig-002-20240616   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


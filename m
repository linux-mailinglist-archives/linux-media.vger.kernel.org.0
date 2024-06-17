Return-Path: <linux-media+bounces-13370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6790A2F8
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 05:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74D9C1C212C0
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 03:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E0C16E88D;
	Mon, 17 Jun 2024 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guAomhaa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE7A31
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 03:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718596613; cv=none; b=Ey7u5wlFbMMdDkTXM7mGrdg6UkaZFLFHL09RpYfg9kELRqgBI616PWxebuz0z/ACTTf0+44L7STUKNdhiiF9rSunWghFn6QdDS8HId2kp+VhV9cRHQ1wIsiWKYNlDuaohs289kAGUvSbX2zoPLViltegShGwdgAV+fTdUTKFT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718596613; c=relaxed/simple;
	bh=/sNUn6Rbtd58uiwus5hYBVsVnsHup6iWkVvQINYwQg8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/9JN+3MQmE/O7VAD7kpSOEXATz08qo5Gz1KYLuYRi/GLh3HAhj4jvQYShYzd+siUoQ7S0BuEwUMkrD+/fJtitu3lO+VDE/0j6qHZujEq6ZWjzJ1dm1M6HtOZx7S5DeDtO/+GkN1DYccfSjKALhV8DhV0+mlpzOC/jaGGzQIkEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guAomhaa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718596611; x=1750132611;
  h=date:from:to:cc:subject:message-id;
  bh=/sNUn6Rbtd58uiwus5hYBVsVnsHup6iWkVvQINYwQg8=;
  b=guAomhaargFv1gy2jmJ9E0kKaMdEjWo+qjrhHHKAaDJZurAUO1xfvFTy
   wbvmuFYmYn4/S62D+6Cmec9AEcIkQA1r+EBV+HrGxHB3vxGUBAQTthPLx
   jpYXW1CwwHsfIIz9kf/IAEBW2JW6LEC7dcCa6YhZ869nTk61YMB9kYytB
   1lgECjZLoU3OXvLTV6Ikr7OMxZhkxgyUBkPFi/lcV27v6fne+cZf6bESK
   BcRWh9d3PBMMzMs8PJ6Q56URZGJMHn1HsXIa7lPWjD8k1Pcp54Vwxbqfu
   DHIIiHxZ1GKTLBpkoiC6yMirEMNNkmFOx4ITHY1/SjBjBP/yxDXB6XicK
   A==;
X-CSE-ConnectionGUID: BgQN1NpRQg6ujo1uPRAKVQ==
X-CSE-MsgGUID: 09t23wnlToaPcUgfucmFiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26806601"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26806601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 20:56:50 -0700
X-CSE-ConnectionGUID: f659aeDpTC6WlQ6UseMpmw==
X-CSE-MsgGUID: CbV1gs2WRgiRHZR/zLgTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46023969"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2024 20:56:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ3U7-0003l1-1E;
	Mon, 17 Jun 2024 03:56:47 +0000
Date: Mon, 17 Jun 2024 11:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 91798162245991e26949ef62851719bb2177a9c2
Message-ID: <202406171100.r77B0cjl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 91798162245991e26949ef62851719bb2177a9c2  media: v4l: add missing MODULE_DESCRIPTION() macros

elapsed time: 2477m

configs tested: 93
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240616   gcc-13.2.0
arc                   randconfig-002-20240616   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                   randconfig-001-20240616   gcc-13.2.0
arm                   randconfig-002-20240616   gcc-13.2.0
arm                   randconfig-003-20240616   clang-16
arm                   randconfig-004-20240616   clang-19
arm                             rpc_defconfig   clang-19
arm64                 randconfig-001-20240616   gcc-13.2.0
arm64                 randconfig-002-20240616   clang-19
arm64                 randconfig-003-20240616   clang-19
arm64                 randconfig-004-20240616   clang-19
csky                  randconfig-001-20240616   gcc-13.2.0
csky                  randconfig-002-20240616   gcc-13.2.0
hexagon               randconfig-001-20240616   clang-19
hexagon               randconfig-002-20240616   clang-19
i386         buildonly-randconfig-001-20240615   clang-18
i386         buildonly-randconfig-002-20240615   gcc-9
i386         buildonly-randconfig-003-20240615   gcc-7
i386         buildonly-randconfig-004-20240615   clang-18
i386         buildonly-randconfig-005-20240615   clang-18
i386         buildonly-randconfig-006-20240615   gcc-13
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
loongarch             randconfig-001-20240616   gcc-13.2.0
loongarch             randconfig-002-20240616   gcc-13.2.0
m68k                          amiga_defconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                           ip32_defconfig   clang-19
mips                      loongson3_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   clang-19
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
powerpc                       holly_defconfig   clang-19
powerpc                   lite5200b_defconfig   clang-14
powerpc                      makalu_defconfig   clang-19
powerpc                      mgcoge_defconfig   clang-19
powerpc                     mpc512x_defconfig   clang-19
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240616   gcc-13.2.0
powerpc               randconfig-002-20240616   clang-19
powerpc               randconfig-003-20240616   gcc-13.2.0
powerpc                  storcenter_defconfig   gcc-13.2.0
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
sh                          lboxre2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240616   gcc-13.2.0
sh                    randconfig-002-20240616   gcc-13.2.0
sh                              ul2_defconfig   gcc-13.2.0
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
xtensa                            allnoconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240616   gcc-13.2.0
xtensa                randconfig-002-20240616   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


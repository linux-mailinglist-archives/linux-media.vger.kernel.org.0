Return-Path: <linux-media+bounces-4198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1C83CCB5
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 20:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8051C22D22
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 19:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76046137C30;
	Thu, 25 Jan 2024 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsDXEvtl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB78472
	for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211622; cv=none; b=aX3cMP79Bo7B6EnHl+LP++YQy/7GHuuA8Vlm7FSpKbbLaarwQUKdZQ08ekFxVO8Bpglla0IuMnqJ1MQpn3qlczhPuuJ9XEgx3hBPVa9hdUCHcBjkeWStIvA/fYMr6I0Mme8bVFXZVwZFRaTT7S3Dto9yuTfXcRHawoQPXd57gbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211622; c=relaxed/simple;
	bh=t5PmoYSCgliq8XsPfTfthj+E+HZNZd3VWZHPmmEVnTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CszF86ndEzq8T9z+WWTIFzqhkk3apcJB+BMuH6VMKdCT3FBHQkZD8CdRSvGx5T27OM/pi/KZJtkK/k5Yyr0XJSPbW/dFwG41aZv78JQjGzvyjgMy3vGNWA4XT1bpKXYh3tzaA9MsVJv/zLnwACbUj/pEwqA0HTDaCrAIsFWe+kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsDXEvtl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706211620; x=1737747620;
  h=date:from:to:cc:subject:message-id;
  bh=t5PmoYSCgliq8XsPfTfthj+E+HZNZd3VWZHPmmEVnTY=;
  b=GsDXEvtlr4W5PbT5zcJ+Z+vMdJExXak16Vy6EfLQrC5EcDuAoOewc24r
   rwQIFnEh1moKzQ1b3/NuZAw8RMODRB5Vsxqfar889N4mi96y68oeRZ/Cl
   n14BYcjI1RGjNufXUSYkrYK9pb1LwJmMFeocJhcsX0tvzD8smFJK4Xzh3
   MLcVGT0mggPVQFV6IsstHOERPcul+8rq0LuogELD3MhPjCK9s58WvLd58
   r4i3R0Ys4d0W6+o8l249XTt1IPSnh+7OzFwpcNxRsCsjsTw4cQmq02eKG
   9jgvUMLqbwmk5Dv1isuTsIfzMuZ8842oIVLt7Z+Jrv8M7sND9aL1qaBP+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9388471"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9388471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 11:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2460951"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2024 11:40:18 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT5aC-0000Mi-1H;
	Thu, 25 Jan 2024 19:40:16 +0000
Date: Fri, 26 Jan 2024 03:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 b32431b753217d8d45b018443b1a7aac215921fb
Message-ID: <202401260301.NNZcM1lP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: b32431b753217d8d45b018443b1a7aac215921fb  media: vb2: refactor setting flags and caps, fix missing cap

elapsed time: 1583m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240126   gcc  
arc                   randconfig-002-20240126   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240126   clang
arm                   randconfig-002-20240126   clang
arm                   randconfig-003-20240126   clang
arm                   randconfig-004-20240126   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240126   clang
arm64                 randconfig-002-20240126   clang
arm64                 randconfig-003-20240126   clang
arm64                 randconfig-004-20240126   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240126   gcc  
csky                  randconfig-002-20240126   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240126   clang
hexagon               randconfig-002-20240126   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240125   gcc  
i386         buildonly-randconfig-002-20240125   gcc  
i386         buildonly-randconfig-003-20240125   gcc  
i386         buildonly-randconfig-004-20240125   gcc  
i386         buildonly-randconfig-005-20240125   gcc  
i386         buildonly-randconfig-006-20240125   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240125   gcc  
i386                  randconfig-002-20240125   gcc  
i386                  randconfig-003-20240125   gcc  
i386                  randconfig-004-20240125   gcc  
i386                  randconfig-005-20240125   gcc  
i386                  randconfig-006-20240125   gcc  
i386                  randconfig-011-20240125   clang
i386                  randconfig-012-20240125   clang
i386                  randconfig-013-20240125   clang
i386                  randconfig-014-20240125   clang
i386                  randconfig-015-20240125   clang
i386                  randconfig-016-20240125   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240126   gcc  
loongarch             randconfig-002-20240126   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240126   gcc  
nios2                 randconfig-002-20240126   gcc  
parisc                randconfig-001-20240126   gcc  
parisc                randconfig-002-20240126   gcc  
powerpc               randconfig-001-20240126   clang
powerpc               randconfig-002-20240126   clang
powerpc               randconfig-003-20240126   clang
powerpc64             randconfig-001-20240126   clang
powerpc64             randconfig-002-20240126   clang
powerpc64             randconfig-003-20240126   clang
riscv                 randconfig-001-20240126   clang
riscv                 randconfig-002-20240126   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240126   gcc  
s390                  randconfig-002-20240126   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240126   gcc  
sh                    randconfig-002-20240126   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240126   gcc  
sparc64               randconfig-002-20240126   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240126   clang
um                    randconfig-002-20240126   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


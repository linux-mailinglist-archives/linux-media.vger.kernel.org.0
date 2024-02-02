Return-Path: <linux-media+bounces-4626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F2E8476EB
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 19:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 331AE28326E
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 18:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2A314D429;
	Fri,  2 Feb 2024 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnDAwqgI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ABD14AD34
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706896893; cv=none; b=e54FGu/TWT0DiHLsx2ISyLUiHVHTE8NAJTcY70ufZ+weoSvTZOBrz9YjodINUOrydaCsnmUTjR4dzXlpDgcrXKqKb/XrzNxqoNxZvAGBR9HM5iG7Y3by1gK4fj3+VlfJG+XuYLHCc78+15/5k7wA3yvvGNRMg4u5hcuXBU3iveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706896893; c=relaxed/simple;
	bh=U5VQAyzH+fdtWHwGx2RyWRO60pM3f6OGxIurDIEQqSQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bml7gXSOlPudbMAAu21lHWPKqtj8szSeMVcLr41B7k1Tm1oCSLBBfHd8LBy9Ukvo/1pTGZtqytIMNqoc2DFwL7vM2Dkkgso6tW1IqFb8PRjdFzeavXg7dPKPjOl7QF+IvFejTq5+jmX6Ot62DCeG9Vfz6r7p0vlBPwNhDAzzsTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnDAwqgI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706896892; x=1738432892;
  h=date:from:to:cc:subject:message-id;
  bh=U5VQAyzH+fdtWHwGx2RyWRO60pM3f6OGxIurDIEQqSQ=;
  b=lnDAwqgIpVawXIMahPon3j+rDEmiQiEdi5yHJdMV0zYxgz7Au6/2dOaz
   lGheFenK3aG+gstvyEra5+qViFl0zFNkteQe0luELVjmneM6sFWvUBfwQ
   fZV4Z/3ULYVxIebDgqrMppPY1uBboT/zVxSWafJBdWX9j2DT5FaK6Kmgh
   jl+eSYfOkOkAY+YbAGHAcFeFztPuQf/tpUxLwUNsDhX2csWuS0Od2Ok7F
   IV7TnMjFJwt6Bb/VCP1jlGG78bnJFEjMEQxx6FfRa/MAmQMtIbb1BEuDF
   AdbgyHHabJ3UufcZhfurQc2EeQ8GUmi1P+sWXPqRKI0/eYFo3fu5kJLW3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3170870"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3170870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4738092"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2024 10:01:29 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVxqw-00047r-1e;
	Fri, 02 Feb 2024 18:01:26 +0000
Date: Sat, 03 Feb 2024 02:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes] BUILD SUCCESS
 346c84e281a963437b9fe9dfcd92c531630289de
Message-ID: <202402030214.KVx8fAbs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git fixes
branch HEAD: 346c84e281a963437b9fe9dfcd92c531630289de  media: pwm-ir-tx: Depend on CONFIG_HIGH_RES_TIMERS

elapsed time: 1452m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240202   gcc  
arc                   randconfig-002-20240202   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         nhk8815_defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240202   gcc  
arm                   randconfig-002-20240202   gcc  
arm                   randconfig-003-20240202   gcc  
arm                   randconfig-004-20240202   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240202   gcc  
arm64                 randconfig-002-20240202   clang
arm64                 randconfig-003-20240202   gcc  
arm64                 randconfig-004-20240202   gcc  
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240202   gcc  
csky                  randconfig-002-20240202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240202   clang
hexagon               randconfig-002-20240202   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240202   gcc  
loongarch             randconfig-002-20240202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson1c_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240202   gcc  
nios2                 randconfig-002-20240202   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240202   gcc  
parisc                randconfig-002-20240202   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                      pcm030_defconfig   clang
powerpc               randconfig-001-20240202   clang
powerpc               randconfig-002-20240202   clang
powerpc               randconfig-003-20240202   clang
powerpc64             randconfig-001-20240202   clang
powerpc64             randconfig-002-20240202   gcc  
powerpc64             randconfig-003-20240202   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240202   gcc  
riscv                 randconfig-002-20240202   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240202   clang
s390                  randconfig-002-20240202   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240202   gcc  
sh                    randconfig-002-20240202   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240202   gcc  
sparc64               randconfig-002-20240202   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240202   clang
um                    randconfig-002-20240202   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240202   clang
x86_64       buildonly-randconfig-002-20240202   clang
x86_64       buildonly-randconfig-003-20240202   clang
x86_64       buildonly-randconfig-004-20240202   clang
x86_64       buildonly-randconfig-005-20240202   gcc  
x86_64       buildonly-randconfig-006-20240202   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240202   clang
x86_64                randconfig-002-20240202   clang
x86_64                randconfig-003-20240202   gcc  
x86_64                randconfig-004-20240202   gcc  
x86_64                randconfig-005-20240202   gcc  
x86_64                randconfig-006-20240202   gcc  
x86_64                randconfig-011-20240202   clang
x86_64                randconfig-012-20240202   clang
x86_64                randconfig-013-20240202   gcc  
x86_64                randconfig-014-20240202   clang
x86_64                randconfig-015-20240202   clang
x86_64                randconfig-016-20240202   clang
x86_64                randconfig-071-20240202   gcc  
x86_64                randconfig-072-20240202   clang
x86_64                randconfig-073-20240202   gcc  
x86_64                randconfig-074-20240202   clang
x86_64                randconfig-075-20240202   gcc  
x86_64                randconfig-076-20240202   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240202   gcc  
xtensa                randconfig-002-20240202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


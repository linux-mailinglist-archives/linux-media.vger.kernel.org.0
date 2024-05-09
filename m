Return-Path: <linux-media+bounces-11233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE68C1429
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 19:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FEBC281B98
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 17:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FAA53E06;
	Thu,  9 May 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIGItYUe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01053813
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715276239; cv=none; b=cpAcB4MCyZaktH4vFfwTZaPHOIXiHHes2EPqxcuzXrGmBUnR0GmC5MBCU7zpe3RFT0EREdKh2EV9qqpJ0Eu7O3vnHA7OfcEQMPk6uAwHNdrp/XhVnkD8fS4Fpm8M3cDkMhBTe+hv3XyyNuRkApoBgeU8RCODR+nVWJWKme6k2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715276239; c=relaxed/simple;
	bh=pZt0GtWy6K80Jccvq8yDP1KltzhbvZihDpZK+CMRu4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zye1MkF3GZXc+yIINUwBphwDaamPEHGplnmAnAp8UetNkSb4AeAypQUhlCGEvAGtbBfOv9LlM4Dw99Unvrb77WVDjhRcABniY/JJfu5KcZMzsg94cL/LmvWxlqs5LVuPDQA2gWfnyTpIES6n/u+DAAaMm7jQbq+AR0wnJWtOQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIGItYUe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715276237; x=1746812237;
  h=date:from:to:cc:subject:message-id;
  bh=pZt0GtWy6K80Jccvq8yDP1KltzhbvZihDpZK+CMRu4k=;
  b=SIGItYUe+azdv1yxQD1sAPSq+tftmX95uAfHPHOSJeCSo68iNlPGLILJ
   +D1DTrwQ8zRqe8jq9u3pb4wGMq8c/haJ1E2CPWTqz2G3Zg4JzpLgGFZN9
   cmc/4DKonsbmX8Xnlx+lCl70OVIydhDo4S2jbq43dRBCVS6JT/wUdPeA0
   uMQ0F2H+ak0cTjqT9tqrF43VOgxCQSef7S8t9G8h/P22o+7yqDCjHbcUn
   lPCVz6XO6bClz6AK1ioWf9tQ8qWpQt4iuiDD6uSEA6iZAeNmHsvOFOLkY
   /qDvIiG39A1I1PNk8Bl7DoJCCMd4UEwd6qu3y3pH1RVErM40nvrStqJKE
   Q==;
X-CSE-ConnectionGUID: x1eQOlswQk+m+hwJz6o5Tg==
X-CSE-MsgGUID: cOWUhVKhRYiskzx3MWvwQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11450834"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11450834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 10:37:17 -0700
X-CSE-ConnectionGUID: 0E/IvYuAQgyweRVTxZ34IQ==
X-CSE-MsgGUID: iVwiIbbrSpitc3vS9wPsKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="34178080"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2024 10:37:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s57hh-0005BL-0m;
	Thu, 09 May 2024 17:37:13 +0000
Date: Fri, 10 May 2024 01:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 48259b90973718d2277db27b5e510f0fe957eaa0
Message-ID: <202405100115.rcfjPfkx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: 48259b90973718d2277db27b5e510f0fe957eaa0  media: media: intel/ipu6: Fix spelling mistake "remappinp" -> "remapping"

elapsed time: 1449m

configs tested: 121
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240509   gcc  
arc                   randconfig-002-20240509   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240509   gcc  
arm                   randconfig-002-20240509   clang
arm                   randconfig-003-20240509   clang
arm                   randconfig-004-20240509   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240509   clang
arm64                 randconfig-002-20240509   clang
arm64                 randconfig-003-20240509   gcc  
arm64                 randconfig-004-20240509   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240509   gcc  
csky                  randconfig-002-20240509   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240509   clang
hexagon               randconfig-002-20240509   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240509   gcc  
loongarch             randconfig-002-20240509   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240509   gcc  
nios2                 randconfig-002-20240509   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240509   gcc  
parisc                randconfig-002-20240509   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240509   clang
powerpc               randconfig-002-20240509   clang
powerpc               randconfig-003-20240509   clang
powerpc64             randconfig-001-20240509   clang
powerpc64             randconfig-002-20240509   gcc  
powerpc64             randconfig-003-20240509   clang
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240509   gcc  
riscv                 randconfig-002-20240509   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240509   gcc  
s390                  randconfig-002-20240509   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240509   gcc  
sh                    randconfig-002-20240509   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240509   gcc  
sparc64               randconfig-002-20240509   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240509   clang
um                    randconfig-002-20240509   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240509   gcc  
xtensa                randconfig-002-20240509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


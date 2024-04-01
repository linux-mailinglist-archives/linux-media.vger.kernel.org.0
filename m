Return-Path: <linux-media+bounces-8312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27A89462A
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 22:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DF391C21BA3
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 20:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A28D4E1D5;
	Mon,  1 Apr 2024 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGyxEbvM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E129CFA
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712004278; cv=none; b=QiwBKK2fXpjy1yY9h86cR8S/cbycf2tVcRWnF04Hy7claouwze0HZBGT3pItL+VFsA78CdrYsII+zFBn77/heHpBGs2owxrUZzZLoMaORGh0rVaDtaUv++OhJj2gWK8GTGeyTMk7EufzxeI5gaoskbwajffruwvXWEufWO4mGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712004278; c=relaxed/simple;
	bh=bL4teLe0Hxn4OoZTlllglladhAoyhaDDAizoBUOymoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cg8MF2hTBOfM4RfSEfSTSWCNHvcvu8tpztGx5HtnDFfdQkxIHl4UG2c4YcCqths4T9uE/Zy8S1KD9Q497pAj4W0ZUZAR/y6fnOlv4nyyjDj7gnBFpUa+dsJ2OZHntDo1P5UWjX/ivFru89q17LtSFk/tIzZ3F9R9otnhVF6hbDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGyxEbvM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712004276; x=1743540276;
  h=date:from:to:cc:subject:message-id;
  bh=bL4teLe0Hxn4OoZTlllglladhAoyhaDDAizoBUOymoc=;
  b=oGyxEbvMB2JNDAlkhcWJ3jFvFkKiBBpjnGB6KBCMbMTXC6wbdsrJmMga
   VYH/r33inmQCfewWDCl4gBRbOg5WaQsKbCLg+VoyuASgfENiZLK54qgjO
   puaaAPMSx82j82eYQSpsTaqhgKDY6Sa3ZSvozbespc1yOPPmDR/OHLSHa
   eW0/8RX7BT9wlpipuvHf77/Up21QcPIMTTCAQE+D1h1dj29xhW+h6HtUF
   pzf7mIZ1GSr7hQWr7mr4fK3DINqiSkTiZ+Pbw2OJiMxmisUNp/NoPlX+R
   Al5yx1v3cG5VVdSV4kt4YJTF6PhrLBJg2GP6pw6SYdYJaNvBI3AVKIsTW
   g==;
X-CSE-ConnectionGUID: ky7j941NRHSZfJvn2oJKHg==
X-CSE-MsgGUID: ejqfYRemQUOmEvNVZc/Vqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7336927"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7336927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 13:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="49030027"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 13:44:34 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrOW2-0000bf-2O;
	Mon, 01 Apr 2024 20:44:29 +0000
Date: Tue, 02 Apr 2024 04:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 b82779648dfd3814df4e381f086326ec70fd791f
Message-ID: <202404020430.SSHRpF0q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: b82779648dfd3814df4e381f086326ec70fd791f  Merge tag 'v6.9-rc2' into media_stage

elapsed time: 725m

configs tested: 180
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
arc                   randconfig-001-20240401   gcc  
arc                   randconfig-002-20240401   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          pxa3xx_defconfig   clang
arm                   randconfig-001-20240401   clang
arm                   randconfig-002-20240401   clang
arm                   randconfig-003-20240401   gcc  
arm                   randconfig-004-20240401   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240401   gcc  
arm64                 randconfig-002-20240401   gcc  
arm64                 randconfig-003-20240401   gcc  
arm64                 randconfig-004-20240401   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240401   gcc  
csky                  randconfig-002-20240401   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240401   clang
hexagon               randconfig-002-20240401   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240401   gcc  
i386         buildonly-randconfig-002-20240401   clang
i386         buildonly-randconfig-003-20240401   clang
i386         buildonly-randconfig-004-20240401   gcc  
i386         buildonly-randconfig-005-20240401   gcc  
i386         buildonly-randconfig-006-20240401   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240401   gcc  
i386                  randconfig-002-20240401   gcc  
i386                  randconfig-003-20240401   clang
i386                  randconfig-004-20240401   clang
i386                  randconfig-005-20240401   gcc  
i386                  randconfig-006-20240401   gcc  
i386                  randconfig-011-20240401   clang
i386                  randconfig-012-20240401   clang
i386                  randconfig-013-20240401   gcc  
i386                  randconfig-014-20240401   gcc  
i386                  randconfig-015-20240401   gcc  
i386                  randconfig-016-20240401   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240401   gcc  
loongarch             randconfig-002-20240401   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240401   gcc  
nios2                 randconfig-002-20240401   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240401   gcc  
parisc                randconfig-002-20240401   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                   motionpro_defconfig   clang
powerpc               randconfig-001-20240401   gcc  
powerpc               randconfig-002-20240401   gcc  
powerpc               randconfig-003-20240401   gcc  
powerpc64             randconfig-001-20240401   gcc  
powerpc64             randconfig-002-20240401   clang
powerpc64             randconfig-003-20240401   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240401   clang
riscv                 randconfig-002-20240401   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240401   gcc  
s390                  randconfig-002-20240401   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240401   gcc  
sh                    randconfig-002-20240401   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240401   gcc  
sparc64               randconfig-002-20240401   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240401   gcc  
um                    randconfig-002-20240401   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240401   clang
x86_64       buildonly-randconfig-002-20240401   clang
x86_64       buildonly-randconfig-003-20240401   gcc  
x86_64       buildonly-randconfig-004-20240401   gcc  
x86_64       buildonly-randconfig-005-20240401   gcc  
x86_64       buildonly-randconfig-006-20240401   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240401   gcc  
x86_64                randconfig-002-20240401   clang
x86_64                randconfig-003-20240401   clang
x86_64                randconfig-004-20240401   gcc  
x86_64                randconfig-005-20240401   gcc  
x86_64                randconfig-006-20240401   clang
x86_64                randconfig-011-20240401   clang
x86_64                randconfig-012-20240401   gcc  
x86_64                randconfig-013-20240401   gcc  
x86_64                randconfig-014-20240401   gcc  
x86_64                randconfig-015-20240401   gcc  
x86_64                randconfig-016-20240401   gcc  
x86_64                randconfig-071-20240401   gcc  
x86_64                randconfig-072-20240401   gcc  
x86_64                randconfig-073-20240401   clang
x86_64                randconfig-074-20240401   gcc  
x86_64                randconfig-075-20240401   gcc  
x86_64                randconfig-076-20240401   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240401   gcc  
xtensa                randconfig-002-20240401   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


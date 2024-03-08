Return-Path: <linux-media+bounces-6679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11F875D1B
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 05:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4886282547
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 04:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A582C857;
	Fri,  8 Mar 2024 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SO89EQhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709D2C1A6
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 04:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709871758; cv=none; b=H7s399M6VnIAqb7Vz6xj5ubDCudqpEOKsUKSWcE2GYKTGCEp5jdv2/sAcS/EpmRBsqtalhHagu/99sbIjeFuhL4kzaBdPAUkhsIy49Z30zgrVRJ9BQn8C40+GQp70nVbBR0V+bJKumnOMNponwLFV/+7UZAdtCc9Hy1WQ7Cy508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709871758; c=relaxed/simple;
	bh=TeHS6KFqrJ19ahEPTwz/B36DES7mdOC1gIRz2l+H6Pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dx/FUoS3Y3bJ1BRhTxypgcKrKgoNriXCdX8vqKrfgb2lfhH3wpibzpeGIRk6ZTh9DGVS2cdfm7aqSuIkS6xNzDbZ0q3AlYJshms4UA9h5BliRiIRFFeMOYSbpVaRRBgdsXLW2dQdjMa6aCpeeVNj7ucX33zKou1XgNz5ON6mW9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SO89EQhS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709871756; x=1741407756;
  h=date:from:to:cc:subject:message-id;
  bh=TeHS6KFqrJ19ahEPTwz/B36DES7mdOC1gIRz2l+H6Pw=;
  b=SO89EQhSje0/am67WbNZkTG74NLAKPHz96rP/eXJZlY9q+PNXoQeHFmR
   NzCf9v9d7Na0Ia1747xjD/uE+U8lCbBGX6Ya5NKJb6c/A/kXDZdA/k/jE
   FVUmcASLBNbDn3VyNJM4Hahqq6zG25H7WlKGB+CGy3fQjk2innxxNWFmE
   MIqSwrSoyH82NsBmdSJHf9vZ2AOPb8b2Q88Lr6GuGtXwj4+AbnVRc5hAL
   sTc0/8yy/f3GOp7Xp/uMHOJ6cEiF5zVSyOrY/PQCgk806NU7KY1erEeQh
   zLQsl8FiCGQseCbzJ3375J6bxdqBQB+ZUYirqhX1NH0SBd0k0CEDvUeRg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27052353"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="27052353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 20:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10390029"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2024 20:22:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riRke-00061N-00;
	Fri, 08 Mar 2024 04:22:32 +0000
Date: Fri, 08 Mar 2024 12:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:master] BUILD SUCCESS
 b14257abe7057def6127f6fb2f14f9adc8acabdb
Message-ID: <202403081246.dpi9R94C-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media_stage.git master
branch HEAD: b14257abe7057def6127f6fb2f14f9adc8acabdb  media: rcar-isp: Disallow unbind of devices

elapsed time: 748m

configs tested: 113
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
arc                   randconfig-001-20240308   gcc  
arc                   randconfig-002-20240308   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240308   gcc  
arm                   randconfig-002-20240308   clang
arm                   randconfig-003-20240308   clang
arm                   randconfig-004-20240308   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240308   clang
arm64                 randconfig-002-20240308   clang
arm64                 randconfig-003-20240308   clang
arm64                 randconfig-004-20240308   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240308   gcc  
csky                  randconfig-002-20240308   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240308   clang
i386         buildonly-randconfig-002-20240308   clang
i386         buildonly-randconfig-003-20240308   gcc  
i386         buildonly-randconfig-004-20240308   gcc  
i386         buildonly-randconfig-005-20240308   gcc  
i386         buildonly-randconfig-006-20240308   clang
i386                                defconfig   clang
i386                  randconfig-001-20240308   clang
i386                  randconfig-002-20240308   clang
i386                  randconfig-003-20240308   clang
i386                  randconfig-004-20240308   gcc  
i386                  randconfig-005-20240308   clang
i386                  randconfig-006-20240308   clang
i386                  randconfig-011-20240308   gcc  
i386                  randconfig-012-20240308   clang
i386                  randconfig-013-20240308   clang
i386                  randconfig-014-20240308   clang
i386                  randconfig-015-20240308   gcc  
i386                  randconfig-016-20240308   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


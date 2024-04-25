Return-Path: <linux-media+bounces-10111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD68B2049
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 13:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE0F1F24553
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3320012AACB;
	Thu, 25 Apr 2024 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfv0+VHf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491A83CCD
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044658; cv=none; b=EnJEeJ/WMX7boPN8YQOmLdGuFlimXm29cdT/Bp50mhaQ1Ght6DdRAYMKTmzP6KH4S5+0ChBBl0cdJeg3GE3PaEvA63xnByZ/bn5hJwaLZum+kelrKFbD1cZUKuz1+QUa/64ntEnaM7cHkM/MHGBwtlcS1pkqoO6RfT8wi9b/1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044658; c=relaxed/simple;
	bh=/eNmlB67cf6UaonY6y+rgG8UxO3TNcFKilG5c1PH/XI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mD0heztQ4b9mJWY6htqzXHlm4L+weaDeOWvjzA1sPoPnbR9s+GTJu2PeRrVVTd6RsIXDBaoNjb18gRJ67KjlfhM8li8lNFRUxHZMKQsKUx4kidTd6WRJwyr396VVFTtIUW77L9B+b6q+knBwQioGNyS64b/3T+wapSsZupUPiVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfv0+VHf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714044657; x=1745580657;
  h=date:from:to:cc:subject:message-id;
  bh=/eNmlB67cf6UaonY6y+rgG8UxO3TNcFKilG5c1PH/XI=;
  b=gfv0+VHfSatiDKVSehngDXf/knzWz0r87wF6CF9ckNZ0YZJ4W5zFbrzY
   grqqAkLYec/LHKjob9fTiB4S7r8HiJZn9oA0gl20H63KHWobBJRY5mhM4
   BkjBV0DpY7I384UNGuENxDI5yp8HXTZhmzSwh/Wfrm+LDqb8d9h3QL41z
   LTxRJ5Hnox67ZcUMG+Fh3Tvcnb57A3bk8cM491WlrNl4bdj6gtYCGqPHQ
   hYa+ToXQcfAaMpbN0Xbi0HniuBncMrTjbIfZXRHdt4aOQDdGsnKPiJhMg
   luMnSkntEPAHUPYvb3HnsA/9/QB4ENmkML6nssm/3RIltjPtr3F7rUm53
   A==;
X-CSE-ConnectionGUID: v2ZAxrzFSa+ywp9M7DXKWA==
X-CSE-MsgGUID: 8GeNA+2yTEOGdsW8CI6sSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13556650"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="13556650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:30:56 -0700
X-CSE-ConnectionGUID: x3gINat6QX2bKgCdymDasQ==
X-CSE-MsgGUID: KZzM6HeOSqaynOCm+hkElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="24990340"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Apr 2024 04:30:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzxJU-0002J6-2z;
	Thu, 25 Apr 2024 11:30:52 +0000
Date: Thu, 25 Apr 2024 19:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 fa7e12cd22ea562deeb7bb60a4e31893b0507353
Message-ID: <202404251957.bYI4TJPk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: fa7e12cd22ea562deeb7bb60a4e31893b0507353  HACK: ov2740: disable runtime PM

elapsed time: 1459m

configs tested: 89
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240425   gcc  
i386         buildonly-randconfig-003-20240425   gcc  
i386         buildonly-randconfig-006-20240425   gcc  
i386                  randconfig-004-20240425   gcc  
i386                  randconfig-013-20240425   gcc  
i386                  randconfig-014-20240425   gcc  
i386                  randconfig-015-20240425   gcc  
i386                  randconfig-016-20240425   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
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
sparc                            allyesconfig   gcc  
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
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


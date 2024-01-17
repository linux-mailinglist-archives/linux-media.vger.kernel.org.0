Return-Path: <linux-media+bounces-3778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959482FF70
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 04:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711C81C237F6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 03:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C3546B5;
	Wed, 17 Jan 2024 03:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8f/HfjN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8AE79C2
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 03:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705463866; cv=none; b=iiEvkvegK+F9hVG/aMRuutmqqJlmaP9Oy26RTWVB1/e6V3JO3MM+NWql5nEmktnIQZJWm7DzHyo21Zr3/ZpSuwL+g8/BQ7Y5kojBlUyqjVaKEWECrSlqLpYWjwEVoH91jGQcpmipcEY+iUBVtTEBhNdd6sDZ96FdrjTON9hKufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705463866; c=relaxed/simple;
	bh=QWh6E0x7IiKaHu242rtRyJ7I7IVtLb3j4f9CLAFm9/Y=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:User-Agent; b=VPxb5egcN2kgcPDrSYFGI6gMepBBiFhThnvVMbmr98kb2f8rGA0JYzVKhZHBUByID6Aph9wa5zW5O1VG56Drv5nKFkuJwO6ZkpTUNlal1Y+0crvl3ZnYPTMIsXRs/+yUGsw0o0L/sW4S+pho28/xQC6QYR99FhJRs3UV7S6aiR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8f/HfjN; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705463864; x=1736999864;
  h=date:from:to:cc:subject:message-id;
  bh=QWh6E0x7IiKaHu242rtRyJ7I7IVtLb3j4f9CLAFm9/Y=;
  b=M8f/HfjNVYtdIKO3mFlFZolIOvFF/9GDVXMf/jRmzxLqE/GvIifgAAMw
   SusfRA6vpMxJLvW9lhtvtygRufiXa+MWtRCLhBJ/d5C1v4mX+MkSQV7kw
   JT4vZ0SiZdmKsUXKodOFe2ojaB+T9LeXsbCqP57+w19cGFbMLFAkK7q/g
   7WhIDh2V9+s+5wYdX/zsm1tjlxqU7FiotKnOrVtbTrRXcYRuZXBuvzZPR
   pZBMBxwf9GtJkdbKsFH9f950guh+uuHyWtzTxsLRoexX7Jasq6HvcQiS+
   tO/6OxCy5ovYuGPxS8v/djBDzP22+hqdDM9rO91XDe3hHH+3SfJJi2wK1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431225634"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="431225634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874695255"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874695255"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2024 19:57:42 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPx3c-0001Yh-2c;
	Wed, 17 Jan 2024 03:57:40 +0000
Date: Wed, 17 Jan 2024 11:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 7892dc0c76ffb3fe382164a3c69cd0cecb5bc281
Message-ID: <202401171102.Lwc8BJHw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 7892dc0c76ffb3fe382164a3c69cd0cecb5bc281  media: ov2740: Add support for embedded data

elapsed time: 2326m

configs tested: 96
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240117   gcc  
arc                   randconfig-002-20240117   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                            mmp2_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20240117   gcc  
arm                   randconfig-002-20240117   gcc  
arm                   randconfig-003-20240117   gcc  
arm                   randconfig-004-20240117   gcc  
arm64                             allnoconfig   gcc  
arm64                 randconfig-001-20240117   gcc  
arm64                 randconfig-002-20240117   gcc  
arm64                 randconfig-003-20240117   gcc  
arm64                 randconfig-004-20240117   gcc  
csky                  randconfig-001-20240117   gcc  
csky                  randconfig-002-20240117   gcc  
hexagon               randconfig-001-20240117   clang
hexagon               randconfig-002-20240117   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240116   clang
i386         buildonly-randconfig-002-20240116   clang
i386         buildonly-randconfig-003-20240116   clang
i386         buildonly-randconfig-004-20240116   clang
i386         buildonly-randconfig-005-20240116   clang
i386         buildonly-randconfig-006-20240116   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240116   clang
i386                  randconfig-002-20240116   clang
i386                  randconfig-003-20240116   clang
i386                  randconfig-004-20240116   clang
i386                  randconfig-005-20240116   clang
i386                  randconfig-006-20240116   clang
i386                  randconfig-011-20240116   gcc  
i386                  randconfig-012-20240116   gcc  
i386                  randconfig-013-20240116   gcc  
i386                  randconfig-014-20240116   gcc  
i386                  randconfig-015-20240116   gcc  
i386                  randconfig-016-20240116   gcc  
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240117   gcc  
loongarch             randconfig-002-20240117   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                         rt305x_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                 randconfig-001-20240117   gcc  
nios2                 randconfig-002-20240117   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240117   gcc  
parisc                randconfig-002-20240117   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc               randconfig-001-20240117   gcc  
powerpc               randconfig-002-20240117   gcc  
powerpc               randconfig-003-20240117   gcc  
powerpc64             randconfig-001-20240117   gcc  
powerpc64             randconfig-002-20240117   gcc  
powerpc64             randconfig-003-20240117   gcc  
riscv                 randconfig-001-20240117   gcc  
riscv                 randconfig-002-20240117   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240117   gcc  
x86_64       buildonly-randconfig-002-20240117   gcc  
x86_64       buildonly-randconfig-003-20240117   gcc  
x86_64       buildonly-randconfig-004-20240117   gcc  
x86_64       buildonly-randconfig-005-20240117   gcc  
x86_64       buildonly-randconfig-006-20240117   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240117   clang
x86_64                randconfig-002-20240117   clang
x86_64                randconfig-003-20240117   clang
x86_64                randconfig-004-20240117   clang
x86_64                randconfig-005-20240117   clang
x86_64                randconfig-006-20240117   clang
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


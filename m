Return-Path: <linux-media+bounces-23414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815339F1DC8
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 10:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3E9188BD1F
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F5F156F5D;
	Sat, 14 Dec 2024 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMWv84/h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED071126C10
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734167978; cv=none; b=AGFjBcDZNqFCp4+G0fO1qZlnfKdvmyQFr1MunBJtdjD2LhDSiYCfMr3ToxMKRDpCGSa5iuE1zvuloQCxYNy6O8729zDj9OJq1QjJgVtj4Tndd6oZangfSUIn2am13dZzt+T+sQYlO4t8ue/fQTMJWRzdfu654T/2DiiF0aGbOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734167978; c=relaxed/simple;
	bh=FelKpAqazDSo4ziWK6aVOR6ofqd/qzfGb2IWjvCpYec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdcrD8WiH6nXsCcT2KW80Y95VJ1W94C1oCjiJBabLesfuKX5YyJCsnNK/ui06LMZ8Qc+Qh/WgDFNbaciqUfeReYHYz/8KEuumygoRBHNmUqGExW0iuKDEygHYOiJ+SH5XMgsAjkOmOrqwQdPyomKMTZAqhxepygW4Cf2hZHMLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMWv84/h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734167976; x=1765703976;
  h=date:from:to:cc:subject:message-id;
  bh=FelKpAqazDSo4ziWK6aVOR6ofqd/qzfGb2IWjvCpYec=;
  b=DMWv84/h9erucyzyVAEsEZjG5GLVT6WO0QMtdSz0HMU6O7CZCzsnX6qN
   pdMB7Uo5it7OBq80xtFPYmNDekRaXBbfMtUsU9sIZ0eebhIfI1APQwD7k
   rPLm4Lg+jgUj0ZEFgXwL6/oDe4G8lAmuRLA0Yl+I1p6fku2/7dPuh7RO6
   Id6+jrMAuGZkrV74z3rOlVDPiftNYv4L7WOVsI7g+WHiy5m2O+hK0roGH
   4H5vlYqMFzd+QNujFCHuZlmmbDuT/On/Gielv9Y52XIYkFvvpPTewJJqM
   R2kheXrMbI+97DGSyOqvvEqi+C941GAy/g3BY/jNDpHHInY80xAWdlT5g
   A==;
X-CSE-ConnectionGUID: +yMsxiUXQE28aSKBIEYU/g==
X-CSE-MsgGUID: rVNDY6skQXSaGAF/tsVKUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45309069"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="45309069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 01:19:35 -0800
X-CSE-ConnectionGUID: 6E9x/911RQ2PRpdnzja6pQ==
X-CSE-MsgGUID: XGDamkrfRYeAxSaWexJDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127749906"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2024 01:19:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMOJA-000CoN-1F;
	Sat, 14 Dec 2024 09:19:32 +0000
Date: Sat, 14 Dec 2024 17:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:fixes] BUILD SUCCESS
 63ee8b754dacd06290b7be1c6826c389ed4e2d3d
Message-ID: <202412141731.BRM0tlTY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git fixes
branch HEAD: 63ee8b754dacd06290b7be1c6826c389ed4e2d3d  media: intel/ipu6: remove cpu latency qos request on error

elapsed time: 1455m

configs tested: 78
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                      aspeed_g5_defconfig    gcc-14.2.0
arm                       keystone_defconfig    gcc-14.2.0
arm                        nhk8815_defconfig    clang-20
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386                             allnoconfig    gcc-12
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
m68k                      m5208evb_defconfig    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                simple_smp_defconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                    kmeter1_defconfig    gcc-14.2.0
powerpc                linkstation_defconfig    clang-20
powerpc                    mpc5200_defconfig    clang-20
powerpc                mpc836x_rdk_defconfig    clang-18
powerpc                 mpc866_ads_defconfig    clang-20
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


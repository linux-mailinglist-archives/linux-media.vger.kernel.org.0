Return-Path: <linux-media+bounces-4228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DB83DF1D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 17:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 954B41C21B49
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 16:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CB11DFF7;
	Fri, 26 Jan 2024 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn/1UGuj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA8E1DFED
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706287613; cv=none; b=e9812+vhHJjMtP57FytiI+M1pf4/g9SDysiYK/3FV7SBNvR4F9VxsFfDXfmeCKJUlyT++BN8eRwKb8/inzGTjJBLUGUKXw4GKYKpNe0QOVMyq1GwSeZ4wpTjgKyFsSMgnOK1aulp1Bhweb3MKZJH/qTElAxQMXdty0gdMhmFMcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706287613; c=relaxed/simple;
	bh=O2+H5QiX8xNJAjI8ZP4mGIDGiGVYyuA51fEf5ukYN+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PuJWRcLyPc/UCtgreorP31ignUvdNr6iEGPIyJ5WVs8FblwjdMYqEtpWVbityGbz71czV2vWGFcR2fKvsuwom2bqmWexdJtQJAxY7CeSXn54Hy1b3CzlfE0T+ENdIuhS1cbHkrrV3aAqttvFfkLf6DnEPDpkUuCmHL1jO5bRrUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn/1UGuj; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706287611; x=1737823611;
  h=date:from:to:cc:subject:message-id;
  bh=O2+H5QiX8xNJAjI8ZP4mGIDGiGVYyuA51fEf5ukYN+0=;
  b=cn/1UGuj7nU5AKskHTcPTzw2TTNLBK9bXX9eNbkQnGk6LzxDC0A7Jwuh
   Yk4f3AvRa54X+VNff+yvdUGIh4zc2FXdwmtwDwAGq+EJVYArR1YAM6x4u
   ghlpqJX32nu9GCUsCG8L4U0MV+nLgsxo6ZM5kUOP4mY5HQ1yUe9wuhSTT
   b83FPinnuYuFuuvJHpx2/9nDo9B0O4bZkrx3pkaIabX0ll6AoFzxf3U++
   iTS+Rlmnl5ghjLrwiRvuVEXTu353noDdk1QJ/l1IrKbfkgeEL0ZjMVsLg
   C5hpQEZlUOMVOwdVGn7B0kQer5BrT578xDQXudAEbgot5D9GJwA2hYjuq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="433667395"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="433667395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 08:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2804721"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2024 08:46:50 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTPLr-0001CQ-0P;
	Fri, 26 Jan 2024 16:46:47 +0000
Date: Sat, 27 Jan 2024 00:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD REGRESSION
 f76be7216c3df5f563353bd7a6aaf5076b118943
Message-ID: <202401270005.IgqUK1sI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: f76be7216c3df5f563353bd7a6aaf5076b118943  media: ov08x40: Reduce start streaming time

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401261628.dWEtdXLE-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift' in 'struct ov08x40_mode'

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- i386-randconfig-003-20240126
    `-- drivers-media-i2c-ov08x40.c:error:no-member-named-exposure_shift-in-struct-ov08x40_mode

elapsed time: 1476m

configs tested: 38
configs skipped: 1

tested configs:
i386         buildonly-randconfig-001-20240126   clang
i386         buildonly-randconfig-002-20240126   clang
i386         buildonly-randconfig-003-20240126   clang
i386         buildonly-randconfig-004-20240126   clang
i386         buildonly-randconfig-005-20240126   clang
i386         buildonly-randconfig-006-20240126   clang
i386                  randconfig-001-20240126   clang
i386                  randconfig-002-20240126   clang
i386                  randconfig-003-20240126   clang
i386                  randconfig-004-20240126   clang
i386                  randconfig-005-20240126   clang
i386                  randconfig-006-20240126   clang
i386                  randconfig-011-20240126   gcc  
i386                  randconfig-012-20240126   gcc  
i386                  randconfig-013-20240126   gcc  
i386                  randconfig-014-20240126   gcc  
i386                  randconfig-015-20240126   gcc  
i386                  randconfig-016-20240126   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


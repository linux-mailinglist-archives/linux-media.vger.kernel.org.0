Return-Path: <linux-media+bounces-9885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B118AD6C6
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 23:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F602284681
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 21:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624581CF96;
	Mon, 22 Apr 2024 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+7E0+BG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E31CD2E
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713823125; cv=none; b=DhYVHls8f5C/8/TvC+hjyNC+4dRHV3pXD7qcTU0GAUqNieYB7DnLMvJKhBKAcT76Zasej5fvW36NwUSsnDACfgoUorShrlUCQXzY2Q89S12tHwxOhzUSQMpovDTsZh/lT0JZHC//idy/d0/cZOzPauhi/vKlQJdQVw1OQzSuFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713823125; c=relaxed/simple;
	bh=Uwfe3D7YngPsSB0qXL4rEzg2B6ndb8XKgo3gQRnDK9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KIE8aQlhXR0WFWCGqgjuzk8HaAth8NJaEEU8BjY4hFffWGTr4+EGO9nF1cybphw7bTVhZRTySwTx+Rm+wLUCxLvrJwf8pUBFpZVx2FQ09erusfZQ/qd5XNQwyYiq3IymMFRRvpQ8/KKs4UWADrsUP/qH8Bq1I2+zzGHv0nec9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+7E0+BG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713823124; x=1745359124;
  h=date:from:to:cc:subject:message-id;
  bh=Uwfe3D7YngPsSB0qXL4rEzg2B6ndb8XKgo3gQRnDK9U=;
  b=T+7E0+BGUrHMJP4AM0NlGLwLMZGZ9eaBmKnHxuwLJMFgDy5OVT59eFAg
   81kQsZ52IikFFp2IH+uwmg+APrxJ0UDTHj2+5+4tNp5oB596X4e/Uv8ho
   5OQ8CtPQ3x7mTltPCTVftLNM6L3kT3ZfG8t6j9i7EXlbX/skpCG+9bNKe
   HwActPy6khOk2EZ8iAnfb91qdLwDdJOUHpa/cEQgGb+1nrvBsEK8roy1d
   9vQdLKV6t64nwR6USYDj05GgNP1jxTnxf7IxTu0HaE887hW8OJvYhBWM+
   /ZcXAqwQP6nxuPoPAm9+5uAGb1OZcslQDmlNPwi/njzcwvKWHbNUOTrVb
   w==;
X-CSE-ConnectionGUID: 1E9IDbeVTVmGzAdn1pQ+Gg==
X-CSE-MsgGUID: uAR174l4Rh+1y8eL0hQAWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26900980"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="26900980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 14:58:43 -0700
X-CSE-ConnectionGUID: CZVdFOyHQxiRHk5ScVvhxQ==
X-CSE-MsgGUID: 5TD6FY2xQyOzRAOHZ5mVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="24769213"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2024 14:58:42 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz1gN-0000Gq-1z;
	Mon, 22 Apr 2024 21:58:39 +0000
Date: Tue, 23 Apr 2024 05:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 af24845bf3881bb471580558ca811e0f6a44ecda
Message-ID: <202404230510.Hu9cawoJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: af24845bf3881bb471580558ca811e0f6a44ecda  media: hi556: Add support for avdd regulator

elapsed time: 731m

configs tested: 132
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
arc                   randconfig-001-20240423   gcc  
arc                   randconfig-002-20240423   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240423   clang
arm                   randconfig-002-20240423   clang
arm                   randconfig-003-20240423   clang
arm                   randconfig-004-20240423   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240423   gcc  
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
i386         buildonly-randconfig-001-20240422   clang
i386         buildonly-randconfig-002-20240422   gcc  
i386         buildonly-randconfig-003-20240422   clang
i386         buildonly-randconfig-004-20240422   gcc  
i386         buildonly-randconfig-005-20240422   gcc  
i386         buildonly-randconfig-006-20240422   clang
i386                                defconfig   clang
i386                  randconfig-001-20240422   clang
i386                  randconfig-002-20240422   clang
i386                  randconfig-003-20240422   gcc  
i386                  randconfig-004-20240422   clang
i386                  randconfig-005-20240422   gcc  
i386                  randconfig-006-20240422   gcc  
i386                  randconfig-011-20240422   clang
i386                  randconfig-012-20240422   clang
i386                  randconfig-013-20240422   clang
i386                  randconfig-014-20240422   clang
i386                  randconfig-015-20240422   clang
i386                  randconfig-016-20240422   gcc  
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
x86_64       buildonly-randconfig-001-20240422   clang
x86_64       buildonly-randconfig-002-20240422   gcc  
x86_64       buildonly-randconfig-003-20240422   gcc  
x86_64       buildonly-randconfig-004-20240422   clang
x86_64       buildonly-randconfig-005-20240422   gcc  
x86_64       buildonly-randconfig-006-20240422   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240422   clang
x86_64                randconfig-002-20240422   gcc  
x86_64                randconfig-003-20240422   clang
x86_64                randconfig-004-20240422   gcc  
x86_64                randconfig-005-20240422   gcc  
x86_64                randconfig-006-20240422   clang
x86_64                randconfig-011-20240422   gcc  
x86_64                randconfig-012-20240422   clang
x86_64                randconfig-013-20240422   gcc  
x86_64                randconfig-014-20240422   clang
x86_64                randconfig-015-20240422   gcc  
x86_64                randconfig-016-20240422   gcc  
x86_64                randconfig-071-20240422   clang
x86_64                randconfig-072-20240422   gcc  
x86_64                randconfig-073-20240422   gcc  
x86_64                randconfig-074-20240422   gcc  
x86_64                randconfig-075-20240422   gcc  
x86_64                randconfig-076-20240422   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


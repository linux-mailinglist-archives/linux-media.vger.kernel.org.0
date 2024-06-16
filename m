Return-Path: <linux-media+bounces-13314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 154FF909BE5
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 08:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A454B2323E
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 06:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A3216D330;
	Sun, 16 Jun 2024 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBCwk3G5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB07A48
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718519068; cv=none; b=vE77S7xOFSUwgG4rwYP9AnMzUW9ODwmm36qRkt8aWrdUhnEgz24x7YKFuPOXd4fJdE4jRM7msbP63tbmjGlIEKwQcJ2CHKTvr6vx2P+tyMPRwqjEKMODz/ScuyA8xuA8objT9bjafdCa9yNGOn6E5m4unOObz8DqjWTL/COml0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718519068; c=relaxed/simple;
	bh=42Frc+dxH0phLsXFEEuFmmTXnh3BEaW1GdIFY7GVRrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FtOOJzMmzXfwUo06bwjKayKedFPqPX+QxwxaEU0KR6YXXk89eukamovA5xGrrE2K6lSzlj7NnAUvDe/IMgTBR4q1ZYHWd/OBW9WpOFR49tYghYRtc8lodcY83ucuTWFvG5smCzoM8s9WcCq7ir6VxfNFGF/eHMBAswHB+rvFJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBCwk3G5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718519066; x=1750055066;
  h=date:from:to:cc:subject:message-id;
  bh=42Frc+dxH0phLsXFEEuFmmTXnh3BEaW1GdIFY7GVRrs=;
  b=hBCwk3G5jxFR4IJQXh2Mt20aLJSC0Qt+lMzFIqhIHxsDbzJXebk7zXdd
   KkSv0cY/S2/jhWDvZplU+TDs91QY89hRazKFgd0mnF6xWmHyLYYXNs6JC
   2vIX95wAC/olEvZHpqPqrcH4tAbF5PmB+cKA62eyTyzTSGfWeBb5qRt/x
   fdQYa2oaDimsZ76VANAt4aXkNeFJOegPqdgVb/WY8d+EelLxwFoj6juJf
   2n9oJZyZeKHMERp6mZiEWkL03BMgSoGJD/UNyiy8XpZlbsuU6mOfrEsuz
   nfpx5g+zsyEbBhniB5FdSQ2tTyExfHXDctKWNs9u7irEDGz2L8PfMBYuO
   g==;
X-CSE-ConnectionGUID: vs8aWOOvSFWG6INwBphX6g==
X-CSE-MsgGUID: S1KQ9Qz2QRSvAmofz87CDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15146374"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15146374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 23:24:26 -0700
X-CSE-ConnectionGUID: QAd05asPSMi5i68+QQmP0w==
X-CSE-MsgGUID: rUz3pc3fQL2Dg1ZtBtPGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41580268"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 23:24:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIjJO-00018S-2n;
	Sun, 16 Jun 2024 06:24:22 +0000
Date: Sun, 16 Jun 2024 14:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 76694bf770818c6823f9d2fb07aae6038626a279
Message-ID: <202406161432.PR3rv6N2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 76694bf770818c6823f9d2fb07aae6038626a279  media: v4l: add missing MODULE_DESCRIPTION() macros

elapsed time: 2166m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240615   gcc-13.2.0
arc                   randconfig-002-20240615   gcc-13.2.0
arm                   randconfig-001-20240615   clang-19
arm                   randconfig-002-20240615   clang-19
arm                   randconfig-003-20240615   gcc-13.2.0
arm                   randconfig-004-20240615   gcc-13.2.0
arm64                 randconfig-001-20240615   clang-19
arm64                 randconfig-002-20240615   gcc-13.2.0
arm64                 randconfig-003-20240615   clang-17
arm64                 randconfig-004-20240615   gcc-13.2.0
csky                  randconfig-001-20240615   gcc-13.2.0
csky                  randconfig-002-20240615   gcc-13.2.0
hexagon               randconfig-001-20240615   clang-19
hexagon               randconfig-002-20240615   clang-19
i386         buildonly-randconfig-001-20240615   clang-18
i386         buildonly-randconfig-002-20240615   gcc-9
i386         buildonly-randconfig-003-20240615   gcc-7
i386         buildonly-randconfig-004-20240615   clang-18
i386         buildonly-randconfig-005-20240615   clang-18
i386         buildonly-randconfig-006-20240615   gcc-13
i386                  randconfig-001-20240615   clang-18
i386                  randconfig-002-20240615   gcc-13
i386                  randconfig-003-20240615   clang-18
i386                  randconfig-004-20240615   clang-18
i386                  randconfig-005-20240615   clang-18
i386                  randconfig-006-20240615   clang-18
i386                  randconfig-011-20240615   clang-18
i386                  randconfig-012-20240615   gcc-12
i386                  randconfig-013-20240615   gcc-13
i386                  randconfig-014-20240615   clang-18
i386                  randconfig-015-20240615   clang-18
i386                  randconfig-016-20240615   gcc-13
loongarch             randconfig-001-20240615   gcc-13.2.0
loongarch             randconfig-002-20240615   gcc-13.2.0
nios2                 randconfig-001-20240615   gcc-13.2.0
nios2                 randconfig-002-20240615   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240615   gcc-13.2.0
parisc                randconfig-002-20240615   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240615   clang-19
powerpc               randconfig-002-20240615   clang-19
powerpc               randconfig-003-20240615   clang-19
powerpc64             randconfig-001-20240615   clang-19
powerpc64             randconfig-002-20240615   clang-19
powerpc64             randconfig-003-20240615   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240615   clang-19
riscv                 randconfig-002-20240615   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240615   clang-16
s390                  randconfig-002-20240615   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240615   gcc-13.2.0
sh                    randconfig-002-20240615   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240615   gcc-13.2.0
sparc64               randconfig-002-20240615   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240615   gcc-7
um                    randconfig-002-20240615   gcc-11
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240615   gcc-9
x86_64       buildonly-randconfig-002-20240615   clang-18
x86_64       buildonly-randconfig-003-20240615   clang-18
x86_64       buildonly-randconfig-004-20240615   clang-18
x86_64       buildonly-randconfig-005-20240615   gcc-9
x86_64       buildonly-randconfig-006-20240615   clang-18
x86_64                randconfig-001-20240615   gcc-13
x86_64                randconfig-002-20240615   gcc-8
x86_64                randconfig-003-20240615   gcc-13
x86_64                randconfig-004-20240615   gcc-13
x86_64                randconfig-005-20240615   gcc-13
x86_64                randconfig-006-20240615   gcc-8
x86_64                randconfig-011-20240615   clang-18
x86_64                randconfig-012-20240615   gcc-13
x86_64                randconfig-013-20240615   clang-18
x86_64                randconfig-014-20240615   clang-18
x86_64                randconfig-015-20240615   clang-18
x86_64                randconfig-016-20240615   clang-18
x86_64                randconfig-071-20240615   clang-18
x86_64                randconfig-072-20240615   clang-18
x86_64                randconfig-073-20240615   gcc-7
x86_64                randconfig-074-20240615   gcc-13
x86_64                randconfig-075-20240615   clang-18
x86_64                randconfig-076-20240615   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240615   gcc-13.2.0
xtensa                randconfig-002-20240615   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


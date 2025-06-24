Return-Path: <linux-media+bounces-35766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE61AE63C2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 13:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC7537ABBF8
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 11:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9B71F3B9E;
	Tue, 24 Jun 2025 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAho+/LK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0128B7EC
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765335; cv=none; b=hMNp48J2Uj0k0j13zQNt1zDFwdxqmT7LWklAOwJ/oR2wuq0sqzhjD7CKNDlHtKcj4/M9nGU9z3KTcaqkXDwsRsqB1nwKlrW7bmUhvWlCkGbTBXek0NdJ+FnJZ3Eprv1s7IJr5GGiLVTMoITPiO1ORc6GN7PVHWEM4xGn23EU2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765335; c=relaxed/simple;
	bh=vOxgmMCT0+HTuUlp2kLQpYEF1HowZHBypF6p6TdtDFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=goZMdqwRN4PsWq2z9Kyye/r3OOkqmaZyONcyFgO5+FmxrHt/sblxpJQY56mIGVprflsMjb85ppeSukO1E0IjW2PEwk1m98JsmSCUCktwBIiQTYeHH9rA9uaZfrZHEgPnpeWWSvUWClMh+GuqoETu9SQBEFZzNewzzyMum8JOjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAho+/LK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750765333; x=1782301333;
  h=date:from:to:cc:subject:message-id;
  bh=vOxgmMCT0+HTuUlp2kLQpYEF1HowZHBypF6p6TdtDFg=;
  b=fAho+/LK92YKtODbdJ2YdNnh+EGKSa4GmG2kCaAyLM+696Z1liVQZQoI
   9P+0W0PmNGnW48MRlt3CE16fRkaRqDFgzgMtAjYtmVG6+s9rtaxpZAnR6
   R068a1J16y5ZO/4jlKLIwyIuyuCv0EdP/T4Sr0AjA/TqHZuEdkc2KKVsq
   6g/OJzka0bXmvew1CBzQNggk7Us9N7Ol0O42R0SA9elLV1QgiydOiF+4K
   AkPVXHIEbjRXistxc4dKApFr9I//uEorgrSkshJhFiA5uGAysvElZHuBT
   bNkwkuamB2Zox6VQU0qcT+e+7I0zSYqHH60hS/qrYLQqJaZ3AZ4y0j7Xc
   Q==;
X-CSE-ConnectionGUID: 90mvXKw8RI26403q4l6J7A==
X-CSE-MsgGUID: JN/LkhvnRtCUPUuW6y3Hzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70570145"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="70570145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:42:12 -0700
X-CSE-ConnectionGUID: Sug14cZMT1CUgVk23pxC5w==
X-CSE-MsgGUID: eHiZiJajT3CIZwUQD53zpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157660983"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2025 04:42:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU22S-000S4I-26;
	Tue, 24 Jun 2025 11:42:08 +0000
Date: Tue, 24 Jun 2025 19:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS WITH WARNING
 c0b1da281d84d33281fc49289f0c7f8aada450ff
Message-ID: <202506241905.bUCZ5iAK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c0b1da281d84d33281fc49289f0c7f8aada450ff  media: rc: ir-spi: avoid overflow in multiplication

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com

    drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- alpha-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-001-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arc-randconfig-002-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-001-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-002-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-003-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm-randconfig-004-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-001-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-002-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- arm64-randconfig-004-20250623
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- csky-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- hexagon-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-001-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-002-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-003-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-004-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-005-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- i386-buildonly-randconfig-006-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- loongarch-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- m68k-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- microblaze-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- mips-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- nios2-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- openrisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- parisc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- powerpc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- riscv-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- s390-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sh-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- sparc-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allmodconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allnoconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- um-allyesconfig
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-001-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-002-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-003-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-004-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-005-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
|-- x86_64-buildonly-randconfig-006-20250624
|   `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing
`-- xtensa-allnoconfig
    `-- drivers-media-platform-renesas-vsp1-vsp1_vspx.c:warning:EXPORT_SYMBOL()-is-used-but-include-linux-export.h-is-missing

elapsed time: 1410m

configs tested: 108
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250623    gcc-10.5.0
arc                   randconfig-001-20250624    gcc-8.5.0
arc                   randconfig-002-20250623    gcc-8.5.0
arc                   randconfig-002-20250624    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250623    gcc-10.5.0
arm                   randconfig-001-20250624    gcc-8.5.0
arm                   randconfig-002-20250623    clang-21
arm                   randconfig-002-20250624    gcc-8.5.0
arm                   randconfig-003-20250623    gcc-8.5.0
arm                   randconfig-003-20250624    gcc-8.5.0
arm                   randconfig-004-20250623    gcc-10.5.0
arm                   randconfig-004-20250624    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250623    gcc-14.3.0
arm64                 randconfig-001-20250624    gcc-8.5.0
arm64                 randconfig-002-20250623    gcc-14.3.0
arm64                 randconfig-002-20250624    gcc-8.5.0
arm64                 randconfig-003-20250623    gcc-9.5.0
arm64                 randconfig-003-20250624    gcc-8.5.0
arm64                 randconfig-004-20250623    clang-16
arm64                 randconfig-004-20250624    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250624    clang-20
i386        buildonly-randconfig-001-20250624    gcc-12
i386        buildonly-randconfig-002-20250624    gcc-12
i386        buildonly-randconfig-003-20250624    clang-20
i386        buildonly-randconfig-003-20250624    gcc-12
i386        buildonly-randconfig-004-20250624    clang-20
i386        buildonly-randconfig-004-20250624    gcc-12
i386        buildonly-randconfig-005-20250624    clang-20
i386        buildonly-randconfig-005-20250624    gcc-12
i386        buildonly-randconfig-006-20250624    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250624    clang-20
x86_64      buildonly-randconfig-002-20250624    gcc-12
x86_64      buildonly-randconfig-003-20250624    clang-20
x86_64      buildonly-randconfig-004-20250624    clang-20
x86_64      buildonly-randconfig-005-20250624    clang-20
x86_64      buildonly-randconfig-006-20250624    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


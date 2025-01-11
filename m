Return-Path: <linux-media+bounces-24647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56522A0A3F5
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 14:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A58188A932
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA94B1A9B4F;
	Sat, 11 Jan 2025 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6rMpOae"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1472199234
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736602753; cv=none; b=NZoiokwhPbNR/ctW/PoAWCs5gWbYkmoaLz9OvRy5K/7on4Z0TAXGNYlx+2nvZB71dA7TEMMKnoj8O3oSpE1aS22bTZEUYAJz0ciewoVyVLfdzPsHDMko8lj7QjqnmE4qkl9fzJxPOQoQhlqcP0gSkdeJcMqw2g5wK3nuNSlNsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736602753; c=relaxed/simple;
	bh=VCX4QJkz3LhMA9l3NaVSVc+cesn+0lZP48GvA0aHGzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qUqN+QZOhYVbcpXWclUOFTnTr9h7txeKxmV3jEP++0NI0+nwD+yJ4jIXs79XDDBemBLNyhj7OPQH9ed6pX2eeeIIZMfEKMoSs6iw1Qy1gAmingU3p+tPgEnZ70DxaIMJGlU1gjETxJ1m36JNYfzZzI0EH14exshlGRpIruK0U+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6rMpOae; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736602752; x=1768138752;
  h=date:from:to:cc:subject:message-id;
  bh=VCX4QJkz3LhMA9l3NaVSVc+cesn+0lZP48GvA0aHGzk=;
  b=J6rMpOaeoUbUeSPc0oz2yuYU2IuLs64xeGNTDfAkO60C/2ueU1JhFcp1
   sPWPlbF97EigWQ5vzl3x0v6T6wYoK+phA2WxzFwpEJ8vH73OMKAsOdEST
   sBeE1GLWsanPwQ0AGB6etUCUEaa9JEdvIplfmA69UV4Gmquh9rgxICnsb
   vCmsF5vGM7yx1kKmBglW1czfOGDNWT5OMBJ8sEKPCOqmAWw6r7lws9fH5
   3zrkFJ6AuORlomfpPWam6hY5PQyXsaaUIts8hV/3VpEmizS8DeI3FYrkc
   OPjTYC9QD5eY4xUtrffsm2Fk3YYaGZi2ikq09jubjnv7ngJYtJmVIut8a
   Q==;
X-CSE-ConnectionGUID: 9ivqT9gsSpaDnxk1vju4JA==
X-CSE-MsgGUID: z3I8ZqUVQHOaoa4QKP5y4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47379503"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47379503"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:39:12 -0800
X-CSE-ConnectionGUID: 69f/SmvpS86PBSunc3mchg==
X-CSE-MsgGUID: jscfVvMIQv+2kxTG+TpVzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103932178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2025 05:39:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbhj-000KhP-2Q;
	Sat, 11 Jan 2025 13:39:07 +0000
Date: Sat, 11 Jan 2025 21:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 c4b7779abc6633677e6edb79e2809f4f61fde157
Message-ID: <202501112115.2Iqnl2tm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: c4b7779abc6633677e6edb79e2809f4f61fde157  media: nuvoton: Fix an error check in npcm_video_ece_init()

elapsed time: 1445m

configs tested: 79
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                    nsimosci_hs_defconfig    gcc-13.2.0
arc                  randconfig-001-20250110    gcc-13.2.0
arc                  randconfig-002-20250110    gcc-13.2.0
arc                          tb10x_defconfig    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250110    clang-20
arm                  randconfig-002-20250110    gcc-14.2.0
arm                  randconfig-003-20250110    clang-19
arm                  randconfig-004-20250110    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250110    gcc-14.2.0
arm64                randconfig-002-20250110    gcc-14.2.0
arm64                randconfig-003-20250110    clang-17
arm64                randconfig-004-20250110    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                               defconfig    gcc-14.2.0
csky                 randconfig-001-20250111    gcc-14.2.0
csky                 randconfig-002-20250111    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250111    clang-20
hexagon              randconfig-002-20250111    clang-15
i386       buildonly-randconfig-001-20250110    clang-19
i386       buildonly-randconfig-002-20250110    clang-19
i386       buildonly-randconfig-003-20250110    clang-19
i386       buildonly-randconfig-004-20250110    gcc-12
i386       buildonly-randconfig-005-20250110    gcc-12
i386       buildonly-randconfig-006-20250110    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250111    gcc-14.2.0
loongarch            randconfig-002-20250111    gcc-14.2.0
nios2                randconfig-001-20250111    gcc-14.2.0
nios2                randconfig-002-20250111    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250111    gcc-14.2.0
parisc               randconfig-002-20250111    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc                     katmai_defconfig    clang-18
powerpc              randconfig-001-20250111    gcc-14.2.0
powerpc              randconfig-002-20250111    gcc-14.2.0
powerpc              randconfig-003-20250111    gcc-14.2.0
powerpc64            randconfig-001-20250111    gcc-14.2.0
powerpc64            randconfig-002-20250111    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250111    clang-18
riscv                randconfig-002-20250111    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250111    clang-20
s390                 randconfig-002-20250111    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250111    gcc-14.2.0
sh                   randconfig-002-20250111    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250111    gcc-14.2.0
sparc                randconfig-002-20250111    gcc-14.2.0
sparc64              randconfig-001-20250111    gcc-14.2.0
sparc64              randconfig-002-20250111    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250111    clang-18
um                   randconfig-002-20250111    clang-20
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250111    clang-19
x86_64     buildonly-randconfig-002-20250111    gcc-12
x86_64     buildonly-randconfig-003-20250111    gcc-12
x86_64     buildonly-randconfig-004-20250111    clang-19
x86_64     buildonly-randconfig-005-20250111    gcc-12
x86_64     buildonly-randconfig-006-20250111    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


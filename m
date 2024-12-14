Return-Path: <linux-media+bounces-23422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A59F20F1
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 22:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FBB1887405
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 21:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0061AE863;
	Sat, 14 Dec 2024 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrnkIsDh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027D1990A2
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734211890; cv=none; b=XN77jisRZq74C15er5TUtDlemOk+npdrGeHpYkmPIj+BQnEmMN4NXugcmwPH3dQgvKCUh4vCwfhDrZb94KeQP2+Qg/LE8SuFtNY/MoNlr4L+FzOUvUWyk11tFOYIWpmC05fGRjpgHYsTNVkaLfQ64/0LNKDtiZUdHe3OiO9KgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734211890; c=relaxed/simple;
	bh=KwNctx03gAn+Z4jjRRH3GBdjDkD1Z4ICU+gj9sQKKwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lLpFdmMxhhKtFttOcdMMBwK9YpV9V+YbYsG39zIBb+PZregYeMrcL4Bw3kTzo3fGJYpexPm1gq9yNx3X2bw980RuYMCtenUdXQaI8sjh7Ux8hWdrnrBEbPNFXVYVzyEIa6ko9Nxp7t1uXLXufxGPFJ/fBgm+FELIuvfQprL69RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrnkIsDh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734211889; x=1765747889;
  h=date:from:to:cc:subject:message-id;
  bh=KwNctx03gAn+Z4jjRRH3GBdjDkD1Z4ICU+gj9sQKKwE=;
  b=lrnkIsDhtcRxDJVGpW0IRBNqph6Ysd/f1tniT6AQtnDDvl46oeWTGh/w
   3FX7GgbRmIN9VLBOCeBy+YUlTJux8fLE5/NShTv9WK1kOp7zFzQnYGrM+
   zSioYFBvvsvWA5u7QxiT5h/AOS8BRMAM+6Blro4p7vHNORoyXKA7Wrqe8
   Bza/Fz2qdd7+ox25kikbh7yQ9chemWtMrLqAx0sOsFzztOzowdb7ECNpx
   TgJBFDv+xxWwKmWZTQ1DFsoAqS5nMDY3p4uKfRLr1ziAZMWd+SxUdffN7
   obO4HIpuVUo/mHwlIUbS1vYxqJ/eZib0Rk+cRsY1m58L1TcoCpJ/1Vca0
   A==;
X-CSE-ConnectionGUID: F++O1kZYRZahSLv3Plbanw==
X-CSE-MsgGUID: GDC2c2C+TmW+RjmpNUHYGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34543882"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34543882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 13:31:25 -0800
X-CSE-ConnectionGUID: Hn3I/+jPROKsJLlAilACew==
X-CSE-MsgGUID: n4BRy1JXRhuZpEVtLb8c9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="127664986"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2024 13:31:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMZjN-000DFG-2z;
	Sat, 14 Dec 2024 21:31:21 +0000
Date: Sun, 15 Dec 2024 05:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 d216d9cb4dd854ef0a2ec1701f403facb298af51
Message-ID: <202412150546.fOGvfwxo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: d216d9cb4dd854ef0a2ec1701f403facb298af51  media: hantro: Replace maintainers

elapsed time: 1442m

configs tested: 54
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241214    gcc-13.2.0
arc                  randconfig-002-20241214    gcc-13.2.0
arm                  randconfig-001-20241214    gcc-14.2.0
arm                  randconfig-002-20241214    clang-15
arm                  randconfig-003-20241214    gcc-14.2.0
arm                  randconfig-004-20241214    gcc-14.2.0
arm64                randconfig-001-20241214    clang-15
arm64                randconfig-002-20241214    clang-20
arm64                randconfig-003-20241214    clang-15
arm64                randconfig-004-20241214    gcc-14.2.0
csky                 randconfig-001-20241214    gcc-14.2.0
csky                 randconfig-002-20241214    gcc-14.2.0
hexagon              randconfig-001-20241214    clang-20
hexagon              randconfig-002-20241214    clang-14
i386       buildonly-randconfig-001-20241214    gcc-12
i386       buildonly-randconfig-002-20241214    gcc-12
i386       buildonly-randconfig-003-20241214    clang-19
i386       buildonly-randconfig-004-20241214    clang-19
i386       buildonly-randconfig-005-20241214    gcc-11
i386       buildonly-randconfig-006-20241214    gcc-12
loongarch            randconfig-001-20241214    gcc-14.2.0
loongarch            randconfig-002-20241214    gcc-14.2.0
nios2                randconfig-001-20241214    gcc-14.2.0
nios2                randconfig-002-20241214    gcc-14.2.0
parisc               randconfig-001-20241214    gcc-14.2.0
parisc               randconfig-002-20241214    gcc-14.2.0
powerpc              randconfig-001-20241214    clang-20
powerpc              randconfig-002-20241214    clang-15
powerpc              randconfig-003-20241214    clang-20
powerpc64            randconfig-001-20241214    gcc-14.2.0
powerpc64            randconfig-003-20241214    clang-20
riscv                randconfig-001-20241214    clang-20
riscv                randconfig-002-20241214    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241214    gcc-14.2.0
s390                 randconfig-002-20241214    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241214    gcc-14.2.0
sh                   randconfig-002-20241214    gcc-14.2.0
sparc                randconfig-001-20241214    gcc-14.2.0
sparc                randconfig-002-20241214    gcc-14.2.0
sparc64              randconfig-001-20241214    gcc-14.2.0
sparc64              randconfig-002-20241214    gcc-14.2.0
um                   randconfig-001-20241214    clang-20
um                   randconfig-002-20241214    clang-17
x86_64     buildonly-randconfig-001-20241214    gcc-11
x86_64     buildonly-randconfig-002-20241214    clang-19
x86_64     buildonly-randconfig-003-20241214    gcc-12
x86_64     buildonly-randconfig-004-20241214    gcc-12
x86_64     buildonly-randconfig-005-20241214    gcc-12
x86_64     buildonly-randconfig-006-20241214    clang-19
xtensa               randconfig-001-20241214    gcc-14.2.0
xtensa               randconfig-002-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


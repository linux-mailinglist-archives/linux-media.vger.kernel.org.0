Return-Path: <linux-media+bounces-27859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF3A57A07
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 13:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C995216EA5C
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 12:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583331B414E;
	Sat,  8 Mar 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnAxZttu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15D1250F8
	for <linux-media@vger.kernel.org>; Sat,  8 Mar 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741435220; cv=none; b=VsOlmRNlDd01rGhQU59HSI2O4vf7hNWgfzDpadrmAsyxzs3xurvnZNa8bQtx/3ZvrJIUxwIVrmN4dhN45piWV73+Ga4JvzBsc53O3RdgWvgZquaRr7sVQLtGCV02gXJ5ee8GY/2CfS4+r/UjXT8i8ftvLt8TEn0zO2EaLeH2PgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741435220; c=relaxed/simple;
	bh=UY0Ript0O3mlZK3pkvFUS2ykGoIYZItDNPKfTw2KtGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+Nr8CMpbpGrzZjE55HqxZ5GAkMRBIKg6b7XwiOXMsNtGcBSOhKZI87YL8iA8rJhqN1IF+6ZB5wm1TUKEQR3JeN2SVGjXdIuG9OwFrX/iYSwkumdQj45ql72HzfQ1B+R6RTA0gcfjUQX1Dt/W0V9xozUFLopdDqQX0h+UPmv1zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnAxZttu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741435218; x=1772971218;
  h=date:from:to:cc:subject:message-id;
  bh=UY0Ript0O3mlZK3pkvFUS2ykGoIYZItDNPKfTw2KtGw=;
  b=KnAxZttu919NQQ1y4MCJ9OjyAGJTgkp1bMAzIyaJayDAiyehgUy2sxxx
   j/lZUMA3qB+/+OPFzsE3bLNDP/e03uZlPLWAn//fFVLWrBbpcN+uAXfu/
   mWMOpceCSxO1+W/RGgThjM/SvHS6/J306Drh/yHLApV56qo/MBA/k9MXI
   hhccQI+CGFndnpPRR6uUJN8zOivwERq8TjJ/Ue8R06H4xnD7cui/IUP1g
   ROkGGVBeDA1VhVZFdEStkbXov8ivEajyEsF53h4DFqBgHeNU4AKKn8D1b
   MyV8gkOmerzZIYedhnsqJ9KMbQzFJ6mBOa9MxFfgCvy8uP27F1itoHKAG
   g==;
X-CSE-ConnectionGUID: FLuM+8pkTEiwJykHOG4d9A==
X-CSE-MsgGUID: TB8iD0qsTmu+9pYKC4txeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42332698"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42332698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 04:00:17 -0800
X-CSE-ConnectionGUID: TzzZ78SmQ4+9aX2XS9tKTQ==
X-CSE-MsgGUID: /cWpFukZSFGFZSDsYxSvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="119726690"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2025 04:00:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqsqj-0001rU-25;
	Sat, 08 Mar 2025 12:00:13 +0000
Date: Sat, 08 Mar 2025 19:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 fae8cab4ba3a76bb883eca176bc442eb5e6d581e
Message-ID: <202503081911.fnmN2sUI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: fae8cab4ba3a76bb883eca176bc442eb5e6d581e  media: platform: synopsys: hdmirx: Fix 64-bit division for 32-bit targets

elapsed time: 1450m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250307    gcc-13.2.0
arc                  randconfig-002-20250307    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250307    clang-21
arm                  randconfig-002-20250307    gcc-14.2.0
arm                  randconfig-003-20250307    clang-19
arm                  randconfig-004-20250307    clang-21
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250307    gcc-14.2.0
arm64                randconfig-002-20250307    clang-15
arm64                randconfig-003-20250307    gcc-14.2.0
arm64                randconfig-004-20250307    clang-15
csky                 randconfig-001-20250308    gcc-14.2.0
csky                 randconfig-002-20250308    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250308    clang-19
hexagon              randconfig-002-20250308    clang-21
i386       buildonly-randconfig-001-20250307    clang-19
i386       buildonly-randconfig-002-20250307    clang-19
i386       buildonly-randconfig-003-20250307    gcc-11
i386       buildonly-randconfig-004-20250307    clang-19
i386       buildonly-randconfig-005-20250307    gcc-12
i386       buildonly-randconfig-006-20250307    clang-19
loongarch            randconfig-001-20250308    gcc-14.2.0
loongarch            randconfig-002-20250308    gcc-14.2.0
nios2                randconfig-001-20250308    gcc-14.2.0
nios2                randconfig-002-20250308    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250308    gcc-14.2.0
parisc               randconfig-002-20250308    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250308    clang-18
powerpc              randconfig-002-20250308    gcc-14.2.0
powerpc              randconfig-003-20250308    gcc-14.2.0
powerpc64            randconfig-001-20250308    gcc-14.2.0
powerpc64            randconfig-003-20250308    clang-21
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250307    gcc-14.2.0
riscv                randconfig-002-20250307    clang-19
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250307    gcc-14.2.0
s390                 randconfig-002-20250307    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250307    gcc-14.2.0
sh                   randconfig-002-20250307    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250307    gcc-14.2.0
sparc                randconfig-002-20250307    gcc-14.2.0
sparc64              randconfig-001-20250307    gcc-14.2.0
sparc64              randconfig-002-20250307    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20250307    clang-17
um                   randconfig-002-20250307    clang-21
x86_64     buildonly-randconfig-001-20250307    clang-19
x86_64     buildonly-randconfig-002-20250307    gcc-12
x86_64     buildonly-randconfig-003-20250307    clang-19
x86_64     buildonly-randconfig-004-20250307    clang-19
x86_64     buildonly-randconfig-005-20250307    clang-19
x86_64     buildonly-randconfig-006-20250307    gcc-12
xtensa               randconfig-001-20250307    gcc-14.2.0
xtensa               randconfig-002-20250307    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


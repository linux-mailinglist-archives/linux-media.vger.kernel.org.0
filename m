Return-Path: <linux-media+bounces-23421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C70069F208F
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 20:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A460316344A
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 19:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D11AAE39;
	Sat, 14 Dec 2024 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHN960Hw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829051119A
	for <linux-media@vger.kernel.org>; Sat, 14 Dec 2024 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734203566; cv=none; b=F6sh7+470I07G9ijMb29pqaXDO5vGLx2MqNkZ2FFc0mNATJpWC6Om0qmr9udivpYeNw9Bgn3L8CkfzjqlACgZtliMjWLsvHq5A9pKMa/0p66dEG3il8b7latsUzQ60ecXNsYzX+EiziUVCcNLuhvTE6xpxYrZCaTdBUWszC1+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734203566; c=relaxed/simple;
	bh=y83d1nBNfJM7C/rxgKblJYCd7+Mvw/3g5CTvRh2msEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lJyA9qWvCvUTW17D+OVWkT836xd78sZf5SQrPVnN/rdm4NadzFRvSSYsMEN3po7iHWBsw2KQefzUz7PYSQ3klH5F63x7uTRi+FJ4dksvOICfc8ZI3mqXgkf5IKjyom6gAK5IBDZQg2UC4OJw1ji7lXL5D/PTHJcHBudylcP+byw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHN960Hw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734203564; x=1765739564;
  h=date:from:to:cc:subject:message-id;
  bh=y83d1nBNfJM7C/rxgKblJYCd7+Mvw/3g5CTvRh2msEY=;
  b=jHN960Hw36cWzB93WRx8Y5gHrCC6KfXsk1dy50DE9wRGcQNsSIwtAb66
   Ln8qYxFS/+ENBVGxdgBWX8hPufXH8Z5Ra0eG4+ST2ysIZav8vNZbF3ki0
   /aed9UtLt9KWpIqpsPRsBraxYupC+oLsgV01Zm6dow7rsTq96ndU4I5dT
   qLfXiwBmMbso6d2ymGIGUfvNaQ3+z562aggA5m/W4YNHdZGYl5zAmbZuP
   Xn3NHu9+J0eqYVg2Ju3jxUIyW2XJhB6PoO26PuOblIHDoUnH4kUUVOAQE
   45t9IlY+tLlEPDO/GD9/Tu/DXyKr1o+tG2davaKNr4P3SKpFJ6+1qD4p0
   g==;
X-CSE-ConnectionGUID: a7KPfUDPR4W36CEY3bDaig==
X-CSE-MsgGUID: O42AKw4TTHyrg1YMQHRmNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38415333"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="38415333"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:12:41 -0800
X-CSE-ConnectionGUID: ekfpVYnfT0aYA/O1lJDORw==
X-CSE-MsgGUID: 3NGaTSDDT4C6j+zFqyUljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101922840"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 11:12:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMXZ8-000DA7-06;
	Sat, 14 Dec 2024 19:12:38 +0000
Date: Sun, 15 Dec 2024 03:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 8b55f8818900c99dd4f55a59a103f5b29e41eb2c
Message-ID: <202412150337.YKK5DZpb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 8b55f8818900c99dd4f55a59a103f5b29e41eb2c  media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline

elapsed time: 1446m

configs tested: 56
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
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241214    gcc-14.2.0
s390                 randconfig-002-20241214    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241214    gcc-14.2.0
sh                   randconfig-002-20241214    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
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


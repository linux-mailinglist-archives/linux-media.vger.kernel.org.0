Return-Path: <linux-media+bounces-41666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A32B41D19
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9DD01BA1B36
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6422FB974;
	Wed,  3 Sep 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIG/N2xo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA722FB63C
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898985; cv=none; b=ROfFipSqayRuA2tuTtNjrZeF2NyN082zn+al8yCmcJb4eRI2gqrSPYFZ+VDcvWmeCfwfWMBrxvo/HLmO+vJOJm5H1Ldjy+GGKhNEiiumWAWc5HPPcYEy0tzQALZIJIvhUTFqgbpjn/pI+ekg3NuOPY/P7vQB9TI2EnYudcMoShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898985; c=relaxed/simple;
	bh=Go8bKscTWWccQqzlki5eq1N3sjIEWts7ATl+WYtLCA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E5w+pPgxjW8xz/faIx9Ubjz0mG2sgejGv+0d28csIhRNp9bfJbwR62Nj1GZDmLhYF6raKHynrhN7fDHhUUwEoKliToWPcB6zZmtMtSuueLirkO+Uex422fp2/5O8UvzujV7b/VFIiuYuE0Lhpx8JxCAjwDzlfSb7+7QKkILRQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIG/N2xo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756898983; x=1788434983;
  h=date:from:to:cc:subject:message-id;
  bh=Go8bKscTWWccQqzlki5eq1N3sjIEWts7ATl+WYtLCA0=;
  b=dIG/N2xo9sbsWzCifftoshwwnRGG+vWijPnj6n+9WGIB0PsO5iWfbbj7
   kNLb3sVfS///2xRXer1GLVdrxsLzvx1CAmX2Fbs8tEAusp0dXsw003PdG
   FzgZiAc81g0oTq8N9KWbE2cARhpQSfa4msovGnOtWrJ5aJTafAQMabjpA
   5eiceHQauefdun0dLVrEZWNzhXOnpIC6qEyX7Wy5o3I6S65AOMCuhSs83
   9ouRbEELq7NYlsoGu3WvSTAxnC1tCv5/Lj+WXbaJJT7tn79coc2UTXLQ+
   r78GCCJnYn3994W4PPYdOoCFlFQg30a+UqFmXTq8OSIRVGvbCSMnP7m9q
   Q==;
X-CSE-ConnectionGUID: uJZujEvwTiqrEH5zVm9Szw==
X-CSE-MsgGUID: BJseVCT8TEmqTp8kYfK8ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81793475"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81793475"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:29:42 -0700
X-CSE-ConnectionGUID: HSVb1Ge0TtKoMJE64wB2PA==
X-CSE-MsgGUID: O2Lm2tWoQL2ZvNaq2+hMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="171707105"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2025 04:29:41 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utlg0-0003mV-1q;
	Wed, 03 Sep 2025 11:29:30 +0000
Date: Wed, 03 Sep 2025 19:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS WITH WARNING
 dbb6c78ee163822abba87ee352b67b7cfec3a023
Message-ID: <202509031935.IWfoDeT2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: dbb6c78ee163822abba87ee352b67b7cfec3a023  count them

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202509022128.hDkCkWCt-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202509022246.qxiTeQrS-lkp@intel.com

    Warning: drivers/media/v4l2-core/v4l2-subdev.c:51 struct member 'streaming' not described in 'v4l2_subdev_stream_config'
    drivers/media/v4l2-core/v4l2-subdev.c:2292:14: warning: variable 'is_source' set but not used [-Wunused-but-set-variable]
    drivers/media/v4l2-core/v4l2-subdev.c:2304:14: warning: variable 'is_source' set but not used [-Wunused-but-set-variable]
    drivers/media/v4l2-core/v4l2-subdev.c:2304:7: warning: variable 'is_source' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- alpha-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- arc-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- arc-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- arm64-randconfig-003-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- arm64-randconfig-004-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- hexagon-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- hexagon-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- hexagon-randconfig-002-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- i386-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- i386-buildonly-randconfig-003-20250902
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- loongarch-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- loongarch-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- loongarch-randconfig-001-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- loongarch-randconfig-002-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- m68k-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- m68k-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- microblaze-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- microblaze-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- mips-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- mips-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- nios2-randconfig-001-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- parisc-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- parisc-randconfig-001-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- parisc-randconfig-002-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc-randconfig-001-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc-randconfig-003-20250902
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc64-randconfig-001-20250902
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- powerpc64-randconfig-003-20250902
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- riscv-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- riscv-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- s390-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- s390-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- sh-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- sh-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- sparc-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- sparc-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- um-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- um-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- x86_64-allmodconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- x86_64-allyesconfig
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- x86_64-rhel-9.4-rust
|   |-- Warning:drivers-media-v4l2-core-v4l2-subdev.c-struct-member-streaming-not-described-in-v4l2_subdev_stream_config
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
|-- xtensa-randconfig-001-20250902
|   `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used
`-- xtensa-randconfig-002-20250902
    `-- drivers-media-v4l2-core-v4l2-subdev.c:warning:variable-is_source-set-but-not-used

elapsed time: 1481m

configs tested: 119
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250902    gcc-11.5.0
arc                   randconfig-002-20250902    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-17
arm                          moxart_defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-004-20250902    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-004-20250902    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250902    gcc-14.3.0
csky                  randconfig-002-20250902    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250902    clang-18
hexagon               randconfig-002-20250902    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250902    clang-20
i386        buildonly-randconfig-002-20250902    clang-20
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-004-20250902    clang-20
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-006-20250902    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250902    clang-22
loongarch             randconfig-002-20250902    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250902    gcc-9.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-8.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250902    gcc-9.5.0
powerpc               randconfig-002-20250902    gcc-8.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250902    gcc-12.5.0
powerpc64             randconfig-002-20250902    clang-22
powerpc64             randconfig-003-20250902    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250902    gcc-13.4.0
riscv                 randconfig-002-20250902    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250902    clang-22
s390                  randconfig-002-20250902    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-14.3.0
sparc                 randconfig-002-20250902    gcc-8.5.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64               randconfig-001-20250902    clang-20
sparc64               randconfig-002-20250902    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250902    gcc-12
um                    randconfig-002-20250902    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-004-20250902    gcc-12
x86_64      buildonly-randconfig-005-20250902    gcc-12
x86_64      buildonly-randconfig-006-20250902    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-9.5.0
xtensa                randconfig-002-20250902    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


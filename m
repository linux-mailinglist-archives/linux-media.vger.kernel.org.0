Return-Path: <linux-media+bounces-57136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMZEH/P4xGmC5QQAu9opvQ
	(envelope-from <linux-media+bounces-57136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 10:14:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F34EA332100
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 10:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F8DA3168BCA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 09:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E294D3B8D55;
	Thu, 26 Mar 2026 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epR+0ULE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE6386C3D
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515854; cv=none; b=Ale/ve2ocJEHNR40RZkTb3aGDuiOKG9A4TtzEYcMU+xu/tit0ZLwiLSGeNr4GVERBwiIgaTbryZVlZ1NntmaDnezyxS1dKl90oNEExkxjNLQlGwOxuWJaO0PI8ZIZrq6ce/8mPb4eVeRCGF/jxwNirvzOeXiMn0KrgEhjp3VRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515854; c=relaxed/simple;
	bh=yAPKeGvsWy1NdveMUbQtMqDdrezKZuNw3TISxnsI79Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gV//rGyDBhsbeVlL9K7kaHUmy3MNfYnt1kXMODRPVTDV88/lwrzCgG3moZd1B0zLH05e/2KldTaPHyO8aCHrYmsNR5jysfkrsNNOSqjzKxbAYMFyQhl+grVT3x+B5h1+M/+13Bb8dYvWkXa5rrhTrmsK/TAk8FzfWRpYS3rr3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epR+0ULE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774515853; x=1806051853;
  h=date:from:to:cc:subject:message-id;
  bh=yAPKeGvsWy1NdveMUbQtMqDdrezKZuNw3TISxnsI79Y=;
  b=epR+0ULEpmR8DPcMzbXqPgZ/9ysVqX8Z5VCGi3va7qR70yjtPsgAW4mJ
   nSvyEQSbO9fsVmTuKvtmdQB2wQ5XvdEfrozSQlhZBNd/WFkcE64ki1gLE
   F9rbhOLIzZMjxU6KaTnuYWwJzbA+LAm7QSyT6AhnooVbnvdWcGl70YDX5
   Np6e/OhyHKPL+46zfqpxDZxCwY2YFkGp0KaIRZB+0wrFUaTfqhLQmIiyS
   w/slZQKDcVoxHRgMOeG2frtglMIo5LzywZwZDPmNdn+RpSNT18hL6ZbnF
   c/1ihpk4v5K7ZtORmwNmhoa2XEfWQlIuiKJc4oyICCZfLP1Z4O21W6I4o
   g==;
X-CSE-ConnectionGUID: va5MGcQQTxyjooctqEQW7w==
X-CSE-MsgGUID: kwqq/bG+SHuKUHURu5W5Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79167395"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79167395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 02:04:13 -0700
X-CSE-ConnectionGUID: S4/zLuAmQNGSAW/L4aIHxA==
X-CSE-MsgGUID: I7rYjHf7TU2e0HImRw186w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="255430799"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2026 02:04:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5gdM-000000008hP-2EVT;
	Thu, 26 Mar 2026 09:04:08 +0000
Date: Thu, 26 Mar 2026 17:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD REGRESSION
 c66f5fc1f0b9517d8c5a60a2143336c216da1fbb
Message-ID: <202603261706.AV3AXluv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57136-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F34EA332100
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: c66f5fc1f0b9517d8c5a60a2143336c216da1fbb  media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops

Error/Warning (recently discovered and may have been fixed):

    drivers/staging/media/tegra-video/vi.c:480:58: error: passing argument 3 of '__sd->ops->pad->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:58: error: passing argument 3 of 'v4l2_subdev_call_wrappers.pad->get_selection' from incompatible pointer type [-Werror=incompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:72: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection' from incompatible pointer type [-Wincompatible-pointer-types]
    drivers/staging/media/tegra-video/vi.c:480:7: error: too few arguments to function call, expected 4, have 3
    include/media/v4l2-subdev.h:1964:15: error: too few arguments to function 'v4l2_subdev_call_wrappers.pad->get_selection'
    include/media/v4l2-subdev.h:1964:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:1964:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'; expected 4, have 3
    include/media/v4l2-subdev.h:1967:15: error: too few arguments to function '__sd->ops->pad->get_selection'
    include/media/v4l2-subdev.h:1967:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'
    include/media/v4l2-subdev.h:1967:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'; expected 4, have 3

Error/Warning ids grouped by kconfigs:

recent_errors
|-- m68k-allyesconfig
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-from-incompatible-pointer-type
|   |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-from-incompatible-pointer-type
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection-expected-have
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection-expected-have
|-- riscv-allyesconfig
|   `-- drivers-staging-media-tegra-video-vi.c:error:too-few-arguments-to-function-call-expected-have
|-- um-allyesconfig
|   |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
|   `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection
`-- xtensa-randconfig-002-20260326
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-__sd-ops-pad-get_selection-from-incompatible-pointer-type
    |-- drivers-staging-media-tegra-video-vi.c:error:passing-argument-of-v4l2_subdev_call_wrappers.pad-get_selection-from-incompatible-pointer-type
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-__sd-ops-pad-get_selection
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-v4l2_subdev_call_wrappers.pad-get_selection

elapsed time: 787m

configs tested: 197
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260326    gcc-8.5.0
arc                   randconfig-002-20260326    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260326    gcc-8.5.0
arm                   randconfig-002-20260326    gcc-8.5.0
arm                   randconfig-003-20260326    gcc-8.5.0
arm                   randconfig-004-20260326    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260326    clang-19
arm64                 randconfig-002-20260326    clang-19
arm64                 randconfig-003-20260326    clang-19
arm64                 randconfig-004-20260326    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260326    clang-19
csky                  randconfig-002-20260326    clang-19
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260326    clang-23
hexagon               randconfig-001-20260326    gcc-8.5.0
hexagon               randconfig-002-20260326    clang-23
hexagon               randconfig-002-20260326    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260326    gcc-14
i386        buildonly-randconfig-002-20260326    gcc-14
i386        buildonly-randconfig-003-20260326    gcc-14
i386        buildonly-randconfig-004-20260326    gcc-14
i386        buildonly-randconfig-005-20260326    gcc-14
i386        buildonly-randconfig-006-20260326    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260326    gcc-14
i386                  randconfig-002-20260326    gcc-14
i386                  randconfig-003-20260326    gcc-14
i386                  randconfig-004-20260326    gcc-14
i386                  randconfig-005-20260326    gcc-14
i386                  randconfig-006-20260326    gcc-14
i386                  randconfig-007-20260326    gcc-14
i386                  randconfig-011-20260326    clang-20
i386                  randconfig-012-20260326    clang-20
i386                  randconfig-013-20260326    clang-20
i386                  randconfig-014-20260326    clang-20
i386                  randconfig-015-20260326    clang-20
i386                  randconfig-016-20260326    clang-20
i386                  randconfig-017-20260326    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260326    clang-18
loongarch             randconfig-001-20260326    gcc-8.5.0
loongarch             randconfig-002-20260326    gcc-14.3.0
loongarch             randconfig-002-20260326    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260326    gcc-8.5.0
nios2                 randconfig-001-20260326    gcc-9.5.0
nios2                 randconfig-002-20260326    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260326    clang-19
parisc                randconfig-002-20260326    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260326    clang-19
powerpc               randconfig-002-20260326    clang-19
powerpc64             randconfig-001-20260326    clang-19
powerpc64             randconfig-002-20260326    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260326    clang-23
riscv                 randconfig-002-20260326    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260326    clang-23
s390                  randconfig-002-20260326    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260326    clang-23
sh                    randconfig-002-20260326    clang-23
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260326    gcc-14
sparc                 randconfig-002-20260326    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260326    gcc-14
sparc64               randconfig-002-20260326    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260326    gcc-14
um                    randconfig-002-20260326    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260326    clang-20
x86_64      buildonly-randconfig-002-20260326    clang-20
x86_64      buildonly-randconfig-003-20260326    clang-20
x86_64      buildonly-randconfig-004-20260326    clang-20
x86_64      buildonly-randconfig-005-20260326    clang-20
x86_64      buildonly-randconfig-006-20260326    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260326    clang-20
x86_64                randconfig-002-20260326    clang-20
x86_64                randconfig-003-20260326    clang-20
x86_64                randconfig-004-20260326    clang-20
x86_64                randconfig-005-20260326    clang-20
x86_64                randconfig-006-20260326    clang-20
x86_64                randconfig-011-20260326    gcc-14
x86_64                randconfig-012-20260326    gcc-14
x86_64                randconfig-013-20260326    gcc-14
x86_64                randconfig-014-20260326    gcc-14
x86_64                randconfig-015-20260326    gcc-14
x86_64                randconfig-016-20260326    gcc-14
x86_64                randconfig-071-20260326    gcc-14
x86_64                randconfig-072-20260326    gcc-14
x86_64                randconfig-073-20260326    gcc-14
x86_64                randconfig-074-20260326    gcc-14
x86_64                randconfig-075-20260326    gcc-14
x86_64                randconfig-076-20260326    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260326    gcc-14
xtensa                randconfig-002-20260326    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


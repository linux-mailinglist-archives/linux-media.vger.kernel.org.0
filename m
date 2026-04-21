Return-Path: <linux-media+bounces-59205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DZtLGBK52lW6QEAu9opvQ
	(envelope-from <linux-media+bounces-59205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:58:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DC4393A2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 462D53030134
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EC33B19CC;
	Tue, 21 Apr 2026 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3/R0WGh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF73AE6F7
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765284; cv=none; b=J26/mWhHx3AYwFlF9hbVyX6RkQ4QI26rYH4s1FktHclgziWG2KqUzdzZxZODDBBJoOjlaZHUCM4P2XFhOsbIXxbKjsaQYSpLEOGqFD/uYLgyfgjR3gF8uuNstNfpvxsWv0Jwh3Lury7D29Y1ZJMtgcghYXgoQf5Xb6+8ZSlk14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765284; c=relaxed/simple;
	bh=v8pID1r5HM4FOb98nUt3MVc2KqDzyZ03pi2+4KiczNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WwStV8ZvLPmGCPkiVs859T8XYhuNEFxKV7+0oe0x6hfKxPKqozeVLCdKRcwm6grGXBrXM5fgZGrMeCY3o3u0pDqcbPxn0+cxyToI6BAR7y/zM8sEEbR0bYoSITPQGkjITxkCaZKvSgkRXlkBr3cDfFaG85fOcTHL7AJ56X0TMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3/R0WGh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776765282; x=1808301282;
  h=date:from:to:cc:subject:message-id;
  bh=v8pID1r5HM4FOb98nUt3MVc2KqDzyZ03pi2+4KiczNg=;
  b=P3/R0WGh8YKrXnsvFba/+u8rkKUtmKlG0PGKPLUkeoA+BuejCI2dvYjv
   ESMW7dWRhz4i2ayJOONt05Xpdw6xIcjhd6BumivA8hz33Hiv1rIneLLEm
   pG2FVysavp+NsvCBFyaOhA2zEI3Wlwy/Y3nIuZ9Kbg+aEd/T6tylQSiFT
   d/JExWfM3fAWvNxagqjqDEU+A2m7IVNRb9RIeYGIavThvc35cudouHusa
   GeqrgKEOGya64+ky1HK75Y7KA92Y6CCOyxRhGux6HuWCySzG70OFD4fHH
   f0b66ofOgr93SkuXdTjuPJRPsKPuJ87Fuia5hOgynhWVBXEVcY3GklRJC
   w==;
X-CSE-ConnectionGUID: 4AxD5yQsSq2/hDa1Fz0eSQ==
X-CSE-MsgGUID: oDzBOUWcTsWUK1F7buaA0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87995804"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="87995804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:54:41 -0700
X-CSE-ConnectionGUID: VFqphp8kRbmRYSDb0/YqEw==
X-CSE-MsgGUID: BGX9UisdRVGMbwY06QzWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236004946"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Apr 2026 02:54:40 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF7oU-000000003Ny-07Ye;
	Tue, 21 Apr 2026 09:54:38 +0000
Date: Tue, 21 Apr 2026 17:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD REGRESSION
 9b19cb5bd1a194d20cdb0d5a0d468d12f6d9296e
Message-ID: <202604211727.wsN7m8ew-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-59205-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0B0DC4393A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 9b19cb5bd1a194d20cdb0d5a0d468d12f6d9296e  media: v4l2-subdev: Add struct v4l2_subdev_client_info argument to pad ops

Error/Warning (recently discovered and may have been fixed):

    include/media/v4l2-subdev.h:1964:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->get_selection'
    include/media/v4l2-subdev.h:1967:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->get_selection'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- um-allyesconfig
    |-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)__sd-ops-pad)-get_selection
    `-- include-media-v4l2-subdev.h:error:too-few-arguments-to-function-((const-struct-v4l2_subdev_pad_ops-)v4l2_subdev_call_wrappers.pad)-get_selection

elapsed time: 771m

configs tested: 88
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                       omap2plus_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                 randconfig-002-20260421    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260421    gcc-14
i386        buildonly-randconfig-002-20260421    gcc-14
i386        buildonly-randconfig-003-20260421    clang-20
i386        buildonly-randconfig-004-20260421    clang-20
i386        buildonly-randconfig-005-20260421    clang-20
i386        buildonly-randconfig-006-20260421    clang-20
i386                  randconfig-001-20260421    clang-20
i386                  randconfig-002-20260421    clang-20
i386                  randconfig-003-20260421    clang-20
i386                  randconfig-004-20260421    clang-20
i386                  randconfig-005-20260421    clang-20
i386                  randconfig-006-20260421    clang-20
i386                  randconfig-007-20260421    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260421    gcc-15.2.0
parisc                randconfig-002-20260421    gcc-9.5.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc64             randconfig-001-20260421    gcc-13.4.0
powerpc64             randconfig-002-20260421    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260421    gcc-14
x86_64      buildonly-randconfig-002-20260421    clang-20
x86_64      buildonly-randconfig-003-20260421    gcc-14
x86_64      buildonly-randconfig-004-20260421    gcc-14
x86_64      buildonly-randconfig-005-20260421    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-071-20260421    clang-20
x86_64                randconfig-072-20260421    gcc-14
x86_64                randconfig-073-20260421    clang-20
x86_64                randconfig-074-20260421    clang-20
x86_64                randconfig-075-20260421    clang-20
x86_64                randconfig-076-20260421    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


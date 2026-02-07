Return-Path: <linux-media+bounces-52331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFejIkSlhmlrPgQAu9opvQ
	(envelope-from <linux-media+bounces-52331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 03:36:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E74104AEE
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 03:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17C9D3024A63
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 02:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601F02E8DEA;
	Sat,  7 Feb 2026 02:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfAncL8k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16DA1FE47B
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770431789; cv=none; b=WzPSMGXiQlY1lLy9O/Bx6VoqgOhXAUPzDzVyEHt1BGWBXgDbMt1RL4Pph3q8F11pXrXHFJ+XNgpUDxn/zKPofSaCXfaqgJ5WREWLOYPqRF/0dC11ZU+oQ9I2zy84OdEuSGw4KuhBxLDNqTInTpWtGPRBF+TISKaJGtIBwqtXMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770431789; c=relaxed/simple;
	bh=0HVHYfnsiYQdgcTWdIM/ZsFbBXsAXry1QEBIJE6WDy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=flNc08kiu+hiiCtaR8pSOzqSjr2zWx+HpCKE1wWuDG4Ho+CzNst/8b0pkK/CBGpTLXJgIIe581pn/ZAVNd9kPcGvCBa9w+AS7Iw5AUdvQOmO1/VHuyMQ6OrPqdBfRNUWFLYTjlgGnWsy60ooRhvwqEOM+eE7zsAHhvYp+cGVkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfAncL8k; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770431789; x=1801967789;
  h=date:from:to:cc:subject:message-id;
  bh=0HVHYfnsiYQdgcTWdIM/ZsFbBXsAXry1QEBIJE6WDy8=;
  b=lfAncL8kyQWsIY9Q3Fvyf/zHq6gwYD2oDQXGDcWGJk9KlxezmWpa9Vl3
   HptiFq3nBwhzGrDbpS/Ajp4dOI9iYPKPrEvaJYhDBjFh4sUFwdrzD89Xz
   HyyiKBCC3eztoN0YsdWaSi0tvju/idHLcdsDoiLY7PGCrvgzYmeDEbhRo
   1szVre67KNfD1h3PxlbvQPFmQQlo46L8mzpJLJSbQaBdpxgvHPmVT2H2B
   3HUtmpv4dZtm1nWNniGhjHfU3wOaU170YgCzxFbxsqo5prPGi9grzTKiH
   STQR14kbnd1fyd4Np07WujDP45312I6WP5slQ3WWhQbVJeQ0D7tMIg5DK
   A==;
X-CSE-ConnectionGUID: tcLZ85ZGTOOphxJCvzMbSQ==
X-CSE-MsgGUID: SbRhO0VNQ0Wvzeeh6QPIlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94288794"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="94288794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 18:36:29 -0800
X-CSE-ConnectionGUID: rw5K/qBlRzGolDo5bNluSw==
X-CSE-MsgGUID: iCUe3qtgRBe8Rx7H5AbytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211063587"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 18:36:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voYBM-00000000lLM-2WZC;
	Sat, 07 Feb 2026 02:36:24 +0000
Date: Sat, 07 Feb 2026 10:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 17d48829c902c064710e9518b453bd252674ae5e
Message-ID: <202602071029.g32NCZJv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52331-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: E9E74104AEE
X-Rspamd-Action: no action

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 17d48829c902c064710e9518b453bd252674ae5e  media: ipu6: Don't track power status, rely on runtime PM

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202602070234.rlTGLzL7-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070437.4jphZAGt-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202602070511.edhvpmc9-lkp@intel.com

    drivers/media/i2c/ov2740.c:1301:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
    drivers/media/i2c/ov2740.c:1301:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/media/i2c/ov2740.c:1305:19: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-function-pointer-types]
    drivers/media/i2c/ov2740.c:1305:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Werror=incompatible-pointer-types]
    drivers/media/i2c/ov2740.c:1305:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
    drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:561:14: warning: unused variable 'has_pipeline' [-Wunused-variable]
    drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:561:7: warning: unused variable 'has_pipeline' [-Wunused-variable]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arc-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arc-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arm-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arm64-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- csky-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- csky-randconfig-002-20260207
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- i386-allmodconfig
|   |-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- i386-allyesconfig
|   |-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- i386-buildonly-randconfig-001-20260207
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- i386-randconfig-011-20260207
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- loongarch-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- loongarch-randconfig-r073-20260207
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- m68k-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- m68k-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- microblaze-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- mips-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- mips-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- nios2-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- openrisc-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- parisc-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- parisc-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- powerpc-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- riscv-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- riscv-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- s390-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- s390-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- sh-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- sparc64-allmodconfig
|   `-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|-- um-allyesconfig
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- x86_64-allmodconfig
|   |-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- x86_64-allyesconfig
|   |-- drivers-media-i2c-ov2740.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- x86_64-randconfig-012-20260207
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- x86_64-randconfig-013-20260207
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:unused-variable-has_pipeline
|-- x86_64-randconfig-076-20260207
|   `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
`-- xtensa-allyesconfig
    `-- drivers-media-i2c-ov2740.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ

elapsed time: 849m

configs tested: 168
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260207    gcc-9.5.0
arc                   randconfig-002-20260207    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20260207    gcc-10.5.0
arm                   randconfig-002-20260207    gcc-12.5.0
arm                   randconfig-003-20260207    gcc-8.5.0
arm                   randconfig-004-20260207    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260207    clang-22
arm64                 randconfig-002-20260207    clang-22
arm64                 randconfig-003-20260207    gcc-14.3.0
arm64                 randconfig-004-20260207    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260207    gcc-15.2.0
csky                  randconfig-002-20260207    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260207    clang-22
hexagon               randconfig-002-20260207    clang-18
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260207    gcc-14
i386        buildonly-randconfig-002-20260207    clang-20
i386        buildonly-randconfig-003-20260207    clang-20
i386        buildonly-randconfig-004-20260207    clang-20
i386        buildonly-randconfig-005-20260207    clang-20
i386        buildonly-randconfig-006-20260207    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260207    clang-20
i386                  randconfig-002-20260207    clang-20
i386                  randconfig-003-20260207    clang-20
i386                  randconfig-004-20260207    clang-20
i386                  randconfig-005-20260207    clang-20
i386                  randconfig-006-20260207    clang-20
i386                  randconfig-007-20260207    clang-20
i386                  randconfig-011-20260207    gcc-14
i386                  randconfig-012-20260207    gcc-14
i386                  randconfig-013-20260207    gcc-12
i386                  randconfig-014-20260207    clang-20
i386                  randconfig-015-20260207    gcc-14
i386                  randconfig-016-20260207    clang-20
i386                  randconfig-017-20260207    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260207    gcc-13.4.0
loongarch             randconfig-002-20260207    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260207    gcc-10.5.0
nios2                 randconfig-002-20260207    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260207    gcc-14.3.0
parisc                randconfig-002-20260207    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                  iss476-smp_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260207    gcc-10.5.0
powerpc               randconfig-002-20260207    gcc-15.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20260207    clang-22
powerpc64             randconfig-002-20260207    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260207    clang-18
riscv                 randconfig-002-20260207    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260207    gcc-8.5.0
s390                  randconfig-002-20260207    gcc-14.3.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                            hp6xx_defconfig    gcc-15.2.0
sh                    randconfig-001-20260207    gcc-15.2.0
sh                    randconfig-002-20260207    gcc-12.5.0
sh                           se7780_defconfig    gcc-15.2.0
sh                   sh7724_generic_defconfig    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260207    gcc-8.5.0
sparc                 randconfig-002-20260207    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260207    gcc-14.3.0
sparc64               randconfig-002-20260207    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260207    clang-22
um                    randconfig-002-20260207    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260207    clang-20
x86_64      buildonly-randconfig-002-20260207    gcc-14
x86_64      buildonly-randconfig-003-20260207    gcc-14
x86_64      buildonly-randconfig-004-20260207    clang-20
x86_64      buildonly-randconfig-005-20260207    clang-20
x86_64      buildonly-randconfig-006-20260207    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260207    gcc-14
x86_64                randconfig-002-20260207    gcc-14
x86_64                randconfig-003-20260207    clang-20
x86_64                randconfig-004-20260207    clang-20
x86_64                randconfig-005-20260207    clang-20
x86_64                randconfig-006-20260207    clang-20
x86_64                randconfig-011-20260207    gcc-14
x86_64                randconfig-012-20260207    gcc-14
x86_64                randconfig-013-20260207    gcc-14
x86_64                randconfig-014-20260207    clang-20
x86_64                randconfig-015-20260207    gcc-14
x86_64                randconfig-016-20260207    gcc-14
x86_64                randconfig-071-20260207    gcc-14
x86_64                randconfig-072-20260207    clang-20
x86_64                randconfig-073-20260207    clang-20
x86_64                randconfig-074-20260207    gcc-13
x86_64                randconfig-075-20260207    clang-20
x86_64                randconfig-076-20260207    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260207    gcc-8.5.0
xtensa                randconfig-002-20260207    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


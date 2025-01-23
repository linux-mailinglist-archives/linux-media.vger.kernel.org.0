Return-Path: <linux-media+bounces-25176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CEA19D55
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 04:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C177A15C7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 03:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E4785626;
	Thu, 23 Jan 2025 03:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCageoAy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8927762F7
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 03:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603380; cv=none; b=KOamJtTwpn3VMB2gdGsuiFLF6bEOBWP9Wn+QCwxzj8PJXnm5BCWmecSRMotNs/hvaSttftBle7RUGxSYXAEMe8X3wyF5bFkzVTu9E+w0PTpOoYCMjcL2uJZjtAHIuBzpLubRTrK4kIL+uwFFZYmZeSsGz5F35eAcA5u6GF6lT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603380; c=relaxed/simple;
	bh=EAnfSdI43F7+0yZcbadGOx9DPlFi6ERzXRjockKkjv8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SwIwOeHrbMx6aLTt9Q908Z6R8mHktulq5f0Z1vpaqTRwdUBzncRiXcxNdrkQ0n2ctRhW7BaAUBc3PVOLQINsks0AsU4yi9Jt9V/95/JIX9yMdaJmhoSgKWoM6raP0pWNGA1/7x/B8n6ptCvbOS77Bh++xO+k5ypDxa8FG/JNWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCageoAy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737603378; x=1769139378;
  h=date:from:to:cc:subject:message-id;
  bh=EAnfSdI43F7+0yZcbadGOx9DPlFi6ERzXRjockKkjv8=;
  b=bCageoAy9yptUl5S9MJavKRRP0TT+Yyxmh6MRovVIowC5i3cGiHeGASd
   ns01moIkskwQjU/FH4rgKcnk6lAZPOjjS05F0zQB/xCPuG0aKM6eW4wOR
   f9qLg+AecOnQqyG/SWJU0MdYz2rNncQiRtIdndUjYs+brQJz/nf9ZqdAE
   sdiCDuClLiiBVHGXMDyOsN/3Oc+uexwMeDpfEEI4x39PvY2rlN1Z6R2/8
   OaZDKBn3i0D3r7qprWUYGzjEnFi2cw97siVH2I88KPANA6a/HXOPkCRQ+
   3Er5isLgVMXrsGM4V6NAICQ81WPtaJIlUQRtobS/KEm4VpyOvWrMFIqDY
   g==;
X-CSE-ConnectionGUID: 0z77E4DVTh26yjdJHEbyUQ==
X-CSE-MsgGUID: GLYLMXlWQESMLOc+7IXPFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49078960"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="49078960"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 19:36:17 -0800
X-CSE-ConnectionGUID: k7k9/O+ETmSc/YinxnlcpQ==
X-CSE-MsgGUID: b/FeXgqeRgKT9kRhLT99AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="112331828"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2025 19:36:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tao0q-000acC-2Q;
	Thu, 23 Jan 2025 03:36:12 +0000
Date: Thu, 23 Jan 2025 11:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-raw] BUILD SUCCESS WITH WARNING
 0e59c4e23bb8fe4a5c206cfbeabef1405c6df8b0
Message-ID: <202501231128.xrE6b1D7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-raw
branch HEAD: 0e59c4e23bb8fe4a5c206cfbeabef1405c6df8b0  merge 28-bit meta docs

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202501221338.bsfIQBc7-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202501221356.BLUiyTqL-lkp@intel.com

    include/uapi/linux/v4l2-controls.h:1235: warning: "V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL" redefined
    include/uapi/linux/v4l2-controls.h:1235:9: warning: 'V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL' macro redefined [-Wmacro-redefined]
    usr/include/linux/v4l2-controls.h:1231: warning: "V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL" redefined
    usr/include/linux/v4l2-controls.h:1231:9: warning: 'V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL' macro redefined [-Wmacro-redefined]

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arc-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arc-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arc-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arm-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arm-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arm-milbeaut_m10v_defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- arm-omap2plus_defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- arm-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- arm64-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- arm64-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- arm64-randconfig-003-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- arm64-randconfig-004-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- csky-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- csky-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- csky-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- csky-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- hexagon-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- hexagon-randconfig-r073-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-allmodconfig
|   |-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|   `-- usr-include-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-buildonly-randconfig-001-20250122
|   |-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|   `-- usr-include-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-buildonly-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-buildonly-randconfig-003-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-buildonly-randconfig-004-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-buildonly-randconfig-005-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-buildonly-randconfig-006-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-003-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-004-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-005-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-006-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-007-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-011-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-012-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-013-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-014-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-015-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-016-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- i386-randconfig-017-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- i386-randconfig-141-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- loongarch-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-allnoconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- loongarch-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- m68k-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- m68k-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- m68k-randconfig-r063-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- m68k-randconfig-r064-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- microblaze-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- microblaze-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- mips-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- nios2-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- nios2-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- nios2-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- nios2-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- openrisc-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- parisc-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- powerpc-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc-ppc64_defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- powerpc-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- powerpc-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc-randconfig-003-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc-randconfig-003-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- powerpc64-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc64-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- powerpc64-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc64-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- powerpc64-randconfig-003-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- riscv-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- riscv-defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- s390-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- s390-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- sh-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- sh-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- sparc-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- sparc64-randconfig-r071-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- um-allmodconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- um-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- um-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- um-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-buildonly-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-buildonly-randconfig-002-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-buildonly-randconfig-003-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-003-20250123
|   |-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|   `-- usr-include-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-004-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-004-20250123
|   |-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|   `-- usr-include-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-005-20250122
|   |-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|   `-- usr-include-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-buildonly-randconfig-006-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-defconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-001-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-002-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-003-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-004-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-005-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-006-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-007-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-008-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-071-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- x86_64-randconfig-072-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-073-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-074-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-075-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-076-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-077-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-078-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- x86_64-randconfig-161-20250123
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-macro-redefined
|-- xtensa-allyesconfig
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
|-- xtensa-randconfig-001-20250122
|   `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined
`-- xtensa-randconfig-002-20250122
    `-- include-uapi-linux-v4l2-controls.h:warning:V4L2_COLOUR_PATTERN_FLIP_HORIZONTAL-redefined

elapsed time: 1442m

configs tested: 177
configs skipped: 10

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                   randconfig-001-20250122    gcc-13.2.0
arc                   randconfig-002-20250122    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                      integrator_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                       omap2plus_defconfig    clang-20
arm                   randconfig-001-20250122    clang-19
arm                   randconfig-002-20250122    clang-20
arm                   randconfig-003-20250122    gcc-14.2.0
arm                   randconfig-004-20250122    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250122    clang-20
arm64                 randconfig-002-20250122    clang-15
arm64                 randconfig-003-20250122    clang-20
arm64                 randconfig-004-20250122    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250122    gcc-14.2.0
csky                  randconfig-001-20250123    gcc-14.2.0
csky                  randconfig-002-20250122    gcc-14.2.0
csky                  randconfig-002-20250123    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20250122    clang-20
hexagon               randconfig-001-20250123    gcc-14.2.0
hexagon               randconfig-002-20250122    clang-20
hexagon               randconfig-002-20250123    gcc-14.2.0
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250122    clang-19
i386        buildonly-randconfig-002-20250122    gcc-12
i386        buildonly-randconfig-003-20250122    gcc-12
i386        buildonly-randconfig-004-20250122    clang-19
i386        buildonly-randconfig-005-20250122    clang-19
i386        buildonly-randconfig-006-20250122    clang-19
i386                  randconfig-001-20250123    gcc-12
i386                  randconfig-002-20250123    gcc-12
i386                  randconfig-003-20250123    gcc-12
i386                  randconfig-004-20250123    gcc-12
i386                  randconfig-005-20250123    gcc-12
i386                  randconfig-006-20250123    gcc-12
i386                  randconfig-007-20250123    gcc-12
i386                  randconfig-011-20250123    gcc-12
i386                  randconfig-012-20250123    gcc-12
i386                  randconfig-013-20250123    gcc-12
i386                  randconfig-014-20250123    gcc-12
i386                  randconfig-015-20250123    gcc-12
i386                  randconfig-016-20250123    gcc-12
i386                  randconfig-017-20250123    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250122    gcc-14.2.0
loongarch             randconfig-001-20250123    gcc-14.2.0
loongarch             randconfig-002-20250122    gcc-14.2.0
loongarch             randconfig-002-20250123    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250122    gcc-14.2.0
nios2                 randconfig-001-20250123    gcc-14.2.0
nios2                 randconfig-002-20250122    gcc-14.2.0
nios2                 randconfig-002-20250123    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250122    gcc-14.2.0
parisc                randconfig-001-20250123    gcc-14.2.0
parisc                randconfig-002-20250122    gcc-14.2.0
parisc                randconfig-002-20250123    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      arches_defconfig    clang-20
powerpc                     asp8347_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                       ppc64_defconfig    clang-20
powerpc               randconfig-001-20250122    gcc-14.2.0
powerpc               randconfig-001-20250123    gcc-14.2.0
powerpc               randconfig-002-20250122    clang-17
powerpc               randconfig-002-20250123    gcc-14.2.0
powerpc               randconfig-003-20250122    clang-15
powerpc               randconfig-003-20250123    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc64             randconfig-001-20250122    clang-20
powerpc64             randconfig-001-20250123    gcc-14.2.0
powerpc64             randconfig-002-20250122    clang-19
powerpc64             randconfig-002-20250123    gcc-14.2.0
powerpc64             randconfig-003-20250122    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250122    clang-20
riscv                 randconfig-002-20250122    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20250122    clang-18
s390                  randconfig-002-20250122    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          landisk_defconfig    clang-20
sh                    randconfig-001-20250122    gcc-14.2.0
sh                    randconfig-002-20250122    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250122    gcc-14.2.0
sparc                 randconfig-002-20250122    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250122    gcc-14.2.0
sparc64               randconfig-002-20250122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250122    gcc-12
um                    randconfig-002-20250122    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250122    gcc-12
x86_64      buildonly-randconfig-002-20250122    clang-19
x86_64      buildonly-randconfig-003-20250122    gcc-12
x86_64      buildonly-randconfig-004-20250122    gcc-12
x86_64      buildonly-randconfig-005-20250122    gcc-12
x86_64      buildonly-randconfig-006-20250122    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250123    clang-19
x86_64                randconfig-002-20250123    clang-19
x86_64                randconfig-003-20250123    clang-19
x86_64                randconfig-004-20250123    clang-19
x86_64                randconfig-005-20250123    clang-19
x86_64                randconfig-006-20250123    clang-19
x86_64                randconfig-007-20250123    clang-19
x86_64                randconfig-008-20250123    clang-19
x86_64                randconfig-071-20250123    clang-19
x86_64                randconfig-072-20250123    clang-19
x86_64                randconfig-073-20250123    clang-19
x86_64                randconfig-074-20250123    clang-19
x86_64                randconfig-075-20250123    clang-19
x86_64                randconfig-076-20250123    clang-19
x86_64                randconfig-077-20250123    clang-19
x86_64                randconfig-078-20250123    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250122    gcc-14.2.0
xtensa                randconfig-002-20250122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


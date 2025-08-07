Return-Path: <linux-media+bounces-39001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C7B1D34F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908393B166B
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FD923E324;
	Thu,  7 Aug 2025 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3LUJ4q8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3723E358
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551715; cv=none; b=q0DaZ7QSGBv523pC7dnWEShHyhU9YOhepCgJKbW6Kbe69sMOlaWdCVKvczHNFQjYeTV2WPlSNkVJADcB1fuoDBszBmLGEwb2d6H3m6JsccqyC++4JfSRoqvxKHrV5fTR1OQGk7HeDXUyluKpoQpwEtxgYidg1c5EGsMVvH2NlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551715; c=relaxed/simple;
	bh=DzAzqfk7DRbVrFwNU82DS3x2R05AfqbBfRNuiLoBciE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQnMx9OjKRunlrWroyj2y/vwo5Pk2BQbhw+YVsuUK56hk4s7EWszh+u0jclfY3M8pjzmOapjUclzWlHtNpi2aZNIefLWAQiImd7xW5A4O+vq4gdUrPHLk/KWYkIoL0/I17zxK9StJY2BPcvnuNAxW6IIip7nrd97CcuTL9rwiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3LUJ4q8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754551713; x=1786087713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzAzqfk7DRbVrFwNU82DS3x2R05AfqbBfRNuiLoBciE=;
  b=T3LUJ4q8dfmdF31Glmce7ioqQRAnEm+VIPOUOBWlcXUZHA/VaEv/MlsY
   HZq+CK3qAvbOOChwbm226BPVuMj7elV1UfwLcqk7ZeqDipbIBNg8onp0y
   S2DkBBc+aHJD7cxF72ZHQNVzq1H2mI1D3BBB+s/BBZ0y9nXEcGfyx93M4
   KDIwoX6iRMwatwmLF97PL8FS0tZbLgqhjKOwIjPwmWmhc2MAudZCn349R
   iOSuyhdld1N7L1+SOyYurqW8xB+jiiJlrdr2q4UOKuV2JNaKrGx7YA/em
   OSKRgbhMfll1dVr67/U8PZoMMKffuo/MtOlrhWz5GBhcvNHgDqrr0EXvf
   w==;
X-CSE-ConnectionGUID: hMmy+YfXTOCX648mnCxGtg==
X-CSE-MsgGUID: B+F4JN9cR0yHi/EVV+5Sow==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74338216"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74338216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 00:28:33 -0700
X-CSE-ConnectionGUID: id5TnuQ9Tzaa64T0qDjIJg==
X-CSE-MsgGUID: OkidXUiCQWC4bka6S3cfrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164993546"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 00:28:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujv37-0002VM-0x;
	Thu, 07 Aug 2025 07:28:29 +0000
Date: Thu, 7 Aug 2025 15:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 39/82] ERROR: modpost: __ex_table+0x1ab8
 references non-executable section '.data.rel.local.max7301_driver'
Message-ID: <202508071549.H718BtnN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   c004c51265ae9cb188ea355ff4e13bdabea658a9
commit: 66f886730888ecb9c27a397f43a6c0f9a26f4697 [39/82] media: v4l: uapi: Add a control for color pattern flipping effect
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071549.H718BtnN-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071549.H718BtnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071549.H718BtnN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> .LASF98 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .LASF100 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .LASF102 (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .LASF104 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .LASF106 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .LASF108 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LASF110 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .LASF112 (section: .debug_str)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .LASF114 (section: .debug_str)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .LASF116 (section: .debug_str)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .LASF118 (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> .LASF120 (section: .debug_str)
ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .LASF122 (section: .debug_str)
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .LASF124 (section: .debug_str)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LASF126 (section: .debug_str)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x192c (section: __ex_table) -> .LASF128 (section: .debug_str)
ERROR: modpost: __ex_table+0x192c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1930 (section: __ex_table) -> .LASF130 (section: .debug_str)
ERROR: modpost: __ex_table+0x1930 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1938 (section: __ex_table) -> .LASF132 (section: .debug_str)
ERROR: modpost: __ex_table+0x1938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x193c (section: __ex_table) -> .LASF134 (section: .debug_str)
ERROR: modpost: __ex_table+0x193c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1944 (section: __ex_table) -> .LASF136 (section: .debug_str)
ERROR: modpost: __ex_table+0x1944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1948 (section: __ex_table) -> .LASF138 (section: .debug_str)
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .LLST477 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .LLST479 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x195c (section: __ex_table) -> .LASF1886 (section: .debug_str)
ERROR: modpost: __ex_table+0x195c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .LASF1888 (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .LASF649 (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x196c (section: __ex_table) -> .LASF651 (section: .debug_str)
ERROR: modpost: __ex_table+0x196c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .LASF653 (section: .debug_str)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .LASF651 (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .LASF656 (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1984 (section: __ex_table) -> .LASF658 (section: .debug_str)
ERROR: modpost: __ex_table+0x1984 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> .LASF660 (section: .debug_str)
ERROR: modpost: __ex_table+0x198c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .LASF651 (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .LASF670 (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> .LASF672 (section: .debug_str)
ERROR: modpost: __ex_table+0x199c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .LASF674 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> .LASF676 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .LASF1214 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .LASF1216 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .LASF1218 (section: .debug_str)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .LASF1220 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF1222 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF1224 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF1226 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF1228 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF1230 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF1232 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF1234 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF1236 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> max7301_driver (section: .data.rel.local.max7301_driver)
>> ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.data.rel.local.max7301_driver'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
>> ERROR: modpost: __ex_table+0x1abc references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> __UNIQUE_ID_description353 (section: .modinfo)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> __UNIQUE_ID_author350 (section: .modinfo)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> .Ldebug_abbrev0 (section: .debug_abbrev)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.debug_abbrev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> .LASF3184 (section: .debug_str)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> .Ldebug_ranges0 (section: .debug_ranges)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.debug_ranges'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .LASF1 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> .LASF3 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> .LASF7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> .LASF9 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> .LASF11 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> __exitcall_max7301_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> .LASF14 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> .LASF16 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> .LASF2125 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> .LASF2127 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .LASF2129 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .LASF2127 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .LASF2132 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .LASF2127 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> .LASF2135 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> .LASF2127 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> .LASF2138 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> .LASF2127 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> .LASF1929 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .LASF1933 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> .LASF1935 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c20 (section: __ex_table) -> .LASF1937 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c24 (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> .LASF1940 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> .LASF1942 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .LASF1944 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> .LASF1947 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> .LASF1950 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> .LASF1953 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> .LASF1931 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d28 (section: __ex_table) -> .LASF788 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d2c (section: __ex_table) -> .LASF790 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d34 (section: __ex_table) -> .LASF792 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d38 (section: __ex_table) -> .LASF794 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .LASF796 (section: .debug_str)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


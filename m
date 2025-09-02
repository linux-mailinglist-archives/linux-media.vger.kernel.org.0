Return-Path: <linux-media+bounces-41537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C60EFB3F9E9
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3B0480521
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B6F2EA481;
	Tue,  2 Sep 2025 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nClZo4i9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10DA1EF0B0;
	Tue,  2 Sep 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804306; cv=none; b=ZQnnio1MhAT7Ov2WSUbtfEfsMmscVifYGA5TWZCY7FWXyuHCXr8diAvjxAgTicQ1NPq0cD4Xmkn3Qb2jCEzEXTi7Wd9rVmWvlj8uALGsw1B5PXBz9CJRtU7KGUNfgMDLY81BQUhsXMS5SUIw576KgLGg43mg0qx56HNAPxiXjAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804306; c=relaxed/simple;
	bh=0BL1nnM0OlVJrsOwJo4O+SjKC+dVRggUthGwZ1s3Ilg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rnogVNFBsymHyfqdP8C4UZJcSJIWRJGyeebxSBwMwcJHqXwLfsEaNOn8wweG+WFsLvnwHNhhdE1ceL99dTDHk/7eHtM9Lb78zBP71Lqz+q9M5ndiQw86ENZ1pvUd4u56eYqJoVieQQjU+sri7R7iZ0qbV3nxKHQuXEwx00OqHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nClZo4i9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756804304; x=1788340304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BL1nnM0OlVJrsOwJo4O+SjKC+dVRggUthGwZ1s3Ilg=;
  b=nClZo4i9J6KGikJQE/LXOjeo1VDYk1R+mqqftvjBM0ot99a7+vSZH23F
   j1D93QKg/4npBQjIrbOWGHLl2k4XrRJFTCjBXIxYCXKRitjg02t+iZDAe
   f9wzVLk2S9ngBV8HHxYKVYr23j+vuInhsOKTT2mUI/jpECfVFeKlm/5cY
   qxooAFc4xtoDamm+TwjUb8XpDIh2CcQFa2MycqW+HPUvD19+QpHSgs7Zn
   Q+xuDx8smhz2LBLRLWJpvzlIq3xkbHhRkWMI9Wpty4jWCxsddsgIJLIX3
   Be5/BJWOoNqNhHo1LhKlJtHbzBgxUSIDKFqObucejzdww4FDd9YhxIhLL
   g==;
X-CSE-ConnectionGUID: S5lQ17+xTU+hSQQmoYKsDg==
X-CSE-MsgGUID: jcy5BwrOTlWz71G6W+Agwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81649813"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81649813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:11:44 -0700
X-CSE-ConnectionGUID: Udk4grxwTLKqK3tvYBkvlg==
X-CSE-MsgGUID: ttO48yWjSJqg9NS8awJpww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170480186"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 02 Sep 2025 02:11:43 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utN3E-0003HN-21;
	Tue, 02 Sep 2025 09:11:40 +0000
Date: Tue, 2 Sep 2025 11:11:17 +0200
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [linux-next:master 4560/5641] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
Message-ID: <202509021100.e3nEldXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: aebcc3009ed55564b74378945206642a372c3e27 [4560/5641] docs: sphinx: drop parse-headers.pl
reproduce: (https://download.01.org/0day-ci/archive/20250902/202509021100.e3nEldXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021100.e3nEldXk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


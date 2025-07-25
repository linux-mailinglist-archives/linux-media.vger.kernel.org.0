Return-Path: <linux-media+bounces-38431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30935B11509
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 02:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED601C83C62
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 00:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6AE4A3E;
	Fri, 25 Jul 2025 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIJ5JLKN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41FEC2;
	Fri, 25 Jul 2025 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753402408; cv=none; b=JJgomXE0Z/7+RVP3JogyVad9X9BNjHlkJNxZrK67F+moeWajAMRPIQkzL1W9d8CtIkSkbbElLZn8hg9a0bKTSOgKHIF+c/lKtnqHt7q3cCLkJuAR2WoCP6Wg5c2LxdTxOSmvGyCa6aSIpPRxKGIfdn5jqbW3vLBhSro5qt5g0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753402408; c=relaxed/simple;
	bh=CXrAspAWhi8AJ8qkfxe1BgPkB+iop70T0nW+wL1a69U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz48BTVS7nVULdrooyJgRI6SxEhEJresKxR7Z3FJ4i7yRU2epAkQl6w3c1ZFm2VzelxcMOMMvYbfS7PKq8BpB9vYiPxXPnI9V7ttUe9i/ch4l64/cuywhCiEXONVKwBdFXhYyh4XDPttueQT/CyA56xD7vPIg9qRrOaN10fFDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIJ5JLKN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753402407; x=1784938407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXrAspAWhi8AJ8qkfxe1BgPkB+iop70T0nW+wL1a69U=;
  b=jIJ5JLKND5U7p58nrmrVQL1ADcj14jtkxHO7dRI2OCc3vuKWJvJfpl+M
   iX5wk418yVsAS248rkxKKGHwl4D/8teqDp2unvG38WkVT+i+E0zKSZm/7
   N07pD9xQ5JBIuYa86xQ4PfHtc4DU7HqhdhmTYbOyC31asmXYJ9lHYNNvs
   c2Kii/fiZBdjRzVUafr8k+rreH85igM6lnd8RtAZE90MgJOk3IQebPEIy
   tQIu89L49nMl81UCTvGzU4mMI2GTm0IWO7mdTzWJ8cCpvwlnH2LMNEo/9
   wgpZOP0eWK88nUd/dkJ2l+Ckyva0M2Pk/6kdR/kbIu9d8WYnEa8BmwrgZ
   w==;
X-CSE-ConnectionGUID: IS/pgpXyRK661M/Lvk7UxA==
X-CSE-MsgGUID: ISVu021LSH6tpYMfvmE16Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55615030"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55615030"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 17:13:27 -0700
X-CSE-ConnectionGUID: y8Pjs+C5QnihHKhqOoZedQ==
X-CSE-MsgGUID: zr67EXbhRM2JktGqIybxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="184207449"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jul 2025 17:13:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf63s-000Kvz-25;
	Fri, 25 Jul 2025 00:13:20 +0000
Date: Fri, 25 Jul 2025 08:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>, Yunke Cao <yunkec@google.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l: async: Add
 devm_v4l2_async_register_subdev_sensor() helper
Message-ID: <202507250804.YlLveyKO-lkp@intel.com>
References: <20250723102515.64585-3-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723102515.64585-3-tarang.raval@siliconsignals.io>

Hi Tarang,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linus/master v6.16-rc7 next-20250724]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/media-mc-Add-devm_media_entity_pads_init-helper/20250723-182930
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250723102515.64585-3-tarang.raval%40siliconsignals.io
patch subject: [PATCH 2/4] media: v4l: async: Add devm_v4l2_async_register_subdev_sensor() helper
config: hexagon-randconfig-002-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250804.YlLveyKO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250804.YlLveyKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250804.YlLveyKO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_async_register_subdev_sensor" [drivers/media/v4l2-core/v4l2-async.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


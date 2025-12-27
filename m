Return-Path: <linux-media+bounces-49583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E428CDF4DA
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 08:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABA3530080C0
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 07:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC34D23D7C4;
	Sat, 27 Dec 2025 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtTdb0Xd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE31DE2AD;
	Sat, 27 Dec 2025 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766819117; cv=none; b=ZjDVs52szGjaJpRhNyy7k4MHkK36WVD51qI6NKeGI6YLbeW6T49NdZPZZ3LtGzY8fyQz7+WA2m/6Eiea5FWCmxtwog8p0Vgmfras3RZzU8df0nYktt8/lmgipGTGaVxw5mlZbI9EgL/bNoWdNkPc7mBtdiMPF+59XqmnIMRq3G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766819117; c=relaxed/simple;
	bh=+MYBUvaekcX2sSPzpj1fUpCCoIuWlnhasEc3m8SvhqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz4GgB0JnYlgxT4szaARfXRW3wkd9kMW1tkj7+qzwnKTStKZTojDnT5v+8qZ38x7QcHYvU4OS3mfMrfveF40dpKhv7jczy+CNrYZ/zsp1sSVnl1txBI+6+hYiJy1yqB/s5/RC21IjUdHreXMpLFS29w8eLYC65yiSe/RA2VZvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtTdb0Xd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766819116; x=1798355116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MYBUvaekcX2sSPzpj1fUpCCoIuWlnhasEc3m8SvhqA=;
  b=YtTdb0Xd7gynPlzJOFsQ7d/0l2H6MN3HsKJWWlqwA/c/WJwF8WDNw2dQ
   MGaXvH39fAS2OTIQaGtFEkKpaNLvYfQNK0TOEUqy+zq4lc130tA9YcaUQ
   0u7wPfsdvrGseAt0dr/l1Jc8GpD4vHAqzLQZErZFtqwlfuDi7XWB5CYMD
   QnS9DfFwxRa2fW9ifkhigr6hUGWLl+LBho7lzK3XlpNoPNg1inodbHCT5
   KP96Q1qyksUcagJ10EJpGtFXIfaK8dKeihHovXyimPcKTtl2QfmRp/R1j
   jBkO2dTtKGS4ok0v+wExfzvzjcnCQwgfMWYWgivyeKdu7C+D2bG/msY1k
   A==;
X-CSE-ConnectionGUID: fIR6vycGT4i7Wk+Bb+oU3Q==
X-CSE-MsgGUID: 4fFSosFKThe57VmwPAjBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79654591"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79654591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:05:16 -0800
X-CSE-ConnectionGUID: jAODHWteRYC//AAY5npWTQ==
X-CSE-MsgGUID: /KSrmsRoQoq1h6O7SH1EIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200247943"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2025 23:05:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOMN-000000005dB-26Cp;
	Sat, 27 Dec 2025 07:05:07 +0000
Date: Sat, 27 Dec 2025 15:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381
 variant
Message-ID: <202512271444.48dPgeMW-lkp@intel.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218232829.337811-15-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20251219-074342
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20251218232829.337811-15-detlev.casanova%40collabora.com
patch subject: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381 variant
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251227/202512271444.48dPgeMW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271444.48dPgeMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271444.48dPgeMW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_udivdi3" [drivers/media/platform/rockchip/rkvdec/rockchip-vdec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


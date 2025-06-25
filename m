Return-Path: <linux-media+bounces-35884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F060AE8820
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01A143B4AA6
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9674B29B201;
	Wed, 25 Jun 2025 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZdyNvrH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C126B74D
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865459; cv=none; b=YMGfXDeo1E33hbUjS9zxcPvnUnQ0e8LvF4CaBVZWHnPLEijnQs6yO/reSKThFNZT33TG8HnBCd4iNLgr9cJxrdAYo3nSYTbeV5GUIBWgVEQaQ4TnEXAsr9X4yW4JlFIHRvyryUppwhx7WqEZ2oN8/A3T0Fl+yG96plR33E6E+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865459; c=relaxed/simple;
	bh=hdrx96DKIMMho+Vi+3Tqru1N9Q2DBKV9YbjWiii1Ymw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpPKRIyDAjbpAXmeP/pD0A8JYndYAe1H4UPv6ohCNfj563NHCaSGGjLFhD9yyp/LmTzJOajrHAoPhrNmT/2+QvWwvZM3wU+r/LHAojjJgA8Cc04lxfPp38t3mouMjKCYHTWBlbWq3bUFVgcy2hCmKhSnAGSBLqQ9UpDvz9ODNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZdyNvrH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750865457; x=1782401457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hdrx96DKIMMho+Vi+3Tqru1N9Q2DBKV9YbjWiii1Ymw=;
  b=jZdyNvrH7xckRxYNNU3D6FXZw3LZqH2Z3JafB8jpNAXvu3UkWTZvyTPD
   V+edX3rYDZcsezVIHWgauCw80Aq9DKClNT9pw9KEeY2gvV6wTVQDcKmpj
   /jMzEEM6ykqVTFk3RLNoP/5ry4AliA3sB+jX6+eBCESw+f7fFf11I8MAQ
   nQ6Y2KP1zbYq3kEk071Ibyymsge53mICVwlOHtA5fOTWU3qBUrXmCO6oX
   Wf7HxPnXFE/DIjZqe1CVLo0kIlFhOARDUq/KQczKAGEhIX1+Hn+EJF2Z8
   orenzU/nVcR07hGgoqc/VB2M4Qag/FZBDsIArhN3eKIoh8Z9ulnq9+sRC
   g==;
X-CSE-ConnectionGUID: LnzjtjCMSviDClkTAigR7Q==
X-CSE-MsgGUID: gs3vr/POTQymb9iJscYRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70574122"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="70574122"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:30:56 -0700
X-CSE-ConnectionGUID: fQidikjWTkuhNY3E5XQ8fA==
X-CSE-MsgGUID: eqh3QoiWSOeodErLku2WAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152021254"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2025 08:30:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUS5L-000TF8-2B;
	Wed, 25 Jun 2025 15:30:51 +0000
Date: Wed, 25 Jun 2025 23:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] media: mc: Add media jobs framework
Message-ID: <202506252343.UV4gd2u3-lkp@intel.com>
References: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-media-jobs-v2-2-8e649b069a96@ideasonboard.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/media-mc-entity-Add-pipeline_started-stopped-ops/20250624-160120
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250624-media-jobs-v2-2-8e649b069a96%40ideasonboard.com
patch subject: [PATCH v2 2/3] media: mc: Add media jobs framework
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250625/202506252343.UV4gd2u3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252343.UV4gd2u3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252343.UV4gd2u3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-frontends/cx22700.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx22702.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24113.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24116.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24117.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24120.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cx24123.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cxd2820r_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cxd2841er.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/cxd2880/cxd2880_top.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib0070.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib0090.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib3000mb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib3000mc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib7000m.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib7000p.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib8000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dib9000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dibx000_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/drx39xyj/drxj.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/drxd_hard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/drxk_hard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ds3000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dvb-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/dvb_dummy_fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ec100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/gp8psk-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/helene.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/horus3a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/isl6405.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/isl6421.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/isl6423.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/itd1000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ix2505v.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/l64781.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lg2160.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lgdt3305.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lgdt3306a.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lgdt330x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lgs8gl5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lgs8gxx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lnbh25.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lnbh29.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lnbp21.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/lnbp22.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/m88ds3103.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/m88rs2000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mb86a16.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mb86a20s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mt312.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mt352.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mxl5xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/nxt200x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/nxt6000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/or51132.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/or51211.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1409.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1411.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1420.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1432.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s921.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/si21xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/sp887x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb0899_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb6000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0288.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0297.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0299.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0367.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0900_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv090x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0910.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10021.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10023.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10048.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda1004x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10086.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda18271c2dd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda665x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8083.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8261.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda826x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ts2020.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tua6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1820.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1x93.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zd1301_demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10036.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10039.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10353.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/aptina-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/ccs-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/max9271.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-dev-allocator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-entity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/media/mc/mc-jobs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-request.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/b2c2/flexcop-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bt878.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx23885/altera-ci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-mpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-vp3054-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ddbridge/ddbridge-dummy-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-buttress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-cpd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-fw-com.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dvb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ioc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_uart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-ts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ttpci/budget-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/chips-media/coda/imx-vdoa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/marvell/mcam-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vpu/mtk_vpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-scaler.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/hfi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/rcar-fcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/samsung/exynos4-is/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/davinci/vpif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/omap/omap_voutlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/csc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/sc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/vpdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/xilinx/xilinx-vtc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-isa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-tea5777.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/si470x/radio-si470x-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/tea575x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/lirc_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/rc-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0011.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0012.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0013.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/max2165.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mc44s803.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2060.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2063.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt20xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2131.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2266.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5005s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5007t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/qt1010.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/r820t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18218.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18271-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda827x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda8290.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda9887.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5761.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5767.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


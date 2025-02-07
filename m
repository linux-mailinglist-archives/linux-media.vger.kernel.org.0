Return-Path: <linux-media+bounces-25813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FFA2C70D
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 16:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2723AD230
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48911EEA2A;
	Fri,  7 Feb 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbavoyW/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693561EB19A;
	Fri,  7 Feb 2025 15:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942050; cv=none; b=loRRb6M4GD/a3dofjqaTR8oO/jLpm4Euu0dOzSD/rJCIo48C2VOqqD6XX3sk+A86V8QEJrRW+bBzpjpE5Tx0zIPKklP2RibQTOxhcq0KJlxeF6VLchB/KKbNFSbtEd4Pk+fOx9ORi2wwMYud0KjxmB04vSQjZfz8nuPgd6ZPpU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942050; c=relaxed/simple;
	bh=6GE9Dr6wuDcMJE5qZBlWMnYEgJHzTHm8FhWdCrRJ3Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO7RkA7ipFF/g1gW1rzJJvyyQAUgUh8bJ5udxf6PrwDHMX9BYXQFbzFjDqQRVyOgo8B05l659/psT6PrTO2xigb7n3tA+O5AIjcrc9YuDXyZkJNOIGSNkjvkEs4QfRY1GBY5ZVMW0Qv3/4J3BNN55gA9p+a4RlTCI5V0Td3X04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbavoyW/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738942047; x=1770478047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6GE9Dr6wuDcMJE5qZBlWMnYEgJHzTHm8FhWdCrRJ3Gs=;
  b=KbavoyW/ITcABH4dQ/XoBykpqdXuaXygIi66w2us1AItUQWQmVq7bdF/
   NxnK/EU34dO8pNKXM72s66ecrNh7YrB4swdMeoOUHQfWhi2B+GqTrOeca
   PGEskZXVoPNz+RIXutqqB9MluteCz+aTcBSrKT9trrt58tcWb0FCcIxSo
   H0lD3vaT+hwJVvdjqWwQAPNHvoq19EUaw6ux/jslZ5vlkGskEWJXZ+HNG
   AsJ5OU8mp31ZpVrDB/pERxWHxKrIHYbmXBFwM37bjRxEx6JJz8BjZHsC2
   9D7+rJ8Fhs+/JWkXW24phX+wBTYH2WBtvuooSsWzcJfiwGME1jVsP8iP7
   Q==;
X-CSE-ConnectionGUID: fOUgXx7qRJmjfy8TkbrmWw==
X-CSE-MsgGUID: 6ff5nvCbRgKXgsr6JPDwUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42426791"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42426791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:27:26 -0800
X-CSE-ConnectionGUID: 0SbW1BpCT1KUK1j159TXaQ==
X-CSE-MsgGUID: dTs5T6O9TJ6I7nDWk0GB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116556719"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 07:27:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgQGD-000yWJ-2O;
	Fri, 07 Feb 2025 15:27:17 +0000
Date: Fri, 7 Feb 2025 23:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v3 4/7] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <202502072356.crcHKSbX-lkp@intel.com>
References: <20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40@wolfvision.net>

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch/media-dt-bindings-media-video-interfaces-add-defines-for-sampling-modes/20250206-180041
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40%40wolfvision.net
patch subject: [PATCH v3 4/7] media: rockchip: add a driver for the rockchip camera interface
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250207/202502072356.crcHKSbX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072356.crcHKSbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072356.crcHKSbX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c: In function 'rkcif_dvp_isr':
>> drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c:759:32: warning: variable 'ctl' set but not used [-Wunused-but-set-variable]
     759 |         u32 lastline, lastpix, ctl, cif_frmst;
         |                                ^~~


vim +/ctl +759 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c

   752	
   753	irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
   754	{
   755		struct device *dev = ctx;
   756		struct rkcif_device *rkcif = dev_get_drvdata(dev);
   757		struct rkcif_stream *stream;
   758		unsigned int intstat;
 > 759		u32 lastline, lastpix, ctl, cif_frmst;
   760		irqreturn_t ret = IRQ_NONE;
   761	
   762		if (!rkcif->match_data->dvp)
   763			return ret;
   764	
   765		intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
   766		cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
   767		lastline = RKCIF_FETCH_Y_LAST_LINE(
   768			cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
   769		lastpix = RKCIF_FETCH_Y_LAST_LINE(
   770			cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
   771		ctl = cif_dvp_read(rkcif, RKCIF_DVP_CTRL);
   772	
   773		if (intstat & RKCIF_INTSTAT_FRAME_END) {
   774			cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
   775				      RKCIF_INTSTAT_FRAME_END_CLR |
   776					      RKCIF_INTSTAT_LINE_END_CLR);
   777	
   778			stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
   779	
   780			if (stream->stopping) {
   781				cif_dvp_stop_streaming(stream);
   782				wake_up(&stream->wq_stopped);
   783				return IRQ_HANDLED;
   784			}
   785	
   786			if (lastline != stream->pix.height) {
   787				v4l2_err(&rkcif->v4l2_dev,
   788					 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
   789					 intstat, cif_frmst, lastpix, lastline);
   790	
   791				cif_dvp_reset_stream(rkcif);
   792			}
   793	
   794			rkcif_stream_pingpong(stream);
   795	
   796			ret = IRQ_HANDLED;
   797		}
   798	
   799		return ret;
   800	}
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


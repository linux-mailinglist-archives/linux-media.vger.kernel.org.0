Return-Path: <linux-media+bounces-20540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36D9B54D5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 22:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8155B21C9E
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 21:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68859208237;
	Tue, 29 Oct 2024 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do3pc94U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3B20899C;
	Tue, 29 Oct 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236626; cv=none; b=gO0/29zUPG28GPv8qZtwAYaW/d4Ve6pipijOWNcmvLRrgBWQ8ww1sXtPiqyOxpfBBrkP47R7W9Zx3NK338SUhNA3I38ae/Hk5iYBxUQD8oJiM/qs8rpkpOXs5VMJYeguPI0ggdvoZmFIIxniMlTS1x3/z0l2I0BaNuh3xqQRXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236626; c=relaxed/simple;
	bh=PBPP3KgXER9rQD3+lVmo5Ajnvk6LGjq/b1CZogmqkG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ij0Q6htYa113EQrVvd/5YZqzRd6SRgUftLydetOPzV3mLEnZBvh2izHULDQIa4C0WW4A1WcX1g+Zg2ahozIm+3taOAQK9XGrBgvepw2zpHGw/uNedVufmuoqB1hd0nb49CPImEjVu13Y2b2nZLH1kAa4gQ6LQACF9rJCAdPg01w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do3pc94U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730236624; x=1761772624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PBPP3KgXER9rQD3+lVmo5Ajnvk6LGjq/b1CZogmqkG4=;
  b=Do3pc94UWBE4htO26TQ4lPYbVoGLms3SvBn2KeYLjd8OOEqRYuuyj3Rr
   tGcctgLoIA8frY9DZOfWtdCODwv/g4jzV0S8Xe8Vrw+9KvFQyauHJpUEy
   gkaXqE3Xq3T96Ze2hUub4mCQ9IjYu/p00oe2aG2T8FMAJ24j+hKfljhCM
   876SIwh6Hx92ojOk6AKWI5zC4YuG8+9OND2dZW5tNPVBFm/gU6/Wdgp+/
   7IEAqP6V+46LgTo6tYt6DJ/5EbSU0S6TaVgaM93or2D3UWpv5ypHo3wVD
   STXta1ZhbGQFz8NRiTMxmQEHfct6X/s4stRnXVe/0fPub3KTRA+H0f5a0
   A==;
X-CSE-ConnectionGUID: kNM75I8xQ9OE1ryC8PaqUw==
X-CSE-MsgGUID: IfynMNp1QzekVZ4ogs8xew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30101449"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30101449"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:17:03 -0700
X-CSE-ConnectionGUID: b8MBSkW3R2+/Ads8lxY7fg==
X-CSE-MsgGUID: 2e/os94KTCyk7okqIlX8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="87219803"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:16:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DCA4C11F9C3;
	Tue, 29 Oct 2024 23:16:55 +0200 (EET)
Date: Tue, 29 Oct 2024 21:16:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: v4l2-subdev: Drop HAS_EVENTS and event
 handlers
Message-ID: <ZyFQx6B6uNepUAoL@kekkonen.localdomain>
References: <20241029162106.3005800-1-tomm.merciai@gmail.com>
 <20241029205849.GH6081@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029205849.GH6081@pendragon.ideasonboard.com>

Hi Tommaso, Laurent,

On Tue, Oct 29, 2024 at 10:58:49PM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> The subject should start with "media: i2c:", not "media: v4l2-subdev:".
> 
> On Tue, Oct 29, 2024 at 05:21:05PM +0100, Tommaso Merciai wrote:
> > v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
> > control handler is set, and subdev_do_ioctl() uses
> > v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
> > as defaults if the subdev doesn't have .(un)subscribe.
> 
> That will be true once patch "[PATCH v2] media: v4l2-subdev: Refactor
> events" gets merged. It's good practice to list dependencies, possibly
> below the --- line (or in a cover letter) if you don't want it to appear
> in the commit message. I also recommend setting the format.useAutoBase
> option to automate recording of the base commit in the patch.

There was some fuzz applying this to the Alvium driver. I've pushed the
result to the devel branch in my git.linuxtv.org tree.

-- 
Regards,

Sakari Ailus


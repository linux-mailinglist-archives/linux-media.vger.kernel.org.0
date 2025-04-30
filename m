Return-Path: <linux-media+bounces-31389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C3AA45A6
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280CA1BA3A8F
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71E02165ED;
	Wed, 30 Apr 2025 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUYuKZ2N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6D21422B;
	Wed, 30 Apr 2025 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002392; cv=none; b=F+27M836lUm3vH1PLJx9MF0atIcDTVxklFg+ZKbBKw2LkqWgCORgZdUxB9MIMWX00jvzNfd05HZfV+MK9ySDWsqqXQ4VcMt4O+a+6sIEa7LMyEiRolgRRsAxWbp5OnXDtoYprEhSMO895JbddCmIEY6Fw1rSTDP84J0FKpi+Y/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002392; c=relaxed/simple;
	bh=yrL3PJoyAn5Ib4dQf9wlJBbzKW+Rlhk9V6kydL7uKHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMa+jGzCoe92euhrIbgJQgkFlmRZFAL6Ym0xrZ6zskIH1FBxKJedbdDzl+SFB9AEjrE/28vXI7xsveOWsMmwfj21TZO1LKlRSLiOWQKJXw7pD8p5LpX6HXZn6KSN+shuFtKc3KyUDbzRW80dpFSBee4CbwntzEe4z82d+6Xtgc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUYuKZ2N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746002390; x=1777538390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yrL3PJoyAn5Ib4dQf9wlJBbzKW+Rlhk9V6kydL7uKHo=;
  b=bUYuKZ2NDoTlrAF385j8Hh+H1vgTrZAR3tWQZ9NDy+utI4tuIyrvZKUg
   grKmmu1Btgn88b2arQUOmgU5V++MPdrBJXJCDGO36SV7FRfNaXlrJkm2E
   s6qoVsVHQ+NOX/f8QP41sab5mAHgN1709vZLwu9c5ShzmdX8NB0d+CYFN
   dH8P73e3/xUt3ibl08PmMgGyLmld5Ao1wmkkl+o2azYGZhnQH3i1eezLY
   GuK3qpH14EyUCAYkwpi6QDSFRkAgcyr4loGgvLYyd4tP4ZNNeglFT4OEl
   nMl4ZZHpaNaJSH6sXjy+fA57O7lkBqdI3aR6PQToZxsRNq7h3MgLRhbpX
   Q==;
X-CSE-ConnectionGUID: v3oajBTKQXaByqQ+VdXPaQ==
X-CSE-MsgGUID: 8pAfoVwWR5mObUtTv+pIsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58310369"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58310369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:39:49 -0700
X-CSE-ConnectionGUID: 1s+sMrZ8TpyW8eoofEEuIQ==
X-CSE-MsgGUID: TbsIuOfkQeyU+Eonh3c9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139177408"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 01:39:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 40AA711F7E7;
	Wed, 30 Apr 2025 11:39:43 +0300 (EEST)
Date: Wed, 30 Apr 2025 08:39:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 9/9] media: i2c: ov9282: add strobe_source v4l2 control
Message-ID: <aBHhz85RVEBrAu56@kekkonen.localdomain>
References: <20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev>
 <20250429-ov9282-flash-strobe-v3-9-2105ce179952@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-ov9282-flash-strobe-v3-9-2105ce179952@linux.dev>

Hi Richard,

On Tue, Apr 29, 2025 at 02:59:14PM +0200, Richard Leitner wrote:
> Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> strobe based on its register settings.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 5ddbfc51586111fbd2e17b739fb3d28bfb0aee1e..34ea903a18dadeeebd497a4a8858abf12b598717 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1367,6 +1367,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
>  	const struct ov9282_mode *mode = ov9282->cur_mode;
>  	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *ctrl;
>  	u32 hblank_min;
>  	u32 lpfr;
>  	int ret;
> @@ -1446,6 +1447,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
>  			  0, 13900, 1, 8);
>  
> +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> +				      V4L2_CID_FLASH_STROBE_SOURCE,
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

Note that v4l2_ctrl_new_std_menu() may return NULL.

> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Sakari Ailus


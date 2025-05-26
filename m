Return-Path: <linux-media+bounces-33412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B372AC446C
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 22:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13B817704A
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 20:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66EC23FC41;
	Mon, 26 May 2025 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys9WgTCc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71444A2D;
	Mon, 26 May 2025 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748291087; cv=none; b=JUsmWHVW2AETHKFV0Xo0K5jQ6JcynpYKRQeJWeKXtjkOYTy7LNNoXF9Vgtk9KsQxbQNnqz4oSiRClYtkvveL1p8zVVILxp2N5/y0V9Qk0+5GEfdAUctZjNOQNLIm/miK6CLXNFILL56v+ikdB5rNsR2+IroC0k4Dn5LcuEQn5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748291087; c=relaxed/simple;
	bh=UGbA0UOJtFBcarurx1bwS7YYbgaQo0zI/HA7rHSSLMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqH+P/lIqTriHKxKFcPimhy61jHkRHU3MJ7cTIgnF5bsp7CyHC1NkftEemMArfclLTTSIFgRgZYH60b41+raG/m6TF8llKj87PYy4TDqFacsJzayTWQdJ7UHR/enRQsdGgvKcun4rAMHZLbnW379Bdj+0ZC+KkOAgjgsvk5PCCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys9WgTCc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748291086; x=1779827086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGbA0UOJtFBcarurx1bwS7YYbgaQo0zI/HA7rHSSLMg=;
  b=Ys9WgTCct03fcAlr8eiAvtcWYFdz6zD/sTtlEJQ6MzI+YdtppeCDjUWU
   zN6KAXpADaPb3nmJ39a4l1EPbnyGrtGbZ7APbEuycygr5+EL9PWFQJfmf
   0b6fOwKTjz00B3lrXYZwcR+b2pjzSELRoI3d0ihEtbt55+H3Chqb/Xx3a
   ycXrrk9vfr7k8yXuNqLpHs9wSQmz/X/0POkg2Uf5SyVkGGbwVOjX1NiCd
   rt4KWyEVgXegDGzCJQCesYhQqdRROzUxogpXpkyILUY685YGbdJTjD809
   SbdjQZ+UY8RMKsSJgljtO6ClVS7Ex3ygsI1SJHslGm3MsoUTijhU84oZB
   Q==;
X-CSE-ConnectionGUID: hAmv2YegR/iCoK4PZFvXIg==
X-CSE-MsgGUID: VXw/lHlKQOedrur2KfKGYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53926347"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="53926347"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:24:46 -0700
X-CSE-ConnectionGUID: DAvYNKGfSrq69SGtJ8qtcg==
X-CSE-MsgGUID: r91yiV3HQn+2YRITYQhGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="147660281"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.33])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 13:24:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1965D11FC38;
	Mon, 26 May 2025 23:24:40 +0300 (EEST)
Date: Mon, 26 May 2025 20:24:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 09/10] media: i2c: ov9282: add strobe_source v4l2
 control
Message-ID: <aDTOCC1wE26Md_Zo@kekkonen.localdomain>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
 <20250507-ov9282-flash-strobe-v4-9-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-ov9282-flash-strobe-v4-9-72b299c1b7c9@linux.dev>

Hi Richard,

On Wed, May 07, 2025 at 09:51:38AM +0200, Richard Leitner wrote:
> Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> strobe based on its register settings.

Is strobe source control relevant for the sensor? It's triggering the flash
but the flash LED isn't connected to it, is it?

> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03..09d522d5977ec6fb82028ddb6015f05c9328191d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1368,11 +1368,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
>  	const struct ov9282_mode *mode = ov9282->cur_mode;
>  	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl *ctrl;
>  	u32 hblank_min;
>  	u32 lpfr;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>  	if (ret)
>  		return ret;
>  
> @@ -1447,6 +1448,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
>  			  0, 13900, 1, 8);
>  
> +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> +				      V4L2_CID_FLASH_STROBE_SOURCE,
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>  	if (!ret) {
>  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 

-- 
Regards,

Sakari Ailus


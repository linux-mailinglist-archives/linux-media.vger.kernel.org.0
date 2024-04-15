Return-Path: <linux-media+bounces-9344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106748A4DD2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A45C1C2225C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C245FDA5;
	Mon, 15 Apr 2024 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUhivOYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB915D471
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713180980; cv=none; b=lr0HDxXKRiZxyfaaglP/MqCXFkCL73NTT5OzgkDW14dGZfeLwvUtuMAIJPR/gYf1zeTFIVvfKhMzZcj9G7QNwL7EnAMeieATn14aqp4UR2liobI7mM0qH/AudvHR3/nkAT1/ToBP6PsLzWNTuFj9PbttD+WcWBXRWWWBy2YL5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713180980; c=relaxed/simple;
	bh=R6TnkRvP/24ydatFRhBgEf9d4XVxTaYh6Fwf5PtBmP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6kHyKRTebyD6qKi9bVOyUOMcZwL+q3L/s8KaKSztC+UmFEGgxGHpbPD1Zqlef7pGS4WmA+HwwCqTsRT3Q5JJfaPZu2+mWPZSNDdI2sYzY4Q1h3BWlsnJ1VtGAXKgiyP9ORG7/6Kl6GxPXWPsZOdgNZLve7H3pt588Mpjo3KSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUhivOYn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713180979; x=1744716979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6TnkRvP/24ydatFRhBgEf9d4XVxTaYh6Fwf5PtBmP4=;
  b=gUhivOYnPilioqd10xNUfYG4oCwqA2Nede8NiMU3xx6swgeDGpLymHUk
   kQVmKKNED+htijy+YH0bBlyP9fR1hAIqo28fLhUTd6y3dxeB9wBD+1XAV
   RjFdAqPphJs2/8nZi64N1vJoOqcvK2vFR0eeqVkTYAa2od1tCfAKYKLYS
   OsumlMiPRWsS8/DpbaHg4EXvSrqooPmNcohvHff5VVCf2bXgSIQ1BpRRW
   g2tBuFOwBvzMi2zd1QbO7+uGjE6z7b/fS28N9DJIjbl7l1puxHjspvhUS
   8VmfkxS400jQOqq6LxYA1/U/+Hk78/DKTyG07vAFPMvBYmIr355jx5hD+
   g==;
X-CSE-ConnectionGUID: 3uUOAQFzRsmfMoWEhS0OOg==
X-CSE-MsgGUID: 8GxOMhAGRd2jGeTUPU78BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8734613"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8734613"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:36:18 -0700
X-CSE-ConnectionGUID: QdjxcAnmTZ2SizLP4A4Uvg==
X-CSE-MsgGUID: sxqaCUlFSSyzSsuB+3TZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="21958553"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 04:36:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 77FC911F8AF;
	Mon, 15 Apr 2024 14:36:13 +0300 (EEST)
Date: Mon, 15 Apr 2024 11:36:13 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH resend 5/5] media: ov2680: Add camera orientation and
 sensor rotation controls
Message-ID: <Zh0RLfbfckkKLdrD@kekkonen.localdomain>
References: <20240415093704.208175-1-hdegoede@redhat.com>
 <20240415093704.208175-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415093704.208175-6-hdegoede@redhat.com>

Hi Hans,

On Mon, Apr 15, 2024 at 11:37:04AM +0200, Hans de Goede wrote:
> Add camera orientation and sensor rotation controls using
> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> helpers.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 14a5ac2bbf8b..840e6b63ad19 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	struct v4l2_fwnode_device_properties props;
>  	int def, max, ret = 0;
>  
>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
> @@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>  		goto cleanup_entity;
>  	}
>  
> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> +	if (ret)
> +		goto cleanup_entity;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> +	if (ret)
> +		goto cleanup_entity;

As discussed with Umang recently, you can postpone
v4l2_ctrl_new_fwnode_properties() error check until the control handler. Up
to you.

> +
>  	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

-- 
Regards,

Sakari Ailus


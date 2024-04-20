Return-Path: <linux-media+bounces-9810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43B8ABAD2
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85C99281C94
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE24E175AD;
	Sat, 20 Apr 2024 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dnd/lXW1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810614F65
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713606230; cv=none; b=Nk7qbxhHrp3+92a45c3biNpmBh0/+jD2jxF0GU8ATvv+LjnCAkT+s40AQyXRunYOMRZUSq09TgrxaQsBI2qLsGSr6c+k/j6l/T8tEMaz+hIDCO7iM6fSYtaT83DZn61cu4nApt+RVpG0HEzzTe3QrdQJAwCwEWG9+Kb6LRqgIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713606230; c=relaxed/simple;
	bh=Dsns1qXuD3S22x6Rn2aakrRLX6asOZPE0yo1Wa7luMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2bGdh/3x39sIls0J7aEggB8ZUxkscmJ7FImiQThTgbA6VYpwyOwZ1qbGUg8PQtBzsGBC6iT0O0l3XCE9vEJil8ihGWV+N5GyQF88Sen3uIzfWMd4NU3n9JQFzxGrmRNcXKyDG9MXvUAu8okKxjGSmlZLQBQMr53H3OnD/Jnj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dnd/lXW1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8297555;
	Sat, 20 Apr 2024 11:42:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713606178;
	bh=Dsns1qXuD3S22x6Rn2aakrRLX6asOZPE0yo1Wa7luMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnd/lXW1sFvAsCyWhRIcoH1TrJKesPo3BGLm1jjU1A3P5+vwhSiTMXXeisXEO8CcH
	 ZoDBaCuD5wCaGoXMnnC6nYCTO85puEgW5VIqTKGKfV71NMXmEpnjbs+qGuqCfY/RG5
	 Iu9pp+MEjjIzSrdFR1K0177ctgnRqpAW2cUGFJWw=
Date: Sat, 20 Apr 2024 12:43:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 43/46] media: ov2740: Add support for G_SELECTION IOCTL
Message-ID: <20240420094338.GB6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-44-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-44-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:16PM +0300, Sakari Ailus wrote:
> Add support for the G_SELECTION IOCTL in the ov2740 driver.

We need to first define and document how G_SELECTION should behave for
raw sensors.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index e37d824291fe..6e355e986b88 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -23,6 +23,11 @@
>  #define OV2740_DATA_LANES		2
>  #define OV2740_RGB_DEPTH		10
>  
> +#define OV2740_DUMMY_LINES_PRE		8U
> +#define OV2740_DUMMY_LINES_POST		8U
> +#define OV2740_ACTIVE_WIDTH		1932U
> +#define OV2740_ACTIVE_HEIGHT		1092U
> +
>  #define OV2740_REG_CHIP_ID		0x300a
>  #define OV2740_CHIP_ID			0x2740
>  
> @@ -1114,6 +1119,31 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
>  				   fmt->pad, fmt->stream);
>  }
>  
> +static int ov2740_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = OV2740_ACTIVE_WIDTH;
> +		sel->r.height = OV2740_DUMMY_LINES_PRE + OV2740_ACTIVE_HEIGHT +
> +			OV2740_DUMMY_LINES_POST;
> +		return 0;
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = OV2740_DUMMY_LINES_PRE;
> +		sel->r.left = 0;
> +		sel->r.width = OV2740_ACTIVE_WIDTH;
> +		sel->r.height = OV2740_ACTIVE_HEIGHT;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -1222,6 +1252,7 @@ static const struct v4l2_subdev_video_ops ov2740_video_ops = {
>  static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ov2740_set_format,
> +	.get_selection = ov2740_get_selection,
>  	.enum_mbus_code = ov2740_enum_mbus_code,
>  	.enum_frame_size = ov2740_enum_frame_size,
>  	.enable_streams = ov2740_enable_streams,

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-22530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DC9E1B11
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 12:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F18A9B354B8
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B832E3EE;
	Tue,  3 Dec 2024 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kTTvmlxV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41761E3DE7
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224801; cv=none; b=jblxeHB73m91r0SgAwW4j/CUSjkuu7d3XfoWhnuAV4PmgRGT3HmoehZ0ABA9FE1KW4+6CVA1KOazaGtqevk5wnKnilBCkWmAxVV3JyueHXTtjxpS6Pg43Ukl9OFENpFYwQGKm1oIbZvVmwlgEnuxH0PJs8CrKKRHr7J4+/TNVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224801; c=relaxed/simple;
	bh=xhtkNsYgqfFRDYFUwJihGTe8U5ArcnTTqz9EApx+afQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1YvX78WB0fQ/i2JgXZQqrOAto06IphH4XtWiMlhVlmQJc8N1ONgDSHuXrsQTtmeb7vbdibAC0mze97mE+/KCBgMsbCahLH+oMU+gJkIyWEwS7NYku5LsBu1RG3dHw9jWgjABhMHRGWugVY/Jmlm0cRc+H7eAz8AN+ANw3da+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kTTvmlxV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D4F24CE;
	Tue,  3 Dec 2024 12:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733224769;
	bh=xhtkNsYgqfFRDYFUwJihGTe8U5ArcnTTqz9EApx+afQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTTvmlxVg/gBHBg+I3jMUW0Ppq/PmFY4d2AU/Mce6Ytbd16pbtIzPPmrYRVyZPV+z
	 6hWrtH4lpJqa55dvJ2M6b7q/5SxC0fSXVvLFXPWxqB7VGMYYtiCaq53FTgjSeIKpzm
	 4oQcqZnA852FZ6/L+kZOZA4IQ/go7qYVB0FwTEzs=
Date: Tue, 3 Dec 2024 13:19:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, isaac.scott@ideasonboard.com
Subject: Re: [PATCH v3 4/5] media: rzg2l-cru: Support multiple mbus codes per
 pixel format
Message-ID: <20241203111945.GQ10736@pendragon.ideasonboard.com>
References: <20241202145831.127297-1-dan.scally@ideasonboard.com>
 <20241202145831.127297-5-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202145831.127297-5-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Mon, Dec 02, 2024 at 02:58:30PM +0000, Daniel Scally wrote:
> As a preliminary step for supporting the CRU pixel formats, extend
> the driver such that multiple media bus codes can support each of
> the output pixel formats.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes in v3:
> 
> 	- New patch due to changes to patch 1
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 67 +++++++++++++++----
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  2 +-
>  3 files changed, 61 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index aaf85054f8842..ab923bfa3becf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -71,7 +71,11 @@ struct rzg2l_cru_ip {
>   * @yuv: Flag to indicate whether the format is YUV-based.
>   */
>  struct rzg2l_cru_ip_format {
> -	u32 code;
> +	/*
> +	 * RAW output formats might be produced by RAW media codes with any one
> +	 * of the 4 common bayer patterns.
> +	 */
> +	u32 codes[4];
>  	u32 datatype;
>  	u32 format;
>  	u32 icndmr;
> @@ -169,5 +173,7 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
> +					 unsigned int code);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 399a337dbafbf..54a79d5c13e10 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -13,35 +13,45 @@
>  
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  	{
> -		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.codes = {
> +			MEDIA_BUS_FMT_UYVY8_1X16,
> +		},
>  		.datatype = MIPI_CSI2_DT_YUV422_8B,
>  		.format = V4L2_PIX_FMT_UYVY,
>  		.icndmr = ICnDMR_YCMODE_UYVY,
>  		.yuv = true,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.codes = {
> +			MEDIA_BUS_FMT_SBGGR8_1X8,
> +		},
>  		.format = V4L2_PIX_FMT_SBGGR8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.icndmr = 0,
>  		.yuv = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.codes = {
> +			MEDIA_BUS_FMT_SGBRG8_1X8,
> +		},
>  		.format = V4L2_PIX_FMT_SGBRG8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.icndmr = 0,
>  		.yuv = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.codes = {
> +			MEDIA_BUS_FMT_SGRBG8_1X8,
> +		},
>  		.format = V4L2_PIX_FMT_SGRBG8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.icndmr = 0,
>  		.yuv = false,
>  	},
>  	{
> -		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.codes = {
> +			MEDIA_BUS_FMT_SRGGB8_1X8,
> +		},
>  		.format = V4L2_PIX_FMT_SRGGB8,
>  		.datatype = MIPI_CSI2_DT_RAW8,
>  		.icndmr = 0,
> @@ -51,11 +61,14 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
>  
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  {
> -	unsigned int i;
> +	unsigned int i, j;
>  
> -	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> -		if (rzg2l_cru_ip_formats[i].code == code)
> -			return &rzg2l_cru_ip_formats[i];
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +		for (j = 0; j < ARRAY_SIZE(rzg2l_cru_ip_formats[i].codes); j++) {
> +			if (rzg2l_cru_ip_formats[i].codes[j] == code)
> +				return &rzg2l_cru_ip_formats[i];
> +		}
> +	}
>  
>  	return NULL;
>  }
> @@ -80,6 +93,17 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index)
>  	return &rzg2l_cru_ip_formats[index];
>  }
>  
> +bool rzg2l_cru_ip_fmt_supports_mbus_code(const struct rzg2l_cru_ip_format *fmt,
> +					 unsigned int code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(fmt->codes); i++)
> +		if (fmt->codes[i] == code)
> +			return true;
> +
> +	return false;
> +}
>  struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_subdev_state *state;
> @@ -155,7 +179,7 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
>  	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
>  
>  	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
> -		sink_format->code = rzg2l_cru_ip_formats[0].code;
> +		sink_format->code = rzg2l_cru_ip_formats[0].codes[0];
>  	else
>  		sink_format->code = fmt->format.code;
>  
> @@ -181,11 +205,26 @@ static int rzg2l_cru_ip_enum_mbus_code(struct v4l2_subdev *sd,
>  				       struct v4l2_subdev_state *state,
>  				       struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))
> -		return -EINVAL;
> +	unsigned int index = code->index;
> +	unsigned int i, j;
>  
> -	code->code = rzg2l_cru_ip_formats[code->index].code;
> -	return 0;
> +	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++) {
> +		const struct rzg2l_cru_ip_format *fmt = &rzg2l_cru_ip_formats[i];
> +
> +		for (j = 0; j < ARRAY_SIZE(fmt->codes); j++) {
> +			if (!fmt->codes[j])
> +				continue;
> +
> +			if (!index) {
> +				code->code = fmt->codes[j];
> +				return 0;
> +			}
> +
> +			index--;
> +		}
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 028b390488c84..57d1ff45ce1e9 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -891,7 +891,7 @@ static int rzg2l_cru_video_link_validate(struct media_link *link)
>  	if (fmt.format.width != cru->format.width ||
>  	    fmt.format.height != cru->format.height ||
>  	    fmt.format.field != cru->format.field ||
> -	    video_fmt->code != fmt.format.code)
> +	    !rzg2l_cru_ip_fmt_supports_mbus_code(video_fmt, fmt.format.code))
>  		return -EPIPE;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart


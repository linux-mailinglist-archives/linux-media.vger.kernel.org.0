Return-Path: <linux-media+bounces-13336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0E90A0AC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936C21F21C05
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36DE73452;
	Sun, 16 Jun 2024 23:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lT0WuZ3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5410A19;
	Sun, 16 Jun 2024 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579038; cv=none; b=bAKByhLNd0oFHz5tn85HwgmZjy3oVw05vULe6t33urbKNbTJTuNTO9JuptfWHmQ6mxYKlauESCsZ73uLDVo2lH2cLULgmmZ1sSj6HtgqIBUWDxgfAEQsofMeXFKHIGnmLhXG0Q9XbQBK3t8RYsOcYHSaEyeodLHhYNsw7ujgZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579038; c=relaxed/simple;
	bh=oQzr9+5Ekgj/QPFxw9JhHPcdVT7ZkzWo43ZVQtwdEdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMN5sBj/4aYqOSjc4LvMPB4sQt/RY3wAyfgt6RClWN8qj90fRfTbtGbVBGBrpUKQTRubITK8BVJxyr/RZwUYIInUC++t6elLfMP/LmXLLxv1gehUkyrJ0/ZO/FbnUNVSewDXPgKgFrfcQ+/UsHAjjdTjiPm6hDE0WvPAm1zl33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lT0WuZ3Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C3E92D5;
	Mon, 17 Jun 2024 01:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579018;
	bh=oQzr9+5Ekgj/QPFxw9JhHPcdVT7ZkzWo43ZVQtwdEdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lT0WuZ3QLqD03DKpiC+d9W6bYQ2IoRnYHAAEz9v0SLTxodz6wa8tVYWgDcBj8CYYS
	 IJeekIZjwmTHftvCkxVJ9c2ShE6UI291ojHAznpVZoj38WkjVRrJf0Zuudzkzod6ML
	 sVZOqjTxxfpUgPWbtjzdubuJSO/nL337rGMw6VYE=
Date: Mon, 17 Jun 2024 02:03:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] media: uvcvideo: Refactor Power Line Frequency
 limit selection
Message-ID: <20240616230333.GA4782@pendragon.ideasonboard.com>
References: <20240610-billion-v2-0-38e861475f85@chromium.org>
 <20240610-billion-v2-2-38e861475f85@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-billion-v2-2-38e861475f85@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 11:09:53PM +0000, Ricardo Ribalda wrote:
> Move the PLF mapping logic to its own function. This patch does not
> introduce any new functionality to the logic, it is just a preparation
> patch.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 93 ++++++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44ec185a8c8b..d82cfc56dfd5 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -459,6 +459,56 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>  	data[first+1] = min_t(int, abs(value), 0xff);
>  }
>  
> +const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> +	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> +	.entity		= UVC_GUID_UVC_PROCESSING,
> +	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> +	.size		= 2,
> +	.offset		= 0,
> +	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> +	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> +	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
> +				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
> +};
> +
> +const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
> +	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> +	.entity		= UVC_GUID_UVC_PROCESSING,
> +	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> +	.size		= 2,
> +	.offset		= 0,
> +	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> +	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> +	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
> +				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
> +};
> +
> +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
> +	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> +	.entity		= UVC_GUID_UVC_PROCESSING,
> +	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> +	.size		= 2,
> +	.offset		= 0,
> +	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> +	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> +	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
> +				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
> +};
> +
> +static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> +	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
> +
> +static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
> +	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> +{
> +	if (chain->dev->uvc_version < 0x150)
> +		return __uvc_ctrl_add_mapping(chain, ctrl,
> +					      &uvc_ctrl_power_line_mapping_uvc11);
> +
> +	return __uvc_ctrl_add_mapping(chain, ctrl,
> +				      &uvc_ctrl_power_line_mapping_uvc15);
> +}
> +
>  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  	{
>  		.id		= V4L2_CID_BRIGHTNESS,
> @@ -748,51 +798,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> -};
> -
> -const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> -	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> -	.entity		= UVC_GUID_UVC_PROCESSING,
> -	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> -	.offset		= 0,
> -	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> -	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> -	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
> -				  V4L2_CID_POWER_LINE_FREQUENCY_50HZ),
> -};
> -
> -const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc11 = {
> -	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> -	.entity		= UVC_GUID_UVC_PROCESSING,
> -	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> -	.offset		= 0,
> -	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> -	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> -	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_60HZ,
> -				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
> +	{
> +		.entity		= UVC_GUID_UVC_PROCESSING,
> +		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> +		.add_mapping	= uvc_ctrl_add_plf_mapping,
> +	},
>  };
>  
>  static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc11[] = {
> -	&uvc_ctrl_power_line_mapping_uvc11,
>  	NULL, /* Sentinel */
>  };
>  
> -static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
> -	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
> -	.entity		= UVC_GUID_UVC_PROCESSING,
> -	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> -	.size		= 2,
> -	.offset		= 0,
> -	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
> -	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
> -	.menu_mask	= GENMASK(V4L2_CID_POWER_LINE_FREQUENCY_AUTO,
> -				  V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
> -};
> -
>  static const struct uvc_control_mapping *uvc_ctrl_mappings_uvc15[] = {
> -	&uvc_ctrl_power_line_mapping_uvc15,
>  	NULL, /* Sentinel */
>  };
>  

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-12873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DC90258C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C76191F2100F
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC48214EC73;
	Mon, 10 Jun 2024 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j/XNjI2G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8E14EC47;
	Mon, 10 Jun 2024 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032871; cv=none; b=CysUMU/1OYqtkwmd1SSpFvc5/2xL3rYRXm5hEojTlAfQIf52qHPsrdl0JDvFQnHuPOXwvEChDY/naJ6p2Yru/+dzzc2DskEDPWMClA9enW1gqji37WjENSBWlniQ0T4cFZldW7GpEOxZ/boprVr2Za+/La6Ija9DedpNjgIil08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032871; c=relaxed/simple;
	bh=I95YfeR4z6uaBo8ShVWAd+z5U0ONBdc/Mf/dNEVoGb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHlCB1E4b4UaNLXQI9cMZp/hhUZP3iQYxPvh9tp7MqFUhEoCwlJha+f/3GKYFqIxYLfSv7eTeYYfWDRbT3mIopIXF+itqvNFtfR2hukcNyRGIkMUXCZ/B1JNPraKIDBOdv22uN576tlyslF7hYdnrFzB+FCIDJLWB/MsPnLO/eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j/XNjI2G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1FF239F;
	Mon, 10 Jun 2024 17:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718032854;
	bh=I95YfeR4z6uaBo8ShVWAd+z5U0ONBdc/Mf/dNEVoGb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/XNjI2GGs5Z/9LaKhn1e+/ugW9C4MVTBR4qApHE+MgdWHq09l2hJyRxVnbxviE8j
	 uRSrD6FXWV99GtmGdh13jaUrkNlgRvWgcf8mIcMJt4h59gDO3f/YT+wZ+yf9jYrU6z
	 i8XZQBJnOakj1O0KTeWgw2A7ExpTa0pYiDb+YqwM=
Date: Mon, 10 Jun 2024 18:20:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: uvcvideo: Refactor Power Line Frequency limit
 selection
Message-ID: <20240610152046.GJ26663@pendragon.ideasonboard.com>
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-2-2f7bc0ee2030@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318-billion-v1-2-2f7bc0ee2030@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:55:24PM +0000, Ricardo Ribalda wrote:
> Move the PLF mapping logic to its own function. This patch does not
> introduce any new functionality to the logic, it is just a preparation
> patch.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 93 ++++++++++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 3e939b4fbaaaf..67522143c6c85 100644
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

I wonder if we could avoid the forward declaration by turning the
.add_mapping() operation into a .filter_mapping() (name to be
bikshedded) that would return a replacement mapping instead of adding
it. The caller (the __uvc_ctrl_add_custom_mapping() function) would then
call __uvc_ctrl_add_mapping() unconditionally. You could actually call
the new operation directly in __uvc_ctrl_add_custom_mapping() without
having to add a new __uvc_ctrl_add_custom_mapping() function. What do
you think, would that be simpler and more redable ?

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


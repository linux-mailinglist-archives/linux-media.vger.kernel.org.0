Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36002A636C
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgKDLiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbgKDLiS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:38:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07151C0613D3;
        Wed,  4 Nov 2020 03:38:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60A50563;
        Wed,  4 Nov 2020 12:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604489896;
        bh=pEQzNBUxGPc25cbcL4wjrjMrKAPMzXaQ8Y5lD+VVScE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wmzvU9F+suYRMfVRVUGMVU1SdZtT0rvLgGZooQhF3pyQSzdVNhStiM4LkfedeS+B/
         a+c4knXJyh9xwdTDLX2izXN/9iuc2TPmW18aDYonnPExxglK3DkOimPdv/5QwpF0uE
         2uNGM2mzs7RVQ/PEXu59I2nYgTSaRutQbgNW7QLI=
Date:   Wed, 4 Nov 2020 13:37:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH 4/6] media: uvcvideo: Add Privacy control based on
 EXT_GPIO
Message-ID: <20201104113729.GJ26171@pendragon.ideasonboard.com>
References: <20201022133753.310506-1-ribalda@chromium.org>
 <20201022133753.310506-5-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201022133753.310506-5-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Oct 22, 2020 at 03:37:51PM +0200, Ricardo Ribalda wrote:
> Add a new control and mapping for Privacy controls connected to
> UVC_GUID_EXT_GPIO_CONTROLLERs.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 20 ++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h |  2 +-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 913739915863..786498e66646 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -347,6 +347,16 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  				| UVC_CTRL_FLAG_RESTORE
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	{
> +		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
> +		.selector	= UVC_CT_PRIVACY_CONTROL,
> +		.index		= 0,
> +		.size		= 1,
> +		.flags		= UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_AUTO_UPDATE
> +				| UVC_CTRL_FLAG_ENTITY_GET_INFO
> +				| UVC_CTRL_FLAG_ENTITY_GET_CUR,
> +	},
>  };
>  
>  static const struct uvc_menu_info power_line_frequency_controls[] = {
> @@ -735,6 +745,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>  		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
>  		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
>  	},
> +	{
> +		.id		= V4L2_CID_PRIVACY,
> +		.name		= "Privacy",
> +		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
> +		.selector	= UVC_CT_PRIVACY_CONTROL,
> +		.size		= 1,
> +		.offset		= 0,
> +		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
> +		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
> +	},
>  };
>  
>  /* ------------------------------------------------------------------------
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 8e5a9fc35820..a493bc383d3e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -58,7 +58,7 @@
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02}
>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
>  	{0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf, \
> -	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}
> +	 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x01}

This belongs to the previous patch.

>  
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \

-- 
Regards,

Laurent Pinchart

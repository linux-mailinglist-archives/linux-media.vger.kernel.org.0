Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829162DF629
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 17:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgLTQ4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 11:56:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50586 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgLTQ4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 11:56:14 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A88202CF;
        Sun, 20 Dec 2020 17:55:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608483332;
        bh=T1JdTctvTUXQISdbX9BX67WYHtL9aq0Jtfgvp/4pSX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g8XzQFugpqQ90iWyQSPTnIm/U0OBwg4lSpmbpI9HVMhxZJQ6BT8QHKj6oI09dQGUz
         aA79SBjpDm80SRevYa8CRcdBL5ORny/tsBTKepghKUWzoVJ9iEjqZGWvCxAQPVPhZK
         YO8k9P2PimS+CyMOOyrfOfMvsMH5+UX6Gza3csjs=
Date:   Sun, 20 Dec 2020 18:55:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/9] media: uvcvideo: Add Privacy control based on
 EXT_GPIO
Message-ID: <X9+B/ShcGjjCY9PC@pendragon.ideasonboard.com>
References: <20201215154439.69062-1-ribalda@chromium.org>
 <20201215154439.69062-7-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201215154439.69062-7-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 15, 2020 at 04:44:36PM +0100, Ricardo Ribalda wrote:
> Add a new control and mapping for Privacy controls connected to
> UVC_GUID_EXT_GPIO_CONTROLLERs.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 53da1d984883..511927e8b746 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -347,6 +347,14 @@ static const struct uvc_control_info uvc_ctrls[] = {
>  				| UVC_CTRL_FLAG_RESTORE
>  				| UVC_CTRL_FLAG_AUTO_UPDATE,
>  	},
> +	{
> +		.entity		= UVC_GUID_EXT_GPIO_CONTROLLER,
> +		.selector	= UVC_CT_PRIVACY_CONTROL,
> +		.index		= 0,
> +		.size		= 1,
> +		.flags		= UVC_CTRL_FLAG_GET_CUR
> +				| UVC_CTRL_FLAG_AUTO_UPDATE,
> +	},
>  };
>  
>  static const struct uvc_menu_info power_line_frequency_controls[] = {
> @@ -735,6 +743,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
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

-- 
Regards,

Laurent Pinchart

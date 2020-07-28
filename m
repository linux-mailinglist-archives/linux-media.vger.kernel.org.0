Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01B2231366
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 22:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgG1UBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 16:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgG1UBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 16:01:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B631C061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 13:01:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 906C9563;
        Tue, 28 Jul 2020 22:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595966510;
        bh=fXLWGnBP54MtVe+7MZPfG4krSWDwTgopmTnbBSTxXAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RL81/5G2Fts8gbJ8jREZxJW788dissfV/cWaofLuEu2mzexyXriCXRv3HJ39LWbOV
         jtrbrq/9peTv0heGepPfXT7KESDwPM2fRMk5mFhhKtXwQxImHnoLS8nB/elPNUKHsz
         g6e8hpLgKWUFhNbNkSL05vynXfM7dCdk1pcOpFh0=
Date:   Tue, 28 Jul 2020 23:01:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Cleanup uvc_ctrl_add_info()
 error handling
Message-ID: <20200728200141.GP13753@pendragon.ideasonboard.com>
References: <20200728112209.26207-1-hdegoede@redhat.com>
 <20200728112209.26207-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728112209.26207-2-hdegoede@redhat.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jul 28, 2020 at 01:22:09PM +0200, Hans de Goede wrote:
> There is only 1 error exit in uvc_ctrl_add_info(), so using goto style
> error handling is not necessary. Also the kfree(ctrl->uvc_data) on error
> is not necessary, because the only error exit is for the kzalloc() of
> ctrl->uvc_data failing.
> 
> Remove all the error handling cruft and simply do "return -ENOMEM" on
> kzalloc() failure.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - new patch in v2 of this series
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index b78aba991212..dbebc6083e85 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2011,18 +2011,14 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  	const struct uvc_control_info *info)
>  {
> -	int ret = 0;
> -
>  	ctrl->info = *info;
>  	INIT_LIST_HEAD(&ctrl->info.mappings);
>  
>  	/* Allocate an array to save control values (cur, def, max, etc.) */
>  	ctrl->uvc_data = kzalloc(ctrl->info.size * UVC_CTRL_DATA_LAST + 1,
>  				 GFP_KERNEL);
> -	if (ctrl->uvc_data == NULL) {
> -		ret = -ENOMEM;
> -		goto done;
> -	}
> +	if (!ctrl->uvc_data)
> +		return -ENOMEM;
>  
>  	ctrl->initialized = 1;
>  
> @@ -2030,10 +2026,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>  		"entity %u\n", ctrl->info.entity, ctrl->info.selector,
>  		dev->udev->devpath, ctrl->entity->id);
>  
> -done:
> -	if (ret < 0)
> -		kfree(ctrl->uvc_data);
> -	return ret;
> +	return 0;
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

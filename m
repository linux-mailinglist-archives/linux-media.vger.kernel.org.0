Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E37724A0A5
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgHSNwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:52:49 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:47719 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727773AbgHSNwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:52:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8OW8kd7KUuuXO8OWAkhNrT; Wed, 19 Aug 2020 15:52:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597845162; bh=S/1eF/z/kxWJPuHz7Azo9yGJbLE4i6USiGn52JbBhQ8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lq+oDqnDj1m1TL8ecDhwJeaerWudIm6F8zwo1pKBlTEmosCkfDI5sYqCplE6WAm9i
         Tke/22HaRqA1hgHUzBWB5mGzSJTo2mmGPiEMpYeH+aGaB2z0aSq0mX+AOaShuBspKh
         yLnXIB1gPDDmt4i41dKl7eAAmrZHbkr8mePksRBIlsqTPjGVmOiuzaRe42xme1+V9t
         HyhE1CAuBVXeSvQqWCxnjbXFEz6ENA93W+nDvGhmkxnRYENaggGfrbj8VVsgqLcdpw
         INR9w0CyMl9JSPbzPFA6wATkNwJyVKulJy2wv49QD0ub6dOscPhW7Qo07XHJNn5VI3
         jyGtlnyNtLDkw==
Subject: Re: [PATCH 1/2] media: stm32-dcmi: create video dev within notifier
 bound
To:     Alain Volmat <alain.volmat@st.com>, hugues.fruchet@st.com,
        mchehab@kernel.org
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        yannick.fertre@st.com, hans.verkuil@cisco.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-2-git-send-email-alain.volmat@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <31ca9ccc-77d4-4368-1024-db70e8e1e7f2@xs4all.nl>
Date:   Wed, 19 Aug 2020 15:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595918278-9724-2-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEsrBXZOL/+O/UJgbLIac3a9mevUaGD8wdOuFN+0W9g/XWTkEyKbA09IgeextnTDSnp15fC//++Z9wrKcIDY5fSQ+gOOF8Pe380Fj1W3gVkcaNF1ZFJ6
 kr58YhrhHMycmH5+PinH9L3rDjPjCksN2rLJY5pbl/IUTzpGFgx2oFwhuJabvvTtyN6ZM3i3ERlYx89csQMzigkKVe5t13ZJGdrvfyjZ1p+HV5gW15IrDtua
 rmTCKtx4tfT0zb3WPkRb90S5YiFHK+ClhvmtfUL7aTNrGcnb3cw81OtuWIAt5DCR3XxaHQgG7WStfA7s6kSRikj7CmkPbsEa9/EXQUjChIbD9L221uNbi/Hi
 +EW7MVGSQwDEKlIW7pY3f8lVCXF5NHBMrijN6x/NeWDBwjojAtHlDLZ6XyoCInE3tG0OWFBKtCBPgmnTPxdu/B/a5821t25ganGw0WbSoZoK8YDSXpF0kUQC
 W0SfMKZvKKfP6GFo+CsWnwDzC7HX1vzi8sbyv3BKCoq6bp39JRxa0kVkCTBWh6kBijxksGdi+aXaoh1HIu3Iq9ZKtLfz5gAZk3GOHigwtalS5WTaykJsjkKq
 671eIh2b23FkIeAhWPc099igA6CxvhFYhyBD/iDrCYavbbCTUmmqMeHE7zqQ24S0s+4sChLJ0C3SnVaO9jz8oFw9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2020 08:37, Alain Volmat wrote:
> In case of an error during the initialization of the sensor,
> the video device is still available since created at the
> probe of the dcmi driver. Moreover the device wouldn't
> be released even when removing the module since the release
> is performed as part of the notifier unbind callback
> (not called if no sensor is properly initialized).
> 
> This patch move the video device creation with the v4l2 notifier
> bound handler in order to avoid having a video device created when
> an error happen during the pipe (dcmi - sensor) initialization.
> 
> This also makes the video device creation symmetric with the
> release which is already done within the notifier unbind handler.
> 
> Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..5e60d4c6eeeb 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1747,6 +1747,15 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  
>  	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
>  
> +	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Failed to register video device\n");
> +		return ret;
> +	}

Why in the bound callback? The video device is typically created in the complete
callback, since that's the point where everything is ready.

You should not create a video device unless it is ready for use, and that's only
valid at the end of the complete callback.

Regards,

	Hans

> +
> +	dev_dbg(dcmi->dev, "Device registered as %s\n",
> +		video_device_node_name(dcmi->vdev));
> +
>  	/*
>  	 * Link this sub-device to DCMI, it could be
>  	 * a parallel camera sensor or a bridge
> @@ -1759,10 +1768,11 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  				    &dcmi->vdev->entity, 0,
>  				    MEDIA_LNK_FL_IMMUTABLE |
>  				    MEDIA_LNK_FL_ENABLED);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
>  			subdev->name);
> -	else
> +		video_unregister_device(dcmi->vdev);
> +	} else
>  		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
>  			subdev->name);
>  
> @@ -1974,15 +1984,6 @@ static int dcmi_probe(struct platform_device *pdev)
>  	}
>  	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
>  
> -	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret) {
> -		dev_err(dcmi->dev, "Failed to register video device\n");
> -		goto err_media_entity_cleanup;
> -	}
> -
> -	dev_dbg(dcmi->dev, "Device registered as %s\n",
> -		video_device_node_name(dcmi->vdev));
> -
>  	/* Buffer queue */
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
> 


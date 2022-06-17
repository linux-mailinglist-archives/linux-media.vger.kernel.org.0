Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2034554F543
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381209AbiFQKVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380211AbiFQKVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:21:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DAC6A410
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:21:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11C3D2A5;
        Fri, 17 Jun 2022 12:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655461305;
        bh=rYGcZb4Di7HFZpEYzbZFghSNtJzESkHWivz+zbzq8PA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UtPDJ/NS6pdq+R9qBzyoK+MAXp8/N1sUFD65CTa2+ym7Oi96XtmmeK3f6j463v3ab
         REMvITN1SrPZ1ZcJ6gmhiHmDaE+wZprOiJ4BTNtLXlOF+5JzPWzNcP1Rr6bwtyB6ji
         uCf8h9GOQQWdPfcJi859CoFwmx4rYS3rLNi3WjbI=
Date:   Fri, 17 Jun 2022 13:21:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: uvcvideo: remove unneeded goto
Message-ID: <YqxVrOHlnI1QkhnY@pendragon.ideasonboard.com>
References: <20220616195454.2983249-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616195454.2983249-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jun 16, 2022 at 09:54:54PM +0200, Michael Grzeschik wrote:
> The goto statement in uvc_v4l2_try_format can simply be replaced by an
> direct return. There is no further user of the label, so remove it.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

With s/usb: /media: / in the subject line,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll fix this when applying.

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 26cf0517e36195..957f44f44a9a14 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -254,7 +254,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	ret = uvc_probe_video(stream, probe);
>  	mutex_unlock(&stream->mutex);
>  	if (ret < 0)
> -		goto done;
> +		return ret;
>  
>  	/* After the probe, update fmt with the values returned from
>  	 * negotiation with the device. Some devices return invalid bFormatIndex
> @@ -300,7 +300,6 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	if (uvc_frame != NULL)
>  		*uvc_frame = frame;
>  
> -done:
>  	return ret;
>  }
>  

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8338254F2BA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 10:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380867AbiFQIVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 04:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380869AbiFQIVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 04:21:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06E668336
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 01:21:02 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 340342A5;
        Fri, 17 Jun 2022 10:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655454060;
        bh=+VfLDfgdbJg9FmTJT5xFY/6z/0MKIDkW/3sdg8X1Epo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S8ObXOc3XDmMDWILzLYMQR1dR+pG6+qrKLQyU8bbSetd0k73fASZDYm5I1COeKG6i
         e3YAmtsPth3jDuKY4MUhbDiFgVh7cSSAlJ5o4fqNWmJXd7+8P46z20FNkbwjXBd3Tt
         MZbt43ob/nc7JM1bhwAJldqDJQXZe93zbqF2j/lY=
Date:   Fri, 17 Jun 2022 17:20:54 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: uvcvideo: remove unneeded goto
Message-ID: <20220617082054.GA3309559@pyrite.rasen.tech>
References: <20220616195454.2983249-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Thu, Jun 16, 2022 at 09:54:54PM +0200, Michael Grzeschik wrote:
> The goto statement in uvc_v4l2_try_format can simply be replaced by an
> direct return. There is no further user of the label, so remove it.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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
> -- 
> 2.30.2
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38785BCDCA
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 15:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiISN7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 09:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiISN7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 09:59:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1DB5FC5
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 06:59:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CF9D9BA;
        Mon, 19 Sep 2022 15:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663595981;
        bh=NWlBzFOfzjlMj5b+jHvSICWxb0vYhDEZ+B93Ra6nVi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l4AU9Wr4l0piHL6JgI/WD9H74S7LPBSPXmGrlOWah/MDkto10rq4ugKWXzUgqTVRJ
         WiFsy56OpQ0P1ybkE8fZxo/i0prw8DNT3gWHnib8j3kc0lVpKWc1EovKbJshD14UON
         bspybsfYwhb+wp27lJxn2kCrGOta6dYPN3ZaEEz0=
Date:   Mon, 19 Sep 2022 16:59:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 13/13] media: uvcvideo: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh1vxBEzGkKU492@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-14-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-14-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:24PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 744051b52e12..94f84c3c4712 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1554,12 +1554,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  		return PTR_ERR_OR_ZERO(gpio_privacy);
>  
>  	irq = gpiod_to_irq(gpio_privacy);
> -	if (irq < 0) {
> -		if (irq != EPROBE_DEFER)
> -			dev_err(&dev->udev->dev,
> -				"No IRQ for privacy GPIO (%d)\n", irq);
> -		return irq;
> -	}
> +	if (irq < 0)
> +		return dev_err_probe(&dev->udev->dev, irq,
> +				     "No IRQ for privacy GPIO\n");
>  
>  	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
>  	if (!unit)

-- 
Regards,

Laurent Pinchart

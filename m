Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F2960B825
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 21:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiJXTmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 15:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbiJXTle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 15:41:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD5D264785
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 11:11:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1BD8D4A;
        Mon, 24 Oct 2022 20:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666635032;
        bh=CK6KwXGwQ4JesMXXR3Pa8nnn4uD5FKWEeLIhE2W3uPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qlf0q8IdfD94heE+pRicfSvl5SLxZM5ZWJPevjpeLPncnHcU/4DZW3jmy8aA5ovuy
         lOfRl4C8ZCamFLxE5JhZij6PyBhRXVMPhkHgZJ0GWg0smKjQPwGk3+dRbrB+r4a40d
         OU3ogNlK1B6YWH6vfb0J56UJQ66hLBERwlYLrG+4=
Date:   Mon, 24 Oct 2022 21:10:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, ribalda@chromium.org,
        mchehab@kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix return value check in
 uvc_gpio_parse()
Message-ID: <Y1bU/2CwfStFKKmv@pendragon.ideasonboard.com>
References: <20221024134932.2873081-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221024134932.2873081-1-yangyingliang@huawei.com>
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

On Mon, Oct 24, 2022 at 09:49:32PM +0800, Yang Yingliang wrote:
> gpiod_to_irq() may return -EPROBE_DEFER, add a minus sign to fix it.
> 
> Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 215fb483efb0..1e6bdd6104ef 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1267,7 +1267,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  
>  	irq = gpiod_to_irq(gpio_privacy);
>  	if (irq < 0) {
> -		if (irq != EPROBE_DEFER)
> +		if (irq != -EPROBE_DEFER)

Oops.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			dev_err(&dev->udev->dev,
>  				"No IRQ for privacy GPIO (%d)\n", irq);
>  		return irq;

-- 
Regards,

Laurent Pinchart

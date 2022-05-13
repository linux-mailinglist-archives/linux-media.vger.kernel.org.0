Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A270A5266EE
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 18:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381669AbiEMQXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 12:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbiEMQXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 12:23:17 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25BF340DA
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 09:23:16 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6987E101BDE; Fri, 13 May 2022 17:23:15 +0100 (BST)
Date:   Fri, 13 May 2022 17:23:15 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <Yn6F87BxKsOaDYR5@gofer.mess.org>
References: <20220512130321.30599-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512130321.30599-1-oneukum@suse.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 12, 2022 at 03:03:21PM +0200, Oliver Neukum wrote:
> No buffer can be embedded inside a descriptor, not even a simple be64.
> Use a separate kmalloc()

This patch needs a tiny change from be64_to_cpu() to be64_to_cpup(), I've
tested that change with the hardware.

Applied to my tree:

https://git.linuxtv.org/syoung/media_tree.git/log/?h=for-v5.20a

Thanks,

Sean

> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/rc/imon_raw.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
> index d41580f6e4c7..b7a0c0b34378 100644
> --- a/drivers/media/rc/imon_raw.c
> +++ b/drivers/media/rc/imon_raw.c
> @@ -14,7 +14,7 @@ struct imon {
>  	struct device *dev;
>  	struct urb *ir_urb;
>  	struct rc_dev *rcdev;
> -	__be64 ir_buf;
> +	__be64 *ir_buf;
>  	char phys[64];
>  };
>  
> @@ -137,10 +137,16 @@ static int imon_probe(struct usb_interface *intf,
>  	if (!imon->ir_urb)
>  		return -ENOMEM;
>  
> +	imon->ir_buf = kmalloc(sizeof(__be64), GFP_KERNEL);
> +	if (!imon->ir_buf) {
> +		ret = -ENOMEM;
> +		goto free_urb;
> +	}
> +
>  	imon->dev = &intf->dev;
>  	usb_fill_int_urb(imon->ir_urb, udev,
>  			 usb_rcvintpipe(udev, ir_ep->bEndpointAddress),
> -			 &imon->ir_buf, sizeof(imon->ir_buf),
> +			 imon->ir_buf, sizeof(__be64),
>  			 imon_ir_rx, imon, ir_ep->bInterval);
>  
>  	rcdev = devm_rc_allocate_device(&intf->dev, RC_DRIVER_IR_RAW);
> @@ -177,6 +183,7 @@ static int imon_probe(struct usb_interface *intf,
>  
>  free_urb:
>  	usb_free_urb(imon->ir_urb);
> +	kfree(imon->ir_buf);
>  	return ret;
>  }
>  
> @@ -186,6 +193,7 @@ static void imon_disconnect(struct usb_interface *intf)
>  
>  	usb_kill_urb(imon->ir_urb);
>  	usb_free_urb(imon->ir_urb);
> +	kfree(imon->ir_buf);
>  }
>  
>  static const struct usb_device_id imon_table[] = {
> -- 
> 2.35.3

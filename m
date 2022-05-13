Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38515266E6
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 18:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382340AbiEMQUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 12:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352775AbiEMQUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 12:20:25 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF7625E7
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 09:20:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ADF73101BDF; Fri, 13 May 2022 17:20:21 +0100 (BST)
Date:   Fri, 13 May 2022 17:20:21 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH 1/4] igorplugusb: respect DMA coherency
Message-ID: <Yn6FRdZyL4jzd0Qa@gofer.mess.org>
References: <20220512123849.25903-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512123849.25903-1-oneukum@suse.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 12, 2022 at 02:38:46PM +0200, Oliver Neukum wrote:
> The coherency rules mean that you cannot embed
> a buffer inside a descriptor. kmalloc() separately.

I've merged this series to my tree. Thanks!

Sean
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/rc/igorplugusb.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
> index b40dbf500186..b46362da8623 100644
> --- a/drivers/media/rc/igorplugusb.c
> +++ b/drivers/media/rc/igorplugusb.c
> @@ -38,7 +38,7 @@ struct igorplugusb {
>  
>  	struct timer_list timer;
>  
> -	uint8_t buf_in[MAX_PACKET];
> +	u8 *buf_in;
>  
>  	char phys[64];
>  };
> @@ -177,6 +177,9 @@ static int igorplugusb_probe(struct usb_interface *intf,
>  	if (!ir->urb)
>  		goto fail;
>  
> +	ir->buf_in = kmalloc(MAX_PACKET, GFP_KERNEL);
> +	if (!ir->buf_in)
> +		goto fail;
>  	usb_fill_control_urb(ir->urb, udev,
>  		usb_rcvctrlpipe(udev, 0), (uint8_t *)&ir->request,
>  		ir->buf_in, sizeof(ir->buf_in), igorplugusb_callback, ir);
> @@ -223,6 +226,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
>  	rc_free_device(ir->rc);
>  	usb_free_urb(ir->urb);
>  	del_timer(&ir->timer);
> +	kfree(ir->buf_in);
>  
>  	return ret;
>  }
> @@ -236,6 +240,7 @@ static void igorplugusb_disconnect(struct usb_interface *intf)
>  	usb_set_intfdata(intf, NULL);
>  	usb_kill_urb(ir->urb);
>  	usb_free_urb(ir->urb);
> +	kfree(ir->buf_in);
>  }
>  
>  static const struct usb_device_id igorplugusb_table[] = {
> -- 
> 2.35.3

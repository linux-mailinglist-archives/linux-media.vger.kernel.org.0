Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B5F3464A7
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 17:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbhCWQO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 12:14:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:37310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232975AbhCWQOB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 12:14:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03D0D61581;
        Tue, 23 Mar 2021 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616516041;
        bh=G7qWYnfuXmcc7Hx62LV75USvChYBgumrNgfmyjFgdPM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CH5Rd5oWudKfFmamH/1yNE1f86ekYLvZUftjWdyV5BwN4q+3wOsVokfMulM/g9u8g
         IehBwAK0BHymGc3qbI9DwCPXKSc4shJ3bmRcejfjU1atrLC+bnXWJ+kJz15qqwLwuI
         A4uFNWCIrn+qfUe//o6JyFnfb5uqI/qRbwFBIQUrXFnEO47yhOLYtPy3CashiF+WLY
         Nqgn7LHDT53vDD+cnQhgQ9Aty1dEWVyyQe21VwtpOcpp80Vf8qjsZkSQf2W2ZYtruM
         JpPd89JCTgMyH3Ft7+izvEkvB85xdDRHd63pdhoOASi9+zhpo9eXXYUZW69fl3HwEr
         kTA+ba81Jvxzg==
Date:   Tue, 23 Mar 2021 17:13:56 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/media/usb/gspca/stv06xx: fix memory leak
Message-ID: <20210323171356.4a613351@coco.lan>
In-Reply-To: <20210226233731.614553-1-paskripkin@gmail.com>
References: <20210226233731.614553-1-paskripkin@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 27 Feb 2021 02:37:31 +0300
Pavel Skripkin <paskripkin@gmail.com> escreveu:

> Syzbot reported memory leak in hdcs_probe_1x00()[1].
> hdcs_probe_1x00() allocates memory for struct hdcs, but if hdcs_init() fails in gspca_dev_probe2()
> this memory becomes leaked.
> 
> int gspca_dev_probe2(struct usb_interface *intf,
> 		const struct usb_device_id *id,
> 		const struct sd_desc *sd_desc,
> 		int dev_size,
> 		struct module *module)
> {
> ...
> 
> 	ret = sd_desc->config(gspca_dev, id);
> 	if (ret < 0)
> 		goto out;
> 	ret = sd_desc->init(gspca_dev);
> 	if (ret < 0)
> 		goto out;
> ...
> out:
> 	if (gspca_dev->input_dev)
> 		input_unregister_device(gspca_dev->input_dev);
> 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
> 	v4l2_device_unregister(&gspca_dev->v4l2_dev);
> 	kfree(gspca_dev->usb_buf);
> 	kfree(gspca_dev);
> 	return ret;
> }
> 
> Reported-by: syzbot+e7f4c64a4248a0340c37@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> Change-Id: Ia198671177ee346de61780813025110c7c491d7a
> ---
>  drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> index 5a47dcbf1c8e..24df13b33a02 100644
> --- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> +++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
> @@ -485,7 +485,7 @@ static int hdcs_init(struct sd *sd)
>  					   stv_bridge_init[i][1]);
>  	}
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	/* sensor soft reset */
>  	hdcs_reset(sd);
> @@ -496,12 +496,12 @@ static int hdcs_init(struct sd *sd)
>  					     stv_sensor_init[i][1]);
>  	}
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	/* Enable continuous frame capture, bit 2: stop when frame complete */
>  	err = stv06xx_write_sensor(sd, HDCS_REG_CONFIG(sd), BIT(3));
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	/* Set PGA sample duration
>  	(was 0x7E for the STV602, but caused slow framerate with HDCS-1020) */
> @@ -512,9 +512,13 @@ static int hdcs_init(struct sd *sd)
>  		err = stv06xx_write_sensor(sd, HDCS_TCTRL,
>  				(HDCS_ADC_START_SIG_DUR << 5) | hdcs->psmp);
>  	if (err < 0)
> -		return err;
> +		goto error;
>  
>  	return hdcs_set_size(sd, hdcs->array.width, hdcs->array.height);
> +
> +error:
> +	kfree(hdcs);
> +	return err;
>  }

This doesn't seem the right fix here, as it is not the _init function
that allocates it. Also, when the device is disconnected, a memory leak
will happen.

I suspect that the right fix would be to move this:

	hdcs = kmalloc(sizeof(struct hdcs), GFP_KERNEL);
	if (!hdcs)
		return -ENOMEM;

To the main driver (stv06xx.c) - probably replacing it by kzalloc(),
and then handle the free code both both sd_probe() and sd_disconnect().


Thanks,
Mauro

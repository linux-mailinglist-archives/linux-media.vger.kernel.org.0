Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE311E3EC9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 12:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgE0KQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 06:16:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgE0KQp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 06:16:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 980872088E;
        Wed, 27 May 2020 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590574605;
        bh=7mPFHnGzYcd+ksg0ebtXu7eT12Soa2QPlmd8Yw6S29w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o6EeilxnhYH/OTRghmepilP4qecLcjktaZJJSHQ9kWH0MpKPqdQkc4FZlGXJVMZFs
         ZnCVOY2GLrhGxnb6s3xBOoLoBp7F5jBgTXl2eOi66941rwyDUonIdWzcsc76mfw3Mu
         uwwDxvSvT6VAOzElxPVlOsMUY0iAN16fC5HwzRio=
Date:   Wed, 27 May 2020 12:16:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2 2/3] USB: cdc-acm: blacklist IR Droid / IR Toy device
Message-ID: <20200527101642.GC281913@kroah.com>
References: <20200527094107.11936-1-sean@mess.org>
 <20200527094107.11936-3-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527094107.11936-3-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 27, 2020 at 10:41:06AM +0100, Sean Young wrote:
> The IR Droid / IR Toy device used custom protocol over serial
> line, so it is presenting itself as CDC ACM device.
> 
> Now that we have proper in-kernel driver for it we need to black-list the
> device in cdc-acm driver.
> 
> http://dangerousprototypes.com/docs/USB_Infrared_Toy
> https://www.irdroid.com/irdroid-usb-ir-transceiver/
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/usb/class/cdc-acm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 84d6f7df09a4..1369e3be5019 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1864,6 +1864,12 @@ static const struct usb_device_id acm_ids[] = {
>  	},
>  #endif
>  
> +#if IS_ENABLED(CONFIG_IR_TOY)
> +	{ USB_DEVICE(0x04d8, 0xfd08),
> +	.driver_info = IGNORE_DEVICE,
> +	},
> +#endif
> +
>  	/*Samsung phone in firmware update mode */
>  	{ USB_DEVICE(0x04e8, 0x685d),
>  	.driver_info = IGNORE_DEVICE,
> -- 
> 2.26.2
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

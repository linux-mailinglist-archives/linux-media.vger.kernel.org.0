Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7581B3A294B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 12:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFJKZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 06:25:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhFJKZv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 06:25:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5594D6135C;
        Thu, 10 Jun 2021 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623320635;
        bh=qTjkBEr9IWyUn76eTdVsCaQRo1eslrmrF1WO/gzptz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DMxg9uCkVxAuDLJ03F9WaIcM5CvXfNVMTfDizodoXVfQxi+pKPasNU6Zjm9pAP7M/
         q51UZRM1OU6vP0dEQdywBcYJxuGOon+oruzwA8k1AOTO/lCBmvkP+Xlw/fg3v4jap6
         WoC+oj/LuW5aLm/FRgzgfYzsEkU3ISiVZwHLsAtE=
Date:   Thu, 10 Jun 2021 12:23:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v4 2/2] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <YMHoOcoXKvvkdNP5@kroah.com>
References: <cover.1623318855.git.sean@mess.org>
 <900ce7cbcae2597767e59a335848e089ac82c73a.1623318855.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <900ce7cbcae2597767e59a335848e089ac82c73a.1623318855.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 10, 2021 at 11:16:25AM +0100, Sean Young wrote:
> The USB-UIRT device has its own driver, so blacklist the fdti driver
> from using it if the driver has been enabled.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 369ef140df78..2e9a9076a38d 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -106,7 +106,7 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
>  	.probe	= ftdi_NDI_device_setup,
>  };
>  
> -static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
> +static __maybe_unused const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {

Why make this change?

>  	.port_probe = ftdi_USB_UIRT_setup,
>  };
>  
> @@ -568,8 +568,10 @@ static const struct usb_device_id id_table_combined[] = {
>  	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
>  	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
> +#if !IS_ENABLED(CONFIG_IR_UIRT)
>  	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
> +#endif
>  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_1) },
>  	{ USB_DEVICE(FTDI_VID, PROTEGO_R2X0) },
>  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_3) },
> @@ -2281,7 +2283,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
>  /* Setup for the USB-UIRT device, which requires hardwired
>   * baudrate (38400 gets mapped to 312500) */
>  /* Called from usbserial:serial_probe */
> -static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
> +static __maybe_unused void ftdi_USB_UIRT_setup(struct ftdi_private *priv)

Again, why this change here?

thanks,

greg k-h

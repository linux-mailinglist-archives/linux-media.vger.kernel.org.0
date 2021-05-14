Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B6D3808B0
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 13:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhENLlc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 07:41:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:59090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhENLlb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 07:41:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 523CB61457;
        Fri, 14 May 2021 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620992420;
        bh=tdDTmQ969uyJaNrdpkRYeCHEcNv4TX8HEuna88IYW8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sitwqcTz+gsXmZ9H3s6ppwV6oRJah2zb3BcGDF0QuIM1Rzhx8fizmbnPC2ZcFo3wU
         UQKf8DrqofjyBvp4FsfsUq2+nas3GVmK7VGx/hgyceO3xTXd4Mc1RLqIYgmK5XB3o4
         oujTai0apd1XmxENmmKzfl4GqTrSkLdnFxjhDMIfbzoW87gtRFwFcTsvIxyM0quRv9
         vMeSdXamve9byaWSj8s1xMaesXveM4/FAAUcddLzNBYO7RXHW/jiA8oXIrV/CFtWYW
         7vbO6wSHh5X/9enZyHf37o88IP2VE7Ni7m9TDkCKP4c90ddREuxuYxjRF5/mrxl7F9
         WqYRTBr6TjLyQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lhWB3-0000ww-Cs; Fri, 14 May 2021 13:40:21 +0200
Date:   Fri, 14 May 2021 13:40:21 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 3/3] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <YJ5hpTqH7Ke+Fv7V@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <37339f4102666345168a738d0ffd80d8133a6a03.1620304986.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37339f4102666345168a738d0ffd80d8133a6a03.1620304986.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 01:44:55PM +0100, Sean Young wrote:
> The USB-UIRT device has its own driver, so blacklist the fdti driver
> from using it if the driver has been enabled.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 542073d2f0dd..2320bda57796 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -95,7 +95,9 @@ static int   ftdi_jtag_probe(struct usb_serial *serial);
>  static int   ftdi_NDI_device_setup(struct usb_serial *serial);
>  static int   ftdi_stmclite_probe(struct usb_serial *serial);
>  static int   ftdi_8u2232c_probe(struct usb_serial *serial);
> +#if !IS_ENABLED(CONFIG_IR_UIRT)
>  static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
> +#endif
>  static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
>  
>  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
> @@ -106,9 +108,11 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
>  	.probe	= ftdi_NDI_device_setup,
>  };
>  
> +#if !IS_ENABLED(CONFIG_IR_UIRT)
>  static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {

Please use __maybe_unused instead of sprinkling ifdefs throughout the
driver.

>  	.port_probe = ftdi_USB_UIRT_setup,
>  };
> +#endif
>  
>  static const struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
>  	.port_probe = ftdi_HE_TIRA1_setup,
> @@ -568,8 +572,10 @@ static const struct usb_device_id id_table_combined[] = {
>  	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
>  	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
> +#if !IS_ENABLED(CONFIG_IR_UIRT)
>  	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
> +#endif

This would still be needed.

>  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_1) },
>  	{ USB_DEVICE(FTDI_VID, PROTEGO_R2X0) },
>  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_3) },
> @@ -2292,6 +2298,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
>  	return 0;
>  }
>  
> +#if !IS_ENABLED(CONFIG_IR_UIRT)
>  /* Setup for the USB-UIRT device, which requires hardwired
>   * baudrate (38400 gets mapped to 312500) */
>  /* Called from usbserial:serial_probe */
> @@ -2301,6 +2308,7 @@ static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
>  	priv->custom_divisor = 77;
>  	priv->force_baud = 38400;
>  }
> +#endif
>  
>  /* Setup for the HE-TIRA1 device, which requires hardwired
>   * baudrate (38400 gets mapped to 100000) and RTS-CTS enabled.  */

Johan

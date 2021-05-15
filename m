Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205D2381764
	for <lists+linux-media@lfdr.de>; Sat, 15 May 2021 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhEOJ5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 05:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbhEOJ5n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 05:57:43 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D68C061573;
        Sat, 15 May 2021 02:56:31 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1DF90C641E; Sat, 15 May 2021 10:56:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621072589; bh=AaT8/EIDi+YWuE0uHJSs4p+OSGsmA/XSBAQX97NiYJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EgODpjuXTwHdTISd4EotsLl7wnrxBmhmuqtr9oG4JrB1Sk20p3n7Liye6KYkE8Iul
         2gorL0p9Y9DiXRxfHC2DcmBwV39TvaTu5O4pfJtseN2g28bO5ae1vh9Dzc0fRm0Zjx
         Uj/ycGwA5xuB0kXXvUTkz5XzLnspO8G/j97bX6wz89L7uwpYx+c87tyccCPqkPWVcT
         aGy7Qjr3LVCqWH0A8VYJuo5ZBZ6ugSUVLVQ4CRoJbU5WhPl6zAFmRKvpwNzL1pbUEv
         MrzitqxKgzD5i3NQimLXvIAUCZLI/MyIe5Pt1/1M3f2f0d9gBg+lflITF9VFLEEEw3
         DYVctBcn8Zmxw==
Date:   Sat, 15 May 2021 10:56:28 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 3/3] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <20210515095628.GC31801@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <37339f4102666345168a738d0ffd80d8133a6a03.1620304986.git.sean@mess.org>
 <YJ5hpTqH7Ke+Fv7V@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ5hpTqH7Ke+Fv7V@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 14, 2021 at 01:40:21PM +0200, Johan Hovold wrote:
> On Thu, May 06, 2021 at 01:44:55PM +0100, Sean Young wrote:
> > The USB-UIRT device has its own driver, so blacklist the fdti driver
> > from using it if the driver has been enabled.
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/usb/serial/ftdi_sio.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > index 542073d2f0dd..2320bda57796 100644
> > --- a/drivers/usb/serial/ftdi_sio.c
> > +++ b/drivers/usb/serial/ftdi_sio.c
> > @@ -95,7 +95,9 @@ static int   ftdi_jtag_probe(struct usb_serial *serial);
> >  static int   ftdi_NDI_device_setup(struct usb_serial *serial);
> >  static int   ftdi_stmclite_probe(struct usb_serial *serial);
> >  static int   ftdi_8u2232c_probe(struct usb_serial *serial);
> > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> >  static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
> > +#endif
> >  static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
> >  
> >  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
> > @@ -106,9 +108,11 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
> >  	.probe	= ftdi_NDI_device_setup,
> >  };
> >  
> > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> >  static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
> 
> Please use __maybe_unused instead of sprinkling ifdefs throughout the
> driver.

Good point.

> >  	.port_probe = ftdi_USB_UIRT_setup,
> >  };
> > +#endif
> >  
> >  static const struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
> >  	.port_probe = ftdi_HE_TIRA1_setup,
> > @@ -568,8 +572,10 @@ static const struct usb_device_id id_table_combined[] = {
> >  	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
> >  	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
> >  		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
> > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> >  	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
> >  		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
> > +#endif
> 
> This would still be needed.

I agree having the quirk in place would be useful, but if vid/pid is listed
in the id_table then both uirt and ftdi_sio have the same vid/pid listed,
which is not a great idea. How can this work?

Thanks

> 
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_1) },
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_R2X0) },
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_3) },
> > @@ -2292,6 +2298,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
> >  	return 0;
> >  }
> >  
> > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> >  /* Setup for the USB-UIRT device, which requires hardwired
> >   * baudrate (38400 gets mapped to 312500) */
> >  /* Called from usbserial:serial_probe */
> > @@ -2301,6 +2308,7 @@ static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
> >  	priv->custom_divisor = 77;
> >  	priv->force_baud = 38400;
> >  }
> > +#endif
> >  
> >  /* Setup for the HE-TIRA1 device, which requires hardwired
> >   * baudrate (38400 gets mapped to 100000) and RTS-CTS enabled.  */
> 
> Johan

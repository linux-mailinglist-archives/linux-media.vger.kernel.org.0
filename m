Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2163A2967
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 12:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFJKgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 06:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhFJKgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 06:36:16 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D2EC061574;
        Thu, 10 Jun 2021 03:34:20 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AF2E7C6487; Thu, 10 Jun 2021 11:34:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1623321258; bh=Ed+omwsFsDPjYaiCZSHRvVZMVYfp38oK9c5YQyNtNk0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dK5HgiHq+7ZamxCjMZUucicLs88EX8N2AHN2FTIUqhUqUiGesh/ERTVmZxOy1yfvo
         RiGoyLXZRiL5bEPGxZjQ0khw5rOaay6/dgM+GKFpmo5XIjB7GFWHsdT3cTyhDivf3z
         DYYI9+aVMppX+4Frwr7tEvVdNZLbSKr9vmr8Kf1JAz+LyH5Jy6+cyz5A8BY8Dar8KX
         zK/76nR2a7oyCGsiDdCSB6S9fh+B9YKjkaTPc4grfyocdUz+7qa+dALnu2n6DZFFli
         zeU+wxvUM7ywx1A4AbLo2yW16Ow41dxvJvaB4bsdXorXZwVxdwZb2Wz4aWg+zZCUZm
         WLillloapL4LA==
Date:   Thu, 10 Jun 2021 11:34:18 +0100
From:   Sean Young <sean@mess.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v4 2/2] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <20210610103418.GA31228@gofer.mess.org>
References: <cover.1623318855.git.sean@mess.org>
 <900ce7cbcae2597767e59a335848e089ac82c73a.1623318855.git.sean@mess.org>
 <YMHoOcoXKvvkdNP5@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMHoOcoXKvvkdNP5@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 10, 2021 at 12:23:53PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 10, 2021 at 11:16:25AM +0100, Sean Young wrote:
> > The USB-UIRT device has its own driver, so blacklist the fdti driver
> > from using it if the driver has been enabled.
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/usb/serial/ftdi_sio.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > index 369ef140df78..2e9a9076a38d 100644
> > --- a/drivers/usb/serial/ftdi_sio.c
> > +++ b/drivers/usb/serial/ftdi_sio.c
> > @@ -106,7 +106,7 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
> >  	.probe	= ftdi_NDI_device_setup,
> >  };
> >  
> > -static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
> > +static __maybe_unused const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
> 
> Why make this change?

If CONFIG_IR_UIRT is enabled, then this struct is not used. This generates
a warning when compiling with W=1 (clang or gcc):

  CC [M]  drivers/usb/serial/ftdi_sio.o
drivers/usb/serial/ftdi_sio.c:109:36: warning: ‘ftdi_USB_UIRT_quirk’ defined but not used [-Wunused-const-variable=]
  109 | static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
      |                                    ^~~~~~~~~~~~~~~~~~~

> 
> >  	.port_probe = ftdi_USB_UIRT_setup,
> >  };
> >  
> > @@ -568,8 +568,10 @@ static const struct usb_device_id id_table_combined[] = {
> >  	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
> >  	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
> >  		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
> > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> >  	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
> >  		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
> > +#endif
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_1) },
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_R2X0) },
> >  	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_3) },
> > @@ -2281,7 +2283,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
> >  /* Setup for the USB-UIRT device, which requires hardwired
> >   * baudrate (38400 gets mapped to 312500) */
> >  /* Called from usbserial:serial_probe */
> > -static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
> > +static __maybe_unused void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
> 
> Again, why this change here?

Same again.


Thanks for reviewing.

Sean

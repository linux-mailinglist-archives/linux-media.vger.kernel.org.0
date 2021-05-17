Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6231C38288A
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhEQJle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 05:41:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235911AbhEQJld (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:41:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46425611CD;
        Mon, 17 May 2021 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621244417;
        bh=cTiy/a7+Enu12kixTOOmGWJ1ZQKLAAv1lUq4CXeD4Ss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N45325oMUhi4vxWoLOS7F/rMYHd6M5MgOeYvXJ+cNVh3h7OjxchlYHlnWtBaOGi9U
         TbgKZTwAhceYhDgRgYM4Y6rERwzGH9/dU4NSXJN+jASLsKUyfcVSZSAPizdAUankiO
         Hg2DiLwjpp2Cg+mwrfYAFYN+24wcRKUw0M9MOJgOeEUENv+KW7DlXeQsmqLhEXXtwF
         Y5UFUmOxBjg8RFyyBEEcDwsFDOqFc2rWWLxSyLwdNxCpRH59ze5cQGhHwLAsVoORtx
         fndvMM6gl0gYXPACCleKB8Q20TT8muuYGD3TGhLwnheDq3mfHSWx6VhiUaEHAJPK+/
         +Z3ukYDh+yaJw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1liZjT-0003lu-8H; Mon, 17 May 2021 11:40:15 +0200
Date:   Mon, 17 May 2021 11:40:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 3/3] USB: serial: blacklist USB-UIRT when driver is
 selected
Message-ID: <YKI5/4Yy+PmO6+vl@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <37339f4102666345168a738d0ffd80d8133a6a03.1620304986.git.sean@mess.org>
 <YJ5hpTqH7Ke+Fv7V@hovoldconsulting.com>
 <20210515095628.GC31801@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515095628.GC31801@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 15, 2021 at 10:56:28AM +0100, Sean Young wrote:
> On Fri, May 14, 2021 at 01:40:21PM +0200, Johan Hovold wrote:
> > On Thu, May 06, 2021 at 01:44:55PM +0100, Sean Young wrote:
> > > The USB-UIRT device has its own driver, so blacklist the fdti driver
> > > from using it if the driver has been enabled.
> > > 
> > > Signed-off-by: Sean Young <sean@mess.org>
> > > ---
> > >  drivers/usb/serial/ftdi_sio.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > > index 542073d2f0dd..2320bda57796 100644
> > > --- a/drivers/usb/serial/ftdi_sio.c
> > > +++ b/drivers/usb/serial/ftdi_sio.c
> > > @@ -95,7 +95,9 @@ static int   ftdi_jtag_probe(struct usb_serial *serial);
> > >  static int   ftdi_NDI_device_setup(struct usb_serial *serial);
> > >  static int   ftdi_stmclite_probe(struct usb_serial *serial);
> > >  static int   ftdi_8u2232c_probe(struct usb_serial *serial);
> > > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> > >  static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
> > > +#endif
> > >  static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
> > >  
> > >  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
> > > @@ -106,9 +108,11 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
> > >  	.probe	= ftdi_NDI_device_setup,
> > >  };
> > >  
> > > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> > >  static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
> > 
> > Please use __maybe_unused instead of sprinkling ifdefs throughout the
> > driver.
> 
> Good point.
> 
> > >  	.port_probe = ftdi_USB_UIRT_setup,
> > >  };
> > > +#endif
> > >  
> > >  static const struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
> > >  	.port_probe = ftdi_HE_TIRA1_setup,
> > > @@ -568,8 +572,10 @@ static const struct usb_device_id id_table_combined[] = {
> > >  	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
> > >  	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
> > >  		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
> > > +#if !IS_ENABLED(CONFIG_IR_UIRT)
> > >  	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
> > >  		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
> > > +#endif
> > 
> > This would still be needed.
> 
> I agree having the quirk in place would be useful, but if vid/pid is listed
> in the id_table then both uirt and ftdi_sio have the same vid/pid listed,
> which is not a great idea. How can this work?

Sorry if I was being unclear; I meant that this ifdef would still be
needed.

Johan

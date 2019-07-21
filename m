Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B38B6F4A2
	for <lists+linux-media@lfdr.de>; Sun, 21 Jul 2019 20:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfGUS3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 14:29:43 -0400
Received: from gofer.mess.org ([88.97.38.141]:33185 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbfGUS3m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 14:29:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 179A760474; Sun, 21 Jul 2019 19:29:40 +0100 (BST)
Date:   Sun, 21 Jul 2019 19:29:40 +0100
From:   Sean Young <sean@mess.org>
To:     Jan Pieter van Woerkom <jp@jpvw.nl>
Cc:     James Hutchinson <jahutchinson99@googlemail.com>,
        Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org,
        Thomas Hollstegge <thomas.hollstegge@gmail.com>
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
Message-ID: <20190721182940.kclp27faukxxfc4d@gofer.mess.org>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719183542.GA25609@jpvw.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 19, 2019 at 08:35:42PM +0200, Jan Pieter van Woerkom wrote:
> dvbsky: add MyGica T230.
> Moved from cxusb driver as that driver can't handle FX2 FIFO issue.

Well then it should be deleted from the cxusb driver. Also how well
is this tested?

Thanks
Sean

> 
> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
> ---
> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-08 00:41:56.000000000 +0200
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-19 17:50:54.671341146 +0200
> @@ -561,11 +561,18 @@
>  
>  	/* attach tuner */
>  	si2157_config.fe = adap->fe[0];
> -	si2157_config.if_port = 0;
> -
> -	state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
> +	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230) {
> +		si2157_config.if_port = 1;
> +		state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
> +						   i2c_adapter,
> +						   0x60, &si2157_config);
> +	}
> +	else {
> +		si2157_config.if_port = 0;
> +		state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>  						   i2c_adapter,
>  						   0x60, &si2157_config);
> +	}
>  	if (!state->i2c_client_tuner) {
>  		dvb_module_release(state->i2c_client_demod);
>  		return -ENODEV;
> @@ -787,6 +794,9 @@
>  	{ DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4,
>  		&dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>  		RC_MAP_DVBSKY) },
> +	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
> +		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
> +		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>  	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>  		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>  		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02691D1B26
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 23:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbfJIVoL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 17:44:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35827 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfJIVoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 17:44:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id v8so3536762eds.2;
        Wed, 09 Oct 2019 14:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nFwyr2g78lYTgG8bRankx58PrKi+2lqqFOY0K/XLZC8=;
        b=NUTVLFJ7fleuQvgWLCGrOoDV/Vuwg2CcXzNRxkseGzZY2nTphc3/GRxaZZwIGU/ZZ4
         DmTFIKuRlCrmFzVaCFPpFxATqm6q7jCKQWrJ/HmJflICnGnh9J2h/opL3HvmpHizIQVg
         EqUruBPQXsNUGpImjee352R5c0qU87gtvCje9x3e03eWhpR7LWoCgUT39FbQLMoSgqpT
         WKCTLrbMl3cXrzyTbVKuT1DIqZE85CPyJ9A4z3gsg6Bjfwt0EkYt5+0qlyH6CrkyyOXg
         fR6SkhCSeATa4tvBY2w6I/EM777fPXjskUda/EuBfLfqtl6I28Ik/u2TrqFdZHB6w3P0
         eeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nFwyr2g78lYTgG8bRankx58PrKi+2lqqFOY0K/XLZC8=;
        b=ntGFC7wyRwyOzqMRFIRJTMcpxQhKB/s7eZ6rU/IteSOKGFt7ohctrkfpme7+DViDvu
         n52uw9Y2O1RQZ71Kq1WAfmtaKvxutJnKoYK1/fqb8jfrSKhbRUbY5Ek9JabDxbQCoW/X
         Z2WxrJq5ttWUZpbi2FlbLBrZrTddIyZ7VC//duiACvBLwDNlY4rPROBEIvEPLC0qi8ZR
         rNoHuEV5CWL2Ol4CMPWa9Q8v5ECKhneeaPvHdRVCY2P8HoNzdSfwqk+3w1VjhYjenX5A
         7TVdvJMNbb9t+Gq/CdFxjibNZsKCl5SHlehPKisgVMT6IVTvJNrQoEd78CXhM5VlCpDJ
         nyMg==
X-Gm-Message-State: APjAAAV+2UWTJYQsGUO5sQmPHZDT0rv8VfYITYi5Lv9WFdRdVDJQcA0K
        EwWYShf0gKnLB6PwYQAiLp0=
X-Google-Smtp-Source: APXvYqyduwbVZOYQeJGCI68a0EfxL/SCM2UkDp6CtnanS36eNmc/RfYesrZHDLyoH63hifd+e0+l2w==
X-Received: by 2002:a05:6402:28c:: with SMTP id l12mr5129111edv.145.1570657449496;
        Wed, 09 Oct 2019 14:44:09 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id ob24sm403981ejb.50.2019.10.09.14.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 14:44:08 -0700 (PDT)
Date:   Wed, 9 Oct 2019 23:44:05 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] media: af9035: add support for Logilink VG0022A
Message-ID: <20191009214405.GA3621@Limone>
References: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
 <9618316567493f917c41109f7dba94e533fbfb4b.1570194906.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9618316567493f917c41109f7dba94e533fbfb4b.1570194906.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> This it930x-based device has an issue with si2068.
> 
> When the si2168 firmware that came with the device is replaced
> by a new one, any I2C data received from the tuner will be
> replaced by 0xff.
> 
> Probably, the vendor firmware has some patch specifically
> designed for this device. So, we can't replace by the generic
> firmware.
> 
> The right solution would be to extract the si2168 firmware from
> the original driver and ask the driver to load the specifically
> designed firmware, but, while we don't have that, the next best
> solution is to just keep the original firmware at the device.

Unfortunately, after applying these four patches it doesn't work for me.
The messages when inserting the stick:

[  244.133448] i2c i2c-1: Added multiplexed i2c bus 2
[  244.133455] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
[  244.133458] si2168 1-0067: firmware version: B 4.0.2
[  244.133500] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
[  244.133514] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
[  244.138367] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached
[  244.156956] usb 2-1: dvb_usb_v2: 'Logilink VG0022A' successfully initialized and connected

The messages when starting VLC:

[  260.490253] si2157 2-0063: found a 'Silicon Labs Si2147-A30'
[  260.541347] si2157 2-0063: firmware version: 3.0.5

But it doesn't work. :(

g

> 
> For more details, see the discussions at:
> 	https://lore.kernel.org/linux-media/20191002141359.30166-2-gonsolo@gmail.com/
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/af9035.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index 3afd18733614..e555483c3077 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -1255,6 +1255,23 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
>  	si2168_config.fe = &adap->fe[0];
>  	si2168_config.ts_mode = SI2168_TS_SERIAL;
>  
> +	/*
> +	 * HACK: The Logilink VG0022A has a bug: when the si2168
> +	 * firmware that came with the device is replaced by a new
> +	 * one, the I2C transfers to the tuner will return just 0xff.
> +	 *
> +	 * Probably, the vendor firmware has some patch specifically
> +	 * designed for this device. So, we can't replace by the
> +	 * generic firmware. The right solution would be to extract
> +	 * the si2168 firmware from the original driver and ask the
> +	 * driver to load the specifically designed firmware, but,
> +	 * while we don't have that, the next best solution is to just
> +	 * keep the original firmware at the device.
> +	 */
> +	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
> +	    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100)
> +		si2168_config.dont_load_firmware = true;
> +
>  	state->af9033_config[adap->id].fe = &adap->fe[0];
>  	state->af9033_config[adap->id].ops = &state->ops;
>  	ret = af9035_add_i2c_dev(d, "si2168",
> @@ -2121,6 +2138,8 @@ static const struct usb_device_id af9035_id_table[] = {
>  		&it930x_props, "ITE 9303 Generic", NULL) },
>  	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
>  		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
> +	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> +		&it930x_props, "Logilink VG0022A", NULL) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(usb, af9035_id_table);
> -- 
> 2.21.0
> 

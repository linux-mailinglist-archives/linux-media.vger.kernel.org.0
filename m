Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 158B7A218C
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 18:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfH2Q4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 12:56:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44624 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbfH2Q4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 12:56:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so2448606pfc.11
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=423xqwRIzocwgaem9YfAuZwaarimyxRiO48fYth9Cr8=;
        b=j4yuCyVoYuKo9JT449e4C9ybeLaacEGWvUU9QzgGvP3CylYfDS3vWhnADHBO+BXjry
         TBX8bQKyqQXl66r9bwrdxYWOoGHHrTIGh2XL8AYzakkXvjtGRpuB/5hsX9mop9gmi8vu
         BWQA4vJikbA44+VGgWdnV0EtZZ+nkhz8GdxhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=423xqwRIzocwgaem9YfAuZwaarimyxRiO48fYth9Cr8=;
        b=heKolGIfkkKxQdG/bEBlZq0ryGqPdzTyziIoFAyGkEBJ0dRLtpsRHlXZK3UiGJmg/8
         KkPUlMUiTW4Ht7cfOj/K3vsNnzGPHHoUanucMV+711iGAQbwLIL2gmlw5KeOBcGS8HhB
         kshLbx3rSmt/xJ+fNWIWTL9J5kVvV06N9kDlqIWGWsALai1G1UIz6yZVjj5Ik1Z4U8NG
         Ir9ZCtV2ZqnFYln7mO1NSuz55908fKfrZxGll+g/P9rLgTVtcDRW0l1W72sW8VRvBgJ2
         J5xvkeGC7PU8u3ICEnP1cDOn3zRhR258Ck5589uJwoYIci95ZXXi5IriGowHJHOe+e4A
         mzJw==
X-Gm-Message-State: APjAAAWCCzWNN0W5tfE8fjLHYNc9Y7GvY9s45rBSBNOZYk86U0wNN0Gk
        /KDtuPgRmTmdYokJgnj+kZomPQ==
X-Google-Smtp-Source: APXvYqy/tdpgqPinTVb9QvT5mxhuAxH6+OojDAovCGie8sjvdqDVNtsSO+pCp5us7wkhp+pkO/+CHw==
X-Received: by 2002:a17:90a:17c4:: with SMTP id q62mr10706631pja.135.1567097766747;
        Thu, 29 Aug 2019 09:56:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z189sm5786359pfb.137.2019.08.29.09.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:56:05 -0700 (PDT)
Date:   Thu, 29 Aug 2019 09:56:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Anton Vasilyev <vasilyev@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Oliver Neukum <oneukum@suse.com>,
        Ben Hutchings <ben@decadent.org.uk>,
        ldv-project@linuxtesting.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dw2102: Fix use after free
Message-ID: <201908290954.51D9B2C@keescook>
References: <fcae86f2137822d7658d2bbd4bd8dd35bfb319b0.camel@decadent.org.uk>
 <20190822104147.4420-1-vasilyev@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822104147.4420-1-vasilyev@ispras.ru>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 22, 2019 at 01:41:47PM +0300, Anton Vasilyev wrote:
> dvb_usb_device_init stores parts of properties at d->props
> and d->desc and uses it on dvb_usb_device_exit.
> Free of properties on module probe leads to use after free.
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204597
> 
> The patch makes properties static instead of allocated on heap to prevent
> memleak and use after free.
> Also fixes s421_properties.devices initialization to have 2 element
> instead of 6 copied from p7500_properties.

Can these be const? If not, is the probe() logic safe for these globals
when there are multiple users?  (I don't know this driver, but what
happens if two of these devices get plugged in, for example.)

-Kees

> 
> 
> Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> Fixes: 299c7007e936 ("media: dw2102: Fix memleak on sequence of probes")
> ---
>  drivers/media/usb/dvb-usb/dw2102.c | 338 ++++++++++++++++++-----------
>  1 file changed, 215 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
> index b960abd00d48..7ea3aa0fee40 100644
> --- a/drivers/media/usb/dvb-usb/dw2102.c
> +++ b/drivers/media/usb/dvb-usb/dw2102.c
> @@ -2098,46 +2098,153 @@ static struct dvb_usb_device_properties s6x0_properties = {
>  	}
>  };
>  
> -static const struct dvb_usb_device_description d1100 = {
> -	"Prof 1100 USB ",
> -	{&dw2102_table[PROF_1100], NULL},
> -	{NULL},
> -};
> +static struct dvb_usb_device_properties p1100_properties = {
> +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> +	.usb_ctrl = DEVICE_SPECIFIC,
> +	.size_of_priv = sizeof(struct dw2102_state),
> +	.firmware = P1100_FIRMWARE,
> +	.no_reconnect = 1,
>  
> -static const struct dvb_usb_device_description d660 = {
> -	"TeVii S660 USB",
> -	{&dw2102_table[TEVII_S660], NULL},
> -	{NULL},
> -};
> +	.i2c_algo = &s6x0_i2c_algo,
> +	.rc.core = {
> +		.rc_interval = 150,
> +		.rc_codes = RC_MAP_TBS_NEC,
> +		.module_name = "dw2102",
> +		.allowed_protos   = RC_PROTO_BIT_NEC,
> +		.rc_query = prof_rc_query,
> +	},
>  
> -static const struct dvb_usb_device_description d480_1 = {
> -	"TeVii S480.1 USB",
> -	{&dw2102_table[TEVII_S480_1], NULL},
> -	{NULL},
> +	.generic_bulk_ctrl_endpoint = 0x81,
> +	.num_adapters = 1,
> +	.download_firmware = dw2102_load_firmware,
> +	.read_mac_address = s6x0_read_mac_address,
> +	.adapter = {
> +		{
> +			.num_frontends = 1,
> +			.fe = {{
> +				.frontend_attach = stv0288_frontend_attach,
> +				.stream = {
> +					.type = USB_BULK,
> +					.count = 8,
> +					.endpoint = 0x82,
> +					.u = {
> +						.bulk = {
> +							.buffersize = 4096,
> +						}
> +					}
> +				},
> +			} },
> +		}
> +	},
> +	.num_device_descs = 1,
> +	.devices = {
> +		{"Prof 1100 USB ",
> +			{&dw2102_table[PROF_1100], NULL},
> +			{NULL},
> +		},
> +	}
>  };
>  
> -static const struct dvb_usb_device_description d480_2 = {
> -	"TeVii S480.2 USB",
> -	{&dw2102_table[TEVII_S480_2], NULL},
> -	{NULL},
> -};
> +static struct dvb_usb_device_properties s660_properties = {
> +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> +	.usb_ctrl = DEVICE_SPECIFIC,
> +	.size_of_priv = sizeof(struct dw2102_state),
> +	.firmware = S660_FIRMWARE,
> +	.no_reconnect = 1,
>  
> -static const struct dvb_usb_device_description d7500 = {
> -	"Prof 7500 USB DVB-S2",
> -	{&dw2102_table[PROF_7500], NULL},
> -	{NULL},
> -};
> +	.i2c_algo = &s6x0_i2c_algo,
> +	.rc.core = {
> +		.rc_interval = 150,
> +		.rc_codes = RC_MAP_TEVII_NEC,
> +		.module_name = "dw2102",
> +		.allowed_protos   = RC_PROTO_BIT_NEC,
> +		.rc_query = dw2102_rc_query,
> +	},
>  
> -static const struct dvb_usb_device_description d421 = {
> -	"TeVii S421 PCI",
> -	{&dw2102_table[TEVII_S421], NULL},
> -	{NULL},
> +	.generic_bulk_ctrl_endpoint = 0x81,
> +	.num_adapters = 1,
> +	.download_firmware = dw2102_load_firmware,
> +	.read_mac_address = s6x0_read_mac_address,
> +	.adapter = {
> +		{
> +			.num_frontends = 1,
> +			.fe = {{
> +				.frontend_attach = ds3000_frontend_attach,
> +				.stream = {
> +					.type = USB_BULK,
> +					.count = 8,
> +					.endpoint = 0x82,
> +					.u = {
> +						.bulk = {
> +							.buffersize = 4096,
> +						}
> +					}
> +				},
> +			} },
> +		}
> +	},
> +	.num_device_descs = 3,
> +	.devices = {
> +		{"TeVii S660 USB",
> +			{&dw2102_table[TEVII_S660], NULL},
> +			{NULL},
> +		},
> +		{"TeVii S480.1 USB",
> +			{&dw2102_table[TEVII_S480_1], NULL},
> +			{NULL},
> +		},
> +		{"TeVii S480.2 USB",
> +			{&dw2102_table[TEVII_S480_2], NULL},
> +			{NULL},
> +		},
> +	}
>  };
>  
> -static const struct dvb_usb_device_description d632 = {
> -	"TeVii S632 USB",
> -	{&dw2102_table[TEVII_S632], NULL},
> -	{NULL},
> +static struct dvb_usb_device_properties p7500_properties = {
> +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> +	.usb_ctrl = DEVICE_SPECIFIC,
> +	.size_of_priv = sizeof(struct dw2102_state),
> +	.firmware = P7500_FIRMWARE,
> +	.no_reconnect = 1,
> +
> +	.i2c_algo = &s6x0_i2c_algo,
> +	.rc.core = {
> +		.rc_interval = 150,
> +		.rc_codes = RC_MAP_TBS_NEC,
> +		.module_name = "dw2102",
> +		.allowed_protos   = RC_PROTO_BIT_NEC,
> +		.rc_query = prof_rc_query,
> +	},
> +
> +	.generic_bulk_ctrl_endpoint = 0x81,
> +	.num_adapters = 1,
> +	.download_firmware = dw2102_load_firmware,
> +	.read_mac_address = s6x0_read_mac_address,
> +	.adapter = {
> +		{
> +			.num_frontends = 1,
> +			.fe = {{
> +				.frontend_attach = prof_7500_frontend_attach,
> +				.stream = {
> +					.type = USB_BULK,
> +					.count = 8,
> +					.endpoint = 0x82,
> +					.u = {
> +						.bulk = {
> +							.buffersize = 4096,
> +						}
> +					}
> +				},
> +			} },
> +		}
> +	},
> +	.num_device_descs = 1,
> +	.devices = {
> +		{"Prof 7500 USB DVB-S2",
> +			{&dw2102_table[PROF_7500], NULL},
> +			{NULL},
> +		},
> +	}
>  };
>  
>  static struct dvb_usb_device_properties su3000_properties = {
> @@ -2209,6 +2316,59 @@ static struct dvb_usb_device_properties su3000_properties = {
>  	}
>  };
>  
> +static struct dvb_usb_device_properties s421_properties = {
> +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> +	.usb_ctrl = DEVICE_SPECIFIC,
> +	.size_of_priv = sizeof(struct dw2102_state),
> +	.power_ctrl = su3000_power_ctrl,
> +	.num_adapters = 1,
> +	.identify_state	= su3000_identify_state,
> +	.i2c_algo = &su3000_i2c_algo,
> +
> +	.rc.core = {
> +		.rc_interval = 150,
> +		.rc_codes = RC_MAP_SU3000,
> +		.module_name = "dw2102",
> +		.allowed_protos   = RC_PROTO_BIT_RC5,
> +		.rc_query = su3000_rc_query,
> +	},
> +
> +	.read_mac_address = su3000_read_mac_address,
> +
> +	.generic_bulk_ctrl_endpoint = 0x01,
> +
> +	.adapter = {
> +		{
> +		.num_frontends = 1,
> +		.fe = {{
> +			.streaming_ctrl   = su3000_streaming_ctrl,
> +			.frontend_attach  = m88rs2000_frontend_attach,
> +			.stream = {
> +				.type = USB_BULK,
> +				.count = 8,
> +				.endpoint = 0x82,
> +				.u = {
> +					.bulk = {
> +						.buffersize = 4096,
> +					}
> +				}
> +			}
> +		} },
> +		}
> +	},
> +	.num_device_descs = 2,
> +	.devices = {
> +		{ "TeVii S421 PCI",
> +			{ &dw2102_table[TEVII_S421], NULL },
> +			{ NULL },
> +		},
> +		{ "TeVii S632 USB",
> +			{ &dw2102_table[TEVII_S632], NULL },
> +			{ NULL },
> +		},
> +	}
> +};
> +
>  static struct dvb_usb_device_properties t220_properties = {
>  	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
>  	.usb_ctrl = DEVICE_SPECIFIC,
> @@ -2326,101 +2486,33 @@ static struct dvb_usb_device_properties tt_s2_4600_properties = {
>  static int dw2102_probe(struct usb_interface *intf,
>  		const struct usb_device_id *id)
>  {
> -	int retval = -ENOMEM;
> -	struct dvb_usb_device_properties *p1100;
> -	struct dvb_usb_device_properties *s660;
> -	struct dvb_usb_device_properties *p7500;
> -	struct dvb_usb_device_properties *s421;
> -
> -	p1100 = kmemdup(&s6x0_properties,
> -			sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> -	if (!p1100)
> -		goto err0;
> -
> -	/* copy default structure */
> -	/* fill only different fields */
> -	p1100->firmware = P1100_FIRMWARE;
> -	p1100->devices[0] = d1100;
> -	p1100->rc.core.rc_query = prof_rc_query;
> -	p1100->rc.core.rc_codes = RC_MAP_TBS_NEC;
> -	p1100->adapter->fe[0].frontend_attach = stv0288_frontend_attach;
> -
> -	s660 = kmemdup(&s6x0_properties,
> -		       sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> -	if (!s660)
> -		goto err1;
> -
> -	s660->firmware = S660_FIRMWARE;
> -	s660->num_device_descs = 3;
> -	s660->devices[0] = d660;
> -	s660->devices[1] = d480_1;
> -	s660->devices[2] = d480_2;
> -	s660->adapter->fe[0].frontend_attach = ds3000_frontend_attach;
> -
> -	p7500 = kmemdup(&s6x0_properties,
> -			sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> -	if (!p7500)
> -		goto err2;
> -
> -	p7500->firmware = P7500_FIRMWARE;
> -	p7500->devices[0] = d7500;
> -	p7500->rc.core.rc_query = prof_rc_query;
> -	p7500->rc.core.rc_codes = RC_MAP_TBS_NEC;
> -	p7500->adapter->fe[0].frontend_attach = prof_7500_frontend_attach;
> -
> -
> -	s421 = kmemdup(&su3000_properties,
> -		       sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> -	if (!s421)
> -		goto err3;
> -
> -	s421->num_device_descs = 2;
> -	s421->devices[0] = d421;
> -	s421->devices[1] = d632;
> -	s421->adapter->fe[0].frontend_attach = m88rs2000_frontend_attach;
> -
> -	if (0 == dvb_usb_device_init(intf, &dw2102_properties,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &dw2104_properties,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &dw3101_properties,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &s6x0_properties,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, p1100,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, s660,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, p7500,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, s421,
> -			THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &su3000_properties,
> -			 THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &t220_properties,
> -			 THIS_MODULE, NULL, adapter_nr) ||
> -	    0 == dvb_usb_device_init(intf, &tt_s2_4600_properties,
> -			 THIS_MODULE, NULL, adapter_nr)) {
> -
> -		/* clean up copied properties */
> -		kfree(s421);
> -		kfree(p7500);
> -		kfree(s660);
> -		kfree(p1100);
> +	if (!(dvb_usb_device_init(intf, &dw2102_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &dw2104_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &dw3101_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &s6x0_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &p1100_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &s660_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &p7500_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &s421_properties,
> +			THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &su3000_properties,
> +			 THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &t220_properties,
> +			 THIS_MODULE, NULL, adapter_nr) &&
> +	    dvb_usb_device_init(intf, &tt_s2_4600_properties,
> +			 THIS_MODULE, NULL, adapter_nr))) {
>  
>  		return 0;
>  	}
>  
> -	retval = -ENODEV;
> -	kfree(s421);
> -err3:
> -	kfree(p7500);
> -err2:
> -	kfree(s660);
> -err1:
> -	kfree(p1100);
> -err0:
> -	return retval;
> +	return -ENODEV;
>  }
>  
>  static void dw2102_disconnect(struct usb_interface *intf)
> -- 
> 2.23.0
> 

-- 
Kees Cook

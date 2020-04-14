Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DD71A7829
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 12:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438171AbgDNKK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 06:10:28 -0400
Received: from gofer.mess.org ([88.97.38.141]:56929 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438130AbgDNKKX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 06:10:23 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0C0D811A001; Tue, 14 Apr 2020 11:10:17 +0100 (BST)
Date:   Tue, 14 Apr 2020 11:10:17 +0100
From:   Sean Young <sean@mess.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Anton Vasilyev <vasilyev@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Oliver Neukum <oneukum@suse.com>,
        Ben Hutchings <ben@decadent.org.uk>,
        ldv-project@linuxtesting.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dw2102: Fix use after free
Message-ID: <20200414101017.GA3637@gofer.mess.org>
References: <fcae86f2137822d7658d2bbd4bd8dd35bfb319b0.camel@decadent.org.uk>
 <20190822104147.4420-1-vasilyev@ispras.ru>
 <201908290954.51D9B2C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201908290954.51D9B2C@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 29, 2019 at 09:56:04AM -0700, Kees Cook wrote:
> On Thu, Aug 22, 2019 at 01:41:47PM +0300, Anton Vasilyev wrote:
> > dvb_usb_device_init stores parts of properties at d->props
> > and d->desc and uses it on dvb_usb_device_exit.
> > Free of properties on module probe leads to use after free.
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204597
> > 
> > The patch makes properties static instead of allocated on heap to prevent
> > memleak and use after free.
> > Also fixes s421_properties.devices initialization to have 2 element
> > instead of 6 copied from p7500_properties.
> 
> Can these be const? If not, is the probe() logic safe for these globals
> when there are multiple users?  (I don't know this driver, but what
> happens if two of these devices get plugged in, for example.)

Sorry for the super-late review.

So this is exactly right. dvb_usb_device_init() copies the properties,
so that is fine (I've just written a patch to make the props argument
const*).

However, this code changes the properties based on the usb id. See here:

https://github.com/torvalds/linux/blob/master/drivers/media/usb/dvb-usb/dw2102.c#L1900-L1916

So, these different variants need to be split into two or something like that.


Sean

> 
> -Kees
> 
> > 
> > 
> > Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
> > Fixes: 299c7007e936 ("media: dw2102: Fix memleak on sequence of probes")
> > ---
> >  drivers/media/usb/dvb-usb/dw2102.c | 338 ++++++++++++++++++-----------
> >  1 file changed, 215 insertions(+), 123 deletions(-)
> > 
> > diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
> > index b960abd00d48..7ea3aa0fee40 100644
> > --- a/drivers/media/usb/dvb-usb/dw2102.c
> > +++ b/drivers/media/usb/dvb-usb/dw2102.c
> > @@ -2098,46 +2098,153 @@ static struct dvb_usb_device_properties s6x0_properties = {
> >  	}
> >  };
> >  
> > -static const struct dvb_usb_device_description d1100 = {
> > -	"Prof 1100 USB ",
> > -	{&dw2102_table[PROF_1100], NULL},
> > -	{NULL},
> > -};
> > +static struct dvb_usb_device_properties p1100_properties = {
> > +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> > +	.usb_ctrl = DEVICE_SPECIFIC,
> > +	.size_of_priv = sizeof(struct dw2102_state),
> > +	.firmware = P1100_FIRMWARE,
> > +	.no_reconnect = 1,
> >  
> > -static const struct dvb_usb_device_description d660 = {
> > -	"TeVii S660 USB",
> > -	{&dw2102_table[TEVII_S660], NULL},
> > -	{NULL},
> > -};
> > +	.i2c_algo = &s6x0_i2c_algo,
> > +	.rc.core = {
> > +		.rc_interval = 150,
> > +		.rc_codes = RC_MAP_TBS_NEC,
> > +		.module_name = "dw2102",
> > +		.allowed_protos   = RC_PROTO_BIT_NEC,
> > +		.rc_query = prof_rc_query,
> > +	},
> >  
> > -static const struct dvb_usb_device_description d480_1 = {
> > -	"TeVii S480.1 USB",
> > -	{&dw2102_table[TEVII_S480_1], NULL},
> > -	{NULL},
> > +	.generic_bulk_ctrl_endpoint = 0x81,
> > +	.num_adapters = 1,
> > +	.download_firmware = dw2102_load_firmware,
> > +	.read_mac_address = s6x0_read_mac_address,
> > +	.adapter = {
> > +		{
> > +			.num_frontends = 1,
> > +			.fe = {{
> > +				.frontend_attach = stv0288_frontend_attach,
> > +				.stream = {
> > +					.type = USB_BULK,
> > +					.count = 8,
> > +					.endpoint = 0x82,
> > +					.u = {
> > +						.bulk = {
> > +							.buffersize = 4096,
> > +						}
> > +					}
> > +				},
> > +			} },
> > +		}
> > +	},
> > +	.num_device_descs = 1,
> > +	.devices = {
> > +		{"Prof 1100 USB ",
> > +			{&dw2102_table[PROF_1100], NULL},
> > +			{NULL},
> > +		},
> > +	}
> >  };
> >  
> > -static const struct dvb_usb_device_description d480_2 = {
> > -	"TeVii S480.2 USB",
> > -	{&dw2102_table[TEVII_S480_2], NULL},
> > -	{NULL},
> > -};
> > +static struct dvb_usb_device_properties s660_properties = {
> > +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> > +	.usb_ctrl = DEVICE_SPECIFIC,
> > +	.size_of_priv = sizeof(struct dw2102_state),
> > +	.firmware = S660_FIRMWARE,
> > +	.no_reconnect = 1,
> >  
> > -static const struct dvb_usb_device_description d7500 = {
> > -	"Prof 7500 USB DVB-S2",
> > -	{&dw2102_table[PROF_7500], NULL},
> > -	{NULL},
> > -};
> > +	.i2c_algo = &s6x0_i2c_algo,
> > +	.rc.core = {
> > +		.rc_interval = 150,
> > +		.rc_codes = RC_MAP_TEVII_NEC,
> > +		.module_name = "dw2102",
> > +		.allowed_protos   = RC_PROTO_BIT_NEC,
> > +		.rc_query = dw2102_rc_query,
> > +	},
> >  
> > -static const struct dvb_usb_device_description d421 = {
> > -	"TeVii S421 PCI",
> > -	{&dw2102_table[TEVII_S421], NULL},
> > -	{NULL},
> > +	.generic_bulk_ctrl_endpoint = 0x81,
> > +	.num_adapters = 1,
> > +	.download_firmware = dw2102_load_firmware,
> > +	.read_mac_address = s6x0_read_mac_address,
> > +	.adapter = {
> > +		{
> > +			.num_frontends = 1,
> > +			.fe = {{
> > +				.frontend_attach = ds3000_frontend_attach,
> > +				.stream = {
> > +					.type = USB_BULK,
> > +					.count = 8,
> > +					.endpoint = 0x82,
> > +					.u = {
> > +						.bulk = {
> > +							.buffersize = 4096,
> > +						}
> > +					}
> > +				},
> > +			} },
> > +		}
> > +	},
> > +	.num_device_descs = 3,
> > +	.devices = {
> > +		{"TeVii S660 USB",
> > +			{&dw2102_table[TEVII_S660], NULL},
> > +			{NULL},
> > +		},
> > +		{"TeVii S480.1 USB",
> > +			{&dw2102_table[TEVII_S480_1], NULL},
> > +			{NULL},
> > +		},
> > +		{"TeVii S480.2 USB",
> > +			{&dw2102_table[TEVII_S480_2], NULL},
> > +			{NULL},
> > +		},
> > +	}
> >  };
> >  
> > -static const struct dvb_usb_device_description d632 = {
> > -	"TeVii S632 USB",
> > -	{&dw2102_table[TEVII_S632], NULL},
> > -	{NULL},
> > +static struct dvb_usb_device_properties p7500_properties = {
> > +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> > +	.usb_ctrl = DEVICE_SPECIFIC,
> > +	.size_of_priv = sizeof(struct dw2102_state),
> > +	.firmware = P7500_FIRMWARE,
> > +	.no_reconnect = 1,
> > +
> > +	.i2c_algo = &s6x0_i2c_algo,
> > +	.rc.core = {
> > +		.rc_interval = 150,
> > +		.rc_codes = RC_MAP_TBS_NEC,
> > +		.module_name = "dw2102",
> > +		.allowed_protos   = RC_PROTO_BIT_NEC,
> > +		.rc_query = prof_rc_query,
> > +	},
> > +
> > +	.generic_bulk_ctrl_endpoint = 0x81,
> > +	.num_adapters = 1,
> > +	.download_firmware = dw2102_load_firmware,
> > +	.read_mac_address = s6x0_read_mac_address,
> > +	.adapter = {
> > +		{
> > +			.num_frontends = 1,
> > +			.fe = {{
> > +				.frontend_attach = prof_7500_frontend_attach,
> > +				.stream = {
> > +					.type = USB_BULK,
> > +					.count = 8,
> > +					.endpoint = 0x82,
> > +					.u = {
> > +						.bulk = {
> > +							.buffersize = 4096,
> > +						}
> > +					}
> > +				},
> > +			} },
> > +		}
> > +	},
> > +	.num_device_descs = 1,
> > +	.devices = {
> > +		{"Prof 7500 USB DVB-S2",
> > +			{&dw2102_table[PROF_7500], NULL},
> > +			{NULL},
> > +		},
> > +	}
> >  };
> >  
> >  static struct dvb_usb_device_properties su3000_properties = {
> > @@ -2209,6 +2316,59 @@ static struct dvb_usb_device_properties su3000_properties = {
> >  	}
> >  };
> >  
> > +static struct dvb_usb_device_properties s421_properties = {
> > +	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> > +	.usb_ctrl = DEVICE_SPECIFIC,
> > +	.size_of_priv = sizeof(struct dw2102_state),
> > +	.power_ctrl = su3000_power_ctrl,
> > +	.num_adapters = 1,
> > +	.identify_state	= su3000_identify_state,
> > +	.i2c_algo = &su3000_i2c_algo,
> > +
> > +	.rc.core = {
> > +		.rc_interval = 150,
> > +		.rc_codes = RC_MAP_SU3000,
> > +		.module_name = "dw2102",
> > +		.allowed_protos   = RC_PROTO_BIT_RC5,
> > +		.rc_query = su3000_rc_query,
> > +	},
> > +
> > +	.read_mac_address = su3000_read_mac_address,
> > +
> > +	.generic_bulk_ctrl_endpoint = 0x01,
> > +
> > +	.adapter = {
> > +		{
> > +		.num_frontends = 1,
> > +		.fe = {{
> > +			.streaming_ctrl   = su3000_streaming_ctrl,
> > +			.frontend_attach  = m88rs2000_frontend_attach,
> > +			.stream = {
> > +				.type = USB_BULK,
> > +				.count = 8,
> > +				.endpoint = 0x82,
> > +				.u = {
> > +					.bulk = {
> > +						.buffersize = 4096,
> > +					}
> > +				}
> > +			}
> > +		} },
> > +		}
> > +	},
> > +	.num_device_descs = 2,
> > +	.devices = {
> > +		{ "TeVii S421 PCI",
> > +			{ &dw2102_table[TEVII_S421], NULL },
> > +			{ NULL },
> > +		},
> > +		{ "TeVii S632 USB",
> > +			{ &dw2102_table[TEVII_S632], NULL },
> > +			{ NULL },
> > +		},
> > +	}
> > +};
> > +
> >  static struct dvb_usb_device_properties t220_properties = {
> >  	.caps = DVB_USB_IS_AN_I2C_ADAPTER,
> >  	.usb_ctrl = DEVICE_SPECIFIC,
> > @@ -2326,101 +2486,33 @@ static struct dvb_usb_device_properties tt_s2_4600_properties = {
> >  static int dw2102_probe(struct usb_interface *intf,
> >  		const struct usb_device_id *id)
> >  {
> > -	int retval = -ENOMEM;
> > -	struct dvb_usb_device_properties *p1100;
> > -	struct dvb_usb_device_properties *s660;
> > -	struct dvb_usb_device_properties *p7500;
> > -	struct dvb_usb_device_properties *s421;
> > -
> > -	p1100 = kmemdup(&s6x0_properties,
> > -			sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> > -	if (!p1100)
> > -		goto err0;
> > -
> > -	/* copy default structure */
> > -	/* fill only different fields */
> > -	p1100->firmware = P1100_FIRMWARE;
> > -	p1100->devices[0] = d1100;
> > -	p1100->rc.core.rc_query = prof_rc_query;
> > -	p1100->rc.core.rc_codes = RC_MAP_TBS_NEC;
> > -	p1100->adapter->fe[0].frontend_attach = stv0288_frontend_attach;
> > -
> > -	s660 = kmemdup(&s6x0_properties,
> > -		       sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> > -	if (!s660)
> > -		goto err1;
> > -
> > -	s660->firmware = S660_FIRMWARE;
> > -	s660->num_device_descs = 3;
> > -	s660->devices[0] = d660;
> > -	s660->devices[1] = d480_1;
> > -	s660->devices[2] = d480_2;
> > -	s660->adapter->fe[0].frontend_attach = ds3000_frontend_attach;
> > -
> > -	p7500 = kmemdup(&s6x0_properties,
> > -			sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> > -	if (!p7500)
> > -		goto err2;
> > -
> > -	p7500->firmware = P7500_FIRMWARE;
> > -	p7500->devices[0] = d7500;
> > -	p7500->rc.core.rc_query = prof_rc_query;
> > -	p7500->rc.core.rc_codes = RC_MAP_TBS_NEC;
> > -	p7500->adapter->fe[0].frontend_attach = prof_7500_frontend_attach;
> > -
> > -
> > -	s421 = kmemdup(&su3000_properties,
> > -		       sizeof(struct dvb_usb_device_properties), GFP_KERNEL);
> > -	if (!s421)
> > -		goto err3;
> > -
> > -	s421->num_device_descs = 2;
> > -	s421->devices[0] = d421;
> > -	s421->devices[1] = d632;
> > -	s421->adapter->fe[0].frontend_attach = m88rs2000_frontend_attach;
> > -
> > -	if (0 == dvb_usb_device_init(intf, &dw2102_properties,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &dw2104_properties,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &dw3101_properties,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &s6x0_properties,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, p1100,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, s660,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, p7500,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, s421,
> > -			THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &su3000_properties,
> > -			 THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &t220_properties,
> > -			 THIS_MODULE, NULL, adapter_nr) ||
> > -	    0 == dvb_usb_device_init(intf, &tt_s2_4600_properties,
> > -			 THIS_MODULE, NULL, adapter_nr)) {
> > -
> > -		/* clean up copied properties */
> > -		kfree(s421);
> > -		kfree(p7500);
> > -		kfree(s660);
> > -		kfree(p1100);
> > +	if (!(dvb_usb_device_init(intf, &dw2102_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &dw2104_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &dw3101_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &s6x0_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &p1100_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &s660_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &p7500_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &s421_properties,
> > +			THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &su3000_properties,
> > +			 THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &t220_properties,
> > +			 THIS_MODULE, NULL, adapter_nr) &&
> > +	    dvb_usb_device_init(intf, &tt_s2_4600_properties,
> > +			 THIS_MODULE, NULL, adapter_nr))) {
> >  
> >  		return 0;
> >  	}
> >  
> > -	retval = -ENODEV;
> > -	kfree(s421);
> > -err3:
> > -	kfree(p7500);
> > -err2:
> > -	kfree(s660);
> > -err1:
> > -	kfree(p1100);
> > -err0:
> > -	return retval;
> > +	return -ENODEV;
> >  }
> >  
> >  static void dw2102_disconnect(struct usb_interface *intf)
> > -- 
> > 2.23.0
> > 
> 
> -- 
> Kees Cook

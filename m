Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFD0C8C33
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 17:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfJBPAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 11:00:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38316 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJBPAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 11:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=plDq1RR+ciHKqt8jOsivOijS3hURpuRkgf9wwhtOAxc=; b=tUt1YY55brKXyBWU6IyqG6PrW
        rMNhuUPKZrkTj83xKC586b1Xpp6eRPClP05OMhdzHQ0/EDsco5UmF2jSZLi9IVKmViipVB8WTTgij
        4BW5CenrZ0ZLL4OcJSs8HzEYZ7phszW6fO5QDAFAYZNwSVu5u6oryoVizkMtO37z0e7jogYgKjjT4
        KsZgILP8ABRDWClRUlLlP75re7DKRYoAvAdLlG6cvbV8ZQNyTCPMVX7eTOzy1Uggux3kNUPuIt7wZ
        hLo1zBx92VRUeNsuu/QNfFfcY4vza6yfDGaF7yM4oH1RkJss91TQl1XPENzBHLignm+yMIJaCxvF9
        RsIwdGvUg==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFg6r-0007oZ-GE; Wed, 02 Oct 2019 15:00:09 +0000
Date:   Wed, 2 Oct 2019 12:00:04 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191002120004.2761c996@coco.lan>
In-Reply-To: <20191002141359.30166-2-gonsolo@gmail.com>
References: <20191001205203.4b1a5fb6@coco.lan>
        <20191002141359.30166-1-gonsolo@gmail.com>
        <20191002141359.30166-2-gonsolo@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  2 Oct 2019 16:13:59 +0200
Gon Solo <gonsolo@gmail.com> escreveu:


All patches should have a description at the beginning of the e-mail
body, even the trivial ones.


You also forgot to add your Signed-off-by.

> ---
>  drivers/media/tuners/si2157.c         | 68 +++++++++++++++++----------
>  drivers/media/tuners/si2157_priv.h    |  1 +
>  drivers/media/usb/dvb-usb-v2/af9035.c | 47 ++++++++++++++++++
>  3 files changed, 90 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index e87040d6eca7..8f9df2485d51 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -66,6 +66,24 @@ static int si2157_cmd_execute(struct i2c_client *client, struct si2157_cmd *cmd)
>  	return ret;
>  }
>  
> +static int si2157_power_up(struct si2157_dev *dev, struct i2c_client *client)
> +{
> +	struct si2157_cmd cmd;
> +
> +	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
> +		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
> +		cmd.wlen = 9;
> +	} else if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
> +		memcpy(cmd.args, "\xc0\x00\x0d\x0e\x00\x01\x01\x01\x01\x03", 10);
> +		cmd.wlen = 10;
> +	} else {
> +		memcpy(cmd.args, "\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01", 15);
> +		cmd.wlen = 15;
> +	}
> +	cmd.rlen = 1;
> +	return si2157_cmd_execute(client, &cmd);
> +}
> +
>  static int si2157_init(struct dvb_frontend *fe)
>  {
>  	struct i2c_client *client = fe->tuner_priv;
> @@ -75,7 +93,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  	struct si2157_cmd cmd;
>  	const struct firmware *fw;
>  	const char *fw_name;
> -	unsigned int uitmp, chip_id;
> +	unsigned int uitmp;
>  
>  	dev_dbg(&client->dev, "\n");
>  
> @@ -93,19 +111,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  	if (uitmp == dev->if_frequency / 1000)
>  		goto warm;
>  
> -	/* power up */
> -	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
> -		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
> -		cmd.wlen = 9;
> -	} else if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
> -		memcpy(cmd.args, "\xc0\x00\x0d\x0e\x00\x01\x01\x01\x01\x03", 10);
> -		cmd.wlen = 10;
> -	} else {
> -		memcpy(cmd.args, "\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01", 15);
> -		cmd.wlen = 15;
> -	}
> -	cmd.rlen = 1;
> -	ret = si2157_cmd_execute(client, &cmd);
> +	ret = si2157_power_up(dev, client);
>  	if (ret)
>  		goto err;

Ok, you're moving the power-op code to a function. That's OK, but
the rule is one patch per functional change.

So, the first patch in this series should be the one moving the
power up code to a separate function, e. g. the e-mail would be
something like:

	Subject: [PATCH 1/3] media: si2157: move power up code to a function

	On some devices, we need to power up the device on other places,
	so move the code to a separate function.

	Signed-off-by: your name <your@email>

	...

>  
> @@ -118,17 +124,6 @@ static int si2157_init(struct dvb_frontend *fe)
>  			goto err;
>  	}
>  
> -	/* query chip revision */
> -	memcpy(cmd.args, "\x02", 1);
> -	cmd.wlen = 1;
> -	cmd.rlen = 13;
> -	ret = si2157_cmd_execute(client, &cmd);
> -	if (ret)
> -		goto err;
> -
> -	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
> -			cmd.args[4] << 0;
> -
>  	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
>  	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
>  	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
> @@ -137,7 +132,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
>  	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
>  
> -	switch (chip_id) {
> +	switch (dev->chip_id) {
>  	case SI2158_A20:
>  	case SI2148_A20:
>  		fw_name = SI2158_A20_FIRMWARE;
> @@ -456,6 +451,27 @@ static int si2157_probe(struct i2c_client *client,
>  	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
>  	fe->tuner_priv = client;
>  
> +	ret = si2157_power_up(dev, client);
> +	if (ret)
> +		goto err;
> +	/* query chip revision */
> +	/* hack: do it here because after the si2168 gets 0101, commands will
> +	 * still be executed here but no result
> +	 */
> +	memcpy(cmd.args, "\x02", 1);
> +	cmd.wlen = 1;
> +	cmd.rlen = 13;
> +	ret = si2157_cmd_execute(client, &cmd);
> +	if (ret)
> +		goto err_kfree;
> +	dev->chip_id = cmd.args[1] << 24 |
> +		cmd.args[2] << 16 |
> +		cmd.args[3] << 8 |
> +		cmd.args[4] << 0;
> +	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
> +		cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
> +
> +

Why the extra blank line?

The above code seems to be a separate issue and should be handled
in separate.

I suspect, however, that the issue is actually at the bridge driver.

You should probably open the I2C gate before being able to talk
with it.

>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	if (cfg->mdev) {
>  		dev->mdev = cfg->mdev;
> diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
> index 2bda903358da..9ab7c88b01b4 100644
> --- a/drivers/media/tuners/si2157_priv.h
> +++ b/drivers/media/tuners/si2157_priv.h
> @@ -28,6 +28,7 @@ struct si2157_dev {
>  	u8 chiptype;
>  	u8 if_port;
>  	u32 if_frequency;
> +	u32 chip_id;
>  	struct delayed_work stat_work;
>  
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index 3afd18733614..83e243df59b9 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -1246,6 +1246,51 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
>  
>  	msleep(200);
>  
> +	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK) {
> +
> +		ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		/* I2C master bus 2 clock speed 300k */
> +		ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
> +		if (ret < 0)
> +			goto err;
> +
> +		/* I2C master bus 1,3 clock speed 300k */
> +		ret = af9035_wr_reg(d, 0x00f103, 0x07);
> +		if (ret < 0)
> +			goto err;
> +
> +		/* set gpio11 low */
> +		ret = af9035_wr_reg_mask(d, 0xd8d4, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		ret = af9035_wr_reg_mask(d, 0xd8d5, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		ret = af9035_wr_reg_mask(d, 0xd8d3, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		/* Tuner enable using gpiot2_en, gpiot2_on and gpiot2_o (reset) */
> +		ret = af9035_wr_reg_mask(d, 0xd8b8, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		ret = af9035_wr_reg_mask(d, 0xd8b9, 0x01, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		ret = af9035_wr_reg_mask(d, 0xd8b7, 0x00, 0x01);
> +		if (ret < 0)
> +			goto err;
> +
> +		msleep(200);

Hmm.... you are setting bit 1 of 0xd8b7 to 0 here...

> +	}
> +
>  	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
>  	if (ret < 0)
>  		goto err;

Then setting it to 1 here.

Is this a reset pin? If so, perhaps you need to do something like:

	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x00, 0x01);
		if (ret < 0)
			goto err;

	msleep(200);

	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
		if (ret < 0)
			goto err;

	msleep(200);

In order to wait for the reset to finish and be able to talk with the
tuner.


> @@ -2119,6 +2164,8 @@ static const struct usb_device_id af9035_id_table[] = {
>  	/* IT930x devices */
>  	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
>  		&it930x_props, "ITE 9303 Generic", NULL) },
> +	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> +		&it930x_props, "Logilink VG0022A", NULL) },
>  	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
>  		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
>  	{ }



Thanks,
Mauro

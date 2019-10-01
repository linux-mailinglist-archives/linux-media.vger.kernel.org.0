Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A28AC44A3
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 01:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbfJAXwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 19:52:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36468 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfJAXwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 19:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=a74goTc45cdDIZjS1+lDcy3LFWmOrq6bWCL1X6Vr13k=; b=jlqfjqEkYvJQ5ZEtZwZZDXha5
        jrV7dfMCU1l6q8WMz0yH3w3qtJ/3VvN/j/x8tW3C9eYeBgYvb28CkOAY34/m52n3kCqONkzUvMoIV
        B78Q6HCg0RmQggpW7o6hrg9vHAOTW7FYHxM+49UIyUVp51civiUMjKPOcHQFkk25X5Mh4h3Bjkj35
        wqsPu/JMk6KTb4qe2cYjLUnCfBhlh1coql32yWxI4c4uKwyux+rcMFf0+4qfpK6YLy7irPvPdo8Qk
        sYSQ9sSx7X19RzzmWV09YZHl6Cy5wBBW7Hs4xfYMht044liRrzwRqLCMXouIiE3KIVX5HcWbRE0pT
        jp4nBmz8Q==;
Received: from 177.157.127.95.dynamic.adsl.gvt.net.br ([177.157.127.95] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFRw6-0002VD-Ub; Tue, 01 Oct 2019 23:52:07 +0000
Date:   Tue, 1 Oct 2019 20:52:03 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     Sean Young <sean@mess.org>, crope@iki.fi,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: DVB-T2 Stick
Message-ID: <20191001205203.4b1a5fb6@coco.lan>
In-Reply-To: <CANL0fFRnEaapgm3oiDQmZb6qeAr4pwyhofZXA0mbmq=o4PPUDg@mail.gmail.com>
References: <CANL0fFSGG_+R2zbf-9MxVLJMTMgc+-fwSoLCqS1qc+jWo-zNLA@mail.gmail.com>
        <20190219213003.l7hzy2emdsxe4izy@gofer.mess.org>
        <CANL0fFRnEaapgm3oiDQmZb6qeAr4pwyhofZXA0mbmq=o4PPUDg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Oct 2019 00:19:05 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> Hi!
> 
> > Secondly there are lots of coding style issues, see:
> > https://www.kernel.org/doc/html/v4.10/process/coding-style.html
> 
> I addressed most of these except one "#if 0" warning from checkpatch.
> 
> > I'm afraid there are many problems with this patch. First of all it looks
> > like support was added for a si2168 tuner but it looks like it will break
> > for any other si2157-type device.
> 
> 
> Can you give me a hint how to proceed here? I don't know much about
> DVB tuners or kernel development.
> 
> I attached the cleaned-up patch for 5.4.0-rc1

First of all, don't attach a patch. Instead, just send it with a decent
emailer (with won't mangle whitespaces) or use git send-email...

Also, please read the Developer's section of our wiki page:

	https://linuxtv.org/wiki/index.php/Developer_section

In special, the "Submitting your work" part of it.

> 
> Thanks,
> g
> From 6cada6442207a67202e73721692aced665b8fdf0 Mon Sep 17 00:00:00 2001
> From: Gon Solo <gonsolo@gmail.com>
> Date: Tue, 1 Oct 2019 21:59:44 +0200
> Subject: [PATCH] DVB-T2 with coding style updates.
> 
> ---
>  drivers/media/tuners/si2157.c         | 44 ++++++++++++++++++++++---
>  drivers/media/tuners/si2157_priv.h    |  8 +++++
>  drivers/media/usb/dvb-usb-v2/af9035.c | 47 ++++++++++++++++++++++++++-
>  3 files changed, 93 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index e87040d6eca7..af50e721281b 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -75,7 +75,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  	struct si2157_cmd cmd;
>  	const struct firmware *fw;
>  	const char *fw_name;
> -	unsigned int uitmp, chip_id;
> +	unsigned int uitmp;
>  
>  	dev_dbg(&client->dev, "\n");
>  
> @@ -117,7 +117,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  		if (ret)
>  			goto err;
>  	}
> -
> +#if 0
>  	/* query chip revision */
>  	memcpy(cmd.args, "\x02", 1);
>  	cmd.wlen = 1;
> @@ -138,6 +138,8 @@ static int si2157_init(struct dvb_frontend *fe)
>  	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
>  
>  	switch (chip_id) {
> +#endif
> +	switch (dev->chip_id) {

You shouldn't just blindly comment out some code, as this will very likely 
break support for all other devices supported by the driver...

>  	case SI2158_A20:
>  	case SI2148_A20:
>  		fw_name = SI2158_A20_FIRMWARE;
> @@ -161,9 +163,9 @@ static int si2157_init(struct dvb_frontend *fe)
>  		goto err;
>  	}
>  
> -	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
> -			cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
> -
> +//	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
> +//			cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
> +//
>  	if (fw_name == NULL)
>  		goto skip_fw_download;
>  
> @@ -456,6 +458,38 @@ static int si2157_probe(struct i2c_client *client,
>  	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
>  	fe->tuner_priv = client;
>  
> +	/* power up */
> +	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
> +		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
> +		cmd.wlen = 9;
> +	} else {
> +		memcpy(cmd.args,
> +		"\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01",
> +		15);
> +		cmd.wlen = 15;
> +	}
> +	cmd.rlen = 1;
> +	ret = si2157_cmd_execute(client, &cmd);
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

... yet, looking on what you've done, it seems that you're actually
adding support for a different tuner at the si2157 driver.

If this is the case, this should be on a separate patch, and in a way
that it will become clear that it won't break support for any existing
device.

Also, please remove the dead code, instead of commenting it out.

>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	if (cfg->mdev) {
>  		dev->mdev = cfg->mdev;
> diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
> index 2bda903358da..0f4090e184e9 100644
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
> @@ -43,6 +44,13 @@ struct si2157_dev {
>  #define SI2157_CHIPTYPE_SI2141 2
>  #define SI2157_CHIPTYPE_SI2177 3
>  
> +#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
> +#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
> +#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
> +#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
> +#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
> +#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
> +
>  /* firmware command struct */
>  #define SI2157_ARGLEN      30
>  struct si2157_cmd {
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index 3afd18733614..5b7a00cdcbd8 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -1206,7 +1206,50 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
>  	struct si2168_config si2168_config;
>  	struct i2c_adapter *adapter;
>  
> -	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
> +	//dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
> +	dev_dbg(&intf->dev, "%s  adap->id=%d\n", __func__, adap->id);

Why did you do such change? dev_dbg can already print the function, and
much more. See:

	https://lwn.net/Articles/434833/

> +
> +	/* I2C master bus 2 clock speed 300k */
> +	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
> +	if (ret < 0)
> +		goto err;
> +
> +	/* I2C master bus 1,3 clock speed 300k */
> +	ret = af9035_wr_reg(d, 0x00f103, 0x07);
> +	if (ret < 0)
> +		goto err;
> +
> +	/* set gpio11 low */
> +	ret = af9035_wr_reg_mask(d, 0xd8d4, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = af9035_wr_reg_mask(d, 0xd8d5, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = af9035_wr_reg_mask(d, 0xd8d3, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	/* Tuner enable using gpiot2_en, gpiot2_on and gpiot2_o (reset) */
> +	ret = af9035_wr_reg_mask(d, 0xd8b8, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = af9035_wr_reg_mask(d, 0xd8b9, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x00, 0x01);
> +	if (ret < 0)
> +		goto err;
> +
> +	msleep(200);
> +
> +	ret = af9035_wr_reg_mask(d, 0xd8b7, 0x01, 0x01);
> +	if (ret < 0)
> +		goto err;

The above seems specific for your device. You need to check if the device
is USB_VID_DEXATEK, running the code only on such case.

>  
>  	/* I2C master bus 2 clock speed 300k */
>  	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
> @@ -2118,6 +2161,8 @@ static const struct usb_device_id af9035_id_table[] = {
>  
>  	/* IT930x devices */
>  	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
> +	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> +		&it930x_props, "Logilink VG0022A", NULL) },
>  		&it930x_props, "ITE 9303 Generic", NULL) },
>  	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
>  		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },


Thanks,
Mauro

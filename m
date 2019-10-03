Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350D0CAC61
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 19:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733136AbfJCQJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 12:09:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40944 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733130AbfJCQJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 12:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=urZ8lihnNIb8UAfT+LX/L3lCi7pvbQhtMnEgBxPHSbI=; b=DlhEsireXtR/zTup5aTEHnevD
        QqyPCYchDetqL28cohfZf3sEs0ad4YMZIHuOy5Byw3JPTvFZbFwixbPw+2E1uxAGpd79bOBfXzeI8
        B1CDUUCNqA+brWodchUcgETKSa+4sHPCGW9U8SXBZMDnU6iKuNJVbDRR/QY8pEboAfcIsnS+EbjVt
        /FI/y6aX8+2wGb26acBA24HzsFoR4WZqNGVvgYNE2G0cIgrbUarIeyngmUqCnAt6y9bHtBZ4N8HZY
        cpLDT2M5XeOYnskkQWwrfzifTlI2de9h6PL/Ax3uFYKT8KhJCeMned2deUTnF667GA4lOQpA2ig8N
        /I/+dXVIw==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG3fF-0004Vj-KQ; Thu, 03 Oct 2019 16:09:14 +0000
Date:   Thu, 3 Oct 2019 13:09:09 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003130909.01d29b77@coco.lan>
In-Reply-To: <20191003160336.GA5125@Limone>
References: <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
        <20191003120238.75811da6@coco.lan>
        <20191003160336.GA5125@Limone>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 18:03:36 +0200
Gon Solo <gonsolo@gmail.com> escreveu:

> > With the original patch you proposed, what are the logs?  
> 
> With the following patch applied to media_tree master:
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index e87040d6eca7..4c1ab0b6876a 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -129,13 +129,14 @@ static int si2157_init(struct dvb_frontend *fe)
>  	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
>  			cmd.args[4] << 0;
>  
> -	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
> -	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
> -	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
> -	#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
> -	#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
> -	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
> -	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
> +	#define SI2177_A30 ('A' << 24 |  77 << 16 | '3' << 8 | '0' << 0)
> +	#define SI2158_A20 ('A' << 24 |  58 << 16 | '2' << 8 | '0' << 0)
> +	#define SI2148_A20 ('A' << 24 |  48 << 16 | '2' << 8 | '0' << 0)
> +	#define SI2157_A30 ('A' << 24 |  57 << 16 | '3' << 8 | '0' << 0)
> +	#define SI2147_A30 ('A' << 24 |  47 << 16 | '3' << 8 | '0' << 0)
> +	#define SI2146_A10 ('A' << 24 |  46 << 16 | '1' << 8 | '0' << 0)
> +	#define SI2141_A10 ('A' << 24 |  41 << 16 | '1' << 8 | '0' << 0)
> +	#define SI_BOGUS   (255 << 24 | 255 << 16 | 255 << 8 | 255 << 0)
>  
>  	switch (chip_id) {
>  	case SI2158_A20:
> @@ -148,6 +149,10 @@ static int si2157_init(struct dvb_frontend *fe)
>  	case SI2177_A30:
>  		fw_name = SI2157_A30_FIRMWARE;
>  		break;
> +	case SI_BOGUS:
> +		dev_info(&client->dev, "Bogus chip version, trying with no firmware\n");
> +		fw_name = NULL;
> +		break;
>  	case SI2157_A30:
>  	case SI2147_A30:
>  	case SI2146_A10:
> @@ -225,6 +230,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  
>  	dev_info(&client->dev, "firmware version: %c.%c.%d\n",
>  			cmd.args[6], cmd.args[7], cmd.args[8]);
>  warm:
>  	/* init statistics in order signal app which are supported */
>  	c->strength.len = 1;
> diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
> index 3afd18733614..a8d59cf06b1e 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9035.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9035.c
> @@ -1197,6 +1197,11 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
>  	return ret;
>  }
>  
> +/* I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed))
> + * 7 equals ~400k, 26 ~100k and 260 ~10k.
> + * */
> +#define I2C_SPEED_REGISTER 7
> +
>  static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
>  {
>  	struct state *state = adap_to_priv(adap);
> @@ -1208,13 +1213,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
>  
>  	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
>  
> -	/* I2C master bus 2 clock speed 300k */
> -	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
> +	/* I2C master bus 2 clock speed */
> +	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_REGISTER);
>  	if (ret < 0)
>  		goto err;
>  
> -	/* I2C master bus 1,3 clock speed 300k */
> -	ret = af9035_wr_reg(d, 0x00f103, 0x07);
> +	/* I2C master bus 1,3 clock speed */
> +	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_REGISTER);
>  	if (ret < 0)
>  		goto err;
>  
> @@ -2119,6 +2124,8 @@ static const struct usb_device_id af9035_id_table[] = {
>  	/* IT930x devices */
>  	{ DVB_USB_DEVICE(USB_VID_ITETECH, USB_PID_ITETECH_IT9303,
>  		&it930x_props, "ITE 9303 Generic", NULL) },
> +	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> +		&it930x_props, "Logilink VG0022A", NULL) },
>  	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, USB_PID_AVERMEDIA_TD310,
>  		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
>  	{ }
> 
> the Messages at boot time are
> 
> [    4.262882] si2168 1-0067: Silicon Labs Si2168-B40 successfully identified
> [    4.262884] si2168 1-0067: firmware version: B 4.0.2
> [    4.262902] usb 2-1: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
> [    4.262908] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
> [    4.289776] si2157 2-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached
> 
> and the messages when running vlc (successfully) are
> 
> [  486.537128] si2168 1-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
> [  487.795436] si2168 1-0067: firmware version: B 4.0.25
> [  487.807614] si2157 2-0063: Bogus chip version, trying with no firmware
> [  487.807618] si2157 2-0063: found a 'Silicon Labs Si21255-\xff\xff\xff'
> [  487.833876] si2157 2-0063: firmware version: \xff.\xff.255

No, I mean with the first patch you sent to the ML, with the powerup
hack.


Thanks,
Mauro

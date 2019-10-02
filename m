Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1809C911B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 20:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbfJBStc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 14:49:32 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57672 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfJBStb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 14:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wUnZwvjJy/SR7Md0G0Vpiggc+QNzc3d1y1Epk6yyVOQ=; b=NfFebkNuyhWz+OlrPzkAYibBD
        PliwIEkOqDDImq5rCfEtNVZaKDiYZbPCnkbdcRiGiwvlEq/7q30bqpZwo7VstjIDfZ7s6P+Lwm0yK
        uhnYmiqZvEp1U3cMCX0Tf67QlY7x+imM0XoZlAO1YmAOVy/Q1wqASuuYyVqWUfjn/5J0n50yda98x
        OgDHTv2//ougLpujno0I3yD/dKRVR7soAM4MzD0vFnYd0ZuKqF6ZKK0m18bVe5AfW1NycSprT15GE
        3bAJUBdedNAZytALygECAWvHr/ZzLxMp85LcEsybuM7ejEnJhj9F5Gxll4EGeEiSgOxa2Xz0HTxZ8
        Vy4Iz1T9w==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFjgk-0002rx-IW; Wed, 02 Oct 2019 18:49:26 +0000
Date:   Wed, 2 Oct 2019 15:49:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     JP <jp@jpvw.nl>, crope@iki.fi
Cc:     Gonsolo <gonsolo@gmail.com>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191002154922.7f1cfc76@coco.lan>
In-Reply-To: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
References: <20191001205203.4b1a5fb6@coco.lan>
        <20191002141359.30166-1-gonsolo@gmail.com>
        <20191002141359.30166-2-gonsolo@gmail.com>
        <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 2 Oct 2019 19:23:02 +0200
JP <jp@jpvw.nl> escreveu:

> Hi all.
> 
> On 10/2/19 5:21 PM, Gonsolo wrote:
> > Hi!
> >  
> >> Antti has some great suggestions in that thread:
> >>          https://lkml.org/lkml/2017/5/24/245
> >>
> >> Also note https://lkml.org/lkml/2017/5/26/357 if you have access to a
> >> logic analyser.  
> > I read that thread. Unfortunately I'm not a hardware engineer nor do I
> > have access to a logic analyser, just the device and a remote hope not
> > to keep my custom 4.13 kernel forever or to have to buy a new DVB T2
> > device. :(
> > In the above thread it is mentioned that even the Windows driver
> > receives the ffff's so maybe it is a hardware bug?  
> Looks like it is:
> http://lkml.iu.edu/hypermail/linux/kernel/1710.3/03205.html

Hmm... changing the pull-up register will very likely change the
timings.

There's a logic at the driver that changes the I2C bus speed to
300k (with is non-standard):


		/* I2C master bus 2 clock speed 300k */
		ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
		if (ret < 0)
			goto err;

		/* I2C master bus 1,3 clock speed 300k */
		ret = af9035_wr_reg(d, 0x00f103, 0x07);
		if (ret < 0)
			goto err;

Perhaps if we reduce the bus speed to 100k, the device will work
without the hacks.

I don't have af9035 datasheets. Perhaps Antti could shed some
light about how to change the speed to 100k, but on a quick search 
at the Internet, I found this:

	https://lore.kernel.org/linux-media/1312539895.2763.33.camel@Jason-Linux/

With has a comment that explains how the I2C speed is calculated on those
ITE devices:

	#define    p_reg_one_cycle_counter_tuner	0xF103

	/* Define I2C master speed, the default value 0x07 means 366KHz (1000000000 / (24.4 * 16 * User_I2C_SPEED)). */
	#define User_I2C_SPEED 0x07

	error =
	    it9135_write_reg(data, 0, PROCESSOR_LINK,
			     p_reg_one_cycle_counter_tuner, User_I2C_SPEED);

So, in summary, the value for the I2C speed register is given by:

	I2C_speed_register = (1000000000 / (24.4 * 16 * I2C_speed))

So, for 100 kbps, the I2C speed register should be set with a value
close to ~25,6.

Doing the reverse math, we have:

	I2C_speed_register = 25 -> I2C_speed = 102,46 kbps
	I2C_speed_register = 26 -> I2C_speed = 98,52 kbps

So, if we do:

		/* I2C master bus 2 clock speed ~100k */
		ret = af9035_wr_reg(d, 0x00f6a7, 26);
		if (ret < 0)
			goto err;

		/* I2C master bus 1,3 clock speed ~100k */
		ret = af9035_wr_reg(d, 0x00f103, 26);
		if (ret < 0)
			goto err;

The bus speed will reduce to 98,52 kbps, with is a typical nominal
value for I2C tuners and other devices. With that, the device should 
probably work fine without needing to replace the pull up resistor.

Ok, tuner firmware load would be ~3,7 times slower, but this is
something that we do just once need a firmware). 

All other I2C messages are short enough to not cause any real difference.


Could you please test the enclosing patch and see if, with that, you
can remove the hacks you added for the tuner probe to work?

Regards,
Mauro

[PATCH] media: af9035: slow down I2C bus speed on it930x devices

We have a few reports about tuner probing instability with
some it930x devices.

As it is better safe than sorry, let's slow down the I2C,
using the formula found at an old patch:

https://lore.kernel.org/linux-media/1312539895.2763.33.camel@Jason-Linux/

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 3afd18733614..df2c75b84be8 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1197,6 +1197,9 @@ static int af9035_frontend_attach(struct dvb_usb_adapter *adap)
 	return ret;
 }
 
+/* I2C speed register = (1000000000 / (24.4 * 16 * I2C_speed)) */
+#define I2C_SPEED_REGISTER 26
+
 static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 {
 	struct state *state = adap_to_priv(adap);
@@ -1208,13 +1211,13 @@ static int it930x_frontend_attach(struct dvb_usb_adapter *adap)
 
 	dev_dbg(&intf->dev, "adap->id=%d\n", adap->id);
 
-	/* I2C master bus 2 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f6a7, 0x07);
+	/* I2C master bus 2 clock speed ~100k */
+	ret = af9035_wr_reg(d, 0x00f6a7, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 
-	/* I2C master bus 1,3 clock speed 300k */
-	ret = af9035_wr_reg(d, 0x00f103, 0x07);
+	/* I2C master bus 1,3 clock speed ~100k */
+	ret = af9035_wr_reg(d, 0x00f103, I2C_SPEED_REGISTER);
 	if (ret < 0)
 		goto err;
 


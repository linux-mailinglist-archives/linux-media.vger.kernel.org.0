Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0572730E81
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 15:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfEaNDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 09:03:54 -0400
Received: from casper.infradead.org ([85.118.1.10]:56632 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaNDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 09:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ftc1mEIFCTo3x66DOUH1XTuXVz233fnNb8/NIDvRBTY=; b=R0ADmDqucmKlXkXAoPn4XXo7wb
        0M1Bieai55+CjI3HJROkyOhGaepr3lbX38M0Gh0oWvEkIxHU7OPbZDpWfjy4VjfrQsPrMFT7V1en1
        ok5a6gJ7ms9/VfkiKQBG0wPxbxw1d6dkZrMe6qbVHUgkOWhvzXATrXjJu76zBiXr9FXWLjDVwf37a
        8Je3kYfuKncQdXXv/Pux10iLYEhPdyFPsikUusGKSQfWQyCwnQQR41777jtWg3jg84AagCmNS9ISY
        XzDlK3wtGx1m5vaifBzt+lUkQF0/4hLBMZ2Zh0FbJekUu6xiY9vkivkaoZPTkUuyn50IGpmnBJkXp
        1bqzQCVA==;
Received: from 179.187.96.185.dynamic.adsl.gvt.net.br ([179.187.96.185] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWhCH-00030q-8q; Fri, 31 May 2019 13:03:49 +0000
Date:   Fri, 31 May 2019 10:03:44 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
Message-ID: <20190531100240.6f9e5c12@coco.lan>
In-Reply-To: <20190531112723.ijhkpi354ussgvxq@kekkonen.localdomain>
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
        <20190531112723.ijhkpi354ussgvxq@kekkonen.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Em Fri, 31 May 2019 14:27:24 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> On Wed, May 29, 2019 at 03:25:18PM -0400, Mauro Carvalho Chehab wrote:
> > From: Robert Jarzmik <robert.jarzmik@free.fr>

As stated here, this patch is not really mine. It is a rebased version of a 
patch that was delegated to a sub-maintainer, being on his queue for more
than 2 years.

> > 
> > In the soc_camera removal, the board specific power callback was
> > dropped. This at least will remove the power optimization from ezx and
> > em-x270 pxa based boards.
> > 
> > As to recreate the same level of functionality, make the mt9m111 have a
> > regulator providing it its power, so that board designers can plug in a
> > gpio based or ldo regulator, mimicking their former soc_camera power
> > hook.
> > 
> > Fixes: 5c10113cc668 ("media: mt9m111: make a standalone v4l2 subdevice")
> > 
> > [mchehab+samsung@kernel.org: check return values for regulator_enable and
> >  fix a build warning]
> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> > 
> > This is a respin of this patch:
> > 
> >     http://patchwork.linuxtv.org/patch/37950/
> > 
> > rebased (and fixed) to apply on the top of upstream.
> > 
> > While checking old patches at the ML, I noticed that this patch
> > was never applied:
> > 
> >     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238720.html
> > 
> >  The first patch of this series got applied, though:
> > 
> >   c771f42fed7f ("[media] media: platform: pxa_camera: add missing sensor power on")
> > 
> > So, I'm closing the original patch as obsoleted and I'm sending this
> > one to the ML for tests.
> > 
> > Can anyone test this patch and send a tested-by?
> > 
> >  drivers/media/i2c/mt9m111.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> > index 5168bb5880c4..746d1345b505 100644
> > --- a/drivers/media/i2c/mt9m111.c
> > +++ b/drivers/media/i2c/mt9m111.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/log2.h>
> >  #include <linux/gpio.h>
> >  #include <linux/delay.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/v4l2-mediabus.h>
> >  #include <linux/module.h>
> >  #include <linux/property.h>
> > @@ -243,6 +244,7 @@ struct mt9m111 {
> >  	int power_count;
> >  	const struct mt9m111_datafmt *fmt;
> >  	int lastpage;	/* PageMap cache value */
> > +	struct regulator *regulator;
> >  	bool is_streaming;
> >  	/* user point of view - 0: falling 1: rising edge */
> >  	unsigned int pclk_sample:1;
> > @@ -982,6 +984,12 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	if (mt9m111->regulator) {
> > +		ret = regulator_enable(mt9m111->regulator);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >  	ret = mt9m111_resume(mt9m111);
> >  	if (ret < 0) {
> >  		dev_err(&client->dev, "Failed to resume the sensor: %d\n", ret);
> > @@ -994,6 +1002,8 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
> >  static void mt9m111_power_off(struct mt9m111 *mt9m111)
> >  {
> >  	mt9m111_suspend(mt9m111);
> > +	if (mt9m111->regulator)  
> 
> You could omit this check, same for the above. As Mita-san explained, it
> falls back to using the dummy regulator if there isn't one defined.
> 
> > +		regulator_disable(mt9m111->regulator);

Makes sense to me.

Feel free to remove it and apply on your tree.

> >  	v4l2_clk_disable(mt9m111->clk);
> >  }
> >  
> > @@ -1256,6 +1266,13 @@ static int mt9m111_probe(struct i2c_client *client,
> >  	if (IS_ERR(mt9m111->clk))
> >  		return PTR_ERR(mt9m111->clk);
> >  
> > +	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
> > +	if (IS_ERR(mt9m111->regulator)) {
> > +		dev_err(&client->dev, "regulator not found: %ld\n",
> > +			PTR_ERR(mt9m111->regulator));
> > +		return PTR_ERR(mt9m111->regulator);
> > +	}
> > +
> >  	/* Default HIGHPOWER context */
> >  	mt9m111->ctx = &context_b;
> >    
> 



Thanks,
Mauro

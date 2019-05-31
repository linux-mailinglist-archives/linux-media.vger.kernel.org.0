Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0BF130D4E
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 13:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEaL1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 07:27:34 -0400
Received: from mga07.intel.com ([134.134.136.100]:17461 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfEaL1d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 07:27:33 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 04:27:33 -0700
X-ExtLoop1: 1
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.60.218])
  by fmsmga001.fm.intel.com with ESMTP; 31 May 2019 04:27:30 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 6241821D78; Fri, 31 May 2019 14:27:24 +0300 (EEST)
Date:   Fri, 31 May 2019 14:27:24 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
Message-ID: <20190531112723.ijhkpi354ussgvxq@kekkonen.localdomain>
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, May 29, 2019 at 03:25:18PM -0400, Mauro Carvalho Chehab wrote:
> From: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> In the soc_camera removal, the board specific power callback was
> dropped. This at least will remove the power optimization from ezx and
> em-x270 pxa based boards.
> 
> As to recreate the same level of functionality, make the mt9m111 have a
> regulator providing it its power, so that board designers can plug in a
> gpio based or ldo regulator, mimicking their former soc_camera power
> hook.
> 
> Fixes: 5c10113cc668 ("media: mt9m111: make a standalone v4l2 subdevice")
> 
> [mchehab+samsung@kernel.org: check return values for regulator_enable and
>  fix a build warning]
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
> 
> This is a respin of this patch:
> 
>     http://patchwork.linuxtv.org/patch/37950/
> 
> rebased (and fixed) to apply on the top of upstream.
> 
> While checking old patches at the ML, I noticed that this patch
> was never applied:
> 
>     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238720.html
> 
>  The first patch of this series got applied, though:
> 
>   c771f42fed7f ("[media] media: platform: pxa_camera: add missing sensor power on")
> 
> So, I'm closing the original patch as obsoleted and I'm sending this
> one to the ML for tests.
> 
> Can anyone test this patch and send a tested-by?
> 
>  drivers/media/i2c/mt9m111.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 5168bb5880c4..746d1345b505 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -13,6 +13,7 @@
>  #include <linux/log2.h>
>  #include <linux/gpio.h>
>  #include <linux/delay.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <linux/module.h>
>  #include <linux/property.h>
> @@ -243,6 +244,7 @@ struct mt9m111 {
>  	int power_count;
>  	const struct mt9m111_datafmt *fmt;
>  	int lastpage;	/* PageMap cache value */
> +	struct regulator *regulator;
>  	bool is_streaming;
>  	/* user point of view - 0: falling 1: rising edge */
>  	unsigned int pclk_sample:1;
> @@ -982,6 +984,12 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  	if (ret < 0)
>  		return ret;
>  
> +	if (mt9m111->regulator) {
> +		ret = regulator_enable(mt9m111->regulator);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	ret = mt9m111_resume(mt9m111);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "Failed to resume the sensor: %d\n", ret);
> @@ -994,6 +1002,8 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  static void mt9m111_power_off(struct mt9m111 *mt9m111)
>  {
>  	mt9m111_suspend(mt9m111);
> +	if (mt9m111->regulator)

You could omit this check, same for the above. As Mita-san explained, it
falls back to using the dummy regulator if there isn't one defined.

> +		regulator_disable(mt9m111->regulator);
>  	v4l2_clk_disable(mt9m111->clk);
>  }
>  
> @@ -1256,6 +1266,13 @@ static int mt9m111_probe(struct i2c_client *client,
>  	if (IS_ERR(mt9m111->clk))
>  		return PTR_ERR(mt9m111->clk);
>  
> +	mt9m111->regulator = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(mt9m111->regulator)) {
> +		dev_err(&client->dev, "regulator not found: %ld\n",
> +			PTR_ERR(mt9m111->regulator));
> +		return PTR_ERR(mt9m111->regulator);
> +	}
> +
>  	/* Default HIGHPOWER context */
>  	mt9m111->ctx = &context_b;
>  

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com

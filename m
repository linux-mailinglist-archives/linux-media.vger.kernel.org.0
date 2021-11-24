Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFD445B90B
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 12:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241139AbhKXL2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 06:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240520AbhKXL2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 06:28:17 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2E9C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 03:25:08 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pqOcmeCmKCMnApqOgmvafp; Wed, 24 Nov 2021 12:25:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637753106; bh=Bc03DottPvarnXl4qpEyaWgUI+lK7hHXOzP8lHkKhpY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NGxDGhmok8Jik/ZuUi69Ny0RciS+bNnIIXEPaPd3B5VzWt31AaS0l4mkC2AlaEIB7
         TIYON1D9tk4tv43b6bWA5bELJciSJadOesYQ8idDzh8+ThLgzNSZyOfrCihdUTHgkl
         LsDDEkwsHtAzD37Kf2gfkEk66bwsb7PmqikM+BCu83L+IwRP5PlwA9TcyXveRm1fkd
         f36WhT/FW6u0YHj2vv79beRpu++3Bgy428b1BfY4F8TYqXzkSeAQPYdulJYsLsOwVK
         PdsAJ+bmd5YVnIMqxSkmRzyvJN96wMNB5YXUpM4YJKPJQOG7BpQvV3CtKdCv/j7VcW
         7mNR4VyvXK6pQ==
Subject: Re: [PATCH] s5c73m3: adding gpiod support for the s5c73m3
To:     =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
References: <YWXmB3yHDeR9ORN7@fedora>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <88ea0b6a-bcb4-94dc-d9c9-a0caa9b9b6e2@xs4all.nl>
Date:   Wed, 24 Nov 2021 12:25:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWXmB3yHDeR9ORN7@fedora>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfA2Gij6GBbRhu/PAs8tN0E7YiGYFQnsjijbFUpwkFJSZBlcVDDilUVVjfElKdz96G1SvkZdmpZeP5kglU0CKQFagoTA/2ZCxBEIfG1ReQrhq/lYrWzs+
 sWjfEQ3cWHhW6A2xj3CJlZm4A1BR0ccLAx8xUsDRUVrNSOPWLIVRI5S5Hbp0zkLMi3rI8LgUo7vEA1v7rDiom9Ub7xYXnp0IDsyVSDeuecK6wAyJraFWy1pb
 vAQGPs3naSAm+P55yu6xEgMSpN+qTP7Lwb7amSRceUBtV/eFvUTbMV3u6bwQNbkBGeazt14I2uOkou+2beRfxg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maíra,

On 12/10/2021 21:46, Maíra Canal wrote:
> Removing old gpiod interface and replacing it for the gpiod consumer
> interface.

Has this been tested? I feel a bit uncomfortable to merged this without
knowing that it works. Andrzej, what do you think about this patch?

Maíra, is there a specific reason why you made this patch?

Regards,

	Hans

> 
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c | 25 +++++++++++++-----------
>  include/media/i2c/s5c73m3.h              |  3 ++-
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> index e2b88c5e4f98..0c69a3fc7ebe 100644
> --- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> @@ -10,7 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/firmware.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/media.h>
> @@ -1349,9 +1349,9 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  
>  static int s5c73m3_gpio_set_value(struct s5c73m3 *priv, int id, u32 val)
>  {
> -	if (!gpio_is_valid(priv->gpio[id].gpio))
> +	if (!priv->gpio[id].gpio)
>  		return 0;
> -	gpio_set_value(priv->gpio[id].gpio, !!val);
> +	gpiod_set_value(priv->gpio[id].gpio, !!val);
>  	return 1;
>  }
>  
> @@ -1548,20 +1548,24 @@ static int s5c73m3_configure_gpios(struct s5c73m3 *state)
>  	static const char * const gpio_names[] = {
>  		"S5C73M3_STBY", "S5C73M3_RST"
>  	};
> +	static const char * const prop_names[] = {
> +		"standby", "xshutdown",
> +	};
> +
>  	struct i2c_client *c = state->i2c_client;
>  	struct s5c73m3_gpio *g = state->gpio;
> -	int ret, i;
> +	int i;
>  
>  	for (i = 0; i < GPIO_NUM; ++i) {
> -		unsigned int flags = GPIOF_DIR_OUT;
> +		unsigned int flags = GPIOD_OUT_LOW;
>  		if (g[i].level)
> -			flags |= GPIOF_INIT_HIGH;
> -		ret = devm_gpio_request_one(&c->dev, g[i].gpio, flags,
> -					    gpio_names[i]);
> -		if (ret) {
> +			flags = GPIOD_OUT_HIGH;
> +		g[i].gpio = devm_gpiod_get_optional(&c->dev, prop_names[i],
> +				flags);
> +		if (IS_ERR(g[i].gpio)) {
>  			v4l2_err(c, "failed to request gpio %s\n",
>  				 gpio_names[i]);
> -			return ret;
> +			return PTR_ERR(g[i].gpio);
>  		}
>  	}
>  	return 0;
> @@ -1586,7 +1590,6 @@ static int s5c73m3_parse_gpios(struct s5c73m3 *state)
>  				prop_names[i]);
>  			return -EINVAL;
>  		}
> -		state->gpio[i].gpio = ret;
>  		state->gpio[i].level = !(of_flags & OF_GPIO_ACTIVE_LOW);
>  	}
>  	return 0;
> diff --git a/include/media/i2c/s5c73m3.h b/include/media/i2c/s5c73m3.h
> index a51f1025ba1c..41e2235f0626 100644
> --- a/include/media/i2c/s5c73m3.h
> +++ b/include/media/i2c/s5c73m3.h
> @@ -17,6 +17,7 @@
>  #ifndef MEDIA_S5C73M3__
>  #define MEDIA_S5C73M3__
>  
> +#include <linux/gpio/consumer.h>
>  #include <linux/videodev2.h>
>  #include <media/v4l2-mediabus.h>
>  
> @@ -26,7 +27,7 @@
>   * @level: indicates active state of the @gpio
>   */
>  struct s5c73m3_gpio {
> -	int gpio;
> +	struct gpio_desc *gpio;
>  	int level;
>  };
>  
> 


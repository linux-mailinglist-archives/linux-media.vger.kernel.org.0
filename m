Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32F72F5FAE
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 12:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbhANLTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 06:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbhANLTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 06:19:13 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CE6C061574
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:18:27 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id by27so5269208edb.10
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oMXqeMRgogvpAtSzox/t6jdt0m4zdM9nq0pNDIlk2/Q=;
        b=E/Q87kDjjgh1IHjo4RaoYCjBb2WfR++iSMO04iGobS1TwrQ9NO8VxThPpszalrdLnM
         +zzfl+HQor1d3r03JVkrP6IsXrUbU0g7tojoGSKW3VE9BFY5GTu8WV0XkRf7YxJnqzst
         acj0UqTl1D0ltD+S8sbcOZyVL6qqMbL86MAUkzUKdWXw03EfIwfX74GCWZwjxBdNS+IO
         +SREvIayq0wyLQ2lt4LW3IbhD8s7+Q61cm6DLJ4+wb4xpythdlVuxeMMc4IliSBTstKp
         /oBUooSNg0NLi97Q7JYe91Ukfam4etDRndmdL2qBw7ejmrUlvb0r/UWadXU9WD5RKTMC
         iPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMXqeMRgogvpAtSzox/t6jdt0m4zdM9nq0pNDIlk2/Q=;
        b=lbcazEUMCqDSoAzlFLDFnhups7WIxm8QcJfPjsNoBo1N9ThfygPDRJ30b6oaUv+8j5
         ljGBuyqGbv7kOceZerBmQzXTrkPL5/JyB/owLXyk+NiKm7pXtBGXx7W8NYqi2/iW3tpL
         lZTfqaGZ3lXNaJM4QjMKNdAn5fMtBbjD9RRtViGHg/3/Eq0JDZbyylXarje71GXwFJ9q
         FRXIC4opqils8WKvCwqZpNqch2fQyx9R4p509Td7hA/VEaiwyaGeNGGraY4GbvEeXioU
         9N3dp4rs+yz86WdPOj2l0w+Vc588DWa6h+S0LCY5zDv6O/9nHQc3MsJNgHHkp1HgaPR0
         xPsA==
X-Gm-Message-State: AOAM532wu/ItI7jXxN/omDqqT0VtjAqxVpdHrtPy6YSCnML+xk3Nk7eL
        wlxayhIN0BIfRkf1jYal1Z8=
X-Google-Smtp-Source: ABdhPJxmi62TLisxckLcQgu4ebSr4lQtAODlf45rIny0oFJfye5FMJi/clRWKjwq+N8jd8U9UU+GtA==
X-Received: by 2002:a50:f299:: with SMTP id f25mr5307794edm.133.1610623106096;
        Thu, 14 Jan 2021 03:18:26 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id a2sm1838458ejt.46.2021.01.14.03.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:18:25 -0800 (PST)
Subject: Re: [PATCH v2 3/6] media: ov9640: Use the generic clock framework
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-4-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <a27ffe7e-9073-9440-c345-1391e104d9cd@gmail.com>
Date:   Thu, 14 Jan 2021 12:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194919.50176-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Petr Cvek <petrcvekcz@gmail.com>

Dne 12. 01. 21 v 20:49 Ezequiel Garcia napsal(a):
> Commit 63839882c597 ("media: mach-pxa: palmz72/pcm990: remove soc_camera dependencies")
> removed the last in-tree user of this sensor. New users
> will be required to use the generic clock framework,
> so it's possible to convert the driver to use it.
> 
> Convert the driver to use the CCF, and drop the legacy
> v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/i2c/ov9640.c | 15 ++++++---------
>  drivers/media/i2c/ov9640.h |  2 +-
>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
> index e2a25240fc85..d36b04c49628 100644
> --- a/drivers/media/i2c/ov9640.c
> +++ b/drivers/media/i2c/ov9640.c
> @@ -17,6 +17,7 @@
>   * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> @@ -26,7 +27,6 @@
>  #include <linux/videodev2.h>
>  
>  #include <media/v4l2-async.h>
> -#include <media/v4l2-clk.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -333,13 +333,13 @@ static int ov9640_s_power(struct v4l2_subdev *sd, int on)
>  	if (on) {
>  		gpiod_set_value(priv->gpio_power, 1);
>  		usleep_range(1000, 2000);
> -		ret = v4l2_clk_enable(priv->clk);
> +		ret = clk_prepare_enable(priv->clk);
>  		usleep_range(1000, 2000);
>  		gpiod_set_value(priv->gpio_reset, 0);
>  	} else {
>  		gpiod_set_value(priv->gpio_reset, 1);
>  		usleep_range(1000, 2000);
> -		v4l2_clk_disable(priv->clk);
> +		clk_disable_unprepare(priv->clk);
>  		usleep_range(1000, 2000);
>  		gpiod_set_value(priv->gpio_power, 0);
>  	}
> @@ -719,7 +719,7 @@ static int ov9640_probe(struct i2c_client *client,
>  
>  	priv->subdev.ctrl_handler = &priv->hdl;
>  
> -	priv->clk = v4l2_clk_get(&client->dev, "mclk");
> +	priv->clk = devm_clk_get(&client->dev, "mclk");
>  	if (IS_ERR(priv->clk)) {
>  		ret = PTR_ERR(priv->clk);
>  		goto ectrlinit;
> @@ -727,17 +727,15 @@ static int ov9640_probe(struct i2c_client *client,
>  
>  	ret = ov9640_video_probe(client);
>  	if (ret)
> -		goto eprobe;
> +		goto ectrlinit;
>  
>  	priv->subdev.dev = &client->dev;
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret)
> -		goto eprobe;
> +		goto ectrlinit;
>  
>  	return 0;
>  
> -eprobe:
> -	v4l2_clk_put(priv->clk);
>  ectrlinit:
>  	v4l2_ctrl_handler_free(&priv->hdl);
>  
> @@ -749,7 +747,6 @@ static int ov9640_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov9640_priv *priv = to_ov9640_sensor(sd);
>  
> -	v4l2_clk_put(priv->clk);
>  	v4l2_async_unregister_subdev(&priv->subdev);
>  	v4l2_ctrl_handler_free(&priv->hdl);
>  
> diff --git a/drivers/media/i2c/ov9640.h b/drivers/media/i2c/ov9640.h
> index a8ed6992c1a8..c105594b2472 100644
> --- a/drivers/media/i2c/ov9640.h
> +++ b/drivers/media/i2c/ov9640.h
> @@ -196,7 +196,7 @@ struct ov9640_reg {
>  struct ov9640_priv {
>  	struct v4l2_subdev		subdev;
>  	struct v4l2_ctrl_handler	hdl;
> -	struct v4l2_clk			*clk;
> +	struct clk			*clk;
>  	struct gpio_desc		*gpio_power;
>  	struct gpio_desc		*gpio_reset;
>  
> 

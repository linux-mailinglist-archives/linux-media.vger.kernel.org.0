Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25F017754F
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 12:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgCCLdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 06:33:25 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37965 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgCCLdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 06:33:24 -0500
Received: by mail-pf1-f195.google.com with SMTP id q9so1324215pfs.5
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bILEy4M1zqKRLZ2AS6oDJDEkUgcQ2pYShtMFa0Kale8=;
        b=HxJAwJ7Rn9E5nXnIEbkQHHsQMZdICUd3rOlE5seSGGQAXY/5T40GiXveVVUMX+I+vX
         3TmZpuKL8Ik7dcdotnVCc4I6HpHrESLIQsQskjpQkkSZvJLKmeX0zH0s/qd9cG/QchsZ
         byi4wEUVKLfjxjFzTT/pQH6RgAoxjLXsqCmO8XNC7ftSE18RMIwJlVbgFvN4Vc9wBx4p
         qRXJm/Os2W9L1/POGjqcA+z1mVN6R87GEPC1rBlaQ7PEzMGv5zIPrnFiB6L1uOb1Fhv3
         G7MZom6byJfZxrhJqDZGH7617/E8e5yrqq6vjpKn3wREPDsKA+SD5cQSSAntWo1vpubo
         Nafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bILEy4M1zqKRLZ2AS6oDJDEkUgcQ2pYShtMFa0Kale8=;
        b=XbJthCD7nkcRBTUy3xQC/04aZ2+YpxIv9tMHzsCh64rrZ7ARfRRB5oJygPSt69EzrK
         27WBPS5thOJHnVoBur40nf9ljnBRaSHxr2zOW6XNVrMM8EpTkPwyEJYIyBXCj11qVNgE
         kXjPvjh/wlxLhOtPPrvdVV2YWWu//MsAiyCRxp3F24SiMoFlC0G/H9tr5jk+tSXKCSGy
         iRrmbYZ0cIEyWzz6DfveXVzlwG7skVxe1JYNc59ecZD2bu9DBCynLgJowE1tiRsVBiia
         DEG2JL4Yf1od1C3365BrxOEBBqLcOrEXzWiEi/9l9q9ixzWvfO8VrxqeIWe8P+WVkmj/
         /Qow==
X-Gm-Message-State: ANhLgQ3T1z2FVWLHjHrVU1vbk5LYozC3rF2BuIyHxoJEsRlk79OnuZLZ
        7y//Neuh2J7vBE6Ws0uBHRBg
X-Google-Smtp-Source: ADFU+vvZI18gytC/evrv+FJmWH00iO0tFMxL2Mypbs/t9diE7LpovN/8zQ/47XNUxeK7aMuwmlrkaA==
X-Received: by 2002:a63:4763:: with SMTP id w35mr3795434pgk.113.1583235203834;
        Tue, 03 Mar 2020 03:33:23 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id d82sm7486573pfd.187.2020.03.03.03.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 03:33:23 -0800 (PST)
Date:   Tue, 3 Mar 2020 17:03:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, peter.griffin@linaro.org
Subject: Re: [PATCH 3/3] media: i2c: imx290: fix reset GPIO pin handling
Message-ID: <20200303113316.GC16981@mani>
References: <20200226215913.10631-1-andrey.konovalov@linaro.org>
 <20200226215913.10631-4-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226215913.10631-4-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 12:59:13AM +0300, Andrey Konovalov wrote:
> According to https://www.kernel.org/doc/Documentation/gpio/consumer.txt,
> 
> - all of the gpiod_set_value_xxx() functions operate with the *logical* value.
> So in imx290_power_on() the reset signal should be cleared/de-asserted with
> gpiod_set_value_cansleep(imx290->rst_gpio, 0), and in imx290_power_off() the
> value of 1 must be used to apply/assert the reset to the sensor. In the device
> tree the reset pin is described as GPIO_ACTIVE_LOW, and gpiod_set_value_xxx()
> functions take this into account,
> 
> - when devm_gpiod_get_optional() is called with GPIOD_ASIS, the GPIO is not
> initialized, and the direction must be set later; using a GPIO
> without setting its direction first is illegal and will result in undefined
> behavior. Fix this by using GPIOD_OUT_HIGH instead of GPIOD_ASIS (this asserts
> the reset signal to the sensor initially).
> 

I didn't catch this issue since I've been using IMX290 board on top of Sensors
mezzanine which has the pullup on that pin. But this fix LGTM.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index d0322f9a8856..7b1de1f0c8b7 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -628,7 +628,7 @@ static int imx290_power_on(struct device *dev)
>  	}
>  
>  	usleep_range(1, 2);
> -	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
> +	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
>  	usleep_range(30000, 31000);
>  
>  	return 0;
> @@ -641,7 +641,7 @@ static int imx290_power_off(struct device *dev)
>  	struct imx290 *imx290 = to_imx290(sd);
>  
>  	clk_disable_unprepare(imx290->xclk);
> -	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
> +	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
>  	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
>  
>  	return 0;
> @@ -757,7 +757,8 @@ static int imx290_probe(struct i2c_client *client)
>  		goto free_err;
>  	}
>  
> -	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
> +	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
>  	if (IS_ERR(imx290->rst_gpio)) {
>  		dev_err(dev, "Cannot get reset gpio\n");
>  		ret = PTR_ERR(imx290->rst_gpio);
> -- 
> 2.17.1
> 

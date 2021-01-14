Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE9E2F5FBF
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 12:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbhANLWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 06:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbhANLWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 06:22:02 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FECDC061573
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:21:22 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id p22so5277150edu.11
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qkoE1AqELXUHpcjnvVmqBJ05S+byZ0LMjfa0EJS0ZKc=;
        b=tMal7VZ/xQdFEdnG1q7JSi7tJQv0drsussDF+M9L6Nc+eJVgTFnjGqa5IqpyBBzHIg
         547q3u5keL+5+Bz7MujP08/IZT5QgXKVzXcyhoB2wWRtF2thOJufTSkgaMIzwl4mdqEj
         xv1Kt01xJIACMQ8Hmx7fQPPysTlTxrzrKhbTwMdC8Eor/7EDnsImlMV6VmpF792tczev
         qmJe+u8CY4Isw0ZtHaURJNZs6wPgcWluc0sZRoE+lWtfgNEDLfoDnOhe+0NnvbA3ASpJ
         KIFAXMhD98CWYm3A460CKCQuRxklUS9w2hWfnI57YxveE9J4eZt/vXmLfD6zw+gAnPEz
         Fiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qkoE1AqELXUHpcjnvVmqBJ05S+byZ0LMjfa0EJS0ZKc=;
        b=BX/7OTGLnPOkNE5igmsD37B87WsxhSwLcJ79TMHmEb41mJoHv6zK/Hry+PRQUut/6a
         QEt8hPw7y57mgOfjpMRdATlZP/S52cYwrj6335sRa7paI4ijp2913kKZsc/gaKGrwN4+
         2g1GmLR7H7MVGWnhXk1kuJZLtn7Qc4OJ68at/AMPW0sTrI1H6rNQeDwTcBlP5iR+YOcc
         NyGvx6EfeHzrQFv1qzXBVHC5S2EoeN0FGPtWwTzk4y/SUXShaOT+SO7GKkTlHNEsEahF
         XixDrg8LCTlKRKjovHHUdV99ZQIgr0+sO949KQiMbo8hLro3opan0cs8l1gOWwe+x7yT
         Z0IQ==
X-Gm-Message-State: AOAM533M/2DZZkjg3RLeLtKRR9DNWfSxPEeIvrOqQ+faU8tZDIL/9YfV
        DdNJQnCKm3qafB2i1M7odOI=
X-Google-Smtp-Source: ABdhPJx4653fIdXZbBVKOqRMS/laNr+eeRnBZwNp2zLznaKyRc5ZyJN4nK8pfH3LeIjdihtQrLiFlA==
X-Received: by 2002:aa7:d9c1:: with SMTP id v1mr5362870eds.115.1610623281066;
        Thu, 14 Jan 2021 03:21:21 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id k15sm1850298ejc.79.2021.01.14.03.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:21:20 -0800 (PST)
Subject: Re: [PATCH v2 4/6] media: mt9m111: Use the generic clock framework
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-5-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <94357e88-c740-b435-601d-6232599ea02a@gmail.com>
Date:   Thu, 14 Jan 2021 12:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194919.50176-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch compiles

Reviewed-by: Petr Cvek <petrcvekcz@gmail.com>

Dne 12. 01. 21 v 20:49 Ezequiel Garcia napsal(a):
> This sensor driver has a proper device-tree binding, and also
> all its platform-data based in-tree users have been converted to use
> the generic clock framework.
> 
> Convert the driver to use the CCF, and drop the legacy
> v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/i2c/mt9m111.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 69697386ffcd..0e11734f75aa 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2008, Robert Jarzmik <robert.jarzmik@free.fr>
>   */
> +#include <linux/clk.h>
>  #include <linux/videodev2.h>
>  #include <linux/slab.h>
>  #include <linux/i2c.h>
> @@ -16,7 +17,6 @@
>  #include <linux/property.h>
>  
>  #include <media/v4l2-async.h>
> -#include <media/v4l2-clk.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -232,7 +232,7 @@ struct mt9m111 {
>  	struct v4l2_ctrl *gain;
>  	struct mt9m111_context *ctx;
>  	struct v4l2_rect rect;	/* cropping rectangle */
> -	struct v4l2_clk *clk;
> +	struct clk *clk;
>  	unsigned int width;	/* output */
>  	unsigned int height;	/* sizes */
>  	struct v4l2_fract frame_interval;
> @@ -977,7 +977,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
>  	int ret;
>  
> -	ret = v4l2_clk_enable(mt9m111->clk);
> +	ret = clk_prepare_enable(mt9m111->clk);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -995,7 +995,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  	regulator_disable(mt9m111->regulator);
>  
>  out_clk_disable:
> -	v4l2_clk_disable(mt9m111->clk);
> +	clk_disable_unprepare(mt9m111->clk);
>  
>  	dev_err(&client->dev, "Failed to resume the sensor: %d\n", ret);
>  
> @@ -1006,7 +1006,7 @@ static void mt9m111_power_off(struct mt9m111 *mt9m111)
>  {
>  	mt9m111_suspend(mt9m111);
>  	regulator_disable(mt9m111->regulator);
> -	v4l2_clk_disable(mt9m111->clk);
> +	clk_disable_unprepare(mt9m111->clk);
>  }
>  
>  static int mt9m111_s_power(struct v4l2_subdev *sd, int on)
> @@ -1266,7 +1266,7 @@ static int mt9m111_probe(struct i2c_client *client)
>  			return ret;
>  	}
>  
> -	mt9m111->clk = v4l2_clk_get(&client->dev, "mclk");
> +	mt9m111->clk = devm_clk_get(&client->dev, "mclk");
>  	if (IS_ERR(mt9m111->clk))
>  		return PTR_ERR(mt9m111->clk);
>  
> @@ -1311,7 +1311,7 @@ static int mt9m111_probe(struct i2c_client *client)
>  	mt9m111->subdev.ctrl_handler = &mt9m111->hdl;
>  	if (mt9m111->hdl.error) {
>  		ret = mt9m111->hdl.error;
> -		goto out_clkput;
> +		return ret;
>  	}
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
> @@ -1354,8 +1354,6 @@ static int mt9m111_probe(struct i2c_client *client)
>  out_hdlfree:
>  #endif
>  	v4l2_ctrl_handler_free(&mt9m111->hdl);
> -out_clkput:
> -	v4l2_clk_put(mt9m111->clk);
>  
>  	return ret;
>  }
> @@ -1366,7 +1364,6 @@ static int mt9m111_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(&mt9m111->subdev);
>  	media_entity_cleanup(&mt9m111->subdev.entity);
> -	v4l2_clk_put(mt9m111->clk);
>  	v4l2_ctrl_handler_free(&mt9m111->hdl);
>  
>  	return 0;
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBF82F5FC1
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 12:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbhANLWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 06:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbhANLWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 06:22:12 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3661EC061574
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:21:32 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id n26so7600511eju.6
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=54lHshyXCd5J2bpSxJHq8190ToXuA8NzSowLxCNOQ2Y=;
        b=uu4sM3VnzjCvS9GHZJ0xOpiV5gpME4zYCL/Y3/f/C6C1ptRVLEoIfgy9KaUkQ79UkS
         GdsgLzoqzas1jNiPEWBo7IbekOieWLMaR37PSthO6peVeY6lBk5KyPs85e96mJndsg//
         Dpc64GAEaAlhstcxeNQxxnt/EdyivY4Iv+M0aAkTqibpu9aonqdtPNtaIVGWeTJifs6v
         E5SeI3VbwTgBhgWmq4Qf5mJ++PP1h3PUivJ4XOEyMHDerkx4lVRgmSDr+bnJHQq98RhK
         ShTWNHpeVjCqruTDHVF+9lfTGwdXsyEEUZH97Z56/OQeV4hfqtDbVE7H3xfVr8Lr6jP1
         4avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=54lHshyXCd5J2bpSxJHq8190ToXuA8NzSowLxCNOQ2Y=;
        b=jH9Q8eWY3HrkAz1ZB9yI2tZm2fdfP2U5nMYj+JJ2e8sbdQNEpn7wOYcFXniF6xM1Yt
         pVu1CyutcBLSgeydzs9DxSOR8RzgLk9vwknOXH3jKXq9rfp7nBpflOElxPqDIqvA4k2u
         EPMmXrV2SUUUWTW2qdQ8a1ClS0Ua3+b5qTUhsbdP/jYtkeZfvrt916dSqrJImLciAWG1
         aeZsoygRr9c/AI33osmLxu1i/chNt6EPZ7kYHz0SZEa9opwu3lv7J1EGLAw5X6CuTCx/
         HGZfkl3d3aIr9YRPJ6fhXlfnwADr5hYcDHDtrFotXxr5gBFj7hkhC5yjfR6pPiOJnr+p
         ry9Q==
X-Gm-Message-State: AOAM532ma25kCQqgQzHL2av8cJyAhcRB5aScrqkOFWD6cFNnwFCmT6Y+
        GThpFpSfWsjWYJnBytFv5d8=
X-Google-Smtp-Source: ABdhPJy/XqmKLzPhQq2X0ON6oXClPk12n31kPxo0bl+DK3gDIaQwbxZArL05f/UAGgg06bJhEWVGNg==
X-Received: by 2002:a17:906:178d:: with SMTP id t13mr4781938eje.455.1610623290819;
        Thu, 14 Jan 2021 03:21:30 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id mc25sm1882766ejb.58.2021.01.14.03.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:21:30 -0800 (PST)
Subject: Re: [PATCH v2 5/6] media: ov6650: Use the generic clock framework
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-6-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <bc5be626-a70f-9b4c-e7fa-b27899a44e48@gmail.com>
Date:   Thu, 14 Jan 2021 12:25:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194919.50176-6-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch compiles

Reviewed-by: Petr Cvek <petrcvekcz@gmail.com>


Dne 12. 01. 21 v 20:49 Ezequiel Garcia napsal(a):
> Commit ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
> removed the last in-tree user of this sensor. New users
> will be required to use the generic clock framework,
> so it's possible to convert the driver to use it.
> 
> Convert the driver to use the CCF, and drop the legacy
> v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  drivers/media/i2c/ov6650.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index d73f9f540932..85dd13694bd2 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -22,13 +22,13 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <linux/module.h>
>  
> -#include <media/v4l2-clk.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  
> @@ -194,7 +194,7 @@ struct ov6650 {
>  		struct v4l2_ctrl *blue;
>  		struct v4l2_ctrl *red;
>  	};
> -	struct v4l2_clk		*clk;
> +	struct clk		*clk;
>  	bool			half_scale;	/* scale down output by 2 */
>  	struct v4l2_rect	rect;		/* sensor cropping window */
>  	struct v4l2_fract	tpf;		/* as requested with s_frame_interval */
> @@ -459,9 +459,9 @@ static int ov6650_s_power(struct v4l2_subdev *sd, int on)
>  	int ret = 0;
>  
>  	if (on)
> -		ret = v4l2_clk_enable(priv->clk);
> +		ret = clk_prepare_enable(priv->clk);
>  	else
> -		v4l2_clk_disable(priv->clk);
> +		clk_disable_unprepare(priv->clk);
>  
>  	return ret;
>  }
> @@ -821,14 +821,14 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  	u8 pidh, pidl, midh, midl;
>  	int i, ret = 0;
>  
> -	priv->clk = v4l2_clk_get(&client->dev, NULL);
> +	priv->clk = devm_clk_get(&client->dev, NULL);
>  	if (IS_ERR(priv->clk)) {
>  		ret = PTR_ERR(priv->clk);
> -		dev_err(&client->dev, "v4l2_clk request err: %d\n", ret);
> +		dev_err(&client->dev, "clk request err: %d\n", ret);
>  		return ret;
>  	}
>  
> -	rate = v4l2_clk_get_rate(priv->clk);
> +	rate = clk_get_rate(priv->clk);
>  	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
>  		if (rate != ov6650_xclk[i].rate)
>  			continue;
> @@ -839,8 +839,8 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  		break;
>  	}
>  	for (i = 0; !xclk && i < ARRAY_SIZE(ov6650_xclk); i++) {
> -		ret = v4l2_clk_set_rate(priv->clk, ov6650_xclk[i].rate);
> -		if (ret || v4l2_clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
> +		ret = clk_set_rate(priv->clk, ov6650_xclk[i].rate);
> +		if (ret || clk_get_rate(priv->clk) != ov6650_xclk[i].rate)
>  			continue;
>  
>  		xclk = &ov6650_xclk[i];
> @@ -852,12 +852,12 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  		dev_err(&client->dev, "unable to get supported clock rate\n");
>  		if (!ret)
>  			ret = -EINVAL;
> -		goto eclkput;
> +		return ret;
>  	}
>  
>  	ret = ov6650_s_power(sd, 1);
>  	if (ret < 0)
> -		goto eclkput;
> +		return ret;
>  
>  	msleep(20);
>  
> @@ -899,11 +899,6 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  
>  done:
>  	ov6650_s_power(sd, 0);
> -	if (!ret)
> -		return 0;
> -eclkput:
> -	v4l2_clk_put(priv->clk);
> -
>  	return ret;
>  }
>  
> @@ -1089,7 +1084,6 @@ static int ov6650_remove(struct i2c_client *client)
>  {
>  	struct ov6650 *priv = to_ov6650(client);
>  
> -	v4l2_clk_put(priv->clk);
>  	v4l2_async_unregister_subdev(&priv->subdev);
>  	v4l2_ctrl_handler_free(&priv->hdl);
>  	return 0;
> 

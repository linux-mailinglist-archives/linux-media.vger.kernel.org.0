Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C742EF18C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 12:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbhAHLnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 06:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbhAHLnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 06:43:18 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DE1C0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 03:42:38 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o17so22243827lfg.4
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZmiFX6dUbDPmX1zecG34AKCOjgvq3BHChRy53qjsFh0=;
        b=hcx99L+i/K7TT7TKNt74GMrmhaXBZ7TZaKxXoj1CFGapQXuBi7brZ5H0aItSUFR/6O
         s+v50l/zQiEHYIs4X76cdul8I/GxhJX98KP3/9YixL7hvZ1131f1k6YiBiwFP9NsYNyf
         d5w9CemLBHaU/qQp4Yl8au+s5NAnO4JZ0nLu0mt6O+HQqNwrbo0rZ3NCYWw5i647a/VU
         k2I1JauEUOfznAypa8gsB9tPMK4o9y5+g3s18RAcZviJTyu0ohz35SJA5nIde/lbRwxb
         rciWoKP9UsLVO/fW5cf+astb2IPuS8DqrX/isNStzMmwYAhFXPHiVrYBi/5qgux8kdL1
         aCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmiFX6dUbDPmX1zecG34AKCOjgvq3BHChRy53qjsFh0=;
        b=ONVFTnPlgn8LmoTTb9rDfl3wHItMHt0oFGQdcyUYNPBz7savv6JnacAFAeTunxd26V
         pLXZuo2CbBu5EJJzc5hrIDdyp7zFHCfMZrAFUrEWAacP9L9UqBKlXEeLoP86ecl9qAsL
         j04rFFXG/tJVrv3woux5M/WIY34wop3OJ4TWA6jlcmxvZrNoUUZ5ZC6Z7P104KbX+ZPQ
         oeOTaID2KraVYZP6NqvrYyiUMoU/NwvI8egic+R/GAM4HisLlIeBH+oQzY32Gm48Zpgs
         Fk/jcJGvYn09+TM/XjRbEzHnmGrhv5e8KpoS/+l5fMnPmjgQbNKr/Ui+E7PYYhKLBz30
         lHig==
X-Gm-Message-State: AOAM532nZngkMFweBFiJD2mIxYD9cJsqQkDKfPr2z9sRN5/0cLaz4ZgB
        uTGKGtsHpgzsx20fLvPPmaXJk823fw2BzA==
X-Google-Smtp-Source: ABdhPJxZdVJoyfAJ5EXNUYtKuPYc3D7+oHwnc5NO5UrO+yqcVEF1mu/hrL+l97LTHgFCxEzkxLedmA==
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr1451684ljk.333.1610106156568;
        Fri, 08 Jan 2021 03:42:36 -0800 (PST)
Received: from z50.localnet (77-255-201-154.adsl.inetia.pl. [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id t25sm1915413lfl.105.2021.01.08.03.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:42:35 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 5/6] media: ov6650: Use the generic clock framework
Date:   Fri, 08 Jan 2021 12:42:34 +0100
Message-ID: <12035174.VsHLxoZxqI@z50>
In-Reply-To: <20210104165739.116404-6-ezequiel@collabora.com>
References: <20210104165739.116404-1-ezequiel@collabora.com> <20210104165739.116404-6-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, January 4, 2021 5:57:38 P.M. CET Ezequiel Garcia wrote:
> Commit ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
> removed the last in-tree user of this sensor. New users
> will be required to use the generic clock framework,
> so it's possible to convert the driver to use it.
> 
> Convert the driver to use the CCF, and drop the legacy
> v4l2-clk API.
> 
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/i2c/ov6650.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index d73f9f540932..0f8242054603 100644
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
> @@ -901,9 +901,6 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
>  	ov6650_s_power(sd, 0);
>  	if (!ret)
>  		return 0;

I think the above two lines are no longer needed and should be removed.  
Anyway,

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

> -eclkput:
> -	v4l2_clk_put(priv->clk);
> -
>  	return ret;
>  }
>  
> @@ -1089,7 +1086,6 @@ static int ov6650_remove(struct i2c_client *client)
>  {
>  	struct ov6650 *priv = to_ov6650(client);
>  
> -	v4l2_clk_put(priv->clk);
>  	v4l2_async_unregister_subdev(&priv->subdev);
>  	v4l2_ctrl_handler_free(&priv->hdl);
>  	return 0;
> 





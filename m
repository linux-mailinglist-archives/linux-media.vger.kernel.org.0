Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF05228431
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbgGUPuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 11:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUPuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 11:50:20 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEC4C061794;
        Tue, 21 Jul 2020 08:50:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b25so24606560ljp.6;
        Tue, 21 Jul 2020 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Qu6W1iBoEfGZoFbl66nv2eZlx/w1YMiUENHCaC2VaM=;
        b=Eik8RLjBhiIkiTlZe2NNCyzrHlm+dzDSlBZpddo6PHopquy1/O8uOx4sPCSKbzd/hX
         GKu0s73YBjMBfmz0RUOXH6I9qYKUOt0ha03PZXZEpZK5qsYEdt/SdRlePW4URZWgxnCN
         dTos5CfehMB1zLU7FWcFUqdLtOa3Wev6fRg5fUte/AJjBH8EUgkwm1um9TC4Ybp3bTKz
         G37UKuzPBZzvzOu07bxwkh4adk+uA3DG2kpa9gSsE2F5ZDw8OEsV0jiIMcsuIpQ2GQbt
         hIpxWywPugZTYaIzeD6ShP/DwWKeO0e/pyb2hmkM6pxZxjW+tsCSEe8x2p/OITjKDhby
         Iv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Qu6W1iBoEfGZoFbl66nv2eZlx/w1YMiUENHCaC2VaM=;
        b=A0ApgOR/40aRoyow5RB5GKs0bMtjvihOXo/b8Gd2VoMDY5zI1UfxaCzfhQT3b+8Jbf
         +oKBc4/jvVT5xyy739A4LJFfGZdTsoMjPuo7sW1w37pc2SuzYo724R8hvdRq6HRVc6tO
         ou2+LhvLJxJvGXc8W8ltq/2UCWqHKuBfkTCdCqYLIkgH5JCO3vmbhdv93syYiuZMoqZS
         rx3es6vPCQMKx+SJrjUR7XgBUTq0FSmJ2vW4Bs9lT8WuhcHNOv8hHmiO04g4N0+tmfV9
         70RB8Upu9YdORNdayH4UkflfbMxETRFK904vmFnxanZjnYXcfcRUF7o4xv5e9H3QWatV
         ti3w==
X-Gm-Message-State: AOAM5324VVaL8mbZ2WvE2hikelP9yABNS6/cVMo+UtLP7s0WDwNSZ/xi
        aqrg+tMCanoqnqHi0mAQWT0=
X-Google-Smtp-Source: ABdhPJyVwjie/8ENg82E/GJ+IbIga77qGM1wDV6Xb/a2S/g2uTy1sXXww7oh+rSsvEp6QnGqggkwQQ==
X-Received: by 2002:a2e:b70d:: with SMTP id j13mr12407720ljo.287.1595346618301;
        Tue, 21 Jul 2020 08:50:18 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id f9sm1103168lfc.43.2020.07.21.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:50:16 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v8.1 03/10] media: i2c: ov6650: Use new [get|set]_mbus_config ops
Date:   Tue, 21 Jul 2020 17:50:15 +0200
Message-ID: <6164575.G0QQBjFxQf@z50>
In-Reply-To: <20200721075317.80874-1-jacopo+renesas@jmondi.org>
References: <20200717145324.292820-4-jacopo+renesas@jmondi.org> <20200721075317.80874-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday, July 21, 2020 9:53:17 A.M. CEST Jacopo Mondi wrote:
> Use the new get_mbus_config and set_mbus_config pad operations in place
> of the video operations currently in use.
> 
> Compared to other drivers where the same conversion has been performed,
> ov6650 proved to be a bit more tricky, as the existing g_mbus_config
> implementation did not report the currently applied configuration but
> the set of all possible configuration options.
> 
> Adapt the driver to support the semantic of the two newly introduced
> operations:
> - get_mbus_config reports the current media bus configuration
> - set_mbus_config applies only changes explicitly requested and updates
>   the provided cfg parameter to report what has actually been applied to
>   the hardware.
> 
> Compile-tested only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

> ---
> v8 -> v8.1
> 
> - Return error on register write fails in set_mbus_config() as suggested
>   by Janusz.
> 
> ---
>  drivers/media/i2c/ov6650.c | 53 ++++++++++++++++++++++++++------------
>  1 file changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 91906b94f978..48493af81198 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -921,55 +921,74 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
>  };
> 
>  /* Request bus settings on camera side */
> -static int ov6650_g_mbus_config(struct v4l2_subdev *sd,
> -				struct v4l2_mbus_config *cfg)
> +static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_config *cfg)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	u8 comj, comf;
> +	int ret;
> +
> +	ret = ov6650_reg_read(client, REG_COMJ, &comj);
> +	if (ret)
> +		return ret;
> 
> -	cfg->flags = V4L2_MBUS_MASTER |
> -		V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_PCLK_SAMPLE_FALLING |
> -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
> -		V4L2_MBUS_DATA_ACTIVE_HIGH;
> +	ret = ov6650_reg_read(client, REG_COMF, &comf);
> +	if (ret)
> +		return ret;
> +
> +	cfg->flags = V4L2_MBUS_MASTER | V4L2_MBUS_DATA_ACTIVE_HIGH
> +		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> +						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> +						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
> +						: V4L2_MBUS_PCLK_SAMPLE_FALLING);
>  	cfg->type = V4L2_MBUS_PARALLEL;
> 
>  	return 0;
>  }
> 
>  /* Alter bus settings on camera side */
> -static int ov6650_s_mbus_config(struct v4l2_subdev *sd,
> -				const struct v4l2_mbus_config *cfg)
> +static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> +				  unsigned int pad,
> +				  struct v4l2_mbus_config *cfg)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> +	int ret = 0;
> 
>  	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
>  	if (ret)
>  		return ret;
> 
>  	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
>  	if (ret)
>  		return ret;
> 
>  	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> +	if (ret)
> +		return ret;
> 
> -	return ret;
> +	/*
> +	 * Update the configuration to report what is actually applied to
> +	 * the hardware.
> +	 */
> +	return ov6650_get_mbus_config(sd, pad, cfg);
>  }
> 
>  static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>  	.s_stream	= ov6650_s_stream,
>  	.g_frame_interval = ov6650_g_frame_interval,
>  	.s_frame_interval = ov6650_s_frame_interval,
> -	.g_mbus_config	= ov6650_g_mbus_config,
> -	.s_mbus_config	= ov6650_s_mbus_config,
>  };
> 
>  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> @@ -978,6 +997,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>  	.set_selection	= ov6650_set_selection,
>  	.get_fmt	= ov6650_get_fmt,
>  	.set_fmt	= ov6650_set_fmt,
> +	.get_mbus_config = ov6650_get_mbus_config,
> +	.set_mbus_config = ov6650_set_mbus_config,
>  };
> 
>  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
> --
> 2.27.0
> 
> 





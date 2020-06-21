Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB73F202A55
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 13:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbgFULiv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 07:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729878AbgFULiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 07:38:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91348C061794;
        Sun, 21 Jun 2020 04:38:50 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id cy7so4799781edb.5;
        Sun, 21 Jun 2020 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l9uNU0IHBkSlq+p0nJKAVbuoarH+N5mW84+WqlF1L+k=;
        b=urFwwLk+VJaKpK85RSe67FdiTEc1rPH6IJ8wOXUbdGBXhdwjI92ztBtjG6dSjbNdix
         vuhLZh+jH3pdfkLlHRo2de7kxz1v6/90rKSQSHeWfcRl6U4xuWlRZ2YTnvhaLHDE+Zsb
         qx42J6ZygqDfMlJM55Yxmj9J4YEeoc+0/m6EvrTjffkz/Pnf+468QKnDI/xw/MXGJia6
         4P94d/mwXXlHmTSY3WGic+/g6AO5tyOSRPorPhMMGCG3nyMBZQm7wzWZtnusnvPJOoeg
         qeYMnTuwpkLwXuxyGykyI6eVRHWNpZ0l1Tcx9BQkxLgzZsgNDGsvKVwAPd0UKSaB9aiV
         GGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l9uNU0IHBkSlq+p0nJKAVbuoarH+N5mW84+WqlF1L+k=;
        b=lpQlI85Z7x5sQU58WYmwumjkZ/68cOunYi57QFOoNehDpeIoeCCymA/Rv6gbJ0Znts
         7nB8tf3h93Ane2l377sgWACwazSPvPO7733S3Q1VQ2qibrofFwHYprQ/6x4OvbNxVfd6
         kchlhbN0qEGhKc0kOKtJSYz8vIQYDcSVafZ8OZl7vZgzNhwXYZ5MGCdFNK+U73CT0vuc
         /kcp6oTFtXJtVT4Xq04xlPnZFVT2m4D+cSdatS5oTMVgaBJcDHNJHFfPRs55ucIDJ6lP
         DfwD/n8z1ZmvMRoI+WaNMmRvrX6ux5PSG3/jNdV4QGM+vuTHF0CqHbqptW/MnTQERUiK
         oDwA==
X-Gm-Message-State: AOAM532F18p2aaAjcsgR44PP1R6+jjndES374100867ZkqwnY0q9/x02
        zFNZN9VxjyhZGO7nm3xhITY=
X-Google-Smtp-Source: ABdhPJxUalCWexUHlOi4Q0N3BAc3txP8IvYBNPWnG+H1URXIxVa5iQxNJh+67H/mMSGe+nwJIIkP6g==
X-Received: by 2002:a05:6402:170d:: with SMTP id y13mr11027783edu.319.1592739529046;
        Sun, 21 Jun 2020 04:38:49 -0700 (PDT)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id m16sm1678478eji.23.2020.06.21.04.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 04:38:48 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 03/10] media: i2c: ov6650: Use new [get|set]_mbus_config ops
Date:   Sun, 21 Jun 2020 13:38:46 +0200
Message-ID: <1837100.yKVeVyVuyW@z50>
In-Reply-To: <20200616141244.49407-4-jacopo+renesas@jmondi.org>
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org> <20200616141244.49407-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for bringing my attention to this patch.

On Tuesday, June 16, 2020 4:12:38 P.M. CEST Jacopo Mondi wrote:
> Use the new get_mbus_config and set_mbus_config pad operations in place
> of the video operations currently in use.
> 
> Compared to other drivers where the same conversion has been performed,
> ov6650 proved to be a bit more tricky, as the existing g_mbus_config
> implementation did not report the currently applied configuration but
> the set of all possible configuration options.

Assuming that was in line with officially supported semantics of the old API, 
not a misinterpretation, I would really like to see that limitation of the new 
API actually compensated with V4L2_SUBDEV_FORMAT_TRY support added to it.

> 
> Adapt the driver to support the semantic of the two newly introducedV4L2_SUBDEV_FORMAT_TRY
> operations:
> - get_mbus_config reports the current media bus configuration
> - set_mbus_config applies only changes explicitly requested and updates
>   the provided cfg parameter to report what has actually been applied to
>   the hardware.
> 
> Compile-tested only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/ov6650.c | 56 ++++++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 91906b94f978..d2e7a8556ed7 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -921,46 +921,68 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
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
> +	cfg->flags = V4L2_MBUS_MASTER
> +		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
> +						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
> +						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
> +						: V4L2_MBUS_PCLK_SAMPLE_FALLING);

You probably missed hardware default V4L2_MBUS_DATA_ACTIVE_HIGH.

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

Have you thought of extending v4l2_subdev_call_pad_wrappers with a check for 
only one of mutually exclusive flags specified by user?

>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> -	else
> +	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
>  
> +error:
> +	/*
> +	 * Update the configuration to report what is actually applied to
> +	 * the hardware.
> +	 */
> +	ov6650_get_mbus_config(sd, pad, cfg);

Populating cfg->flags by ov6650_get_mbus_config() without checking for a 
potential error it may return can result in invalid data silently returned to 
user.  Maybe it would be better to fetch current hardware status first, fail on 
error, then update the result with successfully performed hardware state 
modifications.

Thanks,
Janusz

> +
>  	return ret;
>  }
>  
> @@ -968,8 +990,6 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>  	.s_stream	= ov6650_s_stream,
>  	.g_frame_interval = ov6650_g_frame_interval,
>  	.s_frame_interval = ov6650_s_frame_interval,
> -	.g_mbus_config	= ov6650_g_mbus_config,
> -	.s_mbus_config	= ov6650_s_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
> @@ -978,6 +998,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>  	.set_selection	= ov6650_set_selection,
>  	.get_fmt	= ov6650_get_fmt,
>  	.set_fmt	= ov6650_set_fmt,
> +	.get_mbus_config = ov6650_get_mbus_config,
> +	.set_mbus_config = ov6650_set_mbus_config,
>  };
>  
>  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
> 





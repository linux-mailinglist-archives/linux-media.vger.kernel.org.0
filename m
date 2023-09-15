Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814457A1BA4
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 12:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbjIOKDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 06:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbjIOKDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 06:03:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BE53A9B
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:59:51 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31fe2c8db0dso1374402f8f.3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694771990; x=1695376790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8srA2gmpGXuxCaKf9S+kXfIvivT1qXqSgpeOEcBwYIs=;
        b=i5mMu4WYJP6Q8ly1PJtFU4qXLwt+6u0Gevkbf4GmdEfoKyNqiTlHUWmcADY+8p/UyD
         igYUzIkz4fL6v6yJhNRyrO/q+v5fKR3DsDCU0xYjz6WEL3LWHWJlVm2s+owvdLhNc+00
         awzYOJXldvfbMaJKoJEzCzOiN+S0bPMlBMTgKJ7iW/vFKfdBoMtn56N5+qCGc/C095R2
         X64n6WAMN0c7Rl9XIx+mLaM3eTew542uri5wm2GdJE8DH3HbckkwYqIgbtgSXRkh7iQR
         kl2qVVfc6UwMp2qRYAWIpEubVv/Y5lcBA2gJUMZpFdUjmvwqzymk/dPqbuNela4d5qOl
         MOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694771990; x=1695376790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8srA2gmpGXuxCaKf9S+kXfIvivT1qXqSgpeOEcBwYIs=;
        b=Vq5ON4ihN52ayTjnuKxOjw2ikp1y92hB/H86VLSZjzmEYHQ9cZUaFVXrb+eUUWCLax
         hP2BhMBm+SnnJsbcjnVr35ctmLw1gG+CLG7Jx6wW10W/+/13zRwM3LdebPFRVdV0WRuX
         /CO6jtgmgMClwi4mk39uoQJkB2br1jfk74P+LQ5uyY+1hdgvHkthEQ+cLuXiOhSGWc/O
         Uil9TLeDwYObHuht7Y5mE280V4YGJrxDdNA722pvqQIzMBOFU+pEvEMXu11ZtqJOkNCE
         bUftsGbx3Q3ISiNI133J4JuLCFdALMLhq9771Dc5iTWKVLt31ELO8/sM3QsdrBUjzbuA
         JLpw==
X-Gm-Message-State: AOJu0Yxfzn3lP0e5wliTJDN3j5mHQsGk2EENdq7jXlSWcB54RA8FIM3L
        zN/QimO6S2bL8XTs04+LmUU=
X-Google-Smtp-Source: AGHT+IHW89bPa4jEgZJgKQNZ0alDirhIBjoRx4/xlKnC7vqZTmLDmYc2NbRGuzkT7sb9g0ydo1x1Rw==
X-Received: by 2002:adf:fd06:0:b0:316:fc86:28ae with SMTP id e6-20020adffd06000000b00316fc8628aemr870467wrr.15.1694771989893;
        Fri, 15 Sep 2023 02:59:49 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-54-79.cust.vodafonedsl.it. [188.217.54.79])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bcb8a000000b00402f7b50517sm4218803wmi.40.2023.09.15.02.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:59:49 -0700 (PDT)
Date:   Fri, 15 Sep 2023 11:59:47 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH] media: i2c: imx296: Replace streaming flag with runtime
 PM check
Message-ID: <ZQQrE4XT11S1hX9t@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230914174647.954-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914174647.954-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Sep 14, 2023 at 08:46:47PM +0300, Laurent Pinchart wrote:
> The streaming flag in the driver private structure is used for the sole
> purpose of gating register writes when setting a V4L2 control. This is
> better handled by checking if the sensor is powered up using the runtime
> PM API. Do so and drop the streaming flag.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx296.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index 3b4539b622b4..94aac9d2732f 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -201,8 +201,6 @@ struct imx296 {
>  	const struct imx296_clk_params *clk_params;
>  	bool mono;
>  
> -	bool streaming;
> -
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
>  
> @@ -321,7 +319,7 @@ static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
>  	unsigned int vmax;
>  	int ret = 0;
>  
> -	if (!sensor->streaming)
> +	if (!pm_runtime_get_if_in_use(sensor->dev))
>  		return 0;
>  
>  	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
> @@ -376,6 +374,8 @@ static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  
> +	pm_runtime_put(sensor->dev);
> +
>  	return ret;
>  }
>  
> @@ -607,8 +607,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_mark_last_busy(sensor->dev);
>  		pm_runtime_put_autosuspend(sensor->dev);
>  
> -		sensor->streaming = false;
> -
>  		goto unlock;
>  	}
>  
> @@ -620,13 +618,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret < 0)
>  		goto err_pm;
>  
> -	/*
> -	 * Set streaming to true to ensure __v4l2_ctrl_handler_setup() will set
> -	 * the controls. The flag is reset to false further down if an error
> -	 * occurs.
> -	 */
> -	sensor->streaming = true;
> -
>  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls);
>  	if (ret < 0)
>  		goto err_pm;
> @@ -646,7 +637,6 @@ static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
>  	 * likely has no other chance to recover.
>  	 */
>  	pm_runtime_put_sync(sensor->dev);
> -	sensor->streaming = false;
>  
>  	goto unlock;
>  }
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> -- 
> Regards,
> 
> Laurent Pinchart
> 

This looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112B935855E
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 15:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhDHN5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 09:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbhDHN5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 09:57:17 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBC7C061760;
        Thu,  8 Apr 2021 06:57:06 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j5so1282682wrn.4;
        Thu, 08 Apr 2021 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6miOsCN9DRTNbPpezNAybueDA0Yo59tqLPZxCeBa914=;
        b=JSudo/YnP226VSlYgSaJSXG88wye+oZiMgoE00/4qim7e+dlKR7K6V6ix7W+6+n6Hp
         ed3JEtXifz3iX3nDYS1Iq34YpurpO0LSYa7YuY1NVx8Fsf+YzKROjh2hXQNxyqjH0T1N
         CPSlpcJlWh2UMoh3pjJdyey/23FU9nT/3oN9f36SLTPWzlsvp5onThBBCyXavJvm0yZ8
         sOX+ZmH6wYeVUHr/a0sYO+OiS+ilNogSb2zStrHQxV/4DLlIF8zLWZrVNmHb+XbUgzku
         GiBYdi7Ye3M6uDr/xfTk1Ir46f5uEcygEAHKdX0X9GUhq5XMtGvJMb1u5opLU+RtBizm
         +GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6miOsCN9DRTNbPpezNAybueDA0Yo59tqLPZxCeBa914=;
        b=DL2Bw40Pwf10XLs4mxxziJpgoXjJoQM1AdEkEFPuQ3i+wA8KSCgMpNAWriaEJJelsn
         JbM4jsw1Cg7H2MO3zS+8Vn563qgfLENyd12F7bd6ONwLJlCGdK+9qgLIC6omp6HLSbqw
         nJiXRjmUO9C7ofMrvhZj16F2hdMAywIsGAqeiSzKkKxlYLijN8pR949CTDYFBLxSXNHr
         hp1ZFp+jSztr1elB3EWaBQasBIZszRqIGRu4nliQeQFDmARFl0oiD854MYSYv7dlM+9h
         /tESaCuUwIoc2TqmImaw3E4ib9Y4YtDO4ydK/zPQA7VKxdn/FqLJAVfZD+foKNhYnHr8
         CKIQ==
X-Gm-Message-State: AOAM532oDMy4X9Eo2CxpytwC4JlZgm3BFoVwdQRRBhXA2Ylwrv57eQv7
        dacwxFss8W3x7h4XYjXy4ys=
X-Google-Smtp-Source: ABdhPJxhaKRC1qDi9jJ08/j9F42mAUlrBUmL4jBRLa/LIuGqxEGrEWbA6s6xO9LKEurZxU2YK80quA==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr11585327wrq.358.1617890224964;
        Thu, 08 Apr 2021 06:57:04 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 3sm10751500wma.45.2021.04.08.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:57:04 -0700 (PDT)
Date:   Thu, 8 Apr 2021 14:57:02 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx7-mipi-csis: Fix runtime PM imbalance in
 mipi_csis_s_stream
Message-ID: <20210408135702.f7ikjvwirvtzsarv@arch-thunder.localdomain>
References: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,
Thanks for your patch.

On Thu, Apr 08, 2021 at 05:08:27PM +0800, Dinghao Liu wrote:
> When v4l2_subdev_call() fails, a pairing PM usage counter
> decrement is needed to keep the counter balanced. It's the
> same for the following error paths in case 'enable' is on.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index a01a7364b4b9..2a3fff231a40 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -627,21 +627,26 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  			return ret;
>  		}
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&state->pdev->dev);

I think here we should go completely pm_runtime_put to call the
mipi_csis_pm_suspend down the line, right?

>  			return ret;
> +		}
>  	}
>  
>  	mutex_lock(&state->lock);
>  	if (enable) {
>  		if (state->flags & ST_SUSPENDED) {
>  			ret = -EBUSY;
> +			pm_runtime_put_noidle(&state->pdev->dev);

since we are in ST_SUSPENDED state, for sure the pm counter was
already 0.

>  			goto unlock;
>  		}
>  
>  		mipi_csis_start_stream(state);
>  		ret = v4l2_subdev_call(state->src_sd, video, s_stream, 1);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&state->pdev->dev);

here also we need the pm_runtime_put, maybe just changing the unlock
tag bellow from:
    if (!enable)
        pm_runtime_put(&state->pdev->dev);

to 
    if (!enable || (ret < 0))
        pm_runtime_put(&state->pdev->dev);

will not hurt the first case and will complete the suspend routine
afterward in the second case.

------
Cheers,
     Rui
>  			goto unlock;
> +		}
>  
>  		mipi_csis_log_counters(state, true);
>  
> -- 
> 2.17.1
> 
> 

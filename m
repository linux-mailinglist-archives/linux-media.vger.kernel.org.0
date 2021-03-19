Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4693419E6
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 11:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhCSK0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 06:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCSK0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 06:26:19 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F1FC06174A
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:26:18 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo4932365wmq.4
        for <linux-media@vger.kernel.org>; Fri, 19 Mar 2021 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+BM9qjgRBtzzEHVG8USaG+L3E2C1rpnP458cngJi+0E=;
        b=JgwcIi7TkFET2tSPR73+DqDAaMazBeEdTaQ2Uo8bBUBke7n6NwS/bHfATPI+cQpGnd
         3gqlCO3xM+wpBFVSkFoXQIC3JaoSYMlULyW6PVJVUUdqUme7dPwuUb0BiT+G9q4nDsoA
         WV9Io+eHP/NfkN79Kqn2t0piDO1kUENxpRaBf+43fQ6w13HhyQNxVrb8mg7HKd39WdRL
         yx1uruUmzNnjZ9Hbol+uMytRO8wzkw2n3Hm3srbYN8QJwsb6VuAtq/WsBLsRK2JtlDtn
         BgHaF6y60Z1ibeSBxcxTp1sDatq8UYFs5Rdx5Ang3moYdmjmn9CPDAThBobXGHD0NVtZ
         I5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+BM9qjgRBtzzEHVG8USaG+L3E2C1rpnP458cngJi+0E=;
        b=c7fxVBNHrOfd/FFJweH43mz7dY1wOKI1vL5LixncSY2LwHXgPOT+kv02D0MNXYyMxu
         zCdSb9aESH5J8Qa9nDLYj4xO90w5RzO0WhtLHMhAOG5rOmmC5+cIkZj8bzJ4FzlP1b+1
         HVCsU6QkTJRdA9jsgprTDqYXE8jK8TAaqF/eBzmla13tVsKVlweevsSrxJArOr6rj1Su
         GXCjNVlKG1EBre+6WOakuA4PXq5Pw9GMq6ZUWFnr/iQmUCnBwji5q4M0tZYqJShJmzFV
         LEUmEyu+V2Ju7GnytUVkMeO56PAXIVjb+1yWRFVG2zchEi4HYajEfyMGq1cCqYqx34Go
         tUJA==
X-Gm-Message-State: AOAM532ZvoNI+YvwPIgJPFVQ9fBYhmbVJtbpUoC6Zvp5yhczEizdqQSB
        4JvsGGPywA0VWAWfYdy2D8E59Qx67Zg=
X-Google-Smtp-Source: ABdhPJzFRx4Cs9WH83OLMH5tbUIVW1HdFZa2yAwJ1aRAjP5uoF3iI2vbs4aRwYy+5nAUKYkT36kRog==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr3078885wmh.5.1616149577104;
        Fri, 19 Mar 2021 03:26:17 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h21sm5473571wmp.10.2021.03.19.03.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 03:26:16 -0700 (PDT)
Date:   Fri, 19 Mar 2021 10:26:14 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/3] media: imx: imx7_mipi_csis: Runtime suspend in
 .s_stream() error path
Message-ID: <20210319102614.zjh4gawatpivvj7v@arch-thunder.localdomain>
References: <20210319011735.26846-1-laurent.pinchart@ideasonboard.com>
 <20210319011735.26846-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319011735.26846-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Fri, Mar 19, 2021 at 03:17:33AM +0200, Laurent Pinchart wrote:
> If the .s_stream() handler fails after calling pm_runtime_get_sync(),
> call pm_runtime_put() in the error path.
> 
> While at it add a few blank lines to make the code more readable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks LGTM,

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index bd587e550d99..c6cd60896969 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -694,6 +694,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  			return ret;
>  
>  		mipi_csis_clear_counters(state);
> +
>  		ret = pm_runtime_get_sync(&state->pdev->dev);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(&state->pdev->dev);
> @@ -701,10 +702,11 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  		}
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0 && ret != -ENOIOCTLCMD)
> -			return ret;
> +			goto done;
>  	}
>  
>  	mutex_lock(&state->lock);
> +
>  	if (enable) {
>  		if (state->flags & ST_SUSPENDED) {
>  			ret = -EBUSY;
> @@ -732,7 +734,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  
>  unlock:
>  	mutex_unlock(&state->lock);
> -	if (!enable)
> +
> +done:
> +	if (!enable || ret < 0)
>  		pm_runtime_put(&state->pdev->dev);
>  
>  	return ret;
> -- 
> Regards,
> 
> Laurent Pinchart
>
> 

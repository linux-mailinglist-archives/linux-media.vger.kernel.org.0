Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A55936A030
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhDXIei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 04:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbhDXIef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 04:34:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44738C06174A
        for <linux-media@vger.kernel.org>; Sat, 24 Apr 2021 01:33:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so80989065lfv.12
        for <linux-media@vger.kernel.org>; Sat, 24 Apr 2021 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TJfy11hql+Mvf+Sxno1+shJA5Rufh7+jR8uX3mI97/4=;
        b=1krv2nOeHbfRz9cmDSpTGq3AeuIMyykWEbx+JMnkkCTw79PbPm6RQAt1D69XglPdbP
         SkFwQTH0yODyDA8/aA58XRY97Ax71CcoglGCdpL37lHw9GpwEB+Acnv7xpSopKAdHW95
         lQS41BLenPQg/gf/0EeaAaOD/podn7rmyMshm3Hn4W7hcWwYZ+YBdspZXl9vNMYH6d9E
         Tp8uZLrI1cHSaEibOqyK7woXqHolKE0JW0MPIBjMMOWoMI5RxJ0Tn5AzqQ6vxZ/NLHhB
         RTHdPH7n4gvGJ6I6tbVqBtz9HyyokTAPxwYn8J+GRqMlNz9yIzPqWUaxSW79VaB+LaLW
         +h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TJfy11hql+Mvf+Sxno1+shJA5Rufh7+jR8uX3mI97/4=;
        b=pXZYk1KZb6B+2qh24BclGR8/Hnhe2hdUpnq+Vj8YUOPa9Tg+A7+PTffGydJLVVhkSQ
         vT2S5mDK83Ilbw1dU2OuXlvaaRIX5+PsipBTY2YBDI2JtFXN+6YzgCeuu9C0zaKNNUit
         xRLwrJ7k+MANM48KcjFf+KyS4by2ko7mzyRqO80yfs0/gG4awdYGSxEvlQX2cnN/UUyz
         IK3MKYmS4npkb4YDxe5Ogogk0+YUH7F9XJ+IruFUvsamrthtPZci0+xErXUjJfXa7zNX
         JROgt8dmuq0hMNG4COzN8o5wWQBhN+ZHhtTfmNIA8SMaW+4uznL2o1Uz0yBMY0Dp5X91
         D9Ig==
X-Gm-Message-State: AOAM5317q/gRoLFfPCKKIwI7HV69dCaCxOFDyhrXM0sXGvJSTfJihuNo
        RLd9pNnFLFskwvmxR0amDXTv5g==
X-Google-Smtp-Source: ABdhPJxUeKXzefX+ne/CqSvopZnnLBGUZ+Or00N5w0Yo4nm9V0r6YUyf8A6fIIhr0HthAAQAgVZiZw==
X-Received: by 2002:a05:6512:21a5:: with SMTP id c5mr5531362lft.534.1619253234679;
        Sat, 24 Apr 2021 01:33:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z28sm774464lfq.72.2021.04.24.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:33:54 -0700 (PDT)
Date:   Sat, 24 Apr 2021 10:33:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 69/78] media: rcar-vin: use pm_runtime_resume_and_get()
Message-ID: <YIPX8V2zsc59C7vn@oden.dyn.berto.se>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc7f4bc45cd6be79d19d1a4027fb6f35dfb45a03.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for your work.

On 2021-04-24 08:45:19 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 2 +-
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e06cd512aba2..85574765a11a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -408,7 +408,7 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
>  
>  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
>  {
> -	pm_runtime_get_sync(priv->dev);
> +	pm_runtime_resume_and_get(priv->dev);
>  	reset_control_deassert(priv->rstc);
>  }
>  
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f30dafbdf61c..f5f722ab1d4e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	u32 vnmc;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(vin->dev);
> +	ret = pm_runtime_resume_and_get(vin->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	/* Make register writes take effect immediately. */
>  	vnmc = rvin_read(vin, VNMC_REG);
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 457a65bf6b66..b1e9f86caa5c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -870,11 +870,9 @@ static int rvin_open(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(vin->dev);
> +	ret = pm_runtime_resume_and_get(vin->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = mutex_lock_interruptible(&vin->lock);
>  	if (ret)
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund

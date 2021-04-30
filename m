Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BD3370029
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 20:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhD3SHh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 30 Apr 2021 14:07:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2980 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3SHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 14:07:36 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0Xx1hhHz6wlJb;
        Sat,  1 May 2021 02:01:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 20:06:46 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 19:06:45 +0100
Date:   Fri, 30 Apr 2021 19:05:10 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Niklas =?ISO-8859-1?Q?S?= =?ISO-8859-1?Q?=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 77/79] media: rcar-vin: use
 pm_runtime_resume_and_get()
Message-ID: <20210430190510.0000298d@Huawei.com>
In-Reply-To: <c0c8f8b07af20c354b946819f5dcdf9f5129654e.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <c0c8f8b07af20c354b946819f5dcdf9f5129654e.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:52:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Trivial thing inline.  Doesn't matter though if you prefer it as is.

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 15 ++++++++++++---
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  6 ++----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  6 ++----
>  3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e06cd512aba2..436fb17f73ea 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -406,10 +406,17 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
>  	pm_runtime_put(priv->dev);
>  }
>  
> -static void rcsi2_exit_standby(struct rcar_csi2 *priv)
> +static int rcsi2_exit_standby(struct rcar_csi2 *priv)
>  {
> -	pm_runtime_get_sync(priv->dev);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(priv->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	reset_control_deassert(priv->rstc);
> +
> +	return ret;

Maybe return 0; to make it easy to see this returns <= 0;
ret will always be 0 here anyway.

>  }
>  
>  static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
> @@ -657,7 +664,9 @@ static int rcsi2_start(struct rcar_csi2 *priv)
>  {
>  	int ret;
>  
> -	rcsi2_exit_standby(priv);
> +	ret = rcsi2_exit_standby(priv);
> +	if (ret < 0)
> +		return ret;
>  
>  	ret = rcsi2_start_receiver(priv);
>  	if (ret) {
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


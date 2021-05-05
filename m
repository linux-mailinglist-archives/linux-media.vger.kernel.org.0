Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A336373AB0
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhEEMMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:12:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3017 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbhEEMLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:11:13 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwH94GWnz70gJC;
        Wed,  5 May 2021 19:59:17 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:10:14 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:10:13 +0100
Date:   Wed, 5 May 2021 13:08:35 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Message-ID: <20210505130835.000006b7@Huawei.com>
In-Reply-To: <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 11:41:58 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are several issues in the way the atmel driver handles
> pm_runtime_get_sync():
> 
> - it doesn't check return codes;
> - it doesn't properly decrement the usage_count on all places;
> - it starts streaming even if pm_runtime_get_sync() fails.
> - while it tries to get pm_runtime at the clock enable logic,
>   it doesn't check if the operation was suceeded.
> 
> Replace all occurrences of it to use the new kAPI:
> pm_runtime_resume_and_get(), which ensures that, if the
> return code is not negative, the usage_count was incremented.
> 
> With that, add additional checks when this is called, in order
> to ensure that errors will be properly addressed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Mauro, I don't know media enough to know what is the right answer
but in some of this series, a failure in
pm_runtime_resume_and_get() leads to a bunch of buffer cleanup
(patch 22 being an example) and in others return happens without doing
that cleanup.

It might be both are safe, or I'm missing something else, but I'm
certainly not confident enough to give any tags on this one as a result
of that mismatch.

> ---
>  drivers/media/platform/atmel/atmel-isc-base.c | 30 ++++++++++++++-----
>  drivers/media/platform/atmel/atmel-isi.c      | 19 +++++++++---
>  2 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index fe3ec8d0eaee..ce8e1351fa53 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -294,9 +294,13 @@ static int isc_wait_clk_stable(struct clk_hw *hw)
>  static int isc_clk_prepare(struct clk_hw *hw)
>  {
>  	struct isc_clk *isc_clk = to_isc_clk(hw);
> +	int ret;
>  
> -	if (isc_clk->id == ISC_ISPCK)
> -		pm_runtime_get_sync(isc_clk->dev);
> +	if (isc_clk->id == ISC_ISPCK) {
> +		ret = pm_runtime_resume_and_get(isc_clk->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	return isc_wait_clk_stable(hw);
>  }
> @@ -353,9 +357,13 @@ static int isc_clk_is_enabled(struct clk_hw *hw)
>  {
>  	struct isc_clk *isc_clk = to_isc_clk(hw);
>  	u32 status;
> +	int ret;
>  
> -	if (isc_clk->id == ISC_ISPCK)
> -		pm_runtime_get_sync(isc_clk->dev);
> +	if (isc_clk->id == ISC_ISPCK) {
> +		ret = pm_runtime_resume_and_get(isc_clk->dev);
> +		if (ret < 0)
> +			return 0;
> +	}
>  
>  	regmap_read(isc_clk->regmap, ISC_CLKSR, &status);
>  
> @@ -807,7 +815,12 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto err_start_stream;
>  	}
>  
> -	pm_runtime_get_sync(isc->dev);
> +	ret = pm_runtime_resume_and_get(isc->dev);
> +	if (ret < 0) {
> +		v4l2_err(&isc->v4l2_dev, "RPM resume failed in subdev %d\n",
> +			 ret);
> +		goto err_pm_get;
> +	}
>  
>  	ret = isc_configure(isc);
>  	if (unlikely(ret))
> @@ -838,7 +851,7 @@ static int isc_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  err_configure:
>  	pm_runtime_put_sync(isc->dev);
> -
> +err_pm_get:
>  	v4l2_subdev_call(isc->current_subdev->sd, video, s_stream, 0);
>  
>  err_start_stream:
> @@ -1809,6 +1822,7 @@ static void isc_awb_work(struct work_struct *w)
>  	u32 baysel;
>  	unsigned long flags;
>  	u32 min, max;
> +	int ret;
>  
>  	/* streaming is not active anymore */
>  	if (isc->stop)
> @@ -1831,7 +1845,9 @@ static void isc_awb_work(struct work_struct *w)
>  	ctrls->hist_id = hist_id;
>  	baysel = isc->config.sd_format->cfa_baycfg << ISC_HIS_CFG_BAYSEL_SHIFT;
>  
> -	pm_runtime_get_sync(isc->dev);
> +	ret = pm_runtime_resume_and_get(isc->dev);
> +	if (ret < 0)
> +		return;
>  
>  	/*
>  	 * only update if we have all the required histograms and controls
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index e392b3efe363..5b1dd358f2e6 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -422,7 +422,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
>  	struct frame_buffer *buf, *node;
>  	int ret;
>  
> -	pm_runtime_get_sync(isi->dev);
> +	ret = pm_runtime_resume_and_get(isi->dev);
> +	if (ret < 0)
> +		return ret;
This is the case I'm referring to above.

>  
>  	/* Enable stream on the sub device */
>  	ret = v4l2_subdev_call(isi->entity.subdev, video, s_stream, 1);
> @@ -782,9 +784,10 @@ static int isi_enum_frameintervals(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static void isi_camera_set_bus_param(struct atmel_isi *isi)
> +static int isi_camera_set_bus_param(struct atmel_isi *isi)
>  {
>  	u32 cfg1 = 0;
> +	int ret;
>  
>  	/* set bus param for ISI */
>  	if (isi->pdata.hsync_act_low)
> @@ -801,12 +804,16 @@ static void isi_camera_set_bus_param(struct atmel_isi *isi)
>  	cfg1 |= ISI_CFG1_THMASK_BEATS_16;
>  
>  	/* Enable PM and peripheral clock before operate isi registers */
> -	pm_runtime_get_sync(isi->dev);
> +	ret = pm_runtime_resume_and_get(isi->dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	isi_writel(isi, ISI_CTRL, ISI_CTRL_DIS);
>  	isi_writel(isi, ISI_CFG1, cfg1);
>  
>  	pm_runtime_put(isi->dev);
> +
> +	return 0;
>  }
>  
>  /* -----------------------------------------------------------------------*/
> @@ -1085,7 +1092,11 @@ static int isi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>  		dev_err(isi->dev, "No supported mediabus format found\n");
>  		return ret;
>  	}
> -	isi_camera_set_bus_param(isi);
> +	ret = isi_camera_set_bus_param(isi);
> +	if (ret) {
> +		dev_err(isi->dev, "Can't wake up device\n");
> +		return ret;
> +	}
>  
>  	ret = isi_set_default_fmt(isi);
>  	if (ret) {


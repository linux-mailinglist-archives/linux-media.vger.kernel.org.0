Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2103C215D
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbhGIJXE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhGIJXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:02 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1436C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id j9so2532537pfc.5
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hoQn3oFU7ZRtUqLdJQZSv625TdF5Nr5oVUPR/hjrbE8=;
        b=OtahX2vQRDH4vXsYYawxyPICBEajoJPujSji9KpHX7QFCnQ7qpsFQCJKvcOYt78MZ2
         l9V1vS2dVHmqUivOaCqV/UhxOvzEnqckvtG2l7AdrVvlj7kfjdEC1uPcNMwzC8q5EJ5J
         2YgTcYNnN2ksSizkhO4Kf4LLMVz5eudfLoFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hoQn3oFU7ZRtUqLdJQZSv625TdF5Nr5oVUPR/hjrbE8=;
        b=U8pw/4SH1BLqvbe3O9d25u4N/Sei9NUY0QA+ZP8Y2D1SDsIc/sRmc7BXMwjdFH7Y/f
         4UUGqy4cZik4aHeEmYAvrLY229XYRICbCptlYFgVv1NX3KXQO7x5r3beHXo1qb3PLlzH
         RSWG+P0Dezd4oEFhOAG9w2UIOUR0rc+VvC4pAKcaqTc+L3/yqHJPBkgR3ac1YG6fNq8u
         pwI2xRvWuzAxFDMQ/DSUunT+h2h7KULoguYstC1U0f3+aLo2Vb+i18goHBpp+cvCLNuO
         sO0Z3MUqVR1zVZuo+5jlNoYmTYetpGbz+tfCdYJ4EZ57g7D/yPH3kP4J1V8T5/MWWjSo
         T6pA==
X-Gm-Message-State: AOAM531mZZe+XMdn5maQYLbt7m6uIgS2h0Mc9bponQ8jR6kMzgGyqVWp
        3YHthKr/Uk18z169rRYCcONVWg==
X-Google-Smtp-Source: ABdhPJw3RZDCkA6BRAqJQUHliq1oLYsw8xyE5dnnG1857hRiokfmx9p+cHA/vCqiDreL4+UpfdVGYw==
X-Received: by 2002:a62:2686:0:b029:30c:828f:4447 with SMTP id m128-20020a6226860000b029030c828f4447mr36479426pfm.31.1625822418614;
        Fri, 09 Jul 2021 02:20:18 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:735b:c3cc:6957:ae6d])
        by smtp.gmail.com with ESMTPSA id n34sm4839205pji.45.2021.07.09.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:18 -0700 (PDT)
Date:   Fri, 9 Jul 2021 18:20:13 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH v2,4/9] media: mtk-jpegenc: Refactor jpeg clock interface
Message-ID: <YOgUzVmL9EDEdVRz@chromium.org>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625038079-25815-5-git-send-email-kyrie.wu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kyrie,

On Wed, Jun 30, 2021 at 03:27:54PM +0800, kyrie.wu wrote:
> Using the needed param for lock on/off function.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 46 ++++++++++++++++++++++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 28 +++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>

Thanks for the patch. Please see my comments inline.

Also, how does this patch refactor anything? I only see new code being
added. Does the subject and/or commit message need some adjustment?

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 24edd87..7c053e3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1053,7 +1053,32 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -	int ret;
> +	struct mtk_jpeg_dev *comp_dev;
> +	struct mtk_jpegenc_pm *pm;
> +	struct mtk_jpegenc_clk *jpegclk;
> +	struct mtk_jpegenc_clk_info *clk_info;
> +	int ret, i;
> +
> +	if (jpeg->variant->is_encoder) {
> +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {

Why do we need to enable clocks for all hardware instances? Wouldn't it
make more sense to only enable the clock for the instance that is
selected for given encode job?

> +			comp_dev = jpeg->hw_dev[i];
> +			if (!comp_dev) {
> +				dev_err(jpeg->dev, "Failed to get hw dev\n");
> +				return;
> +			}
> +
> +			pm = &comp_dev->pm;
> +			jpegclk = &pm->venc_clk;
> +			clk_info = jpegclk->clk_info;
> +			ret = clk_prepare_enable(clk_info->jpegenc_clk);
> +			if (ret) {
> +				dev_err(jpeg->dev, "jpegenc clk enable %d %s fail\n",
> +				       i, jpegclk->clk_info->clk_name);

Missing undo. (But the suggestion below would take care of it.)

> +				return;
> +			}
> +		}

How about using the clk_bulk_ API instead of the open coded loop?

> +		return;
> +	}

Rather than multiple if/else variants in one function, it's a common
practice to have two separate functions and then a function pointer in a
hardware variant descriptor struct pointing to the right function. It
makes the code more readable.

>  
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
> @@ -1067,6 +1092,25 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> +	struct mtk_jpeg_dev *comp_dev;
> +	struct mtk_jpegenc_pm *pm;
> +	struct mtk_jpegenc_clk *jpegclk;
> +	int i;
> +
> +	if (jpeg->variant->is_encoder) {
> +		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +			comp_dev = jpeg->hw_dev[i];
> +			if (!comp_dev) {
> +				dev_err(jpeg->dev, "Failed to get hw dev\n");
> +				return;
> +			}
> +
> +			pm = &comp_dev->pm;
> +			jpegclk = &pm->venc_clk;
> +			clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
> +		}
> +		return;
> +	}

Same comments here as for the clk_on function.

>  	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
>  				   jpeg->variant->clks);
>  	mtk_smi_larb_put(jpeg->larb);
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index bdbd768..93ea71c 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -75,6 +75,31 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +enum mtk_jpegenc_hw_id {
> +	MTK_JPEGENC_HW0,
> +	MTK_JPEGENC_HW1,
> +	MTK_JPEGENC_HW_MAX,
> +};

There is no added value from the enum above. Just use integer index,

> +
> +/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
> +struct mtk_jpegenc_clk_info {
> +	const char	*clk_name;
> +	struct clk	*jpegenc_clk;
> +};
> +
> +/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
> +struct mtk_jpegenc_clk {
> +	struct mtk_jpegenc_clk_info	*clk_info;
> +	int	clk_num;
> +};

This looks like the generic clk_bulk_data struct.

> +
> +/** * struct mtk_vcodec_pm - Power management data structure */

vcodec?

> +struct mtk_jpegenc_pm {
> +	struct mtk_jpegenc_clk	venc_clk;

venc?

> +	struct device	*dev;
> +	struct mtk_jpeg_dev	*mtkdev;
> +};
> +
>  /**
>   * struct mtk_jpeg_dev - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -103,6 +128,9 @@ struct mtk_jpeg_dev {
>  	struct device		*larb;
>  	struct delayed_work job_timeout_work;
>  	const struct mtk_jpeg_variant *variant;
> +
> +	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];

Why is this recursively having the same struct as its children?
Should we have a separate struct that describes a hardware instance
(core?)?

Best regards,
Tomasz

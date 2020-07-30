Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001D82336E6
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgG3QeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgG3QeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:34:23 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68909C061575
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:34:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a14so25525228wra.5
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OY2UZZNO5LoFUNWNmqvzQjaXu/4IwXq/RHkRHAApjs0=;
        b=lBLrUmJQX9VJPFwYT69dLDlzsDo8zAW0PO5jvXXZP3/XinvgCCZlBVOjDxJMf/UxCh
         I5cqvdLVLep8MkjWGC7JZkSSxaVClsy8MkrDU9+WGXUiU9Pj76bkOSKa5Hv92it1DIzX
         vGMuJkjTMfOT78JPZ7Q2ALMvGeYbbyJTKtvBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OY2UZZNO5LoFUNWNmqvzQjaXu/4IwXq/RHkRHAApjs0=;
        b=pX8ItySMZ6MmPg9hwX1y0QxmDRr3vUpSiQ3jAaNNpY01Y9l92rW+swi6jF4eYGp+wI
         TIRw2ZqDLSPDZwVGaSpCl9rXDTrHEeunv9zm3woO2xbDuBe2ovcyJXavbw1Mo2RZplNL
         SZdiKRP8Wtt0YGBdGqPZ5D5IiLrinaxfFZwTvAV00VzX6qfYaLgTxV9Zfaypei2++e8+
         D2UWdXr6AlrWteFVY9dWc3OF3MzmAKHzpNgGiLYjtVtBT94j4Y0CFWOOBvQbjXWI6nBw
         0k61mIwlW7ToBj3I7ebgRMiu0wcxkeMujYvtazsHYjvkQV+25/rcOoeI21cQYqBgrJyA
         PYNg==
X-Gm-Message-State: AOAM530aoqlRS0ww1Gbg99plwAJUqR6RrnXL2HbsZ8yFJlHSy+5Wv5qP
        zfdZmPDtmGx039mk6Herd3yIDw==
X-Google-Smtp-Source: ABdhPJyd/og2bHNbufMlQHyw0CDJCp05jQFuR7xNgIFnvnG4uh2oyghPjdLycRR/FRn52yrO9lK8pw==
X-Received: by 2002:adf:f488:: with SMTP id l8mr3483642wro.123.1596126862114;
        Thu, 30 Jul 2020 09:34:22 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id a134sm11060738wmd.17.2020.07.30.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 09:34:21 -0700 (PDT)
Date:   Thu, 30 Jul 2020 16:34:19 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com
Subject: Re: [PATCH v10 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
Message-ID: <20200730163419.GA3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
 <20200723030451.5616-23-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723030451.5616-23-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jul 23, 2020 at 11:04:45AM +0800, Xia Jiang wrote:
> Use the generic of_property_* helpers to get the clock_nums and clocks
> from device tree.
> Use the generic clk_bulk_* helpers to enable and disable clocks.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v10: new add patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 47 +++++++++++++++----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
>  2 files changed, 42 insertions(+), 13 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7881e9c93df7..921ed21f7db3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +
> +	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
> +	if (ret)
> +		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
>  }
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> -	clk_disable_unprepare(jpeg->clk_jdec);
> -	clk_disable_unprepare(jpeg->clk_jdec_smi);
> +	clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
>  	mtk_smi_larb_put(jpeg->larb);
>  }
>  
> @@ -939,6 +940,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  {
>  	struct device_node *node;
>  	struct platform_device *pdev;
> +	int ret, i;
>  
>  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
>  	if (!node)
> @@ -952,12 +954,39 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  
>  	jpeg->larb = &pdev->dev;
>  
> -	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> -	if (IS_ERR(jpeg->clk_jdec))
> -		return PTR_ERR(jpeg->clk_jdec);
> +	jpeg->num_clks =
> +		of_property_count_strings(jpeg->dev->of_node, "clock-names");
> +
> +	if (jpeg->num_clks > 0) {
> +		jpeg->clks = devm_kcalloc(jpeg->dev, jpeg->num_clks,
> +					  sizeof(struct clk_bulk_data),
> +					  GFP_KERNEL);
> +		if (!jpeg->clks)
> +			return -ENOMEM;
> +	} else {
> +		dev_err(&pdev->dev, "Failed to get jpeg clock count\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < jpeg->num_clks; i++) {
> +		ret = of_property_read_string_index(jpeg->dev->of_node,
> +						    "clock-names", i,
> +						    &jpeg->clks->id);

The names of the clocks must be explicitly specified in the driver, as per
the DT bindings.

Best regards,
Tomasz

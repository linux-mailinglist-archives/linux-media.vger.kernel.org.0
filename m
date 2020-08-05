Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8AA23D09B
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 21:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgHETvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgHEQwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:52:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C098C0A8897
        for <linux-media@vger.kernel.org>; Wed,  5 Aug 2020 06:55:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l2so30256602wrc.7
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2020 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ja++vUWPJ08EOA6SgZWSzzzNGHnYWDLpTD9FHTxS0rw=;
        b=mPCsyVauudhQuP/KJCzACLzD1hGJ28aiHs4qkIVT+dJsG9lMfuT7dSoXYJbFizKZRP
         kR2I6h/RpqcqrsXsr0WOQrAgDwfnAX/8FSgglt/yxTXrl83b60/gxayRpC2euEgFfaQN
         aKk3SV25A7zijFrcxS9Y8ftx/QbxX1RciA4Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ja++vUWPJ08EOA6SgZWSzzzNGHnYWDLpTD9FHTxS0rw=;
        b=qumxGxWJtRHeeWWSLW4Hm0PWr3SObJf7Jd3ySTGzVH8tr2OmwjC7zmWfE+p9qq+Nu+
         lRRSiq6pX6ArMvmQiFSmXJJ8MFGy+ChDe9ISADZPC6xKISxbFTwHFElBFg3Sv7xPdTeH
         bFxtD9cOTWRTCu4GnfIhJmQRJepL9Bu2qJwNHu1vR1EKolch8j7EuOO2Gt3VKD37ArxZ
         OtWMVulLsJcJfM2JOX2LjFprjQ0vwLHXJfA5/+ovHrAbMZMUO3k+9dRXcfkonGFelHyW
         EGUN2ZinRUz2Jsp+qCMVXfyJGZbQTIstQFlsWu5vtF9r/2+lPDLR/ly5OVpdZqeJqCT7
         ZJ2A==
X-Gm-Message-State: AOAM533MWKgI++BfYf/NfAhmQLPHx9X5pH7GiScWtP6I77TmUs8tdNrV
        dYjULBsjn47tXPFotHY9FDXphw==
X-Google-Smtp-Source: ABdhPJxYNtjsQJjSF6xJ7nBQbZo3fBriXEe6OI14ms3Hr23UwjYAMHhqsXQOBERea4H+jC1NM69TBw==
X-Received: by 2002:a5d:5485:: with SMTP id h5mr2759249wrv.427.1596635746822;
        Wed, 05 Aug 2020 06:55:46 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id p14sm3039630wrg.96.2020.08.05.06.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:55:46 -0700 (PDT)
Date:   Wed, 5 Aug 2020 13:55:44 +0000
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
Subject: Re: [PATCH v11 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
Message-ID: <20200805135544.GA1014704@chromium.org>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
 <20200804034102.22983-23-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804034102.22983-23-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Tue, Aug 04, 2020 at 11:40:56AM +0800, Xia Jiang wrote:
> Use the generic clk_bulk_* helpers to enable and disable clocks.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v11: specify the names of the clocks in the driver
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 28 +++++++++++++------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 +++---
>  2 files changed, 23 insertions(+), 13 deletions(-)
> 

Thank you for the patch. It looks good to me.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

One comment below about a thing that should be fixed in the future,
separately from this series.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7881e9c93df7..47d570f32e3f 100644
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

The errors in this function should be propagated to the caller and
handled properly across the whole call stack.

Best regards,
Tomasz

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6650E232577
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 21:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgG2TeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 15:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgG2TeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 15:34:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5184C061794
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 12:34:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f193so3097424pfa.12
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2020 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lmJLA307lWwHeekzFPQEB9AOfGsNOnQY/hcrzbIKKSE=;
        b=TIeig73KPrCadNnZzPVQMPdXyxSNS+6R7DYyL+q39sURTqbKUrSTkoS0r04rdqBCrV
         nhOU4qnBs+c/IgQtdZMwlKnhy+Wt55KjwlqseHJcxw9xrSaer/vlD8kZrvxEtm4JJi/0
         Q8xS4fA0amlih1oA2y+Zx2l+lGKIeGMU9H8+ZfiXwrxtuhnXmbguDRiyRYX3WFUiPvLl
         dbc5/RtEa4NRtzkBKieF6SnCxhQmcaM6I7AHhPDE7CjVHdvgEn7J8xwf7ptL31l1803O
         5dFkBRHgdBFmr/gZmkEPftkvzGqqfV3/tFARIh3KUxBoWaHRn3GKAK0Fm6YCA1pj/r8X
         YA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lmJLA307lWwHeekzFPQEB9AOfGsNOnQY/hcrzbIKKSE=;
        b=HHWdUTYlxEMULbQd7tVM2K2HIxJ+bSXwhbAzgg3ZQZrshDFIRPNlInhBAsIGgs+DjB
         CXgJyjbcpMheV987Lmk1uIcvd5l0JojQOBJjacwq/bHzjIAtjBHtWjoy9dZwBeq3rS9n
         aiSiJDF33MplLvYgo20MdyRvqfSvDZZC+k6q5r1OblRfo91cG2PatDE3Ct6Yhg+gdbO7
         B6Lj+if++LBKmO3rMDPrQWqfnhQ4KMLfcvLGFXlihWXtH+XDh7B9/N9rNqveZwqooXkf
         AgVKImSHhxo7IsJab/iEEk725M9gC3K5qZHS+E4XgLtk24U490cCvlJXRxumYECPN7vF
         blUA==
X-Gm-Message-State: AOAM530FpDdAa7OFvq1VTuCXcPX3tul06Oa68hIsEuHa8sirXE6e2s44
        a8k9ExTQzHXQZ6S1KfWzpowmPw==
X-Google-Smtp-Source: ABdhPJyRFLTdu3N5j96/tqd5+3I1ogGdK179B/GQj3++vwncEjAWmlf/FTnGk7Uf6YXWKYzWVvB/rQ==
X-Received: by 2002:a65:43c1:: with SMTP id n1mr29913461pgp.67.1596051246141;
        Wed, 29 Jul 2020 12:34:06 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm3074150pfa.119.2020.07.29.12.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 12:34:05 -0700 (PDT)
Date:   Wed, 29 Jul 2020 12:30:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v5 2/5] media: venus: core: Fix error handling in probe
Message-ID: <20200729193036.GI229995@builder.lan>
References: <1596007005-30425-1-git-send-email-rnayak@codeaurora.org>
 <1596007005-30425-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596007005-30425-3-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 29 Jul 00:16 PDT 2020, Rajendra Nayak wrote:

> Post a successful pm_ops->core_get, an error in probe
> should exit by doing a pm_ops->core_put which seems
> to be missing. So fix it.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/media/platform/qcom/venus/core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c653..bfcaba3 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -224,13 +224,15 @@ static int venus_probe(struct platform_device *pdev)
>  
>  	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	if (!dev->dma_parms) {
>  		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>  					      GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> +		if (!dev->dma_parms) {
> +			ret = -ENOMEM;
> +			goto err_core_put;
> +		}
>  	}
>  	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>  
> @@ -242,11 +244,11 @@ static int venus_probe(struct platform_device *pdev)
>  					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>  					"venus", core);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	ret = hfi_create(core, &venus_core_ops);
>  	if (ret)
> -		return ret;
> +		goto err_core_put;
>  
>  	pm_runtime_enable(dev);
>  
> @@ -302,6 +304,9 @@ static int venus_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_disable(dev);
>  	hfi_destroy(core);
> +err_core_put:
> +	if (core->pm_ops->core_put)
> +		core->pm_ops->core_put(dev);
>  	return ret;
>  }
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 

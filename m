Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739C66C9E94
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbjC0Iu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbjC0Ity (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:49:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8D1B445
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:46:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id k37so10369757lfv.0
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbNaKw6aqamK3roqgBRIlLww5bgM2WlHnx/z18D7Poc=;
        b=zapWaRjOj0zN3azYwWiqvDdYd8baBK/2B+jQieK6eeB+M9qN9I3WVFrOhcTBhyLHo4
         xlBgabQmiAUGCqfV4glhxdOLQyHwCySuLKECf5l0zdrQbuU0TomX1gKBWEPLpkjgqb5h
         Reeg8p1h8yipR03ua0GxbfRQVN6IfxLsFEYrBUI60tLGryTWqFO8eVnu7Y7W66HVhEOd
         gyJjFePQNWBAcmj4dyNAg46BGuUrMkTZdZ0R5Zh2MrH40Kxi22vc86XTO9ZM3mOUcQ+u
         JIZTLg2juYzhyvQn+mlY1QL7rkEqUVazSjbT83GpdtvnzujEzIZnvyfSAjgm/mIpxGC3
         hLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbNaKw6aqamK3roqgBRIlLww5bgM2WlHnx/z18D7Poc=;
        b=GgZIsaiVmaUzHYJepbLFXkF/g2Uh9KFz57bHpkMSz2m5bQQIdtbwBmT+EPXHd/qDUd
         BiMR8liDOZp05GMp6KwuEnxgrlfZml1TGirIWaNyx3U4MHLJs7BpH9dMdC4AgZt8W+Ip
         i2mWifEtQj8wGdbuFJw8s89FhfF2PLBJMgTIVskNtIQTHr4S5iKmmuEDNWB+exhQzr0o
         ypL5sW+8fGAyZE2LHvCmL9YhqQzAR/oNXU5OyoXRF70sE4L3qF1NR41HPJPSadSML/Oc
         RowFMzoELrFK6diFcvmLpbrS9hZ6m5UxL4GFvDXevbxDjqLUH7od7v+xPBxBg6SDON8c
         GrpA==
X-Gm-Message-State: AAQBX9cntDUZRIMWKWySdsIGsToqsMvzDiCiRJPaxvGzAL/TcrTaBV60
        mkfUqlqFCtcXrl//25DU4qa3OQ==
X-Google-Smtp-Source: AKy350ZZEYrMwL+urK3n6jEf5TnAlDhxjk+9tFbC12ZtRZuSVJIjEZwbxE7Inzd4ik0uVD/NYBoo8w==
X-Received: by 2002:ac2:5591:0:b0:4e8:41fc:b37 with SMTP id v17-20020ac25591000000b004e841fc0b37mr3160734lfg.10.1679906764334;
        Mon, 27 Mar 2023 01:46:04 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512021000b004e845954a81sm4573404lfo.296.2023.03.27.01.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:46:04 -0700 (PDT)
Message-ID: <17e8301d-3e81-bd1c-7e52-5a62f0d60a64@linaro.org>
Date:   Mon, 27 Mar 2023 10:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 045/117] media: vdec: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-48-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230326143224.572654-48-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.03.2023 16:31, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/media/platform/qcom/venus/vdec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4ceaba37e2e5..d47c22015770 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1774,7 +1774,7 @@ static int vdec_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int vdec_remove(struct platform_device *pdev)
> +static void vdec_remove(struct platform_device *pdev)
>  {
>  	struct venus_core *core = dev_get_drvdata(pdev->dev.parent);
>  
> @@ -1783,8 +1783,6 @@ static int vdec_remove(struct platform_device *pdev)
>  
>  	if (core->pm_ops->vdec_put)
>  		core->pm_ops->vdec_put(core->dev_dec);
> -
> -	return 0;
>  }
>  
>  static __maybe_unused int vdec_runtime_suspend(struct device *dev)
> @@ -1825,7 +1823,7 @@ MODULE_DEVICE_TABLE(of, vdec_dt_match);
>  
>  static struct platform_driver qcom_venus_dec_driver = {
>  	.probe = vdec_probe,
> -	.remove = vdec_remove,
> +	.remove_new = vdec_remove,
>  	.driver = {
>  		.name = "qcom-venus-decoder",
>  		.of_match_table = vdec_dt_match,

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183196C9E96
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjC0Iup (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbjC0IuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:50:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D640AB456
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:46:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y20so10344625lfj.2
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bblUISwUdvX28GVAQmZgddhk99r6Y32+A6iFqrvA9Q=;
        b=U+2nxbg2awVjW8DK6WQY2+V6cIWknv0bO+NiHqbEheTiEFE2VMeSYymqq317GJe69/
         XSwOv7LrXDxud9oapLO8yuTEQj7BVmGnBOfS5LRmLV9hxNBprje/+9Cm9ThgPajBEX6e
         r5ymjh+wa5ggzmX0S9ha1sy1rdImLyPSGbbNZGdekA4YFkXo58rSzhtdUcj/Y6Kb4eRL
         eL+ikJgu7vp/0F7mWRQpxhq1rBVoM2gftmO9LoXhDmWUx4rcdzlN5nirDeyGwcNzdADh
         Dcy+Ddu2QmBUCc1Bccmj82u4cIahNX0ZINMFZO+u9mb099Xeuxbdpg24bcuC5AJJk79A
         woCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3bblUISwUdvX28GVAQmZgddhk99r6Y32+A6iFqrvA9Q=;
        b=Ka+uQ0nzb+G0b0iBi1D3lFGVqS4c9DFHVY5KvM3CukMu692p6b835YjZR/AR3Ufvx6
         tdW5W7FGOSjrEWPldHeq/M/MXBqNoP/bFOIhmL2EViNw/AN1n3UMez7nMXGmWrRAHlG7
         TC/3J2Dj0RJDsIprUK+epcqEFjYS86TSvSiQomtT3aIyKAAcLEgNbxIXfScSExJnp7c3
         Jxokds1GcmRCzGqo9ylISQ+bJgethhPwLNll4v3mJwOz4C7IYWtQFv4uQ7GoUgKHfQNM
         rG6Yw0ygY/s8oEVxvL8M7l4AQOhm7vLSU7w4TOIQd+lcKecxFhi999z+pvS4lgYXOw1b
         GnGw==
X-Gm-Message-State: AAQBX9fzQeVckGHBNgFFvAF3lwY/kK+L0Mi8rhLGW4dj3FI7eHLLY4GD
        v9sUIOgzg6R275k63ojs3wdAIg==
X-Google-Smtp-Source: AKy350bIQMnul1Wn9w7L9g2s+pjWkdNnt9dnVvTfSXioHFe09J5toczUaODqHFcKw6Az9nHgKpzPtQ==
X-Received: by 2002:ac2:494e:0:b0:4e7:4a3c:697 with SMTP id o14-20020ac2494e000000b004e74a3c0697mr2988056lfi.38.1679906770682;
        Mon, 27 Mar 2023 01:46:10 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512093100b004db0d26adb4sm4548579lft.182.2023.03.27.01.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:46:10 -0700 (PDT)
Message-ID: <1db4d7f2-c4b4-6ef7-3aab-96608e84064e@linaro.org>
Date:   Mon, 27 Mar 2023 10:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 046/117] media: venc: Convert to platform remove callback
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
 <20230326143224.572654-49-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230326143224.572654-49-u.kleine-koenig@pengutronix.de>
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
>  drivers/media/platform/qcom/venus/venc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index cdb12546c4fa..6d61614656a5 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1492,7 +1492,7 @@ static int venc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int venc_remove(struct platform_device *pdev)
> +static void venc_remove(struct platform_device *pdev)
>  {
>  	struct venus_core *core = dev_get_drvdata(pdev->dev.parent);
>  
> @@ -1501,8 +1501,6 @@ static int venc_remove(struct platform_device *pdev)
>  
>  	if (core->pm_ops->venc_put)
>  		core->pm_ops->venc_put(core->dev_enc);
> -
> -	return 0;
>  }
>  
>  static __maybe_unused int venc_runtime_suspend(struct device *dev)
> @@ -1543,7 +1541,7 @@ MODULE_DEVICE_TABLE(of, venc_dt_match);
>  
>  static struct platform_driver qcom_venus_enc_driver = {
>  	.probe = venc_probe,
> -	.remove = venc_remove,
> +	.remove_new = venc_remove,
>  	.driver = {
>  		.name = "qcom-venus-encoder",
>  		.of_match_table = venc_dt_match,

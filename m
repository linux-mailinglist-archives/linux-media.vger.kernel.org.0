Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA986C9E88
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbjC0Iti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233400AbjC0ItK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:49:10 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B93619C
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c29so10331666lfv.3
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wA1Dz1YUKU3s45xOKdQjq/R4z1vPc3ExcaWYwJgXdt8=;
        b=bdFPntKAtGkW4cHFhoA3M8nJbdwc2FVd4w4pYbWxgk+zt1f4T541w3tk0LYksFgEYL
         V5dU7YR3ma5ZRB8tXuHzteH4XWK7G9MLkPwlcHwvT6S5wCGhzEuS1pOPO2PG1xgIGi85
         ZNCcPGIo6O3hRy5YEnvE+vQzB9nC67VYVEl3g6o2z04X8lDZ8g6G9HPFp3iWskDcNmW0
         l9/mrK4gaX5/PabYqZw7Jn4EZbHmjq+F+NN+uVS49o/gZUkyJNifpjtTQDoMtWy9zPYN
         MtQnmbKm86drfKGgjqcxr2qWafGRAYBjCSEI1caty8SHJ88UjoYLCAu36FZpWO2t+FzF
         8F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA1Dz1YUKU3s45xOKdQjq/R4z1vPc3ExcaWYwJgXdt8=;
        b=pSPLE67ar8w8L58h0Y11DtU4sHzdgjbbtds/ZhUMFpl9FJ30N6wsRa/wD/zFGu/z9c
         ui1SMpX3501uscp4Lk9hGe16ej5HdQrs1cBH/fY2JHpVyODRnsAJfuzUjWHqlh5Wz34s
         P42whfMA5eHcfNHuu7N68OvvtwzlkkDjCsg0eB3ecWs4vdZ5B5rFCZMQXGVWhL92nuZG
         ht1lJs/32iJu+0MA15GPCFDUTfnIVOpMHnu8/bv2CQFCTKBU6BTW/y0kaRkLsieTJEeG
         zr6f4WhWIlbstw8t4Xmz7T+rUHqvotYcgnWdP6GCTk/ynKe0Mryj4EjgLP4KynnjkthR
         fdjw==
X-Gm-Message-State: AAQBX9dw/avFMaziccF76TSuY8MMbPZpvrAPRRE4c1qLbgcAS1ecaKfC
        nR02thhi43/nJVGTPvmMAGQ7wQ==
X-Google-Smtp-Source: AKy350a7T/IHLyPNc7cBHVSbZ7Lx/v0gyE9sghRM8jKPJv9LDCDWbqTol+/Nzc7nF9r7cogz5f8k6Q==
X-Received: by 2002:ac2:4426:0:b0:4dd:af74:acef with SMTP id w6-20020ac24426000000b004ddaf74acefmr3246579lfl.35.1679906712038;
        Mon, 27 Mar 2023 01:45:12 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e9516000000b00295da33c42dsm4576909ljh.15.2023.03.27.01.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:45:11 -0700 (PDT)
Message-ID: <b32af1d5-ec1d-72d3-bab5-5677f0ba4b1c@linaro.org>
Date:   Mon, 27 Mar 2023 10:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 042/117] media: camss: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-45-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230326143224.572654-45-u.kleine-koenig@pengutronix.de>
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
>  drivers/media/platform/qcom/camss/camss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9cda284f1e71..df8a507ce8ac 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1725,7 +1725,7 @@ void camss_delete(struct camss *camss)
>   *
>   * Always returns 0.
>   */
> -static int camss_remove(struct platform_device *pdev)
> +static void camss_remove(struct platform_device *pdev)
>  {
>  	struct camss *camss = platform_get_drvdata(pdev);
>  
> @@ -1735,8 +1735,6 @@ static int camss_remove(struct platform_device *pdev)
>  
>  	if (atomic_read(&camss->ref_count) == 0)
>  		camss_delete(camss);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id camss_dt_match[] = {
> @@ -1798,7 +1796,7 @@ static const struct dev_pm_ops camss_pm_ops = {
>  
>  static struct platform_driver qcom_camss_driver = {
>  	.probe = camss_probe,
> -	.remove = camss_remove,
> +	.remove_new = camss_remove,
>  	.driver = {
>  		.name = "qcom-camss",
>  		.of_match_table = camss_dt_match,

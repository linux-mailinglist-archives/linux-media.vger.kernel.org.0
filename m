Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96086C9E8D
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjC0IuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbjC0Iti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:49:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C304AF03
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:57 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i13so10300704lfe.9
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPZSCKp7vZLTxkuBtskdPHC0sKrR3He7Fthw/GA/hf8=;
        b=gC51z7Id08kqVskdO8iOYZakg/SGw4Dd3ORv1rawdNA6Ge/0faeEGhkTUZnebXYkFL
         aLiyEsdZvVVCM/gBwDCbLif5VwtUljJCtEGFOr+V51uqcQKPnxhLYRgOtsazrFZBURSj
         tnU2gM0c+XXYzt3CoBrajnh3Bznai22zz+CajkEtweBxMmymkT3XfEoMIiZyJ5s8M66J
         ZKJwCF3G1KRs7MvYBuOW41eMHTpz4h8WISSp4xAdd64WHG4OYKPNSc1dfVXTv/zDxRbT
         alvXh1sV+brwU/YlEeR3RpPAMeIgUt+h1Wcf8o8u5qzGfs3trKkOKSj12wcM48m2Vy3I
         surA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPZSCKp7vZLTxkuBtskdPHC0sKrR3He7Fthw/GA/hf8=;
        b=8F8rPmoWvAOhDOJtFFPlieRNmR8ZHr0VX3FMnWNxbXjHrz4vnN8hxhGlFiePHS+biC
         uoYog23YwucvHcEa58xW+VsQQBefcFi7ScHQ50kbo7PMF/3VbkEcLB0e0f9Hl4VhJI4k
         AXWoxP/yyOWUmsCnLxgeNOnphd0l0OVrIPbHFz5XpAuJOIM/iz8n8LBWVPLrD7lItTbA
         eg71SAng0Kca9zz0fCA9NKox7LDffu8NLywDWCMmHsQo9jIaIwUHR7jb+T+Ss3VuxRW1
         JqJL+BI+Amurc+tq/kQNNL7jjqwWJj4ERvK3F3uoR/Ym+DJpwe3lAyAHzKIGzKFiiHwX
         6IYQ==
X-Gm-Message-State: AAQBX9cc+9mJ1OvcZkOn/aKH8ZqtMGe4RzuVP4PHfyi+GIQQbi1rKhcf
        SxZ+j+XcStRGIhLORXRaiyh5fQ==
X-Google-Smtp-Source: AKy350abro+CyXrXFwvQMPrWGIlZWOFbGiOOa9PUJXfnJBBEUoJGdtutYjlxM9idI9iFRD7tYzzRNA==
X-Received: by 2002:ac2:5505:0:b0:4b5:9e70:ca6e with SMTP id j5-20020ac25505000000b004b59e70ca6emr3153693lfk.17.1679906754189;
        Mon, 27 Mar 2023 01:45:54 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id u15-20020ac243cf000000b004eaf2291dcdsm2559738lfl.102.2023.03.27.01.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:45:53 -0700 (PDT)
Message-ID: <a1f79852-e555-0794-c534-57da7f1ab543@linaro.org>
Date:   Mon, 27 Mar 2023 10:45:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 044/117] media: venus: Convert to platform remove callback
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
 <20230326143224.572654-47-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230326143224.572654-47-u.kleine-koenig@pengutronix.de>
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
>  drivers/media/platform/qcom/venus/core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 403ffb92af60..2ae867cb4c48 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -416,7 +416,7 @@ static int venus_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int venus_remove(struct platform_device *pdev)
> +static void venus_remove(struct platform_device *pdev)
>  {
>  	struct venus_core *core = platform_get_drvdata(pdev);
>  	const struct venus_pm_ops *pm_ops = core->pm_ops;
> @@ -447,8 +447,6 @@ static int venus_remove(struct platform_device *pdev)
>  	mutex_destroy(&core->pm_lock);
>  	mutex_destroy(&core->lock);
>  	venus_dbgfs_deinit(core);
> -
> -	return 0;
>  }
>  
>  static void venus_core_shutdown(struct platform_device *pdev)
> @@ -891,7 +889,7 @@ MODULE_DEVICE_TABLE(of, venus_dt_match);
>  
>  static struct platform_driver qcom_venus_driver = {
>  	.probe = venus_probe,
> -	.remove = venus_remove,
> +	.remove_new = venus_remove,
>  	.driver = {
>  		.name = "qcom-venus",
>  		.of_match_table = venus_dt_match,

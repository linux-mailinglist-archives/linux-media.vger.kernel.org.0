Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8177A533756
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 09:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242763AbiEYH2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 03:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242414AbiEYH2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 03:28:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C226E38
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 00:28:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bq30so34653908lfb.3
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2t3XxprCIprt4K6OV63XN2/48WC0q7O+qd6jEf+aQrk=;
        b=HArMKOtoFawbvN6IWSr8+6UerIemeF/d+pFOGSajbmUyufUZvqq/BxN5LtvPmKgo/3
         jNRHr7itNJbzQaV0D7bFXe8qp2S5dkia3fRD/UhVsq3WRzhYOD8Gr0Kyv3PbkLqfBdcl
         /u0PrtY37sVwnwLYaGKLTsF2333rHiCW/IbRb6ha0rIT5qXS5VLOqp8sFDa3IcdpE1g8
         K2laKSesrwmtiov/tlHRrCFfVRRUR1Ay9HFUsRRS5d+WrwrTgEZzS8RP7IpTEcjYw5hw
         4v0hwGGi48g9JujJ2Rl95YFyh0IVE7ldIBbIVgcfijyWyuGlzEL0Lwk9u3W1iW4tnoka
         muOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2t3XxprCIprt4K6OV63XN2/48WC0q7O+qd6jEf+aQrk=;
        b=wey/90IFsiPgdQ3ErieKw3kYH5Pi8BohTM1RWo9gYrEpBTVc32/SNLqRcCmRyVBOJG
         T0YlPyapmKuIgYudcesgVMavvTkUvawCPd/ag1LuULsmCeEAQ5wSIMLHXtQ48BK+vwQu
         g0sbRAXqzQKAab4C/Q/KIt52NehnvZMUyUefEtilz8d8Me1ct814vsLzMv94FBob6sKw
         UnBgtEP/8h1kI1F5jNJWe7bN1heApFnPRcwZH4byAN39/JzjL1HgRyYMHsF4aFKgWI8m
         vkQKPU3ApDIg+u7eV5VI6iYmA/EfYSQTV9KDdSeArdnbQwsOTcrIlggNYq1fafy5QWti
         kAxQ==
X-Gm-Message-State: AOAM532l5JRjSv0vzoXVbja4PxTtRutkwYuvlS0qXYKt2frhvmByAEQB
        WrSJKyLDd0evuwrfhBC6UVXIJw==
X-Google-Smtp-Source: ABdhPJzBkCF5IHLKrNWMpI/oBZXNz5WzI5k61BEggQ82j2AFpSzhTqywj5QvY0N986fOmwO7v6S+zg==
X-Received: by 2002:a05:6512:374c:b0:478:5452:cdf8 with SMTP id a12-20020a056512374c00b004785452cdf8mr17723900lfs.601.1653463681924;
        Wed, 25 May 2022 00:28:01 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o28-20020ac2495c000000b0047255d211c4sm2948208lfi.243.2022.05.25.00.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 00:28:01 -0700 (PDT)
Message-ID: <a398653e-188d-005e-8483-d0886e6a7de9@linaro.org>
Date:   Wed, 25 May 2022 10:27:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/4] i2c: qcom-cci: Fix ordering of pm_runtime_xx and
 i2c_add_adapter
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
 <20220524140207.2758605-2-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220524140207.2758605-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On 5/24/22 17:02, Bryan O'Donoghue wrote:
> When we compile-in the CCI along with the imx412 driver and run on the RB5
> we see that i2c_add_adapter() causes the probe of the imx412 driver to
> happen.
> 
> This probe tries to perform an i2c xfer() and the xfer() in i2c-qcom-cci.c
> fails on pm_runtime_get() because the i2c-qcom-cci.c::probe() function has
> not completed to pm_runtime_enable(dev).
> 
> Fix this sequence by ensuring pm_runtime_xxx() calls happen prior to adding
> the i2c adapter.
> 

it's a proper root cause disclosure and the fix, thank you.

> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 5c7cc862f08f..90d02effeae9 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -638,6 +638,11 @@ static int cci_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto error;
>   
> +	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>   	for (i = 0; i < cci->data->num_masters; i++) {
>   		if (!cci->master[i].cci)
>   			continue;
> @@ -649,14 +654,13 @@ static int cci_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> -	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -
>   	return 0;
>   
>   error_i2c:
> +	pm_runtime_put(dev);

Here pm_runtime_put(dev) should be removed, there is no pm_runtime_get*(dev) above,
otherwise PM usage counter underflow issues are expected.

> +	pm_runtime_disable(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
>   	for (--i ; i >= 0; i--) {
>   		if (cci->master[i].cci) {
>   			i2c_del_adapter(&cci->master[i].adap);

With the correction stated above please feel free to add my tags:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

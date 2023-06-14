Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4C173007A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 15:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245208AbjFNNtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 09:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjFNNtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 09:49:00 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF582210B
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:48:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f8d65ecdb8so7841915e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 06:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686750533; x=1689342533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQRkWTdhNbie7Yl4fIjz8Y6us5dTHeT2K8OrGKpYQL4=;
        b=Aqq448jAHiIwXH3/IJT3LEIxt4F5v8CwOyZkG1Q2UzwGPabABPECfaLNCNAvCnvDwZ
         gCXV5JTwBXdtzH0KS1YGyhwBHhlvfP7nRABfqJKwG28qCPlBymNOejmEy5dy6yI9MSBT
         beeAemXmymLJgNN/B+a+wHWIhz9AGkkGz5/jcGZrT8zrG5Q/4ePHpeePVnN4KTdzmobv
         6+J+96PKFuZBdadmhKDNr/aRL9Lf9GJYRZe034YD3owARdzfN4IV8YOe3LE7qOnYKPF6
         yD265lGDYe0Ywj3zxBd+JNiNcFvFwEgsOcsayk8c7FMR6GMZDuPzehgMaSvKeNZ4L2pL
         bSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686750533; x=1689342533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQRkWTdhNbie7Yl4fIjz8Y6us5dTHeT2K8OrGKpYQL4=;
        b=ThF7YNc5ComzaQ75lrt/vzrbUDn+JGOuMOFeUEa3KAFFPX0WlLv50Avnyb9kzWjaG0
         zXVu+BC9EvqlTpxHPpbg9s4D5eAb/mrqIdO7vkh1qM+2EGlQL6maByo1DQL9Ty9L8kv3
         Iv124cfq+MNE3gToK2OZT22gtpqdexlYZFVx5g6tKYzFpI82nMuZLefV8D5U785CPr/z
         LOI9QNY5LhJS+E8ZcLApIcBB7swA/nvN4mBS44zyd0q634RxokulusVcedWlnylPo+wR
         pUJNIbgGkt81dlZpbRA07swrtcDsgNCWqkIUoIv60IMEcTjl6zOVYzTY6nVDA2aXdc2g
         S5QA==
X-Gm-Message-State: AC+VfDwrKpLa1M97bRE9EvQMMfUE905aerbs8MphoKr7cdsY5pyNWmDQ
        rUcR0LDldrwffW40DRz9OBIP9g==
X-Google-Smtp-Source: ACHHUZ7LEi1L6sHHawdEtfCMXAmXZY+PoASNxOVIo8Y9RjbdYijAJGvpqQTZiDJHUBKpxnBfKNwlaw==
X-Received: by 2002:a5d:4e85:0:b0:30a:d2e6:6a78 with SMTP id e5-20020a5d4e85000000b0030ad2e66a78mr10286179wru.24.1686750533132;
        Wed, 14 Jun 2023 06:48:53 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6dd1000000b003095bd71159sm18424339wrz.7.2023.06.14.06.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 06:48:52 -0700 (PDT)
Message-ID: <8f53da6d-76ec-a7e1-8308-b676930d224c@linaro.org>
Date:   Wed, 14 Jun 2023 14:48:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC] media: camss: Intepret OF graph connections more
 sensibly
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230614-topic-camss_grpah-v1-1-5f4b516310fa@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230614-topic-camss_grpah-v1-1-5f4b516310fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2023 14:22, Konrad Dybcio wrote:
> Not all endpoints of camss have to be populated. In fact, most of the
> time they shouldn't be as n-th auxilliary cameras are usually ewaste.
> 
> Don't fail probing the entire camss even even one endpoint is not
> linked and throw an error when none is found.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1ef26aea3eae..3aa03fbc94e2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1084,9 +1084,8 @@ static int camss_of_parse_ports(struct camss *camss)
>   
>   		remote = of_graph_get_remote_port_parent(node);
>   		if (!remote) {
> -			dev_err(dev, "Cannot get remote parent\n");
> -			ret = -EINVAL;
> -			goto err_cleanup;
> +			of_node_put(node);
> +			continue;
>   		}
>   
>   		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
> @@ -1105,7 +1104,7 @@ static int camss_of_parse_ports(struct camss *camss)
>   		num_subdevs++;
>   	}
>   
> -	return num_subdevs;
> +	return num_subdevs ? num_subdevs : -EINVAL;
>   
>   err_cleanup:
>   	of_node_put(node);
> 
> ---
> base-commit: b16049b21162bb649cdd8519642a35972b7910fe
> change-id: 20230614-topic-camss_grpah-39f9a4f7420c
> 
> Best regards,

Can you give an example of the DT that is causing this ?

---
bod

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5CA16A5C9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 16:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjB1P6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 10:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjB1P54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 10:57:56 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E2232E4C
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:57:24 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bw19so10248017wrb.13
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677599843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqxMJVUtV8W8U5LwK4W0E7Nqt6EcI+7j0jBpdLfc6FI=;
        b=dHcRetYKZpZwKmbStg0r3ZkEmFL+g5BMZWPfLmyviRO6WCRwXQPieM9jxtbSRaZ+FB
         1CsLf77A9JaBilyOKuH7mxAzw49gJR/1tSxFwhhtp92/siWCSfEWUVvpgiqXbnPQZZlp
         KPpfnvV0cn8N+zwrzj0uZ+RAg53XQJ+PSPeAXlTbVwPfuvF95P1rfNS6Auy5BJiggi4b
         1qo0l7juw9DyQSf/PlLLYi6o1+HbkTns17Kg8kylpKwBqMcFqx/4k8PT6RTJ/XFXjsU7
         nK05qZVbYtXrr8P9BqH9PAJrguUVbJOJe/TidVltrXEFXErucl5KeTmZTlVVTjdjei8l
         rpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqxMJVUtV8W8U5LwK4W0E7Nqt6EcI+7j0jBpdLfc6FI=;
        b=165vGkZs1DnJeS/0xc6WBx5/NyzqRPM+332M1AhKn1TJdM5ZtdWHflmPcgs7SNR5rH
         4e0Lv5CGHFzDH9cndwAtAXXXhx+NHZmjL6KMCTnlfSRqJdNl2GYoMLBVY2XZY57IimUp
         R0r11t1fMJapBE7Snc0XE2VDdFZdVSfDjB6ZHW93lK/l6+x1YTtftY/HpAAWxqULEi0t
         2IhlSut+i/qYagfH5JZkmBVBr2OKXYiOtxAhwWesnJY8HiStsFTel4URewYmf3t/iDnW
         kJl5D+OckhdsWYeYljhIWb5dZYSGJhwZX6FD+GLJY6a+0oBkJO9XXwHZKjwuC481zq+q
         bM4Q==
X-Gm-Message-State: AO0yUKWwIJz0v/WkPCSlSpdCWgK82XwJR5LbFCUoEGXQNhPBS5lnFqqK
        9MBPzeSrSn5jNg86p9qh/MjqGQ==
X-Google-Smtp-Source: AK7set96h7J2Kq+YCW0rrA126qgFYtYnjjnV1UcYlNIWEQFzEGEqGjhS2hxkh502vg/Y/dsdojxVPw==
X-Received: by 2002:a05:6000:11c7:b0:2c3:eeeb:b2f7 with SMTP id i7-20020a05600011c700b002c3eeebb2f7mr2432637wrx.62.1677599843225;
        Tue, 28 Feb 2023 07:57:23 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t14-20020adfe44e000000b002c5503a8d21sm10387625wrm.70.2023.02.28.07.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:57:22 -0800 (PST)
Message-ID: <0d319988-e4fe-3c67-fca6-fee3ff94f673@linaro.org>
Date:   Tue, 28 Feb 2023 15:57:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 18/18] media: venus: hfi_venus: Restrict writing
 SCIACMDARG3 to Venus V1/V2
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
 <20230228-topic-venus-v1-18-58c2c88384e9@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-18-58c2c88384e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/02/2023 15:24, Konrad Dybcio wrote:
> This write was last present on msm-3.10, which means before HFI3XX
> platforms were introduced. Guard it with an appropriate if condition.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index c2d134e04c30..deeceb86414d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -463,7 +463,8 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>   	}
>   
>   	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
> -	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
> +	if (IS_V1(hdev->core))
> +		writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
>   
>   	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
>   	while (!ctrl_status && count < max_tries) {
> 

Looks good.

Which platforms have you tested this change on ? Can you include that 
detail in the commit log ?

---
bod

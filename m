Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3969E4FAF98
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 20:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbiDJSps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 14:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiDJSpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 14:45:47 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B52636B48
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 11:43:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u15so8129323ejf.11
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 11:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wbYPtptec7QbAGJo1o9GOuV9jbyduIPyoXCbrV2QG9U=;
        b=C0yU56vVruJLjN/r1qRQy3n0t+zw6JYGGe4rL9yp1wublbJ+f2ewWvD5ECc7z5eKcO
         rY11zq0SaZQleBqXBM6hur8LI/C3j4FQOCONBrGhvcpZzocVi+tqfT8Di7f0fubEZqzT
         sikx6Ry2g1mh3iDpWSrlWEQ+bg+d+Nlss+eRVIxiIYJEuyYCJHlTPDLlQ0RxeiQDfTQ5
         0XX0j2pWARp238JFHnOX7ZZEww/PTkQr3Uu0aCfGd4bil/cFeHsVweKWx0H9NHzFp3tG
         tvr5fXv48RofFdFCosCjurZdBlSaTkvfjc96DJEdFZdhscGldMd/wYcm6yvFzXxLDIGs
         wqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wbYPtptec7QbAGJo1o9GOuV9jbyduIPyoXCbrV2QG9U=;
        b=pfLRmao/qCk4gsxJJkuogjeS9qTlTxktbLyWbMqhVOM9udfiEhQEr7DsnxLR2YL7Rq
         gpEJzEl0UiGCqVwmTlYxoxpesYf0pNjgA9nQL1lSV8XCViRM0F/gShM5xWqGHUwyTYb9
         ad1LbHGicylRsY8lcrtYK9xpmqaLfxnSRtld1+lyL7kRhuWBEAYA8zXJtbvwGpARHVWX
         79EletUPdXDV7yy+OHVEBBpZh9XTNvEHhMptO5tfvmwrddWpl/AkX6ph9WW4TZnOG0/R
         kGHtzTSpgLQJvO0PBI0/k+/d+9JpfcNBsZLfRxpCAkeqdFT0tLOvtskSJ5ueURcQW8yY
         W8Vw==
X-Gm-Message-State: AOAM531tGkp3kZifj8Sh8VxvwkM3GmBjiO05VDCzqbVsX5rr3czFLN5m
        w4woihUOVdQ/EU0AKyKUn7txIw==
X-Google-Smtp-Source: ABdhPJxT2XgWSSNcJhtRvtaK5QhQN+dRP6+Hs5AueHz+wAYQXMVba/vhkPX1D/pQA+9MZTDsLhZnVQ==
X-Received: by 2002:a17:906:4313:b0:6b8:b3e5:a46 with SMTP id j19-20020a170906431300b006b8b3e50a46mr26605032ejm.417.1649616213825;
        Sun, 10 Apr 2022 11:43:33 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906144200b006ceb8723de9sm11023704ejc.120.2022.04.10.11.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 11:43:33 -0700 (PDT)
Message-ID: <d69346e0-77a0-13da-77b6-b343cfadd5c6@linaro.org>
Date:   Sun, 10 Apr 2022 20:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND PATCH 1/2] media: dt-bindings: imx412: Add regulator
 descriptions
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220410163553.3501938-1-bryan.odonoghue@linaro.org>
 <20220410163553.3501938-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220410163553.3501938-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/04/2022 18:35, Bryan O'Donoghue wrote:
> The imx412 like many I2C camera sensors has three voltage rails which
> depending on platform may be necessary to switch power onto directly.
> 
> Add in as optional rails so as not to break anything for existing users.

Thank you for your patch. There is something to discuss/improve.

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx412.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index afcf70947f7e..16869a91ec9a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -32,6 +32,18 @@ properties:
>      description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
>      maxItems: 1
>  
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as interface power supply.
>

You could shorten this to "interface power supply", because other parts
of the sentence do not describe the hardware more detailed. Similarly in
other properties. An any case, looks good:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

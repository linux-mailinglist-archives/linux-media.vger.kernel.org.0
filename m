Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1E76B6874
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 17:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjCLQ4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 12:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjCLQ4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 12:56:50 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6013E0BE
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 09:56:48 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y4so10249030edo.2
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678640207;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7g0DCnGDTj3XIsCUVqLsYdNl/AsohI4IyO7cVpS0dfg=;
        b=ZdCevFxSiD7eKJA+zroJkHOLGMt+MreCkHpi2nCRQD80k2/Uo4AtuhTfUpJSb44qFx
         GwgT4NgyOdVVvK+8JJXmNl1T66ZFnKd9874+K14MjghGd+tXV92pxodb2eNiWdVsjzGu
         51ifKYNWhQ5TrPSj19y/6UJj5qbbgktpB4xDccRJ8oudLfrxNRkxB/61vLORgY/rWYdn
         vL1VIFIviSMjJiejKvt6ah/W4WVgpR/WYoTDqcHg6pmo5F8yTjLkMklGWFJiLdjzfo6B
         FihIwLbvxlSI9wqGXH35sFCQVFnfxtn6GDUmeZMFAHj796fVYLnA2DEyqbEoQ/vAGbqZ
         f/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640207;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g0DCnGDTj3XIsCUVqLsYdNl/AsohI4IyO7cVpS0dfg=;
        b=w4gaLxJ7oUFo4ss/Jo5FGSYR1+ZGKGa4jFQ4i1XwRukeLq4HLYx+uPUYeqbbVLM8p+
         bcemHOepj3DgMXtkETBXERbaO6vD9W5VVNq6g1z59bpOY0G7ru8DrN0ZvLckac/I5DRG
         0TXiFPTGgdwvYpnv8EURrZnIHJq9KsG1Jyzro2WIbNruiJGaTcXhocar+CnfFMP8pHVq
         coDwbAFv+cOGPkPP2PCFqhaxN6PxQvuTZaccFlMhvqCS2fVXOf0dxdGOkLblAd7dGmjC
         Fmb75H9+8JGEviP01fAZ6LgRM5B/0ON59ZGqGHdyiXYIfE6pDy1mv9QATvYiqwjcvXbp
         r8/Q==
X-Gm-Message-State: AO0yUKVfzRgCU832ElUm9eswyLOgH4PIk79an1G30ZcBvUL3r56FTzUE
        7NlE+D6sqEUoCXafGOoJ8hSJ7Q==
X-Google-Smtp-Source: AK7set9YP8zzueSRIXoGFwVW7UyjerTWJeAwPyW6pmXb9g06Ogcg0OC4ZXoZ3B1cPpsLgUYgixszcw==
X-Received: by 2002:a17:907:7e8a:b0:908:7fed:f0f with SMTP id qb10-20020a1709077e8a00b009087fed0f0fmr38272622ejc.42.1678640206801;
        Sun, 12 Mar 2023 09:56:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id ds2-20020a170907724200b0091f5e98abd5sm2270972ejc.133.2023.03.12.09.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 09:56:46 -0700 (PDT)
Message-ID: <d4b466f2-2d36-2aee-39a7-107976495508@linaro.org>
Date:   Sun, 12 Mar 2023 17:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom,venus: cleanup
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
Cc:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/12/2022 15:40, Krzysztof Kozlowski wrote:
> Cleanup the Qualcomm SoC Venus bindings:
>  - Drop unneeded blank lines and quotes,
>  - Fix indentation in example to 4-space (to match DT schema bindings
>    style),
>  - Add SoC name in each title.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    |  51 ++++----
>  .../bindings/media/qcom,msm8996-venus.yaml    | 103 ++++++++---------
>  .../bindings/media/qcom,sc7180-venus.yaml     |  61 +++++-----
>  .../bindings/media/qcom,sc7280-venus.yaml     |  93 ++++++++-------
>  .../bindings/media/qcom,sdm660-venus.yaml     | 109 +++++++++---------
>  .../bindings/media/qcom,sdm845-venus-v2.yaml  |  71 ++++++------
>  .../bindings/media/qcom,sdm845-venus.yaml     |  69 ++++++-----
>  .../bindings/media/qcom,sm8250-venus.yaml     |  83 +++++++------
>  8 files changed, 316 insertions(+), 324 deletions(-)

Mauro,

Any comments on these? Do you plan to take them? It has been a while...


Best regards,
Krzysztof


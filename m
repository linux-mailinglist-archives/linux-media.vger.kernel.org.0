Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763956F5413
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 11:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjECJMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 05:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjECJMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 05:12:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AEB5592
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 02:12:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso48707215e9.2
        for <linux-media@vger.kernel.org>; Wed, 03 May 2023 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683105127; x=1685697127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m0X3zVggkEphepgmpFfHgY9ZYh+yfpZHJged2HFiWeU=;
        b=Fa3lXEiRtHvYcsTwrgnRVWSehxxRIi/uRLgKkYn2ouBFsrglKwEcNs1Z4rVjg3KWIb
         /vaIjF4qaKw+IckLnTWcAJDa1FZ//0/GbLurdHaCvKbnzRWoqLL/u3MhO5Tz81Tomthk
         ckfZ38rQ3VjZxg/sTpi1VcvHg2q8QrpxriF7KMiLcmjBwgJFOcAlhVjOpjheBK0PZruA
         IHT8zSc6elHai/AmTfGznFFh15w8nzMPMJvpYP4ZBzcrAv/YGHkA1e3AEFuppld45pFV
         bUKerQ3oA9rnTQaIrK865aZB0piyuRPBsjtiOcfPKmWMQ9wQhr77Dk6fD7S0qu0Zdogq
         +6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105127; x=1685697127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0X3zVggkEphepgmpFfHgY9ZYh+yfpZHJged2HFiWeU=;
        b=TPTdad4ekJovbngD5sXSjfyM1Ny2SRnappM5LLt1SRR5hN5MIZRF9qqLeARvPJnoHX
         D7+NayjYUoOvuZP/weAYQ//Ury8rxGv7kic64y6InalxA+cRRR7L2v5JndbalvVTuoS/
         G0FyD1ztvdvyHdN3B0ljjdCRUjDbuFgZKZn/IpYYoOerb4apsDFcJSaoxxG6pAWTzCXI
         jYck1G/UeZckjcTtD3ECUjvWblRs/F71PluzOuSGUCBb5/TonQpped1udUV9Vc/+DHHp
         LCPjWn2h++AJBfVj7w8+oxDewFlSRCDfEXCKL90Bt8W5rLQ0uh/5VyProCuxaRt6ELbg
         Ceyw==
X-Gm-Message-State: AC+VfDwS1AUzPF8LIVQmTXamkM50GZ8wMuhjC7DkGiAbNYbrApSa4XI5
        0ffz9gV3sK3OoKzr4I+lHFY1EA==
X-Google-Smtp-Source: ACHHUZ5OhbmHe7S6Yn7dufDUvb/uOWhfr8XtiWW7s6/ZU4sMFJsUkPCrcMp7FBh9Fj+SeVEi6djCIw==
X-Received: by 2002:a05:600c:b41:b0:3f1:79ad:f3a8 with SMTP id k1-20020a05600c0b4100b003f179adf3a8mr14533810wmr.16.1683105127222;
        Wed, 03 May 2023 02:12:07 -0700 (PDT)
Received: from [197.55.55.58] ([93.107.151.186])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b003f173be2ccfsm54681045wmn.2.2023.05.03.02.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:12:06 -0700 (PDT)
Message-ID: <d1dfb551-6a26-3ea4-69b0-221b9516f44e@linaro.org>
Date:   Wed, 3 May 2023 10:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996: Add CAMSS power domain and
 power-domain-names to CAMSS
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503072543.4837-1-y.oudjana@protonmail.com>
 <20230503072543.4837-3-y.oudjana@protonmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230503072543.4837-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/05/2023 08:25, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add the CAMSS power domain as well as power-domain-names for all CAMSS power domains.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 30f6ebc4bd11..0168a086f57d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2118,7 +2118,9 @@ camss: camss@a00000 {
>   				"vfe0",
>   				"vfe1";
>   			power-domains = <&mmcc VFE0_GDSC>,
> -					<&mmcc VFE1_GDSC>;
> +					<&mmcc VFE1_GDSC>,
> +					<&mmcc CAMSS_GDSC>;
> +			power-domain-names = "vfe0", "vfe1", "camss";
>   			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
>   				<&mmcc CAMSS_ISPIF_AHB_CLK>,
>   				<&mmcc CAMSS_CSI0PHYTIMER_CLK>,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

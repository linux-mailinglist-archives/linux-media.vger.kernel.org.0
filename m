Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B98D6279E9
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 11:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbiKNKEU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 05:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbiKNKED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 05:04:03 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D666C248C6
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:00:26 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so18396608lfv.2
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om+PBi5QEwwlPMu8KStvyUBQe5KWPzLyT83bqqoFbYk=;
        b=mwsQ+wAV14Ed5N3Y/76KiWurCMoqO3U2hlajT1KTe0l7RSeRuOiIBcZysBrr87o6sy
         iQxPaaHugEElA0zsdl6wFL+CIfZfq8juv5gdweOlYROWaiEIsCkU+VXwPwKQNsRUNn6v
         hgXRAgXyptfZpNKZtzwWWjQjTxItAWn3ZKTbOjSqYoB2+w9rtPRZl8Y3NQN4Gi5kUWpd
         gz2zdbEfY80gqGX56A9hXNAWRKtEH8x3D5g0NUX0PyL+BTdM2zWOHRzY9HArQDzc4I6/
         js6tSkzOThgitOHhGDPhhY9V6nouabjS0Sok5wl5Ciz8BjrCm072K6RBr0fGqMGIizCZ
         iC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om+PBi5QEwwlPMu8KStvyUBQe5KWPzLyT83bqqoFbYk=;
        b=q1/9yUSJOEFjIw07Wo6Hzt54mY4mFK6eZEocFVzRypdWcRaBlDp9+87XppzH71wiPw
         D50fZSivWuc+LmblIiDgNgmaP/JrXkzQUmS5Cyr1e0hg7ona6afMgN8TbuUf6mHmi+QX
         br6Gx07w7nmWeXuEBhFvElSwv7pM68vHPAb10ZiJWOhy4ShIJZH0NeVdij9v0EChkO3Q
         9ephDgHebp59UbR4/XzakEddYtW2Y7u21E10fdpBq2uF13o7ZDiNjdFdEQZn8pl1k3co
         73nPoCXf7Gs71uo9ubfLi9TlnTjnundu7oiXYI71OTmlTsDTde9TysuRJjFrMv4jXmz2
         5+lA==
X-Gm-Message-State: ANoB5pmlef25nZrkcn6p/oJXtnfyHPX7mWsmtgfSArmvFiU1F0KVOueH
        b4YA3wEzzeZZm5OaXXd5xu+x8w==
X-Google-Smtp-Source: AA0mqf5X8WiwX00NeKTpQaER/M7DXx4LwcYqJl5nFg2OKUfqTSAyXu379EogVcQC132Qs686CBbFtA==
X-Received: by 2002:a05:6512:3415:b0:4a2:6df5:edb9 with SMTP id i21-20020a056512341500b004a26df5edb9mr4031098lfr.675.1668420020824;
        Mon, 14 Nov 2022 02:00:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a2eb7c7000000b002774e7267a7sm1947161ljo.25.2022.11.14.02.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:00:20 -0800 (PST)
Message-ID: <6fa36a56-05bb-91f3-11e0-261efbe3e629@linaro.org>
Date:   Mon, 14 Nov 2022 11:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: sdm845-db845c: Use okay not ok
 for status
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112172650.127280-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2022 18:26, Bryan O'Donoghue wrote:
> Convert camss status from "ok" to "okay".
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7c88312333c22..ce95b51f17fff 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1182,7 +1182,7 @@ &camss {
>  	vdda-phy-supply = <&vreg_l1a_0p875>;
>  	vdda-pll-supply = <&vreg_l26a_1p2>;
>  
> -	status = "ok";
> +	status = "okay";
>  
>  	ports {
>  		port@0 {
> @@ -1221,7 +1221,7 @@ camera@10 {
>  		avdd-supply = <&cam0_avdd_2v8>;
>  		dvdd-supply = <&cam0_dvdd_1v2>;
>  
> -		status = "ok";
> +		status = "okay";

Drop it instead. Can be same patch.

Best regards,
Krzysztof


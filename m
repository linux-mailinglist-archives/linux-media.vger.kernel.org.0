Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2D562795D
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbiKNJrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236244AbiKNJqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:46:54 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBB11B9F3
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:46:52 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k19so12422096lji.2
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqh3RXsEUvOUN02I+07ykyazO/fDJOuFxHOW6+YjhhI=;
        b=utMZu6rCEApSt3GWGgzeAXvQkX3+Q/n1M2kH0C6GGVtuSS7qwI9Ac9oBQYdkvSQAr0
         O2F087f+lI6HU+xv/6pfEHJMGFJLl1lLSk8hKZxhSaQ/iHy43tH4HtaLgzVPJYVkKEoF
         /z4C8UV73FPL4g7fcLFtADckfVoAkzbnvVLFpt92aVMdOb/HBDwh4DPX9f3/uKgVi9Jl
         NYOhrCKSauE2xK+o07a2Fn/kSpXyq16sf7Xg4HV6CWVge1OFBpG9mhSyIigBJk7cFz2l
         jCkRW7zySDQggD8wJ2IO5Qj2SbfeXOnP36OzCQ47RaxuBn8F/+PGKGh2D/wY5yx+Cl5z
         VgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xqh3RXsEUvOUN02I+07ykyazO/fDJOuFxHOW6+YjhhI=;
        b=ocKme1EB1WEs/6v9WhoaH3OPnhMp+Qifg6r6u2Nnorr+YcGNouqkoaCMbpysVY556L
         hkkbqdyE65G9d8SYjnbygP3wJNa8XpfKXFXcM9MEZbjmExHpukZ9O5anXUjsZ811Re4F
         nMfPtFNerWSl5gsCduvmJYjX7eedItVYTRG8tAg/BTN9bWOkUHHW5vaht0G01a95vbq5
         GFHLdooHNS5F24kZoFHalx6E1ZYrFkl08UeN62aI4E49i/e3oll7bLwDua9k8SfXWucj
         jWi5e6If7CgajNJNW1AmtPy8g05qSLzLQlS/JjVzdFsKVAf1D4r+L8WeetHCsCMdA5Ok
         HE4g==
X-Gm-Message-State: ANoB5plkNkefYSn4IbJN83Yr7NfQf5/AOxjo79Xt9x9rMO51Dmolzhco
        UJJ9zuhQI+HiPfDQgNgpkhKStg==
X-Google-Smtp-Source: AA0mqf7kVqwotthxJFzcwevZLOJIqQjIrmuTQH5oFwkzVjCkC/9yrBfYfW/c659az1hkyGIBHXyaNQ==
X-Received: by 2002:a05:651c:1252:b0:26f:db16:4735 with SMTP id h18-20020a05651c125200b0026fdb164735mr3896499ljh.323.1668419211081;
        Mon, 14 Nov 2022 01:46:51 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id x9-20020a056512078900b004ab2cb8deb5sm1765891lfr.18.2022.11.14.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:46:50 -0800 (PST)
Message-ID: <f23710ba-1d79-c223-93f3-bf201d1b84d7@linaro.org>
Date:   Mon, 14 Nov 2022 10:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sdm845-db845c: Use status
 disabled not disable
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-4-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112172650.127280-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 12/11/2022 18:26, Bryan O'Donoghue wrote:
> Use preferred status "disabled" instead of "disable".
>
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Konrad

>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ce95b51f17fff..5da91c646c200 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1262,7 +1262,7 @@ camera@60 {
>   		vdddo-supply = <&vreg_lvs1a_1p8>;
>   		vdda-supply = <&cam3_avdd_2v8>;
>   
> -		status = "disable";
> +		status = "disabled";
>   
>   		port {
>   			ov7251_ep: endpoint {

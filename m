Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0637F627959
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 10:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbiKNJqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 04:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbiKNJqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 04:46:21 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903711DF22
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:46:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id be13so18358527lfb.4
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ohcFGB+Pojom6Xcuzr0rZKQBxZkeaRKP44kpIv7Kw=;
        b=C6hL6yyNhAZo+LtCl8yTPkBxlm1A0qq6Q0q/DIZMXeAFf0qZmS+YsYIP4x/C+vxtA2
         OIAPg4XC9snYhATWezNHxhpaGGZQohD13+2pVurDoMfywWTJr5ZbMyppy8/fbteL8pEg
         EjJPWRx3dSylcDiQFttW6KxoAvJiPmvM/uP9XCsCt+VYcI7WgxYY9CbwkNB4oLER8udK
         wYI0K7A8YTJzfpYLqGRtsfqjJLSuyrfuhlvuvVdfU/NuJXnfu8hlvRrjYEFnnfZBsfCv
         u8/0O31bdNhy25zPYSI1hhaXH8oUUxOOba1gnZwjnoOEsiCTl9Icq7SCWcWHqYyjnBgN
         f1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6ohcFGB+Pojom6Xcuzr0rZKQBxZkeaRKP44kpIv7Kw=;
        b=6KvoTiawVsqvItTUWIOI0CpMUzhU4wJL8q2iUd24dKnCzsKWuCihaKV1VQzEA2yLDV
         /EdHgEJHR1LJsvsYgfDU6JS1YtfCdafyk2xiIwdBj8xMMSnlqmbDpt1nM95YoNH+Eo7U
         ilhKRXpASFahs3ItTwGEm0VIPMu2S4Shptma8LRfzyuajXeUfFYFbTGTIh+1l+gOahca
         topVeQmTQy9myAmSEcj8Z+cg284B6QClHKYAckPzolYVnzZdyXV6xW7PF90iFzpqhvqr
         0Mdg4PltMWGrdi86BHa3j+WqTWjPwLhyYkUY2xGYtXSUa7ECuGbqvXJbQkuMJbykxCp6
         pnNw==
X-Gm-Message-State: ANoB5plMaT+5njUfxOepjE9IBbReFBUTeV3pmwLXfQxF4TlHOaNUlwrl
        f41a415VKimouxwQ5XQuBS4++Q==
X-Google-Smtp-Source: AA0mqf5ce6HshftRPd+qnuurH8x32G0jreHABqEWcOG/p9yaRfDmqOXe/VDZdrnn4T9SC22xnRvmSA==
X-Received: by 2002:ac2:442d:0:b0:4b1:e3ec:d99d with SMTP id w13-20020ac2442d000000b004b1e3ecd99dmr3711010lfl.95.1668419178962;
        Mon, 14 Nov 2022 01:46:18 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id p6-20020a056512138600b004a05767bc07sm1757473lfa.28.2022.11.14.01.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:46:18 -0800 (PST)
Message-ID: <33fafa0d-7d1d-7377-5ef0-8b60390dd30e@linaro.org>
Date:   Mon, 14 Nov 2022 10:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: sdm845-db845c: Use okay not ok
 for status
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
 <20221112172650.127280-3-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221112172650.127280-3-bryan.odonoghue@linaro.org>
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
> Convert camss status from "ok" to "okay".
>
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Konrad

>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7c88312333c22..ce95b51f17fff 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1182,7 +1182,7 @@ &camss {
>   	vdda-phy-supply = <&vreg_l1a_0p875>;
>   	vdda-pll-supply = <&vreg_l26a_1p2>;
>   
> -	status = "ok";
> +	status = "okay";
>   
>   	ports {
>   		port@0 {
> @@ -1221,7 +1221,7 @@ camera@10 {
>   		avdd-supply = <&cam0_avdd_2v8>;
>   		dvdd-supply = <&cam0_dvdd_1v2>;
>   
> -		status = "ok";
> +		status = "okay";
>   
>   		port {
>   			ov8856_ep: endpoint {

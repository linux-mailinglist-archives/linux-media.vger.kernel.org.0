Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C513462C539
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239102AbiKPQqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239109AbiKPQpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:45:41 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B5BCD3
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:41:24 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s5so11198525edc.12
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfEqfWb4S4QQRZovl4owq6EOl4TWjyh9fFDZbiC99/k=;
        b=VH2BUl96aKSFaXzH4xkmIQMjktn7QQDQPTSGmky2rdvjv2Ii+lLodTr/zgN9Cdaf93
         GjAPFo1C64Akyx9RmMZnle8C5GK9MxOru48gGlvH79LsllgYBKqiErCxZL9aoVzhZoK4
         QTIVVYaAoXj6QOIGqTxGsr7f1Fy2HKh3T3jli8UtgCQV79pvVqIedCwv4s9HsZ7mvOOQ
         oS7Jc+ZVbiZOgjBYMq6M+Vm+mwtJbEtmtR6S7MZgWinI8VCdH+58MtA/azawQLHTjWa8
         kiIXAStpY55pC9n4lAIycCiOkzWdMtdc0WmMuoTNYUiuGasEY11FA6ygD1nb99UjcPae
         UkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qfEqfWb4S4QQRZovl4owq6EOl4TWjyh9fFDZbiC99/k=;
        b=YLQMzEqNG34yzZwPHnv2FWt3CXYCr3WdUPA18CYo1NvGozglTfOQz5TLt9xZlh+kkG
         p2lFx+C/1qCQxXI7oKOjwuPIJzozbjEZN1vOmJs0E2HmkPha9cBAoNQYcbZyPYaeDCE8
         IkGUhTU0ZaDeuqwFfC2z0cOFEr0nVe+1Bm+myNebXMYC53eoTLzcnuH54DC4FGadfmfs
         YHGLJo8EcAzUdRBmqny6TLObsHWig+N4noPknSwlrDr26/qyU0QVa7C0XpN/dotlw4fU
         a5rE6f8pIki61Mhf2Fe7cFLge2lX7AmYN+IyS6TVPVPDC7IZBj3m6o6IPyuLiM4Kykb3
         Jzxg==
X-Gm-Message-State: ANoB5plWIaE/0FMtcnuJbHyNv8V6BhOVyCiOCw6Z02vZ5xZQHgGRwkyy
        bxVbXTZizYLYIohm3Wbq5RUygw==
X-Google-Smtp-Source: AA0mqf5F+cnYkIVG+duzFg5GNkZYks309GT8+62xkuGdPi8Nuj6dV9p+gFPsLXvcgR2HQThjtvh2vA==
X-Received: by 2002:a05:6402:17c2:b0:459:443a:faf4 with SMTP id s2-20020a05640217c200b00459443afaf4mr19867200edy.297.1668616882919;
        Wed, 16 Nov 2022 08:41:22 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id r18-20020a1709061bb200b0077d37a5d401sm7089741ejg.33.2022.11.16.08.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:41:22 -0800 (PST)
Message-ID: <05a9c6b5-0a78-d2c2-8916-5f659ff527a2@linaro.org>
Date:   Wed, 16 Nov 2022 17:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: sm8250: camss: Define ports and
 ports address/size cells
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-7-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116162801.546737-7-bryan.odonoghue@linaro.org>
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



On 16/11/2022 17:28, Bryan O'Donoghue wrote:
> Define the set of possible ports, one for each CSI PHY along with the port
> address and size cells @ the SoC dtsi level.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index d517d6a80bdcb..806aa19ad93ce 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3412,6 +3412,35 @@ camss: camss@ac6a000 {
>   					     "cam_hf_0_mnoc",
>   					     "cam_sf_0_mnoc",
>   					     "cam_sf_icp_mnoc";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +				};
> +			};
>   		};
>   
>   		camcc: clock-controller@ad00000 {

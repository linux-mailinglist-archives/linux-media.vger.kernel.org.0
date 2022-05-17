Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECD852A41D
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 16:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348252AbiEQOCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 10:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348230AbiEQOCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 10:02:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475CB3C702
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 07:02:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so31509785lfg.7
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CQwSm2PuvXfSLnxNme8zs3Uk9oZ+IhRxhCGlk4ycJy0=;
        b=Q5X5Jo3FzsfspuiqLOGZHCgZCd4mrQmvFLKZGsQP2z2Q7Io+RUDBQyVKOSeDDeGDPV
         qVTG8fMs+Mzzh4ILiAb6EZu+kTZFnoVn+SBpOxluL5bi3zs4Nn9Ko48t8q6A1yn0J/u/
         sALmNvpIe2L6dg8SLt+BI9+cP2qiENrUcMLOXBm15vB14YLf401p9JVrrrSpn54F7+NR
         Ge9ddTqk6OJAJaWP8QOlmVJKJV01U5hlNMcDCuLu9rKEPjZqJXYPfbrWJvx4C4db7oZ/
         wvFh1Vgt1e3ZFPqGXoKrfuNqWWsb0+WaTXHuLWXHZ0/W9X51TTEQMBKiRe/StsABjUS9
         FAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CQwSm2PuvXfSLnxNme8zs3Uk9oZ+IhRxhCGlk4ycJy0=;
        b=zfCxA6jFTox/WPgDAzyVjveOJxDEoXKnO5b4LVWvGD8/mYsLIspxKAelsA1Xi1919N
         fRDxJk5aswuR6SEurZZ/838y5rs1HVu/wkDrdV+7sXVpu3yIgu1JVkf0hc5QwKdSWyYk
         u/Ta5NUJfc1oJma6/EoQipCgzCdGKdHl6Kg510zkI13ojCqWmS5DcSPmX89um9YdmyHQ
         KpUe5upXsabWSjJoUay4RdEoZDijpbLIK+Gg51qu9EAB1fexe/OYUlNVAZDuX12s3jFA
         2/1MVdGzlUmch+cDkSQSf8fo+oH+4Ei3i6GRJJPEJTjqnbfu9VBWChFb8Zsm3BMjwBzn
         SUkw==
X-Gm-Message-State: AOAM533/I0PpgoOvv86HaycFnGYGUCcRLH3hSy8pp/3/VU7y9myI9dC0
        QgE5aLYSWYdRuTj/aVKt4IjTmQ==
X-Google-Smtp-Source: ABdhPJyweBhl9pE8z5ss/fr4IZMnmqQ7r2cggKtk4orRrn9prFRQT3z2AljFX7ZsWU8AIClueF+7lA==
X-Received: by 2002:a05:6512:2a92:b0:472:5c09:c1a8 with SMTP id dt18-20020a0565122a9200b004725c09c1a8mr16906494lfb.265.1652796148215;
        Tue, 17 May 2022 07:02:28 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a6-20020ac25e66000000b0047255d21157sm1598796lfr.134.2022.05.17.07.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 07:02:27 -0700 (PDT)
Message-ID: <60219d61-a39c-554f-af71-07cf7e6c40b0@linaro.org>
Date:   Tue, 17 May 2022 16:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 19/20] arm64: dts: fsd: Add MFC related DT enteries
Content-Language: en-US
To:     Smitha T Murthy <smitha.t@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220517125548.14746-1-smitha.t@samsung.com>
 <CGME20220517125656epcas5p1cc1296b200ff8801f24243aa47de8fe1@epcas5p1.samsung.com>
 <20220517125548.14746-20-smitha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517125548.14746-20-smitha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2022 14:55, Smitha T Murthy wrote:
> Add MFC DT node and reserve memory node for MFC usage.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smitha.t@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  8 ++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 22 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 5af560c1b5e6..36f6b013ce99 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -37,3 +37,11 @@
>  &serial_0 {
>  	status = "okay";
>  };
> +
> +&clock_mfc {
> +	status = "okay";
> +};
> +
> +&mfc_0 {
> +	status = "okay";
> +};

Labels are ordered by name.

> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
> index 9a652abcbcac..434ae75421d8 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -249,6 +249,18 @@
>  		#clock-cells = <0>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		mfc_left: region@84000000 {
> +			compatible = "shared-dma-pool";
> +			no-map;
> +			reg = <0 0x84000000 0 0x8000000>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
> @@ -748,6 +760,16 @@
>  			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
>  			clock-names = "fin_pll", "mct";
>  		};
> +
> +		mfc_0: mfc0@12880000 {

Generic node names, so mfc.

> +			compatible = "samsung,mfc-v12";
> +			reg = <0x0 0x12880000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "mfc";
> +			clocks = <&clock_mfc MFC_MFC_IPCLKPORT_ACLK>;
> +			memory-region = <&mfc_left>;
> +			status = "disabled";

Why exactly this is disabled? Usually we disable nodes which needs
resources from the boards, but this is not the case here. Unless it is?

> +		};
>  	};
>  };
>  


Best regards,
Krzysztof

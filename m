Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C7D6279F7
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 11:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237082AbiKNKFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 05:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbiKNKEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 05:04:45 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3902512A83
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:02:02 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u2so12454267ljl.3
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05spzSRRyT7OBmRrIwDf0/+WSIqvccuv7vWNFes/4GY=;
        b=GBhEkgO/CksLYuQtXrGNAwV45QtTyfzMYGEogTVR6ldZnTavtPSIvQQ4KbKhygxtyZ
         0DL4S5S3hyJcVMg7jb5QPAwn0hpIO5YFhKuaJoajVFg/Iu4uHCxvD3DbqUwP3vrznQQu
         m27Z5Vz2l2weC9N9uaOKsoZ+lz1O2BKhnSeow4JhXsdyKFyPPsIaen7/Rdd/uyqorPEv
         tI9mxTTYazMPg2NEe71leenK0cKul64cdfgBmSOklewcEB3EV01U4qrW5ElFbFmVyWo8
         m5ArLfuGYMhwILZzAnrjCpcbugV6JkTr2VcAd98JVnYIYr0IgMCMHLiHDtZ9bVQsUJmf
         DdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05spzSRRyT7OBmRrIwDf0/+WSIqvccuv7vWNFes/4GY=;
        b=m7vRTJ1hHWU6TUm/PL1XYki2d3x3JfseOaifNqOCVg3au4kAVdo8izVe9RfgMTd9Oc
         CCJaqtCNNdkGdKouwIj8xwnXqzxJ5EHwji2FApV9CToc1q+UetKjZtpGzkJW4hq99KMz
         lfbjkIfZK7Q+gy+PtV4oZ3k70+88zul4E13PnQoBHEiBm5qshy+EOAcusNoT1iS2JEIa
         pyuVmh5kCsFYuj6qzAGkorVUkhm1J+aIwKPwhXwDY2B9T6gW5uZnlOpp5HDNRa9Kfsyv
         OnIGYo/uY8SwSmgXxw9vi9/d8YdxigY4FpCiJDf1D0dKnjfhsMbivDrGrKuPjXBXf4fK
         Ms+A==
X-Gm-Message-State: ANoB5plbs0HuA3wmYZNu8n1qUvznZTuWSoSCTpadHYUDqLy1fqjHhijY
        ugU4LV6i3WGWs4lp0w6FwvrDpw==
X-Google-Smtp-Source: AA0mqf5Qs6cTvSYQPrmie5ihp8vrq8lxtwvWGp4+ZEpoM+OoUmCnVSnexG9QP22L6rIy5lvJjFulkg==
X-Received: by 2002:a2e:98d0:0:b0:277:3984:324f with SMTP id s16-20020a2e98d0000000b002773984324fmr3563127ljj.424.1668420121300;
        Mon, 14 Nov 2022 02:02:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651210cb00b004a1e592837esm1763797lfg.140.2022.11.14.02.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:02:00 -0800 (PST)
Message-ID: <95636144-871a-be0a-e15d-b6714db97e43@linaro.org>
Date:   Mon, 14 Nov 2022 11:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
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
        devicetree@vger.kernel.org
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112172650.127280-5-bryan.odonoghue@linaro.org>
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
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  99 ----------------
>  3 files changed, 108 insertions(+), 99 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d534888bcfe52..70ce09bc63a33 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -131,6 +131,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> new file mode 100644
> index 0000000000000..7bd0a15c72657
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022, Linaro Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sdm845-db845c.dts"
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l1a_0p875>;
> +	vdda-pll-supply = <&vreg_l26a_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			reg = <0>;
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&ov8856_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci_i2c0 {
> +	camera@10 {
> +		compatible = "ovti,ov8856";
> +		reg = <0x10>;
> +
> +		/* CAM0_RST_N */
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam0_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> +		clock-names = "xvclk";
> +		clock-frequency = <19200000>;
> +
> +		/*
> +		 * The &vreg_s4a_1p8 trace is powered on as a,
> +		 * so it is represented by a fixed regulator.
> +		 *
> +		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
> +		 * both have to be enabled through the power management
> +		 * gpios.
> +		 */
> +		dovdd-supply = <&vreg_lvs1a_1p8>;
> +		avdd-supply = <&cam0_avdd_2v8>;
> +		dvdd-supply = <&cam0_dvdd_1v2>;
> +
> +		status = "okay";

Drop it.

Best regards,
Krzysztof


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C3B6279E8
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 11:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbiKNKEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 05:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237052AbiKNKDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 05:03:49 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C509D240B5
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:00:16 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l8so12425893ljh.13
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTF/lKGIlNvJ5JKo1MaDuAhO5E3597vV7o1H0BtcntA=;
        b=vSkZuEcwcZgG8bif5Ls9RqexdcOd01YzG+1/3MCKLluKmmlPCcMI0mrmoNnz4GPYh3
         aynrNVghpAbS0dH51C5xOw5mtu94qOa6e2yXkgzf+bI6fefpOBuC2hzC9lBcRqxl27tS
         6Pj9g8v7nwwRGn7rbAM7lXTXvTF2X4SzHFt9woR2K7sV26n/N1aFmg2dILPpqPCRAxKn
         4h0agnAW6+nfoz9lCXYaknjj/XgF8urLLyLJ6UcCKvq1CQ5Kn9X829E+ySBvUbk5VYTt
         v/gGmmgQgPosTYCdBsZW5UExTPpBZBKVpSgvsX/QbkwEyRmA1DWyclW6FyackBN2V+6y
         SUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gTF/lKGIlNvJ5JKo1MaDuAhO5E3597vV7o1H0BtcntA=;
        b=uHqjOGYVc1osWhB/AKqROWVX/09NZUHtV+wzhG5WJMEm0YZ3fS8rGtUdIW8M0IZMuc
         Tn5AB/6TSHANFvYLuQ32Dt0iuxrv5Kp4RFzGC8nerPemjanXeT5rp0iuAGqVFFY5Aewn
         1QZGD0Ja1kRWpu0/CL8vDLgzzJKxmWsg2/5Y37B4wbTaZTIwhWEo7i3UTK+YHxjQzpUG
         DqaB0gHzsoZ6Mk+wJx1psQWrO0Ungp3KLoS6CHt1jOKjZFW88b41UyJjfrmKEWV9jGo6
         bY8pnQKtCPoHoqtyaDUpsvPJijEkSVmT9yukPnCSBIZC2G6C6IzXsBBGTS2RL50zMAnb
         /R/w==
X-Gm-Message-State: ANoB5pns86hJKzthYMjcqYsg4aCpMnRoQd8qiN46WEpCQIt3jYHSNfG5
        6IHUnyJ60LUZEX2lusHFTvRLUQ==
X-Google-Smtp-Source: AA0mqf6UgXTHRoFqkiILt1hCtPFoZjkqNVjdQKqxyzYG/leNa/gRESGHzXGs43jcW94OVLdB0aARIQ==
X-Received: by 2002:a2e:b8c5:0:b0:277:8144:2eb6 with SMTP id s5-20020a2eb8c5000000b0027781442eb6mr4152040ljp.45.1668420013386;
        Mon, 14 Nov 2022 02:00:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b21-20020a056512071500b00494978b0caesm1752696lfs.276.2022.11.14.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:00:12 -0800 (PST)
Message-ID: <37c8fd73-a35b-a822-0666-38a4ead4eec3@linaro.org>
Date:   Mon, 14 Nov 2022 11:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom:
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
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
 <20221112124126.86815-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112124126.86815-4-bryan.odonoghue@linaro.org>
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

On 12/11/2022 13:41, Bryan O'Donoghue wrote:
> Move the dts data for the rb3 navigation mezzanine into its own dts file.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../sdm845-db845c-navigation-mezzanine.dts    | 109 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 ----------------
>  3 files changed, 110 insertions(+), 101 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cd88efa19e750..5eadd251a0a16 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> new file mode 100644
> index 0000000000000..0862ca30c8963
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
> @@ -0,0 +1,109 @@
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
> +	status = "ok";

These are "okay".

> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
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
> +		status = "ok";

drop

> +
> +		port {
> +			ov8856_ep: endpoint {
> +				link-frequencies = /bits/ 64
> +					<360000000 180000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci_i2c1 {
> +	camera@60 {
> +		compatible = "ovti,ov7251";
> +
> +		/* I2C address as per ov7251.txt linux documentation */
> +		reg = <0x60>;
> +
> +		/* CAM3_RST_N */
> +		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam3_default>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
> +		clock-names = "xclk";
> +		clock-frequency = <24000000>;
> +
> +		/*
> +		 * The &vreg_s4a_1p8 trace always powered on.
> +		 *
> +		 * The 2.8V vdda-supply regulator is enabled when the
> +		 * vreg_s4a_1p8 trace is pulled high.
> +		 * It too is represented by a fixed regulator.
> +		 *
> +		 * No 1.2V vddd-supply regulator is used.
> +		 */
> +		vdddo-supply = <&vreg_lvs1a_1p8>;
> +		vdda-supply = <&cam3_avdd_2v8>;
> +
> +		status = "disable";
> +
> +		port {
> +			ov7251_ep: endpoint {
> +				data-lanes = <0 1>;
> +/*				remote-endpoint = <&csiphy3_ep>; */


Best regards,
Krzysztof


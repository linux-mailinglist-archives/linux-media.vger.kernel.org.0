Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5511A320CAD
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 19:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhBUSkF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 13:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhBUSkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 13:40:04 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B16FC06178A
        for <linux-media@vger.kernel.org>; Sun, 21 Feb 2021 10:39:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u4so51804094ljh.6
        for <linux-media@vger.kernel.org>; Sun, 21 Feb 2021 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5I3tMMTBMyjB/2CdlpmtYbbra5FZ++dhXNjXHnm0pkc=;
        b=NPxuhy9ewQtSl+JUt7hx4Vt61oDQN8ny87nxySsXBD7XDdR/Glar5huLBBvO/2p6Mq
         O+IzvO7vbKIrxvnjPZjYwffSP8gCyVoo/gjXZcglmzIG8CCILwD+wnsG87b4mG6toALR
         W999ksjJ0ai9oO+2Yw77nIHqoedqcoHwdnpstg77Fx4h35ibtuH5U8ClfjO4wt0/O2Ir
         MaMKOGRZA+LkpjStWxGb9gtAPUjb8GrDpbcqO6Y3XzDFXsGoCAMSm0KkpIdIBzz6rI7m
         4Jv0/tRpsfyCKOcWhPxGxcfB1Lgevf6j1+fFTugMJvzitd2k0lt0AQNT3u+zV0l8EBA3
         +sMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5I3tMMTBMyjB/2CdlpmtYbbra5FZ++dhXNjXHnm0pkc=;
        b=ez+Qhl0yAZe95nMxgX2wB9H+5RF5jf3qq7GSUV2zAw62sBdjnGScAFsSej4g4XDq5Q
         MuR4BDrEqgYa/mszza64alKb45EzktXcE+C2x+IGDIV0Ni/DuIKq4B2aby9vXZjpUBqJ
         wvU52m4hBMGODAyFnzqjvJYV57eUYP5SfNk9G+mLHmgafNKRJ8RZ0fEVJMs/nQlfnoO3
         +Sj+Gz1tZ7C0AUsyI9jAtyMwJxT/qVu0ULmwi/nA+d5vr/dkyt1Tr33haSeknK5FKxFi
         xMYTPLlg1I4Llbn3scSUgrI0OaWrUatEpgDQIuQO+677ImR1kyY92wEbJPuRmZETnn1O
         50dw==
X-Gm-Message-State: AOAM531TWCfLiRSRxxdz16PDxhdk6D1dhuF75w/EMeuT5lxrE0jqKOef
        jvyVMAUACtAz99DuWqQ1wU9TIQ==
X-Google-Smtp-Source: ABdhPJzyPK/Lok31uLcddeKKE6KehkSGm/6qNIlTxjr1qm/9OxPMa8LN0bFwvO3Tz1eYRkcLnPRovg==
X-Received: by 2002:a05:6512:36c9:: with SMTP id e9mr3644403lfs.343.1613932762637;
        Sun, 21 Feb 2021 10:39:22 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id y13sm706921ljd.6.2021.02.21.10.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 10:39:22 -0800 (PST)
Subject: Re: [PATCH v5 20/22] arm64: dts: sdm845: Add CAMSS ISP node
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-21-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <9b8f9394-3ab6-3a2f-32cf-4e60012be2d8@linaro.org>
Date:   Sun, 21 Feb 2021 21:39:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-21-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Thank you for your patch!

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 17.02.2021 14:21, Robert Foss wrote:
> Add the camss dt node for sdm845.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 135 +++++++++++++++++++++++++++
>   1 file changed, 135 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index bcf888381f14..4fe93c69908a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3911,6 +3911,141 @@ videocc: clock-controller@ab00000 {
>   			#reset-cells = <1>;
>   		};
>   
> +		camss: camss@a00000 {
> +			compatible = "qcom,sdm845-camss";
> +
> +			reg = <0 0xacb3000 0 0x1000>,
> +				<0 0xacba000 0 0x1000>,
> +				<0 0xacc8000 0 0x1000>,
> +				<0 0xac65000 0 0x1000>,
> +				<0 0xac66000 0 0x1000>,
> +				<0 0xac67000 0 0x1000>,
> +				<0 0xac68000 0 0x1000>,
> +				<0 0xacaf000 0 0x4000>,
> +				<0 0xacb6000 0 0x4000>,
> +				<0 0xacc4000 0 0x4000>;
> +			reg-names = "csid0",
> +				"csid1",
> +				"csid2",
> +				"csiphy0",
> +				"csiphy1",
> +				"csiphy2",
> +				"csiphy3",
> +				"vfe0",
> +				"vfe1",
> +				"vfe_lite";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "csid0",
> +				"csid1",
> +				"csid2",
> +				"csiphy0",
> +				"csiphy1",
> +				"csiphy2",
> +				"csiphy3",
> +				"vfe0",
> +				"vfe1",
> +				"vfe_lite";
> +
> +			power-domains = <&clock_camcc IFE_0_GDSC>,
> +				<&clock_camcc IFE_1_GDSC>,
> +				<&clock_camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				<&clock_camcc CAM_CC_CPAS_AHB_CLK>,
> +				<&clock_camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				<&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
> +				<&clock_camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> +				<&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
> +				<&clock_camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> +				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				<&clock_camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
> +				<&clock_camcc CAM_CC_CSIPHY0_CLK>,
> +				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				<&clock_camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> +				<&clock_camcc CAM_CC_CSIPHY1_CLK>,
> +				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				<&clock_camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> +				<&clock_camcc CAM_CC_CSIPHY2_CLK>,
> +				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				<&clock_camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> +				<&clock_camcc CAM_CC_CSIPHY3_CLK>,
> +				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				<&clock_camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
> +				<&gcc GCC_CAMERA_AHB_CLK>,
> +				<&gcc GCC_CAMERA_AXI_CLK>,
> +				<&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				<&clock_camcc CAM_CC_SOC_AHB_CLK>,
> +				<&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
> +				<&clock_camcc CAM_CC_IFE_0_CLK>,
> +				<&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				<&clock_camcc CAM_CC_IFE_0_CLK_SRC>,
> +				<&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
> +				<&clock_camcc CAM_CC_IFE_1_CLK>,
> +				<&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				<&clock_camcc CAM_CC_IFE_1_CLK_SRC>,
> +				<&clock_camcc CAM_CC_IFE_LITE_CLK>,
> +				<&clock_camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				<&clock_camcc CAM_CC_IFE_LITE_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				"cpas_ahb",
> +				"cphy_rx_src",
> +				"csi0",
> +				"csi0_src",
> +				"csi1",
> +				"csi1_src",
> +				"csi2",
> +				"csi2_src",
> +				"csiphy0",
> +				"csiphy0_timer",
> +				"csiphy0_timer_src",
> +				"csiphy1",
> +				"csiphy1_timer",
> +				"csiphy1_timer_src",
> +				"csiphy2",
> +				"csiphy2_timer",
> +				"csiphy2_timer_src",
> +				"csiphy3",
> +				"csiphy3_timer",
> +				"csiphy3_timer_src",
> +				"gcc_camera_ahb",
> +				"gcc_camera_axi",
> +				"slow_ahb_src",
> +				"soc_ahb",
> +				"vfe0_axi",
> +				"vfe0",
> +				"vfe0_cphy_rx",
> +				"vfe0_src",
> +				"vfe1_axi",
> +				"vfe1",
> +				"vfe1_cphy_rx",
> +				"vfe1_src",
> +				"vfe_lite",
> +				"vfe_lite_cphy_rx",
> +				"vfe_lite_src";
> +
> +			iommus = <&apps_smmu 0x0808 0x0>,
> +				 <&apps_smmu 0x0810 0x8>,
> +				 <&apps_smmu 0x0c08 0x0>,
> +				 <&apps_smmu 0x0c10 0x8>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		cci: cci@ac4a000 {
>   			compatible = "qcom,sdm845-cci";
>   			#address-cells = <1>;
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E36A7132821
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgAGNwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 08:52:49 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41735 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGNws (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 08:52:48 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so50384254eds.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 05:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bG+/1PcaYqZQBXDRaZsbBfE0HShIPerq3LuqbmfLMrM=;
        b=KoYkzOsRd1NBtQrZUhWDsTYrUj7e88YP8/eHmxy63i6qlc/jG8PaeBTLdPNAeo4xG1
         N/IhU1MyR4lRBtgTJbou2o+AsCBxkpPLYr5VWRQpAHIeWGQVsIdfrsMvx4gdD5Yhgd9L
         d27/jwKLoX6843jUsKgh2hgAkYXpkoMBvQOnSVJzhT2+eLPmrw0OHJxwne0jfcw9CLkF
         Gs22qZ1iEHfqKZqt31NqssUp/tvRJGi8G9650dr+fIcHZbuclPaCsqUGdOLBzyC7Ij1+
         Jroe3z6qKgu/MadWgt7dD/5bMDaqotfm/2RIY29/BLk7wC9lz3E9o0JKW+Gwz5FMPdyH
         wvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bG+/1PcaYqZQBXDRaZsbBfE0HShIPerq3LuqbmfLMrM=;
        b=cqICaPmVYBsjf23HYibm3Ajw5kynRRG9Kx8peu68pO3dmAgAF7tKrtPpMkQIt9a0Dt
         eugxTbAfOvRJBRNDJo3zo5wn6la3BftG0ekPAaVA3f7zG2xsNFMfIM9VajmwVOXtCz47
         aLarRej18FqohI4w/7vQ/JcrmFR55ebRLkp878tNkqKxVCs1mX3aVJqZUFuzKPCW8H2R
         LpJkGZ18A93z28ymOH7OZPrQp+6kp5698JtkDX2L1ROfslNkZ6P1L1IkPoPlkOfGiarb
         HovP8es00trfNvwQHwGJ4ufK/Ychmd0ubc8Q9edn7f3d7vZQ1xM8oEd8tFZCZOQz/kr4
         n1cg==
X-Gm-Message-State: APjAAAVurGOvsbSOZzVMDpgi2Sao4wTxzIPtm44xfDIOW/uvVJEXvzzK
        dOCIQNxyiMWMjPAoW3PQp+I1jw==
X-Google-Smtp-Source: APXvYqw9e1ufgH2PKoKl9+B8lQurlIoa2G1RMu/704C5stL4PV36JciZ4WegbOKIg0O1d1qNJkAUcw==
X-Received: by 2002:a05:6402:17cf:: with SMTP id s15mr111855185edy.189.1578405167119;
        Tue, 07 Jan 2020 05:52:47 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id w10sm7465183eds.69.2020.01.07.05.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 05:52:46 -0800 (PST)
Subject: Re: [PATCH V3 1/4] arm64: dts: sc7180: Add Venus video codec DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <1c1686da-6fd4-ffa5-4118-4e6fe1c7f064@linaro.org>
Date:   Tue, 7 Jan 2020 15:52:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577971501-3732-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/2/20 3:24 PM, Dikshita Agarwal wrote:
> This adds Venus video codec DT node for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..fa849de 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -66,6 +67,11 @@
>  			compatible = "qcom,cmd-db";
>  			no-map;
>  		};
> +
> +		venus_mem: memory@8f600000 {
> +			reg = <0 0x8f600000 0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1043,6 +1049,36 @@
>  			};
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +				"vcodec0_core", "vcodec0_bus";

Please, align this as you made it for clocks.

> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +
> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			video-core0 {

The subnode name isn't correct because we have only one core. Could you
rename it to video-decoder.

> +				compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {

rename to video-encoder

> +				compatible = "venus-encoder";
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> 

-- 
regards,
Stan

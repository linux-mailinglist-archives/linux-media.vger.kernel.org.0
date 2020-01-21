Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F6143CDE
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 13:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgAUMa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 07:30:57 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41879 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgAUMa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 07:30:57 -0500
Received: by mail-ed1-f67.google.com with SMTP id c26so2769624eds.8
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 04:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jNbiAMxqqOj55GSDQKDWmBh++d71tG7ldeLAk9zmd6A=;
        b=UoarV1BVm2Btqxccp5b5Ri5nQVCi4Ed1USfuvenRzygLxhAnESncPto4TO3kZatVli
         QJA3MCg+PyaCkzLmTwafsRywirHdNWFoQxU1wuHF34s95eo+ODIJNmBeU67HHB9UdH4b
         1WJNGQAtjgmvSTg/+Y26fXK2c56Szm+bAp2UvGxtHky9FxucphpRDNM1F4BnTP7mRhbP
         sbsi+STGoHLSUFCC6Z9bfVTtE/tMwSEzGW9UFnrs1V07S6DwMcBEOOS590K0Jaqg6Kwy
         CfeyldwuK79EoSWeqzGv1fQ1qSlfbLqN3ALcxWqca3eywyApnMS82jIPkP0Dl2X9pGwJ
         RhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jNbiAMxqqOj55GSDQKDWmBh++d71tG7ldeLAk9zmd6A=;
        b=BOUTwDIGBwNcdJvfXZALeXfzOx/BpTsF+ZN0mzxtJ4rN/llKeRE2CQmm0LH+gtF1JG
         Yc72MqDwgZbbKYoTlkxhAtfM0prdSMVb75hqJVLtxNZ7uiVlsL1NS2qWAtdncGYoPdvO
         vKlUU0eKJOP6LOcB5N2wRNKrFhctkSpaxYFPKd6fmwEy5HVAZe1D6XffttUJkv8gSEBB
         Ik2AZ+L+HZjuyFd9ROtiUfXZ7Vn8tDuEi4zLE0lBebSIqJAeR/uGAzXBt7CkEB81puTU
         /ivqUOBFVoumAo7dlpMlvaYMVFjbB+I2PF1jpYgsa7SBdSMIxU8kvGd6eyxVi8LrXIeD
         gZBA==
X-Gm-Message-State: APjAAAXQ/Qi+xPStn5wOjxXzoCJsLL2r+PEmElV9QVHyrZKHQrgkhWCw
        Ky121y1acxqIynIFME15u7yfGA==
X-Google-Smtp-Source: APXvYqxOZnZWPEscqDETn75LsvLIexfMmx0NUCw7dFoO8A8E4cUz1jWb7ytPgjienQN4l3NNB7qxjw==
X-Received: by 2002:aa7:da13:: with SMTP id r19mr3580963eds.188.1579609855545;
        Tue, 21 Jan 2020 04:30:55 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id t1sm1277494ejg.32.2020.01.21.04.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 04:30:54 -0800 (PST)
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7180: Add Venus video codec DT node
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <1579006416-11599-2-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <fff8744d-05cf-f7a3-6d1f-78111fd85deb@linaro.org>
Date:   Tue, 21 Jan 2020 14:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579006416-11599-2-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/14/20 2:53 PM, Dikshita Agarwal wrote:
> This adds Venus video codec DT node for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..6ecacca 100644
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
> +				      "vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +
> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
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

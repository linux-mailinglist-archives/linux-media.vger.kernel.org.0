Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042DF12C041
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2019 04:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfL2DS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Dec 2019 22:18:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44507 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfL2DS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Dec 2019 22:18:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id az3so13334358plb.11
        for <linux-media@vger.kernel.org>; Sat, 28 Dec 2019 19:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fJBQZ6q3+2lZpk+M9I6LDvvhdKjGpOfzDinaq2pqIgA=;
        b=pRvRA2I6QSL3plHmxs23DCx7OVMNeFWKizs7qkhPQ4lsfqvJ9VnJBNOV7CFjeRk9vC
         Ii0rFrga8vUWviVzCzkAdP80imrz117TO76H+LH1L8ExqcVdYDI69xSJimqVo6bmdqIk
         oRbQ+Tb3XfeuFpcHvjsb3UycX0ML7/00qbaYgXHjeuglW0z9VvhK9dx0pIe0AGovXH1t
         Bvc5UAppa3Fr8RHqElyi6bMHNPMDu5y0dfjPGV7u3zbE5GoYUjdqXsy3c39SiM5fWmjF
         oeMYAOmDy6cNmvwlzYaVQA68wRx3Js4gCWAoJEbCVEqAyd5cj1hJz370UJZdxGVUloTV
         56BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fJBQZ6q3+2lZpk+M9I6LDvvhdKjGpOfzDinaq2pqIgA=;
        b=U9yJIj40oT08H51Gi34/rHqDq8X2RGej7Vv3ckpQRlsCYpanKo4okqNvVpdL+A/++h
         gJcv00fTPCxAUaqRjAr1tvJRFd1DC22cT2zy0RSeYFh74tdMzo3HZmp9DsqBpL9MGmBb
         pxUvVXTTYOrzSHO06O+jGAXyTqSRW1eQBM0fE2JpKS/E+GWAZoC3yVAMvy+jjUsDYJSo
         o1s15hsNZyGrbgFgpRpb1ybFIyHaEEUFUC54N4AEoFxyzO/fiG87GGnB+kc9HaE8OMsK
         dHuCPfMXf4F8eGgqlLPtKCZn6eV2xuS0S1zlX8NXvr9q6ZkMAWeB5iwXYBjBvl+1Hsm6
         vyWg==
X-Gm-Message-State: APjAAAXZ19urftKc+WmMxogYalSZu/Pg2ipQj52Ne0KmaGvU6AlTMyg1
        VeEh1kkz+9X5VLE4q41tWZeMAA==
X-Google-Smtp-Source: APXvYqxPapWvKkYX16lehlOKRxG2uLZL6TiZv9y9GqwIxrLile80wxO9ddaWADvxBHLMzsc5BaLkpg==
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr39105245plk.331.1577589536058;
        Sat, 28 Dec 2019 19:18:56 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u128sm24121926pfu.60.2019.12.28.19.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 19:18:55 -0800 (PST)
Date:   Sat, 28 Dec 2019 19:18:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: Add Venus video codec DT node
Message-ID: <20191229031853.GL3755841@builder>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576828760-13176-2-git-send-email-dikshita@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 19 Dec 23:59 PST 2019, Dikshita Agarwal wrote:

> This adds Venus video codec DT node for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6876aae2..42c70f5 100644
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
> +		venus_mem: memory@8F600000 {
> +			reg = <0 0x8F600000 0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1042,6 +1048,36 @@
>  			};
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,

Should this be aligned with the DT refactoring done for sdm845, where
the GDSC is moved into the *-core subnodes etc?

Regards,
Bjorn

> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				<&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				<&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				<&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +					"vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0C00 0x60>;
> +			memory-region = <&venus_mem>;
> +
> +			video-core0 {
> +					compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {
> +					compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +					iommus = <&apps_smmu 0x0C42 0x0>;
> +			};
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sc7180-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>;
> -- 
> 1.9.1
> 

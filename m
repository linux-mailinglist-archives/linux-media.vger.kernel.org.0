Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6A025431E
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgH0KDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 06:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbgH0KDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 06:03:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E88C061264;
        Thu, 27 Aug 2020 03:03:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a65so4597467wme.5;
        Thu, 27 Aug 2020 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P77OjdgSVrs1pV3ulE59aHFIhH+ydWYh3mBhaqATpgo=;
        b=XMFTr9tVl/x4UBOBhwEoZx9P/wMBMJogiYORKo1QLMt6s8t3aH47qy57Z63cuJy6a7
         hLqcHTD0DG1RsuWnHIdQK/c3Y4YlibYVpb40gHEGnOKRDFuD+xUoHssi3XA7TsukLXZ/
         LHvd6QLcjjRkdkB73PTEtrHvfaTdOZRMsx7ziN1EAHS4DVrbZ0o+Hncc3Ex5V5iXEnYJ
         k8R2OCfUK3sSbuLAtHLadBTiy9QE44ofQIr7GZgnt7BhYD1GPq9vXpywjKovoZJz4ViG
         gEZ4ZMxVJC+7FJdzILHI70OnJfDgICffpskEfHiAOKFdulGf30AYg+jctfR8ViNVJsvn
         qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P77OjdgSVrs1pV3ulE59aHFIhH+ydWYh3mBhaqATpgo=;
        b=RE2vdvU+jqK4rfDTXwDEKmCqYtEKLZ0dgrosA5cwHLspmwrkIM2kgC2VHawNxXhcMP
         Wrk02u/HgovHr6nObjW1L369olwvBGWI52XmkLbtuBcOp7d1aeEm5uf+/jOx5/65PwuK
         XlUkyiVXNXrNQyhbTgUYVJw5W7vxCmle9ti5fnYpiXyVHHJ7UNbWtsTIcqP/A7Go8gHy
         kXlKwxEsiGgnifvgv6Ap2+EML3s4HYc44v73tTByb9adPowFkmjyWOMdUdqLmpZ1XNaa
         U1R1ZFUpgTYJV2yLY1IM9G4QynEuEKm35sKQ9dtnvFpHLgzK4eBdRLJD5XvvlS84+lT6
         KtjA==
X-Gm-Message-State: AOAM531C6x0p/XjBHzjJyHaRLPGrliK30udn0gocHVEUhMkudPwsBIc/
        VeUm58slTaMuC10lrdxO4qtTgOeawKi+NA==
X-Google-Smtp-Source: ABdhPJy0dRPhZCuViCq8m2QlMCz6uEz38kuyN8jKB+CT3sdi+Qn/nenwqTLS4GhPUOGsx0NoxIby1Q==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr10974844wmk.120.1598522631666;
        Thu, 27 Aug 2020 03:03:51 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
        by smtp.gmail.com with ESMTPSA id b131sm4538541wmc.8.2020.08.27.03.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 03:03:50 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
Date:   Thu, 27 Aug 2020 12:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821103608.2310097-10-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 21/08/2020 12:36, Alexandre Courbot wrote:
> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
> the iommu and scp ones, which the encoder depends upon.

Please don't do that. Instead of pulling in other DT nodes, it would be handy to 
get a reference of the series this is based on.

Let me try to hunt them down now :)

Regards,
Matthias

> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
>   3 files changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index ae405bd8f06b..9e77b420eee8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -25,6 +25,16 @@ memory@40000000 {
>   	chosen {
>   		stdout-path = "serial0:921600n8";
>   	};
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &auxadc {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index f0a070535b34..3c763be658da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
>   		regulator-max-microvolt = <3300000>;
>   	};
>   
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
> +
>   	max98357a: codec0 {
>   		compatible = "maxim,max98357a";
>   		sdmode-gpios = <&pio 175 0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 102105871db2..8f77eea6df27 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>   #include <dt-bindings/clock/mt8183-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/memory/mt8183-larb-port.h>
>   #include <dt-bindings/reset-controller/mt8183-resets.h>
>   #include <dt-bindings/phy/phy.h>
>   #include "mt8183-pinfunc.h"
> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> +		iommu: iommu@10205000 {
> +			compatible = "mediatek,mt8183-m4u";
> +			reg = <0 0x10205000 0 0x1000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
> +			#iommu-cells = <1>;
> +		};
> +
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8183-scp";
> +			reg = <0 0x10500000 0 0x80000>,
> +			      <0 0x105c0000 0 0x19080>;
> +			reg-names = "sram", "cfg";
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names = "main";
> +			memory-region = <&scp_mem_reserved>;
> +			status = "disabled";
> +		};
> +
>   		systimer: timer@10017000 {
>   			compatible = "mediatek,mt8183-timer",
>   				     "mediatek,mt6765-timer";
> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		vcodec_enc: vcodec@17020000 {
> +			compatible = "mediatek,mt8183-vcodec-enc";
> +			reg = <0 0x17020000 0 0x1000>;
> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_VENC_REC>,
> +				 <&iommu M4U_PORT_VENC_BSDMA>,
> +				 <&iommu M4U_PORT_VENC_RD_COMV>,
> +				 <&iommu M4U_PORT_VENC_CUR_LUMA>,
> +				 <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> +				 <&iommu M4U_PORT_VENC_REF_LUMA>,
> +				 <&iommu M4U_PORT_VENC_REF_CHROMA>;
> +			mediatek,scp = <&scp>;
> +			clocks = <&vencsys CLK_VENC_VENC>;
> +			clock-names = "MT_CG_VENC";
> +		};
> +
>   		ipu_conn: syscon@19000000 {
>   			compatible = "mediatek,mt8183-ipu_conn", "syscon";
>   			reg = <0 0x19000000 0 0x1000>;
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E7F1AC202
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 15:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894762AbgDPNCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 09:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894629AbgDPNCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 09:02:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00000C061A0C;
        Thu, 16 Apr 2020 06:02:44 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e26so4471148wmk.5;
        Thu, 16 Apr 2020 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DsXbXqSR3WQQ/q3QyWRXNvBRy+VnfDMjqm/TEYscBoU=;
        b=l9OHz4Xu8UUrVETfqDUe78B77QloOSjAuW1zUUPhF6mnjZNyfmYlTZlstQ7DTLMZXx
         QZp/1o3zt7Pyua6lAgb+Fg8JZ+UNuL0xMB0C5Rg4lNWyh/Y0n58k3khWQmgQMgFW10vA
         UZEt/WHoic7XKdFncgmdMdD/ERfOIihkhdAZpnaTfjz7gEfcQKaaIbuGilMxFH/Hmcnq
         2BajeBWSbyY3UWqPnOuAa6ECF+V1+As5iLm580KPCfBt0++Ja+vZt6Yl9Pj6jFpP4SRk
         6EYcyexDlQ2/QiQcgXyU+yM+IM2Z3TOfzzI21YEHupFpmb5JU3l3/cnQBP7SsJaWacdV
         /X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DsXbXqSR3WQQ/q3QyWRXNvBRy+VnfDMjqm/TEYscBoU=;
        b=YjH+W+hL1At2/TEVQLR4Sj2ju5oav+deJEQYTYda1Lc98yx9XzxXF9bbfeTezsQqlQ
         g5+vd4WeS4BXMT2UeZBEruwJEv2LMrPOVG9nDEVNnMY3PnSJLfleyAJtq6HIxJKHBlHx
         VYDUGWm5seF3/b5BO3BV7+yvazpCjzbCVyL+rLE+ySXcLlw17ry8pXBbtC1CsKfnP+Gp
         lQKg6Rj4I61OpX0U2NIReyqpwadaNdZa+Wh49kfG4zR/qv/LD/QskObgooGU7+1AXcIa
         2NBrJqA3K/sr3fvi8pXmWsRu595aHXEJsVcZMK7y8rEwe2z50fVk0sH9yv6dwu2D46y9
         ZPFA==
X-Gm-Message-State: AGi0PuYEpUweRxu+BeDXJ7FWjC8zXEV0UTz9WV+ZbOF91gXTKBhK0dmz
        hzkQUwgW7xon6LyIv/PDT3M=
X-Google-Smtp-Source: APiQypJmGVgOCUB4Bi9u+4yal3fthikSw/VxSVv6cs2uWMvyqqMrS3fjb25iU4fphqExvZQpuidm6Q==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr4806123wmi.110.1587042163757;
        Thu, 16 Apr 2020 06:02:43 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id c18sm26903597wrx.5.2020.04.16.06.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 06:02:42 -0700 (PDT)
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Add RGA support to the PX30
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <478f0a8b-f819-62f4-83b8-27918c4c2431@gmail.com>
Date:   Thu, 16 Apr 2020 15:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416115047.233720-3-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

The conversion of rockchip-rga.txt to rockchip-rga.yaml by myself just
has been approved by robh.
Maybe place dts patches at the end of a patch serie.
Could you include a &rga patch if your device is supported in mainline,
so we can test with:
make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-rga.yaml

Johan

On 4/16/20 1:50 PM, Paul Kocialkowski wrote:
> The PX30 features a RGA block: add the necessary node to support it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index 75908c587511..4bfbee9d4123 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -1104,6 +1104,17 @@ vopl_mmu: iommu@ff470f00 {
>  		status = "disabled";
>  	};
>  
> +	rga: rga@ff480000 {
> +		compatible = "rockchip,px30-rga";
> +		reg = <0x0 0xff480000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
> +		clock-names = "aclk", "hclk", "sclk";
> +		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
> +		reset-names = "core", "axi", "ahb";
> +		power-domains = <&power PX30_PD_VO>;

		status = "disabled";

> +	};
> +
>  	qos_gmac: qos@ff518000 {
>  		compatible = "syscon";
>  		reg = <0x0 0xff518000 0x0 0x20>;
> 


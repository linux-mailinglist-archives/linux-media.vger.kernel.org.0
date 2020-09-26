Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6D6279944
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 15:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgIZNAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 09:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIZNAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3D6C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:00:08 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so6867263wrs.5
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4qdU5lafYi+hcVoRAvstZheKhqCYZ5Ckd1gUvUE1rzc=;
        b=a8tHbMaqB+v22Lv/kLM3g3AksGk0fdsVfKBnfPt4UWgrcsqPBoVo4ZT1FsDE/lmAi9
         3jlQWknciPpbAcVrBeSwTGb1NbaKP3b/uqTYcjGSC7r1XEc85wfqNnuoTZUSOK4mer2b
         JzaniKOXgUp4A1mHhPumcaGqDJqTgyG77h7l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4qdU5lafYi+hcVoRAvstZheKhqCYZ5Ckd1gUvUE1rzc=;
        b=UHW3YGSI/XYTcmvdOoZ69X531oCQsIHviLb7q9jQTNswq+EkcBqoW3IqjL4D/o8uFo
         fTqrbWaBxdv9Ng//HTYqgijDZRG/krTqZv2k+Pf3kxqYBgY3aifzv1Tkdl+HQx1r9N+N
         1O9S224/QuSGyshalh/60CnH63GkxCxdMrD7mlz2Mk43RjOUsylkvaduVy2k65kErpoI
         cLf9VvzxuUcYRSUYFJismtV7UJR6KyiyKEiALfX508BngoOWEbjGBuf9XTnlyTcyyzHq
         xR+2LrCzPwlLWxj7/R+xQE4tInz3vtMz8TXhQdkSM4zUWQ5QgUk42JnJQej/mWO1nUfp
         iezg==
X-Gm-Message-State: AOAM530p2jH4GxV69IzHoDefDnKgBHeAhpyWFbMjjXb/kKifYfrxjEEk
        W3TUWwU3hqDBiwBtSfoNgKoDbg==
X-Google-Smtp-Source: ABdhPJwnQFrsiZDsceVMa/OZGRYeitM4Z0qYBnUmfRNKn4bmhYo6FC4ZmxJTPdc3V0yS8KdYKve8gg==
X-Received: by 2002:adf:f802:: with SMTP id s2mr9115823wrp.328.1601125207121;
        Sat, 26 Sep 2020 06:00:07 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id e1sm6740101wrp.49.2020.09.26.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:06 -0700 (PDT)
Date:   Sat, 26 Sep 2020 13:00:05 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, robh+dt@kernel.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: Re: [PATCH v5 8/9] arm64: dts: rockchip: add isp0 node for rk3399
Message-ID: <20200926130005.GC3781977@chromium.org>
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-9-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722155533.252844-9-helen.koike@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Wed, Jul 22, 2020 at 12:55:32PM -0300, Helen Koike wrote:
> From: Shunqian Zheng <zhengsq@rock-chips.com>
> 
> RK3399 has two ISPs, but only isp0 was tested.
> Add isp0 node in rk3399 dtsi
> 
> Verified with:
> make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> 
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> V4:
> - update clock names
> 
> V3:
> - clean up clocks
> 
> V2:
> - re-order power-domains property
> 
> V1:
> This patch was originally part of this patchset:
> 
>     https://patchwork.kernel.org/patch/10267431/
> 
> The only difference is:
> - add phy properties
> - add ports
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index dba9641947a3a..ed8ba75dbbce8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1721,6 +1721,31 @@ vopb_mmu: iommu@ff903f00 {
>  		status = "disabled";
>  	};
>  
> +	isp0: isp0@ff910000 {
> +		compatible = "rockchip,rk3399-cif-isp";
> +		reg = <0x0 0xff910000 0x0 0x4000>;
> +		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru SCLK_ISP0>,
> +			 <&cru ACLK_ISP0_WRAPPER>,
> +			 <&cru HCLK_ISP0_WRAPPER>;
> +		clock-names = "isp", "aclk", "hclk";
> +		iommus = <&isp0_mmu>;
> +		phys = <&mipi_dphy_rx0>;
> +		phy-names = "dphy";
> +		power-domains = <&power RK3399_PD_ISP0>;

Should this have status = "disabled" too? The mipi_dphy_rx0 node is
disabled by default too, so in the default configuration the driver
would always fail to probe.

Best regards,
Tomasz

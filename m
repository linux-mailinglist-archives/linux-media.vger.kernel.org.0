Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C18E16FEDD
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 13:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgBZMY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 07:24:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33477 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgBZMY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 07:24:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id m10so4460428wmc.0;
        Wed, 26 Feb 2020 04:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IvhXItdd4X1YXydMqRqD+tdcTcMEd0LYsl8PcoH++pk=;
        b=Pm5HWF73aJ9VZcK/5Zlg1TkuMduL1Z0xp2H7Tf54k04xSGZJJXLHLvKQeMdHL+zJYr
         pPiwRu+UndJu3ZSYNetFEJdoMpn2fyL8aufv0VPRtbL3/nvBusVWG+5yztsop2Dv+UU3
         AoeyskahRt+cDZAxIsfHiT8TbsUPrhERZ0kK0iBKH0iWuILF0PbKXDlODXyBTmFYTH8F
         zy/4nUoxWO0igZl95eYU2cbPiOZSSbL543ND5gG+xJo+CCZv1YY8iFW0gGJfpYzPCrnB
         0T9KuaH6iqs9hgFnT3hqGoAy9nSzJi0M3gsFxzE3eLM2t1zv2yTU2VUgy2A2wNWWGehp
         llGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IvhXItdd4X1YXydMqRqD+tdcTcMEd0LYsl8PcoH++pk=;
        b=kJjHxbc2xQhfs8n3fo+seIMK2oBJOY5kATJc/y+ALYztquS2EOOruVkKktrvpA4j1w
         /OriLlTqgi3gH4n7TbrfKPChykewp2ecOblKFFW06HpDU8GvTfo1kCp1qFjWOCbhCQ22
         QbJHcb3v2Eb7Uz+s/u0IBHLe07n03ILiuhLd+Fa05/E8yUvpuDlDFEIgUJvjXVamsl7P
         O2bd6rpptsTn7mJtlxP15tNekhhNHRbCPOpOccJARqyB00CBSq1cmutBByZSRoHuY8JQ
         BoFRKu3ogNYnxj0iLfmJK85vXEnr0W1+wFgOdmPIlNrNnrnbdvYwcK5Lxmp2fgAT/0Ji
         MQJQ==
X-Gm-Message-State: APjAAAXUP7Ykdq/CsKJ/J2ErADzxxK/+FVrzpbnPTZ3NYiBM+yfdcJEj
        Ta26ChQsex/MKaXGF8F0Qcw=
X-Google-Smtp-Source: APXvYqzyTzyUPRQdIy8Rfhx8ubVi+C6umoNFwiXeFqS0v+Ld0G8ObmhzMOrwd3BzwL6ZjxmlWPhcrg==
X-Received: by 2002:a1c:7718:: with SMTP id t24mr5311847wmi.119.1582719896307;
        Wed, 26 Feb 2020 04:24:56 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g14sm3226354wrv.58.2020.02.26.04.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 04:24:55 -0800 (PST)
To:     ezequiel@collabora.com
Cc:     boris.brezillon@collabora.com, devicetree@vger.kernel.org,
        heiko@sntech.de, hverkuil@xs4all.nl, jonas@kwiboo.se,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, nicolas@ndufresne.ca,
        paul.kocialkowski@bootlin.com, robh+dt@kernel.org,
        sakari.ailus@iki.fi, tfiga@chromium.org
References: <20200220163016.21708-7-ezequiel@collabora.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: rockchip: rk3399: Define the rockchip
 Video Decoder node
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <817821e3-bc51-8037-b9b9-e429c5eeb280@gmail.com>
Date:   Wed, 26 Feb 2020 13:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220163016.21708-7-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

Dtsi nodes are sort on address.
The vdec node is now inserted between:

vdec_mmu: iommu       @ff660480
vdec    : video-codec @ff660000
iep_mmu : iommu       @ff670800

This should be:

vpu_mmu : iommu       @ff650800
vdec    : video-codec @ff660000
vdec_mmu: iommu       @ff660480



> From: Boris Brezillon <boris.brezillon at collabora.com>
> 
> RK3399 has a Video decoder, define the node in the dtsi. We also add
> the missing power-domain in mmu node and enable the block.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon at collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel at collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 33cc21fcf4c1..a07f857df12f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1285,8 +1285,20 @@ vdec_mmu: iommu at ff660480 {
>  		interrupt-names = "vdec_mmu";
>  		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>;
>  		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3399_PD_VDU>;
>  		#iommu-cells = <0>;
> -		status = "disabled";
> +	};
> +
> +	vdec: video-codec at ff660000 {
> +		compatible = "rockchip,rk3399-vdec";
> +		reg = <0x0 0xff660000 0x0 0x400>;
> +		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names = "vdpu";
> +		clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
> +			 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
> +		clock-names = "axi", "ahb", "cabac", "core";
> +		power-domains = <&power RK3399_PD_VDU>;
> +		iommus = <&vdec_mmu>;
>  	};
>  
>  	iep_mmu: iommu at ff670800 {
> -- 
> 2.25.0




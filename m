Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 141134B4F5A
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 12:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245042AbiBNLvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 06:51:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241265AbiBNLvn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 06:51:43 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B746FC36
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 03:51:33 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id r27so17050754oiw.4
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 03:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VaY92xWxZmJbIhWoRPGVCLHOjj+hvu6ODwIA7Yqxx7Y=;
        b=PHLOXqvQMNgCp31RBKLpimVWuRyN4Pxry5i/TzqC4fGXqwa9GJY6bG8OOUPHG6KobD
         x8n+b4hRyf/T26czxWJ0trPRX2yWrTNl6r/o2F0U37dznPjwAbPr1t0ckn15KcdmZPf+
         aDkDwYec7Pk7Sn07O8kT7TmNcE0aNGdYtt54/oJKbE0qvs9eB9aGatiUXFc5Yi7pFG4w
         TJ1ZeX8XhUNKKrFsGKnlH53tyL01czeiJme5J+5uipxRvQ3uR+YCVRd9jVg75YXg+tjq
         74Pc/ikt4uHv2A5seHhpQ5UFG8AwgOSxhxr47Pt59NXm4VkLX2K7QRvNOk6eRKCJcoWh
         g/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VaY92xWxZmJbIhWoRPGVCLHOjj+hvu6ODwIA7Yqxx7Y=;
        b=sBi3XX9Ao2SBXQXIzqnJucs54PN8cNF9PlOc8CPKYWCj/3njsCFIgNVWjvxK9iHpG1
         JETsyPqX1YCWXreORmUhlRfq55XgE2SCyIK3ZAmIDhTTEuSesD2YGr4eukD6iyZ1y8DY
         EYpWT9G/yHeIDhBtbf/HZkuSPQ0BA+CQNS9WC5oP6dpvqFj1XkZmsX1YrFSIqoc/6B7b
         ftRb936S9Y02P1Hm/YlBq4GZTf9tCO3Mt5RQpOCH8zluegDhyFqZFovvMQxNDuVbQt55
         +jlTfgbMp7KWhWd+MDqaWiLaHxyc8qiy6/9pJtRGIpBSgrVTul0tveQ/CzPjzOc4wqv9
         5MOA==
X-Gm-Message-State: AOAM530iopbfL3SspzR88xXQrfCtGAAvd2CCptGqhOqEHtqPnCpasIwz
        rckoQctc1yNIueFGXBHKLRwJnbMyUx33wA==
X-Google-Smtp-Source: ABdhPJxLgSJnL0j6ots5/nxv2RKpbX28ISZysjYrNDVMIkwMOzkZC6ZSW5LOR1lfOHuFAPt1jXdXSg==
X-Received: by 2002:a05:6808:1529:: with SMTP id u41mr5197587oiw.203.1644839492876;
        Mon, 14 Feb 2022 03:51:32 -0800 (PST)
Received: from eze-laptop ([190.122.146.25])
        by smtp.gmail.com with ESMTPSA id bi41sm12637852oib.39.2022.02.14.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 03:51:32 -0800 (PST)
Date:   Mon, 14 Feb 2022 08:51:28 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v1 02/03]: arm64: dts: rk356x.dtsi: Add support for
 Hantro G1 on RK356x
Message-ID: <YgpCQNlI8tKR02fq@eze-laptop>
References: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
 <20220213171349.3924782-2-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213171349.3924782-2-piotr.oniszczuk@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Piotr,

Thanks for your patch.

On Sun, Feb 13, 2022 at 06:13:50PM +0100, Piotr Oniszczuk wrote:
>     From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> 

Please change the commit title to "arm64: dts: rockchip: Add VPU support for RK3568/RK3566".
Also, note that the commit description got some extra indentation.

>     RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP9
>     video formats.
> 

s/VP9/VP8

>     This patch enables RK356x video decoder in RK356x device-tree
>     include.
> 
>     Tested on [1] with FFmpeg v4l2_request code taken from [2]
>     with MPEG2, H.642 and VP8 samples with results [3].
> 
>     [1] https://github.com/warpme/minimyth2
>     [2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
>     [3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt
> 
>     Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index a68033a23975..ae5d80c5ba64 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -390,6 +390,28 @@ power-domain@RK3568_PD_RKVENC {
>  		};
>  	};
>  
> +	vpu: video-codec@fdea0400 {
> +		compatible = "rockchip,rk3568-vpu";
> +		reg = <0x0 0xfdea0000 0x0 0x800>;
> +		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vdpu";

Please remove the interrupt-names, given there is only one interrupt line.

> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		clock-names = "aclk", "hclk";
> +		iommus = <&vdpu_mmu>;
> +		power-domains = <&power RK3568_PD_VPU>;
> +	};
> +
> +	vdpu_mmu: iommu@fdea0800 {
> +		compatible = "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdea0800 0x0 0x40>;
> +		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "vdpu_mmu";

Same here.

Thanks,
Ezequiel

> +		clock-names = "aclk", "iface";
> +		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
> +		power-domains = <&power RK3568_PD_VPU>;
> +		#iommu-cells = <0>;
> +	};
> +
>  	sdmmc2: mmc@fe000000 {
>  		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
>  		reg = <0x0 0xfe000000 0x0 0x4000>;
> -- 
> 2.29.2
> 

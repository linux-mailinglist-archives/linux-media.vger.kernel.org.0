Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D114E1BAD
	for <lists+linux-media@lfdr.de>; Sun, 20 Mar 2022 13:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243900AbiCTMjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Mar 2022 08:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235927AbiCTMjC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Mar 2022 08:39:02 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E8182AE3
        for <linux-media@vger.kernel.org>; Sun, 20 Mar 2022 05:37:39 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id j83so13712227oih.6
        for <linux-media@vger.kernel.org>; Sun, 20 Mar 2022 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XgEXsVncSVxZu1lWL68gFPTtf1cjMMavbj6IDx6Ws6I=;
        b=DNP52BwvYPqjh7/TIBd0FZwHVMVcpMnsQ1aKl0GLrEXLNGgo7I1yd8uoqf2K+7rCKr
         zAMIA9iZzMoDtsAKC1MCdek3ieLDce0Yhw/jC1KvBCynlMCX6etfLxjpp2kQ2t8KKZeK
         CXKJV1LXcaI3cVnrvv/LLSmJPpWjSl/jLs0FIdJVJXcn5RJ6BEIzG0qQxKJ6L8dXTSOZ
         rV0pchyEUPdiP0EZ2LSy47PHXi0S8IlU0AUxQTs249/P8mFqIMtK7GU72KKceeWr5mXN
         vXdXFY7oJv/CaYrSZOo6b9T3sez/EyYRIGTzKBgh4QLqfww9BIB2Iy7jaDj0zCVitB6h
         HZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XgEXsVncSVxZu1lWL68gFPTtf1cjMMavbj6IDx6Ws6I=;
        b=hghM2NnV2G3BJLM9/RcXLuLItbI9jk2Jr6iHaz30YuxT6AgxKEdqrOsSdA/Hgp1ZLl
         kR6EWMfiOUuyiyC0+156roBic38KNvt/8j0cMN8kGL1sdUzEN1Zw3yX4H9AAtrfCYyvU
         OI6Yn24dAa0/XtbDcbcuAZh/RqZQqsbo2XIGrqEl7oEH08RtS/fzMV4+mkI1IyA1UiPw
         dYKGJEH67pt4l76VrLoIg7orZaPUfcDazH5eXhc6YpQ8L1GL6qDFAYG85v9BVXRA0JZu
         PyP+W6Ft3jcZK2WSMeQA5J0HCqsxRmNymRSVmSEnuGZl3uZpDXDbp74lvq9+jnCQs1oN
         C9og==
X-Gm-Message-State: AOAM5325+tvWAjUhRBZMKRZhNzYP1TSMpXTIoPYQ3wyDBjFF+o+5PIvU
        2LcdrCzxtnsdDom21nY8nrHFhQ==
X-Google-Smtp-Source: ABdhPJxlGXpZHn7fvSYOkVOqSZxaMXy4FJXqMuAZNhyB1dPtoMP7+9pGthVPL91bPXqmxO1R0FntgQ==
X-Received: by 2002:a54:4592:0:b0:2ec:aef5:e0ae with SMTP id z18-20020a544592000000b002ecaef5e0aemr11784386oib.21.1647779858796;
        Sun, 20 Mar 2022 05:37:38 -0700 (PDT)
Received: from eze-laptop ([186.122.18.6])
        by smtp.gmail.com with ESMTPSA id u14-20020a4ad0ce000000b0032174de7c2csm5933100oor.8.2022.03.20.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 05:37:38 -0700 (PDT)
Date:   Sun, 20 Mar 2022 09:37:31 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org,
        heiko@sntech.de, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add VPU support for
 RK3568/RK3566
Message-ID: <YjcgC9HZeDQX1sNJ@eze-laptop>
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
 <20220214212955.1178947-2-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214212955.1178947-2-piotr.oniszczuk@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 14, 2022 at 10:29:54PM +0100, Piotr Oniszczuk wrote:
> From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
> 
> RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
> video formats.
> 
> This patch enables RK356x video decoder in RK356x device-tree
> include.
> 
> Tested on [1] with FFmpeg v4l2_request code taken from [2]
> with MPEG2, H.642 and VP8 samples with results [3].
> 
> [1] https://github.com/warpme/minimyth2
> [2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
> [3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt
> 
> Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> index a68033a23975..33ecaafa8cb7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> @@ -390,6 +390,26 @@ power-domain@RK3568_PD_RKVENC {
>  		};
>  	};
>  
> +	vpu: video-codec@fdea0400 {
> +		compatible = "rockchip,rk3568-vpu";
> +		reg = <0x0 0xfdea0000 0x0 0x800>;
> +		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
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

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80B950BEF7
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 19:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiDVRs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Apr 2022 13:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbiDVRsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Apr 2022 13:48:31 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8C250E10
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 10:45:17 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id v65so5102269oig.10
        for <linux-media@vger.kernel.org>; Fri, 22 Apr 2022 10:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nr2dHmWfiNPPrGPgPCaM1uOSlB4d/YNPDX461LAtgB8=;
        b=LQaiOYQpAliM0d9+oDbPUjhZcr5YhYhYhJjLJzQqcDyc3/r8G4CoKBR2Cg0QE9I7mO
         hat8Tg2yJPa7jo2Sv3+uwgiDIurI6pYh+1T0R8uTYc61ttH5Z6o4owOliAOaq0ciUHgi
         JdLhFCcTci5eC3s/5LdfXhf9MbKvxiLYbPKp+hG1ba3wAhkXTQzjbQ/7Odq510IYNURx
         iRK91dpBbsCeyt/zDj1BdElOESE/FxrK4eb4VDideQKoF57bf3Oh/DxzTUhkZ+1Y+OA2
         AwErendhnh45Do8iHSD1YX6TDpnEQSO0Ec8o79h+Xm8nGlZRQRsKKIdkcFXCBcCIgxOy
         eB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nr2dHmWfiNPPrGPgPCaM1uOSlB4d/YNPDX461LAtgB8=;
        b=XrdMlocLPJ9kNMNLfYR1a0ylf2N/AVo7aUIfUyspuD+jaGbog91JEWJiTC/8l1XsG0
         50Wi8qUeugrlXPNwm2omsxQ57YBGF2xW05KbtIsHcuFgYMVAzfFtMXFnZsb70AhlSgmR
         BKGaqEs0Vm31Nl1S1aWvrh8V9q6YiNIXzDOcGi/TfdICPXRz03KhklemGHqUwlLbN7e3
         Y5YVE9R+DBr9N+a8Evz+1Y/EORlq4J7vLMCqy1vVIErDEUm3FVgyhvgjCGDCHLRvzEla
         beeBmpCw/E0+1Ybr4Bm/q0FovEc8v5Js577uMcpmt92ROkreI7mKm7lYOrK0SlbULS2C
         tsTw==
X-Gm-Message-State: AOAM533T3ycQwHutzHM38u2bJZ9gc71cDCcocS/LIJafaFyDauCG6vI3
        lof48M3kiGjIWdApiHxaEUfK6Q==
X-Google-Smtp-Source: ABdhPJwiTQjcOmeurwc6R+Gx9T5404cqLZmOEizI5ZBPUFKo8ZFoHVx4xFsOsrLwiWUvW9+vx5hOUw==
X-Received: by 2002:a05:6808:17a3:b0:324:fcbf:3142 with SMTP id bg35-20020a05680817a300b00324fcbf3142mr523793oib.5.1650649370137;
        Fri, 22 Apr 2022 10:42:50 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id q11-20020a05683033cb00b005e686fd52d6sm965139ott.17.2022.04.22.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 10:42:48 -0700 (PDT)
Date:   Fri, 22 Apr 2022 14:42:43 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Christopher Obbard <chris.obbard@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Alex Bee <knaerzche@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Rename vdec_mmu node for RK3328
Message-ID: <YmLpE+AfZ4UYmn9O@eze-laptop>
References: <20220422133803.989256-1-chris.obbard@collabora.com>
 <20220422133803.989256-3-chris.obbard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422133803.989256-3-chris.obbard@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 22, 2022 at 02:38:02PM +0100, Christopher Obbard wrote:
> All other rockchip devices which have vdec nodes do not
> have an rk prefix. Remove the prefix from the (currently
> unused) rkvdec_mmu node for consistency with other
> devices.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index b822533dc7f1..f8ef149fedad 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -660,7 +660,7 @@ vpu_mmu: iommu@ff350800 {
>  		power-domains = <&power RK3328_PD_VPU>;
>  	};
>  
> -	rkvdec_mmu: iommu@ff360480 {
> +	vdec_mmu: iommu@ff360480 {
>  		compatible = "rockchip,iommu";
>  		reg = <0x0 0xff360480 0x0 0x40>, <0x0 0xff3604c0 0x0 0x40>;
>  		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.34.1
> 

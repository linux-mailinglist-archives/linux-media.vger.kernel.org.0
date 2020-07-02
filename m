Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A61D212AB5
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 19:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgGBRCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 13:02:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32850 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgGBRCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 13:02:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 001DC2A0641
Subject: Re: [PATCH v3 5/9] media: staging: rkisp1: remove unecessary clocks
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
References: <20200702165410.2583375-1-helen.koike@collabora.com>
 <20200702165410.2583375-6-helen.koike@collabora.com>
Message-ID: <c70b55a4-c33c-226b-2596-a7bbba199346@collabora.com>
Date:   Thu, 2 Jul 2020 14:01:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200702165410.2583375-6-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/2/20 1:54 PM, Helen Koike wrote:
> aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
> hclk_isp, thus we can remove parents from the list, with the goal to
> cleanup the dt-bindings and remove it from staging.
> 
> For reference, this is the isp clock topology:
> 
>  xin24m
>     pll_npll
>        npll
>           clk_isp1
>           clk_isp0
>     pll_cpll
>        cpll
>           aclk_isp1
>              aclk_isp1_noc
>              hclk_isp1
>                 aclk_isp1_wrapper
>                 hclk_isp1_noc
>           aclk_isp0
>              hclk_isp1_wrapper
>              aclk_isp0_wrapper
>              aclk_isp0_noc
>              hclk_isp0
>                 hclk_isp0_wrapper
>                 hclk_isp0_noc
>  pclkin_isp1_wrapper
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in V3:
> - this is a new patch in the series
> ---
>  .../bindings/media/rockchip-isp1.yaml         | 33 ++++++++++---------
>  drivers/staging/media/rkisp1/rkisp1-dev.c     |  2 --
>  2 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index 4d111ef2e89c7..f806820eb8153 100644
> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -24,20 +24,21 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: ISP clock
> -      - description: ISP AXI clock clock
> -      - description: ISP AXI clock  wrapper clock
> -      - description: ISP AHB clock clock
> -      - description: ISP AHB wrapper clock
> +    maxItems: 5
> +    minItems: 3

Sorry, I forgot to mentioned that, as discussed previously on https://patchwork.kernel.org/patch/11475007/ ,
this is prepared to add rk3288 support, this is why maxItems is 5 (since rk3288 has 5 clocks).

> +    description:
> +      rk3399 isp0 clocks
> +        ISP clock
> +        ISP AXI wrapper clock
> +        ISP AHB wrapper clock
>  
>    clock-names:
> -    items:
> -      - const: clk_isp
> -      - const: aclk_isp
> -      - const: aclk_isp_wrap
> -      - const: hclk_isp
> -      - const: hclk_isp_wrap
> +    oneOf:

Same for this "oneOf", so we can add "rk3399 isp1 clocks" and "rk3288 clocks" later.

Regards,
Helen

> +      # rk3399 isp0 clocks
> +      - items:
> +        - const: clk_isp
> +        - const: aclk_isp_wrap
> +        - const: hclk_isp_wrap
>  
>    iommus:
>      maxItems: 1
> @@ -135,11 +136,11 @@ examples:
>              reg = <0x0 0xff910000 0x0 0x4000>;
>              interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
>              clocks = <&cru SCLK_ISP0>,
> -                     <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
> -                     <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
> +                     <&cru ACLK_ISP0_WRAPPER>,
> +                     <&cru HCLK_ISP0_WRAPPER>;
>              clock-names = "clk_isp",
> -                          "aclk_isp", "aclk_isp_wrap",
> -                          "hclk_isp", "hclk_isp_wrap";
> +                          "aclk_isp_wrap",
> +                          "hclk_isp_wrap";
>              iommus = <&isp0_mmu>;
>              phys = <&dphy>;
>              phy-names = "dphy";
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index f38801fea10d9..36f5f3b97a9b9 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -407,8 +407,6 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
>  
>  static const char * const rk3399_isp_clks[] = {
>  	"clk_isp",
> -	"aclk_isp",
> -	"hclk_isp",
>  	"aclk_isp_wrap",
>  	"hclk_isp_wrap",
>  };
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4771C19B92C
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 01:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733017AbgDAX7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 19:59:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35614 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732687AbgDAX7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 19:59:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 6457A283B9C
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     karthik poduval <karthik.poduval@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAFP0Ok-MXSYMe=-SKrgS-ng2f1uKwT0eed4uKc0rSOXzEoEXig@mail.gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <93d8b917-2fc5-0194-075a-cde510b997fc@collabora.com>
Date:   Wed, 1 Apr 2020 20:59:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAFP0Ok-MXSYMe=-SKrgS-ng2f1uKwT0eed4uKc0rSOXzEoEXig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

Thanks for the patchset.

On 3/31/20 4:54 AM, karthik poduval wrote:
> ISP and DPHY device entries missing so add them.
> ported over from https://github.com/TinkerBoard/debian_kernel.git

If you've ported the changes from https://github.com/TinkerBoard/debian_kernel.git, I wonder if this should have a different Author and Signed-off-by.

Please check: https://patchwork.kernel.org/bundle/tfiga/rkisp1-v6/

Also, we usually don't add links in the commit message, since this will stay in the history,
and links can be volatile.

But you can add comments after the 3 dashes below, and they will be ignored when
the maintainers applies it.

> 
> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>

The Reported-by tag doesn't make much sense to me here, please check

    Documentation/process/submitting-patches.rst


> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> ---

Comments can be added here, after these 3 dashes.


Please, take into consideration the above comments for the other patches in the series as well.

Regards,
Helen

>  arch/arm/boot/dts/rk3288.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 9beb662166aa..adea8189abd9 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -247,6 +247,23 @@
>          ports = <&vopl_out>, <&vopb_out>;
>      };
> 
> +    isp: isp@ff910000 {
> +        compatible = "rockchip,rk3288-rkisp1";
> +        reg = <0x0 0xff910000 0x0 0x4000>;
> +        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru SCLK_ISP>, <&cru ACLK_ISP>,
> +             <&cru HCLK_ISP>, <&cru PCLK_ISP_IN>,
> +             <&cru SCLK_ISP_JPE>;
> +        clock-names = "clk_isp", "aclk_isp",
> +                  "hclk_isp", "pclk_isp_in",
> +                  "sclk_isp_jpe";
> +        assigned-clocks = <&cru SCLK_ISP>, <&cru SCLK_ISP_JPE>;
> +        assigned-clock-rates = <400000000>, <400000000>;
> +        power-domains = <&power RK3288_PD_VIO>;
> +        iommus = <&isp_mmu>;
> +        status = "disabled";
> +    };
> +
>      sdmmc: mmc@ff0c0000 {
>          compatible = "rockchip,rk3288-dw-mshc";
>          max-frequency = <150000000>;
> @@ -891,6 +908,14 @@
>              status = "disabled";
>          };
> 
> +        mipi_phy_rx0: mipi-phy-rx0 {
> +            compatible = "rockchip,rk3288-mipi-dphy-rx0";
> +            clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_MIPI_CSI>;
> +            clock-names = "dphy-ref", "pclk";
> +            #phy-cells = <0>;
> +            status = "disabled";
> +        };
> +
>          io_domains: io-domains {
>              compatible = "rockchip,rk3288-io-voltage-domain";
>              status = "disabled";
> 

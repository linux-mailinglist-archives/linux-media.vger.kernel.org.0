Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7AA43B559
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 17:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbhJZPVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 11:21:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41496 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbhJZPVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 11:21:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 944641F43A1C
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [RFC 12/13] arm64: dts: mt8192: Add apu tinysys
To:     Flora Fu <flora.fu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-13-flora.fu@mediatek.com>
Message-ID: <314442f7-0c89-8696-05c9-871bfddf1821@collabora.com>
Date:   Tue, 26 Oct 2021 17:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023111409.30463-13-flora.fu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 23/10/21 13:14, Flora Fu ha scritto:
> Add node for APU tinysys.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36 ++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c505c6926839..8108084a3f6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -925,6 +925,42 @@
>   			#iommu-cells = <1>;
>   		};
>   
> +		apusys_rv@19001000 {
> +			compatible = "mediatek,mt8192-apusys-rv";
> +			reg = <0 0x19000000 0 0x1000>,
> +			      <0 0x19001000 0 0x1000>,
> +			      <0 0x19002000 0 0x10>;
> +			reg-names = "apu_mbox",
> +				    "md32_sysctrl",
> +				    "apu_wdt";
> +			mediatek,apusys-power = <&apusys_power>;

As said on the IOMMU commit, I think that apusys-power can be passed as a
power domain here as well... also keeping in mind that the apuspm power
domain is being used in both the IOMMU and in apusys-power already, so you
could even pass only the apusys-power pd here, because apuspm would be
already being turned on by the former...

...unless there's any possibility to have some functionality with apuspm up
but apusys-power down? From how it looks right now, that's not a thing.

> +			power-domains = <&apuspm 0>;
> +			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
> +			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "apu_wdt",
> +					  "mbox0_irq";
> +			apu_ctrl {
> +				compatible = "mediatek,apu-ctrl-rpmsg";
> +				mtk,rpmsg-name = "apu-ctrl-rpmsg";

This is supposed to be "mediatek,rpmsg-name" instead... or it won't work.

> +			};
> +
> +			apu_pwr_tx {
> +				compatible = "mediatek,apupwr-tx-rpmsg";
> +				mtk,rpmsg-name = "apupwr-tx-rpmsg";
> +			};
> +
> +			apu_pwr_rx {
> +				compatible = "mediatek,apupwr-rx-rpmsg";
> +				mtk,rpmsg-name = "apupwr-rx-rpmsg";
> +			};
> +
> +			apu_mdw_rpmsg {
> +				compatible = "mediatek,apu-mdw-rpmsg";
> +				mtk,rpmsg-name = "apu-mdw-rpmsg";
> +			};
> +		};
> +
>   		apu_conn: apu_conn@19020000 {
>   			compatible = "mediatek,mt8192-apu-conn", "syscon";
>   			reg = <0 0x19020000 0 0x1000>;
> 

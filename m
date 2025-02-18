Return-Path: <linux-media+bounces-26314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99ACA3A6E4
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 20:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E81166085
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602DE1E51FC;
	Tue, 18 Feb 2025 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IsA/eJ/g"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A0B17A30C;
	Tue, 18 Feb 2025 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905729; cv=none; b=nIEeSRj51gl5oUFMgH+vI3phcGxj01qDJNpzlOfZ8w3bRbTEpqpCy7vpKE5cC3cv74mxgho3IoSKpbwcWYOLOyKE0UjGcJgSF5Ee+wh6fUbNYjs7EO2xoH3NPUikZUMZUG/BDx0f53ZUY0qMpV9kJomjJvogTCml5YZNY0PxtBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905729; c=relaxed/simple;
	bh=MVgm1pbDd++KWvHhJeM8PPkZ/kguBWYm8oGMkmiK2I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KjuIv5brUvmK+C5cqrFlvnxA3nLb+j+tD0KAkgF9b6JRA6376eF6tO3Ct8dFltoLzZ/qLxJwsjAboo9CzufnkgZmR6tN5LUy0l2bkRAYVIvP8bn3KiRWgl7uoOQHNaVnrzOH2rMXOQydlHQAt5eq4dBmUTMuR6RTTKGywbmPXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IsA/eJ/g; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IJ83hA062175
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 13:08:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739905684;
	bh=fe9G2MZAHcd6fZNYH50IhEjcWk7Zck1M5VKNFAJhbe0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IsA/eJ/gKw7Ot15bGtKazVgprX8P7jUClfkkzImaYlfEicqHFZAPZTk5nJDuIFKhf
	 YeuIiZ9igzbgiz/V+aKBO7ZxolJxTUlQ1XLvCYxYUZllHjMuwVsKHGps2FpjY1ylKW
	 /XOjMn1L2V0eKD8pAa1xTFoh3hbXc9IHWkoQHb4k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IJ83oA010965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 13:08:03 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 13:08:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 13:08:02 -0600
Received: from [10.24.69.142] ([10.24.69.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IJ7o1V046671;
	Tue, 18 Feb 2025 13:07:50 -0600
Message-ID: <bbf4f6db-cac1-4558-b345-8b4d6b36a8fa@ti.com>
Date: Wed, 19 Feb 2025 00:37:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion
 2 board
To: Sebastian LaVine <slavine@d3embedded.com>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Biju Das
	<biju.das.jz@bp.renesas.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Elinor
 Montmasson <elinor.montmasson@savoirfairelinux.com>,
        Fabio Estevam
	<festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans
 Verkuil <hverkuil@xs4all.nl>,
        Javier Carrasco
	<javier.carrasco@wolfvision.net>,
        Jianzhong Xu <xuj@ti.com>,
        Julien Massot
	<julien.massot@collabora.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Kory Maincent <kory.maincent@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth
 Menon <nm@ti.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob
 Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Stuart Burtner <sburtner@d3embedded.com>,
        Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
        Zhi Mao
	<zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
Content-Language: en-US
From: Vaishnav Achath <vaishnav.a@ti.com>
In-Reply-To: <20250212195656.69528-4-slavine@d3embedded.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Sebastian,

On 13/02/25 01:26, Sebastian LaVine wrote:
> Adds an overlay for the Fusion 2 (FPD-Link IV) board on SK-AM62A.
> 

Were you able to test and get this working without additional patches on 
linux-next?

The multi-steam support for J721E-CSI2RX and CDNS-CSI2RX drivers are 
still WIP [1] and as per my understanding you will need those to get 
this overlay functional.

1 - 
https://lore.kernel.org/all/20240627-multistream-v2-0-6ae96c54c1c3@ti.com/

Thanks and Regards,
Vaishnav

> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>   MAINTAINERS                                   |   1 +
>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>   .../boot/dts/ti/k3-am62a7-sk-fusion-2.dtso    | 115 ++++++++++++++++++
>   3 files changed, 117 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27fb3c1be732..bf6a48da0887 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
>   L:     linux-media@vger.kernel.org
>   S:     Odd Fixes
>   F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>   F:     drivers/media/i2c/imx728.c
> 
>   SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f71360f14f23..fcd8d11e5678 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
>   # Boards with AM62Ax SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk-fusion-2.dtbo
> 
>   # Boards with AM62Px SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> new file mode 100644
> index 000000000000..68e06d643bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DT Overlay for Fusion 2 (FPD-Link IV) board on SK-AM62A
> + * https://www.ti.com/tool/J7EXPAXEVM/
> + *
> + * Copyright (C) 2024 D3 Embedded - https://www.d3embedded.com
> + */
> +
> + /dts-v1/;
> + /plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +       clk_fusion2_25M_fixed: fixed-clock-25M {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000000>;
> +       };
> +};
> +
> +&exp2 {
> +       p9-hog {
> +               /* P9 - CSI_RSTz */
> +               gpio-hog;
> +               gpios = <9 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "CSI_RSTz";
> +       };
> +
> +       p19-hog {
> +               /* P19 -CSI_SEL2 */
> +               gpio-hog;
> +               gpios = <19 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "CSI_SEL2";
> +       };
> +};
> +
> +&main_i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9543";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;
> +
> +               i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       deser@3d {
> +                               compatible = "ti,ds90ub9702-q1";
> +                               reg = <0x3d>;
> +
> +                               clock-names = "refclk";
> +                               clocks = <&clk_fusion2_25M_fixed>;
> +
> +                               i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +                               ds90ub9702_0_ports: ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       /* CSI-2 TX */
> +                                       port@4 {
> +                                               reg = <4>;
> +                                               ds90ub9702_0_csi_out: endpoint {
> +                                                       data-lanes = <1 2 3 4>;
> +                                                       clock-lanes = <0>;
> +                                                       link-frequencies = /bits/ 64 <800000000>;
> +                                                       remote-endpoint = <&csi2_phy0>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               ds90ub9702_0_links: links {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&cdns_csi2rx0 {
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               csi0_port0: port@0 {
> +                       reg = <0>;
> +                       status = "okay";
> +
> +                       csi2_phy0: endpoint {
> +                               remote-endpoint = <&ds90ub9702_0_csi_out>;
> +                               data-lanes = <1 2 3 4>;
> +                               clock-lanes = <0>;
> +                               link-frequencies = /bits/ 64 <800000000>;
> +                       };
> +               };
> +       };
> +};
> +
> +&ti_csi2rx0 {
> +       status = "okay";
> +};
> +
> +&dphy0 {
> +       status = "okay";
> +};
> --
> 2.34.1
> 
> Please be aware that this email includes email addresses outside of the organization.


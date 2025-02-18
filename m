Return-Path: <linux-media+bounces-26304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4EAA3A600
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D4F3A4D62
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369942356C3;
	Tue, 18 Feb 2025 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wQAa8Pyf"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBA1EB5F2;
	Tue, 18 Feb 2025 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904409; cv=none; b=bjgRmg1voCkyRWpiJZdZpARU/XwVC3ukcAkOktE49mf5bcu57qTDeMjkLQLTS7Hsq81ig616uE7EK31xxNeL50W9yXCZyVNe0dshzYm9HCNPRhe7l8jvrSwcb98ogxVIYUc7clSoy8LyrwpSevz9zGy3uPUbkPo60fk4jOGCCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904409; c=relaxed/simple;
	bh=P3gCITdBnxFTZbMzUej5GDaU5ZSKZbw8UCkeILWWtLk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNrSA6H4eRoKgJ1kJrjdY6i8wXH4VJdtos0Vv3LDbL1gGNRuM1fqVcPmva+SFV15nuE1YwV0aYfmujn1Oips1d+MGpnK6whnBn70f6R1djGep+4T30AW3uknmz0dJtYreEqpg84XMx4NEn7t/n/HIC9bTSysLEyvlJQ0tXsaCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wQAa8Pyf; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIjxed1600005
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 18 Feb 2025 12:45:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904359;
	bh=vAwnzKjPzi/Np/0xGFkr303vHF2WCd+r1hVr0oSMbDI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wQAa8PyfFqkNiqRL/viga2m8HfV/0ew7nscSp4O1oxYM1sb4IL3lkcwf+rezZwNPl
	 8IwwU6Ei0zRyDPboBB5GR0s/DajznEsCm1yG1lH88S1hC7JyutyT3WOZjMg3XBaDhf
	 SP1WxCKzzumY5ie5JEeGu0H5EoSoSyZ9sY4OQrn0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIjxOR068633;
	Tue, 18 Feb 2025 12:45:59 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:45:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:45:58 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIjwDF021134;
	Tue, 18 Feb 2025 12:45:58 -0600
Date: Tue, 18 Feb 2025 12:45:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Sebastian LaVine <slavine@d3embedded.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado
	<nfraprado@collabora.com>,
        Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav
	<vaishnav.a@ti.com>,
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
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Sakari
 Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Stuart Burtner <sburtner@d3embedded.com>,
        Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
        Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Umang Jain
	<umang.jain@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Will
 Deacon <will@kernel.org>,
        Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion
 2 board
Message-ID: <20250218184558.yxqy3sbz4muypwwd@busybody>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-4-slavine@d3embedded.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 14:56-20250212, Sebastian LaVine wrote:
> Adds an overlay for the Fusion 2 (FPD-Link IV) board on SK-AM62A.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62a7-sk-fusion-2.dtso    | 115 ++++++++++++++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27fb3c1be732..bf6a48da0887 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
>  L:     linux-media@vger.kernel.org
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso

NAK. please do not send overlays from media tree. they should go via SoC
ARM tree.

>  F:     drivers/media/i2c/imx728.c
> 
>  SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f71360f14f23..fcd8d11e5678 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
>  # Boards with AM62Ax SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk-fusion-2.dtbo
> 
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> new file mode 100644
> index 000000000000..68e06d643bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0

Would prefer GPL-2.0 OR MIT in line with rest of TI EVM licensing for
DT.

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

That said, the fusion-2 board interfaces with a bunch of evms as well.
wondering if we should re-organize to better reuse stuff.

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

Drop this. this is already a public mailing list :)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


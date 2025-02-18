Return-Path: <linux-media+bounces-26305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D6A3A605
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63EEF189660A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4C11F5826;
	Tue, 18 Feb 2025 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sOsCCaBE"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29952356D3;
	Tue, 18 Feb 2025 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904465; cv=none; b=rwN99vodwhtDuMEa3Ca/cbrVq2TWcTgerDRL0V5I5qRwQho1do1F+YbE/U4MZoVGCLh8C9xT9kP4qRxRnc8hCEtfaERAcvNYtlmgNN+BXjVY7vIuJwDTTNsAgGdQ6Izd3kj8OXlKrHpl12/toZccvpt26+bcGMEria4Oj/qmP0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904465; c=relaxed/simple;
	bh=yw5Yt4kfnWERkfl4Lpwd2pjTeIDCOFTVFKwXTHQRVwY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVtxaN6e436Q/PGv3H9W3II/b1j269TKZXWzDfIPMSN7TOtoGqxj6IsyuzU+liu5flPjZ68eGbw5qOaxlRVgEz3JsjJ0ePAaEHlkigf38tfEWKpWj91q3Q42mZ3AJiE8gZ4oSZoTCbtWO3Xv56m7igMGkmj5YfIH6oTb7QJXyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sOsCCaBE; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIkxib1730394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:46:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904419;
	bh=VaGTcSN1wD5Urnyf0YoZkBhWlJQc2yOqVlder5VljG4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sOsCCaBENHWTqHe1BgBE9MgQbPYGYDmRraShvvUgyIbXKunywcEi1FN28QD2/dCXZ
	 8OmRn+3ExhwDBlnS8+jN32fV67Meb3xUaksUfA+zO0rFQDb88GFHH+qC6cnVeKx0u6
	 Rmn0BpWzQeN8m3mbomvXXwoliFGN81j0WUsKWhRQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIkxcI057016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:46:59 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:46:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:46:58 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIkw9t116037;
	Tue, 18 Feb 2025 12:46:58 -0600
Date: Tue, 18 Feb 2025 12:46:58 -0600
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
Subject: Re: [PATCH 4/4] arm64: dts: ti: Add overlays for IMX728 RCM
Message-ID: <20250218184658.sgtrrwpltgrcnlr4@smugness>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-5-slavine@d3embedded.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-5-slavine@d3embedded.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 14:56-20250212, Sebastian LaVine wrote:
> Adds overlays for the D3 IMX728 RCM.
> 
> Only a connection on port 0 is currently supported.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   3 +
>  .../dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso     | 108 ++++++++++++++++++
>  3 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf6a48da0887..f109b5dc8fa5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21891,6 +21891,7 @@ L:      linux-media@vger.kernel.org
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
>  F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> +F:     arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso

Please route dts via SoC tree.

>  F:     drivers/media/i2c/imx728.c
> 
>  SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index fcd8d11e5678..6c8bbea246f1 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -240,6 +240,9 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


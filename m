Return-Path: <linux-media+bounces-29617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF8A80C39
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 15:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3989A4E681F
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F8E19E975;
	Tue,  8 Apr 2025 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Pj/kCOmS"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDD199EAD;
	Tue,  8 Apr 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118192; cv=none; b=n+PcUzr5sa0wg4ZrPzMTXLQLYofochdeWpkVYfBJHsWYgvT562CzHOORQNMsamhJxXgpRmjbcmg2kXLqlp3JppR51G8V7DYj83FtN/IaQIuPjGFVfuV3ACUmvRFBx9rBPssWrDC9ztqHQnZ5TEnW2QAV3JUFbAqlSH6MCQ7n8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118192; c=relaxed/simple;
	bh=t1Ny1pKzE+5lOoO+nkt2ZogZrx3/XWmU9zhammAWubU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHtiiPq4yKd+XDsN5/BUytax65cDVNAv2MTMt0fPIQDW0w5IUBT+7S4nnxdyhUtNkc8KEBIHjusYph0CSt9kK3dRGU51tr3ey6AlnU1BRNg2TK+teSzfTLoJOjhu/3XHGJAgUE1sB/5JIC2lD0fgmc33zdfvspD3tA0uvR0E+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Pj/kCOmS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/DaIn1hXvAed6evdNr/FMZd3K+jUtBILZseoN0UJCnA=; b=Pj/kCOmSCTuBYrYVphjmizbPXT
	PoWmvrUNX5cTy4GMWhifyZCeMyTjgleXjvMmM/k6tI+4/jznlaOBbR4gOJgNNsm446wUAwyuhTzuY
	L5fc6bIowzbzaXxf2HohBWN1cs/RUjGMtxIIsl479bZ0fd6YtfxwT5C46MfbnI133zjrGCORTe2sY
	2V+EEQeFTzOdwuL6G8YjXDdfDSqW2Vb8pK+Yu1GGKjer0U8xZOCCk2yIBMNY9v9SUPufm6fkIohgI
	WCxaJDn9tZNePV7sXXs0Jxa9sAa/kRKzFHNNxEbAQG8Xz56Mt/C5Uz1mlyvTZAtWuofnGfhwQDn7L
	hNOs0iLw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u28oD-00035s-9O; Tue, 08 Apr 2025 15:16:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject:
 Re: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
Date: Tue, 08 Apr 2025 15:16:05 +0200
Message-ID: <9432379.CDJkKcVGEf@diego>
In-Reply-To: <20250325213303.826925-7-detlev.casanova@collabora.com>
References:
 <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-7-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Detlev,

Am Dienstag, 25. M=C3=A4rz 2025, 22:22:22 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Detlev Casanova:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---

> +	vdec1_mmu: iommu@fdc40700 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells =3D <0>;
> +	};

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3588-base.dtsi
index 24ecbff06cd27..8bde8e257eac9 100644
=2D-- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1395,7 +1395,7 @@ vdec1_mmu: iommu@fdc40700 {
                interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
                clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
                clock-names =3D "aclk", "iface";
=2D               power-domains =3D <&power RK3588_PD_RKVDEC0>;
+               power-domains =3D <&power RK3588_PD_RKVDEC1>;
                #iommu-cells =3D <0>;
        };

Needs to use the correct power-domain, otherwise ends in SErrors on 6.15-rc1


Heiko




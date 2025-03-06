Return-Path: <linux-media+bounces-27716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680DA54B8F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 245413B2F55
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5794520C46D;
	Thu,  6 Mar 2025 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QACnV8s8"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2B20AF66;
	Thu,  6 Mar 2025 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266460; cv=none; b=A5xuliNLm9Yf5iISveIS4kliGx5plYiq4k4Fxjiq+evCKJwoq4oAseoQ1UOiMvEI27DGwD8ir3ZRMP7gkFM73mbOJ0gVeVZiGkIUOui/Uc5NoMZUgWz6Eeon6+QreF6d79GlGLUbLdgEdyUSU1X3+u49h0WkVg2mJ0IRMC70N5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266460; c=relaxed/simple;
	bh=/iZoP/9Et9Vx+hxzzsz5T5JbQQu3qHIgKjom5G/ER6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnzoEvFswdfVAQzp25nL53SFTyAqahEa6v7mW1PBD+MPtLjEGbXl3wEFLKBIC49OuXf+eipg+52jJ5+MTHz6T6be7ufa9jwyfRDeyu4RUjOVjBdPPV9BW6/UgNVhUaluhxiIE+s9jKy8jeh/62bfoaQW4f9Chdt674w/nHf2n/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QACnV8s8; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tub56u27slUSeM33CgyympJU415Xqw1zM4nVTXKlmqo=; b=QACnV8s8mXopm0366ZNMKsK0Ds
	SSd3bl5oezuocetjxvmxDz343LS8M2ltZqKuvHwHbESuUjAdEHnpZrRNdzNkbtTCqlEo+0Lt0Dpc/
	HpiLcjKOohB320DGLLe42kvh/R5qvinAYbPhgnnUWlDRLJ9ryX+RLuJR4tAL1ATsmztiI+TXSs7Qp
	RMqg/SgXfYAkXgCB1gfNjOHAz1yay82w7UF9JiV7CIKmX09/eUPT8kciaVBe6YKKVsfIbQoxgkZK1
	oHnt2BcntnqtO6eNCuSX53xLT7X29iqLYbzgkIwA1vvYYXd36RVKMb3i/u1sDzwkVcicXjI3c9HZF
	sHvWThJQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqAwj-0003Aj-FF; Thu, 06 Mar 2025 14:07:29 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
Subject:
 Re: [PATCH v14 2/3] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Thu, 06 Mar 2025 14:07:28 +0100
Message-ID: <3292594.iZASKD2KPV@diego>
In-Reply-To: <20250306072842.287142-3-dmitry.osipenko@collabora.com>
References:
 <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <20250306072842.287142-3-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 6. M=C3=A4rz 2025, 08:28:41 MEZ schrieb Dmitry Osipenko:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> The Rock 5B has a Micro HDMI port, which can be used for receiving
> HDMI data. This enables support for it.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  .../arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64=
/boot/dts/rockchip/rk3588-rock-5b.dts
> index d597112f1d5b..377824e69e20 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -220,6 +220,18 @@ hdmi0_out_con: endpoint {
>  	};
>  };
> =20
> +&hdmi_receiver_cma {
> +	status =3D "okay";
> +};
> +
> +&hdmi_receiver {
> +	status =3D "okay";
> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_hpd>;
> +	pinctrl-names =3D "default";
> +	memory-region =3D <&hdmi_receiver_cma>;

nit: property sorting, alphabetical ... but with status at the end

Heiko




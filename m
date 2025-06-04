Return-Path: <linux-media+bounces-34051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B7ACDA0C
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 10:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD34918948E7
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418A228AAF7;
	Wed,  4 Jun 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="nO88kd9j"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C51E5B9A;
	Wed,  4 Jun 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026379; cv=none; b=J+Whxc3mhc54trccG31OiCBRl46a0g8TRZuoP2wOVx9G6DhHnk88oCNDa1OHka7z4DB/0bipjuhs+JD5QkXRS4EntEk3iXOeTlgQKbM1NH8rYuh7bQ3962rKKeEzjdCxFFudeE0cCbgYKif/PpWFdw/psAZ5vslhV5lW/MzlPUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026379; c=relaxed/simple;
	bh=eFlIUCyN71T08oNRCAZYsngKHQGzULPXikUxE0NeHaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPbULaoRkJkM17LXlhN26YZfWaYjIAZLtMJgQ0gPb/SWJSWPZb0mxn00BMFVuWpeqD/AJJtTL0M6xOAUidHMs2aElegjDo262hRfwXEOKFr+XwfjWFygqvkqePD0KPReaXdchjmbTLiNHEEmAFNsqbTXLkskL9gnpcTrx0/3Igc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=nO88kd9j; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ncKFJ2m/Ggn0OpW0FtMpeotUrPRiDPOb7CG/Tgptuh8=; b=nO88kd9jGBbtA/VXI9JU4IzVTa
	w74PJFH/OIZhNdpijwszwaIH+HuTCH+056zaeZOh03cSkp8IjBG+e1S59fJTQiB6KX0WkRGxwW/HX
	B/N5R/kIX/EQdVP4YYRG9+tjyEZAlrEwtn5AUAXfo6jS+ZsZhTitNjGMoNIgpsUmf4GCHvp+9F9eU
	KuOtvw1YCtB6dWNlpNRkyHMWTzH1DLtKxbVevZRCtxl04fOuHX2y02U6QE8m1YUA9d3mlDoimPpQI
	3+LPvnLu3gnU96/LoNhfzu/BQyjR+pb9cjy6we2/aR+NJLSdWlfuxnD5YcJIlP8Kp8Y29bjjM2U2F
	HwnUT9vA==;
Received: from i53875a2b.versanet.de ([83.135.90.43] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uMjeO-0006eE-8a; Wed, 04 Jun 2025 10:39:08 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject:
 Re: [PATCH v6 03/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
Date: Wed, 04 Jun 2025 10:39:07 +0200
Message-ID: <4605519.Wku2Vz74k6@diego>
In-Reply-To: <20250604-6-10-rocket-v6-3-237ac75ddb5e@tomeuvizoso.net>
References:
 <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-3-237ac75ddb5e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 4. Juni 2025, 09:57:16 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Tomeu Vizoso:
> Enable the nodes added in a previous commit to the rk3588s device tree.

shouldn't the quartzpro64 also need a vdd_npu regulator, like the rock-5b
support at the end of the series? If not, please mention that in the commit
message.

Also, it'd make sense to collect all dts patches in one location (probably
at the bottom of the series=3D


Heiko


> v2:
> - Split nodes (Sebastian Reichel)
> - Sort nodes (Sebastian Reichel)
> - Add board regulators (Sebastian Reichel)
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++=
++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588-quartzpro64.dts
> index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90=
bc7970418f60276 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
> @@ -415,6 +415,36 @@ &pcie3x4 {
>  	status =3D "okay";
>  };
> =20
> +&rknn_core_top {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply =3D <&vdd_npu_s0>;
> +	sram-supply =3D <&vdd_npu_mem_s0>;
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_top {
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status =3D "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status =3D "okay";
> +};
> +
>  &saradc {
>  	vref-supply =3D <&vcc_1v8_s0>;
>  	status =3D "okay";
>=20
>=20






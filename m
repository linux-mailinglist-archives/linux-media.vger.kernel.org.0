Return-Path: <linux-media+bounces-50325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 726AAD0BFE6
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 20:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E424A306026C
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 19:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBA12E3AF1;
	Fri,  9 Jan 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="io4aeSwi"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB252D7DF3;
	Fri,  9 Jan 2026 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985335; cv=none; b=jW1lD1ezD7udxe9v5iDr5fD/0OSZ/4L6lKi+/ye/0ISB4WbHvFy/md1V94NkLMb2wGBtlWnpJd1X6zCcjPl+EIlrQqNoXsq3xGKmB5o8RHcJ33p2KPQsz/dEPwLpTTFfDKiep6VLFDEsOsc9ZdmFVPv6nNNKdUqcAVjOazzg0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985335; c=relaxed/simple;
	bh=SIfjtsJLsWU5FTYSSM4rE9H9OQRxWrEyhFx816boWl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIw6Vb+Ks8pWtWYkvrIq7KO6MjfjSOQHRE4OioKtAxckwEVgOiAm6XjUM17KnXkRHAzEKCFZUb8PSKi1atefzS4Z9fnjd12nzdY6i6QI3grnYRRLGrfoW0vBRoY+MyZvumSFAGj2qSJ+6NauCzD31pGiQnX2GB/HrNzdzYkCtWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=io4aeSwi; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rUG4AqLOAotmEjMwBGwvy+v3yU8rvr0O7bMcFZzU8bs=; b=io4aeSwifbaCk9EBeFgwnKyehD
	EGLDctYVN35Bq1CHf+evDxW/u4wqjCv05gRBzLQzFUvmTg06BmsxAtDU1ui0BbiSsrhG46ajlS0eX
	xGpt0RISSJ84La5xVHxA7UkkCXIzsF7tm9cG1Tu4che9lb+0vaj/w5dnEYWQGM9GKPTV2Y8qHXM1L
	WGeyz5JpNkBmHWHR1SswYiDB7FPX50WZ7ruLQPh8slqYOomGOXB767x8E3t4WgttmTsP9GSUFFtSI
	hI5W88sS9xCIym5yZwB7MWYfh0tt3Vf/IMKgRdc3XHIWZu4gcmlP8V/KgkADFMQxLz4NAHVXH8ptH
	ADWEz1KA==;
Received: from [192.76.154.238] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veHkJ-001fcj-Vq; Fri, 09 Jan 2026 20:02:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Aishwarya.TCV@arm.com,
 Robin.Murphy@arm.com, linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] media: synopsys: hdmirx: support use with sleeping GPIOs
Date: Fri, 09 Jan 2026 20:02:03 +0100
Message-ID: <18643681.geO5KgaWL5@phil>
In-Reply-To:
 <20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org>
References:
 <20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 8. Januar 2026, 21:08:47 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Mark Brown:
> The recent change in 20cf2aed89ac (gpio: rockchip: mark the GPIO
> controller as sleeping) to mark the rockchip GPIO driver as sleeping has
> started triggering the warning at drivers/gpio/gpiolib.c:3523 indicating
> that a sleepable GPIO was called via the non-sleeping APIs on the Rock 5B:
>=20
> <4>[   14.699308] Call trace:
> <4>[   14.699545]  gpiod_get_value+0x90/0x98 (P)
> <4>[   14.699928]  tx_5v_power_present+0x44/0xd0 [synopsys_hdmirx]
> <4>[   14.700446]  hdmirx_delayed_work_hotplug+0x34/0x128 [synopsys_hdmir=
x]
> <4>[   14.701031]  process_one_work+0x14c/0x28c
> <4>[   14.701405]  worker_thread+0x184/0x300
> <4>[   14.701756]  kthread+0x11c/0x128
> <4>[   14.702065]  ret_from_fork+0x10/0x20
>=20
> Currently the active use of the GPIO is all done from process context so
> can be simply converted to use gpiod_get_value_cansleep(). There is one u=
se
> of the GPIO from hard interrupt context but this is only done so the stat=
us
> can be displayed in a debug print so can simply be deleted without any
> functional effect.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index c3007e09bc9f..1eaa25efee21 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -230,7 +230,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_de=
v *hdmirx_dev)
> =20
>  	for (i =3D 0; i < 10; i++) {
>  		usleep_range(1000, 1100);
> -		val =3D gpiod_get_value(hdmirx_dev->detect_5v_gpio);
> +		val =3D gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
>  		if (val > 0)
>  			cnt++;
>  		if (cnt >=3D detection_threshold)
> @@ -2204,10 +2204,6 @@ static void hdmirx_delayed_work_res_change(struct =
work_struct *work)
>  static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
>  {
>  	struct snps_hdmirx_dev *hdmirx_dev =3D dev_id;
> -	u32 val;
> -
> -	val =3D gpiod_get_value(hdmirx_dev->detect_5v_gpio);
> -	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
> =20
>  	queue_delayed_work(system_unbound_wq,
>  			   &hdmirx_dev->delayed_work_hotplug,
>=20
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe
>=20
> Best regards,
> -- =20
> Mark Brown <broonie@kernel.org>
>=20
>=20






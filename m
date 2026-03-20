Return-Path: <linux-media+bounces-56564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHqfGZWMvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:06:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA62DF262
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A273053BCA
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3014E30E0ED;
	Fri, 20 Mar 2026 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="OeIV0rgv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60477271443
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029726; cv=none; b=ug5LRGLo2LoJFtXQUr0ZlH+hLHpG5yZD2qgN7fqG0hIFj8572eU/Lqx75joPM3xYv01UwYHCAqs4DSpUCEj2EUj2I/jjo+G2fIAWTfD/u3ekRwDrjzVfvmbpbxfh/hC+thJuDpZ1VgLcZlKx/XeUxP3am/dZ149UdT0xXz6hV7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029726; c=relaxed/simple;
	bh=H5gU9h2LDuhmCwxdc44WNBFzgg5aMPEZxwZGz+ZhDAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jU7W2rgli9q7WD5WxB8TnphXrTcpgokNWBhJvx2nF/emz1uUwoX2AfpWdV6S8C4saBYJz/IIl1wY1PRcj0hGrJKxOvCB3I6SZYycETHJHcQnrY+HjziuKbR6gM/+Aey1LsJQWPcs2DBYjOaeILzwWGDwnCO7qiEYKFxIfislehQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=OeIV0rgv; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-50b266413fbso16605821cf.1
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029724; x=1774634524; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=OeIV0rgvLRjU3mkwzj/5s18UbCw/ox0v3JKYLo3uYoYxWCJNUO5wBsMNvg8rLLHHbi
         ydpZj6WWbaLhMESCLCN6UBmctdGvw9M20/32LLntIEuZ6JnWB1AvqcAuYxR7onlaqBz+
         r3Nh1K56XSMBLlQDlVIMviNIVuVAq1/ii/f/CsSV++hp4i7KUYMOWJUWQ51eYuOxkG4k
         Ue+QIzrlY8gi1HrM8/l2mnLJVHXn6sqdpHqIb92phAGxOWbrr1GpO0YfMNggpjKrLySN
         rLHL3812y+TRA8FVuGs2b+TFGwILp29aGyaUkoicNBT3I1EdwmWBr5uDmeJBbLnl33D3
         6u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029724; x=1774634524;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Onnst1Yk+/sF58VoWLFIxA1fIHkkY4f4Vk4kcTJKl0c=;
        b=GjZPUXtMho8GzxCZXurawiErnai8oQkEZYHHoHsZrNxywXUmyQwbXjZFInOqkuB7NV
         sTcM4bKZsKTaKJaOjrDeeqI6QCtKN1H4kvI8SFzD4ix8gP5ahBpcy7YoJtAlcI6HBbI8
         MusTx85UijuLbCg7/DbwPcSo8Ho+mVgw8wVrjTojpWld3cofbZiy9VzhoPrcsweWtkYI
         /xwbRrwcVSDuKOumeOqWqYH/B7ANyI8I2RrG31MJuacoLDK/9kmIrddGpMy9pjGnHC7G
         tqYw/27izeKdvxaiIpXpoGFv1v/9ZcbspaDdxIS3k0o4AEyKclRGs+Tkujps5+sL9EvX
         thaw==
X-Gm-Message-State: AOJu0Yxzl6CAIcoKZE1y18vjevYcG/iwvl/Bq7wpmKtIUFJIo4FHWMgv
	XzqggAfxsqP1M5fczaGUDdv3VIz5gRTu0JHxa7SrhbnEbcD498zIRWufxqeeF6f6V3g=
X-Gm-Gg: ATEYQzxHaNf+sc/Uf08PWhE3CROrbpYc758c82jewuJ2ZE+1pQDzTs5otLc0A1A3yhy
	aYAwkrQ/uFYEZhaUMCSSvUiBZqxtt+isT5hzerRsK646a8S3p9VeWB3Z+nwS2SKsBMr27xCw3eO
	UhAAS50OgPT0RfO00OpY16HE1ha+SVoYcmiyAPRvo7zTrJ61P37qXOsf+KWA4W7LHPlrdCNB163
	Um8e5nMnwDyoLsIOZ6BR8GGmvrljjRnzfgBGeZY0ENfZRH5pCuCnWd9nGeDlgvsMoLjvrmqp0DA
	uwJ3yUW0UAJRnaRZeVEn+FzyW/foXh9U+zqDLUCiuLVnc0AgzWvv5Qc9cS0w0JfslIQ3M9Z4X56
	Vch+pxb0A/gD7C71/oABXb8lEYcqVClYx93tGeBe+JXj6JJVQ6pUDeCcqIVKHq9kRLWkpdDKnHA
	m16VyZV2K8G5s/yKMri0donRdqDYOR
X-Received: by 2002:a05:622a:258c:b0:50b:277f:3c46 with SMTP id d75a77b69052e-50b375f0215mr59663181cf.69.1774029724099;
        Fri, 20 Mar 2026 11:02:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e80cb9sm25129221cf.25.2026.03.20.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:02:03 -0700 (PDT)
Message-ID: <42883104d21844b34959945e9af161c92644bd81.camel@ndufresne.ca>
Subject: Re: [PATCH v3 25/27] media: rockchip: rga: disable multi-core
 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 14:01:59 -0400
In-Reply-To: <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-25-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z2my5z6cvzeWllcl7dyY"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56564-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D6CA62DF262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-z2my5z6cvzeWllcl7dyY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Disable multi-core support in preparation of the RGA3 addition. The
> RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
> work between both cores, which is not yet implemented. Until it is
> implemented avoid exposing both cores as independent video devices to
> prevent an ABI breakage when multi-core support is added.
>=20
> This patch is copied from the Hantro driver patch to disable multi core
> support by Sebastian Reichel. See
> commit ccdeb8d57f7f ("media: hantro: Disable multicore support")
>=20
> Link: https://lore.kernel.org/all/20240618183816.77597-4-sebastian.reiche=
l@collabora.com/
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 47 ++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43644995c152e..e45b9c853d659 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -708,6 +708,49 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/*
> + * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this work=
around
> + * the driver will only probe for the first core and early exit for the =
other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the main core can be used to cluster all cores together=
.
> + */
> +static int rga_disable_multicore(struct device *dev)
> +{
> +	struct device_node *node =3D NULL;
> +	const char *compatible;
> +	bool is_main_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret =3D of_property_read_string(dev->of_node, "compatible", &compatible=
);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main=
 core */
> +	do {
> +		node =3D of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_main_core =3D (dev->of_node =3D=3D node);
> +
> +	of_node_put(node);
> +
> +	if (!is_main_core) {
> +		dev_info(dev, "missing multi-core support, ignoring this instance\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0static int rga_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga;
> @@ -718,6 +761,10 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0	if (!pdev->dev.of_node)
> =C2=A0		return -ENODEV;
> =C2=A0
> +	ret =3D rga_disable_multicore(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> =C2=A0	rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
> =C2=A0	if (!rga)
> =C2=A0		return -ENOMEM;

--=-z2my5z6cvzeWllcl7dyY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2LmAAKCRDZQZRRKWBy
9MZsAQCqTBzD03pb+ti7XEpzLUwzJaRWq1EGrE7Yap2Xjv5SlQEAq+a51F+Itk6Y
QK1DHm1sCQVkk8iD50vTHHHekOqdxwk=
=poHg
-----END PGP SIGNATURE-----

--=-z2my5z6cvzeWllcl7dyY--


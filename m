Return-Path: <linux-media+bounces-39469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D9B2174C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5B157A7325
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30DE2E2F1C;
	Mon, 11 Aug 2025 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jgBRvlzz"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7282DE6F5;
	Mon, 11 Aug 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947524; cv=none; b=cQ7atILBX+VpeEgvez37M5Sggc3K+0p7hpr8wLKs4LkCKnNH70gJ3d7KzSJrtQe4RS1pQVzz7pJ79gh23dKxlw7m1+N60VH0+jFl6MipbngMkBKaqn7clGKCKJVb4aRmeeT/0CfXxrFpWWVX1YXsIwbLYhdcGCJ/XUS0esWUgWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947524; c=relaxed/simple;
	bh=Se/XuCy4Kpgqy/Lsz9lRmsfQvSwyPuBPc1dOKtWoRHY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g8sisJER4bDe2U9fLyi7cpilYBCWLIGhJEAJCC9CHzUhLXHYgaQC3Z6x6GzzYqWZP3VUbR4bT5ZsbRUoMlUWlgrQAgc1oZmldXjLPLaGLy2Mb/mQbMhqTlYxcpxOri0xNcN+7fPBJ9rT5X5Rd8Jo/C9KBOcdIgqEwD9BoekC8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jgBRvlzz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754947520;
	bh=Se/XuCy4Kpgqy/Lsz9lRmsfQvSwyPuBPc1dOKtWoRHY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jgBRvlzzdsOk+nRTCAoFVfNBWHejCyBDoMfmnzydtgbaKzQE9nVRBUcluLx0TVEdd
	 Im0M0I20QY6NBOpTKmm9otMYtILpQX6NiYhubmICYnhwRBLLUPINZMtkwN+hRIgkL4
	 zBp2y7TDRR4YBglKkk55NETZdOif6lOafGLDRJev+tqTLbLP5Pt72vayKMXAhWSWLJ
	 WG+d6z72yG5s96p/tpuPORauqOhBDgRuSZkkFmOjOVrhfMJs1w3qORV7mbM/x0RWgq
	 XpLEYLal23sxUrgvO8XorKVJyC5nqwdjtOduHe+zeA4UaqMHlmvnYIZjiiJYjmqVc8
	 3/mC18CD8k+iQ==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF70217E090E;
	Mon, 11 Aug 2025 23:25:18 +0200 (CEST)
Message-ID: <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Detlev Casanova
 <detlev.casanova@collabora.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 17:25:17 -0400
In-Reply-To: <20250810212454.3237486-6-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-6-jonas@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-XgQKcifX1OiDVJb6s0rw"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XgQKcifX1OiDVJb6s0rw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=A9cri=
t=C2=A0:
> From: Alex Bee <knaerzche@gmail.com>
>=20
> The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
> or VP9 is decoded, otherwise the decoded picture may become corrupted.
>=20
> Add a RK3328 variant with a quirk flag to disable QoS when before
> decoding is started.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - No change
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |=C2=A0 9 ++++=
+++++
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |=C2=A0 2 ++
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c=C2=A0 | 10 ++++=
++++++
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12 ++++++++++++
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A05 files changed, 37 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index 1994ea24f0be..f8bb8c4264f7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =C2=A0
> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> +		u32 reg;
> +
> +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> +		reg |=3D 0xFFFF;
> +		reg &=3D ~BIT(12);

I wonder if there is a better way to express that, if not, a comment for fu=
ture
readers would be nice. If read it will, we keep the upper 16bit, and replac=
ed
the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not spend =
time
thinking if I walk by this code again.

> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> +	}
> +
> =C2=A0	/* Start decoding! */
> =C2=A0	reg =3D (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
> =C2=A0		0 : RKVDEC_WR_DDR_ALIGN_EN;
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> index 540c8bdf24e4..c627b6b6f53a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> @@ -219,6 +219,8 @@
> =C2=A0#define RKVDEC_REG_H264_ERR_E				0x134
> =C2=A0#define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
> =C2=A0
> +#define RKVDEC_REG_QOS_CTRL				0x18C
> +
> =C2=A0#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
> =C2=A0#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index 0e7e16f20eeb..cadb9d592308 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =C2=A0
> =C2=A0	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> +
> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
> +		u32 reg;
> +
> +		reg =3D readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> +		reg |=3D 0xFFFF;
> +		reg &=3D ~BIT(12);
> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);

Can we deduplicate that ?

> +	}
> +
> =C2=A0	/* Start decoding! */
> =C2=A0	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_TIMEOUT_E | RKVDEC_BUF=
_EMPTY_E,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index c20e046205fe..d61d4c419992 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1226,6 +1226,13 @@ static const struct rkvdec_variant
> rk3288_rkvdec_variant =3D {
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC,
> =C2=A0};
> =C2=A0
> +static const struct rkvdec_variant rk3328_rkvdec_variant =3D {
> +	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> +			RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_VP9,
> +	.quirks =3D RKVDEC_QUIRK_DISABLE_QOS,
> +};
> +
> =C2=A0static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> =C2=A0	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> =C2=A0			RKVDEC_CAPABILITY_H264 |
> @@ -1237,6 +1244,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
> =C2=A0		.compatible =3D "rockchip,rk3288-vdec",
> =C2=A0		.data =3D &rk3288_rkvdec_variant,
> =C2=A0	},
> +	{
> +		.compatible =3D "rockchip,rk3328-vdec",
> +		.data =3D &rk3328_rkvdec_variant,
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "rockchip,rk3399-vdec",
> =C2=A0		.data =3D &rk3399_rkvdec_variant,
> @@ -1267,6 +1278,7 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0	platform_set_drvdata(pdev, rkvdec);
> =C2=A0	rkvdec->dev =3D &pdev->dev;
> =C2=A0	rkvdec->capabilities =3D variant->capabilities;
> +	rkvdec->quirks =3D variant->quirks;
> =C2=A0	mutex_init(&rkvdec->vdev_lock);
> =C2=A0	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 8e1f8548eae4..e633a879e9bf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -26,6 +26,8 @@
> =C2=A0#define RKVDEC_CAPABILITY_H264		BIT(1)
> =C2=A0#define RKVDEC_CAPABILITY_VP9		BIT(2)
> =C2=A0
> +#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)

Can you go back in the series, get H264 into bit 0, VP9 into bit 1, and set
quirks from bit 16 ? Just worried the whole finding can becomes a mess in m=
any
years from now.

> +
> =C2=A0struct rkvdec_ctx;
> =C2=A0
> =C2=A0struct rkvdec_ctrl_desc {
> @@ -69,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0
> =C2=A0struct rkvdec_variant {
> =C2=A0	unsigned int capabilities;
> +	unsigned int quirks;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_coded_fmt_ops {
> @@ -121,6 +124,7 @@ struct rkvdec_dev {
> =C2=A0	struct delayed_work watchdog_work;
> =C2=A0	struct iommu_domain *empty_domain;
> =C2=A0	unsigned int capabilities;
> +	unsigned int quirks;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_ctx {

--=-XgQKcifX1OiDVJb6s0rw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJpfvQAKCRBxUwItrAao
HLVgAJsH8oUucLfcANkIKv4oo/Vz0zJLBwCeI2+6leJHXw15GvEeMoCS91Q9L84=
=9eMj
-----END PGP SIGNATURE-----

--=-XgQKcifX1OiDVJb6s0rw--


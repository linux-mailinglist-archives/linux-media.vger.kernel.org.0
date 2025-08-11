Return-Path: <linux-media+bounces-39466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52913B2171E
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DDA87B3F45
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0852E3373;
	Mon, 11 Aug 2025 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FsxeIC3D"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224862E2DEF;
	Mon, 11 Aug 2025 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946695; cv=none; b=Qf1ZV+j3Z4uaG+TnigiwaoKLBf0ZHtR9sZnK6kgq8qIQYI/iH2+BeOHCzKvLe24Xn/xyNyPSrbHGYYFnIVVWU1/79BaPDL+G1LnNdvuoLZdsGOtT7Gs6VNrHHu7jb+v7UzFx8JhMcayzv3EyD0X5YmXpmtNQYdouRCdmTMJgA5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946695; c=relaxed/simple;
	bh=LgOkvZy4JmT2XJ6YFz694QT5mtVOi6c/DJaxwgVLUNw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uHa/+w5iB3bu3++p04OqSeGmvpphCWxO4NJm8L9y04EiM46ui2ryiKAKjfJQxI9/5zDAqcAQDbyLXVDtsJDKxTrVbvI+HCAx6zyVp3UjMcRhaHAkCabqb782TBGRCzwY1g2UpFJer9R7c0ozXSs2ijg+juVVY7FXZ1x4jihV+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FsxeIC3D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754946691;
	bh=LgOkvZy4JmT2XJ6YFz694QT5mtVOi6c/DJaxwgVLUNw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FsxeIC3DANqd5ZhfTMLHr/vLeY0MIAQfNU7+CtbmzFj5LaHXkVd4prVLWTE74NGI6
	 /VHTEvOAzPacNDcpcxoAocx6v/u38AKc/LcKxLaoWe8yaNPTG30wJ+zQI+wG2MtsUX
	 w2r9ySOw9k8W73YDavKJB0W5Cb99rkGbSTwCCIVN847cpzkHc7r6CL7pfxsddDmGy1
	 1+9BBbJyO4cHR2ok5UnpvrFb2uj+AWEyIA4vEEqDAuH42r2E0P57moOOV0Bm0bOZN6
	 cA7PLx1YAHHgE/cHPwHuOQwbn3/AzszYVgm9Rfj+Wps9HQTImwQvMkdHjNza4IfUWp
	 By9FyqA7/ZSxg==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ABEDC17E00A6;
	Mon, 11 Aug 2025 23:11:29 +0200 (CEST)
Message-ID: <6476a0906402a5b6ea51801c7d7de1be13aa753c.camel@collabora.com>
Subject: Re: [PATCH v2 2/7] media: rkvdec: Add variants support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Detlev Casanova
 <detlev.casanova@collabora.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 17:11:28 -0400
In-Reply-To: <20250810212454.3237486-3-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-3-jonas@kwiboo.se>
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
	boundary="=-4ob5lfPBWiqj644CEky9"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-4ob5lfPBWiqj644CEky9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=A9cri=
t=C2=A0:
> From: Alex Bee <knaerzche@gmail.com>
>=20
> Different versions of the Rockchip VDEC IP exists and one way they can
> differ is what decoding formats are supported.
>=20
> Add a variant implementation in order to support flagging different
> capabilities.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - No change
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 21 ++++++=
++++++++++++-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 | 10 ++++++=
+++
> =C2=A02 files changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index cfb326600a2d..e7b9dfc2d1ab 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <linux/iommu.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> +#include <linux/of_device.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/pm.h>
> =C2=A0#include <linux/pm_runtime.h>
> @@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc
> rkvdec_coded_fmts[] =3D {
> =C2=A0		.ops =3D &rkvdec_hevc_fmt_ops,
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.capability =3D RKVDEC_CAPABILITY_HEVC,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> @@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc
> rkvdec_coded_fmts[] =3D {
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> =C2=A0		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability =3D RKVDEC_CAPABILITY_H264,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_VP9_FRAME,
> @@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc
> rkvdec_coded_fmts[] =3D {
> =C2=A0		.ops =3D &rkvdec_vp9_fmt_ops,
> =C2=A0		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
> =C2=A0		.decoded_fmts =3D rkvdec_vp9_decoded_fmts,
> +		.capability =3D RKVDEC_CAPABILITY_VP9,
> =C2=A0	}
> =C2=A0};
> =C2=A0
> @@ -1187,8 +1191,17 @@ static void rkvdec_watchdog_func(struct work_struc=
t
> *work)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static const struct rkvdec_variant rk3399_rkvdec_variant =3D {
> +	.capabilities =3D RKVDEC_CAPABILITY_HEVC |
> +			RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_VP9,
> +};
> +
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> -	{ .compatible =3D "rockchip,rk3399-vdec" },
> +	{
> +		.compatible =3D "rockchip,rk3399-vdec",
> +		.data =3D &rk3399_rkvdec_variant,
> +	},
> =C2=A0	{ /* sentinel */ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1199,16 +1212,22 @@ static const char * const rkvdec_clk_names[] =3D =
{
> =C2=A0
> =C2=A0static int rkvdec_probe(struct platform_device *pdev)
> =C2=A0{
> +	const struct rkvdec_variant *variant;
> =C2=A0	struct rkvdec_dev *rkvdec;
> =C2=A0	unsigned int i;
> =C2=A0	int ret, irq;
> =C2=A0
> +	variant =3D of_device_get_match_data(&pdev->dev);
> +	if (!variant)
> +		return -EINVAL;
> +
> =C2=A0	rkvdec =3D devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
> =C2=A0	if (!rkvdec)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, rkvdec);
> =C2=A0	rkvdec->dev =3D &pdev->dev;
> +	rkvdec->capabilities =3D variant->capabilities;
> =C2=A0	mutex_init(&rkvdec->vdev_lock);
> =C2=A0	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index c062c5c5bbb2..8e1f8548eae4 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -22,6 +22,10 @@
> =C2=A0#include <media/videobuf2-core.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> =C2=A0
> +#define RKVDEC_CAPABILITY_HEVC		BIT(0)
> +#define RKVDEC_CAPABILITY_H264		BIT(1)
> +#define RKVDEC_CAPABILITY_VP9		BIT(2)
> +
> =C2=A0struct rkvdec_ctx;
> =C2=A0
> =C2=A0struct rkvdec_ctrl_desc {
> @@ -63,6 +67,10 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
> =C2=A0			=C2=A0=C2=A0=C2=A0 base.vb.vb2_buf);
> =C2=A0}
> =C2=A0
> +struct rkvdec_variant {
> +	unsigned int capabilities;
> +};
> +
> =C2=A0struct rkvdec_coded_fmt_ops {
> =C2=A0	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0 struct v4l2_format *f);
> @@ -98,6 +106,7 @@ struct rkvdec_coded_fmt_desc {
> =C2=A0	unsigned int num_decoded_fmts;
> =C2=A0	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
> =C2=A0	u32 subsystem_flags;
> +	unsigned int capability;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {
> @@ -111,6 +120,7 @@ struct rkvdec_dev {
> =C2=A0	struct mutex vdev_lock; /* serializes ioctls */
> =C2=A0	struct delayed_work watchdog_work;
> =C2=A0	struct iommu_domain *empty_domain;
> +	unsigned int capabilities;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_ctx {

Should be simple to rebase Detlev branch on this.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

--=-4ob5lfPBWiqj644CEky9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJpcgAAKCRBxUwItrAao
HPOFAKCT39k8uSPBOkbzm22+zC2Ifh3IzwCgqcFkqJtyeg5Pg6Y2Zx9LHpHaAWQ=
=rO8P
-----END PGP SIGNATURE-----

--=-4ob5lfPBWiqj644CEky9--


Return-Path: <linux-media+bounces-50074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C0CFADCD
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 21:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A168E30151A6
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 20:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF162C08CA;
	Tue,  6 Jan 2026 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BaPnK1Nx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A918FDDE;
	Tue,  6 Jan 2026 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767730050; cv=none; b=BO0K2IDuy4MS+nXQFAVBNpWEIbR1d64cJhzvFV9aUHKBNj5HzIglZu7JXQRqS78sWAemWftUhYg+yi7H4nf7veQokzYHioT+gM9vZ62PiJkXc9PxwRdI89jZ3EVRp/lw5dvgzUwzMRkaRYlnUoPBhjBaBrY852bcXJb3hV5iMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767730050; c=relaxed/simple;
	bh=6vCvCpWevWY66jWQqRM/QOQ6GVMd9id6Itqb4gvVzdk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RVjnoI12Ib4xLvI7K3DMuGJQoaZDR2yhqzhW0GYgg8dhEDf3QzRu+wVQPTiWYOCUaEePccbMOLqOKV3ssS2yrZiYGMZxapHTwncQ7AyOrGTTcI56EhI/qm+q4QINLVfgFCxIFJ/bO+6DDis6fdZ9dbNTLwLZTNDkpcqoPYPoY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BaPnK1Nx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767730040;
	bh=6vCvCpWevWY66jWQqRM/QOQ6GVMd9id6Itqb4gvVzdk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BaPnK1NxjtdpF/Dn8oFg1gj90KZdYCLea3LJNrpuGZCgmLRknjkeOjF/QJTfGFURT
	 3GmViWfd7J6vyutO1xSqDHXjV7iPuxKsfkBNRVcKsSgS4hsOKPZZ/vLSv4PFs094g2
	 9jFf3FJyU2TbcTvs8pB2aGoLSFFJDJM/EaH9oDb8sHvUd6Hh76xPcxpJdNPQERW6st
	 HfWDvgzJcViZ8DpFyg+IIyI9tq8bmgsHfpIFu1vAJiEQuDPLplkA5vP4SAeOUDsCkO
	 c0YvGwUmZKMcxNavo6S7071ui01HsryQ1U2slYKErDImJXwpsP9P9mN5pg3EjTMQZs
	 rAQF284RmGF6w==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C17C17E0CB0;
	Tue,  6 Jan 2026 21:07:18 +0100 (CET)
Message-ID: <70d2b73a4ec06bef75d7f4ad415ad654cf80ecf6.camel@collabora.com>
Subject: Re: [PATCH v10 5/7] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
 mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Date: Tue, 06 Jan 2026 15:07:15 -0500
In-Reply-To: <20251215085349.10155-6-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
	 <20251215085349.10155-6-benjamin.gaignard@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NsLgZPrOWbKHfJXnykTm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-NsLgZPrOWbKHfJXnykTm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 15 d=C3=A9cembre 2025 =C3=A0 09:53 +0100, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> AV1 is a stateless decoder which means multiple AV1 bitstreams could be
> decoded at the same time using the same hardware block. Before decoding
> a frame it is needed to restore the iommu tables to avoid mixing decode
> contexts.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

With the config fix you mentioned earlier, you can add my Rb in the next
revision please.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes in version 10:
> - Fix build as module issue when Verisilicon video decoder is built-in.
>=20
> =C2=A0drivers/media/platform/verisilicon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +++++++++++++++
> =C2=A02 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/p=
latform/verisilicon/Kconfig
> index 3272a24db71d..e64bc8b55235 100644
> --- a/drivers/media/platform/verisilicon/Kconfig
> +++ b/drivers/media/platform/verisilicon/Kconfig
> @@ -49,6 +49,7 @@ config VIDEO_HANTRO_ROCKCHIP
> =C2=A0	bool "Hantro VPU Rockchip support"
> =C2=A0	depends on VIDEO_HANTRO
> =C2=A0	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	select VSI_IOMMU
> =C2=A0	default y
> =C2=A0	help
> =C2=A0	=C2=A0 Enable support for RK3288, RK3328, and RK3399 SoCs.
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4703bb6be7c..d9e68e0ded68 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -5,6 +5,9 @@
> =C2=A0 * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> =C2=A0 */
> =C2=A0
> +#include <linux/iommu.h>
> +#include <linux/vsi-iommu.h>
> +
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include "hantro.h"
> =C2=A0#include "hantro_v4l2.h"
> @@ -2095,12 +2098,24 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct =
hantro_ctx *ctx)
> =C2=A0	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
> =C2=A0}
> =C2=A0
> +static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
> +{
> +	struct iommu_domain *domain;
> +
> +	/* Before decoding any frame iommu context need to be restored */
> +	domain =3D iommu_get_domain_for_dev(ctx->dev->v4l2_dev.dev);
> +	if (domain)
> +		vsi_iommu_restore_ctx(domain);
> +}
> +
> =C2=A0int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct vb2_v4l2_buffer *vb2_src;
> =C2=A0	int ret;
> =C2=A0
> +	rockchip_vpu981_av1_restore_iommu(ctx);
> +
> =C2=A0	hantro_start_prepare_run(ctx);
> =C2=A0
> =C2=A0	ret =3D rockchip_vpu981_av1_dec_prepare_run(ctx);

--=-NsLgZPrOWbKHfJXnykTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV1rcwAKCRDZQZRRKWBy
9D3iAP4vmq6NU5wkVXjJbhK2nVtJnaeTvw32c9vlufHhZ1L3FQD/YCmEiCWo2Nbq
RsSiwxIPnq6ptHDWPcgpHrAsxpfPuw0=
=mryd
-----END PGP SIGNATURE-----

--=-NsLgZPrOWbKHfJXnykTm--


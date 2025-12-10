Return-Path: <linux-media+bounces-48591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE0CB3F6B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54C60302F6BA
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CF632C306;
	Wed, 10 Dec 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G3fBVdrm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634BD235C01;
	Wed, 10 Dec 2025 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398775; cv=none; b=q45YFsL8g1BU9eJ9OAofgUaz8s+g/oe5YqeA56FkElsKoDZxB9+OMzSDSiJ3IAe3+s3nxMSeCurMkMRdcpHK7t7GaoyTmMuOZC7eLMJ36YsBO8wLppqbFD/LY2JXgAkRj69yq/IWCE96yWBDi4sa6DCQkrfBg6bT06ameeY7KQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398775; c=relaxed/simple;
	bh=dxfkb2905nkOLVc7IuwWxEn2OXp4HgYDmbKPKcGvUGc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MtpPYAu+Lnz4decCqUWLCDizvFDRMVAJTP/r3unZ877ncBzW7m0oQ4qrizo8750WROJHr1an2wYHrC27xdXYejIKRhI4AAERUXvHtlDJ5POikKkRl1v6TLdH9nRWDpuID8xUyfAwVvgJ7IcCKmGnY/8JqAh3XrpShDwwCfmYWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G3fBVdrm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765398770;
	bh=dxfkb2905nkOLVc7IuwWxEn2OXp4HgYDmbKPKcGvUGc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=G3fBVdrmIVfBkrHOP+cbWKtzCBmTKIzh2OloycmVau3F10OpzmoEMpTKe/LNzwVkD
	 362OH5OKxt7YsFim4WM/6FHZJmS3GxYd+UBxIlOVSbe6uSu4ai9wPrMn6cixY4oDZy
	 4UUegQJxvE9ZwXwifls6w96jEKlMQhS5eFDmshpt5AF7cNtKv9HlfJHvpQKh2FT3PP
	 kc2cTSms8XOlIxz4ZAYwwTzR1/HIBPdLsWewWw12KlBXTyvP52jpOmIWA+SAjIFX7O
	 oDcx0GZfso1JGdsDTBU0Q6fZOCPiZMARsPilf/0pcMxJbvtzg+KqihNpiRVkOe2UIN
	 pIvAtoEOwM3pg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 920B317E10F3;
	Wed, 10 Dec 2025 21:32:48 +0100 (CET)
Message-ID: <47c0290d3dce59988d6db1fc8d8fb6d45f5e68ab.camel@collabora.com>
Subject: Re: [PATCH v4 09/15] media: rkvdec: Add RCB and SRAM support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:32:47 -0500
In-Reply-To: <20251022174508.284929-10-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-10-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-lZn77EKWktzdCgXqtbUt"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-lZn77EKWktzdCgXqtbUt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The RCB (Rows and Cols Buffers) are a set of buffers used by other
> variations of the decoder to store temporary data.
>=20
> Those variation come with a dedicated SRAM area used to store those
> buffers for better performances.
>=20
> The buffer sizes are either the width or height of the frame being
> decoded multiplied by a documented factor and can be stored either
> in SRAM or RAM.
> A fallback to RAM is provided if the SRAM is full (e.g.: multiple
> streams are being decoded at the same time).
>=20
> To manage the different kind of allocation, an enum is added to the
> rkvdec_aux_buf struct to specify how the buffer was allocated, and
> so, how to free it.
>=20
> This commit is in preparation of other variants support.
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-rcb.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 173 ++++++++++++++++++
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-rcb.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 29 +++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0 27 =
++-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0 13 =
++
> =C2=A05 files changed, 241 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rc=
b.c
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-rc=
b.h
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index 1b4bc44be23e..3d75103e536d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -7,4 +7,5 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-h264-common.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-hevc-common.o \
> +		=C2=A0=C2=A0 rkvdec-rcb.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> new file mode 100644
> index 000000000000..5a4959c239e3
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder Rows and Cols Buffers manager
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include "rkvdec.h"
> +#include "rkvdec-rcb.h"
> +
> +#include <linux/types.h>
> +#include <linux/iommu.h>
> +#include <linux/genalloc.h>
> +
> +struct rkvdec_rcb_config {
> +	struct rkvdec_aux_buf *rcb_bufs;
> +	size_t rcb_count;
> +};
> +
> +static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int width, unsigned int heigh=
t)
> +{
> +	return size_info->multiplier * (size_info->axis =3D=3D PIC_HEIGHT ? hei=
ght : width);
> +}
> +
> +dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id)
> +{
> +	return ctx->rcb_config->rcb_bufs[id].dma;
> +}
> +
> +size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id)
> +{
> +	return ctx->rcb_config->rcb_bufs[id].size;
> +}
> +
> +int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
> +{
> +	return ctx->rcb_config->rcb_count;
> +}
> +
> +void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *dev =3D ctx->dev;
> +	struct rkvdec_rcb_config *cfg =3D ctx->rcb_config;
> +	unsigned long virt_addr;
> +	int i;
> +
> +	if (!cfg)
> +		return;
> +
> +	for (i =3D 0; i < cfg->rcb_count; i++) {
> +		size_t rcb_size =3D cfg->rcb_bufs[i].size;
> +
> +		if (!cfg->rcb_bufs[i].cpu)
> +			continue;
> +
> +		switch (cfg->rcb_bufs[i].type) {
> +		case RKVDEC_ALLOC_SRAM:
> +			virt_addr =3D (unsigned long)cfg->rcb_bufs[i].cpu;
> +
> +			if (dev->iommu_domain)
> +				iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
> +			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
> +			break;
> +		case RKVDEC_ALLOC_DMA:
> +			dma_free_coherent(dev->dev,
> +					=C2=A0 rcb_size,
> +					=C2=A0 cfg->rcb_bufs[i].cpu,
> +					=C2=A0 cfg->rcb_bufs[i].dma);
> +			break;
> +		}
> +	}
> +
> +	if (cfg->rcb_bufs)
> +		devm_kfree(dev->dev, cfg->rcb_bufs);
> +
> +	devm_kfree(dev->dev, cfg);
> +}
> +
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +			const struct rcb_size_info *size_info,
> +			size_t rcb_count)
> +{
> +	int ret, i;
> +	u32 width, height;
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_rcb_config *cfg;
> +
> +	ctx->rcb_config =3D devm_kzalloc(rkvdec->dev, sizeof(*ctx->rcb_config),=
 GFP_KERNEL);
> +	if (!ctx->rcb_config)
> +		return -ENOMEM;
> +
> +	cfg =3D ctx->rcb_config;
> +
> +	cfg->rcb_bufs =3D devm_kzalloc(rkvdec->dev, sizeof(*cfg->rcb_bufs) * rc=
b_count, GFP_KERNEL);
> +	if (!cfg->rcb_bufs) {
> +		ret =3D -ENOMEM;
> +		goto err_alloc;
> +	}
> +
> +	width =3D ctx->decoded_fmt.fmt.pix_mp.width;
> +	height =3D ctx->decoded_fmt.fmt.pix_mp.height;
> +
> +	for (i =3D 0; i < rcb_count; i++) {
> +		void *cpu =3D NULL;
> +		dma_addr_t dma;
> +		size_t rcb_size =3D rkvdec_rcb_size(&size_info[i], width, height);
> +		enum rkvdec_alloc_type alloc_type =3D RKVDEC_ALLOC_SRAM;
> +
> +		/* Try allocating an SRAM buffer */
> +		if (ctx->dev->sram_pool) {
> +			if (rkvdec->iommu_domain)
> +				rcb_size =3D ALIGN(rcb_size, 0x1000);
> +
> +			cpu =3D gen_pool_dma_zalloc_align(ctx->dev->sram_pool,
> +							rcb_size,
> +							&dma,
> +							0x1000);
> +		}
> +
> +		/* If an IOMMU is used, map the SRAM address through it */
> +		if (cpu && rkvdec->iommu_domain) {
> +			unsigned long virt_addr =3D (unsigned long)cpu;
> +			phys_addr_t phys_addr =3D dma;
> +
> +			ret =3D iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
> +					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
> +			if (ret) {
> +				gen_pool_free(ctx->dev->sram_pool,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)cpu,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcb_size);
> +				cpu =3D NULL;
> +				goto ram_fallback;
> +			}
> +
> +			/*
> +			 * The registers will be configured with the virtual
> +			 * address so that it goes through the IOMMU
> +			 */
> +			dma =3D virt_addr;
> +		}
> +
> +ram_fallback:
> +		/* Fallback to RAM */
> +		if (!cpu) {
> +			cpu =3D dma_alloc_coherent(ctx->dev->dev,

Some dev_dbg would be nice, looks like its going to run slower, so having a=
 way
to detect it during integration would be helpful. Also, something to be che=
cked
on RK3576, RK3566 and RK3568 were users seems to report that it runs fine, =
but
under perform.

> +						 rcb_size,
> +						 &dma,
> +						 GFP_KERNEL);
> +			alloc_type =3D RKVDEC_ALLOC_DMA;
> +		}
> +
> +		if (!cpu) {
> +			ret =3D -ENOMEM;
> +			goto err_alloc;
> +		}
> +
> +		cfg->rcb_bufs[i].cpu =3D cpu;
> +		cfg->rcb_bufs[i].dma =3D dma;
> +		cfg->rcb_bufs[i].size =3D rcb_size;
> +		cfg->rcb_bufs[i].type =3D alloc_type;
> +
> +		cfg->rcb_count +=3D 1;
> +	}
> +
> +	return 0;
> +
> +err_alloc:
> +	rkvdec_free_rcb(ctx);
> +
> +	return ret;
> +}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> new file mode 100644
> index 000000000000..30e8002555c8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip video decoder Rows and Cols Buffers manager
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +
> +struct rkvdec_ctx;
> +
> +enum rcb_axis {
> +	PIC_WIDTH =3D 0,
> +	PIC_HEIGHT =3D 1
> +};
> +
> +struct rcb_size_info {
> +	u8 multiplier;
> +	enum rcb_axis axis;
> +};
> +
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +			const struct rcb_size_info *size_info,
> +			size_t rcb_count);
> +dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
> +size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
> +int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
> +void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index a7af1e3fdebd..5dd486edd64d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -10,6 +10,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/clk.h>
> +#include <linux/genalloc.h>
> =C2=A0#include <linux/interrupt.h>
> =C2=A0#include <linux/iommu.h>
> =C2=A0#include <linux/module.h>
> @@ -28,6 +29,7 @@
> =C2=A0
> =C2=A0#include "rkvdec.h"
> =C2=A0#include "rkvdec-regs.h"
> +#include "rkvdec-rcb.h"
> =C2=A0
> =C2=A0static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> =C2=A0				=C2=A0=C2=A0 enum rkvdec_image_fmt fmt2)
> @@ -771,6 +773,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q=
, unsigned int count)
> =C2=A0{
> =C2=A0	struct rkvdec_ctx *ctx =3D vb2_get_drv_priv(q);
> =C2=A0	const struct rkvdec_coded_fmt_desc *desc;
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -780,13 +783,22 @@ static int rkvdec_start_streaming(struct vb2_queue =
*q, unsigned int count)
> =C2=A0	if (WARN_ON(!desc))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	ret =3D rkvdec_allocate_rcb(ctx, cfg->rcb_size_info, cfg->rcb_num);

Shouldn't this be conditional ? I read your commit message as only new vari=
ants
needs that.

Nicolas

> +	if (ret)
> +		return ret;
> +
> =C2=A0	if (desc->ops->start) {
> =C2=A0		ret =3D desc->ops->start(ctx);
> =C2=A0		if (ret)
> -			return ret;
> +			goto err_ops_start;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> +
> +err_ops_start:
> +	rkvdec_free_rcb(ctx);
> +
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void rkvdec_queue_cleanup(struct vb2_queue *vq, u32 state)
> @@ -822,6 +834,8 @@ static void rkvdec_stop_streaming(struct vb2_queue *q=
)
> =C2=A0
> =C2=A0		if (desc->ops->stop)
> =C2=A0			desc->ops->stop(ctx);
> +
> +		rkvdec_free_rcb(ctx);
> =C2=A0	}
> =C2=A0
> =C2=A0	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> @@ -1350,6 +1364,10 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	rkvdec->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +	if (!rkvdec->sram_pool && rkvdec->variant->config->rcb_num > 0)
> +		dev_info(&pdev->dev, "No sram node, RCB will be stored in RAM\n");
> +
> =C2=A0	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> =C2=A0	pm_runtime_use_autosuspend(&pdev->dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> @@ -1358,7 +1376,8 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0	if (ret)
> =C2=A0		goto err_disable_runtime_pm;
> =C2=A0
> -	if (iommu_get_domain_for_dev(&pdev->dev)) {
> +	rkvdec->iommu_domain =3D iommu_get_domain_for_dev(&pdev->dev);
> +	if (rkvdec->iommu_domain) {
> =C2=A0		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec->dev);
> =C2=A0
> =C2=A0		if (IS_ERR(rkvdec->empty_domain)) {
> @@ -1372,6 +1391,10 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0err_disable_runtime_pm:
> =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> =C2=A0	pm_runtime_disable(&pdev->dev);
> +
> +	if (rkvdec->sram_pool)
> +		gen_pool_destroy(rkvdec->sram_pool);
> +
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 3b1cc511412e..74f71542e031 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -19,6 +19,7 @@
> =C2=A0#include <media/v4l2-ctrls.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/videobuf2-core.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> =C2=A0
> @@ -29,6 +30,7 @@
> =C2=A0#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
> =C2=A0
> =C2=A0struct rkvdec_ctx;
> +struct rkvdec_rcb_config;
> =C2=A0
> =C2=A0struct rkvdec_ctrl_desc {
> =C2=A0	struct v4l2_ctrl_config cfg;
> @@ -117,6 +119,8 @@ struct rkvdec_coded_fmt_desc {
> =C2=A0struct rkvdec_config {
> =C2=A0	const struct rkvdec_coded_fmt_desc *coded_fmts;
> =C2=A0	size_t coded_fmts_num;
> +	const struct rcb_size_info *rcb_size_info;
> +	size_t rcb_num;
> =C2=A0};
> =C2=A0
> =C2=A0struct rkvdec_dev {
> @@ -129,6 +133,8 @@ struct rkvdec_dev {
> =C2=A0	void __iomem *regs;
> =C2=A0	struct mutex vdev_lock; /* serializes ioctls */
> =C2=A0	struct delayed_work watchdog_work;
> +	struct gen_pool *sram_pool;
> +	struct iommu_domain *iommu_domain;
> =C2=A0	struct iommu_domain *empty_domain;
> =C2=A0	const struct rkvdec_variant *variant;
> =C2=A0};
> @@ -141,6 +147,7 @@ struct rkvdec_ctx {
> =C2=A0	struct v4l2_ctrl_handler ctrl_hdl;
> =C2=A0	struct rkvdec_dev *dev;
> =C2=A0	enum rkvdec_image_fmt image_fmt;
> +	struct rkvdec_rcb_config *rcb_config;
> =C2=A0	void *priv;
> =C2=A0};
> =C2=A0
> @@ -149,10 +156,16 @@ static inline struct rkvdec_ctx *file_to_rkvdec_ctx=
(struct file *filp)
> =C2=A0	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
> =C2=A0}
> =C2=A0
> +enum rkvdec_alloc_type {
> +	RKVDEC_ALLOC_DMA=C2=A0 =3D 0,
> +	RKVDEC_ALLOC_SRAM =3D 1,
> +};
> +
> =C2=A0struct rkvdec_aux_buf {
> =C2=A0	void *cpu;
> =C2=A0	dma_addr_t dma;
> =C2=A0	size_t size;
> +	enum rkvdec_alloc_type type;
> =C2=A0};
> =C2=A0
> =C2=A0void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run =
*run);

--=-lZn77EKWktzdCgXqtbUt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnY7wAKCRDZQZRRKWBy
9EarAP4wNQxa6UoKgl1NpHCDPaw2R9taIbPT5KlZAV4BM6ct4AD7Bctf3COkCs/7
f2c/B0KlGUkbuKQxqXMVhq9hzSNIJwg=
=f92+
-----END PGP SIGNATURE-----

--=-lZn77EKWktzdCgXqtbUt--


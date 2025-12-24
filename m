Return-Path: <linux-media+bounces-49502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A771CDCDF9
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 17:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB9A301C976
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 16:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B24A30DD2C;
	Wed, 24 Dec 2025 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="C0Ek2GO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B32356C6
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766594068; cv=none; b=WUr/h4Nr5ZNd0h11FJRszudz1Cqha8PqX/O7A1vvxWoGhNp69k8dwHnIfXHmLVxmmzbDD0RNGy66W9eA6n/FI//aWelUxRfFLWH2EKS0l1glA4udSw3gHboqotxFT+bfm8jEx3Gh7CmnYpSh3+auC4YRRynBa4ipAzAin8Dmegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766594068; c=relaxed/simple;
	bh=K45OUKbGqIpwH4APQGCxghx4Cg466B8BqaU4KIcpQmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJCsTna7SUquFNUKYMEGplwpH3QTOnW/ARlgKJldUDlhrMePY/DI2NlM4xlCI0UtnQjOlZLT9L3r/BlgSqsXdoWJccfXoPP8aH9ES0CUBgBE1MeMrUjKGdhJlnfAbWj3P5mFhxbMUPsl3qUvvyFYc0M/ezUJFy5rS3AMcRlAuN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=C0Ek2GO4; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8886fdf674bso72845276d6.2
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766594063; x=1767198863; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sWxGGNzZcpIP0TVltQ+NpjUIkoiFelwW5kt52uenOKo=;
        b=C0Ek2GO4T6MTkRTrTi1glVwkASmomuIZwo+HoW0qFF925KFDChlsMjxAuhE6Zb+/vC
         ynfQQFybGSQGPzdIsHGe7cZ9vWl/+pul1I2uiHPFStJxpa071KtUD5lV+TmE9ENr5qNK
         CObhUZ1guPsGbpuL2T7zw5diXZISsCV1mLJKU9QQ7Pzuwjgsse583VPC/uKr1hY6RKLl
         GTlU8NxcyKu3KDxMpOK9F4eRKamQk/QPMY5csL4b/y3vg/jpiEjkM3lPqK4aq5IFRoND
         +sK6ZniuWu4wDR0rD4NszBLzAhktycmrRZ5JkSWtdL7halGppnAoYjVMB0AngAmoZvmk
         Ik6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766594063; x=1767198863;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWxGGNzZcpIP0TVltQ+NpjUIkoiFelwW5kt52uenOKo=;
        b=mPho1Z3sn5BoFJHDCy4NjVn5bAZ7/sEdas7dnCPdUGiSIH1nB/0DbC42zLbVG/cuDD
         FKOLlHi7nGW3KqdcY0gK45qxJ+g4WRYqPLWGeSfhMXCSAOvptQ0fvuufLLI1zL4qPXC/
         EBIdrpPPKttR/gPFsK4sFYiAJJb7Ia7myftZezg2qOCt6qpnjXk8MMWt/XJ+NCq3+YCI
         NmbXlaHsVskrYVz674uD0Ts4Xoe2olPPu9+DihS/SpMz3wuGiUbBRPDIxZPPoQDzw3XW
         GoPXNRVFVQUWFY6LF0n74cE9k/T6OpNjiMbsiPHmpn4bWoyQ0dg4P/w1OV5wqGaFoP8B
         qZlA==
X-Gm-Message-State: AOJu0Yyyk5bl0Vb9x4E1a8Fo2+k2oTIA8OUAfHCUBTBDaRu3mMAMNK1q
	e7uv2o4A7asHqRJyg3FIjJ8S7TjGzdP7+mvdc5IehS24AuPgYZpD2FCKz+Gk3ejVXws=
X-Gm-Gg: AY/fxX6zeJEHs8xuZXmH3DEGij2EY/Vs0KJph7kF8q5Lmv0ApwGfNht63TDshGkggs+
	9HiF5JIhjEW8dhoNs7rlQu5s5AIjeiXuN8OUMGmEaI1WjBYiXXsNQr85wE2dMtvapaKpesm8doI
	kRfNl27avIApwWbkS/loAdmKkXK24AsOobGGMUN1MPw8UaKKZVnuejNZ8wBHUPOD7Gu91kSkQsu
	zRbaF6cE63iAuCV5F46pvoCzDs/THumTUpNPoXzE9K7JqujfPukYafUeorKw70QrvbgugNWqSz2
	bJ+tIQjrFrMdcwj/f+zKCWsJbnE9SEp3vTXK9AFi3+5a/9FUgyEo3iKuKYK3TM9JVtM0MucmA2Y
	wPAgbVYwZTkpSCkUT3UbEOo5Rx3XIovOWLQFsIp8vbtrMuM4cpwpWrHp+rZZDvY16Q9xR5k7DxF
	LgIaXBCgJJceD6DVfq
X-Google-Smtp-Source: AGHT+IERsVOXRKVeW+9Gdi4Me/WysLmnInj34tEjzmnqo4CShwxnrDn1lxFr6XOevdsar/ata8xlXw==
X-Received: by 2002:a05:6214:2305:b0:87c:1889:6a7f with SMTP id 6a1803df08f44-88d8166a009mr309308166d6.5.1766594063417;
        Wed, 24 Dec 2025 08:34:23 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66e01csm127798991cf.34.2025.12.24.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:34:22 -0800 (PST)
Message-ID: <e85f35648ce5d4b969d7305c8cde0a21488a2340.camel@ndufresne.ca>
Subject: Re: [PATCH v2 21/22] media: rockchip: rga: add rga3 support
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
Date: Wed, 24 Dec 2025 11:34:20 -0500
In-Reply-To: <20251203-spu-rga3-v2-21-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-21-989a67947f71@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-whAzw988VqekGgm+cthZ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-whAzw988VqekGgm+cthZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Add support for the RGA3 unit contained in the RK3588.
>=20
> Only a basic feature set consisting of scaling and color conversion is
> implemented. Also the BT601F color space conversion is currently hard
> coded. Currently unimplemented features include:
> - Advanced formats like 10bit YUV, FBCE mode and Tile8x8 mode
> - Colorspace conversions functions BT601L, BT709, BT2020

This one I already raised in v1 as problematic omission. I applied the chan=
ges
locally and just ran few conversions that I saved to PNG, and I could
immediately see that range handling and colors are all over the place. Comp=
aring
reference against conversion very often show difference in brighness or sma=
ll
discoloration. On top of which, the compliance is failing.

More investigation needed, but I suspect the implementation is a little too
loose. Not handling any of it while accepting to do YCbCr to RGB (or vis-ve=
rsa)
incorrect and should be fixed.

> - Background color (V4L2_CID_BG_COLOR)
> - Configurable alpha value (V4L2_CID_ALPHA_COMPONENT)
> - Image flipping (V4L2_CID_HFLIP and V4L2_CID_VFLIP)
> - Image rotation (V4L2_CID_ROTATE)
> - Image cropping/composing (VIDIOC_S_SELECTION)
>=20
> The register address defines were copied from the
> vendor Rockchip kernel sources and slightly adjusted to not start at 0
> again for the cmd registers.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0 |=C2=A0=C2=A0 2 =
+-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 471 +++++++++++++++=
+++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h | 190 +++++++++++
> =C2=A05 files changed, 667 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/Makefile b/drivers/media=
/platform/rockchip/rga/Makefile
> index 1bbecdc3d8df2..7326a548f3dc7 100644
> --- a/drivers/media/platform/rockchip/rga/Makefile
> +++ b/drivers/media/platform/rockchip/rga/Makefile
> @@ -1,4 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> -rockchip-rga-objs :=3D rga.o rga-hw.o rga-buf.o
> +rockchip-rga-objs :=3D rga.o rga-hw.o rga3-hw.o rga-buf.o
> =C2=A0
> =C2=A0obj-$(CONFIG_VIDEO_ROCKCHIP_RGA) +=3D rockchip-rga.o
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 65686228b7300..313d875c789bf 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -843,6 +843,10 @@ static const struct of_device_id rockchip_rga_match[=
] =3D {
> =C2=A0		.compatible =3D "rockchip,rk3399-rga",
> =C2=A0		.data =3D &rga2_hw,
> =C2=A0	},
> +	{
> +		.compatible =3D "rockchip,rk3588-rga3",
> +		.data =3D &rga3_hw,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index b9c75b5fda4dc..2c5f0330879fa 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -163,6 +163,6 @@ static inline bool rga_has_internal_iommu(const struc=
t rockchip_rga *rga)
> =C2=A0	return rga->hw->has_internal_iommu;
> =C2=A0}
> =C2=A0
> -extern const struct rga_hw rga2_hw;
> +extern const struct rga_hw rga2_hw, rga3_hw;

nit: Add a line instead.

> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> new file mode 100644
> index 0000000000000..2b8cd639da39b
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -0,0 +1,471 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Pengutronix e.K.

No year ?

> + * Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/printk.h>
> +
> +#include <media/v4l2-common.h>
> +
> +#include "rga3-hw.h"
> +#include "rga.h"
> +
> +static unsigned int rga3_get_scaling(unsigned int src, unsigned int dst)
> +{
> +	/*
> +	 * RGA3 scaling factor calculation as described in chapter 5.4.7 Resize
> +	 * of the TRM Part 2. The resulting scaling factor is a 16-bit value
> +	 * and therefore normalized with 2^16.
> +	 *
> +	 * While the TRM also mentions (dst-1)/(src-1) for the up-scaling case,
> +	 * it didn't work as the value always exceeds 16 bit. Flipping the
> +	 * factors results in a correct up-scaling. This is possible as the
> +	 * RGA3 has the RGA3_WIN_SCALE_XXX_UP bit to determine if it does
> +	 * an up or downscale.
> +	 *
> +	 * With a scaling factor of 1.0 the calculation technically also
> +	 * overflows 16 bit. This isn't relevant, as in this case the
> +	 * RGA3_WIN_SCALE_XXX_BYPASS bit completely skips the scaling operation=
.
> +	 */
> +	if (dst > src) {
> +		if (((src - 1) << 16) % (dst - 1) =3D=3D 0)
> +			return ((src - 1) << 16) / (dst - 1) - 1;
> +		else
> +			return ((src - 1) << 16) / (dst - 1);
> +	} else {
> +		return ((dst - 1) << 16) / (src - 1) + 1;
> +	}
> +}
> +
> +/*
> + * Check if the given format can be captured, as the RGA3 doesn't suppor=
t all
> + * input formats also on it's output.
> + */
> +static bool rga3_can_capture(const struct rga3_fmt *fmt)
> +{
> +	return fmt->hw_format <=3D RGA3_COLOR_FMT_LAST_OUTPUT;
> +}
> +
> +/*
> + * Map the transformations to the RGA3 command buffer.
> + * Currently this is just the scaling settings and a fixed alpha value.
> + */
> +static void rga3_cmd_set_trans_info(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int src_h, src_w, dst_h, dst_w;
> +	unsigned int reg;
> +	u16 hor_scl_fac, ver_scl_fac;
> +	const struct rga3_fmt *in =3D ctx->in.fmt;
> +
> +	src_h =3D ctx->in.pix.height;
> +	src_w =3D ctx->in.pix.width;
> +	dst_h =3D ctx->out.pix.height;
> +	dst_w =3D ctx->out.pix.width;

These are padded dimensions, I think there should be code here that go pick=
 from
the selection rectangles. Can't skip that, its way too common to have 1088 =
src_h
as an example. Otherwise, its not clear what will be result of using a scal=
ing
factor while doing 1088 -> 1080, where the 8 lines are actually padding.

> +
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_SCALE_HOR_UP, dst_w > src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_HOR_B=
YPASS, dst_w =3D=3D src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_VER_U=
P, dst_h > src_h)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_VER_B=
YPASS, dst_h =3D=3D src_h);
> +
> +	hor_scl_fac =3D rga3_get_scaling(src_w, dst_w);
> +	ver_scl_fac =3D rga3_get_scaling(src_h, dst_h);
> +	reg =3D RGA3_WIN0_SCL_FAC - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_SCALE_HOR_FAC, hor_scl_fac)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_SCALE_VER_FAC, ver_sc=
l_fac);
> +
> +	if (v4l2_format_info(in->fourcc)->has_alpha) {
> +		/* copy alpha from input */
> +		reg =3D RGA3_OVLP_TOP_ALPHA - RGA3_FIRST_CMD_REG;
> +		cmd[reg >> 2] =3D FIELD_PREP(RGA3_ALPHA_SELECT_MODE, 1)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_ALPHA_BLEND_MODE, 1)=
;
> +		reg =3D RGA3_OVLP_BOT_ALPHA - RGA3_FIRST_CMD_REG;
> +		cmd[reg >> 2] =3D FIELD_PREP(RGA3_ALPHA_SELECT_MODE, 1)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_ALPHA_BLEND_MODE, 1)=
;
> +	} else {
> +		/* just use a 255 alpha value */
> +		reg =3D RGA3_OVLP_TOP_CTRL - RGA3_FIRST_CMD_REG;
> +		cmd[reg >> 2] =3D FIELD_PREP(RGA3_OVLP_GLOBAL_ALPHA, 0xff)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_OVLP_COLOR_MODE, 1);
> +		reg =3D RGA3_OVLP_BOT_CTRL - RGA3_FIRST_CMD_REG;
> +		cmd[reg >> 2] =3D FIELD_PREP(RGA3_OVLP_GLOBAL_ALPHA, 0xff)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_OVLP_COLOR_MODE, 1);
> +	}
> +}
> +
> +static void rga3_cmd_set_win0_addr(struct rga_ctx *ctx,
> +				=C2=A0=C2=A0 const struct rga_addrs *addrs)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WIN0_Y_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->y_addr;
> +	reg =3D RGA3_WIN0_U_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->u_addr;
> +}
> +
> +static void rga3_cmd_set_wr_addr(struct rga_ctx *ctx,
> +				 const struct rga_addrs *addrs)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WR_Y_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->y_addr;
> +	reg =3D RGA3_WR_U_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->u_addr;
> +}
> +
> +/* Map the input pixel format to win0 of the comamnd buffer. */
> +static void rga3_cmd_set_win0_format(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	const struct rga3_fmt *in =3D ctx->in.fmt;
> +	const struct rga3_fmt *out =3D ctx->out.fmt;
> +	const struct v4l2_format_info *in_fmt, *out_fmt;
> +	unsigned int src_h, src_w;
> +	bool r2y, y2r;
> +	u8 rd_format;
> +	unsigned int reg;
> +
> +	src_h =3D ctx->in.pix.height;
> +	src_w =3D ctx->in.pix.width;
> +
> +	in_fmt =3D v4l2_format_info(in->fourcc);
> +	out_fmt =3D v4l2_format_info(out->fourcc);
> +	r2y =3D v4l2_is_format_rgb(in_fmt) && v4l2_is_format_yuv(out_fmt);
> +	y2r =3D v4l2_is_format_yuv(in_fmt) && v4l2_is_format_rgb(out_fmt);
> +
> +	if (in->semi_planar)
> +		rd_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> +	else
> +		rd_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> +
> +	/* set pixel format and CSC */
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_PIC_FORMAT, in->hw_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_YC_SWAP, in=
->yc_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_RBUV_SWAP, =
in->rbuv_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_RD_FORMAT, =
rd_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_R2Y, r2y)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_Y2R, y2r)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_CSC_MODE, R=
GA3_WIN_CSC_MODE_BT601_F);

I'd say don't hardcode BT601 Full-Range. This in fact explains a lot of the
weird stuff I've seen so far.

This IP is extremely limited in CSC, it would be good to limite the choice =
in
try_fmt. Basically BT601 is the only thing that support full range, where t=
he
more common BT709 and 2020 coeffiicent are most commonly used. Fortunatly,
limited range is more common, I can only guess, but RGB is likely always fu=
ll
range.

I'm guessing when doing YCbCr to YCbCr the CSC is untouched. Make sure the
capture and output format reflects that.

Nicolas

> +
> +	/* set stride */
> +	reg =3D RGA3_WIN0_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	/* stride needs to be in words */
> +	cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[0].bytesperline >> 2;
> +	reg =3D RGA3_WIN0_UV_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	/* The Hardware only supports formats with 1/2 planes */
> +	if (ctx->in.pix.num_planes =3D=3D 2)
> +		cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[1].bytesperline >> 2;
> +	else
> +		cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[0].bytesperline >> 2;
> +
> +	/* set size */
> +	reg =3D RGA3_WIN0_ACT_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, src_h);
> +	/* no cropping support. Use same value as ACT_SIZE */
> +	reg =3D RGA3_WIN0_SRC_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, src_h);
> +}
> +
> +static void rga3_cmd_enable_win0(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_ENABLE, 1);
> +}
> +
> +/* Map the output pixel format to the command buffer */
> +static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	const struct rga3_fmt *out =3D ctx->out.fmt;
> +	unsigned int dst_h, dst_w;
> +	u8 wr_format;
> +	unsigned int reg;
> +
> +	dst_h =3D ctx->out.pix.height;
> +	dst_w =3D ctx->out.pix.width;
> +
> +	if (out->semi_planar)
> +		wr_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> +	else
> +		wr_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> +
> +	/* set pixel format */
> +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_YC_SWAP, out=
->yc_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_RBUV_SWAP, o=
ut->rbuv_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_FORMAT, wr_f=
ormat);
> +
> +	/* set stride */
> +	reg =3D RGA3_WR_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	/* stride needs to be in words */
> +	cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[0].bytesperline >> 2;
> +	reg =3D RGA3_WR_PL_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	/* The Hardware only supports formats with 1/2 planes */
> +	if (ctx->out.pix.num_planes =3D=3D 2)
> +		cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[1].bytesperline >> 2;
> +	else
> +		cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[0].bytesperline >> 2;
> +
> +	/* Set size.
> +	 * As two inputs are not supported, we don't use win1.
> +	 * Therefore only set the size for win0.
> +	 */
> +	reg =3D RGA3_WIN0_DST_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, dst_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, dst_h);
> +}
> +
> +static void rga3_cmd_disable_wr_limitation(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	/* Use the max value to avoid limiting the write speed */
> +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX, 63);
> +}
> +
> +static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE * 4);
> +
> +	rga3_cmd_set_win0_format(ctx);
> +	rga3_cmd_enable_win0(ctx);
> +	rga3_cmd_set_trans_info(ctx);
> +	rga3_cmd_set_wr_format(ctx);
> +	rga3_cmd_disable_wr_limitation(ctx);
> +}
> +
> +static void rga3_hw_start(struct rockchip_rga *rga,
> +			=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +{
> +	struct rga_ctx *ctx =3D rga->curr;
> +
> +	rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
> +	rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
> +
> +	rga_write(rga, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
> +
> +	/* sync CMD buf for RGA */
> +	dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> +
> +	/* set to master mode and start the conversion */
> +	rga_write(rga, RGA3_SYS_CTRL,
> +		=C2=A0 FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
> +	rga_write(rga, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));
> +	rga_write(rga, RGA3_CMD_CTRL,
> +		=C2=A0 FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
> +}
> +
> +static bool rga3_handle_irq(struct rockchip_rga *rga)
> +{
> +	u32 intr;
> +
> +	intr =3D rga_read(rga, RGA3_INT_RAW);
> +	/* clear all interrupts */
> +	rga_write(rga, RGA3_INT_CLR, intr);
> +
> +	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
> +}
> +
> +static void rga3_get_version(struct rockchip_rga *rga)
> +{
> +	u32 version =3D rga_read(rga, RGA3_VERSION_NUM);
> +
> +	rga->version.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
> +	rga->version.minor =3D FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
> +}
> +
> +static struct rga3_fmt rga3_formats[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB24,
> +		.hw_format =3D RGA3_COLOR_FMT_BGR888,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_BGR24,
> +		.hw_format =3D RGA3_COLOR_FMT_BGR888,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> +		.hw_format =3D RGA3_COLOR_FMT_BGRA8888,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGBA32,
> +		.hw_format =3D RGA3_COLOR_FMT_BGRA8888,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> +		.hw_format =3D RGA3_COLOR_FMT_BGRA8888,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGBX32,
> +		.hw_format =3D RGA3_COLOR_FMT_BGRA8888,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_RGB565,
> +		.hw_format =3D RGA3_COLOR_FMT_BGR565,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.rbuv_swap =3D 1,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.rbuv_swap =3D 1,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.rbuv_swap =3D 1,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.rbuv_swap =3D 1,
> +		.semi_planar =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUYV,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.yc_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YVYU,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.yc_swap =3D 1,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_UYVY,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_VYUY,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.rbuv_swap =3D 1,
> +	},
> +	/* Input only formats last to keep rga3_enum_format simple */
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_ARGB32,
> +		.hw_format =3D RGA3_COLOR_FMT_ABGR8888,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_BGRA32,
> +		.hw_format =3D RGA3_COLOR_FMT_ABGR8888,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_XRGB32,
> +		.hw_format =3D RGA3_COLOR_FMT_ABGR8888,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_BGRX32,
> +		.hw_format =3D RGA3_COLOR_FMT_ABGR8888,
> +	},
> +};
> +
> +static int rga3_enum_format(struct v4l2_fmtdesc *f)
> +{
> +	struct rga3_fmt *fmt;
> +
> +	if (f->index >=3D ARRAY_SIZE(rga3_formats))
> +		return -EINVAL;
> +
> +	fmt =3D &rga3_formats[f->index];
> +	if (V4L2_TYPE_IS_CAPTURE(f->type) && !rga3_can_capture(fmt))
> +		return -EINVAL;
> +
> +	f->pixelformat =3D fmt->fourcc;
> +	return 0;
> +}
> +
> +static void *rga3_adjust_and_map_format(struct v4l2_pix_format_mplane *f=
ormat,
> +					bool is_output)
> +{
> +	unsigned int i;
> +
> +	if (!format)
> +		return &rga3_formats[0];
> +
> +	format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +	format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rga3_formats); i++) {
> +		if (!is_output && !rga3_can_capture(&rga3_formats[i]))
> +			continue;
> +
> +		if (rga3_formats[i].fourcc =3D=3D format->pixelformat)
> +			return &rga3_formats[i];
> +	}
> +
> +	format->pixelformat =3D rga3_formats[0].fourcc;
> +	return &rga3_formats[0];
> +}
> +
> +const struct rga_hw rga3_hw =3D {
> +	.card_type =3D "rga3",
> +	.has_internal_iommu =3D false,
> +	.cmdbuf_size =3D RGA3_CMDBUF_SIZE,
> +	.min_width =3D RGA3_MIN_WIDTH,
> +	.min_height =3D RGA3_MIN_HEIGHT,
> +	/* use output size, as it's a bit smaller than the input size */
> +	.max_width =3D RGA3_MAX_OUTPUT_WIDTH,
> +	.max_height =3D RGA3_MAX_OUTPUT_HEIGHT,
> +	.max_scaling_factor =3D RGA3_MAX_SCALING_FACTOR,
> +	.stride_alignment =3D 16,
> +	.features =3D 0,
> +
> +	.setup_cmdbuf =3D rga3_hw_setup_cmdbuf,
> +	.start =3D rga3_hw_start,
> +	.handle_irq =3D rga3_handle_irq,
> +	.get_version =3D rga3_get_version,
> +	.enum_format =3D rga3_enum_format,
> +	.adjust_and_map_format =3D rga3_adjust_and_map_format,
> +};
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.h b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.h
> new file mode 100644
> index 0000000000000..fa16b95fb43ba
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.h
> @@ -0,0 +1,190 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) Pengutronix e.K.
> + * Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> + */
> +#ifndef __RGA3_HW_H__
> +#define __RGA3_HW_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +#define RGA3_CMDBUF_SIZE 0x2e
> +
> +#define RGA3_MIN_WIDTH 128
> +#define RGA3_MIN_HEIGHT 128
> +#define RGA3_MAX_INPUT_WIDTH (8192 - 16)
> +#define RGA3_MAX_INPUT_HEIGHT (8192 - 16)
> +#define RGA3_MAX_OUTPUT_WIDTH (8192 - 64)
> +#define RGA3_MAX_OUTPUT_HEIGHT (8192 - 64)
> +#define RGA3_MAX_SCALING_FACTOR 8
> +#define RGA3_RESET_TIMEOUT 1000
> +
> +/* Registers address */
> +/* sys reg */
> +#define RGA3_SYS_CTRL				0x000
> +#define RGA3_CMD_CTRL				0x004
> +#define RGA3_CMD_ADDR				0x008
> +#define RGA3_MI_GROUP_CTRL			0x00c
> +#define RGA3_ARQOS_CTRL				0x010
> +#define RGA3_VERSION_NUM			0x018
> +#define RGA3_VERSION_TIM			0x01c
> +#define RGA3_INT_EN				0x020
> +#define RGA3_INT_RAW				0x024
> +#define RGA3_INT_MSK				0x028
> +#define RGA3_INT_CLR				0x02c
> +#define RGA3_RO_SRST				0x030
> +#define RGA3_STATUS0				0x034
> +#define RGA3_SCAN_CNT				0x038
> +#define RGA3_CMD_STATE				0x040
> +
> +/* cmd reg */
> +#define RGA3_WIN0_RD_CTRL			0x100
> +#define RGA3_FIRST_CMD_REG			RGA3_WIN0_RD_CTRL
> +#define RGA3_WIN0_Y_BASE			0x110
> +#define RGA3_WIN0_U_BASE			0x114
> +#define RGA3_WIN0_V_BASE			0x118
> +#define RGA3_WIN0_VIR_STRIDE			0x11c
> +#define RGA3_WIN0_FBC_OFF			0x120
> +#define RGA3_WIN0_SRC_SIZE			0x124
> +#define RGA3_WIN0_ACT_OFF			0x128
> +#define RGA3_WIN0_ACT_SIZE			0x12c
> +#define RGA3_WIN0_DST_SIZE			0x130
> +#define RGA3_WIN0_SCL_FAC			0x134
> +#define RGA3_WIN0_UV_VIR_STRIDE			0x138
> +#define RGA3_WIN1_RD_CTRL			0x140
> +#define RGA3_WIN1_Y_BASE			0x150
> +#define RGA3_WIN1_U_BASE			0x154
> +#define RGA3_WIN1_V_BASE			0x158
> +#define RGA3_WIN1_VIR_STRIDE			0x15c
> +#define RGA3_WIN1_FBC_OFF			0x160
> +#define RGA3_WIN1_SRC_SIZE			0x164
> +#define RGA3_WIN1_ACT_OFF			0x168
> +#define RGA3_WIN1_ACT_SIZE			0x16c
> +#define RGA3_WIN1_DST_SIZE			0x170
> +#define RGA3_WIN1_SCL_FAC			0x174
> +#define RGA3_WIN1_UV_VIR_STRIDE			0x178
> +#define RGA3_OVLP_CTRL				0x180
> +#define RGA3_OVLP_OFF				0x184
> +#define RGA3_OVLP_TOP_KEY_MIN			0x188
> +#define RGA3_OVLP_TOP_KEY_MAX			0x18c
> +#define RGA3_OVLP_TOP_CTRL			0x190
> +#define RGA3_OVLP_BOT_CTRL			0x194
> +#define RGA3_OVLP_TOP_ALPHA			0x198
> +#define RGA3_OVLP_BOT_ALPHA			0x19c
> +#define RGA3_WR_CTRL				0x1a0
> +#define RGA3_WR_FBCE_CTRL			0x1a4
> +#define RGA3_WR_VIR_STRIDE			0x1a8
> +#define RGA3_WR_PL_VIR_STRIDE			0x1ac
> +#define RGA3_WR_Y_BASE				0x1b0
> +#define RGA3_WR_U_BASE				0x1b4
> +#define RGA3_WR_V_BASE				0x1b8
> +
> +/* Registers value */
> +#define RGA3_COLOR_FMT_YUV420		0x0
> +#define RGA3_COLOR_FMT_YUV422		0x1
> +#define RGA3_COLOR_FMT_YUV420_10B	0x2
> +#define RGA3_COLOR_FMT_YUV422_10B	0x3
> +/*
> + * Use memory ordering names
> + * instead of the datasheet naming RGB formats in big endian order
> + */
> +#define RGA3_COLOR_FMT_BGR565		0x4
> +#define RGA3_COLOR_FMT_BGR888		0x5
> +#define RGA3_COLOR_FMT_FIRST_HAS_ALPHA	RGA3_COLOR_FMT_BGRA8888
> +#define RGA3_COLOR_FMT_BGRA8888		0x6
> +#define RGA3_COLOR_FMT_LAST_OUTPUT	RGA3_COLOR_FMT_BGRA8888
> +/* the following are only supported as inputs */
> +#define RGA3_COLOR_FMT_ABGR8888		0x7
> +/*
> + * the following seem to be unnecessary,
> + * as they can be achieved with RB swaps
> + */
> +#define RGA3_COLOR_FMT_RGBA8888		0x8
> +#define RGA3_COLOR_FMT_ARGB8888		0x9
> +
> +#define RGA3_RDWR_FORMAT_SEMI_PLANAR	0x1
> +#define RGA3_RDWR_FORMAT_INTERLEAVED	0x2
> +
> +#define RGA3_CMD_MODE_MASTER 0x1
> +
> +#define RGA3_WIN_CSC_MODE_BT601_F 0x2
> +
> +/* RGA masks */
> +/* SYS_CTRL */
> +#define RGA3_CCLK_SRESET BIT(4)
> +#define RGA3_ACLK_SRESET BIT(3)
> +#define RGA3_CMD_MODE BIT(1)
> +
> +/* CMD_CTRL */
> +#define RGA3_CMD_LINE_START_PULSE BIT(0)
> +
> +/* VERSION_NUM */
> +#define RGA3_VERSION_NUM_MAJOR GENMASK(31, 28)
> +#define RGA3_VERSION_NUM_MINOR GENMASK(27, 20)
> +
> +/* INT_* */
> +#define RGA3_INT_FRM_DONE BIT(0)
> +#define RGA3_INT_DMA_READ_BUS_ERR BIT(2)
> +#define RGA3_INT_WIN0_FBC_DEC_ERR BIT(5)
> +#define RGA3_INT_WIN0_HOR_ERR BIT(6)
> +#define RGA3_INT_WIN0_VER_ERR BIT(7)
> +#define RGA3_INT_WR_VER_ERR BIT(13)
> +#define RGA3_INT_WR_HOR_ERR BIT(14)
> +#define RGA3_INT_WR_BUS_ERR BIT(15)
> +#define RGA3_INT_WIN0_IN_FIFO_WR_ERR BIT(16)
> +#define RGA3_INT_WIN0_IN_FIFO_RD_ERR BIT(17)
> +#define RGA3_INT_WIN0_HOR_FIFO_WR_ERR BIT(18)
> +#define RGA3_INT_WIN0_HOR_FIFO_RD_ERR BIT(19)
> +#define RGA3_INT_WIN0_VER_FIFO_WR_ERR BIT(20)
> +#define RGA3_INT_WIN0_VER_FIFO_RD_ERR BIT(21)
> +
> +/* RO_SRST */
> +#define RGA3_RO_SRST_DONE GENMASK(5, 0)
> +
> +/* *_SIZE */
> +#define RGA3_HEIGHT GENMASK(28, 16)
> +#define RGA3_WIDTH GENMASK(12, 0)
> +
> +/* SCL_FAC */
> +#define RGA3_SCALE_VER_FAC GENMASK(31, 16)
> +#define RGA3_SCALE_HOR_FAC GENMASK(15, 0)
> +
> +/* WINx_CTRL */
> +#define RGA3_WIN_CSC_MODE GENMASK(27, 26)
> +#define RGA3_WIN_R2Y BIT(25)
> +#define RGA3_WIN_Y2R BIT(24)
> +#define RGA3_WIN_SCALE_VER_UP BIT(23)
> +#define RGA3_WIN_SCALE_VER_BYPASS BIT(22)
> +#define RGA3_WIN_SCALE_HOR_UP BIT(21)
> +#define RGA3_WIN_SCALE_HOR_BYPASS BIT(20)
> +#define RGA3_WIN_YC_SWAP BIT(13)
> +#define RGA3_WIN_RBUV_SWAP BIT(12)
> +#define RGA3_WIN_RD_FORMAT GENMASK(9, 8)
> +#define RGA3_WIN_PIC_FORMAT GENMASK(7, 4)
> +#define RGA3_WIN_ENABLE BIT(0)
> +
> +/* COLOR_CTRL */
> +#define RGA3_OVLP_GLOBAL_ALPHA GENMASK(23, 16)
> +#define RGA3_OVLP_COLOR_MODE BIT(0)
> +
> +/* ALPHA_CTRL */
> +#define RGA3_ALPHA_SELECT_MODE BIT(4)
> +#define RGA3_ALPHA_BLEND_MODE GENMASK(3, 2)
> +
> +/* WR_CTRL */
> +#define RGA3_WR_YC_SWAP BIT(20)
> +#define RGA3_WR_SW_OUTSTANDING_MAX GENMASK(18, 13)
> +#define RGA3_WR_RBUV_SWAP BIT(12)
> +#define RGA3_WR_FORMAT GENMASK(9, 8)
> +#define RGA3_WR_PIC_FORMAT GENMASK(7, 4)
> +
> +struct rga3_fmt {
> +	u32 fourcc;
> +	u8 hw_format;
> +	bool rbuv_swap;
> +	bool yc_swap;
> +	bool semi_planar;
> +};
> +
> +#endif

--=-whAzw988VqekGgm+cthZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUwWDAAKCRDZQZRRKWBy
9EReAP9u0QDbZjZSYUQNUljEtffSlE8SqCvgho+66QKyyUih8gEAypcfUyyDTVM1
ZBJM5AE6JdMy1fsl4bDZTVoxCLowOQY=
=Op3n
-----END PGP SIGNATURE-----

--=-whAzw988VqekGgm+cthZ--


Return-Path: <linux-media+bounces-43872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820FBC289B
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 21:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0CD84EFFAD
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 19:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84E42E62C7;
	Tue,  7 Oct 2025 19:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="q7uz4mbh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C9221F1F
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866098; cv=none; b=OIGjeanprVq3XoTFz2JPE4lu0nPzmqP1VDm1rQvc04CZg09/32fgFBObsdm3fQ2/iDdf8jsYK9/GgCmXBYEzAW0QSTow2VA1h9DaAXym0E/FtGAtraEv3ojCM/tT1Or8hqKI9Dx9Cq12hsl89MGnAgA1YJi9kas4Jzkf3cH+90c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866098; c=relaxed/simple;
	bh=xUE4JKzAlK3LLabFotaUGu0s7YnTFEcy/kjql5VAt7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/73vmrqNJnfR74zYCajeh8bKivzzXf6NS2pJxxU67bDcVPKx2WM4Uak7EcQiocTYbSfuMSSAZ3yU96QXz7vdY4kGwEaZA0qn7lrfKXFONI0Cc/jM3Usi1ZU+hwQ1jDRSQj8eluag+iEaWlKIu+TxEHLM56F9N+k9eJ0L/que2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=q7uz4mbh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-85a4ceb4c3dso639202585a.3
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759866094; x=1760470894; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xyp9/UYniF0lQ9A+jo/Czk31fjWwfzMptlEx0jEWYA8=;
        b=q7uz4mbh92brJ7MdTl4ZifdkO/8jEtymmgnkYEVvt5KZnMtLUvrEQ4o3M4dsAN8E7s
         bjMJP6VxbDuqn3M+Ocxkm6UuhVrcvN+pTa4lhC+BgVfxWpXJDV1iQ3G4ohB3EdmR2nzo
         /8zKI0Q80EWNiv4Lh0qXp1WQvNofdgYo0g246QT5BrO4htxyORpU5OAE/TLJAPKEn3kr
         oBnENl9i5AM5bqdkU4enEtT4eT66xxYac58Cfbonk5WAgxU43JXTPIPQZcpLT1iPNIHt
         ZU3zfK5C2edCekCSCc2QZ8RC4lsps44HNLJgZ1hyUkCbOTxb+f4a2Hhjps9JeEsd16V0
         QQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866094; x=1760470894;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xyp9/UYniF0lQ9A+jo/Czk31fjWwfzMptlEx0jEWYA8=;
        b=mLrXrbhdpyqjg7Sy5ZpkFq9Z5Gfpi8PwmJVC6YZLkFHHtiwyeN4t9iGyl5hUwkdUgl
         Vcyo2oDSavWtS9v8LYnQvcYVJuIeiOKd0hrRTdtk8CZ7lEGCy1a9QiXY4KsY76/clusg
         0aspg6zrzxtx4ZwanPhJpiEkBYRzCA08j+PcT5StaGbdwL+HZ4Qw5QyMHy69FraG6kEn
         FrLdbpH5xxNXuQvcGC0Pn5mtCwR64kvdCv8vcv98PrewemX6x+f8K69c0smRAbed1qtQ
         h6+sFwyJC90TgJ5dIQPGdgaoocxGM7OR+ZPFdMnATaSg3C2yxmrWzTqVwMNDIOjywb3C
         OV0w==
X-Gm-Message-State: AOJu0YzE1bgr2C+ddAOPrdo/qGlS1I+zzhCvvT38IYFPEm+KAI8oS2xV
	j6rVsJixbN5/ReLfr8SNn1nBqSAuEW11dKmoTyKWtsCBMMgh3KfFFfl7eAA29Adj5b8wkNkzEuG
	0oMSA
X-Gm-Gg: ASbGncs5E3Wgz0cIrW5++yRInt/miZBoZYteYanZVtTghRa3xLKYlmC8DGr4WSuyFjV
	voFTLUoGlatZqsgWBl8nEDKOLVz/gQvnJVzL1SW6qK+7id5s5UKBN9g3+m6zI+h2/4xcQQGqFYL
	sUmhDyd40vzoUgSiPD39ySt5k65rix9CAF2ozuJ3OxNxsTi4Ff6pmnxiewefEEtFUYHFt14R2fC
	W33haoSdAY8fLPEhK6rS+MYYAA38dLhn78H9dOrlgKTT4W0jBY07xOyosNX/gS84EjQqy3YhLjg
	I4sKI0vAF/Y/tGh4UXKah2cGMkDpY1E7JHocv8ToNSeq1qV53gTH2z0J2Byz9reK3s0mDzHOcxF
	606q3AH+1FF27h1GYe3TZY/6WVGjO/NxtO7NsJuv0hTNItsF+QAM8
X-Google-Smtp-Source: AGHT+IH0BpQ6UjRKQOhrHrjgYPTTg2Bohpcrrx2YDPPaGahj2qh6KSiNBJ+EUxMv60NxlPPOuzdESg==
X-Received: by 2002:a05:620a:1922:b0:7e0:f0bb:b1a4 with SMTP id af79cd13be357-88352f83bf7mr149247885a.27.1759866094144;
        Tue, 07 Oct 2025 12:41:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61fb57sm148591296d6.62.2025.10.07.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:41:32 -0700 (PDT)
Message-ID: <cfe8d17416184f11a93e56872c30a6bcaf017ef5.camel@ndufresne.ca>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
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
Date: Tue, 07 Oct 2025 15:41:31 -0400
In-Reply-To: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8IpBQNeH+w/N59wcfeQm"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-8IpBQNeH+w/N59wcfeQm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add support for the RGA3 unit contained in the RK3588.
>=20
> Only a basic feature set consisting of scaling and color conversion is
> implemented. Advanced features like rotation and cropping will just be
> ignored. Also the BT601F color space conversion is currently hard coded.
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
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 490 +++++++++++++++=
+++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h | 186 ++++++++++
> =C2=A05 files changed, 682 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/Makefile b/drivers/media=
/platform/rockchip/rga/Makefile
> index 1bbecdc3d8df2ce286652f5544c4a3b52a6d28cf..7326a548f3dc7618403e98974=
b8c60d45f556fef 100644
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
> index 3b5d2eb8e109f44af76dd2240a239b1fa8a78cee..9d15104fcc1a45553af33bfd6=
37bba0a86329c17 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -805,6 +805,10 @@ static const struct of_device_id rockchip_rga_match[=
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
> index dc4bb85707d12f5378c4891098cd7ea4a4d75e2d..350a4e07cb2ee237fc3676d59=
4e1e7298a028afb 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -169,6 +169,6 @@ static inline bool rga_has_internal_iommu(const struc=
t rockchip_rga *rga)
> =C2=A0	return rga->hw->has_internal_iommu;
> =C2=A0}
> =C2=A0
> -extern const struct rga_hw rga2_hw;
> +extern const struct rga_hw rga2_hw, rga3_hw;
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6e4cd2f96cf866880316c7592=
4f7a4c339851448
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -0,0 +1,490 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Pengutronix e.K.
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

Would be nice to summarize what you are calculating here.

> +{
> +	if (dst > src) {
> +		if (((src - 1) << 16) % (dst - 1) =3D=3D 0)
> +			return ((src - 1) << 16) / (dst - 1) - 1;
> +		else
> +			return ((src - 1) << 16) / (dst - 1);
> +	} else {
> +		return ((dst - 1) << 16) / (src - 1) + 1;
> +	}

Its unclear to me why the various -1, and why the factor get reversed depen=
ding
up or down scale.

> +}
> +
> +static bool rga3_has_alpha(const struct rga3_fmt *fmt)
> +{
> +	return fmt->hw_format >=3D RGA3_COLOR_FMT_FIRST_HAS_ALPHA &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fourcc !=3D V4L2_PIX_FMT_BGRX=
32 &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fourcc !=3D V4L2_PIX_FMT_XBGR=
32 &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fourcc !=3D V4L2_PIX_FMT_RGBX=
32 &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->fourcc !=3D V4L2_PIX_FMT_XRGB=
32;

Would be nice to extend v4l2-common ?

> +}
> +
> +static bool rga3_can_capture(const struct rga3_fmt *fmt)
> +{
> +	return fmt->hw_format <=3D RGA3_COLOR_FMT_LAST_OUTPUT;
> +}
> +
> +static void rga3_cmd_set_trans_info(struct rga_ctx *ctx)

Not obvious some the function name, can you add a comment block.

> +{
> +	struct rockchip_rga *rga =3D ctx->rga;
> +	u32 *cmd =3D rga->cmdbuf_virt;
> +	unsigned int src_h, src_w, dst_h, dst_w;
> +	unsigned int reg;
> +	u16 hor_scl_fac, ver_scl_fac;
> +
> +	src_h =3D ctx->in.crop.height;
> +	src_w =3D ctx->in.crop.width;
> +	dst_h =3D ctx->out.crop.height;
> +	dst_w =3D ctx->out.crop.width;

There is no position component to these rectangle ? It is a bit confusing t=
o
called cropped rectangles as src and dest only.

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
> +	/* stride needs to be in words */
> +	reg =3D RGA3_WIN0_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[0].bytesperline >> 2;
> +	reg =3D RGA3_WIN0_UV_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	if (ctx->in.pix.num_planes >=3D 2)
> +		cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[1].bytesperline >> 2;
> +	else
> +		cmd[reg >> 2] =3D ctx->in.pix.plane_fmt[0].bytesperline >> 2;

I find this pattern a bit hacky, and hiding what its for. My reading this i=
s
that if num_planes =3D=3D 1, the driver does not know how many planes there=
 is, due
to legacy single plane formats, such as NV12 (in contrast to NV12M). So it =
just
repeat the stride in all places.

That where is bugs me, since you use >=3D2 if the number of planes if 3, th=
e third
stride is missing, but would also not be equal. If the HW is limited to NV =
style
of format, then don't use >=3D2, but rather =3D=3D 2. And comment about it.

> +	reg =3D RGA3_WR_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[0].bytesperline >> 2;
> +	reg =3D RGA3_WR_PL_VIR_STRIDE - RGA3_FIRST_CMD_REG;
> +	if (ctx->out.pix.num_planes >=3D 2)
> +		cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[1].bytesperline >> 2;
> +	else
> +		cmd[reg >> 2] =3D ctx->out.pix.plane_fmt[0].bytesperline >> 2;
> +
> +	reg =3D RGA3_WIN0_ACT_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, src_h);
> +	reg =3D RGA3_WIN0_SRC_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, src_h);

Just guessing, because the code is not clear, but is that ACT (actual) and =
SRC
(source). Someone the original image size, and the source rectangle ? In wh=
ich
case, is it ok to pass twice the cropped size ?

> +
> +	reg =3D RGA3_WIN0_DST_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, dst_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, dst_h);
> +
> +	hor_scl_fac =3D rga3_get_scaling(src_w, dst_w);
> +	ver_scl_fac =3D rga3_get_scaling(src_h, dst_h);
> +	reg =3D RGA3_WIN0_SCL_FAC - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_SCALE_HOR_FAC, hor_scl_fac)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_SCALE_VER_FAC, ver_sc=
l_fac);
> +
> +	if (rga3_has_alpha(ctx->in.fmt)) {
> +		/* copy alpha from input */

Fair enough, I'd appreciate in the commit message to have an overview of al=
l the
features that are not covered by the driver. Notably you don't support the
second window for blits (V4L2 does not have enough CID to do that either), =
you
don't seem to fully support S_SELECTION, this is a bit annoying, no backgro=
und
colors, rotation, and probably more stuff I forget about.

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

Have you considered implementing V4L2_CID_ALPHA_COMPONENT ?

> +	}
> +}
> +
> +static void rga3_cmd_set_win0_addr(struct rga_ctx *ctx,
> +				=C2=A0=C2=A0 const struct rga_addrs *addrs)
> +{
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
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
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WR_Y_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->y_addr;
> +	reg =3D RGA3_WR_U_BASE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D addrs->u_addr;
> +}
> +
> +static void rga3_cmd_set_win0_format(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> +	const struct rga3_fmt *in =3D ctx->in.fmt;
> +	const struct rga3_fmt *out =3D ctx->out.fmt;
> +	const struct v4l2_format_info *in_fmt, *out_fmt;
> +	unsigned int src_h, src_w, dst_h, dst_w;
> +	bool r2y, y2r;
> +	u8 rd_format;
> +	unsigned int reg;
> +
> +	src_h =3D ctx->in.crop.height;
> +	src_w =3D ctx->in.crop.width;
> +	dst_h =3D ctx->out.crop.height;
> +	dst_w =3D ctx->out.crop.width;
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

I don't think I saw code in the v4l2 part the enforce that only that conver=
sion
is allowed. Just picking a hidden CSC and pixel transfer make your driver
unusable in real world.

My take is that a driver that implement CSC should be really serious about =
the
CSC aspect. So if you'd like to get a subset in a first iteration, make sur=
e
that the v4l2_format will perfectly reflect that subset so userspace does n=
ot
fooled into producing pad colors. In short, this driver only have 2 jobs at=
 the
moment, scale and CSC. Let do that well ?

> +}
> +
> +static void rga3_cmd_enable_win0(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_ENABLE, 1);
> +}
> +
> +static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> +	const struct rga3_fmt *out =3D ctx->out.fmt;
> +	u8 wr_format;
> +	unsigned int reg;
> +
> +	if (out->semi_planar)
> +		wr_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> +	else
> +		wr_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> +
> +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_YC_SWAP, out=
->yc_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_RBUV_SWAP, o=
ut->rbuv_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_FORMAT, wr_f=
ormat);
> +}
> +
> +static void rga3_cmd_disable_wr_limitation(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> +	unsigned int reg;
> +
> +	/* Use the max value to avoid limiting the write speed */
> +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX, 63);

No issue with the code, but quite an interesting feature. We did discussed =
in
pas about using the target framerate (well frame duration in v4l2) to avoid
bursting the memory.

> +}
> +
> +static void rga3_cmd_set(struct rga_ctx *ctx,
> +			 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +{
> +	struct rockchip_rga *rga =3D ctx->rga;
> +
> +	memset(rga->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE * 4);
> +
> +	rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
> +	rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
> +
> +	rga3_cmd_set_win0_format(ctx);
> +	rga3_cmd_enable_win0(ctx);
> +	rga3_cmd_set_trans_info(ctx);
> +	rga3_cmd_set_wr_format(ctx);
> +	rga3_cmd_disable_wr_limitation(ctx);
> +
> +	rga_write(rga, RGA3_CMD_ADDR, rga->cmdbuf_phy);
> +
> +	/* sync CMD buf for RGA */
> +	dma_sync_single_for_device(rga->dev, rga->cmdbuf_phy,
> +				=C2=A0=C2=A0 PAGE_SIZE, DMA_BIDIRECTIONAL);
> +}
> +
> +static void rga3_hw_start(struct rockchip_rga *rga,
> +			=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
> +{
> +	struct rga_ctx *ctx =3D rga->curr;
> +
> +	rga3_cmd_set(ctx, src, dst);
> +
> +	/* set to master mode and start the conversion */
> +	rga_write(rga, RGA3_SYS_CTRL,
> +		=C2=A0 FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
> +	rga_write(rga, RGA3_INT_EN,
> +		=C2=A0 FIELD_PREP(RGA3_INT_FRM_DONE, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_DMA_READ_BUS_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_FBC_DEC_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_HOR_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_VER_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WR_VER_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WR_HOR_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WR_BUS_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_IN_FIFO_WR_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_IN_FIFO_RD_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_HOR_FIFO_WR_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_HOR_FIFO_RD_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_VER_FIFO_WR_ERR, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_INT_WIN0_VER_FIFO_RD_ERR, 1));
> +	rga_write(rga, RGA3_CMD_CTRL,
> +		=C2=A0 FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
> +}
> +
> +static void rga3_soft_reset(struct rockchip_rga *rga)
> +{
> +	u32 i;
> +
> +	rga_write(rga, RGA3_SYS_CTRL,
> +		=C2=A0 FIELD_PREP(RGA3_CCLK_SRESET, 1) |
> +		=C2=A0 FIELD_PREP(RGA3_ACLK_SRESET, 1));
> +
> +	for (i =3D 0; i < RGA3_RESET_TIMEOUT; i++) {
> +		if (FIELD_GET(RGA3_RO_SRST_DONE, rga_read(rga, RGA3_RO_SRST)))
> +			break;
> +
> +		udelay(1);

Did you measure this IP soft reset speed ? Perhaps this delay can be tune t=
o
avoid hugging on a CPU core ?

> +	}
> +
> +	if (i =3D=3D RGA3_RESET_TIMEOUT)
> +		pr_err("Timeout of %d usec reached while waiting for an rga3 soft rese=
t\n", i);

What next if it failed ? System lockup, or just bunch of errors ?

> +
> +	rga_write(rga, RGA3_SYS_CTRL, 0);
> +	rga_iommu_restore(rga);
> +}
> +
> +static enum rga_irq_result rga3_handle_irq(struct rockchip_rga *rga)
> +{
> +	u32 intr;
> +
> +	intr =3D rga_read(rga, RGA3_INT_RAW);
> +	/* clear all interrupts */
> +	rga_write(rga, RGA3_INT_CLR, intr);
> +
> +	if (FIELD_GET(RGA3_INT_FRM_DONE, intr))
> +		return RGA_IRQ_DONE;
> +	if (FIELD_GET(RGA3_INT_DMA_READ_BUS_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_FBC_DEC_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_HOR_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_VER_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WR_VER_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WR_HOR_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WR_BUS_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_IN_FIFO_WR_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_IN_FIFO_RD_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_HOR_FIFO_WR_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_HOR_FIFO_RD_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_VER_FIFO_WR_ERR, intr) ||
> +	=C2=A0=C2=A0=C2=A0 FIELD_GET(RGA3_INT_WIN0_VER_FIFO_RD_ERR, intr)) {
> +		rga3_soft_reset(rga);
> +		return RGA_IRQ_ERROR;

Are you certain all these errors are fatal in the first place ? That being =
said,
since you "soft reset", I bet this basically abort any pending operation, s=
o it
should not matter.

> +	}
> +
> +	return RGA_IRQ_IGNORE;
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

Any chance you could add 10bit formats ? It can handle NV15 and P010. So fa=
r
this had been the main reason people have been interested in RGA3 (that and=
 its
AFBC feature, but the later is quite some more work, since we don't have th=
e
common code to compute the header sizes in media/ yet).

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
> +static void *rga3_try_format(u32 *fourcc, bool is_output)

This is not really a try_format function, but a tiny subset. If you really =
like
the "try", perhaps call it rga3_try_pixelformat() ?=20

> +{
> +	unsigned int i;
> +
> +	if (!fourcc)
> +		return &rga3_formats[0];
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rga3_formats); i++) {
> +		if (!is_output && !rga3_can_capture(&rga3_formats[i]))
> +			continue;
> +
> +		if (rga3_formats[i].fourcc =3D=3D *fourcc)
> +			return &rga3_formats[i];
> +	}
> +
> +	*fourcc =3D rga3_formats[0].fourcc;
> +	return &rga3_formats[0];
> +}
> +
> +const struct rga_hw rga3_hw =3D {
> +	.card_type =3D "rga3",
> +	.has_internal_iommu =3D false,
> +	.cmdbuf_size =3D RGA3_CMDBUF_SIZE,
> +	.min_width =3D RGA3_MIN_WIDTH,
> +	.min_height =3D RGA3_MIN_HEIGHT,
> +	.max_width =3D RGA3_MAX_INPUT_WIDTH,
> +	.max_height =3D RGA3_MAX_INPUT_HEIGHT,
> +
> +	.start =3D rga3_hw_start,
> +	.handle_irq =3D rga3_handle_irq,
> +	.get_version =3D rga3_get_version,
> +	.enum_format =3D rga3_enum_format,
> +	.try_format =3D rga3_try_format,
> +};
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.h b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..3829469e310706c11ecc52f40=
d3d1eb43a61d9c2
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) Pengutronix e.K.
> + * Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> + */
> +#ifndef __RGA3_HW_H__
> +#define __RGA3_HW_H__
> +
> +#include <linux/types.h>
> +
> +#define RGA3_CMDBUF_SIZE 0x2e
> +
> +#define RGA3_MIN_WIDTH 128
> +#define RGA3_MIN_HEIGHT 128
> +#define RGA3_MAX_INPUT_WIDTH (8192 - 16)
> +#define RGA3_MAX_INPUT_HEIGHT (8192 - 16)
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

--=-8IpBQNeH+w/N59wcfeQm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVs6wAKCRDZQZRRKWBy
9JvWAQChBy8KSv0D+uWwszUQ/JiraZDPj5zjEfnzGPtWhojIxAD9H8Fj/NGreVBl
Z+BepW/MlIkKpYA1yvo/4mSlPiYUJwY=
=KRDy
-----END PGP SIGNATURE-----

--=-8IpBQNeH+w/N59wcfeQm--


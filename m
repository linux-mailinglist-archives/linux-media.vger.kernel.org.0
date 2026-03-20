Return-Path: <linux-media+bounces-56566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKZ9GSKPvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:17:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E63012DF455
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8244532220E8
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C453E1CE3;
	Fri, 20 Mar 2026 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jFraEtCG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808E3E3C52
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 18:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030154; cv=none; b=Qo44VSAWDm30QC2WlixPznnJHXRHxZUKI+hqgzcNTQW3XmUbrnT2Q2RUp6y3b3YUf/segc8WHCVyOXg6KA+Bj4JrJ3kn3vVNtpCw9bpNLVhR4L7Ll5cIaRDTL6oA7H9bH0HvuPCEr1trmoM4EnIt4gg7s7WD+xqpnkf7F7XmI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030154; c=relaxed/simple;
	bh=FjI9Fps1P6R7RdKi8lJCSxGEV1rPWh4ay+LXc/nytpM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQKcTIIYfxwOpOxwdR1EX2y7JU31jec9KQPjYYsCpFNfJw3IRAVTG318LqYLwaNPvISLdNjrob8tYhHoyYQbhvLpr0Rlv1BNmLY583FtGWO1Ak9XC3Ga2zVGz+riU1TLfO3e8G+IwzupGdy6i6as4HVf2X0DlX1lrJ3W9VyRpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jFraEtCG; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cd90401034so216361185a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774030145; x=1774634945; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=04o2OZ8ua9j+bja5xQmIIJiJy7aH1x4aITrNd2sUlHc=;
        b=jFraEtCGTT3hYTIYPBvDkKyBttoV8YyCe2GjlDFvCnINIwglQinpPXa/b6lAVW5gHV
         CA0V6UUtHCaxTHeDeILLewhrkLBMK9JJDm5R6nAXSrDGzTkwL+bYegBVyYZtMD1NR73V
         uh2jwmIZoe6hmem+dlzo8mMOjt1Kh2sCXyw1b8dQ1fcM5wIbUqoR8ms0Tknpo+N9DUfE
         b48OCVa95FLCCTN5uagtKaEpT3XN/u96ZugB/cYFu4gXpFJxZABNdra9XG2PD+Iw2XHD
         BjKkvOclXJibb8dBNSbv/4vr4wfd6Xd2XZWceeJjWMVF0Y4vbyL2/GnI/cvPacNaOx1o
         v+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030145; x=1774634945;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=04o2OZ8ua9j+bja5xQmIIJiJy7aH1x4aITrNd2sUlHc=;
        b=Ji2f9DXt+7RUvRp/lzv5srW9Q257u9TJ9mbot+9P8qr+YzTGg2HzfqdO2GOuShL1cC
         PKKbHpTwftiuG0OxnY6hKv6ugCDnzpBhMZFc14Xro9KSl5iXoVdyv8KnXALnGE6/HMSn
         sJ3572ZUD9Bojo+dJ4Ee73i+7RhD/owjDRLCOSzJuHjIfeUTu+g4VLGfi0wXzctGNh0F
         yNYBQe/BWhpQ/Jw1C4lOTi4I/yqDnKpe8vyTpSLP2Ej5z7XDDUxDxRlJhX5bcWBL16l9
         y9uZ9t+HCxKzlu5FrsSalizS5Ve+XLRWg+yXSJHZTtgDn0cL5Jli5Hoem8cB+3UtRhCK
         srRQ==
X-Gm-Message-State: AOJu0YxNihUKX5jbV81atJxlDwhDZhB2NFYUL95ts9lqbdpFmjjD0+hL
	ydVqZfk3IyMw967u2YRS0em8xDEZptSWtuKwHl4zqSgjSwFiQ1aiKBSx2hkDZbC44T0=
X-Gm-Gg: ATEYQzzLqeNQ6AkBxFWYV2007lE7BLEa6RNOt5CdZ9pkmtaVnzFCCcbgg3AuMg1vgdc
	EzeO3747Bl0nLTC8+xMlCqtCwmmK6+f7ceVER3MTxZfNFIfPwSQbSRItmqilkZsUu60HVXl3DA2
	sXKDULwx3M6CKiMOLDoRSjNFe+hVJQjDSOwsCilVO2BGuBACa7SSd3xbl/+Nv7RlQ8uzqwY6k2g
	CI6GIW75bJ5oh0Fc4udGe9hVCmggQAHjew/+eOtyYXbO47sbBdEWNSTfLyPiQyGcQ3xvVwRrHGi
	Qba8Kk1rmtr4uyrImntC3r2pWdRjd7x/ZdixjqX1bSUKZOP68NonwzYhg/ZRp3PRmNTRYdZ3FjO
	zGMIVDxku44jks5UmMCm7crYkDhyVrRfloNFQJ927VnfUvkRE2PWIGeWL76TT+ZufZXCW1TLDt5
	pRoUmZerTcGEPE09DkiRIsL9mFkbYz
X-Received: by 2002:a05:620a:1712:b0:8cd:e0bd:b57b with SMTP id af79cd13be357-8cfc7eb221cmr591774485a.30.1774030145255;
        Fri, 20 Mar 2026 11:09:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8e1fa4esm217231285a.0.2026.03.20.11.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:09:04 -0700 (PDT)
Message-ID: <75766d85ebb99984771098af902cae8772fbc3b7.camel@ndufresne.ca>
Subject: Re: [PATCH v3 26/27] media: rockchip: rga: add rga3 support
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
Date: Fri, 20 Mar 2026 14:09:03 -0400
In-Reply-To: <20260127-spu-rga3-v3-26-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-26-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-z4XpN2rzSxQ6SVSy7qUS"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56566-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20230601.gappssmtp.com:dkim,ndufresne.ca:mid,collabora.com:email,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E63012DF455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-z4XpN2rzSxQ6SVSy7qUS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add support for the RGA3 unit contained in the RK3588.
>=20
> Only a basic feature set consisting of scaling and color conversion is
> implemented. Currently unimplemented features include:
> - Advanced formats like 10bit YUV, FBCE mode and Tile8x8 mode
> - Background color (V4L2_CID_BG_COLOR)
> - Configurable alpha value (V4L2_CID_ALPHA_COMPONENT)
> - Image flipping (V4L2_CID_HFLIP and V4L2_CID_VFLIP)
> - Image rotation (V4L2_CID_ROTATE)
> - Image cropping/composing (VIDIOC_S_SELECTION)
> =C2=A0 - Only very basic output cropping for 1088 -> 1080 cases is implem=
ented
>=20
> The register address defines were copied from the
> vendor Rockchip kernel sources and slightly adjusted to not start at 0
> again for the cmd registers.
>=20
> During testing it has been noted that the scaling of the hardware is
> slightly incorrect. A test conversion of 128x128 RGBA to 256x256 RGBA
> causes a slightly larger scaling. The scaling is suddle, as it seems
> that the image is scaled to a 2px larger version and then cropped to
> it's final size. Trying to use the RGA2 scaling factor calculation
> didn't work. As the calculation matches the vendor kernel driver, no
> further research has been utilized to check if there may be some kind of
> better scaling factor calculation.
>=20
> Furthermore comparing the RGA3 conversion with the GStreamer
> videoconvertscale element, the chroma-site is different. A quick testing
> didn't reveal a chroma-site that creates the same image with the
> GStreamer Element. Also when converting from YUV to RGB the RGB values
> differ by 1 or 2. This doesn't seem to be a colorspace conversion issue
> but rather a slightly different precision on the calculation.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/Makefile=C2=A0 |=C2=A0=C2=A0 2 =
+-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.c | 507
> ++++++++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga3-hw.h | 192 ++++++++++
> =C2=A05 files changed, 705 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/Makefile
> b/drivers/media/platform/rockchip/rga/Makefile
> index 1bbecdc3d8df2..7326a548f3dc7 100644
> --- a/drivers/media/platform/rockchip/rga/Makefile
> +++ b/drivers/media/platform/rockchip/rga/Makefile
> @@ -1,4 +1,4 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> -rockchip-rga-objs :=3D rga.o rga-hw.o rga-buf.o
> +rockchip-rga-objs :=3D rga.o rga-hw.o rga3-hw.o rga-buf.o
> =C2=A0
> =C2=A0obj-$(CONFIG_VIDEO_ROCKCHIP_RGA) +=3D rockchip-rga.o
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index e45b9c853d659..dd08c3a70a735 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -910,6 +910,10 @@ static const struct of_device_id rockchip_rga_match[=
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
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 849b96392b780..bb225549db86e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -166,5 +166,6 @@ static inline bool rga_has_internal_iommu(const struc=
t
> rockchip_rga *rga)
> =C2=A0}
> =C2=A0
> =C2=A0extern const struct rga_hw rga2_hw;
> +extern const struct rga_hw rga3_hw;
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c
> b/drivers/media/platform/rockchip/rga/rga3-hw.c
> new file mode 100644
> index 0000000000000..213650edab962
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025-2026 Pengutronix e.K.
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
> +	 * RGA3 scaling factor calculation as described in chapter 5.4.7
> Resize
> +	 * of the TRM Part 2. The resulting scaling factor is a 16-bit value
> +	 * and therefore normalized with 2^16.
> +	 *
> +	 * While the TRM also mentions (dst-1)/(src-1) for the up-scaling
> case,
> +	 * it didn't work as the value always exceeds 16 bit. Flipping the
> +	 * factors results in a correct up-scaling. This is possible as the
> +	 * RGA3 has the RGA3_WIN_SCALE_XXX_UP bit to determine if it does
> +	 * an up or downscale.
> +	 *
> +	 * The scaling factor can potentially cause a slightly larger scaling
> +	 * (e.g. 1/2px larger scale and then cropped to the destination
> size).
> +	 * This can be seen when scaling 128x128px RGBA to 256x256px RGBA.
> +	 * The RGA2 scaling factor calculation (without the various +/-1
> +	 * doesn't work for the RGA3. It's assumed that this is an hardware
> +	 * accuracy limitation, as the vendor kernel driver uses the same
> +	 * scaling factor calculation.
> +	 *
> +	 * With a scaling factor of 1.0 the calculation technically also
> +	 * overflows 16 bit. This isn't relevant, as in this case the
> +	 * RGA3_WIN_SCALE_XXX_BYPASS bit completely skips the scaling
> operation.
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
> +	/* Support basic input cropping to support 1088px inputs */
> +	src_h =3D ctx->in.crop.height;
> +	src_w =3D ctx->in.crop.width;
> +	dst_h =3D ctx->out.pix.height;
> +	dst_w =3D ctx->out.pix.width;
> +
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_SCALE_HOR_UP, dst_w > src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_HOR_B=
YPASS, dst_w =3D=3D
> src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_VER_U=
P, dst_h > src_h)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_SCALE_VER_B=
YPASS, dst_h =3D=3D
> src_h);
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
> +	unsigned int act_h, act_w, src_h, src_w;
> +	bool r2y, y2r;
> +	u8 rd_format;
> +	const struct v4l2_pix_format_mplane *csc_pix;
> +	u8 csc_mode;
> +	unsigned int reg;
> +
> +	act_h =3D ctx->in.pix.height;
> +	act_w =3D ctx->in.pix.width;
> +	/* Support basic input cropping to support 1088px inputs */
> +	src_h =3D ctx->in.crop.height;
> +	src_w =3D ctx->in.crop.width;
> +
> +	in_fmt =3D v4l2_format_info(in->fourcc);
> +	out_fmt =3D v4l2_format_info(out->fourcc);
> +	r2y =3D v4l2_is_format_rgb(in_fmt) && v4l2_is_format_yuv(out_fmt);
> +	y2r =3D v4l2_is_format_yuv(in_fmt) && v4l2_is_format_rgb(out_fmt);
> +
> +	/* The Hardware only supports formats with 1/2 planes */
> +	if (in_fmt->comp_planes =3D=3D 2)
> +		rd_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> +	else
> +		rd_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> +
> +	/* set pixel format and CSC */
> +	csc_pix =3D r2y ? &ctx->out.pix : &ctx->in.pix;
> +	switch (csc_pix->ycbcr_enc) {
> +	case V4L2_YCBCR_ENC_BT2020:
> +		csc_mode =3D RGA3_WIN_CSC_MODE_BT2020_L;
> +		break;
> +	case V4L2_YCBCR_ENC_709:
> +		csc_mode =3D RGA3_WIN_CSC_MODE_BT709_L;
> +		break;
> +	default: /* should be fixed to BT601 in adjust_and_map_format */
> +		if (csc_pix->quantization =3D=3D V4L2_QUANTIZATION_LIM_RANGE)
> +			csc_mode =3D RGA3_WIN_CSC_MODE_BT601_L;
> +		else
> +			csc_mode =3D RGA3_WIN_CSC_MODE_BT601_F;
> +		break;
> +	}
> +
> +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_ENABLE, 1)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_PIC_FORMAT,=
 in->hw_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_YC_SWAP, in=
->yc_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_RBUV_SWAP, =
in->rbuv_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_RD_FORMAT, =
rd_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_R2Y, r2y)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_Y2R, y2r)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WIN_CSC_MODE, c=
sc_mode);
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
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, act_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, act_h);
> +	reg =3D RGA3_WIN0_SRC_SIZE - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WIDTH, src_w)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FIELD_PREP(RGA3_HEIGHT, src_h);
> +}
> +
> +/* Map the output pixel format to the command buffer */
> +static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
> +{
> +	u32 *cmd =3D ctx->cmdbuf_virt;
> +	const struct rga3_fmt *out =3D ctx->out.fmt;
> +	const struct v4l2_format_info *out_fmt;
> +	unsigned int dst_h, dst_w;
> +	u8 wr_format;
> +	unsigned int reg;
> +
> +	dst_h =3D ctx->out.pix.height;
> +	dst_w =3D ctx->out.pix.width;
> +
> +	out_fmt =3D v4l2_format_info(out->fourcc);
> +
> +	/* The Hardware only supports formats with 1/2 planes */
> +	if (out_fmt->comp_planes =3D=3D 2)
> +		wr_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> +	else
> +		wr_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> +
> +	/* set pixel format */
> +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> +	cmd[reg >> 2] =3D FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_YC_SWAP, out->yc_s=
wap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_RBUV_SWAP, out->rb=
uv_swap)
> +		=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_FORMAT, wr_format)
> +	/* Use the max value to avoid limiting the write speed */
> +		=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX=
, 63);
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
> +static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
> +{
> +	memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE * 4);
> +
> +	rga3_cmd_set_win0_format(ctx);
> +	rga3_cmd_set_trans_info(ctx);
> +	rga3_cmd_set_wr_format(ctx);
> +}
> +
> +static void rga3_hw_start(struct rockchip_rga *rga,
> +			=C2=A0 struct rga_vb_buffer *src, struct rga_vb_buffer
> *dst)
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
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV21,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV420,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV16,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61M,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.rbuv_swap =3D 1,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV61,
> +		.hw_format =3D RGA3_COLOR_FMT_YUV422,
> +		.rbuv_swap =3D 1,
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
> +static void *rga3_adjust_and_map_format(struct rga_ctx *ctx,
> +					struct v4l2_pix_format_mplane
> *format,
> +					bool is_output)
> +{
> +	unsigned int i;
> +	const struct v4l2_format_info *format_info;
> +	const struct v4l2_pix_format_mplane *other_format;
> +	const struct v4l2_format_info *other_format_info;
> +
> +	if (!format)
> +		return &rga3_formats[0];
> +
> +	format_info =3D v4l2_format_info(format->pixelformat);
> +	other_format =3D is_output ? &ctx->in.pix : &ctx->out.pix;
> +	other_format_info =3D v4l2_format_info(other_format->pixelformat);
> +
> +	if ((v4l2_is_format_rgb(format_info) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_is_format_yuv(other_format_info)) ||
> +	=C2=A0=C2=A0=C2=A0 (v4l2_is_format_yuv(format_info) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_is_format_rgb(other_format_info))) {
> +		/*
> +		 * The RGA3 only supports BT601, BT709 and BT2020 RGB<->YUV
> conversions
> +		 * Additionally BT709 and BT2020 only support limited range
> YUV.
> +		 */
> +		switch (format->ycbcr_enc) {
> +		case V4L2_YCBCR_ENC_601:
> +			/* supports full and limited range */
> +			break;
> +		case V4L2_YCBCR_ENC_709:
> +		case V4L2_YCBCR_ENC_BT2020:
> +			format->quantization =3D V4L2_QUANTIZATION_LIM_RANGE;
> +			break;
> +		default:
> +			format->ycbcr_enc =3D V4L2_YCBCR_ENC_601;
> +			format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> +			break;
> +		}
> +	}
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
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.h
> b/drivers/media/platform/rockchip/rga/rga3-hw.h
> new file mode 100644
> index 0000000000000..cc87051492194
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.h
> @@ -0,0 +1,192 @@
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
> +#define RGA3_WIN_CSC_MODE_BT601_L 0x0
> +#define RGA3_WIN_CSC_MODE_BT709_L 0x1
> +#define RGA3_WIN_CSC_MODE_BT601_F 0x2
> +#define RGA3_WIN_CSC_MODE_BT2020_L 0x3
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
> +};
> +
> +#endif

--=-z4XpN2rzSxQ6SVSy7qUS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2NPwAKCRDZQZRRKWBy
9J4LAP90IxVySIEZWuxa9dW3BfWP/2NRXBEcGNy6MRqxZVMR8QEAw8ujWDFdQRMA
OaLPLMJTC9tp/38GG5THGKk5N+P9EAI=
=TDDg
-----END PGP SIGNATURE-----

--=-z4XpN2rzSxQ6SVSy7qUS--


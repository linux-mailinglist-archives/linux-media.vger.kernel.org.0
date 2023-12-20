Return-Path: <linux-media+bounces-2822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E5E81A580
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 17:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58F1A1F23643
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 16:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC1946548;
	Wed, 20 Dec 2023 16:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RAO8EVIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59041A92;
	Wed, 20 Dec 2023 16:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703090497;
	bh=OPgFFUmvOS1WxLHlKLqNxmw0nfzw6SxQQ/Mk7uYku+k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RAO8EVIQauCFnWuSaXG7gl1s3vdBBXlvWskWInuxxXRTJTZjJ4wTSvshNSSer9rhw
	 cisOSI3trk6VNvUqWHPRciOWMtewJonydRfHUP0CtuCFAl2Vje87w5f/PdnUCmHt2n
	 syTZJtz9ItX/cKJ77IR4Y0Axcq+Lyk33dLqeER64QYXL9Sf/KO32gPunOeZyKe6bpw
	 k7eocz3Cd0pVsa+pQE9DDc6reK0qffw5zq+XxtDcDvBX9bp3cRVu6I5Oi/BW/9PygN
	 TvKi3ZgXsIOQHv1+iTqww0aQ3wpyYBLUDtRhASO1obkxT346qrJUxurw1PTAB5BBuj
	 PzhEYxdehBilQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E36FD37814A9;
	Wed, 20 Dec 2023 16:41:33 +0000 (UTC)
Message-ID: <8661158082baf37cfd6bac7004c695b805233bd5.camel@collabora.com>
Subject: Re: [PATCH v4 3/5] media: hantro: add support for STM32MP25 VENC
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>,  Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
Cc: Marco Felsch <m.felsch@pengutronix.de>, Adam Ford <aford173@gmail.com>
Date: Wed, 20 Dec 2023 11:41:30 -0500
In-Reply-To: <20231220152732.2138260-4-hugues.fruchet@foss.st.com>
References: <20231220152732.2138260-1-hugues.fruchet@foss.st.com>
	 <20231220152732.2138260-4-hugues.fruchet@foss.st.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 20 d=C3=A9cembre 2023 =C3=A0 16:27 +0100, Hugues Fruchet a =C3=
=A9crit=C2=A0:
> Add support for STM32MP25 VENC video hardware encoder.
> Support of JPEG encoding.
> VENC has its own reset/clock/irq.
>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/Makefile   |   3 +-
>  .../media/platform/verisilicon/hantro_drv.c   |   1 +
>  .../media/platform/verisilicon/hantro_hw.h    |   1 +
>  .../platform/verisilicon/stm32mp25_venc_hw.c  | 115 ++++++++++++++++++
>  4 files changed, 119 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/verisilicon/stm32mp25_venc_hw.=
c
>=20
> diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/=
platform/verisilicon/Makefile
> index 5854e0f0dd32..3bf43fdbedc1 100644
> --- a/drivers/media/platform/verisilicon/Makefile
> +++ b/drivers/media/platform/verisilicon/Makefile
> @@ -41,4 +41,5 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) +=3D \
>  		sunxi_vpu_hw.o
> =20
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_STM32MP25) +=3D \
> -		stm32mp25_vdec_hw.o
> +		stm32mp25_vdec_hw.o \
> +		stm32mp25_venc_hw.o
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2db27c333924..4d97a8ac03de 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -736,6 +736,7 @@ static const struct of_device_id of_hantro_match[] =
=3D {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_STM32MP25
>  	{ .compatible =3D "st,stm32mp25-vdec", .data =3D &stm32mp25_vdec_varian=
t, },
> +	{ .compatible =3D "st,stm32mp25-venc", .data =3D &stm32mp25_venc_varian=
t, },
>  #endif
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/med=
ia/platform/verisilicon/hantro_hw.h
> index b7eccc1a96fc..70c72e9d11d5 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -407,6 +407,7 @@ extern const struct hantro_variant rk3588_vpu981_vari=
ant;
>  extern const struct hantro_variant sama5d4_vdec_variant;
>  extern const struct hantro_variant sunxi_vpu_variant;
>  extern const struct hantro_variant stm32mp25_vdec_variant;
> +extern const struct hantro_variant stm32mp25_venc_variant;
> =20
>  extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
>  extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
> diff --git a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c b/dri=
vers/media/platform/verisilicon/stm32mp25_venc_hw.c
> new file mode 100644
> index 000000000000..0ff0f073b922
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * STM32MP25 VENC video encoder driver
> + *
> + * Copyright (C) STMicroelectronics SA 2022
> + * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
> + *          for STMicroelectronics.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/reset.h>
> +
> +#include "hantro.h"
> +#include "hantro_jpeg.h"
> +#include "hantro_h1_regs.h"
> +
> +/*
> + * Supported formats.
> + */
> +
> +static const struct hantro_fmt stm32mp25_venc_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUV420M,
> +		.codec_mode =3D HANTRO_MODE_NONE,
> +		.enc_fmt =3D ROCKCHIP_VPU_ENC_FMT_YUV420P,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> +		.codec_mode =3D HANTRO_MODE_NONE,
> +		.enc_fmt =3D ROCKCHIP_VPU_ENC_FMT_YUV420SP,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_YUYV,
> +		.codec_mode =3D HANTRO_MODE_NONE,
> +		.enc_fmt =3D ROCKCHIP_VPU_ENC_FMT_YUYV422,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_UYVY,
> +		.codec_mode =3D HANTRO_MODE_NONE,
> +		.enc_fmt =3D ROCKCHIP_VPU_ENC_FMT_UYVY422,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_JPEG,
> +		.codec_mode =3D HANTRO_MODE_JPEG_ENC,
> +		.max_depth =3D 2,
> +		.header_size =3D JPEG_HEADER_SIZE,
> +		.frmsize =3D {
> +			.min_width =3D 96,
> +			.max_width =3D FMT_4K_WIDTH,
> +			.step_width =3D MB_DIM,
> +			.min_height =3D 96,
> +			.max_height =3D FMT_4K_HEIGHT,
> +			.step_height =3D MB_DIM,
> +		},
> +	},
> +};
> +
> +static irqreturn_t stm32mp25_venc_irq(int irq, void *dev_id)
> +{
> +	struct hantro_dev *vpu =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status =3D vepu_read(vpu, H1_REG_INTERRUPT);
> +	state =3D (status & H1_REG_INTERRUPT_FRAME_RDY) ?
> +		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +	vepu_write(vpu, H1_REG_INTERRUPT_BIT, H1_REG_INTERRUPT);
> +
> +	hantro_irq_done(vpu, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void stm32mp25_venc_reset(struct hantro_ctx *ctx)
> +{
> +}
> +
> +/*
> + * Supported codec ops.
> + */
> +
> +static const struct hantro_codec_ops stm32mp25_venc_codec_ops[] =3D {
> +	[HANTRO_MODE_JPEG_ENC] =3D {
> +		.run =3D hantro_h1_jpeg_enc_run,
> +		.reset =3D stm32mp25_venc_reset,
> +		.done =3D hantro_h1_jpeg_enc_done,
> +	},
> +};
> +
> +/*
> + * Variants.
> + */
> +
> +static const struct hantro_irq stm32mp25_venc_irqs[] =3D {
> +	{ "venc", stm32mp25_venc_irq },
> +};
> +
> +static const char * const stm32mp25_venc_clk_names[] =3D {
> +	"venc-clk"
> +};
> +
> +const struct hantro_variant stm32mp25_venc_variant =3D {
> +	.enc_fmts =3D stm32mp25_venc_fmts,
> +	.num_enc_fmts =3D ARRAY_SIZE(stm32mp25_venc_fmts),
> +	.codec =3D HANTRO_JPEG_ENCODER,
> +	.codec_ops =3D stm32mp25_venc_codec_ops,
> +	.irqs =3D stm32mp25_venc_irqs,
> +	.num_irqs =3D ARRAY_SIZE(stm32mp25_venc_irqs),
> +	.clk_names =3D stm32mp25_venc_clk_names,
> +	.num_clocks =3D ARRAY_SIZE(stm32mp25_venc_clk_names)
> +};
> +



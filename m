Return-Path: <linux-media+bounces-47150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF67C5F5E3
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 22:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7B974E2F04
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 21:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A12355810;
	Fri, 14 Nov 2025 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f7U9IeDo"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4073557E9;
	Fri, 14 Nov 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763155637; cv=none; b=gcCKujOGUdiuk6vGBT7EgBGtOer6eqvx54CfnNqz4668Hi9e+EqNw7F04/P5pZJ8R0I07bg/TXB9LYljSGVJwTMtjXX29N+qkT8hFARAJJfyXxaXrKSid4rnCrGpnxmt4MHuhAAtl2Zc6ysC2GYJPzdSWeni77qxJtB0HvIbY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763155637; c=relaxed/simple;
	bh=Sa1h+R+xfJ9HS4sxflMd5g+ohwwD0ATC2tbR/YNLBE0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xf8kxg4Dxucz5juAV38OyuRkHKYJmzWwqERoQNHC4FczV98qPMabVGye2frmzxhXOgb/ajm2W5Q9w4rAyaJb7aAhoupeJ7BqIxWcX6UUn7QA7Jjt/K86jElDkLJNRAohCPFI5koOQIapPj6Q6NrSw1uPip85xjG9+O5AqTelEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f7U9IeDo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763155630;
	bh=Sa1h+R+xfJ9HS4sxflMd5g+ohwwD0ATC2tbR/YNLBE0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=f7U9IeDojT3Vnez0YcON2YJ7Bv4eUdSOH/glleQsEj76PDUoN/8eF0Qy4CkAyHYgM
	 ehSzCOQldfJw3nM0sAh1INZd7WaXECO4sleUTnnP0SWEmd0DDG3k1Is2ceX/WnSzWj
	 pVh1/oQSlBvWu2Qk/puLTQ8tV76lxjQgfHrMo0rASOUMJ9d90/avWpTkZOjveEttQR
	 WJdZvtIa6H+XI8qu/6xXjldskt2SRzus6Y8hxap+aHe/ikly23acuFL/4EPyL1wPA6
	 MhbR65frgTT8mD3jx3izbftomfLqQfGirJNSCcyfDHbbsbE+35Mv6Um8vQ6xCNxPj9
	 Ddjv4rBvSAvgg==
Received: from [IPv6:2606:6d00:11:696f::c41] (unknown [IPv6:2606:6d00:11:696f::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C21C917E013C;
	Fri, 14 Nov 2025 22:27:07 +0100 (CET)
Message-ID: <831518109ba0885f6cd3ee8c32316f9aaf386c5c.camel@collabora.com>
Subject: Re: [PATCH v3 1/6] media: mediatek: encoder: Add a new encoder
 driver interface
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert	
 <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Irui Wang	
 <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Fri, 14 Nov 2025 16:27:05 -0500
In-Reply-To: <20250814085642.17343-2-kyrie.wu@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-XW9OZ9zCQ3GNdVJB1kAP"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XW9OZ9zCQ3GNdVJB1kAP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 14 ao=C3=BBt 2025 =C3=A0 16:56 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> From: Irui Wang <irui.wang@mediatek.com>
>=20
> Introduce a new encoder kernel driver interface to ensure compatibility
> with the updated encoder software driver running in firmware.
> The new driver interface is expected to support more encoder formats,
> share more encode parameters between kernel and firmware.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

I notice some possible redundancy with common/mtk_vcodec_util.c, so somethi=
ng to
keep in mind for future to avoid inflating this driver forever, but looks
overall good. I don't like the fact it waits synchrously on IRQ, but this i=
s
true for the integrity of the driver.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 13 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../platform/mediatek/vcodec/encoder/Makefile |=C2=A0=C2=A0 1 +
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0 14 +-
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../vcodec/encoder/venc/venc_common_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 672 ++++++++++++++++++
> =C2=A0.../vcodec/encoder/venc/venc_h264_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A08 files changed, 710 insertions(+), 18 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/v=
enc/venc_common_if.c
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index 4ed7639dfa30..0381acceda25 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -18,6 +18,19 @@ int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type=
, int hw_id)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
> =C2=A0
> +int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type)
> +{
> +	switch (type) {
> +	case SCP:
> +		return SCP_IPI_VENC_H264;
> +	case VCP:
> +		return VCP_IPI_ENCODER;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_venc_ipi);
> +
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vco=
dec_fw_type type,
> =C2=A0					=C2=A0=C2=A0 enum mtk_vcodec_fw_use fw_use)
> =C2=A0{
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 142e2e87905c..e7304a7dd3e0 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -42,5 +42,6 @@ int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, in=
t id,
> =C2=A0			=C2=A0=C2=A0 void *buf, unsigned int len, unsigned int wait);
> =C2=A0int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
> =C2=A0int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
> +int mtk_vcodec_fw_get_venc_ipi(enum mtk_vcodec_fw_type type);
> =C2=A0
> =C2=A0#endif /* _MTK_VCODEC_FW_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/Makefile b/dr=
ivers/media/platform/mediatek/vcodec/encoder/Makefile
> index e621b5b7e5e6..9d3229d56e39 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) +=3D mtk-vcodec-enc.o
> =C2=A0
> =C2=A0mtk-vcodec-enc-y :=3D venc/venc_vp8_if.o \
> =C2=A0		venc/venc_h264_if.o \
> +		venc/venc_common_if.o \
> =C2=A0		mtk_vcodec_enc.o \
> =C2=A0		mtk_vcodec_enc_drv.o \
> =C2=A0		mtk_vcodec_enc_pm.o \
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index dcafb1303c29..03512bf7a072 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -81,11 +81,11 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0		break;
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> =C2=A0		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_PROFILE val =
=3D %d", ctrl->val);
> -		p->h264_profile =3D ctrl->val;
> +		p->profile =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> =C2=A0		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_LEVEL val =3D=
 %d", ctrl->val);
> -		p->h264_level =3D ctrl->val;
> +		p->level =3D ctrl->val;
> =C2=A0		break;
> =C2=A0	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
> =C2=A0		mtk_v4l2_venc_dbg(2, ctx, "V4L2_CID_MPEG_VIDEO_H264_I_PERIOD val =
=3D %d", ctrl->val);
> @@ -386,8 +386,8 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_=
ctx *ctx,
> =C2=A0		mtk_v4l2_venc_err(ctx, "Unsupported fourcc =3D%d", q_data_src->fm=
t->fourcc);
> =C2=A0		break;
> =C2=A0	}
> -	param->h264_profile =3D enc_params->h264_profile;
> -	param->h264_level =3D enc_params->h264_level;
> +	param->profile =3D enc_params->profile;
> +	param->level =3D enc_params->level;
> =C2=A0
> =C2=A0	/* Config visible resolution */
> =C2=A0	param->width =3D q_data_src->visible_width;
> @@ -403,8 +403,8 @@ static void mtk_venc_set_param(struct mtk_vcodec_enc_=
ctx *ctx,
> =C2=A0
> =C2=A0	mtk_v4l2_venc_dbg(0, ctx,
> =C2=A0			=C2=A0 "fmt 0x%x, P/L %d/%d w/h %d/%d buf %d/%d fps/bps %d/%d go=
p %d i_per %d",
> -			=C2=A0 param->input_yuv_fmt, param->h264_profile,
> -			=C2=A0 param->h264_level, param->width, param->height,
> +			=C2=A0 param->input_yuv_fmt, param->profile,
> +			=C2=A0 param->level, param->width, param->height,
> =C2=A0			=C2=A0 param->buf_width, param->buf_height,
> =C2=A0			=C2=A0 param->frm_rate, param->bitrate,
> =C2=A0			=C2=A0 param->gop_size, param->intra_period);
> @@ -1174,6 +1174,8 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0		frm_buf.fb_addr[i].size =3D
> =C2=A0				(size_t)src_buf->vb2_buf.planes[i].length;
> =C2=A0	}
> +	frm_buf.num_planes =3D src_buf->vb2_buf.num_planes;
> +
> =C2=A0	bs_buf.va =3D vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
> =C2=A0	bs_buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_bu=
f, 0);
> =C2=A0	bs_buf.size =3D (size_t)dst_buf->vb2_buf.planes[0].length;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.h
> index 0bd85d0fb379..b1277bcfcf53 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
> @@ -69,8 +69,8 @@ enum mtk_encode_param {
> =C2=A0 * @framerate_denom: frame rate denominator. ex: framerate_num=3D30=
 and
> =C2=A0 *		=C2=A0=C2=A0=C2=A0=C2=A0 framerate_denom=3D1 means FPS is 30
> =C2=A0 * @h264_max_qp: Max value for H.264 quantization parameter
> - * @h264_profile: V4L2 defined H.264 profile
> - * @h264_level: V4L2 defined H.264 level
> + * @profile: V4L2 defined profile
> + * @level: V4L2 defined level
> =C2=A0 * @force_intra: force/insert intra frame
> =C2=A0 */
> =C2=A0struct mtk_enc_params {
> @@ -84,8 +84,8 @@ struct mtk_enc_params {
> =C2=A0	unsigned int	framerate_num;
> =C2=A0	unsigned int	framerate_denom;
> =C2=A0	unsigned int	h264_max_qp;
> -	unsigned int	h264_profile;
> -	unsigned int	h264_level;
> +	unsigned int	profile;
> +	unsigned int	level;
> =C2=A0	unsigned int	force_intra;
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_com=
mon_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_=
if.c
> new file mode 100644
> index 000000000000..da7cf90bd54b
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.=
c
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#include "../mtk_vcodec_enc.h"
> +#include "../mtk_vcodec_enc_drv.h"
> +#include "../venc_drv_base.h"
> +#include "../venc_drv_if.h"
> +#include "../venc_vpu_if.h"
> +#include "../../common/mtk_vcodec_intr.h"
> +#include "../../common/mtk_vcodec_util.h"
> +
> +#define SEQ_HEADER_SIZE 1024
> +#define PPS_SIZE 128
> +#define MAX_DPB_SIZE 16
> +#define MAX_VENC_CORE 3
> +#define VENC_CONFIG_LENGTH 115
> +#define VENC_CONFIG_DATA 128
> +#define VENC_PIC_BITSTREAM_BYTE_CNT 0x0098
> +
> +/**
> + * enum venc_bs_mode - encode bitstream mode
> + * @VENC_BS_MODE_SPS: encode sps
> + * @VENC_BS_MODE_PPS: encode pps
> + * @VENC_BS_MODE_VPS: encode vps
> + * @VENC_BS_MODE_SEQ_HDR: encode sequence header
> + * @VENC_BS_MODE_FRAME: encode frame
> + * @VENC_BS_MODE_FRAME_FINAL: encode final frame
> + * @VENC_BS_MODE_MAX: max value
> + */
> +enum venc_bs_mode {
> +	VENC_BS_MODE_SPS =3D 0,
> +	VENC_BS_MODE_PPS,
> +	VENC_BS_MODE_VPS,
> +	VENC_BS_MODE_SEQ_HDR,
> +	VENC_BS_MODE_FRAME,
> +	VENC_BS_MODE_FRAME_FINAL,
> +	VENC_BS_MODE_MAX
> +};
> +
> +/**
> + * struct venc_config - Structure for encoder configuration
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AP-W/R : AP is wr=
iter/reader on this item
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MCU-W/R: MCU is w=
rite/reader on this item
> + * @input_fourcc: input format fourcc
> + * @bitrate: target bitrate (in bps)
> + * @pic_w: visible width of resolution
> + * @pic_h: visible height of resolution
> + * @buf_w: buffer alignment width of resolution
> + * @buf_h: buffer alignment height of resolution
> + * @gop_size: group of picture size (IDR frame period)
> + * @intra_period: I frame period
> + * @framerate: frame rate in fps
> + * @profile: profile_idc in SPS
> + * @level: level_idc in SPS
> + * @core_num: encoder core num
> + * @dpb_size: encode dpb size
> + * @reserved: reserved fields config
> + */
> +struct venc_config {
> +	__u32 input_fourcc;
> +	__u32 bitrate;
> +	__u32 pic_w;
> +	__u32 pic_h;
> +	__u32 buf_w;
> +	__u32 buf_h;
> +	__u32 gop_size;
> +	__u32 intra_period;
> +	__u32 framerate;
> +	__u32 profile;
> +	__u32 level;
> +	__u32 core_num;
> +	__u32 dpb_size;
> +	__u32 reserved[VENC_CONFIG_LENGTH];
> +};
> +
> +/**
> + * struct venc_config_data - Structure for configuration data
> + * @config_data: extended configuration data besides the basic configura=
tion
> + */
> +struct venc_config_data {
> +	unsigned int config_data[VENC_CONFIG_DATA];
> +};
> +
> +/**
> + * struct venc_work_buf - Structure for working buffer information
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AP-W/R : AP is writer/reader on this i=
tem
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MCU-W/R: MCU is write/reader on this i=
tem
> + * @iova: IO virtual address
> + * @pa: physical address
> + * @pa_64: for 64bit pa padding
> + * @va: virtual address
> + * @va_padding: for 64bit va padding
> + * @size: buffer size
> + * @size_padding: for 64bit size padding
> + */
> +struct venc_work_buf {
> +	unsigned long long iova;
> +	union {
> +		unsigned int pa;
> +		unsigned long long pa_64;
> +	};
> +	union {
> +		void *va;
> +		unsigned long long va_padding;
> +	};
> +	union {
> +		unsigned int size;
> +		unsigned long long size_padding;
> +	};
> +};
> +
> +/**
> + * struct venc_work_buf_list - Structure for encode working buffer list
> + * @rc_code: RC code buffer
> + * @rc_info: RC info buffer
> + * @luma: luma buffer
> + * @chroma: chroma buffer
> + * @sub_luma: sub luma buffer
> + * @sub_write: sub write buffer
> + * @col_mv: col_mv buffer
> + * @wpp: wpp buffer
> + * @wpp_nbm: wpp nbm buffer
> + * @skip_frame: skip frame buffer
> + */
> +struct venc_work_buf_list {
> +	struct venc_work_buf rc_code;
> +	struct venc_work_buf rc_info[MAX_VENC_CORE];
> +	struct venc_work_buf luma[MAX_DPB_SIZE];
> +	struct venc_work_buf chroma[MAX_DPB_SIZE];
> +	struct venc_work_buf sub_luma[MAX_DPB_SIZE];
> +	struct venc_work_buf sub_write[MAX_DPB_SIZE];
> +	struct venc_work_buf col_mv[MAX_DPB_SIZE];
> +	struct venc_work_buf wpp[MAX_VENC_CORE];
> +	struct venc_work_buf wpp_nbm[MAX_VENC_CORE];
> +	struct venc_work_buf skip_frame;
> +};
> +
> +/**
> + * struct venc_info -=C2=A0 Structure for encode frame and bs informatio=
n
> + * @fb_addr: frame buffer address array
> + * @fb_size: frame buffer size array
> + * @bs_addr: bitstream buffer address
> + * @bs_size: bitstream buffer size
> + */
> +struct venc_info {
> +	unsigned long long fb_addr[VIDEO_MAX_PLANES];
> +	unsigned int fb_size[VIDEO_MAX_PLANES];
> +	unsigned long long bs_addr;
> +	unsigned long long bs_size;
> +};
> +
> +/**
> + * struct venc_vsi - Structure for VCP driver control and info share
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AP-W/R : AP is writer/reader on thi=
s item
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VCP-W/R: VCP is write/reader on thi=
s item
> + * @config: encoder configuration
> + * @data: encoder configuration data
> + * @bufs: encoder working buffers
> + * @venc: encoder information
> + */
> +struct venc_vsi {
> +	struct venc_config config;
> +	struct venc_config_data data;
> +	struct venc_work_buf_list bufs;
> +	struct venc_info venc;
> +};
> +
> +/**
> + * struct venc_inst - Structure for encoder instance
> + * @hw_base: hardware io address
> + * @pps_buf: PPS buffer
> + * @seq_buf: sequence header buffer
> + * @work_buf_allocated: work buffer allocated or not
> + * @frm_cnt: encoded frame count
> + * @skip_frm_cnt: encoded skip frame count
> + * @prepend_hdr: prepend header flag
> + * @vpu_inst: vpu instance
> + * @vsi: encode vsi
> + * @ctx: encoder context
> + */
> +struct venc_inst {
> +	void __iomem *hw_base;
> +	struct mtk_vcodec_mem pps_buf;
> +	struct mtk_vcodec_mem seq_buf;
> +	bool work_buf_allocated;
> +	unsigned int frm_cnt;
> +	unsigned int skip_frm_cnt;
> +	unsigned int prepend_hdr;
> +	struct venc_vpu_inst vpu_inst;
> +	struct venc_vsi *vsi;
> +	struct mtk_vcodec_enc_ctx *ctx;
> +};
> +
> +static int venc_init(struct mtk_vcodec_enc_ctx *ctx)
> +{
> +	int ret =3D 0;
> +	struct venc_inst *inst;
> +
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->ctx =3D ctx;
> +	inst->vpu_inst.ctx =3D ctx;
> +	inst->vpu_inst.id =3D mtk_vcodec_fw_get_venc_ipi(ctx->dev->fw_handler->=
type);
> +	inst->hw_base =3D mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VEN=
C_SYS);
> +
> +	ret =3D vpu_enc_init(&inst->vpu_inst);
> +	inst->vsi =3D (struct venc_vsi *)inst->vpu_inst.vsi;
> +
> +	if (ret)
> +		kfree(inst);
> +	else
> +		ctx->drv_handle =3D inst;
> +
> +	return ret;
> +}
> +
> +static inline u32 venc_read_reg(struct venc_inst *inst, u32 addr)
> +{
> +	return readl(inst->hw_base + addr);
> +}
> +
> +static unsigned int venc_wait_encode_done(struct venc_inst *inst)
> +{
> +	unsigned int irq_status =3D 0;
> +	struct mtk_vcodec_enc_ctx *ctx =3D (struct mtk_vcodec_enc_ctx *)inst->c=
tx;
> +
> +	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> +					=C2=A0 WAIT_INTR_TIMEOUT_MS, 0)) {
> +		irq_status =3D ctx->irq_status;
> +		mtk_venc_debug(ctx, "irq_status %x <-", irq_status);
> +	}
> +	return irq_status;
> +}
> +
> +static void venc_set_bufs(struct venc_inst *inst,
> +			=C2=A0 struct venc_frm_buf *frm_buf,
> +			=C2=A0 struct mtk_vcodec_mem *bs_buf)
> +{
> +	unsigned int i;
> +
> +	if (frm_buf) {
> +		for (i =3D 0; i < frm_buf->num_planes; i++) {
> +			inst->vsi->venc.fb_addr[i] =3D frm_buf->fb_addr[i].dma_addr;
> +			inst->vsi->venc.fb_size[i] =3D frm_buf->fb_addr[i].size;
> +			mtk_venc_debug(inst->ctx, "%s: fb_buf[%d]: %llx(%d)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, i,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->vsi->venc.fb_addr[i],
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->vsi->venc.fb_size[i]);
> +		}
> +	}
> +
> +	if (bs_buf) {
> +		inst->vsi->venc.bs_addr =3D bs_buf->dma_addr;
> +		inst->vsi->venc.bs_size =3D bs_buf->size;
> +		mtk_venc_debug(inst->ctx, "%s: bs_buf: %llx(%d)\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->vsi->venc.bs_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned int)inst->vsi->venc.bs=
_size);
> +	}
> +}
> +
> +static int venc_encode_sps(struct venc_inst *inst,
> +			=C2=A0=C2=A0 struct mtk_vcodec_mem *bs_buf,
> +			=C2=A0=C2=A0 unsigned int *bs_size)
> +{
> +	int ret =3D 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, NULL, bs_buf);
> +	ret =3D vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS, NULL, bs_buf,=
 NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status =3D venc_wait_encode_done(inst);
> +	if (irq_status !=3D MTK_VENC_IRQ_STATUS_SPS) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_SP=
S);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size =3D venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +	mtk_venc_debug(inst->ctx, "sps bs size %d <-", *bs_size);
> +
> +	return ret;
> +}
> +
> +static int venc_encode_pps(struct venc_inst *inst,
> +			=C2=A0=C2=A0 struct mtk_vcodec_mem *bs_buf,
> +			=C2=A0=C2=A0 unsigned int *bs_size)
> +{
> +	int ret =3D 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, NULL, bs_buf);
> +	ret =3D vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS, NULL, bs_buf,=
 NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status =3D venc_wait_encode_done(inst);
> +	if (irq_status !=3D MTK_VENC_IRQ_STATUS_PPS) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_PP=
S);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size =3D venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +	mtk_venc_debug(inst->ctx, "pps bs size %d <-", *bs_size);
> +
> +	return ret;
> +}
> +
> +static int venc_encode_header(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs_buf,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *bs_size)
> +{
> +	int ret =3D 0;
> +	unsigned int bs_size_sps;
> +	unsigned int bs_size_pps;
> +
> +	ret =3D venc_encode_sps(inst, bs_buf, &bs_size_sps);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D venc_encode_pps(inst, &inst->pps_buf, &bs_size_pps);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
> +	*bs_size =3D bs_size_sps + bs_size_pps;
> +
> +	return ret;
> +}
> +
> +static int venc_encode_frame(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_frm_buf *frm_buf,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs_buf,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *bs_size)
> +{
> +	int ret =3D 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, frm_buf, bs_buf);
> +	ret =3D vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME, frm_buf, bs=
_buf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status =3D venc_wait_encode_done(inst);
> +	if (irq_status !=3D MTK_VENC_IRQ_STATUS_FRM) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_FR=
M);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size =3D venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +
> +	++inst->frm_cnt;
> +
> +	return ret;
> +}
> +
> +static int venc_encode(void *handle,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum venc_start_opt opt,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_frm_buf *frm_buf,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs_buf,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_done_result *result)
> +{
> +	int ret =3D 0;
> +	struct venc_inst *inst =3D (struct venc_inst *)handle;
> +	struct mtk_vcodec_enc_ctx *ctx;
> +	unsigned int bs_size_hdr;
> +
> +	if (WARN_ON(!inst || !inst->vsi))
> +		return -EINVAL;
> +
> +	ctx =3D inst->ctx;
> +
> +	mtk_venc_debug(ctx, "%s: opt: %d\n", __func__, opt);
> +
> +	enable_irq(ctx->dev->enc_irq);
> +	switch (opt) {
> +	case VENC_START_OPT_ENCODE_SEQUENCE_HEADER: {
> +		ret =3D venc_encode_header(inst, bs_buf, &bs_size_hdr);
> +		if (ret)
> +			goto encode_err;
> +
> +		result->bs_size =3D bs_size_hdr;
> +		result->is_key_frm =3D false;
> +		break;
> +	}
> +
> +	case VENC_START_OPT_ENCODE_FRAME: {
> +		if (!inst->prepend_hdr) {
> +			ret =3D venc_encode_frame(inst, frm_buf, bs_buf, &result->bs_size);
> +			if (ret)
> +				goto encode_err;
> +
> +			result->is_key_frm =3D inst->vpu_inst.is_key_frm;
> +			break;
> +		}
> +
> +		ret =3D venc_encode_header(inst, &inst->seq_buf, &bs_size_hdr);
> +		if (ret)
> +			goto encode_err;
> +
> +		ret =3D venc_encode_frame(inst, frm_buf, bs_buf, &result->bs_size);
> +		if (ret)
> +			goto encode_err;
> +
> +		memmove(bs_buf->va + bs_size_hdr, bs_buf->va, result->bs_size);
> +		memcpy(bs_buf->va, inst->seq_buf.va, bs_size_hdr);
> +		result->bs_size +=3D bs_size_hdr;
> +
> +		inst->prepend_hdr =3D 0;
> +		result->is_key_frm =3D inst->vpu_inst.is_key_frm;
> +		break;
> +	}
> +
> +	default:
> +		mtk_venc_err(inst->ctx, "venc_opt %d not supported", opt);
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +encode_err:
> +	disable_irq(ctx->dev->enc_irq);
> +	mtk_venc_debug(ctx, "opt %d, return %d", opt, ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_venc_mem_alloc(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_work_buf *buf)
> +{
> +	dma_addr_t dma_addr;
> +
> +	if (WARN_ON(!dev || !buf))
> +		return -EINVAL;
> +
> +	if (buf->size =3D=3D 0)
> +		return 0;
> +
> +	buf->va =3D dma_alloc_coherent(dev, buf->size, &dma_addr, GFP_KERNEL);
> +	if (!buf->va)
> +		return -ENOMEM;
> +
> +	buf->iova =3D (unsigned long long)dma_addr;
> +
> +	mtk_venc_debug(inst->ctx, "allocate buffer, size: %d, va: %p, iova: 0x%=
llx",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->size, buf->va, buf->iova);
> +
> +	return 0;
> +}
> +
> +static void mtk_venc_mem_free(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_work_buf *buf)
> +{
> +	if (WARN_ON(!dev || !buf))
> +		return;
> +
> +	if (!buf->va)
> +		return;
> +
> +	mtk_venc_debug(inst->ctx, "free buffer, size: %d, va: %p, iova: 0x%llx"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->size, buf->va, buf->iova);
> +
> +	dma_free_coherent(dev, buf->size, buf->va, buf->iova);
> +	buf->va =3D NULL;
> +	buf->iova =3D 0;
> +	buf->size =3D 0;
> +}
> +
> +static void venc_free_rc_buf(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_work_buf_list *bufs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int core_num)
> +{
> +	int i;
> +	struct device *dev;
> +
> +	dev =3D &inst->ctx->dev->plat_dev->dev;
> +	mtk_venc_mem_free(inst, dev, &bufs->rc_code);
> +
> +	for (i =3D 0; i < core_num; i++)
> +		mtk_venc_mem_free(inst, dev, &bufs->rc_info[i]);
> +}
> +
> +static void venc_free_work_buf(struct venc_inst *inst)
> +{
> +	int i;
> +	struct venc_work_buf_list *bufs =3D &inst->vsi->bufs;
> +	unsigned int core_num =3D inst->vsi->config.core_num;
> +	unsigned int dpb_size =3D inst->vsi->config.dpb_size;
> +	struct device *dev;
> +
> +	if (bufs->rc_code.va)
> +		venc_free_rc_buf(inst, bufs, core_num);
> +
> +	dev =3D &inst->ctx->dev->plat_dev->dev;
> +
> +	for (i =3D 0; i < core_num; i++) {
> +		mtk_venc_mem_free(inst, dev, &bufs->wpp[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->wpp_nbm[i]);
> +	}
> +
> +	for (i =3D 0; i < dpb_size; i++) {
> +		mtk_venc_mem_free(inst, dev, &bufs->luma[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->chroma[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->sub_luma[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->sub_write[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->col_mv[i]);
> +	}
> +
> +	if (inst->pps_buf.va)
> +		mtk_vcodec_mem_free(inst->ctx, &inst->pps_buf);
> +
> +	if (inst->seq_buf.va)
> +		mtk_vcodec_mem_free(inst->ctx, &inst->seq_buf);
> +}
> +
> +static int venc_alloc_rc_buf(struct venc_inst *inst,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct venc_work_buf_list *bufs,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int core_num)
> +{
> +	int i;
> +	struct mtk_vcodec_fw *fw =3D inst->ctx->dev->fw_handler;
> +	struct device *dev;
> +	void *tmp_va;
> +
> +	dev =3D &inst->ctx->dev->plat_dev->dev;
> +	if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
> +		return -ENOMEM;
> +
> +	tmp_va =3D mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
> +	memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
> +
> +	for (i =3D 0; i < core_num; i++) {
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
> +			goto err_rc_buf;
> +	}
> +
> +	return 0;
> +
> +err_rc_buf:
> +	venc_free_rc_buf(inst, bufs, core_num);
> +
> +	return -ENOMEM;
> +}
> +
> +static int venc_alloc_work_buf(struct venc_inst *inst)
> +{
> +	int i, ret;
> +	struct venc_work_buf_list *bufs =3D &inst->vsi->bufs;
> +	unsigned int core_num =3D inst->vsi->config.core_num;
> +	unsigned int dpb_size =3D inst->vsi->config.dpb_size;
> +	struct device *dev;
> +
> +	if (bufs->rc_code.size !=3D 0) {
> +		ret =3D venc_alloc_rc_buf(inst, bufs, core_num);
> +		if (ret) {
> +			mtk_venc_err(inst->ctx, "cannot allocate rc buf");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	dev =3D &inst->ctx->dev->plat_dev->dev;
> +
> +	for (i =3D 0; i < core_num; i++) {
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->wpp[i]) ||
> +		=C2=A0=C2=A0=C2=A0 mtk_venc_mem_alloc(inst, dev, &bufs->wpp_nbm[i]))
> +			goto err_alloc;
> +	}
> +
> +	for (i =3D 0; i < dpb_size; i++) {
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->luma[i]) ||
> +		=C2=A0=C2=A0=C2=A0 mtk_venc_mem_alloc(inst, dev, &bufs->chroma[i]) ||
> +		=C2=A0=C2=A0=C2=A0 mtk_venc_mem_alloc(inst, dev, &bufs->sub_luma[i]) |=
|
> +		=C2=A0=C2=A0=C2=A0 mtk_venc_mem_alloc(inst, dev, &bufs->sub_write[i]) =
||
> +		=C2=A0=C2=A0=C2=A0 mtk_venc_mem_alloc(inst, dev, &bufs->col_mv[i]))
> +			goto err_alloc;
> +	}
> +
> +	/* the pps_buf and seq_buf are used by AP side only */
> +	inst->pps_buf.size =3D PPS_SIZE;
> +	ret =3D mtk_vcodec_mem_alloc(inst->ctx, &inst->pps_buf);
> +	if (ret) {
> +		mtk_venc_err(inst->ctx, "cannot allocate pps_buf");
> +		goto err_alloc;
> +	}
> +
> +	inst->seq_buf.size =3D SEQ_HEADER_SIZE;
> +	ret =3D mtk_vcodec_mem_alloc(inst->ctx, &inst->seq_buf);
> +	if (ret) {
> +		mtk_venc_err(inst->ctx, "cannot allocate seq_buf");
> +		goto err_alloc;
> +	}
> +	return 0;
> +
> +err_alloc:
> +	venc_free_work_buf(inst);
> +	return -ENOMEM;
> +}
> +
> +static int venc_set_param(void *handle,
> +			=C2=A0 enum venc_set_param_type type,
> +			=C2=A0 struct venc_enc_param *enc_prm)
> +{
> +	int ret =3D 0;
> +	struct venc_inst *inst =3D (struct venc_inst *)handle;
> +
> +	switch (type) {
> +	case VENC_SET_PARAM_ENC:
> +		if (WARN_ON(!inst->vsi))
> +			return -EINVAL;
> +		inst->vsi->config.input_fourcc =3D enc_prm->input_yuv_fmt;
> +		inst->vsi->config.bitrate =3D enc_prm->bitrate;
> +		inst->vsi->config.pic_w =3D enc_prm->width;
> +		inst->vsi->config.pic_h =3D enc_prm->height;
> +		inst->vsi->config.buf_w =3D enc_prm->buf_width;
> +		inst->vsi->config.buf_h =3D enc_prm->buf_height;
> +		inst->vsi->config.gop_size =3D enc_prm->gop_size;
> +		inst->vsi->config.framerate =3D enc_prm->frm_rate;
> +		inst->vsi->config.intra_period =3D enc_prm->intra_period;
> +		inst->vsi->config.profile =3D enc_prm->profile;
> +		inst->vsi->config.level =3D enc_prm->level;
> +
> +		ret =3D vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
> +		if (ret)
> +			break;
> +
> +		if (inst->work_buf_allocated) {
> +			venc_free_work_buf(inst);
> +			inst->work_buf_allocated =3D false;
> +		}
> +		ret =3D venc_alloc_work_buf(inst);
> +		if (ret)
> +			break;
> +		inst->work_buf_allocated =3D true;
> +		break;
> +	case VENC_SET_PARAM_PREPEND_HEADER:
> +		inst->prepend_hdr =3D 1;
> +		break;
> +	default:
> +		ret =3D vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int venc_deinit(void *handle)
> +{
> +	int ret =3D 0;
> +	struct venc_inst *inst =3D (struct venc_inst *)handle;
> +
> +	ret =3D vpu_enc_deinit(&inst->vpu_inst);
> +
> +	if (inst->work_buf_allocated)
> +		venc_free_work_buf(inst);
> +
> +	kfree(inst);
> +
> +	return ret;
> +}
> +
> +const struct venc_common_if venc_if =3D {
> +	.init =3D venc_init,
> +	.encode =3D venc_encode,
> +	.set_param =3D venc_set_param,
> +	.deinit =3D venc_deinit,
> +};
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h26=
4_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index 0f63657d8bad..4160dc995806 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -723,9 +723,9 @@ static void h264_enc_set_vsi_configs(struct venc_h264=
_inst *inst,
> =C2=A0	inst->vsi->config.framerate =3D enc_prm->frm_rate;
> =C2=A0	inst->vsi->config.intra_period =3D enc_prm->intra_period;
> =C2=A0	inst->vsi->config.profile =3D
> -		h264_get_profile(inst, enc_prm->h264_profile);
> +		h264_get_profile(inst, enc_prm->profile);
> =C2=A0	inst->vsi->config.level =3D
> -		h264_get_level(inst, enc_prm->h264_level);
> +		h264_get_level(inst, enc_prm->level);
> =C2=A0	inst->vsi->config.wfd =3D 0;
> =C2=A0}
> =C2=A0
> @@ -742,9 +742,9 @@ static void h264_enc_set_vsi_34_configs(struct venc_h=
264_inst *inst,
> =C2=A0	inst->vsi_34->config.framerate =3D enc_prm->frm_rate;
> =C2=A0	inst->vsi_34->config.intra_period =3D enc_prm->intra_period;
> =C2=A0	inst->vsi_34->config.profile =3D
> -		h264_get_profile(inst, enc_prm->h264_profile);
> +		h264_get_profile(inst, enc_prm->profile);
> =C2=A0	inst->vsi_34->config.level =3D
> -		h264_get_level(inst, enc_prm->h264_level);
> +		h264_get_level(inst, enc_prm->level);
> =C2=A0	inst->vsi_34->config.wfd =3D 0;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h=
 b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> index 889440a436b6..3c2a1b5e9312 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> @@ -66,8 +66,8 @@ enum venc_set_param_type {
> =C2=A0 * struct venc_enc_prm - encoder settings for VENC_SET_PARAM_ENC us=
ed in
> =C2=A0 *					=C2=A0 venc_if_set_param()
> =C2=A0 * @input_fourcc: input yuv format
> - * @h264_profile: V4L2 defined H.264 profile
> - * @h264_level: V4L2 defined H.264 level
> + * @profile: V4L2 defined profile
> + * @level: V4L2 defined level
> =C2=A0 * @width: image width
> =C2=A0 * @height: image height
> =C2=A0 * @buf_width: buffer width
> @@ -79,8 +79,8 @@ enum venc_set_param_type {
> =C2=A0 */
> =C2=A0struct venc_enc_param {
> =C2=A0	enum venc_yuv_fmt input_yuv_fmt;
> -	unsigned int h264_profile;
> -	unsigned int h264_level;
> +	unsigned int profile;
> +	unsigned int level;
> =C2=A0	unsigned int width;
> =C2=A0	unsigned int height;
> =C2=A0	unsigned int buf_width;
> @@ -107,9 +107,11 @@ struct venc_frame_info {
> =C2=A0/*
> =C2=A0 * struct venc_frm_buf - frame buffer information used in venc_if_e=
ncode()
> =C2=A0 * @fb_addr: plane frame buffer addresses
> + * @num_planes: number of planes
> =C2=A0 */
> =C2=A0struct venc_frm_buf {
> =C2=A0	struct mtk_vcodec_fb fb_addr[MTK_VCODEC_MAX_PLANES];
> +	unsigned int num_planes;
> =C2=A0};
> =C2=A0
> =C2=A0/*
> @@ -124,6 +126,7 @@ struct venc_done_result {
> =C2=A0
> =C2=A0extern const struct venc_common_if venc_h264_if;
> =C2=A0extern const struct venc_common_if venc_vp8_if;
> +extern const struct venc_common_if venc_if;
> =C2=A0
> =C2=A0/*
> =C2=A0 * venc_if_init - Create the driver handle

--=-XW9OZ9zCQ3GNdVJB1kAP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaReeqQAKCRDZQZRRKWBy
9D58AQCBdFyBi/88RnBGe9frEh0MqgPm/mSo3hEzaSv7RUR9bQD8Cbjje0B4JqxC
9V2/NqVdcLBCWlq413TENwyIrdcNmgU=
=BHKV
-----END PGP SIGNATURE-----

--=-XW9OZ9zCQ3GNdVJB1kAP--


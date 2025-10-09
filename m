Return-Path: <linux-media+bounces-44090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF1BC92CF
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 15:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23693E4F48
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 13:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80832E62B7;
	Thu,  9 Oct 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zt9Rjd+W"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252692D77FF
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015060; cv=none; b=jQNEfAc9Bdu6QVC+BtxtPDRGxnw0IEKV/DH7UYPinSUDtcLw1z7l9SXy6VxW+9SyPBnDv+y3AKpZW/CWTEAgWfc5ravagjQ3wdcEFk/3/KGD5M1VO1HEflrrUlU5A8gapQ9Dh2ZTlydDRXRw/irU6cVwYxMRN0WjUTI1+b/f3tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015060; c=relaxed/simple;
	bh=Vi3WR5gKQzv2fYaTOI1FAD/djzA3JL52VKUAId1dIEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h5u1vSboDNs7Oif596WM53RcXDEN6wYQxnpJ+8oM+pqrTDTmojnYHsoNKuBA1J5UGJzuk4Olfbgyi01We/Lsq5zoawrOVteUFU21FyXMk59CN4wahfRAmq0HsRrY6WujnDrdce7vIpUjhkLI4gewEJGoo1XcIe1Xt899kgMGRhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zt9Rjd+W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760015055;
	bh=Vi3WR5gKQzv2fYaTOI1FAD/djzA3JL52VKUAId1dIEI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Zt9Rjd+Ww3Rbob5FxLF6Jm1/UshbBx6TVkCktGtRyevhT/y7vbRE0huApqf/hp4SI
	 OeNfiFN53Bc1JUaSkVjbUpdf3ynmWTru/LqUkfygHre8RIY8/KW8csXSLJCS/CmEJf
	 FjQIPslKZxcGGvpVSQYjFh+NH0WO/MDyUXFn+dng7YSidGqIUbk7tx02/WYv243HOt
	 PP0ZNthKQcNMh3rM9iIbk09kJMjFXeBHo8nKUA4Padz1TWomFeJOKvn9pGT97deLY8
	 nb/yDlVTahFv+V8klkUEQKhhxeNYiNfr5sbTVA7ilaJ5m10eyF0cOwFfN4zYojYDpa
	 iifctZlsPSfgg==
Received: from [IPv6:2606:6d00:17:ebd3::c41] (unknown [IPv6:2606:6d00:17:ebd3::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA95F17E12DA;
	Thu,  9 Oct 2025 15:04:12 +0200 (CEST)
Message-ID: <45a3e39fb87fc4e32626dfaa277a314bce5f4f68.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: Don't copy frame flags for
 frame-based devices
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Bin Liu	
 <bin.liu@mediatek.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec	 <jernej.skrabec@gmail.com>, Jiasheng Jiang
 <jiashengjiangcool@gmail.com>,  Matthew Majewski <mattwmajewski@gmail.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuah
 Khan	 <skhan@linuxfoundation.org>, Steve Longerbeam
 <slongerbeam@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>
Date: Thu, 09 Oct 2025 09:04:10 -0400
In-Reply-To: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
References: <20251009111143.9137-1-laurent.pinchart@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-EQAjgLvtRVqsmS5rugFY"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-EQAjgLvtRVqsmS5rugFY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 09 octobre 2025 =C3=A0 14:11 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
>=20
> Many frame-based M2M drivers (e.g. for JPEG encoders, scalers,
> dewarpers, 2D blenders, ...) set the argument to true, while the frame
> flags are not applicable to those drivers as they have no concept of
> key, B or P frames. Set the argument to false to avoid further
> cargo-cult mistakes.

There is no use cases in any upstream driver for copying them over (even in
Tegra 20 decoder driver). KEY/P/B are properties of bitstream buffer in som=
e
formats. Once decoded, this is no longer a property of the video frame and
should be discarded. So even decoder supporting that feature should not cop=
y
them over.

I'd remove the boolean completely to be fair, this is always inappropriate =
to
set this to true. I'd be fine doing it in two steps, but then the list shou=
ld be
completed, see below:

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0=C2=A0 =
| 4 ++--
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0=C2=A0 =
| 4 ++--
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/nxp/dw100/dw100.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/st/stm32/dma2d/dma2d.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/sunxi/sun8i-di/sun8i-di.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
> =C2=A0drivers/media/test-drivers/vim2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/staging/media/imx/imx-media-csc-scaler.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-

Missing:

- drivers/media/platform/amphion/vdec.c
- drivers/media/platform/mediatek/vcodec/decoder/vdec/*
- drivers/media/platform/nvidia/tegra-vde/h264.c
- drivers/media/platform/rockchip/rkvdec/rkvdec.c
- drivers/media/platform/verisilicon/hantro_drv.c
- drivers/staging/media/sunxi/cedrus/cedrus_dec.c

cheers,
Nicolas

> =C2=A012 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 35c70ec3ad2c..6bd5036430dc 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1619,7 +1619,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0	if (!dst_buf)
> =C2=A0		goto getbuf_fail;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> @@ -1715,7 +1715,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0	if (!dst_buf)
> =C2=A0		goto getbuf_fail;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> =C2=A0	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index e78e1d11093c..556865100872 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -530,7 +530,7 @@ static void mtk_jpegdec_timeout_work(struct work_stru=
ct
> *work)
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> =C2=A0	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> @@ -560,7 +560,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
,
> void *priv)
> =C2=A0	ctx =3D jpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D jpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	irq_status =3D mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> =C2=A0	dec_irq_ret =3D mtk_jpeg_dec_enum_result(irq_status);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 9ab27aee302a..4c8427b3c384 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -261,7 +261,7 @@ static void mtk_jpegenc_timeout_work(struct work_stru=
ct
> *work)
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> =C2=A0	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> @@ -289,7 +289,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
,
> void *priv)
> =C2=A0	ctx =3D jpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D jpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	irq_status =3D readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> =C2=A0		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> index 59ce5cce0698..dba46a69c6be 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -51,7 +51,7 @@ static void mdp_m2m_process_done(void *priv, int vb_sta=
te)
> =C2=A0	ctx->curr_param.frame_no =3D ctx->frame_count[MDP_M2M_SRC];
> =C2=A0	src_vbuf->sequence =3D ctx->frame_count[MDP_M2M_SRC]++;
> =C2=A0	dst_vbuf->sequence =3D ctx->frame_count[MDP_M2M_DST]++;
> -	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
> =C2=A0
> =C2=A0	v4l2_m2m_buf_done(src_vbuf, vb_state);
> =C2=A0	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> b/drivers/media/platform/nxp/dw100/dw100.c
> index 7a0ee44d9e1f..b73302d54635 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1483,7 +1483,7 @@ static void dw100_start(struct dw100_ctx *ctx, stru=
ct
> vb2_v4l2_buffer *in_vb,
> =C2=A0				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
> =C2=A0		in_vb->sequence, out_vb->sequence);
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
> =C2=A0
> =C2=A0	/* Now, let's deal with hardware ... */
> =C2=A0	dw100_hw_master_bus_disable(dw_dev);
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 37e0670f98c5..e1dda1e834e4 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1537,7 +1537,7 @@ static void mxc_jpeg_device_run(void *priv)
> =C2=A0	src_buf->sequence =3D q_data_out->sequence++;
> =C2=A0	dst_buf->sequence =3D q_data_cap->sequence++;
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	jpeg_src_buf =3D vb2_to_mxc_buf(&src_buf->vb2_buf);
> =C2=A0	if (q_data_cap->fmt->mem_planes !=3D dst_buf->vb2_buf.num_planes) =
{
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index 48b88da59da0..075b684fb178 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -75,7 +75,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
> =C2=A0		WARN_ON(!src);
> =C2=A0		WARN_ON(!dst);
> =C2=A0
> -		v4l2_m2m_buf_copy_metadata(src, dst, true);
> +		v4l2_m2m_buf_copy_metadata(src, dst, false);
> =C2=A0
> =C2=A0		dst->sequence =3D ctx->csequence++;
> =C2=A0
> diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c
> b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> index 643913adc1f3..4184bdb96e6d 100644
> --- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
> +++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> @@ -483,7 +483,7 @@ static void device_run(void *prv)
> =C2=A0
> =C2=A0	src->sequence =3D frm_out->sequence++;
> =C2=A0	dst->sequence =3D frm_cap->sequence++;
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
> =C2=A0
> =C2=A0	if (clk_enable(dev->gate))
> =C2=A0		goto end;
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> index 3e7f2df70408..11a6c7f5212e 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -71,7 +71,7 @@ static void deinterlace_device_run(void *priv)
> =C2=A0	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
> =C2=A0
> =C2=A0	deinterlace_write(dev, DEINTERLACE_MOD_ENABLE,
> =C2=A0			=C2=A0 DEINTERLACE_MOD_ENABLE_EN);
> diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> index abd10b218aa1..f6e2f11a20dd 100644
> --- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> +++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> @@ -70,7 +70,7 @@ static void rotate_device_run(void *priv)
> =C2=A0	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> =C2=A0	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst, false);
> =C2=A0
> =C2=A0	val =3D ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
> =C2=A0	if (ctx->hflip)
> diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-
> drivers/vim2m.c
> index dc82830a35a5..3e8476165721 100644
> --- a/drivers/media/test-drivers/vim2m.c
> +++ b/drivers/media/test-drivers/vim2m.c
> @@ -482,7 +482,7 @@ static int device_process(struct vim2m_ctx *ctx,
> =C2=A0
> =C2=A0	out_vb->sequence =3D q_data_out->sequence++;
> =C2=A0	in_vb->sequence =3D q_data_in->sequence++;
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, false);
> =C2=A0
> =C2=A0	if (ctx->mode & MEM2MEM_VFLIP) {
> =C2=A0		start =3D height - 1;
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c
> b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index 19fd31cb9bb0..770ba3fbaba2 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -96,7 +96,7 @@ static void ipu_ic_pp_complete(struct ipu_image_convert=
_run
> *run, void *_ctx)
> =C2=A0	src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> =C2=A0
> =C2=A0	src_buf->sequence =3D ctx->sequence++;
> =C2=A0	dst_buf->sequence =3D src_buf->sequence;
>=20
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a

--=-EQAjgLvtRVqsmS5rugFY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOeyygAKCRDZQZRRKWBy
9IbiAQDT+EcdhGBuv/4QUbUY6P38kMHJbFh6c1qSDIlig80ebgD+IcmT6Q7Pfmzf
EBEYrYY1qr1wWBAXTVBIAWGsXuVregk=
=uUwO
-----END PGP SIGNATURE-----

--=-EQAjgLvtRVqsmS5rugFY--


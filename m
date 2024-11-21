Return-Path: <linux-media+bounces-21768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE149D4E97
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 15:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1C8AB2620B
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5061D8A08;
	Thu, 21 Nov 2024 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hkCQDWla"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427A1D88D1;
	Thu, 21 Nov 2024 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732198866; cv=none; b=ovGcugNP3Lg9u5Rmp5k20AyVK1SIk1jioYGuoFzOua0PXFWoZN2RWc8w6uLS079+NcmJmWSJZftR61i/0MH5exeUuTdY6vdvUY5mUWe8HcxlZK02BWYFAOIGI6Ic+UzdASyXY79aZ9G6b9yE81u51EuA5x7uk7mCVw58LC5kX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732198866; c=relaxed/simple;
	bh=XrWNbUaQHxdhVGLsaRR8H43ccZOPiVT7ZhEp9+0lG/g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kjcTc4eO48bpDcZb8up9BO6Sh+uti9jQwG/00hI67hsWxYMXD5lVGzPgZjVbNEM6huPu+BFKMC/XNjh3JpDYL2fHxPNalRPe5HlefsLCJBhK6pvW9lkuvL5slr5tjETmIop4JfT2IFz2jORFn/SQYLKOImggaHjxSFPBcE97GNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hkCQDWla; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732198855;
	bh=XrWNbUaQHxdhVGLsaRR8H43ccZOPiVT7ZhEp9+0lG/g=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=hkCQDWlaMSNNUraJPT4ZbovKwKwtSdjoGf2KYIXNRxoGTf7nYTXBlfueOPIsi/HAC
	 sOFYoLwdfFJwNdN1X6mweGfkcwsz8Oiys+2AGowHXgarFYtod23BW1WDm+hTdcY1cg
	 Drf4G6eL+JuUlQ1aCXb1KAvRei5N6GaWFritjKVy8OsnHQY3QXEJznS+bWLKlO5lb1
	 XZtWUW0RuUd+PAfTT6CyYQCQjr3HXabYULDOa6R6y0xApX3Bn5kgRXp5S44nFYh1FG
	 jub+J2k29eLCGBXDC+TsnxyCZ9b4zkDfJCAq6GG0UjbKGbfcafS45wC8jUUAU9AjU5
	 UoB1otOh5MwPA==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 145C317E3684;
	Thu, 21 Nov 2024 15:20:53 +0100 (CET)
Message-ID: <41310959a7b40f8e28fb324e00c4a51966bec803.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: verisilicon: add WebP decoding support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig	 <frkoenig@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 21 Nov 2024 09:20:52 -0500
In-Reply-To: <cf81e5f2-45a4-4c82-890c-c8a4d17b22df@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
	 <20241120110105.244413-3-hugues.fruchet@foss.st.com>
	 <c9f19faacccd47b8a72fc4a29a0f75b30bce1aa1.camel@collabora.com>
	 <cf81e5f2-45a4-4c82-890c-c8a4d17b22df@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hugues,

Le jeudi 21 novembre 2024 à 11:07 +0100, Hugues FRUCHET a écrit :
> Hi Nicolas,
> 
> On 11/20/24 15:25, Nicolas Dufresne wrote:
> > Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
> > > Add WebP picture decoding support to VP8 stateless decoder.
> > > 
> > > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > > ---
> > >   .../media/platform/verisilicon/hantro_g1_regs.h |  1 +
> > >   .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
> > >   .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
> > >   .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
> > >   4 files changed, 32 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > index c623b3b0be18..e7d4db788e57 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> > > @@ -232,6 +232,7 @@
> > >   #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
> > >   #define G1_REG_ADDR_STR					0x030
> > >   #define G1_REG_ADDR_DST					0x034
> > > +#define G1_REG_ADDR_DST_CHROMA				0x038
> > >   #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
> > >   #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
> > >   #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
> > > diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > index 851eb67f19f5..c83ee6f5edc8 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> > > @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
> > >   			   G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
> > >   			   G1_REG_DEC_CTRL3);
> > >   
> > > +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> > > +		vdpu_write_relaxed(vpu,
> > > +				   G1_REG_DEC_CTRL3_STREAM_LEN_EXT
> > > +					(dct_part_total_len >> 24),
> > > +				   G1_REG_DEC_CTRL3);
> > > +
> > >   	/* DCT partitions base address */
> > >   	for (i = 0; i < hdr->num_dct_parts; i++) {
> > >   		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
> > > @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
> > >   
> > >   	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
> > >   	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> > > +
> > > +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> > > +		vdpu_write_relaxed(vpu, dst_dma +
> > > +				   ctx->dst_fmt.plane_fmt[0].bytesperline *
> > > +				   ctx->dst_fmt.height,
> > > +				   G1_REG_ADDR_DST_CHROMA);
> > >   }
> > >   
> > >   int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> > > @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> > >   		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
> > >   	if (hdr->lf.level == 0)
> > >   		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
> > > +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> > > +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
> > >   	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
> > >   
> > >   	/* Frame dimensions */
> > > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > index 2513adfbd825..7075b2ba1ec2 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
> > >   		break;
> > >   	case V4L2_PIX_FMT_MPEG2_SLICE:
> > >   	case V4L2_PIX_FMT_VP8_FRAME:
> > > +	case V4L2_PIX_FMT_WEBP_FRAME:
> > >   	case V4L2_PIX_FMT_H264_SLICE:
> > >   	case V4L2_PIX_FMT_HEVC_SLICE:
> > >   	case V4L2_PIX_FMT_VP9_FRAME:
> > > @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
> > >   	case V4L2_PIX_FMT_JPEG:
> > >   	case V4L2_PIX_FMT_MPEG2_SLICE:
> > >   	case V4L2_PIX_FMT_VP8_FRAME:
> > > +	case V4L2_PIX_FMT_WEBP_FRAME:
> > >   	case V4L2_PIX_FMT_HEVC_SLICE:
> > >   	case V4L2_PIX_FMT_VP9_FRAME:
> > >   		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
> > > diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> > > index 833821120b20..48d6912c3bab 100644
> > > --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> > > +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> > > @@ -22,10 +22,10 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
> > >   		.codec_mode = HANTRO_MODE_NONE,
> > >   		.frmsize = {
> > >   			.min_width = FMT_MIN_WIDTH,
> > > -			.max_width = FMT_FHD_WIDTH,
> > > +			.max_width = FMT_4K_WIDTH,
> > >   			.step_width = MB_DIM,
> > >   			.min_height = FMT_MIN_HEIGHT,
> > > -			.max_height = FMT_FHD_HEIGHT,
> > > +			.max_height = FMT_4K_HEIGHT,
> > 
> > I'm a little surprised of this change, since this is modifying VP8_FRAME, while
> > we should instead introduce WEBP_FRAME.
> 
> This is the resolution of the YUV output of decoder, not the WebP input, 
> and because of lack of post-processor, the output is not scaled, so can 
> go up to 4K with WebP.
> Before WebP introduction, the maximum output resolution was FHD for all 
> codecs. Now WebP allows up to 4K but FHD constraint remains for 
> H264/VP8. I don't see real problems because VP8/H264 compressed inputs 
> are well limited to FHD and only WebP allows 4K...

Good point. Would you mind adding a justification for this change within the
commit message in v3 ?

> 
> > 
> > >   			.step_height = MB_DIM,
> > >   		},
> > >   	},
> > > @@ -68,6 +68,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
> > >   		.codec_mode = HANTRO_MODE_NONE,
> > >   		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
> > >   	},
> > > +	{
> > > +		.fourcc = V4L2_PIX_FMT_WEBP_FRAME,
> > > +		.codec_mode = HANTRO_MODE_VP8_DEC,
> > > +		.max_depth = 2,
> > > +		.frmsize = {
> > > +			.min_width = FMT_MIN_WIDTH,
> > > +			.max_width = FMT_4K_WIDTH,
> > > +			.step_width = MB_DIM,
> > > +			.min_height = FMT_MIN_HEIGHT,
> > > +			.max_height = FMT_4K_HEIGHT,
> > > +			.step_height = MB_DIM,
> > > +		},
> > > +	},
> > 
> > This is venc_fmt (encoder), this shouldn't be there.
> 
> All apologizes for this rebase issue, it is of course part of 
> stm32mp25_vdec_fmts.

Ack, let's get this right in v3 :-D

> 
> > 
> > >   	{
> > >   		.fourcc = V4L2_PIX_FMT_YUYV,
> > >   		.codec_mode = HANTRO_MODE_NONE,
> > 
> 
> BR,
> Hugues.



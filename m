Return-Path: <linux-media+bounces-44566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA9BDE0F5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 12:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7070E19C3CB6
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3175631B803;
	Wed, 15 Oct 2025 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="CX9ucnqO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E91A5BA2;
	Wed, 15 Oct 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524802; cv=pass; b=sWV/3YEIai9gT5V461mJK0QUQEigfLv9r12XVKRkqzBr/IQ3hUm4TalSFF+DylI+2ta/fqmfNSevL64AqU7rb6p6BTHxqCH221T4iwKzvZ4U5neJsiWZm4BTj97nKLcnI7BKdX1dzcAYF1B1do2XGEbcOn0UTOOf/WKnF/No5Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524802; c=relaxed/simple;
	bh=qgEbHLCXvbJrKJcO+XAYTazU+JZ+gG6o6DGnjZaGalI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyZTD2qXc9eg9FYFhlQmhVbpO2lEoAonaIGcIiNRtS0CP9cZ+MbMBm/eHzEEJNQ9M4wWMBa2vZqlue91/IOGLsbgevsjQ0pB55BcuxCStIYFNs4v7Qf7jawPEk5ccrv9+RtrmZZPVK1PjqvpFCnWgKnoHZoXYUuNLEtoOWrJ0cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=CX9ucnqO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1760524738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FUTfp5yum/Vfn1bQxCyxoujMyXoz/BRrgcgqPflteJdELRMjoSs2n2LMyl9nuHWucZPCMeKSIY0pDJQyEFap6vBvMli6fFu6GPEZZa2/uNJiSQmD9IdF16aZCBLwXqRKple6s2Oq94ZfKrQg+JSNlDyVWaGGttr6eJqYiwpg4cY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760524738; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MWYP/aNgjRCGts/VbNNkjNc+sdGx7l/0S3TJEsCEcjM=; 
	b=K9LCJ+e1KR5qM4SuvF1xvukR4TDhyGVtgXpsbtgtVNZ/hk6LiKQLchvz/gTGXmrb28e877ieC8KCvRvYZAyDkUbEh2vVnDAFYIXPHexLPlNsw04gG5POL90YIn16Q7tc9BZC3pPqx835I0Gua6mZcAlE2eBp2q4634zHxthcodA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760524738;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MWYP/aNgjRCGts/VbNNkjNc+sdGx7l/0S3TJEsCEcjM=;
	b=CX9ucnqODsrtBjMjeVD9Ye6NRJ10OMkJMf/ZQnTV2o3n5zbqmJ8WXgHSVgQ/Wfci
	4NQoSVRr9uO4OqhHeRKOytbGQhxuuNkZyuO8RJs3saK2tPhFi0Pna6FCvRbvOd48i8c
	sAovLovalIs3CSY3iv7aDmgn3cFku+AbztQ9BqvQ=
Received: by mx.zohomail.com with SMTPS id 1760524735523797.9819794035571;
	Wed, 15 Oct 2025 03:38:55 -0700 (PDT)
Message-ID: <c430ab36-7c49-4486-864d-7cf53dc2a723@collabora.com>
Date: Wed, 15 Oct 2025 12:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: v4l2-mem2mem: Don't copy frame flags in
 v4l2_m2m_buf_copy_metadata()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-staging@lists.linux.dev
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Bin Liu
 <bin.liu@mediatek.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Devarsh Thakkar <devarsht@ti.com>, Dmitry Osipenko <digetx@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jacob Chen <jacob-chen@iotwrt.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Zhou Peng <eagle.zhou@nxp.com>
References: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 15/10/2025 à 12:01, Laurent Pinchart a écrit :
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
>
> There is no use cases in any upstream driver for copying the flags.
> KEY/P/B frames are properties of the bitstream buffer in some formats.
> Once decoded, this is no longer a property of the video frame and should
> be discarded.
>
> It was considered useful to know if an uncompressed frame was decoded
> from a KEY/P/B compressed frame, and to preserve that information if
> that same uncompressed frame was passed through another M2M device (e.g.
> a scaler). However, the V4L2 documentation makes it clear that the flags
> are meant for compressed frames only.
>
> Drop the copy_frame_flags argument from v4l2_m2m_buf_copy_metadata().
> The change to drivers was performed with the following Coccinelle
> semantic patch:
>
> @@
> expression src;
> expression dst;
> expression flag;
> @@
> -       v4l2_m2m_buf_copy_metadata(src, dst, flag);
> +       v4l2_m2m_buf_copy_metadata(src, dst);
>
> include/media/v4l2-mem2mem.h and drivers/media/v4l2-core/v4l2-mem2mem.c
> have been updated manually.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/allegro-dvt/allegro-core.c  |  2 +-
>   drivers/media/platform/amphion/vdec.c              |  2 +-
>   drivers/media/platform/amphion/venc.c              |  2 +-
>   drivers/media/platform/chips-media/coda/coda-bit.c |  2 +-
>   .../media/platform/chips-media/coda/coda-jpeg.c    |  4 ++--
>   .../media/platform/imagination/e5010-jpeg-enc.c    |  2 +-
>   .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  4 ++--
>   .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |  4 ++--
>   .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |  4 ++--
>   .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  2 +-
>   .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  4 ++--
>   .../vcodec/decoder/vdec/vdec_h264_req_if.c         |  2 +-
>   .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c   | 14 ++++++++------
>   .../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c   |  5 +++--
>   .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c |  2 +-
>   .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  6 +++---
>   drivers/media/platform/nvidia/tegra-vde/h264.c     |  2 +-
>   drivers/media/platform/nxp/dw100/dw100.c           |  2 +-
>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  2 +-
>   drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
>   drivers/media/platform/rockchip/rga/rga.c          |  2 +-
>   drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  2 +-
>   drivers/media/platform/st/stm32/dma2d/dma2d.c      |  2 +-
>   drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  2 +-
>   .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  2 +-
>   drivers/media/platform/verisilicon/hantro_drv.c    |  2 +-
>   drivers/media/test-drivers/vicodec/vicodec-core.c  |  4 ++--
>   drivers/media/test-drivers/vim2m.c                 |  2 +-
>   drivers/media/test-drivers/visl/visl-dec.c         |  2 +-
>   drivers/media/v4l2-core/v4l2-mem2mem.c             |  9 ++-------
>   drivers/staging/media/imx/imx-media-csc-scaler.c   |  2 +-
>   drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |  2 +-
>   include/media/v4l2-mem2mem.h                       | 12 +++---------
>   33 files changed, 53 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 510c3c9661d9..0b8766a7b560 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -2124,7 +2124,7 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
>   
>   	state = VB2_BUF_STATE_DONE;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   	if (msg->is_idr)
>   		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	else
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
> index 32eef2fd1f2a..1f303b9b4e60 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -823,7 +823,7 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
>   	vbuf = &vpu_buf->m2m_buf.vb;
>   	src_buf = vdec_get_src_buffer(inst, info->consumed_count);
>   	if (src_buf) {
> -		v4l2_m2m_buf_copy_metadata(src_buf, vbuf, true);
> +		v4l2_m2m_buf_copy_metadata(src_buf, vbuf);
>   		if (info->consumed_count) {
>   			v4l2_m2m_src_buf_remove(inst->fh.m2m_ctx);
>   			vpu_set_buffer_state(src_buf, VPU_BUF_STATE_IDLE);
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
> index c5c1f1fbaa80..2e4708a878fc 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -790,7 +790,7 @@ static int venc_get_one_encoded_frame(struct vpu_inst *inst,
>   
>   	src_buf = vpu_find_buf_by_sequence(inst, inst->out_format.type, frame->info.frame_id);
>   	if (src_buf) {
> -		v4l2_m2m_buf_copy_metadata(src_buf, vbuf, true);
> +		v4l2_m2m_buf_copy_metadata(src_buf, vbuf);
>   		vpu_set_buffer_state(src_buf, VPU_BUF_STATE_IDLE);
>   		v4l2_m2m_src_buf_remove_by_buf(inst->fh.m2m_ctx, src_buf);
>   		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
> index 84ded154adfe..fa6b72c3bd93 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -1685,7 +1685,7 @@ static void coda_finish_encode(struct coda_ctx *ctx)
>   		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
>   	dst_buf->flags |= src_buf->flags & V4L2_BUF_FLAG_LAST;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>   
> diff --git a/drivers/media/platform/chips-media/coda/coda-jpeg.c b/drivers/media/platform/chips-media/coda/coda-jpeg.c
> index 5746892658b1..fb150b87c773 100644
> --- a/drivers/media/platform/chips-media/coda/coda-jpeg.c
> +++ b/drivers/media/platform/chips-media/coda/coda-jpeg.c
> @@ -1245,7 +1245,7 @@ static void coda9_jpeg_finish_encode(struct coda_ctx *ctx)
>   	dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	dst_buf->flags |= src_buf->flags & V4L2_BUF_FLAG_LAST;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>   	coda_m2m_buf_done(ctx, dst_buf, err_mb ? VB2_BUF_STATE_ERROR :
> @@ -1472,7 +1472,7 @@ static void coda9_jpeg_finish_decode(struct coda_ctx *ctx)
>   	dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	dst_buf->flags |= src_buf->flags & V4L2_BUF_FLAG_LAST;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>   	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, q_data_dst->sizeimage);
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> index c4e0097cb8b7..cc8c746626c4 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -1358,7 +1358,7 @@ static void e5010_device_run(void *priv)
>   	s_vb->sequence = ctx->out_queue.sequence++;
>   	d_vb->sequence = ctx->cap_queue.sequence++;
>   
> -	v4l2_m2m_buf_copy_metadata(s_vb, d_vb, false);
> +	v4l2_m2m_buf_copy_metadata(s_vb, d_vb);
>   
>   	if (ctx != e5010->last_context_run || ctx->update_qp) {
>   		dprintk(e5010, 1, "ctx updated: 0x%p -> 0x%p, updating qp tables\n",
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 6268d651bdcf..dc492b5072a3 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1625,7 +1625,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
>   	if (!dst_buf)
>   		goto getbuf_fail;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	mtk_jpegenc_set_hw_param(ctx, hw_id, src_buf, dst_buf);
>   	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> @@ -1721,7 +1721,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	if (!dst_buf)
>   		goto getbuf_fail;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
>   	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index e78e1d11093c..32372781daf5 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -530,7 +530,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
>   
>   	src_buf = cjpeg->hw_param.src_buffer;
>   	dst_buf = cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	mtk_jpeg_dec_reset(cjpeg->reg_base);
>   	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> @@ -560,7 +560,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   	ctx = jpeg->hw_param.curr_ctx;
>   	src_buf = jpeg->hw_param.src_buffer;
>   	dst_buf = jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
>   	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 9ab27aee302a..b6f5b2249f1f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -261,7 +261,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
>   
>   	src_buf = cjpeg->hw_param.src_buffer;
>   	dst_buf = cjpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	mtk_jpeg_enc_reset(cjpeg->reg_base);
>   	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> @@ -289,7 +289,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>   	ctx = jpeg->hw_param.curr_ctx;
>   	src_buf = jpeg->hw_param.src_buffer;
>   	dst_buf = jpeg->hw_param.dst_buffer;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
>   		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> index 9ef956b565a7..44140987cf5f 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
> @@ -51,7 +51,7 @@ static void mdp_m2m_process_done(void *priv, int vb_state)
>   	ctx->curr_param.frame_no = ctx->frame_count[MDP_M2M_SRC];
>   	src_vbuf->sequence = ctx->frame_count[MDP_M2M_SRC]++;
>   	dst_vbuf->sequence = ctx->frame_count[MDP_M2M_DST]++;
> -	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
> +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf);
>   
>   	v4l2_m2m_buf_done(src_vbuf, vb_state);
>   	v4l2_m2m_buf_done(dst_vbuf, vb_state);
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> index bf21f2467a0f..bca3156607d2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> @@ -1073,7 +1073,7 @@ static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance
>   
>   	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
>   	dst = &lat_buf->ts_info;
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   	vsi->frame.cur_ts = dst->vb2_buf.timestamp;
>   
>   	return 0;
> @@ -1780,7 +1780,7 @@ static int vdec_av1_slice_setup_core_to_dst_buf(struct vdec_av1_slice_instance *
>   	if (!dst)
>   		return -EINVAL;
>   
> -	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, dst);
>   
>   	return 0;
>   }
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> index 1e1b32faac77..b9a5ea7887d3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> @@ -367,7 +367,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
>   
>   	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> -				   &dst_buf_info->m2m_buf.vb, true);
> +				   &dst_buf_info->m2m_buf.vb);
>   	err = get_vdec_decode_parameters(inst);
>   	if (err)
>   		goto err_free_fb_out;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> index 5b25e1679b51..9a9dc2f88d6e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> @@ -570,7 +570,7 @@ static int vdec_h264_slice_setup_core_buffer_ext(struct vdec_h264_slice_inst *in
>   	}
>   
>   	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2);
>   
>   	return 0;
>   }
> @@ -674,7 +674,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>   	}
>   
>   	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2);
>   
>   	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
>   					    share_info);
> @@ -768,7 +768,8 @@ static int vdec_h264_slice_lat_decode_ext(void *h_vdec, struct mtk_vcodec_mem *b
>   	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>   
>   	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> -	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &lat_buf->ts_info);
>   
>   	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
>   						     &inst->vsi_ext->h264_slice_params);
> @@ -900,7 +901,8 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   
>   	inst->vsi->dec.nal_info = buf[nal_start_idx];
>   	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> -	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &lat_buf->ts_info);
>   
>   	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
>   						     &inst->vsi->h264_slice_params);
> @@ -1039,7 +1041,7 @@ static int vdec_h264_slice_single_decode_ext(void *h_vdec, struct mtk_vcodec_mem
>   	inst->vsi_ctx_ext.dec.vdec_fb_va = (u64)(uintptr_t)fb;
>   
>   	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> -				   &dst_buf_info->m2m_buf.vb, true);
> +				   &dst_buf_info->m2m_buf.vb);
>   	err = get_vdec_sig_decode_parameters(inst);
>   	if (err)
>   		goto err_free_fb_out;
> @@ -1135,7 +1137,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
>   	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
>   
>   	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> -				   &dst_buf_info->m2m_buf.vb, true);
> +				   &dst_buf_info->m2m_buf.vb);
>   	err = get_vdec_sig_decode_parameters(inst);
>   	if (err)
>   		goto err_free_fb_out;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> index 2725db882e5b..88eca50c2017 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> @@ -742,7 +742,8 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
>   
>   	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>   	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> -	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &lat_buf->ts_info);
>   
>   	*res_chg = inst->resolution_changed;
>   	if (inst->resolution_changed) {
> @@ -847,7 +848,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
>   	}
>   
>   	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2);
>   
>   	return 0;
>   }
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> index 232ef3bd246a..e1d4960553f2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> @@ -358,7 +358,7 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   		       y_fb_dma, c_fb_dma);
>   
>   	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> -				   &dst_buf_info->m2m_buf.vb, true);
> +				   &dst_buf_info->m2m_buf.vb);
>   
>   	err = vdec_vp8_slice_get_decode_parameters(inst);
>   	if (err)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index 47c302745c1d..eeaff3f8e3e0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -706,7 +706,7 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *
>   	if (!dst)
>   		return -EINVAL;
>   
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	return 0;
>   }
> @@ -724,7 +724,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance
>   	lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
>   
>   	dst = &lat_buf->ts_info;
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   	return 0;
>   }
>   
> @@ -1652,7 +1652,7 @@ static int vdec_vp9_slice_setup_core_to_dst_buf(struct vdec_vp9_slice_instance *
>   	if (!dst)
>   		return -EINVAL;
>   
> -	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, dst, true);
> +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, dst);
>   	return 0;
>   }
>   
> diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
> index 45f8f6904867..2a2211671fd9 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/h264.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
> @@ -776,7 +776,7 @@ static int tegra_vde_h264_setup_frames(struct tegra_ctx *ctx,
>   	 * If userspace doesn't tell us frame's type, then we will try decode
>   	 * as-is.
>   	 */
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	if (h->decode_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BFRAME)
>   		tb->b_frame = true;
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 97744c7b7c03..1299b4b852f3 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1437,7 +1437,7 @@ static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>   				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE),
>   		in_vb->sequence, out_vb->sequence);
>   
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb);
>   
>   	/* Now, let's deal with hardware ... */
>   	dw100_hw_master_bus_disable(dw_dev);
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index df3ccdf767ba..64cb06cf479f 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1537,7 +1537,7 @@ static void mxc_jpeg_device_run(void *priv)
>   	src_buf->sequence = q_data_out->sequence++;
>   	dst_buf->sequence = q_data_cap->sequence++;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
>   	if (q_data_cap->fmt->mem_planes != dst_buf->vb2_buf.num_planes) {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 00afcbfbdde4..20fc5347c2d0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -107,7 +107,7 @@ static void mxc_isi_m2m_frame_write_done(struct mxc_isi_pipe *pipe, u32 status)
>   	src_vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>   	dst_vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>   
> -	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
> +	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf);
>   
>   	src_vbuf->sequence = ctx->queues.out.sequence++;
>   	dst_vbuf->sequence = ctx->queues.cap.sequence++;
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 776046de979a..b5196880fea8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -75,7 +75,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
>   		WARN_ON(!src);
>   		WARN_ON(!dst);
>   
> -		v4l2_m2m_buf_copy_metadata(src, dst, true);
> +		v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   		dst->sequence = ctx->csequence++;
>   
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 6e606d73ff51..cb02c6988602 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -783,7 +783,7 @@ void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
>   	if (src_req)
>   		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
>   
> -	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst, true);
> +	v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst);
>   }
>   
>   void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run *run)
> diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> index 468c247ba328..baf5939677f1 100644
> --- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
> +++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
> @@ -490,7 +490,7 @@ static void device_run(void *prv)
>   
>   	src->sequence = frm_out->sequence++;
>   	dst->sequence = frm_cap->sequence++;
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	if (clk_enable(dev->gate))
>   		goto end;
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> index eb519afb30ca..7c4dd1ac772d 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -71,7 +71,7 @@ static void deinterlace_device_run(void *priv)
>   	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>   	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>   
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	deinterlace_write(dev, DEINTERLACE_MOD_ENABLE,
>   			  DEINTERLACE_MOD_ENABLE_EN);
> diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> index 89992feaab60..2deab920884a 100644
> --- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> +++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
> @@ -70,7 +70,7 @@ static void rotate_device_run(void *priv)
>   	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>   	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>   
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	val = ROTATE_GLB_CTL_MODE(ROTATE_MODE_COPY_ROTATE);
>   	if (ctx->hflip)
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index e0c11fe8b55c..60b95b5d8565 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -183,7 +183,7 @@ static void device_run(void *priv)
>   	if (ret)
>   		goto err_cancel_job;
>   
> -	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	v4l2_m2m_buf_copy_metadata(src, dst);
>   
>   	if (ctx->codec_ops->run(ctx))
>   		goto err_cancel_job;
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index a3df3a33237e..f1fffc4ecb6a 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -421,7 +421,7 @@ static void device_run(void *priv)
>   	else
>   		dst_buf->sequence = q_dst->sequence++;
>   	dst_buf->flags &= ~V4L2_BUF_FLAG_LAST;
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	spin_lock(ctx->lock);
>   	if (!ctx->comp_has_next_frame &&
> @@ -555,7 +555,7 @@ static void set_last_buffer(struct vb2_v4l2_buffer *dst_buf,
>   	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>   	dst_buf->sequence = q_dst->sequence++;
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, !ctx->is_enc);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
>   	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>   }
> diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
> index 86c32699111a..2e75adb372d0 100644
> --- a/drivers/media/test-drivers/vim2m.c
> +++ b/drivers/media/test-drivers/vim2m.c
> @@ -477,7 +477,7 @@ static int device_process(struct vim2m_ctx *ctx,
>   
>   	out_vb->sequence = q_data_out->sequence++;
>   	in_vb->sequence = q_data_in->sequence++;
> -	v4l2_m2m_buf_copy_metadata(in_vb, out_vb, true);
> +	v4l2_m2m_buf_copy_metadata(in_vb, out_vb);
>   
>   	if (ctx->mode & MEM2MEM_VFLIP) {
>   		start = height - 1;
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
> index 6a9639bd4d61..d90b79de8384 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -572,7 +572,7 @@ void visl_device_run(void *priv)
>   	if (src_req)
>   		v4l2_ctrl_request_setup(src_req, &ctx->hdl);
>   
> -	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
> +	v4l2_m2m_buf_copy_metadata(run.src, run.dst);
>   	run.dst->sequence = ctx->q_data[V4L2_M2M_DST].sequence++;
>   	run.src->sequence = ctx->q_data[V4L2_M2M_SRC].sequence++;
>   	run.dst->field = ctx->decoded_fmt.fmt.pix.field;
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 21acd9bc8607..137f502ed59d 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -1296,14 +1296,9 @@ void v4l2_m2m_buf_queue(struct v4l2_m2m_ctx *m2m_ctx,
>   EXPORT_SYMBOL_GPL(v4l2_m2m_buf_queue);
>   
>   void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
> -				struct vb2_v4l2_buffer *cap_vb,
> -				bool copy_frame_flags)
> +				struct vb2_v4l2_buffer *cap_vb)
>   {
> -	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
> -
> -	if (copy_frame_flags)
> -		mask |= V4L2_BUF_FLAG_KEYFRAME | V4L2_BUF_FLAG_PFRAME |
> -			V4L2_BUF_FLAG_BFRAME;
> +	const u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
>   
>   	cap_vb->vb2_buf.timestamp = out_vb->vb2_buf.timestamp;
>   
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index 1869c5792ecb..0a27330f9790 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -99,7 +99,7 @@ static void ipu_ic_pp_complete(struct ipu_image_convert_run *run, void *_ctx)
>   	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>   
> -	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>   
>   	src_buf->sequence = ctx->sequence++;
>   	dst_buf->sequence = src_buf->sequence;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index fbbf9e6f0f50..9f8b0555b7dc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -90,7 +90,7 @@ void cedrus_device_run(void *priv)
>   		break;
>   	}
>   
> -	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
> +	v4l2_m2m_buf_copy_metadata(run.src, run.dst);
>   
>   	cedrus_dst_format_set(dev, &ctx->dst_fmt);
>   
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 500f81f399df..c79373595f4e 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -842,19 +842,13 @@ v4l2_m2m_dst_buf_remove_by_idx(struct v4l2_m2m_ctx *m2m_ctx, unsigned int idx)
>    *
>    * @out_vb: the output buffer that is the source of the metadata.
>    * @cap_vb: the capture buffer that will receive the metadata.
> - * @copy_frame_flags: copy the KEY/B/PFRAME flags as well.
>    *
>    * This helper function copies the timestamp, timecode (if the TIMECODE
> - * buffer flag was set), field and the TIMECODE, KEYFRAME, BFRAME, PFRAME
> - * and TSTAMP_SRC_MASK flags from @out_vb to @cap_vb.
> - *
> - * If @copy_frame_flags is false, then the KEYFRAME, BFRAME and PFRAME
> - * flags are not copied. This is typically needed for encoders that
> - * set this bits explicitly.
> + * buffer flag was set), field, and the TIMECODE and TSTAMP_SRC_MASK flags from
> + * @out_vb to @cap_vb.
>    */
>   void v4l2_m2m_buf_copy_metadata(const struct vb2_v4l2_buffer *out_vb,
> -				struct vb2_v4l2_buffer *cap_vb,
> -				bool copy_frame_flags);
> +				struct vb2_v4l2_buffer *cap_vb);
>   
>   /* v4l2 request helper */
>   
>
> base-commit: 082b86919b7a94de01d849021b4da820a6cb89dc


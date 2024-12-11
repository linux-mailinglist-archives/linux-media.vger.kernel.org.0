Return-Path: <linux-media+bounces-23191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7889ECCFD
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45403188A9A5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 13:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE822229149;
	Wed, 11 Dec 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="HoS2qPjx"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEEB211A26;
	Wed, 11 Dec 2024 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923051; cv=pass; b=Ke45gcyLvTCKgH0M8/p4Em2rqYSIZgf1VP4ojFkK5jfv4uRZk1WjSoMFz475uG2A0UmrDAqvgkKEYv70ean9H0sGVCX4Ndiwhr/ZCG+gBP7aw3vbK6GURdOYB0a3SB0io3FKoQ7028XRJX/V3Hn26hAeJDD4aB6YaJTRKDZtkMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923051; c=relaxed/simple;
	bh=mSaMvEBHFn4ebRbmJ33PFUAOFUyLBWrY1H6sIaz6Xus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xrb2gj9siI4R0DhnkRkL68oSBIMoFkcIOVbuMNnNnrLHo/3l7EoePIKHVbVHNGwSdCB6boNQN/x2J27y52V0XXd6QTOusdnNjYLX++050XmbJ+T71zgzC10NeTfTai+XKJyT/f2A0QkEvqhAtxf1AG4L382ZDcbBT14NUiJgU0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=HoS2qPjx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1733923032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gTTWgoecVZpYFpDcJH/+kxlapna4tS5guiCQ3ml2StvRhWbbTyGqzl1kAmdXHijs0TXy5hjbXU9e6Mc0PmTOGGs5lm4KKMH0wmFGXgbffDyrKQTDV6/OaMXPbfl8gx9D60Gy/2jPCbmt31EYdEu/Y+Eh2QjS5OIqy5sCw+6Oui0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733923032; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PPG0A4pI6ESZEOrKaiPwCjIgQnUbRHgcBtvqfVxCEyM=; 
	b=Ic7AfYLkMddfmb9zSs7RGzh07mLGcLKT1fcv7GCLI/jDe48KAtF5DYIPKrbH1xEZyNbR7myYLqPpaG96L5OsMvHulbBFBDgcYCu7ypSGQ8CzMynLe1ATviwu7FaAzcAdPDyWX1IkcnGuQSPycEJMh4Xm3vEfzfKx3oP93Xw6VfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733923031;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=PPG0A4pI6ESZEOrKaiPwCjIgQnUbRHgcBtvqfVxCEyM=;
	b=HoS2qPjx6+EiZXj+Zj6WSZR2b/JIuGw+zLwc1eeMjB+G00N1JtudVxWCyNNjroCD
	G0w6+R7Dd5EY9krRbOkcyhxC1gQCjc+m+lAdK/MP+cGFiB5HyLHtsWd4DVXAI4qFg9J
	Om/B/O3zWjAWyzIMjd2MN7mz5Z19ftK1tqm4O6zQ=
Received: by mx.zohomail.com with SMTPS id 173392302997163.131598774686154;
	Wed, 11 Dec 2024 05:17:09 -0800 (PST)
Date: Wed, 11 Dec 2024 14:17:02 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 2/3] media: mediatek: vcodec: support extended h264
 decode
Message-ID: <20241211131702.sfen7wva4qk4ks7n@basti-XPS-13-9310>
References: <20241116031616.15656-1-yunfei.dong@mediatek.com>
 <20241116031616.15656-3-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031616.15656-3-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 16.11.2024 11:16, Yunfei Dong wrote:
>The address end of working buffer can't be calculated directly with buffer
>size in kernel for some special architecture. Adding new extend vsi_ex to
>calculate the address end in firmware.
>Adding capability to separate extend and non extend driver for different
>platform.
>At last, hardware can parse the syntax to get nal information in firmware
>for extend architecture, needn't to parse it again in kernel.

I'd recommend changing this to:

Add a new extended vsi_ext struct besides the existing vsi struct, to
enable calculating the end of the adress range of the current working
buffer for architectures, where simply adding the buffer size to the
start of the address range isn't sufficient.
Additionally, on extended architectures, the NAL information can be
fetched directly from the firmware, which allows skipping the parsing
step within the kernel.

Also, this sentence:
>Adding capability to separate extend and non extend driver for different
>platform.

Is a bit ambigious for me and doesn't seem to be something worth
mentioning. But maybe I misunderstand your point here.

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
> .../decoder/vdec/vdec_h264_req_multi_if.c     | 575 ++++++++++++++++--
> 2 files changed, 518 insertions(+), 59 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>index ac568ed14fa2..a0bb23962209 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>@@ -17,6 +17,7 @@
>
> #define IS_VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
> #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
>+#define IS_VDEC_SUPPORT_EX(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EX)

I'd recommend changing this to: IS_VDEC_SUPPORT_EXT as EXT is way less
ambigious acronym for extension, EX could mean way more.
You'll see me mentioning that below a couple of times.

>
> enum mtk_vcodec_dec_chip_name {
> 	MTK_VDEC_INVAL = 0,
>@@ -42,6 +43,7 @@ enum mtk_vdec_format_types {
> 	MTK_VDEC_FORMAT_HEVC_FRAME = 0x1000,
> 	MTK_VCODEC_INNER_RACING = 0x20000,
> 	MTK_VDEC_IS_SUPPORT_10BIT = 0x40000,
>+	MTK_VDEC_IS_SUPPORT_EX = 0x80000,
> };
>
> /*
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>index ab192ce0b851..a7de95b9a7c0 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>@@ -128,6 +128,83 @@ struct vdec_h264_slice_share_info {
> 	u16 nal_info;
> };
>
>+/*
>+ * struct vdec_h264_slice_mem - memory address and size (shared interface with firmware)
>+ */
>+struct vdec_h264_slice_mem {
>+	union {
>+		u64 buf;
>+		u64 dma_addr;
>+	};
>+	union {
>+		size_t size;
>+		u64 dma_addr_end;
>+	};
>+};
>+
>+/**
>+ * struct vdec_h264_slice_fb - frame buffer for decoding (shared interface with firmware)
>+ *
>+ * @y:  current y buffer address info

As this is a description I'd say lets describe a bit more detailed and
rewrite this to: "@y: current luma buffer address info"


>+ * @c:  current c buffer address info

... and "@c: current chroma buffer address info"

>+ */
>+struct vdec_h264_slice_fb {
>+	struct vdec_h264_slice_mem y;
>+	struct vdec_h264_slice_mem c;
>+};
>+
>+/**
>+ * struct vdec_h264_slice_info_ex - extend decode information (shared interface with firmware)

Can we call this also ..info_ext please?

>+ *
>+ * @wdma_end_addr_offset:	offset from buffer start
>+ * @nal_info:			nal info of current picture
>+ * @timeout:			Decode timeout: 1 timeout, 0 no timeout

I'd rename the description to: "Toggles whether a decode operation can timeout"
Then the effect of 1 and 0 becomes obvious.

>+ * @reserved:			reserved
>+ * @vdec_fb_va:		VDEC frame buffer struct virtual address
>+ * @crc:			Used to check whether hardware's status is right

I'd rename this to: "Displays the hardware status"
Saying whether a status is "right" is rather ambigious.

>+ */
>+struct vdec_h264_slice_info_ex {

... and this ... info_ext

>+	u64 wdma_end_addr_offset;
>+	u16 nal_info;
>+	u16 timeout;
>+	u32 reserved;
>+	u64 vdec_fb_va;
>+	u32 crc[8];
>+};
>+
>+/**
>+ * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange

s/vsi_ex/vsi_ext/

>+ *        between SCP and Host (shared interface with firmware).
>+ *
>+ * @bs:		input buffer info
>+ * @fb:		current y/c buffer
>+ *
>+ * @ube:		ube buffer

While we are at it and this acronym isn't terrible self-descriptive
could you write in the description what ube stands for?

>+ * @trans:		transcoded buffer
>+ * @row_info:		row info buffer
>+ * @err_map:		err map buffer
>+ * @slice_bc:		slice buffer
>+ *
>+ * @mv_buf_dma:	HW working motion vector buffer

HW working sounds weird, do you want to say the current?

>+ * @dec:		decode information (AP-R, VPU-W)
>+ * @h264_slice_params:	decode parameters for hw used

s/for hw used/used for the hw/

>+ */
>+struct vdec_h264_slice_vsi_ex {

s/vsi_ex/vsi_ext/

>+	/* LAT dec addr */
>+	struct vdec_h264_slice_mem bs;
>+	struct vdec_h264_slice_fb fb;
>+
>+	struct vdec_h264_slice_mem ube;
>+	struct vdec_h264_slice_mem trans;
>+	struct vdec_h264_slice_mem row_info;
>+	struct vdec_h264_slice_mem err_map;
>+	struct vdec_h264_slice_mem slice_bc;
>+
>+	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
>+	struct vdec_h264_slice_info_ex dec;

s/info_ex/info_ext/

>+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
>+};
>+
> /**
>  * struct vdec_h264_slice_inst - h264 decoder instance
>  *
>@@ -138,8 +215,10 @@ struct vdec_h264_slice_share_info {
>  * @vpu:		VPU instance
>  * @vsi:		vsi used for lat
>  * @vsi_core:		vsi used for core
>- *
>- * @vsi_ctx:		Local VSI data for this decoding context
>+ * @vsi_ctx:		Local vsi data for this decoding context
>+ * @vsi_ex:		extend vsi used for lat

s/vsi_ex/vsi_ext/
s/extend/extended/

>+ * @vsi_core_ex:	extend vsi used for core

s/vsi_core_ex/vsi_core_ext/
s/extend/extended/

>+ * @vsi_ctx_ex:	Local extend vsi data for this decoding context

s/vsi_ctx_ex/vsi_ctx_ext/
s/extend/extended/

Also you can drop the word Local as that is clear already with:
"for this decoding context"

>  * @h264_slice_param:	the parameters that hardware use to decode
>  *
>  * @resolution_changed:resolution changed
>@@ -148,7 +227,9 @@ struct vdec_h264_slice_share_info {
>  *
>  * @dpb:		decoded picture buffer used to store reference
>  *			buffer information
>- *@is_field_bitstream:	is field bitstream
>+ * @is_field_bitstream: is field bitstream

That is not a description, that is a repetition :)
Please make this a bit more descriptive. Like do you describe anywhere
else already what a field bitstream is and how it differentiates from
the alternative?

>+ *
>+ * @decode:		lat decoder pointer for different architecture

s/architecture/architectures/

>  */
> struct vdec_h264_slice_inst {
> 	unsigned int slice_dec_num;
>@@ -156,10 +237,18 @@ struct vdec_h264_slice_inst {
> 	struct mtk_vcodec_mem pred_buf;
> 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
> 	struct vdec_vpu_inst vpu;
>-	struct vdec_h264_slice_vsi *vsi;
>-	struct vdec_h264_slice_vsi *vsi_core;
>-
>-	struct vdec_h264_slice_vsi vsi_ctx;
>+	union {
>+		struct {
>+			struct vdec_h264_slice_vsi *vsi;
>+			struct vdec_h264_slice_vsi *vsi_core;
>+			struct vdec_h264_slice_vsi vsi_ctx;
>+		};
>+		struct {
>+			struct vdec_h264_slice_vsi_ex *vsi_ex;
>+			struct vdec_h264_slice_vsi_ex *vsi_core_ex;
>+			struct vdec_h264_slice_vsi_ex vsi_ctx_ex;

s/vsi_ex/vsi_ext/
s/vsi_core_ex/vsi_core_ext/
s/vsi_ctx_ex/vsi_ctx_ext/

>+		};
>+	};
> 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
>
> 	unsigned int resolution_changed;
>@@ -168,6 +257,9 @@ struct vdec_h264_slice_inst {
>
> 	struct v4l2_h264_dpb_entry dpb[16];
> 	bool is_field_bitstream;
>+
>+	int (*decode)(void *h_vdec, struct mtk_vcodec_mem *bs,
>+		      struct vdec_fb *unused, bool *res_chg);
> };
>
> static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
>@@ -389,62 +481,143 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
> 		       cr->left, cr->top, cr->width, cr->height);
> }
>
>-static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>+static void vdec_h264_slice_setup_lat_buffer_ex(struct vdec_h264_slice_inst *inst,

s/buffer_ex/buffer_ext/

>+						struct mtk_vcodec_mem *bs,
>+						struct vdec_lat_buf *lat_buf)
> {
>-	struct vdec_h264_slice_inst *inst;
>-	int err, vsi_size;
>+	struct mtk_vcodec_mem *mem;
>+	int i;
>
>-	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>-	if (!inst)
>-		return -ENOMEM;
>+	inst->vsi_ex->bs.dma_addr = (u64)bs->dma_addr;
>+	inst->vsi_ex->bs.size = bs->size;
>
>-	inst->ctx = ctx;
>+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
>+		mem = &inst->mv_buf[i];
>+		inst->vsi_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;

s/vsi_ex/vsi_ext/
and in all other cases below ...

>+		inst->vsi_ex->mv_buf_dma[i].size = mem->size;
>+	}
>+	inst->vsi_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
>+	inst->vsi_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
>
>-	inst->vpu.id = SCP_IPI_VDEC_LAT;
>-	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
>-	inst->vpu.ctx = ctx;
>-	inst->vpu.codec_type = ctx->current_codec;
>-	inst->vpu.capture_type = ctx->capture_fourcc;
>+	inst->vsi_ex->row_info.dma_addr = 0;
>+	inst->vsi_ex->row_info.size = 0;
>
>-	err = vpu_dec_init(&inst->vpu);
>-	if (err) {
>-		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
>-		goto error_free_inst;
>+	inst->vsi_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
>+	inst->vsi_ex->err_map.size = lat_buf->wdma_err_addr.size;
>+
>+	inst->vsi_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
>+	inst->vsi_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
>+
>+	inst->vsi_ex->trans.dma_addr_end = inst->ctx->msg_queue.wdma_rptr_addr;
>+	inst->vsi_ex->trans.dma_addr = inst->ctx->msg_queue.wdma_wptr_addr;
>+}
>+
>+static int vdec_h264_slice_setup_core_buffer_ex(struct vdec_h264_slice_inst *inst,

s/buffer_ex/buffer_ext/

>+						struct vdec_h264_slice_share_info *share_info,
>+						struct vdec_lat_buf *lat_buf)
>+{
>+	struct mtk_vcodec_mem *mem;
>+	struct mtk_vcodec_dec_ctx *ctx = inst->ctx;
>+	struct vb2_v4l2_buffer *vb2_v4l2;
>+	struct vdec_fb *fb;
>+	u64 y_fb_dma, c_fb_dma = 0;
>+	int i;
>+
>+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
>+	if (!fb) {
>+		mtk_vdec_err(ctx, "fb buffer is NULL");

A frame buffer buffer sounds a bit repetitive, lets just call it frame
buffer. Also this error message tells the user nothing. When I look at
the function within `mtk_vcodec_dec_stateless` it looks like the only
way we get a NULL here is if `v4l2_m2m_next_dst_buf` returns nothing,
e.g. if we don't have a next destination buffer. Can you confirm this?
If that is the case a better error message would be:
"Unable to get a CAPTURE buffer, because the CAPTURE queue is empty"
Or something along those lines.

>+		return -EBUSY;
> 	}
>
>-	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), VCODEC_DEC_ALIGNED_64);
>-	inst->vsi = inst->vpu.vsi;
>-	inst->vsi_core =
>-		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
>-	inst->resolution_changed = true;
>-	inst->realloc_mv_buf = true;
>+	y_fb_dma = (u64)fb->base_y.dma_addr;
>+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
>+		c_fb_dma =
>+			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;

Looks like it is worth it to create a separate variable for picinfo as
you use it here and below, so that you can do a bit less copy-paste.

>+	else
>+		c_fb_dma = (u64)fb->base_c.dma_addr;
>
>-	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
>-		       (int)sizeof(struct mtk_h264_sps_param),
>-		       (int)sizeof(struct mtk_h264_pps_param),
>-		       (int)sizeof(struct vdec_h264_slice_lat_dec_param),
>-		       (int)sizeof(struct mtk_h264_dpb_info),
>-		       vsi_size);
>-	mtk_vdec_debug(ctx, "lat H264 instance >> %p, codec_type = 0x%x",
>-		       inst, inst->vpu.codec_type);
>+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
>
>-	ctx->drv_handle = inst;
>-	return 0;
>+	inst->vsi_core_ex->fb.y.dma_addr = y_fb_dma;

s/vsi_core_ex/vsi_core_ext/
and everywhere below ...

>+	inst->vsi_core_ex->fb.y.size = ctx->picinfo.fb_sz[0];
>+	inst->vsi_core_ex->fb.c.dma_addr = c_fb_dma;
>+	inst->vsi_core_ex->fb.c.size = ctx->picinfo.fb_sz[1];
>
>-error_free_inst:
>-	kfree(inst);
>-	return err;
>+	inst->vsi_core_ex->dec.vdec_fb_va = (unsigned long)fb;
>+	inst->vsi_core_ex->dec.nal_info = share_info->nal_info;
>+
>+	inst->vsi_core_ex->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
>+	inst->vsi_core_ex->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
>+
>+	inst->vsi_core_ex->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
>+	inst->vsi_core_ex->err_map.size = lat_buf->wdma_err_addr.size;
>+
>+	inst->vsi_core_ex->slice_bc.dma_addr = lat_buf->slice_bc_addr.dma_addr;
>+	inst->vsi_core_ex->slice_bc.size = lat_buf->slice_bc_addr.size;
>+
>+	inst->vsi_core_ex->row_info.dma_addr = 0;
>+	inst->vsi_core_ex->row_info.size = 0;
>+
>+	inst->vsi_core_ex->trans.dma_addr = share_info->trans_start;
>+	inst->vsi_core_ex->trans.dma_addr_end = share_info->trans_end;
>+
>+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
>+		mem = &inst->mv_buf[i];
>+		inst->vsi_core_ex->mv_buf_dma[i].dma_addr = mem->dma_addr;
>+		inst->vsi_core_ex->mv_buf_dma[i].size = mem->size;
>+	}
>+
>+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
>+	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
>+
>+	return 0;
> }
>
>-static void vdec_h264_slice_deinit(void *h_vdec)
>+static int vdec_h264_slice_core_decode_ex(struct vdec_lat_buf *lat_buf)

s/decode_ex/decode_ext/

No no no, I don't like this or vdec_h264_slice_lat_decode_ex you
basically just duplicated the whole decode function in both cases and
added a few extended bits to them. Unless the two routines are
substantially different (which from my point of view they are not) you
should be able to create conditional branches for the extended bits into
the decode functions.

But please also look at my general comments in the functions, I'd still
like to know why timeouts are handled the way they are and whether the
status of a device can be made a bit more obvious to the user.

> {
>-	struct vdec_h264_slice_inst *inst = h_vdec;
>+	int err, timeout;
>+	struct mtk_vcodec_dec_ctx *ctx = lat_buf->ctx;
>+	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
>+	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
>+	struct vdec_vpu_inst *vpu = &inst->vpu;
>
>-	vpu_dec_deinit(&inst->vpu);
>-	vdec_h264_slice_free_mv_buf(inst);
>-	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
>+	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");

This looks like a left over development comment, this is not useful for
general debugging and shouldn't be upstreamed.

>+	memcpy(&inst->vsi_core_ex->h264_slice_params, &share_info->h264_slice_params,
>+	       sizeof(share_info->h264_slice_params));
>
>-	kfree(inst);
>+	err = vdec_h264_slice_setup_core_buffer_ex(inst, share_info, lat_buf);

s/buffer_ex/buffer_ext/

>+	if (err)
>+		goto vdec_dec_end;
>+
>+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core_ex->h264_slice_params,
>+					    share_info);
>+	err = vpu_dec_core(vpu);
>+	if (err) {
>+		mtk_vdec_err(ctx, "core decode err=%d", err);
>+		goto vdec_dec_end;
>+	}
>+
>+	/* wait decoder done interrupt */
>+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
>+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
>+	if (timeout)
>+		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);

So as you don't bail out here, it looks like this conditional branch
will end up returning 0. Why do you return 0 on a timeout? Isn't a
timeout a failed decode?

>+	inst->vsi_core_ex->dec.timeout = !!timeout;
>+
>+	vpu_dec_core_end(vpu);
>+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
>+		       ctx->decoded_frame_cnt,
>+		       inst->vsi_core_ex->dec.crc[0], inst->vsi_core_ex->dec.crc[1],
>+		       inst->vsi_core_ex->dec.crc[2], inst->vsi_core_ex->dec.crc[3],
>+		       inst->vsi_core_ex->dec.crc[4], inst->vsi_core_ex->dec.crc[5],
>+		       inst->vsi_core_ex->dec.crc[6], inst->vsi_core_ex->dec.crc[7]);

Can you add a small comment above this that explains to the user what
these CRCs are supposed to mean?

>+
>+vdec_dec_end:
>+	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
>+	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
>+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
>+	ctx->decoded_frame_cnt++;
>+	return 0;
> }
>
> static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>@@ -559,6 +732,127 @@ static void vdec_h264_insert_startcode(struct mtk_vcodec_dec_dev *vcodec_dev, un
> 	(*bs_size) += 4;
> }
>
>+static int vdec_h264_slice_lat_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,
>+					 struct vdec_fb *fb, bool *res_chg)
>+{

>+	struct vdec_h264_slice_inst *inst = h_vdec;
>+	struct vdec_vpu_inst *vpu = &inst->vpu;
>+	struct mtk_video_dec_buf *src_buf_info;
>+	int err, timeout = 0;
>+	unsigned int data[2];
>+	struct vdec_lat_buf *lat_buf;
>+	struct vdec_h264_slice_share_info *share_info;
>+
>+	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
>+				vdec_h264_slice_core_decode_ex,
>+				sizeof(*share_info)))
>+		return -ENOMEM;
>+
>+	/* bs NULL means flush decoder */
>+	if (!bs) {
>+		vdec_msg_queue_wait_lat_buf_full(&inst->ctx->msg_queue);
>+		return vpu_dec_reset(vpu);
>+	}
>+
>+	if (inst->is_field_bitstream)
>+		return -EINVAL;
>+
>+	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
>+	if (!lat_buf) {
>+		mtk_vdec_debug(inst->ctx, "failed to get lat buffer");
>+		return -EAGAIN;
>+	}
>+	share_info = lat_buf->private_data;
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+
>+	lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
>+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
>+
>+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info,
>+						     &inst->vsi_ex->h264_slice_params);
>+	if (err)
>+		goto err_free_fb_out;
>+
>+	vdec_h264_insert_startcode(inst->ctx->dev, bs->va, &bs->size,
>+				   &share_info->h264_slice_params.pps);
>+
>+	*res_chg = inst->resolution_changed;
>+	if (inst->resolution_changed) {
>+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
>+		if (inst->realloc_mv_buf) {
>+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
>+			inst->realloc_mv_buf = false;
>+			if (err)
>+				goto err_free_fb_out;
>+		}
>+		inst->resolution_changed = false;
>+	}
>+
>+	vdec_h264_slice_setup_lat_buffer_ex(inst, bs, lat_buf);
>+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
>+		       inst->vsi_ex->ube.dma_addr, (unsigned long)inst->vsi_ex->ube.size,
>+		       inst->vsi_ex->err_map.dma_addr);
>+
>+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%llx))",
>+		       inst->vsi_ex->slice_bc.dma_addr, (unsigned long)inst->vsi_ex->slice_bc.size,
>+		       inst->vsi_ex->trans.dma_addr, inst->vsi_ex->trans.dma_addr_end);
>+
>+	err = vpu_dec_start(vpu, data, 2);
>+	if (err) {
>+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
>+		goto err_free_fb_out;
>+	}
>+
>+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
>+		inst->vsi_ex->dec.wdma_end_addr_offset;
>+
>+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
>+	share_info->nal_info = inst->vsi_ex->dec.nal_info;
>+
>+	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
>+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
>+		       sizeof(share_info->h264_slice_params));
>+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
>+	}
>+
>+	/* wait decoder done interrupt */
>+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
>+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
>+	if (timeout)
>+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
>+	inst->vsi_ex->dec.timeout = !!timeout;
>+
>+	err = vpu_dec_end(vpu);
>+	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
>+		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
>+			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
>+		inst->slice_dec_num++;
>+		mtk_vdec_err(inst->ctx, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
>+		return -EINVAL;
>+	}
>+
>+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
>+		inst->vsi_ex->dec.wdma_end_addr_offset;
>+
>+	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
>+
>+	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
>+		memcpy(&share_info->h264_slice_params, &inst->vsi_ex->h264_slice_params,
>+		       sizeof(share_info->h264_slice_params));
>+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
>+	}
>+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
>+		       inst->vsi_ex->dec.crc[0], inst->vsi_ex->dec.crc[1],
>+		       inst->vsi_ex->dec.crc[2]);
>+
>+	inst->slice_dec_num++;
>+	return 0;
>+err_free_fb_out:
>+	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
>+	mtk_vdec_err(inst->ctx, "slice dec number: %d err: %d", inst->slice_dec_num, err);
>+	return err;
>+}
>+
> static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> 				      struct vdec_fb *fb, bool *res_chg)
> {
>@@ -704,18 +998,17 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> 	return err;
> }
>
>-static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>-					 struct vdec_fb *unused, bool *res_chg)
>+static int vdec_h264_slice_single_decode_ex(void *h_vdec, struct mtk_vcodec_mem *bs,

s/decode_ex/decode_ext/

>+					    struct vdec_fb *unused, bool *res_chg)
> {
> 	struct vdec_h264_slice_inst *inst = h_vdec;
> 	struct vdec_vpu_inst *vpu = &inst->vpu;
> 	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
> 	struct vdec_fb *fb;
>-	unsigned char *buf;
> 	unsigned int data[2], i;
> 	u64 y_fb_dma, c_fb_dma;
> 	struct mtk_vcodec_mem *mem;
>-	int err, nal_start_idx;
>+	int err;
>
> 	/* bs NULL means flush decoder */
> 	if (!bs)
>@@ -735,6 +1028,96 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
> 	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
> 		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
>
>+	inst->vsi_ctx_ex.bs.dma_addr = (u64)bs->dma_addr;
>+	inst->vsi_ctx_ex.bs.size = bs->size;
>+	inst->vsi_ctx_ex.fb.y.dma_addr = y_fb_dma;
>+	inst->vsi_ctx_ex.fb.c.dma_addr = c_fb_dma;
>+	inst->vsi_ctx_ex.dec.vdec_fb_va = (u64)(uintptr_t)fb;
>+
>+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
>+				   &dst_buf_info->m2m_buf.vb, true);
>+	err = get_vdec_sig_decode_parameters(inst);
>+	if (err)
>+		goto err_free_fb_out;
>+
>+	memcpy(&inst->vsi_ctx_ex.h264_slice_params, &inst->h264_slice_param,
>+	       sizeof(inst->vsi_ctx_ex.h264_slice_params));
>+
>+	*res_chg = inst->resolution_changed;
>+	if (inst->resolution_changed) {
>+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
>+		if (inst->realloc_mv_buf) {
>+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
>+			inst->realloc_mv_buf = false;
>+			if (err)
>+				goto err_free_fb_out;
>+		}
>+		inst->resolution_changed = false;
>+
>+		for (i = 0; i < H264_MAX_MV_NUM; i++) {
>+			mem = &inst->mv_buf[i];
>+			inst->vsi_ctx_ex.mv_buf_dma[i].dma_addr = mem->dma_addr;
>+		}
>+	}
>+
>+	memcpy(inst->vpu.vsi, &inst->vsi_ctx_ex, sizeof(inst->vsi_ctx_ex));
>+	err = vpu_dec_start(vpu, data, 2);
>+	if (err)
>+		goto err_free_fb_out;
>+
>+	/* wait decoder done interrupt */
>+	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
>+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
>+	if (err)
>+		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
>+
>+	inst->vsi_ex->dec.timeout = !!err;
>+	err = vpu_dec_end(vpu);
>+	if (err)
>+		goto err_free_fb_out;
>+
>+	memcpy(&inst->vsi_ctx_ex, inst->vpu.vsi, sizeof(inst->vsi_ctx_ex));
>+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
>+		       inst->ctx->decoded_frame_cnt,
>+		       inst->vsi_ctx_ex.dec.crc[0], inst->vsi_ctx_ex.dec.crc[1],
>+		       inst->vsi_ctx_ex.dec.crc[2], inst->vsi_ctx_ex.dec.crc[3],
>+		       inst->vsi_ctx_ex.dec.crc[4], inst->vsi_ctx_ex.dec.crc[5],
>+		       inst->vsi_ctx_ex.dec.crc[6], inst->vsi_ctx_ex.dec.crc[7]);
>+
>+	inst->ctx->decoded_frame_cnt++;
>+	return 0;
>+
>+err_free_fb_out:
>+	mtk_vdec_err(inst->ctx, "dec frame number: %d err: %d", inst->ctx->decoded_frame_cnt, err);
>+	return err;
>+}
>+
>+static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>+					 struct vdec_fb *unused, bool *res_chg)
>+{
>+	struct vdec_h264_slice_inst *inst = h_vdec;
>+	struct vdec_vpu_inst *vpu = &inst->vpu;
>+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
>+	struct vdec_fb *fb;
>+	unsigned char *buf;
>+	unsigned int data[2], i;
>+	u64 y_fb_dma, c_fb_dma;
>+	struct mtk_vcodec_mem *mem;
>+	int err, nal_start_idx;
>+
>+	/* bs NULL means flush decoder */
>+	if (!bs)
>+		return vpu_dec_reset(vpu);
>+
>+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
>+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
>+
>+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
>+	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
>+	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
>+		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
>+
> 	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
> 	inst->vsi_ctx.dec.bs_buf_size = bs->size;
> 	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
>@@ -807,21 +1190,95 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
> 	return err;
> }
>
>+static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>+{
>+	struct vdec_h264_slice_inst *inst;
>+	int err, vsi_size;
>+	unsigned char *temp;
>+
>+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
>+	if (!inst)
>+		return -ENOMEM;
>+
>+	inst->ctx = ctx;
>+
>+	inst->vpu.id = SCP_IPI_VDEC_LAT;
>+	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
>+	inst->vpu.ctx = ctx;
>+	inst->vpu.codec_type = ctx->current_codec;
>+	inst->vpu.capture_type = ctx->capture_fourcc;
>+
>+	err = vpu_dec_init(&inst->vpu);
>+	if (err) {
>+		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
>+		goto error_free_inst;
>+	}
>+
>+	if (IS_VDEC_SUPPORT_EX(ctx->dev->dec_capability)) {

s/SUPPORT_EX/SUPPORT_EXT/

same treatment for the other variables below ending with ex

>+		vsi_size = sizeof(struct vdec_h264_slice_vsi_ex);
>+
>+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
>+		inst->vsi_ex = inst->vpu.vsi;
>+		temp = (unsigned char *)inst->vsi_ex;
>+		inst->vsi_core_ex = (struct vdec_h264_slice_vsi_ex *)(temp + vsi_size);
>+
>+		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
>+			inst->decode = vdec_h264_slice_single_decode_ex;
>+		else
>+			inst->decode = vdec_h264_slice_lat_decode_ex;
>+	} else {
>+		vsi_size = sizeof(struct vdec_h264_slice_vsi);
>+
>+		vsi_size = round_up(vsi_size, VCODEC_DEC_ALIGNED_64);
>+		inst->vsi = inst->vpu.vsi;
>+		temp = (unsigned char *)inst->vsi;
>+		inst->vsi_core = (struct vdec_h264_slice_vsi *)(temp + vsi_size);
>+
>+		if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
>+			inst->decode = vdec_h264_slice_single_decode;
>+		else
>+			inst->decode = vdec_h264_slice_lat_decode;
>+	}

This looks all so extremely similar to me ... Please help me out here,
why do we need a vsi_core and a vsi_core_ext ? You could easily assign
the same value that you assign to vsi_core_ext to vsi_core in case the
architecture supports the extended VSI. So why do you need to have a the
vsi structs besides the vsi_ext structs?

>+	inst->resolution_changed = true;
>+	inst->realloc_mv_buf = true;
>+
>+	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
>+		       (int)sizeof(struct mtk_h264_sps_param),
>+		       (int)sizeof(struct mtk_h264_pps_param),
>+		       (int)sizeof(struct vdec_h264_slice_lat_dec_param),
>+		       (int)sizeof(struct mtk_h264_dpb_info),
>+		       vsi_size);
>+	mtk_vdec_debug(ctx, "lat H264 instance >> %p, codec_type = 0x%x",
>+		       inst, inst->vpu.codec_type);
>+
>+	ctx->drv_handle = inst;
>+	return 0;
>+
>+error_free_inst:
>+	kfree(inst);
>+	return err;
>+}
>+
>+static void vdec_h264_slice_deinit(void *h_vdec)
>+{
>+	struct vdec_h264_slice_inst *inst = h_vdec;
>+
>+	vpu_dec_deinit(&inst->vpu);
>+	vdec_h264_slice_free_mv_buf(inst);
>+	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
>+
>+	kfree(inst);
>+}
>+
> static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> 				  struct vdec_fb *unused, bool *res_chg)
> {
> 	struct vdec_h264_slice_inst *inst = h_vdec;
>-	int ret;
>
> 	if (!h_vdec)
> 		return -EINVAL;
>
>-	if (inst->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
>-		ret = vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
>-	else
>-		ret = vdec_h264_slice_lat_decode(h_vdec, bs, unused, res_chg);
>-
>-	return ret;
>+	return inst->decode(h_vdec, bs, unused, res_chg);

One reason more to try avoiding the split into separate functions for
extended and non-extended, more callbacks make the code just harder and
harder to navigate and understand.

> }
>
> static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
>-- 
>2.46.0
>
>

Regards,
Sebastian Fricke


Return-Path: <linux-media+bounces-31239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDEA9FC08
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 23:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750EF7A3DE2
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 21:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023BE204F9B;
	Mon, 28 Apr 2025 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kAl4w+1H"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497001E25EF;
	Mon, 28 Apr 2025 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874869; cv=none; b=f0UOnSG79qmyZ4TAT1PtIoSNEErXPYqhsnVdDt7Ink7AowrpyUmUwghfkVMQRYLXUjFuY/A5s8tUuSJkdzpP+mvuXFhXOjSVoETKJdPtnp0yQSZcaIDPi4lR8VB+TbZBCyX+uBBP4lHLk89CWixknjSHhdOfUdgouVVVQYLlVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874869; c=relaxed/simple;
	bh=CEVw4OP8WhDWBGQ59mura4b3H71DRcFJYSLrxvusUAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QGkr413a9ta25v5R6Rjx5zdb+Ei2aiafW86l5Tos0+2xH5X3Bsx1uJ6Yoe7OhUWHSopZnUkssPV51+BZAM4ZE291qRqsClr2THVhcpLwS9eNzpleEB+AfJoUTRdZXpSg8QJJ9JnOs6Kzs/eOAaKNLoFvrBsdbyXo+/C7+3MIPWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kAl4w+1H; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745874864;
	bh=CEVw4OP8WhDWBGQ59mura4b3H71DRcFJYSLrxvusUAc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kAl4w+1HtsL/V+shPuggL6mUe26Oj8uVR+gz5CMv9ntkJy3tLHYDkeZroN50tHZ++
	 7oVV2xQpEwlTFeaiSHtf3/dWOI69PW84pRGOv6l3FCLY0XTzO5grOO3nwHOpXWMOfQ
	 ScnWKB+SLgpj9nM33oqvG36IvdaKiat/NVYsDoc0QNNe/HVd7GOjnU0sEfro01ziqY
	 UErXz/OUNEJYunGyBApeXZ0zxZkX7dNiQcQ3JGshioiiB7tX+HpmmYKcow535H5z0U
	 sHb6NHyc1m9m8GhJVM93wInrNj1SljyTRQEo4o5Y8eadWaVHbm4LpGbM7b8HMump14
	 D3Zp9NZUt0mXg==
Received: from [IPv6:2606:6d00:15:9913::5ac] (unknown [IPv6:2606:6d00:15:9913::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D46F017E03BF;
	Mon, 28 Apr 2025 23:14:22 +0200 (CEST)
Message-ID: <bcb9904f6842b0ee18da820627a4aabd264ea577.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: mediatek: encoder: Add a new encoder driver
 interface
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, Yunfei Dong
 <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Longfei Wang <longfei.wang@mediatek.com>
Date: Mon, 28 Apr 2025 17:14:21 -0400
In-Reply-To: <20250221031004.9050-2-irui.wang@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
	 <20250221031004.9050-2-irui.wang@mediatek.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le vendredi 21 février 2025 à 11:10 +0800, Irui Wang a écrit :
> Introduce a new encoder kernel driver interface to ensure compatibility
> with the updated encoder software driver running in firmware.
> The new driver interface is expected to support more encoder formats,
> share more encode parameters between kernel and firmware.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/encoder/Makefile |   1 +
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +
>  .../vcodec/encoder/venc/venc_common_if.c      | 704 ++++++++++++++++++
>  .../mediatek/vcodec/encoder/venc_drv_if.h     |   3 +
>  4 files changed, 710 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/Makefile b/drivers/media/platform/mediatek/vcodec/encoder/Makefile
> index e621b5b7e5e6..9d3229d56e39 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-enc.o
>  
>  mtk-vcodec-enc-y := venc/venc_vp8_if.o \
>  		venc/venc_h264_if.o \
> +		venc/venc_common_if.o \
>  		mtk_vcodec_enc.o \
>  		mtk_vcodec_enc_drv.o \
>  		mtk_vcodec_enc_pm.o \
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..f5b888174dae 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -1175,6 +1175,8 @@ static void mtk_venc_worker(struct work_struct *work)
>  		frm_buf.fb_addr[i].size =
>  				(size_t)src_buf->vb2_buf.planes[i].length;
>  	}
> +	frm_buf.num_planes = src_buf->vb2_buf.num_planes;
> +
>  	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>  	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>  	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
> new file mode 100644
> index 000000000000..a696e986903b
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c
> @@ -0,0 +1,704 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 MediaTek Inc.

Was submitted in 2025, might want to update ?

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
> + * enum venc_codec_type - video encoder type
> + * @VENC_H264: H264 encoder
> + * @VENC_H265: H265 encoder
> + * @VENC_MAX: max value
> + */
> +enum venc_codec_type {
> +	VENC_H264,
> +	VENC_H265,
> +	VENC_MAX,
> +};
> +
> +/**
> + * enum venc_ipi_id - video encoder ipi id
> + * @IPI_VENC: encoder ipi
> + * @IPI_VENC_MAX: max value
> + */
> +enum venc_ipi_id {
> +	IPI_VENC,
> +	IPI_VENC_MAX,
> +};
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
> +	VENC_BS_MODE_SPS = 0,
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
> + *                      AP-W/R : AP is writer/reader on this item
> + *                      MCU-W/R: MCU is write/reader on this item
> + * @input_fourcc: input format fourcc
> + * @bitrate: target bitrate (in bps)
> + * @pic_w: picture width. Picture size is visible stream resolution, in pixels,
> + *         to be used for display purposes; must be smaller or equal to buffer
> + *         size.

This is trying to document both width and height in the same blob, and
looks weird. Please split, should be something like "Visible picture
width in pixel. ..."

If its used to set the crop/conf window in the codec specific header,
perhaps try and formulate it more explicitly ?

> + * @pic_h: picture height
> + * @buf_w: buffer width. Buffer size is stream resolution in pixels aligned to
> + *         hardware requirements.

Same applies.

> + * @buf_h: buffer height
> + * @gop_size: group of picture size (idr frame)

This is in number of what ? frames ?

> + * @intra_period: intra frame period

In ? frames ?

> + * @framerate: frame rate in fps
> + * @profile: as specified in standard

If its "as specified in the standard" that would mean profile_idc,
which can't differentiate between Baseline and Constrained-Baseline in
H264. Perhaps this is not exactly what you expected me to understand ?

> + * @level: as specified in standard

So level_idc ? Note this is a bit MPEG-LA specific.

> + * @core_num: encoder core num
> + * @dpb_size: encode dpb size
> + * @reserved: reserved field config

nit: reserved fields

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
> + * @config_data: configuration data

Perhaps extend a bit, don't just say "a blob of data".

> + */
> +struct venc_config_data {
> +	unsigned int config_data[VENC_CONFIG_DATA];
> +};

> +
> +/**
> + * struct venc_work_buf - Structure for working buffer information
> + *                               AP-W/R : AP is writer/reader on this item
> + *                               MCU-W/R: MCU is write/reader on this item
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
> + * struct venc_info -  Structure for encode frame and bs information
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
> + *                   AP-W/R : AP is writer/reader on this item
> + *                   VCP-W/R: VCP is write/reader on this item
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
> +	int ret = 0;
> +	struct venc_inst *inst;
> +
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->ctx = ctx;
> +	inst->vpu_inst.ctx = ctx;
> +	inst->vpu_inst.id = IPI_VENC;
> +	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base,
> +						VENC_SYS);
> +
> +	ret = vpu_enc_init(&inst->vpu_inst);
> +	inst->vsi = (struct venc_vsi *)inst->vpu_inst.vsi;
> +
> +	if (ret)
> +		kfree(inst);
> +	else
> +		ctx->drv_handle = inst;
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
> +	unsigned int irq_status = 0;
> +	struct mtk_vcodec_enc_ctx *ctx = (struct mtk_vcodec_enc_ctx *)inst->ctx;
> +
> +	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> +					  WAIT_INTR_TIMEOUT_MS, 0)) {
> +		irq_status = ctx->irq_status;
> +		mtk_venc_debug(ctx, "irq_status %x <-", irq_status);
> +	}
> +	return irq_status;
> +}
> +
> +static void venc_set_bufs(struct venc_inst *inst,
> +			  struct venc_frm_buf *frm_buf,
> +			  struct mtk_vcodec_mem *bs_buf)
> +{
> +	unsigned int i;
> +
> +	if (frm_buf) {
> +		for (i = 0; i < frm_buf->num_planes; i++) {
> +			inst->vsi->venc.fb_addr[i] =
> +				frm_buf->fb_addr[i].dma_addr;
> +			inst->vsi->venc.fb_size[i] =
> +				frm_buf->fb_addr[i].size;
> +			mtk_venc_debug(inst->ctx, "%s: fb_buf[%d]: %llx(%d)\n",
> +				       __func__, i,
> +				       inst->vsi->venc.fb_addr[i],
> +				       inst->vsi->venc.fb_size[i]);
> +		}
> +	}
> +
> +	if (bs_buf) {
> +		inst->vsi->venc.bs_addr = bs_buf->dma_addr;
> +		inst->vsi->venc.bs_size = bs_buf->size;
> +		mtk_venc_debug(inst->ctx, "%s: bs_buf: %llx(%d)\n",
> +			       __func__,
> +			       inst->vsi->venc.bs_addr,
> +			       (unsigned int)inst->vsi->venc.bs_size);
> +	}
> +}
> +
> +static int venc_encode_sps(struct venc_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, NULL, bs_buf);
> +	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_SPS,
> +			     NULL, bs_buf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status = venc_wait_encode_done(inst);
> +	if (irq_status != MTK_VENC_IRQ_STATUS_SPS) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d",
> +			     MTK_VENC_IRQ_STATUS_SPS);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +	mtk_venc_debug(inst->ctx, "sps bs size %d <-", *bs_size);
> +
> +	return ret;
> +}
> +
> +static int venc_encode_pps(struct venc_inst *inst,
> +			   struct mtk_vcodec_mem *bs_buf,
> +			   unsigned int *bs_size)
> +{
> +	int ret = 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, NULL, bs_buf);
> +	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_PPS,
> +			     NULL, bs_buf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status = venc_wait_encode_done(inst);
> +	if (irq_status != MTK_VENC_IRQ_STATUS_PPS) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d",
> +			     MTK_VENC_IRQ_STATUS_PPS);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +	mtk_venc_debug(inst->ctx, "pps bs size %d <-", *bs_size);
> +
> +	return ret;
> +}
> +
> +static int venc_encode_header(struct venc_inst *inst,
> +			      struct mtk_vcodec_mem *bs_buf,
> +			      unsigned int *bs_size)
> +{
> +	int ret = 0;
> +	unsigned int bs_size_sps;
> +	unsigned int bs_size_pps;
> +
> +	ret = venc_encode_sps(inst, bs_buf, &bs_size_sps);
> +	if (ret)
> +		return ret;
> +
> +	ret = venc_encode_pps(inst, &inst->pps_buf, &bs_size_pps);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(bs_buf->va + bs_size_sps, inst->pps_buf.va, bs_size_pps);
> +	*bs_size = bs_size_sps + bs_size_pps;
> +
> +	return ret;
> +}
> +
> +static int venc_encode_frame(struct venc_inst *inst,
> +			     struct venc_frm_buf *frm_buf,
> +			     struct mtk_vcodec_mem *bs_buf,
> +			     unsigned int *bs_size)
> +{
> +	int ret = 0;
> +	unsigned int irq_status;
> +
> +	venc_set_bufs(inst, frm_buf, bs_buf);
> +	ret = vpu_enc_encode(&inst->vpu_inst, VENC_BS_MODE_FRAME,
> +			     frm_buf, bs_buf, NULL);
> +	if (ret)
> +		return ret;
> +
> +	irq_status = venc_wait_encode_done(inst);
> +	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
> +		mtk_venc_err(inst->ctx, "expect irq status %d",
> +			     MTK_VENC_IRQ_STATUS_FRM);
> +		return -EINVAL;
> +	}
> +
> +	*bs_size = venc_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
> +
> +	++inst->frm_cnt;
> +
> +	return ret;
> +}
> +
> +static int venc_encode(void *handle,
> +		       enum venc_start_opt opt,
> +		       struct venc_frm_buf *frm_buf,
> +		       struct mtk_vcodec_mem *bs_buf,
> +		       struct venc_done_result *result)
> +{
> +	int ret = 0;
> +	struct venc_inst *inst = (struct venc_inst *)handle;
> +	struct mtk_vcodec_enc_ctx *ctx;
> +	unsigned int bs_size_hdr;
> +
> +	if (!inst || !inst->vsi)
> +		return -EINVAL;

Would that indicate a programmer error ? if so, use WARN_ON please.

> +
> +	ctx = inst->ctx;
> +
> +	mtk_venc_debug(ctx, "%s: opt: %d\n", __func__, opt);
> +
> +	enable_irq(ctx->dev->enc_irq);
> +	switch (opt) {
> +	case VENC_START_OPT_ENCODE_SEQUENCE_HEADER: {
> +		ret = venc_encode_header(inst, bs_buf, &bs_size_hdr);
> +		if (ret)
> +			goto encode_err;
> +
> +		result->bs_size = bs_size_hdr;
> +		result->is_key_frm = false;
> +		break;
> +	}
> +
> +	case VENC_START_OPT_ENCODE_FRAME: {
> +		if (!inst->prepend_hdr) {
> +			ret = venc_encode_frame(inst, frm_buf, bs_buf,
> +						&result->bs_size);
> +			if (ret)
> +				goto encode_err;
> +
> +			result->is_key_frm = inst->vpu_inst.is_key_frm;
> +			break;
> +		}
> +
> +		ret = venc_encode_header(inst, &inst->seq_buf, &bs_size_hdr);
> +		if (ret)
> +			goto encode_err;
> +
> +		ret = venc_encode_frame(inst, frm_buf, bs_buf,
> +					&result->bs_size);
> +		if (ret)
> +			goto encode_err;
> +
> +		memmove(bs_buf->va + bs_size_hdr, bs_buf->va, result->bs_size);
> +		memcpy(bs_buf->va, inst->seq_buf.va, bs_size_hdr);
> +		result->bs_size += bs_size_hdr;
> +
> +		inst->prepend_hdr = 0;
> +		result->is_key_frm = inst->vpu_inst.is_key_frm;
> +		break;
> +	}
> +
> +	default:
> +		mtk_venc_err(inst->ctx, "venc_opt %d not supported", opt);
> +		ret = -EINVAL;
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
> +			      struct device *dev,
> +			      struct venc_work_buf *buf)
> +{
> +	dma_addr_t dma_addr;
> +
> +	if (!buf || buf->size == 0)
> +		return 0;

Would that be programmer error ?

> +
> +	buf->va = dma_alloc_coherent(dev, buf->size, &dma_addr, GFP_KERNEL);
> +	if (!buf->va)
> +		return -ENOMEM;
> +
> +	buf->iova = (unsigned long long)dma_addr;
> +
> +	mtk_venc_debug(inst->ctx,
> +		       "allocate buffer, size: %d, va: %p, iova: 0x%llx",
> +		       buf->size, buf->va, buf->iova);
> +
> +	return 0;
> +}
> +
> +static void mtk_venc_mem_free(struct venc_inst *inst,
> +			      struct device *dev,
> +			      struct venc_work_buf *buf)
> +{
> +	if (!buf || !buf->va || !dev)
> +		return;

Would that be programmer error ?

> +
> +	mtk_venc_debug(inst->ctx,
> +		       "free buffer, size: %d, va: %p, iova: 0x%llx",
> +		       buf->size, buf->va, buf->iova);
> +
> +	dma_free_coherent(dev, buf->size, buf->va, buf->iova);
> +	buf->va = NULL;
> +	buf->iova = 0;
> +	buf->size = 0;
> +}
> +
> +static void venc_free_rc_buf(struct venc_inst *inst,
> +			     struct venc_work_buf_list *bufs,
> +			     unsigned int core_num)
> +{
> +	int i;
> +	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
> +	struct device *dev;
> +
> +	if (mtk_vcodec_fw_get_type(fw) == SCP) {
> +		dev = &inst->ctx->dev->plat_dev->dev;
> +		mtk_venc_mem_free(inst, dev, &bufs->rc_code);
> +
> +		for (i = 0; i < core_num; i++)
> +			mtk_venc_mem_free(inst, dev, &bufs->rc_info[i]);
> +	}

Is this really expected to be a no-op if other firmware type are used ?

> +}
> +
> +static void venc_free_work_buf(struct venc_inst *inst)
> +{
> +	int i;
> +	struct venc_work_buf_list *bufs = &inst->vsi->bufs;
> +	unsigned int core_num = inst->vsi->config.core_num;
> +	unsigned int dpb_size = inst->vsi->config.dpb_size;
> +	struct device *dev;
> +
> +	if (bufs->rc_code.va)
> +		venc_free_rc_buf(inst, bufs, core_num);
> +
> +	dev = &inst->ctx->dev->plat_dev->dev;
> +
> +	for (i = 0; i < core_num; i++) {
> +		mtk_venc_mem_free(inst, dev, &bufs->wpp[i]);
> +		mtk_venc_mem_free(inst, dev, &bufs->wpp_nbm[i]);
> +	}
> +
> +	for (i = 0; i < dpb_size; i++) {
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
> +			     struct venc_work_buf_list *bufs,
> +			     unsigned int core_num)
> +{
> +	int i;
> +	struct mtk_vcodec_fw *fw = inst->ctx->dev->fw_handler;
> +	struct device *dev;
> +	void *tmp_va;
> +
> +	if (mtk_vcodec_fw_get_type(fw) == SCP) {
> +		dev = &inst->ctx->dev->plat_dev->dev;
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_code))
> +			return -ENOMEM;
> +
> +		tmp_va = mtk_vcodec_fw_map_dm_addr(fw, bufs->rc_code.pa);
> +		memcpy(bufs->rc_code.va, tmp_va, bufs->rc_code.size);
> +
> +		for (i = 0; i < core_num; i++) {
> +			if (mtk_venc_mem_alloc(inst, dev, &bufs->rc_info[i]))
> +				return -ENOMEM;

You are missing some cleanup of bufs->rc_code and all previous bufs-
>rc_info if there was more then one core.

> +		}
> +	}

Same, do you need an else ?

> +
> +	return 0;
> +}
> +
> +static int venc_alloc_work_buf(struct venc_inst *inst)
> +{
> +	int i, ret;
> +	struct venc_work_buf_list *bufs = &inst->vsi->bufs;
> +	unsigned int core_num = inst->vsi->config.core_num;
> +	unsigned int dpb_size = inst->vsi->config.dpb_size;
> +	struct device *dev;
> +
> +	if (bufs->rc_code.size != 0) {
> +		ret = venc_alloc_rc_buf(inst, bufs, core_num);
> +		if (ret) {
> +			mtk_venc_err(inst->ctx, "cannot allocate rc buf");
> +			goto err_alloc;
> +		}
> +	}
> +
> +	dev = &inst->ctx->dev->plat_dev->dev;
> +
> +	for (i = 0; i < core_num; i++) {
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->wpp[i]) ||
> +		    mtk_venc_mem_alloc(inst, dev, &bufs->wpp_nbm[i]))
> +			goto err_alloc;
> +	}
> +
> +	for (i = 0; i < dpb_size; i++) {
> +		if (mtk_venc_mem_alloc(inst, dev, &bufs->luma[i]) ||
> +		    mtk_venc_mem_alloc(inst, dev, &bufs->chroma[i]) ||
> +		    mtk_venc_mem_alloc(inst, dev, &bufs->sub_luma[i]) ||
> +		    mtk_venc_mem_alloc(inst, dev, &bufs->sub_write[i]) ||
> +		    mtk_venc_mem_alloc(inst, dev, &bufs->col_mv[i]))
> +			goto err_alloc;
> +	}
> +
> +	/* the pps_buf and seq_buf are used by AP side only */
> +	inst->pps_buf.size = PPS_SIZE;
> +	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->pps_buf);
> +	if (ret) {
> +		mtk_venc_err(inst->ctx, "cannot allocate pps_buf");
> +		goto err_alloc;
> +	}
> +
> +	inst->seq_buf.size = SEQ_HEADER_SIZE;
> +	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->seq_buf);
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
> +			  enum venc_set_param_type type,
> +			  struct venc_enc_param *enc_prm)
> +{
> +	int ret = 0;
> +	struct venc_inst *inst = (struct venc_inst *)handle;
> +
> +	switch (type) {
> +	case VENC_SET_PARAM_ENC:
> +		if (!inst->vsi)
> +			return -EINVAL;
> +		inst->vsi->config.input_fourcc = enc_prm->input_yuv_fmt;
> +		inst->vsi->config.bitrate = enc_prm->bitrate;
> +		inst->vsi->config.pic_w = enc_prm->width;
> +		inst->vsi->config.pic_h = enc_prm->height;
> +		inst->vsi->config.buf_w = enc_prm->buf_width;
> +		inst->vsi->config.buf_h = enc_prm->buf_height;
> +		inst->vsi->config.gop_size = enc_prm->gop_size;
> +		inst->vsi->config.framerate = enc_prm->frm_rate;
> +		inst->vsi->config.intra_period = enc_prm->intra_period;
> +		inst->vsi->config.profile = enc_prm->h264_profile;
> +		inst->vsi->config.level = enc_prm->h264_level;

h264? I thought this was supposed to be generic / common ?

> +
> +		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
> +		if (ret)
> +			break;
> +
> +		if (inst->work_buf_allocated) {
> +			venc_free_work_buf(inst);
> +			inst->work_buf_allocated = false;
> +		}
> +		ret = venc_alloc_work_buf(inst);
> +		if (ret)
> +			break;
> +		inst->work_buf_allocated = true;
> +		break;
> +	case VENC_SET_PARAM_PREPEND_HEADER:
> +		inst->prepend_hdr = 1;

So there is no way to revert that later ?

> +		break;
> +	default:
> +		ret = vpu_enc_set_param(&inst->vpu_inst, type, enc_prm);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int venc_deinit(void *handle)
> +{
> +	int ret = 0;
> +	struct venc_inst *inst = (struct venc_inst *)handle;
> +
> +	ret = vpu_enc_deinit(&inst->vpu_inst);
> +
> +	if (inst->work_buf_allocated)
> +		venc_free_work_buf(inst);
> +
> +	kfree(inst);
> +
> +	return ret;
> +}
> +
> +const struct venc_common_if venc_if = {
> +	.init = venc_init,
> +	.encode = venc_encode,
> +	.set_param = venc_set_param,
> +	.deinit = venc_deinit,
> +};
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> index 889440a436b6..1908a6ae42fa 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.h
> @@ -107,9 +107,11 @@ struct venc_frame_info {
>  /*
>   * struct venc_frm_buf - frame buffer information used in venc_if_encode()
>   * @fb_addr: plane frame buffer addresses
> + * @num_planes: number of planes
>   */
>  struct venc_frm_buf {
>  	struct mtk_vcodec_fb fb_addr[MTK_VCODEC_MAX_PLANES];
> +	unsigned int num_planes;
>  };
>  
>  /*
> @@ -124,6 +126,7 @@ struct venc_done_result {
>  
>  extern const struct venc_common_if venc_h264_if;
>  extern const struct venc_common_if venc_vp8_if;
> +extern const struct venc_common_if venc_if;
>  
>  /*
>   * venc_if_init - Create the driver handle

regards,
-- 
Nicolas Dufresne
Principal Engineer at Collabora


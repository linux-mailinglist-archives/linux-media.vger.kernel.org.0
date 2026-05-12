Return-Path: <linux-media+bounces-61205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAKEGtjJAmrmwgEAu9opvQ
	(envelope-from <linux-media+bounces-61205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:34:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B014E51B143
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF3B33015A76
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 06:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0063A4EA377;
	Tue, 12 May 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWmpC+3C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCA47A0B0;
	Tue, 12 May 2026 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567622; cv=none; b=pILpyoI3NG2YpMTK3i0x1ad70R45S1LFssynDe209kAAMLzwrr2y/GC7pIKxahDKMUNyovP/ZBHwMZPo7bttTKHPzf+13UoyxA82+nzCcprTHIRLdoklsxbQv5VWp/RXXtn4CZ0dwneaHdUybOX4+iNBgQzPNz6eLje9w6NzaoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567622; c=relaxed/simple;
	bh=xNi1kd8WlkN8N33Jaa7B4JWe6dw8RcmXjGPDaus5LMs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pti5sh5LEQO2cR7jM6I5UWTC5rpZNFFFWWaN0IKkkd+W5v2b5IY+5Z1+ogyM4f3n4soj3ParciGbvajShX21x/ajsP1K8SZ2eNSaoBnR+7SyCyJ0R4Z01GaCZ6oVZfLGrdjMGZZ++2qyTRGR7QcpP7eIIMeKF8pmkOkvbkqjUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWmpC+3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567B5C2BCB0;
	Tue, 12 May 2026 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778567615;
	bh=xNi1kd8WlkN8N33Jaa7B4JWe6dw8RcmXjGPDaus5LMs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=KWmpC+3Cmdqc1z5w9jHAEyOWFkhE+mOlkgUJLCATGk3QZbur2g/7vN5hXVfAAJapx
	 XLBOMg7dUkNVeDdXE8eB8btK+/g+FqVtLpHzo9fwknFyNtCB1rlcYxaLrzwG2ER04t
	 5itqeOxxFnnua6/VMiaoTJSHD1f70I19459mtQX93FmSXliKm3Zn4mfocx+b7s6Zjd
	 h+cc1Qi+NAz+KSt4hbqtxxtoeQ/xbXc8pCDolrlz/91hapoNCaDpZglKJp/edTcWMP
	 bV1oCLtvui0ENgxwwxB7mwRbtZpZr1rynu2jxsxFa1JFhgTB0UZ4+LEyfAclCNdhNF
	 004I2/kXre37w==
Message-ID: <1f48d0fd-729e-4694-bb8a-4ce6c6f3675f@kernel.org>
Date: Tue, 12 May 2026 08:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4] media: verisilicon: Create AV1 helper library
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260505081939.17230-1-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260505081939.17230-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B014E51B143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61205-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Action: no action

Hi Benjamin,

It looks much better now that it uses a struct.

I have some other comments, though:

On 05/05/2026 10:19, Benjamin Gaignard wrote:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for future AV1 codecs.
> 
> Tested on rock 5b board Fluster score remains the same 204/241.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> version 4:
> - change functions prototypes to use a structure.
> - rebased on v7.1-rc2 tag.
> 
>  drivers/media/platform/verisilicon/Makefile   |   7 +-
>  .../media/platform/verisilicon/hantro_av1.c   | 782 ++++++++++++++
>  .../media/platform/verisilicon/hantro_av1.h   |  62 ++
>  ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
>  ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
>  ...av1_filmgrain.c => hantro_av1_filmgrain.c} | 125 ++-
>  .../verisilicon/hantro_av1_filmgrain.h        |  48 +
>  .../media/platform/verisilicon/hantro_hw.h    |   7 +-
>  .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 977 ++----------------
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
>  11 files changed, 1076 insertions(+), 1011 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>  delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
> 

<snip>

> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
> new file mode 100644
> index 000000000000..7258a749f7b5
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -0,0 +1,782 @@

<snip>

> +int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	u64 timestamp;
> +	int i, idx = frame->ref_frame_idx[ref];

It's probably wise to check that 'ref' isn't out of bounds (< 0 or
>= V4L2_AV1_REFS_PER_FRAME).

> +
> +	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
> +		return AV1_INVALID_IDX;
> +
> +	timestamp = frame->reference_frame_ts[idx];
> +	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
> +		if (!av1_dec->frame_refs[i].used)
> +			continue;
> +		if (av1_dec->frame_refs[i].timestamp == timestamp)
> +			return i;
> +	}
> +
> +	return AV1_INVALID_IDX;
> +}
> +
> +int hantro_av1_get_order_hint(struct hantro_ctx *ctx, int ref)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	int idx = hantro_av1_get_frame_index(ctx, ref);
> +
> +	if (idx != AV1_INVALID_IDX)
> +		return av1_dec->frame_refs[idx].order_hint;
> +
> +	return 0;
> +}
> +
> +int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	int i;
> +
> +	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
> +		int j;
> +
> +		if (av1_dec->frame_refs[i].used)
> +			continue;
> +
> +		av1_dec->frame_refs[i].width = frame->frame_width_minus_1 + 1;
> +		av1_dec->frame_refs[i].height = frame->frame_height_minus_1 + 1;
> +		av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
> +		av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
> +		av1_dec->frame_refs[i].timestamp = timestamp;
> +		av1_dec->frame_refs[i].frame_type = frame->frame_type;
> +		av1_dec->frame_refs[i].order_hint = frame->order_hint;
> +		av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
> +
> +		for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
> +			av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
> +		av1_dec->frame_refs[i].used = true;
> +		av1_dec->current_frame_index = i;
> +
> +		return i;
> +	}
> +
> +	return AV1_INVALID_IDX;
> +}
> +
> +static void hantro_av1_frame_unref(struct hantro_ctx *ctx, int idx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +
> +	if (idx >= 0)
> +		av1_dec->frame_refs[idx].used = false;
> +}
> +
> +void hantro_av1_clean_refs(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +
> +	int ref, idx;
> +
> +	for (idx = 0; idx < AV1_MAX_FRAME_BUF_COUNT; idx++) {
> +		u64 timestamp = av1_dec->frame_refs[idx].timestamp;
> +		bool used = false;
> +
> +		if (!av1_dec->frame_refs[idx].used)
> +			continue;
> +
> +		for (ref = 0; ref < V4L2_AV1_TOTAL_REFS_PER_FRAME; ref++) {
> +			if (ctrls->frame->reference_frame_ts[ref] == timestamp)
> +				used = true;
> +		}
> +
> +		if (!used)
> +			hantro_av1_frame_unref(ctx, idx);
> +	}
> +}
> +
> +size_t hantro_av1_luma_size(struct hantro_ctx *ctx)
> +{
> +	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
> +}
> +
> +size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
> +{
> +	size_t cr_offset = hantro_av1_luma_size(ctx);
> +
> +	return ALIGN((cr_offset * 3) / 2, 64);
> +}
> +
> +static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +
> +	if (av1_dec->db_data_col.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
> +				  av1_dec->db_data_col.cpu,
> +				  av1_dec->db_data_col.dma);
> +	av1_dec->db_data_col.cpu = NULL;
> +
> +	if (av1_dec->db_ctrl_col.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
> +				  av1_dec->db_ctrl_col.cpu,
> +				  av1_dec->db_ctrl_col.dma);
> +	av1_dec->db_ctrl_col.cpu = NULL;
> +
> +	if (av1_dec->cdef_col.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
> +				  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
> +	av1_dec->cdef_col.cpu = NULL;
> +
> +	if (av1_dec->sr_col.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
> +				  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
> +	av1_dec->sr_col.cpu = NULL;
> +
> +	if (av1_dec->lr_col.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
> +				  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
> +	av1_dec->lr_col.cpu = NULL;
> +}
> +
> +static int hantro_av1_tiles_reallocate(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
> +	unsigned int num_tile_cols = tile_info->tile_cols;
> +	unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
> +	unsigned int height_in_sb = height / 64;
> +	unsigned int stripe_num = ((height + 8) + 63) / 64;
> +	size_t size;
> +
> +	if (av1_dec->db_data_col.size >=
> +	    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
> +		return 0;
> +
> +	hantro_av1_tiles_free(ctx);
> +
> +	size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
> +	av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
> +						      &av1_dec->db_data_col.dma,
> +						      GFP_KERNEL);
> +	if (!av1_dec->db_data_col.cpu)
> +		goto buffer_allocation_error;
> +	av1_dec->db_data_col.size = size;
> +
> +	size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
> +	av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
> +						      &av1_dec->db_ctrl_col.dma,
> +						      GFP_KERNEL);
> +	if (!av1_dec->db_ctrl_col.cpu)
> +		goto buffer_allocation_error;
> +	av1_dec->db_ctrl_col.size = size;
> +
> +	size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
> +	av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
> +						   &av1_dec->cdef_col.dma,
> +						   GFP_KERNEL);
> +	if (!av1_dec->cdef_col.cpu)
> +		goto buffer_allocation_error;
> +	av1_dec->cdef_col.size = size;
> +
> +	size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
> +	av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
> +						 &av1_dec->sr_col.dma,
> +						 GFP_KERNEL);
> +	if (!av1_dec->sr_col.cpu)
> +		goto buffer_allocation_error;
> +	av1_dec->sr_col.size = size;
> +
> +	size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
> +	av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
> +						 &av1_dec->lr_col.dma,
> +						 GFP_KERNEL);
> +	if (!av1_dec->lr_col.cpu)
> +		goto buffer_allocation_error;
> +	av1_dec->lr_col.size = size;
> +
> +	av1_dec->num_tile_cols_allocated = num_tile_cols;
> +	return 0;
> +
> +buffer_allocation_error:
> +	hantro_av1_tiles_free(ctx);
> +	return -ENOMEM;
> +}
> +
> +void hantro_av1_exit(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +
> +	if (av1_dec->global_model.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->global_model.size,
> +				  av1_dec->global_model.cpu,
> +				  av1_dec->global_model.dma);
> +	av1_dec->global_model.cpu = NULL;
> +
> +	if (av1_dec->tile_info.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
> +				  av1_dec->tile_info.cpu,
> +				  av1_dec->tile_info.dma);
> +	av1_dec->tile_info.cpu = NULL;
> +
> +	if (av1_dec->film_grain.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
> +				  av1_dec->film_grain.cpu,
> +				  av1_dec->film_grain.dma);
> +	av1_dec->film_grain.cpu = NULL;
> +
> +	if (av1_dec->prob_tbl.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
> +				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
> +	av1_dec->prob_tbl.cpu = NULL;
> +
> +	if (av1_dec->prob_tbl_out.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
> +				  av1_dec->prob_tbl_out.cpu,
> +				  av1_dec->prob_tbl_out.dma);
> +	av1_dec->prob_tbl_out.cpu = NULL;
> +
> +	if (av1_dec->tile_buf.cpu)
> +		dma_free_coherent(vpu->dev, av1_dec->tile_buf.size,
> +				  av1_dec->tile_buf.cpu, av1_dec->tile_buf.dma);
> +	av1_dec->tile_buf.cpu = NULL;
> +
> +	hantro_av1_tiles_free(ctx);
> +}
> +
> +int hantro_av1_init(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +
> +	memset(av1_dec, 0, sizeof(*av1_dec));
> +
> +	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
> +						       &av1_dec->global_model.dma,
> +						       GFP_KERNEL);
> +	if (!av1_dec->global_model.cpu)
> +		return -ENOMEM;
> +	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
> +
> +	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
> +						    &av1_dec->tile_info.dma,
> +						    GFP_KERNEL);
> +	if (!av1_dec->tile_info.cpu)
> +		return -ENOMEM;
> +	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
> +
> +	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
> +						     ALIGN(sizeof(struct hantro_av1_film_grain),
> +							   2048),
> +						     &av1_dec->film_grain.dma,
> +						     GFP_KERNEL);
> +	if (!av1_dec->film_grain.cpu)
> +		return -ENOMEM;
> +	av1_dec->film_grain.size = ALIGN(sizeof(struct hantro_av1_film_grain), 2048);
> +
> +	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
> +						   ALIGN(sizeof(struct av1cdfs), 2048),
> +						   &av1_dec->prob_tbl.dma,
> +						   GFP_KERNEL);
> +	if (!av1_dec->prob_tbl.cpu)
> +		return -ENOMEM;
> +	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
> +
> +	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
> +						       ALIGN(sizeof(struct av1cdfs), 2048),
> +						       &av1_dec->prob_tbl_out.dma,
> +						       GFP_KERNEL);
> +	if (!av1_dec->prob_tbl_out.cpu)
> +		return -ENOMEM;
> +	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
> +	av1_dec->cdfs = &av1_dec->default_cdfs;
> +	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
> +
> +	hantro_av1_set_default_cdfs(av1_dec->cdfs, av1_dec->cdfs_ndvc);
> +
> +	av1_dec->tile_buf.cpu = dma_alloc_coherent(vpu->dev,
> +						   AV1_TILE_SIZE,
> +						   &av1_dec->tile_buf.dma,
> +						   GFP_KERNEL);
> +	if (!av1_dec->tile_buf.cpu)
> +		return -ENOMEM;
> +	av1_dec->tile_buf.size = AV1_TILE_SIZE;
> +
> +	return 0;
> +}
> +
> +int hantro_av1_prepare_run(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +
> +	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
> +	if (WARN_ON(!ctrls->sequence))
> +		return -EINVAL;
> +
> +	ctrls->tile_group_entry =
> +	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +	if (WARN_ON(!ctrls->tile_group_entry))
> +		return -EINVAL;
> +
> +	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
> +	if (WARN_ON(!ctrls->frame))
> +		return -EINVAL;
> +
> +	ctrls->film_grain =
> +	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
> +
> +	return hantro_av1_tiles_reallocate(ctx);
> +}
> +
> +static int hantro_av1_get_msb(u32 n)
> +{
> +	if (n == 0)
> +		return 0;
> +	return 31 ^ __builtin_clz(n);
> +}
> +
> +static short hantro_av1_resolve_divisor_32(u32 d, short *shift)
> +{
> +	int f;
> +	u64 e;
> +
> +	*shift = hantro_av1_get_msb(d);
> +	/* e is obtained from D after resetting the most significant 1 bit. */
> +	e = d - ((u32)1 << *shift);
> +	/* Get the most significant DIV_LUT_BITS (8) bits of e into f */
> +	if (*shift > DIV_LUT_BITS)
> +		f = AV1_DIV_ROUND_UP_POW2(e, *shift - DIV_LUT_BITS);
> +	else
> +		f = e << (DIV_LUT_BITS - *shift);
> +	if (f > DIV_LUT_NUM)
> +		return -1;
> +	*shift += DIV_LUT_PREC_BITS;
> +	/* Use f as lookup into the precomputed table of multipliers */
> +	return div_lut[f];
> +}
> +
> +static void hantro_av1_get_shear_params(const u32 *params, s64 *alpha,
> +					s64 *beta, s64 *gamma, s64 *delta)
> +{
> +	const int *mat = params;
> +	short shift;
> +	short y;
> +	long long gv, dv;
> +
> +	if (mat[2] <= 0)
> +		return;
> +
> +	*alpha = clamp_val(mat[2] - (1 << WARPEDMODEL_PREC_BITS), S16_MIN, S16_MAX);
> +	*beta = clamp_val(mat[3], S16_MIN, S16_MAX);
> +
> +	y = hantro_av1_resolve_divisor_32(abs(mat[2]), &shift) * (mat[2] < 0 ? -1 : 1);
> +
> +	gv = ((long long)mat[4] * (1 << WARPEDMODEL_PREC_BITS)) * y;
> +
> +	*gamma = clamp_val((int)AV1_DIV_ROUND_UP_POW2_SIGNED(gv, shift), S16_MIN, S16_MAX);
> +
> +	dv = ((long long)mat[3] * mat[4]) * y;
> +	*delta = clamp_val(mat[5] -
> +		(int)AV1_DIV_ROUND_UP_POW2_SIGNED(dv, shift) - (1 << WARPEDMODEL_PREC_BITS),
> +		S16_MIN, S16_MAX);
> +
> +	*alpha = AV1_DIV_ROUND_UP_POW2_SIGNED(*alpha, WARP_PARAM_REDUCE_BITS)
> +		 * (1 << WARP_PARAM_REDUCE_BITS);
> +	*beta = AV1_DIV_ROUND_UP_POW2_SIGNED(*beta, WARP_PARAM_REDUCE_BITS)
> +		* (1 << WARP_PARAM_REDUCE_BITS);
> +	*gamma = AV1_DIV_ROUND_UP_POW2_SIGNED(*gamma, WARP_PARAM_REDUCE_BITS)
> +		 * (1 << WARP_PARAM_REDUCE_BITS);
> +	*delta = AV1_DIV_ROUND_UP_POW2_SIGNED(*delta, WARP_PARAM_REDUCE_BITS)
> +		* (1 << WARP_PARAM_REDUCE_BITS);
> +}
> +
> +void hantro_av1_set_global_model(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	const struct v4l2_av1_global_motion *gm = &frame->global_motion;
> +	u8 *dst = av1_dec->global_model.cpu;
> +	int ref_frame, i;
> +
> +	memset(dst, 0, GLOBAL_MODEL_SIZE);
> +	for (ref_frame = 0; ref_frame < V4L2_AV1_REFS_PER_FRAME; ++ref_frame) {
> +		s64 alpha = 0, beta = 0, gamma = 0, delta = 0;
> +
> +		for (i = 0; i < 6; ++i) {
> +			if (i == 2)
> +				*(s32 *)dst =
> +					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
> +			else if (i == 3)
> +				*(s32 *)dst =
> +					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][2];
> +			else
> +				*(s32 *)dst =
> +					gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][i];
> +			dst += 4;
> +		}
> +
> +		if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
> +			hantro_av1_get_shear_params(&gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][0],
> +						    &alpha, &beta, &gamma, &delta);
> +
> +		*(s16 *)dst = alpha;
> +		dst += 2;
> +		*(s16 *)dst = beta;
> +		dst += 2;
> +		*(s16 *)dst = gamma;
> +		dst += 2;
> +		*(s16 *)dst = delta;
> +		dst += 2;
> +	}
> +}
> +
> +int hantro_av1_tile_log2(int target)
> +{
> +	int k;
> +
> +	/*
> +	 * returns the smallest value for k such that 1 << k is greater
> +	 * than or equal to target
> +	 */
> +	for (k = 0; (1 << k) < target; k++)
> +		;
> +
> +	return k;
> +}
> +
> +int hantro_av1_get_dist(struct hantro_ctx *ctx, int a, int b)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	int bits = ctrls->sequence->order_hint_bits - 1;
> +	int diff, m;
> +
> +	if (!ctrls->sequence->order_hint_bits)
> +		return 0;
> +
> +	diff = a - b;
> +	m = 1 << bits;
> +	diff = (diff & (m - 1)) - (diff & m);
> +
> +	return diff;
> +}
> +
> +void hantro_av1_set_frame_sign_bias(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	const struct v4l2_ctrl_av1_sequence *sequence = ctrls->sequence;
> +	int i;
> +
> +	if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
> +		for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++)
> +			av1_dec->ref_frame_sign_bias[i] = 0;
> +
> +		return;
> +	}
> +	// Identify the nearest forward and backward references.
> +	for (i = 0; i < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; i++) {
> +		if (hantro_av1_get_frame_index(ctx, i) >= 0) {
> +			int rel_off =
> +			    hantro_av1_get_dist(ctx,
> +						hantro_av1_get_order_hint(ctx, i),
> +						frame->order_hint);
> +			av1_dec->ref_frame_sign_bias[i + 1] = (rel_off <= 0) ? 0 : 1;
> +		}
> +	}
> +}
> +
> +void hantro_av1_init_scaling_function(const u8 *values, const u8 *scaling,
> +				      u8 num_points, u8 *scaling_lut)
> +{
> +	int i, point;
> +
> +	if (num_points == 0) {
> +		memset(scaling_lut, 0, 256);
> +		return;
> +	}
> +
> +	for (point = 0; point < num_points - 1; point++) {
> +		int x;
> +		s32 delta_y = scaling[point + 1] - scaling[point];
> +		s32 delta_x = values[point + 1] - values[point];
> +		s64 delta =
> +		    delta_x ? delta_y * ((65536 + (delta_x >> 1)) /
> +					 delta_x) : 0;
> +
> +		for (x = 0; x < delta_x; x++) {
> +			scaling_lut[values[point] + x] =
> +			    scaling[point] +
> +			    (s32)((x * delta + 32768) >> 16);
> +		}
> +	}
> +
> +	for (i = values[num_points - 1]; i < 256; i++)
> +		scaling_lut[i] = scaling[num_points - 1];
> +}
> +
> +void hantro_av1_set_tile_info(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
> +	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
> +	    ctrls->tile_group_entry;
> +	u8 *dst = av1_dec->tile_info.cpu;
> +	int tile0, tile1;
> +
> +	memset(dst, 0, av1_dec->tile_info.size);
> +
> +	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
> +		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
> +			int tile_id = tile1 * tile_info->tile_cols + tile0;
> +			u32 start, end;
> +			u32 y0 =
> +			    tile_info->height_in_sbs_minus_1[tile1] + 1;
> +			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
> +
> +			/* tile size in SB units (width,height) */
> +			*dst++ = x0;
> +			*dst++ = 0;
> +			*dst++ = 0;
> +			*dst++ = 0;
> +			*dst++ = y0;
> +			*dst++ = 0;
> +			*dst++ = 0;
> +			*dst++ = 0;
> +
> +			/* tile start position */
> +			start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
> +			*dst++ = start & 255;
> +			*dst++ = (start >> 8) & 255;
> +			*dst++ = (start >> 16) & 255;
> +			*dst++ = (start >> 24) & 255;
> +
> +			/* number of bytes in tile data */
> +			end = start + group_entry[tile_id].tile_size;
> +			*dst++ = end & 255;
> +			*dst++ = (end >> 8) & 255;
> +			*dst++ = (end >> 16) & 255;
> +			*dst++ = (end >> 24) & 255;
> +		}
> +	}
> +}
> +
> +bool hantro_av1_is_lossless(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	const struct v4l2_av1_segmentation *segmentation = &frame->segmentation;
> +	const struct v4l2_av1_quantization *quantization = &frame->quantization;
> +	int i;
> +
> +	for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
> +		int qindex = quantization->base_q_idx;
> +
> +		if (segmentation->feature_enabled[i] &
> +		    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
> +			qindex += segmentation->feature_data[i][V4L2_AV1_SEG_LVL_ALT_Q];
> +		}
> +		qindex = clamp(qindex, 0, 255);
> +
> +		if (qindex ||
> +		    quantization->delta_q_y_dc ||
> +		    quantization->delta_q_u_dc ||
> +		    quantization->delta_q_u_ac ||
> +		    quantization->delta_q_v_dc ||
> +		    quantization->delta_q_v_ac)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +void hantro_av1_update_prob(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	bool frame_is_intra = IS_INTRA(frame->frame_type);
> +	struct av1cdfs *out_cdfs = (struct av1cdfs *)av1_dec->prob_tbl_out.cpu;
> +	int i;
> +
> +	if (frame->flags & V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF)
> +		return;
> +
> +	for (i = 0; i < NUM_REF_FRAMES; i++) {
> +		if (frame->refresh_frame_flags & BIT(i)) {
> +			struct mvcdfs stored_mv_cdf;
> +
> +			hantro_av1_get_cdfs(ctx, i);
> +			stored_mv_cdf = av1_dec->cdfs->mv_cdf;
> +			*av1_dec->cdfs = *out_cdfs;
> +			if (frame_is_intra) {
> +				av1_dec->cdfs->mv_cdf = stored_mv_cdf;
> +				*av1_dec->cdfs_ndvc = out_cdfs->mv_cdf;
> +			}
> +			hantro_av1_store_cdfs(ctx, frame->refresh_frame_flags);
> +			break;
> +		}
> +	}
> +}
> +
> +void hantro_av1_set_prob(struct hantro_ctx *ctx)
> +{
> +	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
> +	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
> +	const struct v4l2_av1_quantization *quantization = &frame->quantization;
> +	bool error_resilient_mode =
> +	    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE);
> +	bool frame_is_intra = IS_INTRA(frame->frame_type);
> +
> +	if (error_resilient_mode || frame_is_intra ||
> +	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
> +		av1_dec->cdfs = &av1_dec->default_cdfs;
> +		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
> +		hantro_av1_default_coeff_probs(quantization->base_q_idx,
> +					       av1_dec->cdfs);
> +	} else {
> +		hantro_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);

There is no sanity check for frame->primary_ref_frame to prevent out of bounds
array access. But perhaps this has to be checked elsewhere?

> +	}
> +	hantro_av1_store_cdfs(ctx, frame->refresh_frame_flags);
> +
> +	memcpy(av1_dec->prob_tbl.cpu, av1_dec->cdfs, sizeof(struct av1cdfs));
> +
> +	if (frame_is_intra) {
> +		int mv_offset = offsetof(struct av1cdfs, mv_cdf);
> +		/* Overwrite MV context area with intrabc MV context */
> +		memcpy(av1_dec->prob_tbl.cpu + mv_offset, av1_dec->cdfs_ndvc,
> +		       sizeof(struct mvcdfs));
> +	}
> +}

<snip>

> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad37323..5bf1f2689fbc 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -7,622 +7,35 @@
<snip>

>  static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
> @@ -1617,12 +846,12 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  	int ref_ind = 0;
>  	int rf, idx;
>  
> -	alt_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT_BUF_IDX);
> -	gld_frame_offset = rockchip_vpu981_get_order_hint(ctx, GLD_BUF_IDX);
> -	bwd_frame_offset = rockchip_vpu981_get_order_hint(ctx, BWD_BUF_IDX);
> -	alt2_frame_offset = rockchip_vpu981_get_order_hint(ctx, ALT2_BUF_IDX);
> +	alt_frame_offset = hantro_av1_get_order_hint(ctx, ALT_BUF_IDX);
> +	gld_frame_offset = hantro_av1_get_order_hint(ctx, GLD_BUF_IDX);
> +	bwd_frame_offset = hantro_av1_get_order_hint(ctx, BWD_BUF_IDX);
> +	alt2_frame_offset = hantro_av1_get_order_hint(ctx, ALT2_BUF_IDX);
>  
> -	idx = rockchip_vpu981_get_frame_index(ctx, LST_BUF_IDX);
> +	idx = hantro_av1_get_frame_index(ctx, LST_BUF_IDX);
>  	if (idx >= 0) {
>  		int alt_frame_offset_in_lst =
>  			av1_dec->frame_refs[idx].order_hints[V4L2_AV1_REF_ALTREF_FRAME];
> @@ -1644,8 +873,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  		ref_stamp--;
>  	}
>  
> -	idx = rockchip_vpu981_get_frame_index(ctx, BWD_BUF_IDX);
> -	if (rockchip_vpu981_av1_dec_get_dist(ctx, bwd_frame_offset, cur_frame_offset) > 0) {
> +	idx = hantro_av1_get_frame_index(ctx, BWD_BUF_IDX);

Can idx be AV1_INVALID_IDX? It's checked for LST_BUF_IDX, but not for BWD_BUF_IDX and others below.

> +	if (hantro_av1_get_dist(ctx, bwd_frame_offset, cur_frame_offset) > 0) {
>  		int bwd_mi_cols = av1_dec->frame_refs[idx].mi_cols;
>  		int bwd_mi_rows = av1_dec->frame_refs[idx].mi_rows;
>  		bool bwd_intra_only =
> @@ -1659,8 +888,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  		}
>  	}
>  
> -	idx = rockchip_vpu981_get_frame_index(ctx, ALT2_BUF_IDX);
> -	if (rockchip_vpu981_av1_dec_get_dist(ctx, alt2_frame_offset, cur_frame_offset) > 0) {
> +	idx = hantro_av1_get_frame_index(ctx, ALT2_BUF_IDX);
> +	if (hantro_av1_get_dist(ctx, alt2_frame_offset, cur_frame_offset) > 0) {
>  		int alt2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
>  		int alt2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
>  		bool alt2_intra_only =
> @@ -1674,8 +903,8 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  		}
>  	}
>  
> -	idx = rockchip_vpu981_get_frame_index(ctx, ALT_BUF_IDX);
> -	if (rockchip_vpu981_av1_dec_get_dist(ctx, alt_frame_offset, cur_frame_offset) > 0 &&
> +	idx = hantro_av1_get_frame_index(ctx, ALT_BUF_IDX);
> +	if (hantro_av1_get_dist(ctx, alt_frame_offset, cur_frame_offset) > 0 &&
>  	    ref_stamp >= 0) {
>  		int alt_mi_cols = av1_dec->frame_refs[idx].mi_cols;
>  		int alt_mi_rows = av1_dec->frame_refs[idx].mi_rows;
> @@ -1690,7 +919,7 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  		}
>  	}
>  
> -	idx = rockchip_vpu981_get_frame_index(ctx, LST2_BUF_IDX);
> +	idx = hantro_av1_get_frame_index(ctx, LST2_BUF_IDX);
>  	if (idx >= 0 && ref_stamp >= 0) {
>  		int lst2_mi_cols = av1_dec->frame_refs[idx].mi_cols;
>  		int lst2_mi_rows = av1_dec->frame_refs[idx].mi_rows;
> @@ -1706,14 +935,14 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  	}
>  
>  	for (rf = 0; rf < V4L2_AV1_TOTAL_REFS_PER_FRAME - 1; ++rf) {
> -		idx = rockchip_vpu981_get_frame_index(ctx, rf);
> +		idx = hantro_av1_get_frame_index(ctx, rf);
>  		if (idx >= 0) {
> -			int rf_order_hint = rockchip_vpu981_get_order_hint(ctx, rf);
> +			int rf_order_hint = hantro_av1_get_order_hint(ctx, rf);
>  
>  			cur_offset[rf] =
> -			    rockchip_vpu981_av1_dec_get_dist(ctx, cur_frame_offset, rf_order_hint);
> +			    hantro_av1_get_dist(ctx, cur_frame_offset, rf_order_hint);
>  			cur_roffset[rf] =
> -			    rockchip_vpu981_av1_dec_get_dist(ctx, rf_order_hint, cur_frame_offset);
> +			    hantro_av1_get_dist(ctx, rf_order_hint, cur_frame_offset);
>  		} else {
>  			cur_offset[rf] = 0;
>  			cur_roffset[rf] = 0;
> @@ -1736,32 +965,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  	if (use_ref_frame_mvs && ref_ind > 0 &&
>  	    cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
>  	    cur_offset[mf_types[0] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
> -		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[0]);
> -		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[0]);
> +		int rf = hantro_av1_get_order_hint(ctx, refs_selected[0]);
> +		int idx = hantro_av1_get_frame_index(ctx, refs_selected[0]);

There is no AV1_INVALID_IDX check here either.

I think it might be helpful if there is a comment in the cases where idx is always
valid. I don't know enough about this to be able to tell if it is a potential
out-of-bounds access or not.

>  		u32 *oh = av1_dec->frame_refs[idx].order_hints;
>  		int val;
>  
>  		hantro_reg_write(vpu, &av1_use_temporal0_mvs, 1);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_last_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_last2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_last3_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_golden_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_bwdref_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_altref2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf1_altref_offset, val);
>  	}
>  
> @@ -1776,32 +1005,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  	if (use_ref_frame_mvs && ref_ind > 1 &&
>  	    cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
>  	    cur_offset[mf_types[1] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
> -		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[1]);
> -		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[1]);
> +		int rf = hantro_av1_get_order_hint(ctx, refs_selected[1]);
> +		int idx = hantro_av1_get_frame_index(ctx, refs_selected[1]);

Ditto.

>  		u32 *oh = av1_dec->frame_refs[idx].order_hints;
>  		int val;
>  
>  		hantro_reg_write(vpu, &av1_use_temporal1_mvs, 1);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_last_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_last2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_last3_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_golden_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_bwdref_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_altref2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf2_altref_offset, val);
>  	}
>  
> @@ -1816,32 +1045,32 @@ static void rockchip_vpu981_av1_dec_set_other_frames(struct hantro_ctx *ctx)
>  	if (use_ref_frame_mvs && ref_ind > 2 &&
>  	    cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] <= MAX_FRAME_DISTANCE &&
>  	    cur_offset[mf_types[2] - V4L2_AV1_REF_LAST_FRAME] >= -MAX_FRAME_DISTANCE) {
> -		int rf = rockchip_vpu981_get_order_hint(ctx, refs_selected[2]);
> -		int idx = rockchip_vpu981_get_frame_index(ctx, refs_selected[2]);
> +		int rf = hantro_av1_get_order_hint(ctx, refs_selected[2]);
> +		int idx = hantro_av1_get_frame_index(ctx, refs_selected[2]);

Ditto.

>  		u32 *oh = av1_dec->frame_refs[idx].order_hints;
>  		int val;
>  
>  		hantro_reg_write(vpu, &av1_use_temporal2_mvs, 1);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_last_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_last2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_LAST3_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_last3_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_GOLDEN_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_golden_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_BWDREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_bwdref_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF2_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_altref2_offset, val);
>  
> -		val = rockchip_vpu981_av1_dec_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
> +		val = hantro_av1_get_dist(ctx, rf, oh[V4L2_AV1_REF_ALTREF_FRAME]);
>  		hantro_reg_write(vpu, &av1_mf3_altref_offset, val);
>  	}
>  
> @@ -1883,7 +1112,7 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
>  
>  	if (!allow_intrabc) {
>  		for (i = 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
> -			int idx = rockchip_vpu981_get_frame_index(ctx, i);
> +			int idx = hantro_av1_get_frame_index(ctx, i);
>  
>  			if (idx >= 0)
>  				ref_count[idx]++;
> @@ -1898,7 +1127,7 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
>  	}
>  	hantro_reg_write(vpu, &av1_ref_frames, ref_frames);
>  
> -	rockchip_vpu981_av1_dec_set_frame_sign_bias(ctx);
> +	hantro_av1_set_frame_sign_bias(ctx);
>  
>  	for (i = V4L2_AV1_REF_LAST_FRAME; i < V4L2_AV1_TOTAL_REFS_PER_FRAME; i++) {
>  		u32 ref = i - 1;
> @@ -1910,8 +1139,8 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
>  			width = frame->frame_width_minus_1 + 1;
>  			height = frame->frame_height_minus_1 + 1;
>  		} else {
> -			if (rockchip_vpu981_get_frame_index(ctx, ref) > 0)
> -				idx = rockchip_vpu981_get_frame_index(ctx, ref);
> +			if (hantro_av1_get_frame_index(ctx, ref) > 0)
> +				idx = hantro_av1_get_frame_index(ctx, ref);

Can idx be AV1_INVALID_IDX here?

>  			width = av1_dec->frame_refs[idx].width;
>  			height = av1_dec->frame_refs[idx].height;
>  		}
> @@ -1943,20 +1172,6 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
>  	rockchip_vpu981_av1_dec_set_other_frames(ctx);
>  }
>  
> -static int rockchip_vpu981_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode)
> -{
> -	switch (tx_mode) {
> -	case V4L2_AV1_TX_MODE_ONLY_4X4:
> -		return ROCKCHIP_AV1_TX_MODE_ONLY_4X4;
> -	case V4L2_AV1_TX_MODE_LARGEST:
> -		return ROCKCHIP_AV1_TX_MODE_32x32;
> -	case V4L2_AV1_TX_MODE_SELECT:
> -		return ROCKCHIP_AV1_TX_MODE_SELECT;
> -	}
> -
> -	return ROCKCHIP_AV1_TX_MODE_32x32;
> -}
> -
>  static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> @@ -2029,7 +1244,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
>  	hantro_reg_write(vpu, &av1_comp_pred_mode,
>  			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
>  
> -	tx_mode = rockchip_vpu981_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
> +	tx_mode = hantro_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
>  	hantro_reg_write(vpu, &av1_transform_mode, tx_mode);
>  	hantro_reg_write(vpu, &av1_max_cb_size,
>  			 (ctrls->sequence->flags
> @@ -2061,7 +1276,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
>  		hantro_reg_write(vpu, &av1_qmlevel_v, 0xff);
>  	}
>  
> -	hantro_reg_write(vpu, &av1_lossless_e, rockchip_vpu981_av1_dec_is_lossless(ctx));
> +	hantro_reg_write(vpu, &av1_lossless_e, hantro_av1_is_lossless(ctx));
>  	hantro_reg_write(vpu, &av1_quant_delta_v_dc, ctrls->frame->quantization.delta_q_v_dc);
>  	hantro_reg_write(vpu, &av1_quant_delta_v_ac, ctrls->frame->quantization.delta_q_v_ac);
>  
> @@ -2109,8 +1324,8 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
>  	struct hantro_decoded_buffer *dst;
>  	struct vb2_v4l2_buffer *vb2_dst;
>  	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
> -	size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
> -	size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
> +	size_t cr_offset = hantro_av1_luma_size(ctx);
> +	size_t mv_offset = hantro_av1_chroma_size(ctx);
>  
>  	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
>  	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> @@ -2134,7 +1349,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>  
>  	hantro_start_prepare_run(ctx);
>  
> -	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
> +	ret = hantro_av1_prepare_run(ctx);
>  	if (ret)
>  		goto prepare_error;
>  
> @@ -2144,8 +1359,8 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
>  		goto prepare_error;
>  	}
>  
> -	rockchip_vpu981_av1_dec_clean_refs(ctx);
> -	rockchip_vpu981_av1_dec_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
> +	hantro_av1_clean_refs(ctx);
> +	hantro_av1_frame_ref(ctx, vb2_src->vb2_buf.timestamp);
>  
>  	rockchip_vpu981_av1_dec_set_parameters(ctx);
>  	rockchip_vpu981_av1_dec_set_global_model(ctx);
Regards,

	Hans


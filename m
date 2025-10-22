Return-Path: <linux-media+bounces-45325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60494BFE57B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BA52189CCB5
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E321C27E05A;
	Wed, 22 Oct 2025 21:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="gGY12Yl6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFF28A705
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761169507; cv=none; b=fKHxnMcfjBkD5occzv1URd/vKAGptZ/E3bTkO4yRfbTckbeRTBiBWSIO/afuGXzoOuOGXOhujSrj5ksIsK4Z0GBWQVvMjJ7D/NaTLEm9qa2evEFKYN5+lvbEd3qeXhnCJ0HwwKhiWGF/m+KxowhP4JWuVwEmhxZc8ipxpoTWKE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761169507; c=relaxed/simple;
	bh=mMEa6oKzG9DMTUfij9GgLo2KX8T9D3HCdTc32lK/xIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpF6ZftPKUlQ9ms9elFqK42qJEA+GS4weKzgAx1mJzKHVBZaRcNLTie3T8e0XCaWjjoo+z9clezsLGCxr0Wv2r/xFUDrpNJrNxP6Ubry+bI+U7mkUvoUw1huHuyaNVueKBpjiXM+kEU9ucTRvfkFrF9Mc/JY0peuxPC9fMVE8FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=gGY12Yl6; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761169504;
 bh=ifffrKBZVPPFgsef5Yp4ijPvfgME0yJeeaaNp7YghaA=;
 b=gGY12Yl6iw4pehihmbOMEn7IiSOEl7Ds32BNCmgSTIqAnRd620bLqHGireZB7JlejpBCdCHvb
 stDGZ8QAMZioHhtDhwEG/N0RLQl4FRySTp3nZ5RADyKh7Cb8lTmTwvwhfaHfsFvjsokdhgNntWE
 SmysFGmsxxLsENfYybU2fNKzQ5MwqkPHSuX0QvsrJXcIIYVkIoV/LUz7Py45xz+R/dGasWcAGV7
 Ton9+pans7Z4599aEw2lWwKG3sw0JbFrtxwjiblmhHSPtuzdma5TKj1FCZSKrzI6cGcssMnNty/
 nuXa82CxOltM/jTpzTdc9d7H8VDfF1Gb1uGwYM91f3sg==
X-Forward-Email-ID: 68f950567ffe5c5c38c09a74
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <967409e7-5565-4616-95ce-780650609567@kwiboo.se>
Date: Wed, 22 Oct 2025 23:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] media: rkvdec: Move hevc functions to common
 file
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
 <20251022174508.284929-8-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251022174508.284929-8-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 10/22/2025 7:44 PM, Detlev Casanova wrote:
> This is a preparation commit to add support for new variants of the
> decoder.
> 
> The functions will later be shared with vdpu381 (rk3588) and vdpu383
> (rk3576).
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-hevc-common.c      | 233 +++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-hevc-common.h      |  51 ++++
>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 243 +-----------------
>  4 files changed, 291 insertions(+), 237 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
> index d2ba7a7c15e5..1b4bc44be23e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -6,4 +6,5 @@ rockchip-vdec-y += \
>  		   rkvdec-h264.o \
>  		   rkvdec-h264-common.o \
>  		   rkvdec-hevc.o \
> +		   rkvdec-hevc-common.o \
>  		   rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> new file mode 100644
> index 000000000000..d571107f2242
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip video decoder hevc common functions
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *      Detlev Casanova <detlev.casanova@collabora.com>
> + *
> + * Copyright (C) 2023 Collabora, Ltd.
> + *      Sebastian Fricke <sebastian.fricke@collabora.com>
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *	Boris Brezillon <boris.brezillon@collabora.com>
> + *
> + * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
> + *	Jeffy Chen <jeffy.chen@rock-chips.com>
> + */
> +
> +#include <linux/v4l2-common.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-hevc-common.h"
> +
> +/*
> + * Flip one or more matrices along their main diagonal and flatten them
> + * before writing it to the memory.
> + * Convert:
> + * ABCD         AEIM
> + * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
> + * IJKL         CGKO
> + * MNOP         DHLP
> + */
> +static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
> +					   int matrices, int row_length)
> +{
> +	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
> +
> +	matrix_size = row_length * row_length;
> +	for (i = 0; i < matrices; i++) {
> +		row = 0;
> +		x_offset = 0;
> +		matrix_offset = i * matrix_size;
> +		for (j = 0; j < matrix_size; j++) {
> +			y_offset = j - (row * row_length);
> +			rot_index = y_offset * row_length + x_offset;
> +			new_value = *(input + i * matrix_size + j);
> +			output[matrix_offset + rot_index] = new_value;
> +			if ((j + 1) % row_length == 0) {
> +				row += 1;
> +				x_offset += 1;
> +			}
> +		}
> +	}
> +}
> +
> +static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
> +{
> +	int offset = 0;
> +
> +	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4);
> +	offset = 6 * 16 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scaling_list_8x8, 6, 8);
> +	offset += 6 * 64 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset,
> +				       (const u8 *)input->scaling_list_16x16, 6, 8);
> +	offset += 6 * 64 * sizeof(u8);
> +	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
> +	transpose_and_flatten_matrices(output + offset,
> +				       (const u8 *)input->scaling_list_32x32, 1, 8);
> +	offset += 64 * sizeof(u8);
> +	memset(output + offset, 0, 128);
> +	offset += 128 * sizeof(u8);
> +	transpose_and_flatten_matrices(output + offset,
> +				       (const u8 *)input->scaling_list_32x32 + (64 * sizeof(u8)),
> +				       1, 8);
> +	offset += 64 * sizeof(u8);
> +	memset(output + offset, 0, 128);
> +}
> +
> +/*
> + * Required layout:
> + * A = scaling_list_dc_coef_16x16
> + * B = scaling_list_dc_coef_32x32
> + * 0 = Padding
> + *
> + * A, A, A, A, A, A, B, 0, 0, B, 0, 0
> + */
> +static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
> +{
> +	u8 list_32x32[6] = {0};
> +
> +	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
> +	list_32x32[0] = input->scaling_list_dc_coef_32x32[0];
> +	list_32x32[3] = input->scaling_list_dc_coef_32x32[1];
> +	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
> +}
> +
> +static void translate_scaling_list(struct scaling_factor *output,
> +				   const struct v4l2_ctrl_hevc_scaling_matrix *input)
> +{
> +	assemble_scalingfactor0(output->scalingfactor0, input);
> +	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96);
> +	assemble_scalingdc(output->scalingdc, input);
> +	memset(output->reserved, 0, 4 * sizeof(u8));
> +}
> +
> +void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
> +					  struct scaling_factor *scaling_factor,
> +					  struct v4l2_ctrl_hevc_scaling_matrix *cache)
> +{
> +	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
> +
> +	if (!memcmp(cache, scaling,
> +		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
> +		return;
> +
> +	translate_scaling_list(scaling_factor, scaling);
> +
> +	memcpy(cache, scaling,
> +	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
> +}
> +
> +struct vb2_buffer *
> +get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
> +	    unsigned int dpb_idx)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
> +	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
> +	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
> +	struct vb2_buffer *buf = NULL;
> +
> +	if (dpb_idx < decode_params->num_active_dpb_entries)
> +		buf = vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
> +
> +	/*
> +	 * If a DPB entry is unused or invalid, the address of current destination
> +	 * buffer is returned.
> +	 */
> +	if (!buf)
> +		return &run->base.bufs.dst->vb2_buf;
> +
> +	return buf;
> +}
> +
> +#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> +
> +int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
> +
> +	fmt->num_planes = 1;
> +	if (!fmt->plane_fmt[0].sizeimage)
> +		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> +					      RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
> +	return 0;
> +}
> +
> +enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
> +						struct v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +
> +	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 == 0) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_8BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_8BIT;
> +	} else if (sps->bit_depth_luma_minus8 == 2) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_10BIT;
> +		else
> +			return RKVDEC_IMG_FMT_420_10BIT;
> +	}
> +
> +	return RKVDEC_IMG_FMT_ANY;
> +}

This function is moved here in this patch, and then later rewritten and
moved once more in a later patch. Please move the functions to final
position in this patch and do not rewrite the function in a later patch.

Regards,
Jonas

[snip]



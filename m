Return-Path: <linux-media+bounces-43517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14687BB2119
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 01:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1EB17B75B
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 23:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9329927B4EB;
	Wed,  1 Oct 2025 23:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCBft5ia"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB5275AF5;
	Wed,  1 Oct 2025 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759361413; cv=none; b=DXoMomyHFtBfZH+Lbcty644FgqxswRT8+abBFZn306ic8gGzf3vZFl3+0SCpS4cm1gzyEcC59XS7veK8xrrHnnuPaPh0QWgR5u0QHJ2YKa0RSE9kuUdxhFfnJRat2QPWVf1Ky7e2RKCUUiy/Gn6g1foYqbs3BNUngD6OQohPeZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759361413; c=relaxed/simple;
	bh=apkkMNE0EiC91syo879IeFytEXNaed2SEkDn1gqnFjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+gu0Puqa0iBoRM2w2mZgE7i095qtx0tgIRJ+Nwcd/B8ScSeKFb5elwgLlZXVe3bwbMDKw3hdW1m5HFGv1Lb0b6J1a2O/8B/V0FNi5krq6t6aL+WLd5IlUI0NTVQyWU3t+SgWBysCoDTmpNtJt3hEkTK0IGR+mkReDow3JFRrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCBft5ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFAAC4CEF1;
	Wed,  1 Oct 2025 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759361411;
	bh=apkkMNE0EiC91syo879IeFytEXNaed2SEkDn1gqnFjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oCBft5iaEU1UDDvl7+UwBkJ4iWwiDAHWn5izvH0E5djPUuFbwjbxI03suugwxeFTr
	 oge+uM2M6aQnBWiiUYPIXfgKI0uZAKqfC7OOzOtsQsQ2Nis0baigglj2bEfNiQYXMn
	 wE8ezUxIkE4irQWAh/2ZtIALoJriGRhe2oepRD8wpBZo+YvFoLkTFjZgWhpFez/Pz3
	 6kpc8noYbSCAd2PUCiC7l11o/0jzffbHqBakMcRqnqQ5tclUBkvqHi6Pyo/0Tf9j58
	 jbmLE2S8ebzrEw3N7M7/wv7bcLafqznYChGxgUrTxM1vREOpBND9mTOtQ+8NMcyBZ8
	 yLpZD8y+iwADQ==
Message-ID: <e273f195-fb5e-4b4f-bf97-63ea51ed875f@kernel.org>
Date: Thu, 2 Oct 2025 00:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: iris: Add internal buffer calculation for AV1
 decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
 <mbltuHnjNkwD91EqWND77oi8XN26tEarsTmT_fLVkZQYkc7-V_RpAVWo8KC8AnzeyV74zXurscVRHHfAL35xFw==@protonmail.internalid>
 <20251001-av1_irisdecoder-v1-5-9fb08f3b96a0@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001-av1_irisdecoder-v1-5-9fb08f3b96a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2025 20:00, Deepa Guthyappa Madivalara wrote:
> Implement internal buffer count and size calculations for AV1 decoder.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 -
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
>   4 files changed, 357 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -27,6 +27,7 @@ struct iris_inst;
>    * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>    * @BUF_VPSS: buffer to store VPSS context data for HW
> + * @BUF_PARTIAL: buffer for AV1 IBC data
>    * @BUF_TYPE_MAX: max buffer types
>    */
>   enum iris_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index e3a8b031b3f191a6d18e1084db34804a8172439c..000bf75ba74ace5e10585910cda02975b0c34304 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -488,7 +488,6 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
> 
>   static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>   {
> -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   	u32 tier = inst->fw_caps[TIER].value;
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..17d3a7ae79e994257d596906cb4c17250a11a0cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -9,6 +9,14 @@
>   #include "iris_hfi_gen2_defines.h"
> 
>   #define HFI_MAX_COL_FRAME 6
> +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT (8)
> +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH (32)
> +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT (8)
> +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH (16)
> +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT (4)
> +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH (48)
> +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT (4)
> +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH (24)
> 
>   #ifndef SYSTEM_LAL_TILE10
>   #define SYSTEM_LAL_TILE10 192
> @@ -39,6 +47,31 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
> 
> +static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = ((frame_width * frame_height) <= BIN_BUFFER_THRESHOLD) ?
> +		((BIN_BUFFER_THRESHOLD * 3) >> 1) :
> +		((frame_width * frame_height * 3) >> 1);
> +	size_bin_hdr = size_yuv * AV1_CABAC_HDR_RATIO_HD_TOT;
> +	size_bin_res = size_yuv * AV1_CABAC_RES_RATIO_HD_TOT;
> +	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes,
> +			     DMA_ALIGNMENT) * num_vpp_pipes;
> +	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes,
> +			     DMA_ALIGNMENT) * num_vpp_pipes;
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
> +static u32 hfi_buffer_bin_av1d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 n_aligned_h = ALIGN(frame_height, 16);
> +	u32 n_aligned_w = ALIGN(frame_width, 16);
> +
> +	return size_av1d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
> +}
> +
>   static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 product = frame_width * frame_height;
> @@ -110,6 +143,20 @@ static u32 hfi_buffer_comv_h265d(u32 frame_width, u32 frame_height, u32 _comv_bu
>   	return (_size * (_comv_bufcount)) + 512;
>   }

What's this alignment stuffed onto the end about ?

Please guys give these magic numbers meaningful names.

> +static u32 hfi_buffer_comv_av1d(u32 frame_width, u32 frame_height, u32 comv_bufcount)
> +{
> +	u32 size;
> +
> +	size =  2 * ALIGN(MAX(((frame_width + 63) / 64) *
> +		((frame_height + 63) / 64) * 512,
> +		((frame_width + 127) / 128) *
> +		((frame_height + 127) / 128) * 2816),
> +		DMA_ALIGNMENT);
> +	size *= comv_bufcount;


I'm sure this calculation is right and produces the correct value in all 
instances - probably anyway but also does it ?

It is not obvious looking at this code that it is obviously correct.

I have a similar comment for alot of these Iris patches - we end up with 
highly complex calculations using magic numbers which my guess would be 
even people immersed in the firmware/driver/silicon development have a 
hard time looking at and "just knowing" the code is correct.

Please reduce these calculations down to some kind of define that - for 
example an intelligent programmer - an oxymoron of a term I accept - 
could read the code and actually understand what is going on.

That programmer might even be yourself. You should be able to come along 
in two, five, eight years time, look at a code snippet and pretty much 
understand what it is doing and why without having to have a deep 
epiphany when doing it.

These complex clauses stuffed with magic numbers and sometimes bitshfts 
with a few alignments thrown in for good measure are inscrutable.

> +	return size;
> +}
> +
>   static u32 size_h264d_bse_cmd_buf(u32 frame_height)
>   {
>   	u32 height = ALIGN(frame_height, 32);
> @@ -174,6 +221,20 @@ static u32 hfi_buffer_persist_h264d(void)
>   		    DMA_ALIGNMENT);
>   }
> 
> +static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
> +{
> +	u32 comv_size, size;
> +
> +	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
> +	size = ALIGN((SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
> +	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM) +
> +	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
> +	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
> +	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF), DMA_ALIGNMENT);
> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
>   {
>   	u32 size_bse = size_h264d_bse_cmd_buf(frame_height);
> @@ -459,6 +520,148 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>   	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
>   }
> 
> +static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
> +{
> +	u32 y_width, y_width_a = 128;
> +
> +	y_width = ALIGN(frame_width, y_width_a);
> +
> +	return (256 * ((y_width + 31) / 32 + (AV1D_MAX_TILE_COLS - 1)));
> +}
> +
> +static u32 size_av1d_lb_opb_wr1_tp10_ubwc(u32 frame_width, u32 frame_height)
> +{
> +	u32 y_width, y_width_a = 256;
> +
> +	y_width = ALIGN(frame_width, 192);
> +	y_width = ALIGN(y_width * 4 / 3, y_width_a);
> +
> +	return (256 * ((y_width + 47) / 48 + (AV1D_MAX_TILE_COLS - 1)));

y_width is a thing times 4 divided by 3 aligned to 192.

OK

Then we return 256 * ((y_width + 47?) / 48 + (A_DEFINE_NICE - 1)));

47 ? The magic number in the routine above is 31.

I don't think I'd be comfortable giving an RB for this. You guys need to 
take steps to make your code more digestable - zapping the complex 
bit-shifts and magic numbers.

I don't see how a reviewer can really be expected to fit this into their 
head and say "yep LGTM" needs to be decoded both for the sake of the 
reviewer and for future coders, perhaps even future you trying to figure 
out where the bug is..

---
bod


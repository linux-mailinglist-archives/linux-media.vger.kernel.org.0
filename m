Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B242A433
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfEYLnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 07:43:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55889 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726585AbfEYLnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 07:43:41 -0400
Received: from [IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af] ([IPv6:2001:983:e9a7:1:6081:f7d7:b93c:24af])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UV5NhPEgNsDWyUV5PhUGPC; Sat, 25 May 2019 13:43:39 +0200
Subject: Re: [PATCH v5 1/4] media: v4l: Add definitions for the HEVC slice
 controls
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20190524093635.1832-1-paul.kocialkowski@bootlin.com>
 <20190524093635.1832-2-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3efd681a-e410-9816-60c0-968ed6fff6c3@xs4all.nl>
Date:   Sat, 25 May 2019 13:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524093635.1832-2-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM6qSJnOp2+LEL+1D3ZlviPJXX6EldDs4P5KlqisS9L8ERjUWP53/T3EkwQ/KqT/jIbEvf2/crJvaDTsv9QB/1zzjsQ/SVG7/7cHr966QcCVW1UoxezS
 C4FWx8PZRG/LvLskEgLghqy8qv5rIrflPaG7gQyZWQJK61wnVkG7eQLUhLEajejHmOwyG7h0I7b1hHp1BNHUOzqKSVhr85kEYR7kD73/GXJZG+R2h7Lg2TJf
 07VX+zQAaSEWxaFSKxQE2z+uhUEoyH9kLjWyHPFhOC9xMFw+hPK7rKxBM+i4aW3TbdLM9StZjMD2EAY4O9IJIFQsWQtOvSqX335xlVyta/jsTQtNcv/dnMa0
 nXH84tU8s5zv0JD7QxQUJzjnclI4rDNC4Ik2isXw/sbXRSrOR7j2FR02NRvTR+IuJJuY5+TWj8nZ9dDGV570SWQhULrRhLCe04xGkcWDJYNsM3TJchxlOAnY
 yRytcB19jHhepHVPrwK/VoDkgudE5Ahnp7g5ZolZTD6ba9t1AfTZaja5VAffVdmMFhvW2N39ytpjCo+g0UYxiGMH/KcugggkhF5fgXqDdC/yFrcJAbTmNaWw
 YseBQ0ROoGK6LbmggOt4ys2Zj6YCZ2ZkXF1BNcSQlC5oO/98FPk+UcPazMZXerkp9qV3jNU3IGHoSBMyoTi8lQYyASlw0mdzYXKrwXGUa59BVyLL9enz4x4f
 f6vOEy4RvDcrciXxS/dlU5nUmat5EpcPqBe2hFTqzLoaEytp9P86G4pj9J+UUcRAjP4sfD5cSpPpaCScpaAxQgWos4LFtGl/dRsuhkwdxG5KoU71WjuKuy0i
 /VVCVa6tQuNrttZIU4gmpfjVGoFWkteX2LcOh7xlVD2mZP7CX+/BMI+2i86LeQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Besides the missing SoB I have two more comments:

On 5/24/19 11:36 AM, Paul Kocialkowski wrote:
> This introduces the required definitions for HEVC decoding support with
> stateless VPUs. The controls associated to the HEVC slice format provide
> the required meta-data for decoding slices extracted from the bitstream.
> 
> They are not exported to the public V4L2 API since reworking this API
> will be needed for covering various use-cases and new hardware.
> 
> The interface comes with the following limitations:
> * No custom quantization matrices (scaling lists);
> * Support for a single temporal layer only;
> * No slice entry point offsets support;
> * No conformance window support;
> * No VUI parameters support;
> * No support for SPS extensions: range, multilayer, 3d, scc, 4 bits;
> * No support for PPS extensions: range, multilayer, 3d, scc, 4 bits.
> ---
>  Documentation/media/uapi/v4l/biblio.rst       |   9 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 429 +++++++++++++++++-
>  .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          |  26 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/hevc-ctrls.h                    | 182 ++++++++
>  include/media/v4l2-ctrls.h                    |   7 +
>  8 files changed, 672 insertions(+), 3 deletions(-)
>  create mode 100644 include/media/hevc-ctrls.h
> 

<snip>

> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> new file mode 100644
> index 000000000000..9ea013c88afc
> --- /dev/null
> +++ b/include/media/hevc-ctrls.h
> @@ -0,0 +1,182 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * These are the HEVC state controls for use with stateless HEVC
> + * codec drivers.
> + *
> + * It turns out that these structs are not stable yet and will undergo
> + * more changes. So keep them private until they are stable and ready to
> + * become part of the official public API.
> + */
> +
> +#ifndef _HEVC_CTRLS_H_
> +#define _HEVC_CTRLS_H_
> +
> +#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 1008)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 1009)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 1010)
> +
> +/* enum v4l2_ctrl_type type values */
> +#define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
> +#define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
> +#define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
> +
> +#define V4L2_HEVC_SLICE_TYPE_B	0
> +#define V4L2_HEVC_SLICE_TYPE_P	1
> +#define V4L2_HEVC_SLICE_TYPE_I	2
> +
> +/* The controls are not stable at the moment and will likely be reworked. */
> +struct v4l2_ctrl_hevc_sps {
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
> +	__u8	chroma_format_idc;
> +	__u8	separate_colour_plane_flag;
> +	__u16	pic_width_in_luma_samples;
> +	__u16	pic_height_in_luma_samples;
> +	__u8	bit_depth_luma_minus8;
> +	__u8	bit_depth_chroma_minus8;
> +	__u8	log2_max_pic_order_cnt_lsb_minus4;
> +	__u8	sps_max_dec_pic_buffering_minus1;
> +	__u8	sps_max_num_reorder_pics;
> +	__u8	sps_max_latency_increase_plus1;
> +	__u8	log2_min_luma_coding_block_size_minus3;
> +	__u8	log2_diff_max_min_luma_coding_block_size;
> +	__u8	log2_min_luma_transform_block_size_minus2;
> +	__u8	log2_diff_max_min_luma_transform_block_size;
> +	__u8	max_transform_hierarchy_depth_inter;
> +	__u8	max_transform_hierarchy_depth_intra;
> +	__u8	scaling_list_enabled_flag;
> +	__u8	amp_enabled_flag;
> +	__u8	sample_adaptive_offset_enabled_flag;
> +	__u8	pcm_enabled_flag;
> +	__u8	pcm_sample_bit_depth_luma_minus1;
> +	__u8	pcm_sample_bit_depth_chroma_minus1;
> +	__u8	log2_min_pcm_luma_coding_block_size_minus3;
> +	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
> +	__u8	pcm_loop_filter_disabled_flag;
> +	__u8	num_short_term_ref_pic_sets;
> +	__u8	long_term_ref_pics_present_flag;
> +	__u8	num_long_term_ref_pics_sps;
> +	__u8	sps_temporal_mvp_enabled_flag;
> +	__u8	strong_intra_smoothing_enabled_flag;
> +};
> +
> +struct v4l2_ctrl_hevc_pps {
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
> +	__u8	dependent_slice_segment_flag;
> +	__u8	output_flag_present_flag;
> +	__u8	num_extra_slice_header_bits;
> +	__u8	sign_data_hiding_enabled_flag;
> +	__u8	cabac_init_present_flag;
> +	__s8	init_qp_minus26;
> +	__u8	constrained_intra_pred_flag;
> +	__u8	transform_skip_enabled_flag;
> +	__u8	cu_qp_delta_enabled_flag;
> +	__u8	diff_cu_qp_delta_depth;
> +	__s8	pps_cb_qp_offset;
> +	__s8	pps_cr_qp_offset;
> +	__u8	pps_slice_chroma_qp_offsets_present_flag;
> +	__u8	weighted_pred_flag;
> +	__u8	weighted_bipred_flag;
> +	__u8	transquant_bypass_enabled_flag;
> +	__u8	tiles_enabled_flag;
> +	__u8	entropy_coding_sync_enabled_flag;
> +	__u8	num_tile_columns_minus1;
> +	__u8	num_tile_rows_minus1;
> +	__u8	column_width_minus1[20];
> +	__u8	row_height_minus1[22];
> +	__u8	loop_filter_across_tiles_enabled_flag;
> +	__u8	pps_loop_filter_across_slices_enabled_flag;
> +	__u8	deblocking_filter_override_enabled_flag;
> +	__u8	pps_disable_deblocking_filter_flag;
> +	__s8	pps_beta_offset_div2;
> +	__s8	pps_tc_offset_div2;
> +	__u8	lists_modification_present_flag;
> +	__u8	log2_parallel_merge_level_minus2;
> +	__u8	slice_segment_header_extension_present_flag;
> +	__u8	padding;

I really don't like the padding. I noticed that I commented on that in v3,
but apparently forgot to reply to your reply.

So yes, I prefer that we should convert to using flags in order to avoid
padding.

> +};
> +
> +#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
> +#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
> +#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
> +
> +#define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
> +
> +struct v4l2_hevc_dpb_entry {
> +	__u64	timestamp;
> +	__u8	rps;
> +	__u8	field_pic;
> +	__u16	pic_order_cnt[2];
> +	__u8	padding[2];
> +};
> +
> +struct v4l2_hevc_pred_weight_table {
> +	__u8	luma_log2_weight_denom;
> +	__s8	delta_chroma_log2_weight_denom;
> +
> +	__s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__s8	delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
> +	__s8	chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
> +
> +	__s8	delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__s8	luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__s8	delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
> +	__s8	chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
> +
> +	__u8	padding[2];
> +};
> +
> +struct v4l2_ctrl_hevc_slice_params {
> +	__u32	bit_size;
> +	__u32	data_bit_offset;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
> +	__u8	nal_unit_type;
> +	__u8	nuh_temporal_id_plus1;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> +	__u8	slice_type;
> +	__u8	colour_plane_id;
> +	__u16	slice_pic_order_cnt;
> +	__u8	slice_sao_luma_flag;
> +	__u8	slice_sao_chroma_flag;
> +	__u8	slice_temporal_mvp_enabled_flag;
> +	__u8	num_ref_idx_l0_active_minus1;
> +	__u8	num_ref_idx_l1_active_minus1;
> +	__u8	mvd_l1_zero_flag;
> +	__u8	cabac_init_flag;
> +	__u8	collocated_from_l0_flag;
> +	__u8	collocated_ref_idx;
> +	__u8	five_minus_max_num_merge_cand;
> +	__u8	use_integer_mv_flag;
> +	__s8	slice_qp_delta;
> +	__s8	slice_cb_qp_offset;
> +	__s8	slice_cr_qp_offset;
> +	__s8	slice_act_y_qp_offset;
> +	__s8	slice_act_cb_qp_offset;
> +	__s8	slice_act_cr_qp_offset;
> +	__u8	slice_deblocking_filter_disabled_flag;
> +	__s8	slice_beta_offset_div2;
> +	__s8	slice_tc_offset_div2;
> +	__u8	slice_loop_filter_across_slices_enabled_flag;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI message */
> +	__u8	pic_struct;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> +	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	num_active_dpb_entries;
> +	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +
> +	__u8	num_rps_poc_st_curr_before;
> +	__u8	num_rps_poc_st_curr_after;
> +	__u8	num_rps_poc_lt_curr;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
> +	struct v4l2_hevc_pred_weight_table pred_weight_table;
> +
> +	__u8	padding[2];
> +};
> +
> +#endif
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a8aede26491e..630083e1936d 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -29,6 +29,7 @@
>  #include <media/mpeg2-ctrls.h>
>  #include <media/fwht-ctrls.h>
>  #include <media/h264-ctrls.h>
> +#include <media/hevc-ctrls.h>
>  
>  /* forward references */
>  struct file;
> @@ -57,6 +58,9 @@ struct poll_table_struct;
>   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
> + * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
> + * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
> + * @p_hevc_slice_params		Pointer to an HEVC slice parameters structure.

Missing colon after @p_hevc_slice_params.

>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -74,6 +78,9 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
>  	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>  	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> +	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> +	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> +	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
>  	void *p;
>  };
>  
> 

So I need a v6. Otherwise it all looks good to me.

Regards,

	Hans

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8871D7027E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 16:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfGVOkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 10:40:47 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59363 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725795AbfGVOkr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 10:40:47 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pZULhcG5A0SBqpZUOhro9s; Mon, 22 Jul 2019 16:40:42 +0200
Subject: Re: [PATCH v6 3/5] media: v4l: Add definitions for the HEVC slice
 controls
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
References: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
 <20190614143837.15605-4-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d91d8424-a06a-15da-93af-6d2d48619cee@xs4all.nl>
Date:   Mon, 22 Jul 2019 16:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614143837.15605-4-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKmoH0YwckJzByoYIq5aoo6RSHqTtw854CBe0DR9gJ4JrCC4qeqUwabXcZsjGY31HJi+cqX25vI/4Le+s+tYUDtQzmQ1lQgDuczb8NkxSkpX2PUb9gBg
 5phx3PJd5RBfsa/MgBr+zcnmWNuy92BQR+Rmd/H62npS2QLKTilcOsqNPvNCXPmzCYx8IjIWPg6fbFypb5MA6L+Sf3h//oNT7+2QLRNwfogjUTXEQ/KItURP
 JeM5m6A0DUIckxJp6l16JDv2AUK5kqVPI/VQ6X535cbJYtzGyO6yCbyEd+WpucKcUW04bnYxzIVbX1xbJj/oqlxukBFqn1XCAizpVOuUh3eYfmlqC981HSr3
 5yBaldYVJP78NMfjEWiTw4anB3MQwhPFFc/hdIL8u4SsZp7jNY/6npnvvWEkhUui681GH2IL2yGbs423JMAJYUKEalav9s8DhRFJwynQnbqujE+hb8Asixhm
 r/YSHZmKBTn5RlbhcvxAp6W2zSqTJmYTHTeyZ+xRchuEF41Jo/PQSD0DGLLQFt2j9pbL1Lehyqmk1EIlwrWplVb34tK/553qg1k1d0zF+zvpYT6CIiQ7P2wP
 QHbYcQ4G3TA5R+FwBTi00peldJ6/TTpb5ZwZmT67LJPzUa5RDvly/Q3/UbkmaWNGVJ8kuUs6IlTgjrhESByR8EODJ9uiSWYifC1tZokd11TXwoOLOnUQO8Ig
 gvTg9I9NZUpx9DoXf/0sbtLORCZfkZ4FAehio5KrMOLup/YCw6saBYvBhKsyYqKJiVYMpZrcf0573DddBEYpqPYS2oCAZ/dB
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/14/19 4:38 PM, Paul Kocialkowski wrote:
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
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  Documentation/media/uapi/v4l/biblio.rst       |   9 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 474 +++++++++++++++++-
>  .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 103 ++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/hevc-ctrls.h                    | 197 ++++++++
>  include/media/v4l2-ctrls.h                    |   7 +
>  8 files changed, 809 insertions(+), 3 deletions(-)
>  create mode 100644 include/media/hevc-ctrls.h
> 

<snip>

> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> new file mode 100644
> index 000000000000..f10f57625142
> --- /dev/null
> +++ b/include/media/hevc-ctrls.h
> @@ -0,0 +1,197 @@
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
> +#include <linux/videodev2.h>
> +
> +/* The pixel format isn't stable at the moment and will likely be renamed. */
> +#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
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
> +#define V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE		(1 << 0)
> +#define V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED			(1 << 1)
> +#define V4L2_HEVC_SPS_FLAG_AMP_ENABLED				(1 << 2)
> +#define V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET		(1 << 3)
> +#define V4L2_HEVC_SPS_FLAG_PCM_ENABLED				(1 << 4)
> +#define V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED		(1 << 5)
> +#define V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT		(1 << 6)
> +#define V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED		(1 << 7)
> +#define V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED	(1 << 8)
> +
> +/* The controls are not stable at the moment and will likely be reworked. */
> +struct v4l2_ctrl_hevc_sps {
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
> +	__u8	chroma_format_idc;

There is a hole in the struct here. Can that be fixed?

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
> +	__u8	pcm_sample_bit_depth_luma_minus1;
> +	__u8	pcm_sample_bit_depth_chroma_minus1;
> +	__u8	log2_min_pcm_luma_coding_block_size_minus3;
> +	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
> +	__u8	num_short_term_ref_pic_sets;
> +	__u8	num_long_term_ref_pics_sps;
> +
> +	__u64	flags;
> +};
> +
> +#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT		(1 << 0)
> +#define V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT			(1 << 1)
> +#define V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED		(1 << 2)
> +#define V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT			(1 << 3)
> +#define V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED		(1 << 4)
> +#define V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED		(1 << 5)
> +#define V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED			(1 << 6)
> +#define V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT	(1 << 7)
> +#define V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED			(1 << 8)
> +#define V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED			(1 << 9)
> +#define V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED		(1 << 10)
> +#define V4L2_HEVC_PPS_FLAG_TILES_ENABLED			(1 << 11)
> +#define V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED		(1 << 12)
> +#define V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED	(1 << 13)
> +#define V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED (1 << 14)
> +#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED	(1 << 15)
> +#define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1 << 16)
> +#define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1 << 17)
> +#define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1 << 18)
> +
> +struct v4l2_ctrl_hevc_pps {
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
> +	__u8	num_extra_slice_header_bits;
> +	__s8	init_qp_minus26;
> +	__u8	diff_cu_qp_delta_depth;
> +	__s8	pps_cb_qp_offset;
> +	__s8	pps_cr_qp_offset;
> +	__u8	num_tile_columns_minus1;
> +	__u8	num_tile_rows_minus1;
> +	__u8	column_width_minus1[20];
> +	__u8	row_height_minus1[22];
> +	__s8	pps_beta_offset_div2;
> +	__s8	pps_tc_offset_div2;
> +	__u8	log2_parallel_merge_level_minus2;
> +
> +	__u8	padding[4];

General note regarding padding:

1) Padding fields should be zeroed in std_validate_hevc(), but it
   looks that already happens, right?

2) Padding fields should be documented like this:

   * - __u8
     - ``padding``
     - Applications and drivers must set this to zero.

   That doesn't happen, AFAICS.

> +	__u64	flags;
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
> +	__u8	padding[6];
> +};
> +
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA		(1 << 0)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA		(1 << 1)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED	(1 << 2)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO			(1 << 3)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT			(1 << 4)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0		(1 << 5)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV		(1 << 6)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED (1 << 7)
> +#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1 << 8)
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
> +	__u8	num_ref_idx_l0_active_minus1;
> +	__u8	num_ref_idx_l1_active_minus1;
> +	__u8	collocated_ref_idx;
> +	__u8	five_minus_max_num_merge_cand;
> +	__s8	slice_qp_delta;
> +	__s8	slice_cb_qp_offset;
> +	__s8	slice_cr_qp_offset;
> +	__s8	slice_act_y_qp_offset;
> +	__s8	slice_act_cb_qp_offset;
> +	__s8	slice_act_cr_qp_offset;
> +	__s8	slice_beta_offset_div2;
> +	__s8	slice_tc_offset_div2;
> +
> +	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI message */
> +	__u8	pic_struct;
> +
> +	__u8	padding_pre[13];

Where does '13' come from? I expect values between 1 and 7, so 13 is weird.

I'm also not keen on having _pre and _post padding fields. Can that be
avoided somehow?

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
> +	__u8	padding_post[4];
> +	__u64	flags;
> +};
> +
> +#endif
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index b4433483af23..2fd477108e7a 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -20,6 +20,7 @@
>  #include <media/mpeg2-ctrls.h>
>  #include <media/fwht-ctrls.h>
>  #include <media/h264-ctrls.h>
> +#include <media/hevc-ctrls.h>
>  
>  /* forward references */
>  struct file;
> @@ -48,6 +49,9 @@ struct poll_table_struct;
>   * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
>   * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
> + * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
> + * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
> + * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
>   * @p:				Pointer to a compound value.
>   */
>  union v4l2_ctrl_ptr {
> @@ -65,6 +69,9 @@ union v4l2_ctrl_ptr {
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

Regards,

	Hans

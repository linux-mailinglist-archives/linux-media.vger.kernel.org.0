Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74388276BE5
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 10:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIXI34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 04:29:56 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49421 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727089AbgIXI34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 04:29:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LMdRk3Sv74gEjLMdUkaWvp; Thu, 24 Sep 2020 10:29:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600936192; bh=V8oiO5kx5Im9gP1gBJEcVtSbSgu719KwvVdN2unn7Dc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UPR+OYNf/EKwc0kSog8uXdWjZwSnYIs1HCR1I8+TY5P9XjzUaZdDt2meOaD1LIguR
         eMsgXzMUiMzUyYcvOWa/EvolQ4U4UIR7yd+0zvU5B+YF32Oor5YPf8cT4I4r1O2wUZ
         JSvqIfm6ELxiplDC4ENux0GfFJMt766pFDfnVqhp+xQdyGD5yXxqEj7EFIyc/mEthI
         jaqU6RbXcAI/ynCeQv//Jh7q7T8WnXFZKyPkAHC1p/ddRumh1XTiCPh3+LYH/0Ukjy
         zFS2fclZ6vVKh0mD6zTS9TyUpkxm26F/q+aqUg+YhjYZWG+kqO2iDnPrTb/g34FIMs
         9sBi8ae7a7BbQ==
Subject: Re: [PATCH] media: uapi: h264: Add documentation to the interface
 header
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200921193851.50752-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5049b19f-cb31-6e6e-2667-c63b7adf997b@xs4all.nl>
Date:   Thu, 24 Sep 2020 10:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921193851.50752-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDcKK9p3uL5xZa3Qk2DWRD7H61WMQUzoDc0XtnM6usthxY5ToN2BsrLh2x50CtgZY5kfC51RQ9okkF/fC+g2aAq4XOBkXEVEKR2F06cXvcckqhu+HEjr
 V9aEinCJqlrxCPdsuD9ycA2SwDjWwkBkaUPRurmK14jAn2nnOhloMbjP1gKW3Ea1SNFj5N9WV0FWc+LDouM1l2l1P+GkwGfD+ZcWK66ICwDDo1BpXX4tqCF2
 sadgSiz1XgJtrvns6HaAdvFLnHEAtXQbnr/H9IxhSQmnUQpCcZiUxsHPQmjacu6yqy2PB1ItS5OOffeM2bQznXCdrJFVhj5jxTAwb5L7U4A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 21/09/2020 21:38, Ezequiel Garcia wrote:
> In preparation for making the interface public,
> document all the structures. Special care is taken to
> annotate those fields that depart from the H264 syntax.
> 
> This commit only adds documentation and doesn't affect
> functionality in any way.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  include/media/h264-ctrls.h | 138 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 128 insertions(+), 10 deletions(-)
> 
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index ec4799154438..afc8e7c05c18 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -46,11 +46,38 @@
>  #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
>  #define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
>  
> +/**
> + * enum v4l2_mpeg_video_h264_decode_mode - Decoding mode
> + *
> + * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED: indicates that decoding
> + * is performed one slice at a time. In this mode,
> + * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS must contain the parsed slice
> + * parameters and the OUTPUT buffer must contain a single slice.
> + * V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature is used
> + * in order to support multislice frames.
> + * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED: indicates that
> + * decoding is performed per frame. The OUTPUT buffer must contain
> + * all slices and also both fields. This mode is typically supported
> + * by device drivers that are able to parse the slice(s) header(s)
> + * in hardware. When this mode is selected,
> + * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS is not used.
> + */
>  enum v4l2_mpeg_video_h264_decode_mode {
>  	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
>  	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
>  };
>  
> +/**
> + * enum v4l2_mpeg_video_h264_start_code - Start code
> + *
> + * @V4L2_MPEG_VIDEO_H264_START_CODE_NONE: slices are passed
> + * to the driver without any start code.
> + * @V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B: slices are passed
> + * to the driver with an Annex B start code prefix
> + * (legal start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001).
> + * This mode is typically supported by device drivers that parse
> + * the start code in hardware.
> + */
>  enum v4l2_mpeg_video_h264_start_code {
>  	V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
>  	V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> @@ -71,6 +98,12 @@ enum v4l2_mpeg_video_h264_start_code {
>  #define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
>  #define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
>  
> +/**
> + * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
> + *
> + * All the members on this sequence parameter set structure match the
> + * sequence parameter set syntax as specified by the H264 specification.
> + */
>  struct v4l2_ctrl_h264_sps {
>  	__u8 profile_idc;
>  	__u8 constraint_set_flags;
> @@ -101,6 +134,20 @@ struct v4l2_ctrl_h264_sps {
>  #define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
>  #define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
>  
> +/**
> + * struct v4l2_ctrl_h264_pps - H264 picture parameter set
> + *
> + * Except where noted, all the members on this picture parameter set
> + * structure match the sequence parameter set syntax as specified
> + * by the H264 specification.
> + *
> + * In particular, V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT flag
> + * has a specific meaning. This flag should be set if a non-flat
> + * scaling matrix applies to the picture. In this case, applications
> + * are expected to use V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX.
> + * This will be the case if SPS scaling_matrix_present_flag or
> + * PPS pic_scaling_matrix_present_flag syntax elements are set.

This is a bit confusing. 'This will be the case': what does 'This' refer
to?

> + */
>  struct v4l2_ctrl_h264_pps {
>  	__u8 pic_parameter_set_id;
>  	__u8 seq_parameter_set_id;
> @@ -115,6 +162,18 @@ struct v4l2_ctrl_h264_pps {
>  	__u16 flags;
>  };
>  
> +/**
> + * struct v4l2_ctrl_h264_scaling_matrix - H264 scaling matrices
> + *
> + * @scaling_list_4x4: scaling matrix after applying the inverse
> + * scanning process. Expected list order is Intra Y, Intra Cb,
> + * Intra Cr, Inter Y, Inter Cb, Inter Cr. The values on each
> + * scaling list are expected in raster scan order.
> + * @scaling_list_8x8: scaling matrix after applying the inverse
> + * scanning process. Expected list order is Intra Y, Inter Y,
> + * Intra Cb, Inter Cb, Intra Cr, Inter Cr. The values on each
> + * scaling list are expected in raster scan order.

The list order is different for the 4x4 and 8x8 matrices. Is that
correct?

If it is correct, then there should perhaps be a sentence like this
at the start:

"Note that the list order is different for the 4x4 and 8x8 matrices
as per the H264 specification."

(I assume that the order is based on the H264 spec)

> + */
>  struct v4l2_ctrl_h264_scaling_matrix {
>  	__u8 scaling_list_4x4[6][16];
>  	__u8 scaling_list_8x8[6][64];
> @@ -134,6 +193,12 @@ struct v4l2_h264_weight_factors {
>  	 ((pps)->weighted_bipred_idc == 1 && \
>  	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
>  
> +/**
> + * struct v4l2_ctrl_h264_pred_weights - Prediction weight table
> + *
> + * Prediction weight table, which matches the syntax specified
> + * by the H264 specification.
> + */
>  struct v4l2_ctrl_h264_pred_weights {
>  	__u16 luma_log2_weight_denom;
>  	__u16 chroma_log2_weight_denom;
> @@ -153,19 +218,41 @@ struct v4l2_ctrl_h264_pred_weights {
>  #define V4L2_H264_BOTTOM_FIELD_REF			0x2
>  #define V4L2_H264_FRAME_REF				0x3
>  
> +/**
> + * struct v4l2_h264_reference - H264 picture reference
> + *
> + * @fields: indicates how the picture is referenced.
> + * Valid values are V4L2_H264_{}_REF.
> + * @index: index into v4l2_ctrl_h264_decode_params.dpb[].
> + */
>  struct v4l2_h264_reference {
>  	__u8 fields;
> -
> -	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
>  	__u8 index;
>  };
>  
> +/**
> + * struct v4l2_ctrl_h264_slice_params - H264 slice parameters
> + *
> + * This structure holds the H264 syntax elements that are specified
> + * as non-invariant for the slices in a given frame.
> + *
> + * Slice invariant syntax elements are contained in struct
> + * v4l2_ctrl_h264_decode_params. This is done to reduce the API surface
> + * on frame-based decoders, where slice header parsing is done by the
> + * hardware.
> + *
> + * Slice invariant syntax elements are specified in specification section
> + * "7.4.3 Slice header semantics".
> + *
> + * Except where noted, the members on this struct match the slice header syntax.
> + *
> + * @header_bit_size: offset in bits to slice_data() from the beginning of this slice.
> + * @ref_pic_list0: reference picture list 0 after applying the per-slice modifications.
> + * @ref_pic_list1: reference picture list 1 after applying the per-slice modifications.

There are a lot more fields here that are not mentioned.

In order to prevent the doc checker to issue warnings about undocumented field,
I would suggest adding them all, but just keep the description simple:

@slice_type: see H264 specification.

You should also document @reserved since that's obviously not part of the h264 spec.

> + */
>  struct v4l2_ctrl_h264_slice_params {
> -	/* Offset in bits to slice_data() from the beginning of this slice. */
>  	__u32 header_bit_size;
> -
>  	__u32 first_mb_in_slice;
> -
>  	__u8 slice_type;
>  	__u8 colour_plane_id;
>  	__u8 redundant_pic_cnt;
> @@ -191,22 +278,55 @@ struct v4l2_ctrl_h264_slice_params {
>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>  #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
>  
> +/**
> + * struct v4l2_h264_dpb_entry - H264 decoded picture buffer entry
> + *
> + * @reference_ts: timestamp of the V4L2 capture buffer to use as reference.
> + * The timestamp refers to the timestamp field in struct v4l2_buffer.
> + * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
> + * @pic_num: matches PicNum variable assigned during the reference
> + * picture lists construction process.
> + * @frame_num: frame identifier which matches frame_num syntax element.
> + * @fields: indicates how the DPB entry is referenced. Valid values are
> + * V4L2_H264_{}_REF.
> + * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
> + * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
> + * Note that picture field is indicated by v4l2_buffer.field.

@flags and @reserved are missing.

> + */
>  struct v4l2_h264_dpb_entry {
>  	__u64 reference_ts;
>  	__u32 pic_num;
>  	__u16 frame_num;
>  	__u8 fields;
>  	__u8 reserved[5];
> -	/* Note that field is indicated by v4l2_buffer.field */
>  	__s32 top_field_order_cnt;
>  	__s32 bottom_field_order_cnt;
> -	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
> +	__u32 flags;
>  };
>  
>  #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
>  #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
>  #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
>  
> +/**
> + * struct v4l2_ctrl_h264_decode_params - H264 decoding parameters
> + *
> + * @dpb: decoded picture buffer.
> + * @nal_ref_idc: slice header syntax element.
> + * @frame_num: slice header syntax element.
> + * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
> + * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
> + * Note that picture field is indicated by v4l2_buffer.field.
> + * @idr_pic_id: slice header syntax element.
> + * @pic_order_cnt_lsb: slice header syntax element.
> + * @delta_pic_order_cnt_bottom: slice header syntax element.
> + * @delta_pic_order_cnt0: slice header syntax element.
> + * @delta_pic_order_cnt1: slice header syntax element.
> + * @dec_ref_pic_marking_bit_size: size in bits of dec_ref_pic_marking()
> + * syntax element.
> + * @pic_order_cnt_bit_size: size in bits of pic order count syntax.
> + * @slice_group_change_cycle: slice header syntax element.

@reserved and @flags are missing.

> + */
>  struct v4l2_ctrl_h264_decode_params {
>  	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
>  	__u16 nal_ref_idc;
> @@ -218,14 +338,12 @@ struct v4l2_ctrl_h264_decode_params {
>  	__s32 delta_pic_order_cnt_bottom;
>  	__s32 delta_pic_order_cnt0;
>  	__s32 delta_pic_order_cnt1;
> -	/* Size in bits of dec_ref_pic_marking() syntax element. */
>  	__u32 dec_ref_pic_marking_bit_size;
> -	/* Size in bits of pic order count syntax. */
>  	__u32 pic_order_cnt_bit_size;
>  	__u32 slice_group_change_cycle;
>  
>  	__u32 reserved;
> -	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
> +	__u32 flags;
>  };
>  
>  #endif
> 

Regards,

	Hans

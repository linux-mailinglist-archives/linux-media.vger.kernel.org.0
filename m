Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A438E355205
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245497AbhDFL1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:27:31 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59887 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229612AbhDFL13 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 07:27:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TjrYl4d3p43ycTjrblNi47; Tue, 06 Apr 2021 13:27:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617708439; bh=XWioPe2Kn1Nh+hrbju/fN+52IkLXE30xb0jAwPpw6ic=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nIOqtvxmB7bRQ1dT2rsOit9XF+tiVR3i6afekBNHUCX7t+OSJ6GW6EtYgFS6IjqUT
         mgoKKX7QCYR/0IrNi6DwDc01PfjD2GsLxKFRZ4PmEKNcJidPiyI1QP0pfHyW+EFyK7
         MifYgn0CL9++anXQAPM4tJMz5V/6mZG1XNwmWFrhqg+LUnq7Ykrs13pA6dKqcULmXm
         Flku6X0XqWNvTcw5xMyc827YVj9PfWsROMs+fN/HU29yQRSKpFIe+c+Fh6S9vEfF6p
         NcImvp8FcUaYCL03BihxlF0bZChFAvrIupaCmipPkjc05hGg+x2G+zVwI28Gd1bbSo
         DphnOICJZ6G6Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v8 05/13] media: hevc: Add decode params control
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
References: <20210401160003.88803-1-benjamin.gaignard@collabora.com>
 <20210401160003.88803-6-benjamin.gaignard@collabora.com>
Message-ID: <086a91bc-bbb0-bc02-477a-0ee84a7e909e@xs4all.nl>
Date:   Tue, 6 Apr 2021 13:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401160003.88803-6-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDAj9MUY4/TvKO597bVnEFdaIE6DqCUJUQ7vqygvrSIdEy5aoltp8yDqiL1ODvRIqqnWwqKkIlW4XZsm8gE9/eDAEfiydSkPxlF6JZPid+FOFu4TRy9j
 VpSEBECFxZK+KBjDxRHIp1Bm7pG7qvqgcjyQoqSdPedkeAXU0dPL2c7+pxzx33Edql8HCI88Mnf/nJPVM1xruFTXWNVb5akqZ7nX6uiLO9h5v2k4xh/KRbit
 vnY3LYGsuF+9z7jzftf6Mu4wOiFglBCrNOn60MNlDXQJqDa6mFTmB6IIr6cJZ36L5wHmA7xB42RnrV2Sy3Tiug==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:
> Add decode params control and it associated structure to regroup

it -> the

regroup -> group (?? I think that's what you mean here)

> all the information that are needed to decode a reference frame as
> it is describe in ITU-T Rec. H.265 section "8.3.2 Decoding process

it is describe -> is described

Regards,

	Hans

> for reference picture set".
> 
> Adapt Cedrus driver to these changes.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> version 8:
>  - add Ezequiel review tag
> 
> version 7:
>  - rebased on top of media_tree/master branch
> 
> version 6:
>  - fix compilation errors
> 
>  .../media/v4l/ext-ctrls-codec.rst             | 94 +++++++++++++++----
>  .../media/v4l/vidioc-queryctrl.rst            |  6 ++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 26 +++--
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 ++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 12 ++-
>  include/media/hevc-ctrls.h                    | 29 ++++--
>  8 files changed, 137 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 92314aec655a..7552869687f7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -3181,9 +3181,6 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - __u8
>        - ``pic_struct``
>        -
> -    * - __u8
> -      - ``num_active_dpb_entries``
> -      - The number of entries in ``dpb``.
>      * - __u8
>        - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>        - The list of L0 reference elements as indices in the DPB.
> @@ -3191,22 +3188,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>        - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>        - The list of L1 reference elements as indices in the DPB.
>      * - __u8
> -      - ``num_rps_poc_st_curr_before``
> -      - The number of reference pictures in the short-term set that come before
> -        the current frame.
> -    * - __u8
> -      - ``num_rps_poc_st_curr_after``
> -      - The number of reference pictures in the short-term set that come after
> -        the current frame.
> -    * - __u8
> -      - ``num_rps_poc_lt_curr``
> -      - The number of reference pictures in the long-term set.
> -    * - __u8
> -      - ``padding[7]``
> +      - ``padding``
>        - Applications and drivers must set this to zero.
> -    * - struct :c:type:`v4l2_hevc_dpb_entry`
> -      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> -      - The decoded picture buffer, for meta-data about reference frames.
>      * - struct :c:type:`v4l2_hevc_pred_weight_table`
>        - ``pred_weight_table``
>        - The prediction weight coefficients for inter-picture prediction.
> @@ -3441,3 +3424,78 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      so this has to come from client.
>      This is applicable to H264 and valid Range is from 0 to 63.
>      Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
> +
> +``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
> +    Specifies various decode parameters, especially the references picture order
> +    count (POC) for all the lists (short, long, before, current, after) and the
> +    number of entries for each of them.
> +    These parameters are defined according to :ref:`hevc`.
> +    They are described in section 8.3 "Slice decoding process" of the
> +    specification.
> +
> +.. c:type:: v4l2_ctrl_hevc_decode_params
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_decode_params
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __s32
> +      - ``pic_order_cnt_val``
> +      - PicOrderCntVal as described in section 8.3.1 "Decoding process
> +        for picture order count" of the specification.
> +    * - __u8
> +      - ``num_active_dpb_entries``
> +      - The number of entries in ``dpb``.
> +    * - struct :c:type:`v4l2_hevc_dpb_entry`
> +      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> +      - The decoded picture buffer, for meta-data about reference frames.
> +    * - __u8
> +      - ``num_poc_st_curr_before``
> +      - The number of reference pictures in the short-term set that come before
> +        the current frame.
> +    * - __u8
> +      - ``num_poc_st_curr_after``
> +      - The number of reference pictures in the short-term set that come after
> +        the current frame.
> +    * - __u8
> +      - ``num_poc_lt_curr``
> +      - The number of reference pictures in the long-term set.
> +    * - __u8
> +      - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> +      - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
> +        picture set.
> +    * - __u8
> +      - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> +      - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
> +        picture set.
> +    * - __u8
> +      - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
> +      - PocLtCurr as described in section 8.3.2 "Decoding process for reference
> +        picture set.
> +    * - __u64
> +      - ``flags``
> +      - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
> +
> +.. _hevc_decode_params_flags:
> +
> +``Decode Parameters Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC``
> +      - 0x00000001
> +      -
> +    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC``
> +      - 0x00000002
> +      -
> +    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR``
> +      - 0x00000004
> +      -
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 8a285daedc6a..cf8f94693c39 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -495,6 +495,12 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_vp8_frame`, containing VP8
>  	frame parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
> +	decoding parameters for stateless video decoders.
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 39038c6ad8fb..8c1a98ed4ca4 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1037,6 +1037,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
> +	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
>  
> @@ -1496,6 +1497,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
> +		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
> +		break;
>  	case V4L2_CID_UNIT_CELL_SIZE:
>  		*type = V4L2_CTRL_TYPE_AREA;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> @@ -1852,6 +1856,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
>  	struct v4l2_area *area;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>  	unsigned int i;
> @@ -2127,23 +2132,27 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(*p_hevc_pps);
>  		break;
>  
> -	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> -		p_hevc_slice_params = p;
> +	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
> +		p_hevc_decode_params = p;
>  
> -		if (p_hevc_slice_params->num_active_dpb_entries >
> +		if (p_hevc_decode_params->num_active_dpb_entries >
>  		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
>  			return -EINVAL;
>  
> -		zero_padding(p_hevc_slice_params->pred_weight_table);
> -
> -		for (i = 0; i < p_hevc_slice_params->num_active_dpb_entries;
> +		for (i = 0; i < p_hevc_decode_params->num_active_dpb_entries;
>  		     i++) {
>  			struct v4l2_hevc_dpb_entry *dpb_entry =
> -				&p_hevc_slice_params->dpb[i];
> +				&p_hevc_decode_params->dpb[i];
>  
>  			zero_padding(*dpb_entry);
>  		}
>  
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		p_hevc_slice_params = p;
> +
> +		zero_padding(p_hevc_slice_params->pred_weight_table);
>  		zero_padding(*p_hevc_slice_params);
>  		break;
>  
> @@ -2840,6 +2849,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
>  		break;
> +	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
> +		elem_size = sizeof(struct v4l2_ctrl_hevc_decode_params);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		elem_size = sizeof(struct v4l2_area);
>  		break;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 92812d1a39d4..6f095ae53818 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -151,6 +151,12 @@ static const struct cedrus_control cedrus_controls[] = {
>  		},
>  		.codec		= CEDRUS_CODEC_VP8,
>  	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
> +		},
> +		.codec		= CEDRUS_CODEC_H265,
> +	},
>  };
>  
>  #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 15f147dad4cb..930922bd4e46 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -76,6 +76,7 @@ struct cedrus_h265_run {
>  	const struct v4l2_ctrl_hevc_sps			*sps;
>  	const struct v4l2_ctrl_hevc_pps			*pps;
>  	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
> +	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
>  };
>  
>  struct cedrus_vp8_run {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index d696b3ec70c0..8a7e44f92812 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -68,6 +68,8 @@ void cedrus_device_run(void *priv)
>  			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
>  		run.h265.slice_params = cedrus_find_control_data(ctx,
>  			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
> +		run.h265.decode_params = cedrus_find_control_data(ctx,
> +			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
>  		break;
>  
>  	case V4L2_PIX_FMT_VP8_FRAME:
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index ce497d0197df..397a4ba5df4c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -245,6 +245,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	const struct v4l2_ctrl_hevc_sps *sps;
>  	const struct v4l2_ctrl_hevc_pps *pps;
>  	const struct v4l2_ctrl_hevc_slice_params *slice_params;
> +	const struct v4l2_ctrl_hevc_decode_params *decode_params;
>  	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
>  	dma_addr_t src_buf_addr;
>  	dma_addr_t src_buf_end_addr;
> @@ -256,6 +257,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	sps = run->h265.sps;
>  	pps = run->h265.pps;
>  	slice_params = run->h265.slice_params;
> +	decode_params = run->h265.decode_params;
>  	pred_weight_table = &slice_params->pred_weight_table;
>  
>  	/* MV column buffer size and allocation. */
> @@ -487,7 +489,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  
>  	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
>  	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
> -	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(slice_params->num_rps_poc_st_curr_after == 0) |
> +	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_poc_st_curr_after == 0) |
>  	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
>  	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
>  	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
> @@ -527,8 +529,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
>  
>  	/* Write decoded picture buffer in pic list. */
> -	cedrus_h265_frame_info_write_dpb(ctx, slice_params->dpb,
> -					 slice_params->num_active_dpb_entries);
> +	cedrus_h265_frame_info_write_dpb(ctx, decode_params->dpb,
> +					 decode_params->num_active_dpb_entries);
>  
>  	/* Output frame. */
>  
> @@ -545,7 +547,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  
>  	/* Reference picture list 0 (for P/B frames). */
>  	if (slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_I) {
> -		cedrus_h265_ref_pic_list_write(dev, slice_params->dpb,
> +		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
>  					       slice_params->ref_idx_l0,
>  					       slice_params->num_ref_idx_l0_active_minus1 + 1,
>  					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST0);
> @@ -564,7 +566,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  
>  	/* Reference picture list 1 (for B frames). */
>  	if (slice_params->slice_type == V4L2_HEVC_SLICE_TYPE_B) {
> -		cedrus_h265_ref_pic_list_write(dev, slice_params->dpb,
> +		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
>  					       slice_params->ref_idx_l1,
>  					       slice_params->num_ref_idx_l1_active_minus1 + 1,
>  					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST1);
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 003f819ecb26..8e0109eea454 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -19,6 +19,7 @@
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
> +#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
>  #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
>  
> @@ -26,6 +27,7 @@
>  #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
>  #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
>  #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
> +#define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
>  
>  enum v4l2_mpeg_video_hevc_decode_mode {
>  	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
> @@ -194,18 +196,10 @@ struct v4l2_ctrl_hevc_slice_params {
>  	__u8	pic_struct;
>  
>  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> -	__u8	num_active_dpb_entries;
>  	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>  	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>  
> -	__u8	num_rps_poc_st_curr_before;
> -	__u8	num_rps_poc_st_curr_after;
> -	__u8	num_rps_poc_lt_curr;
> -
> -	__u8	padding;
> -
> -	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
> -	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	padding[5];
>  
>  	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
>  	struct v4l2_hevc_pred_weight_table pred_weight_table;
> @@ -213,4 +207,21 @@ struct v4l2_ctrl_hevc_slice_params {
>  	__u64	flags;
>  };
>  
> +#define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
> +#define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
> +#define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
> +
> +struct v4l2_ctrl_hevc_decode_params {
> +	__s32	pic_order_cnt_val;
> +	__u8	num_active_dpb_entries;
> +	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	num_poc_st_curr_before;
> +	__u8	num_poc_st_curr_after;
> +	__u8	num_poc_lt_curr;
> +	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> +	__u64	flags;
> +};
> +
>  #endif
> 


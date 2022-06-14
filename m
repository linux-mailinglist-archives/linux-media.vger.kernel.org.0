Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E4854B47A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356696AbiFNPUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 11:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356666AbiFNPUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 11:20:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4665D326EB;
        Tue, 14 Jun 2022 08:20:45 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46] (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 94C9C66016B6;
        Tue, 14 Jun 2022 16:20:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655220044;
        bh=8BdhfJPhS9pkvNh2AfdYyZoI34NuVVX/SWzfb6me7/0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VOMgR7KI+Xk/KVQS4/XKBzIx/eXtGwplgBLH8RN+PRwlxBC3b/soog/foQ9biZkhT
         lRFUa4c+cfYCJkcax+jPHBbNvpscZHBbJeZhwLB/tNRE+/BfLuPLXeb6veUweIrVsC
         u8JsmoDqnXQaGkbYVUS0x2Bn9DtynBY08OvYceJT7cuJY2S6YI+1ggHbog0y/pK7Ga
         yu49l/3pI641oc6CEMbnGcVRmNJgJErX/xl9ynLP8d6D/V+mR4uIAearMhiJ+GtMBm
         FIdYX6WX7qu/EHo9nA7J7afpXPf9sopp75iEZX7YTnW6rx3AUdcah5mQxYrZ1ES96D
         E8vN/bzTMip3A==
Message-ID: <0fbf1961-c3f7-9205-4ec4-b7640614ae20@collabora.com>
Date:   Tue, 14 Jun 2022 17:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 08/17] media: uapi: HEVC: Add documentation to uAPI
 structure
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com
References: <20220614083614.240641-1-benjamin.gaignard@collabora.com>
 <20220614083614.240641-9-benjamin.gaignard@collabora.com>
 <6960a5b6-441d-71a1-d99a-873b502301ca@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <6960a5b6-441d-71a1-d99a-873b502301ca@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 14/06/2022 à 15:39, Hans Verkuil a écrit :
> On 6/14/22 10:36, Benjamin Gaignard wrote:
>> Add kernel-doc documentation for all the HEVC structures.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 5:
>> - Fix num_short_term_ref_pic_sets and num_long_term_ref_pics_sps
>>
>>   .../media/v4l/ext-ctrls-codec.rst             | 164 +++++++------
>>   include/media/hevc-ctrls.h                    | 221 +++++++++++++++++-
>>   2 files changed, 311 insertions(+), 74 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 1ccf6dda61b3..06b967de140c 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -2695,70 +2695,76 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>           of H.265 specifications.
>>       * - __u16
>>         - ``pic_width_in_luma_samples``
>> -      -
>> +      - Specifies the width of each decoded picture in units of luma samples.
>>       * - __u16
>>         - ``pic_height_in_luma_samples``
>> -      -
>> +      - Specifies the height of each decoded picture in units of luma samples.
>>       * - __u8
>>         - ``bit_depth_luma_minus8``
>> -      -
>> +      - Specifies the bit depth of the samples of the luma array.
> Shouldn't this be:
>
>        - This value plus 8 specifies the bit depth of the samples of the luma array.
>
> Same elsewhere.

I will change them in the next version.

>
>>       * - __u8
>>         - ``bit_depth_chroma_minus8``
>> -      -
>> +      - Specifies the bit depth of the samples of the chroma arrays.
>>       * - __u8
>>         - ``log2_max_pic_order_cnt_lsb_minus4``
>> -      -
>> +      - Specifies the value of the variable MaxPicOrderCntLsb.
>>       * - __u8
>>         - ``sps_max_dec_pic_buffering_minus1``
>> -      -
>> +      - Plus 1 specifies the maximum required size of the decoded picture buffer for
> I would prefer to phrase this as: "This value plus 1"
> I'm not sure how common the current phrase is, though. If it is already used everywhere,
> then keep it as-is.
>
>> +        the CVS
> Missing period at the end.
>
> What is CVS? Perhaps write the full name?

it is for coded video sequence, I will write the full name in next version.

>
>>       * - __u8
>>         - ``sps_max_num_reorder_pics``
>> -      -
>> +      - Indicates the maximum allowed number of pictures.
>>       * - __u8
>>         - ``sps_max_latency_increase_plus1``
>> -      -
>> +      - Not equal to 0 is used to compute the value of SpsMaxLatencyPictures[i].
>>       * - __u8
>>         - ``log2_min_luma_coding_block_size_minus3``
>> -      -
>> +      - Plus 3 specifies the minimum luma coding block size.
>>       * - __u8
>>         - ``log2_diff_max_min_luma_coding_block_size``
>> -      -
>> +      - Specifies the difference between the maximum and minimum luma coding block size.
>>       * - __u8
>>         - ``log2_min_luma_transform_block_size_minus2``
>> -      -
>> +      - Plus 2 specifies the minimum luma transform block size.
>>       * - __u8
>>         - ``log2_diff_max_min_luma_transform_block_size``
>> -      -
>> +      - Specifies the difference between the maximum and minimum luma transform block size.
>>       * - __u8
>>         - ``max_transform_hierarchy_depth_inter``
>> -      -
>> +      - Specifies the maximum hierarchy depth for transform units of coding units coded
>> +        in inter prediction mode.
>>       * - __u8
>>         - ``max_transform_hierarchy_depth_intra``
>> -      -
>> +      - Specifies the maximum hierarchy depth for transform units of coding units coded in
>> +        intra prediction mode.
>>       * - __u8
>>         - ``pcm_sample_bit_depth_luma_minus1``
>> -      -
>> +      - Specifies the number of bits used to represent each of PCM sample values of the
>> +        luma component.
>>       * - __u8
>>         - ``pcm_sample_bit_depth_chroma_minus1``
>> -      -
>> +      - Specifies the number of bits used to represent each of PCM sample values of
>> +        the chroma components.
>>       * - __u8
>>         - ``log2_min_pcm_luma_coding_block_size_minus3``
>> -      -
>> +      - Plus 3 specifies the minimum size of coding blocks.
>>       * - __u8
>>         - ``log2_diff_max_min_pcm_luma_coding_block_size``
>> -      -
>> +      - Specifies the difference between the maximum and minimum size of coding blocks.
>>       * - __u8
>>         - ``num_short_term_ref_pic_sets``
>> -      -
>> +      - Specifies the number of st_ref_pic_set() syntax structures included in the SPS.
>>       * - __u8
>>         - ``num_long_term_ref_pics_sps``
>> -      -
>> +      - Specifies the number of candidate long-term reference pictures that are
>> +        specified in the SPS.
>>       * - __u8
>>         - ``chroma_format_idc``
>> -      -
>> +      - Specifies the chroma sampling.
>>       * - __u8
>>         - ``sps_max_sub_layers_minus1``
>> -      -
>> +      - plus 1 specifies the maximum number of temporal sub-layers.
> plus -> Plus
>
>>       * - __u64
>>         - ``flags``
>>         - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
>> @@ -2837,7 +2843,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>         - Identifies the PPS for reference by other syntax elements.
>>       * - __u8
>>         - ``num_extra_slice_header_bits``
>> -      -
>> +      - Specifies the number of extra slice header bits that are present
>> +        in the slice header RBSP for coded pictures referring to the PPS.
>>       * - __u8
>>         - ``num_ref_idx_l0_default_active_minus1``
>>         - Specifies the inferred value of num_ref_idx_l0_active_minus1
>> @@ -2846,37 +2853,42 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>         - Specifies the inferred value of num_ref_idx_l1_active_minus1
>>       * - __s8
>>         - ``init_qp_minus26``
>> -      -
>> +      - Plus 26 specifies the initial value of SliceQp Y for each slice
>> +        referring to the PPS.
>>       * - __u8
>>         - ``diff_cu_qp_delta_depth``
>> -      -
>> +      - Specifies the difference between the luma coding tree block size
>> +        and the minimum luma coding block size of coding units that
>> +        convey cu_qp_delta_abs and cu_qp_delta_sign_flag.
>>       * - __s8
>>         - ``pps_cb_qp_offset``
>> -      -
>> +      - Specify the offsets to the luma quantization parameter Cb.
>>       * - __s8
>>         - ``pps_cr_qp_offset``
>> -      -
>> +      - Specify the offsets to the luma quantization parameter Cr.
>>       * - __u8
>>         - ``num_tile_columns_minus1``
>> -      -
>> +      - Plus 1 specifies the number of tile columns partitioning the picture.
>>       * - __u8
>>         - ``num_tile_rows_minus1``
>> -      -
>> +      - Plus 1 specifies the number of tile rows partitioning the picture.
>>       * - __u8
>>         - ``column_width_minus1[20]``
>> -      -
>> +      - Plus 1 specifies the width of the i-th tile column in units of
> Wouldn't "of each tile column" be easier to understand?

yes

>
>> +        coding tree blocks.
>>       * - __u8
>>         - ``row_height_minus1[22]``
>> -      -
>> +      - Plus 1 specifies the height of the i-th tile row in units of coding
> Ditto.
>
>> +        tree blocks.
>>       * - __s8
>>         - ``pps_beta_offset_div2``
>> -      -
>> +      - Specify the default deblocking parameter offsets for beta divided by 2.
>>       * - __s8
>>         - ``pps_tc_offset_div2``
>> -      -
>> +      - Specify the default deblocking parameter offsets for tC divided by 2.
> Is it actually called 'tC' in the HEVC standard, or is this a typo?

it is called tC in HEVC spec:
'pps_beta_offset_div2 and pps_tc_offset_div2 specify the default deblocking parameter offsets for β and tC...'

>
>>       * - __u8
>>         - ``log2_parallel_merge_level_minus2``
>> -      -
>> +      - Plus 2 specifies the value of the variable Log2ParMrgLevel.
>>       * - __u8
>>         - ``padding[4]``
>>         - Applications and drivers must set this to zero.
>> @@ -2998,10 +3010,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>         - Offset (in bits) to the video data in the current slice data.
>>       * - __u8
>>         - ``nal_unit_type``
>> -      -
>> +      - Specifies the coding type of the slice (B, P or I).
>>       * - __u8
>>         - ``nuh_temporal_id_plus1``
>> -      -
>> +      - Minus 1 specifies a temporal identifier for the NAL unit.
>>       * - __u8
>>         - ``slice_type``
>>         -
>> @@ -3009,52 +3021,56 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>   	V4L2_HEVC_SLICE_TYPE_B).
>>       * - __u8
>>         - ``colour_plane_id``
>> -      -
>> +      - Specifies the colour plane associated with the current slice.
>>       * - __s32
>>         - ``slice_pic_order_cnt``
>> -      -
>> +      - Specifies the picture order count.
>>       * - __u8
>>         - ``num_ref_idx_l0_active_minus1``
>> -      -
>> +      - Specifies the maximum reference index for reference picture list 0
>> +        that may be used to decode the slice.
>>       * - __u8
>>         - ``num_ref_idx_l1_active_minus1``
>> -      -
>> +      - Specifies the maximum reference index for reference picture list 1
>> +        that may be used to decode the slice.
>>       * - __u8
>>         - ``collocated_ref_idx``
>> -      -
>> +      - Specifies the reference index of the collocated picture used for
>> +        temporal motion vector prediction.
>>       * - __u8
>>         - ``five_minus_max_num_merge_cand``
>> -      -
>> +      - Specifies the maximum number of merging motion vector prediction
>> +        candidates supported in the slice subtracted from 5.
>>       * - __s8
>>         - ``slice_qp_delta``
>> -      -
>> +      - Specifies the initial value of QpY to be used for the coding blocks in the slice.
> It's really 'QpY'? There is no obvious relationship between the 'Y' character and the '_delta'
> suffix. Just checking.

yes it is 'Qpy' in HEVC spec:
'slice_qp_delta specifies the initial value of QpY to be used for the coding blocks in the slice until modified by the value
of CuQpDeltaVal in the coding unit layer. The initial value of the QpY quantization parameter for the slice, SliceQpY, is
derived as follows:
SliceQpY = 26 + init_qp_minus26 + slice_qp_delta'

Regards,
Benjamin

>
>>       * - __s8
>>         - ``slice_cb_qp_offset``
>> -      -
>> +      - Specifies a difference to be added to the value of pps_cb_qp_offset.
>>       * - __s8
>>         - ``slice_cr_qp_offset``
>> -      -
>> +      - Specifies a difference to be added to the value of pps_cr_qp_offset.
>>       * - __s8
>>         - ``slice_act_y_qp_offset``
>> -      -
>> +      - screen content extension parameters
>>       * - __s8
>>         - ``slice_act_cb_qp_offset``
>> -      -
>> +      - screen content extension parameters
>>       * - __s8
>>         - ``slice_act_cr_qp_offset``
>> -      -
>> +      - screen content extension parameters
>>       * - __s8
>>         - ``slice_beta_offset_div2``
>> -      -
>> +      - Specify the deblocking parameter offsets for beta divided by 2.
>>       * - __s8
>>         - ``slice_tc_offset_div2``
>> -      -
>> +      - Specify the deblocking parameter offsets for tC divided by 2.
>>       * - __u8
>>         - ``pic_struct``
>> -      -
>> +      - Indicates whether a picture should be displayed as a frame or as one or more fields.
>>       * - __u32
>>         - ``slice_segment_addr``
>> -      -
>> +      - Specifies the address of the first coding tree block in the slice segment.
>>       * - __u8
>>         - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>         - The list of L0 reference elements as indices in the DPB.
>> @@ -3219,11 +3235,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>         - ``field_pic``
>>         - Whether the reference is a field picture or a frame.
>>           See :ref:`HEVC dpb field pic Flags <hevc_dpb_field_pic_flags>`
>> -    * - __u16
>> -      - ``pic_order_cnt[2]``
>> -      - The picture order count of the reference. Only the first element of the
>> -        array is used for frame pictures, while the first element identifies the
>> -        top field and the second the bottom field in field-coded pictures.
>> +    * - __s32
>> +      - ``pic_order_cnt_val``
>> +      - The picture order count of the current picture.
>>       * - __u8
>>         - ``padding[2]``
>>         - Applications and drivers must set this to zero.
>> @@ -3298,36 +3312,44 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>       :stub-columns: 0
>>       :widths:       1 1 2
>>   
>> -    * - __u8
>> -      - ``luma_log2_weight_denom``
>> -      -
>> -    * - __s8
>> -      - ``delta_chroma_log2_weight_denom``
>> -      -
>>       * - __s8
>>         - ``delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> -      -
>> +      - The difference of the weighting factor applied to the luma
>> +        prediction value for list 0.
>>       * - __s8
>>         - ``luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> -      -
>> +      - The additive offset applied to the luma prediction value for list 0.
>>       * - __s8
>>         - ``delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
>> -      -
>> +      - The difference of the weighting factor applied to the chroma
>> +        prediction value for list 0.
>>       * - __s8
>>         - ``chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
>> -      -
>> +      - The difference of the additive offset applied to the chroma
>> +        prediction values for list 0.
>>       * - __s8
>>         - ``delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> -      -
>> +      - The difference of the weighting factor applied to the luma
>> +        prediction value for list 1.
>>       * - __s8
>>         - ``luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> -      -
>> +      - The additive offset applied to the luma prediction value for list 1.
>>       * - __s8
>>         - ``delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
>> -      -
>> +      - The difference of the weighting factor applied to the chroma
>> +        prediction value for list 1.
>>       * - __s8
>>         - ``chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
>> -      -
>> +      - The difference of the additive offset applied to the chroma
>> +        prediction values for list 1.
>> +    * - __u8
>> +      - ``luma_log2_weight_denom``
>> +      - The base 2 logarithm of the denominator for all luma weighting
>> +        factors.
>> +    * - __s8
>> +      - ``delta_chroma_log2_weight_denom``
>> +      - The difference of the base 2 logarithm of the denominator for
>> +        all chroma weighting factors.
>>       * - __u8
>>         - ``padding[6]``
>>         - Applications and drivers must set this to zero.
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index f3695ab44389..0dbd5d681c28 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -55,9 +55,68 @@ enum v4l2_stateless_hevc_start_code {
>>   #define V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED		(1ULL << 7)
>>   #define V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED	(1ULL << 8)
>>   
>> -/* The controls are not stable at the moment and will likely be reworked. */
>> +/**
>> + * struct v4l2_ctrl_hevc_sps - ITU-T Rec. H.265: Sequence parameter set
>> + *
>> + * @video_parameter_set_id: specifies the value of the
>> + *			    vps_video_parameter_set_id of the active VPS
>> + * @seq_parameter_set_id: provides an identifier for the SPS for
>> + *			  reference by other syntax elements
>> + * @pic_width_in_luma_samples: specifies the width of each decoded picture
>> + *			       in units of luma samples
>> + * @pic_height_in_luma_samples: specifies the height of each decoded picture
>> + *				in units of luma samples
>> + * @bit_depth_luma_minus8: specifies the bit depth of the samples of the
>> + *			   luma array
>> + * @bit_depth_chroma_minus8: specifies the bit depth of the samples of the
>> + *			     chroma arrays
>> + * @log2_max_pic_order_cnt_lsb_minus4: specifies the value of the variable
>> + *				       MaxPicOrderCntLsb
>> + * @sps_max_dec_pic_buffering_minus1: plus 1 specifies the maximum required
>> + *				      size of the decoded picture buffer for
>> + *				      the CVS
>> + * @sps_max_num_reorder_pics: indicates the maximum allowed number of pictures
>> + * @sps_max_latency_increase_plus1: not equal to 0 is used to compute the
>> + *				    value of SpsMaxLatencyPictures[i]
> What is 'i' in this context?
>
>> + * @log2_min_luma_coding_block_size_minus3: plus 3 specifies the minimum
>> + *					    luma coding block size
>> + * @log2_diff_max_min_luma_coding_block_size: specifies the difference between
>> + *					      the maximum and minimum luma
>> + *					      coding block size
>> + * @log2_min_luma_transform_block_size_minus2: plus 2 specifies the minimum luma
>> + *					       transform block size
>> + * @log2_diff_max_min_luma_transform_block_size: specifies the difference between
>> + *						 the maximum and minimum luma
>> + *						 transform block size
>> + * @max_transform_hierarchy_depth_inter: specifies the maximum hierarchy
>> + *					 depth for transform units of
>> + *					 coding units coded in inter
>> + *					 prediction mode
>> + * @max_transform_hierarchy_depth_intra: specifies the maximum hierarchy
>> + *					 depth for transform units of
>> + *					 coding units coded in intra
>> + *					 prediction mode
>> + * @pcm_sample_bit_depth_luma_minus1: specifies the number of bits used to
>> + *				      represent each of PCM sample values of the
>> + *				      luma component
>> + * @pcm_sample_bit_depth_chroma_minus1: specifies the number of bits used to
>> + *					represent each of PCM sample values of
>> + *					the chroma components
>> + * @log2_min_pcm_luma_coding_block_size_minus3: plus 3 specifies the minimum size
>> + *						of coding blocks
>> + * @log2_diff_max_min_pcm_luma_coding_block_size: specifies the difference between
>> + *						  the maximum and minimum size of
>> + *						  coding blocks
>> + * @num_short_term_ref_pic_sets: specifies the number of st_ref_pic_set()
>> + *				 syntax structures included in the SPS
>> + * @num_long_term_ref_pics_sps:	specifies the number of candidate long-term
>> + *				reference pictures that are specified in the SPS
>> + * @chroma_format_idc: specifies the chroma sampling
>> + * @sps_max_sub_layers_minus1: plus 1 specifies the maximum number of temporal
>> + *			       sub-layers
>> + * @flags: see V4L2_HEVC_SPS_FLAG_{}
>> + */
>>   struct v4l2_ctrl_hevc_sps {
>> -	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
>>   	__u8	video_parameter_set_id;
>>   	__u8	seq_parameter_set_id;
>>   	__u16	pic_width_in_luma_samples;
>> @@ -108,8 +167,43 @@ struct v4l2_ctrl_hevc_sps {
>>   #define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
>>   #define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
>>   
>> +/**
>> + * struct v4l2_ctrl_hevc_pps - ITU-T Rec. H.265: Picture parameter set
>> + *
>> + * @pic_parameter_set_id: identifies the PPS for reference by other
>> + *			  syntax elements
>> + * @num_extra_slice_header_bits: specifies the number of extra slice header
>> + *				 bits that are present in the slice header RBSP
>> + *				 for coded pictures referring to the PPS.
>> + * @num_ref_idx_l0_default_active_minus1: specifies the inferred value of
>> + *					  num_ref_idx_l0_active_minus1
>> + * @num_ref_idx_l1_default_active_minus1: specifies the inferred value of
>> + *					  num_ref_idx_l1_active_minus1
>> + * @init_qp_minus26: plus 26 specifies the initial value of SliceQp Y for
>> + *		     each slice referring to the PPS
>> + * @diff_cu_qp_delta_depth: specifies the difference between the luma coding
>> + *			    tree block size and the minimum luma coding block
>> + *			    size of coding units that convey cu_qp_delta_abs
>> + *			    and cu_qp_delta_sign_flag
>> + * @pps_cb_qp_offset: specify the offsets to the luma quantization parameter Cb
>> + * @pps_cr_qp_offset: specify the offsets to the luma quantization parameter Cr
>> + * @num_tile_columns_minus1: plus 1 specifies the number of tile columns
>> + *			     partitioning the picture
>> + * @num_tile_rows_minus1: plus 1 specifies the number of tile rows partitioning
>> + *			  the picture
>> + * @column_width_minus1: plus 1 specifies the width of the i-th tile column in
> "the i-th" -> each
>
> I think that's easier to understand.
>
>> + *			 units of coding tree blocks
>> + * @row_height_minus1: plus 1 specifies the height of the i-th tile row in
> Ditto.
>
>> + *		       units of coding tree blocks
>> + * @pps_beta_offset_div2: specify the default deblocking parameter offsets for
>> + *			  beta divided by 2
>> + * @pps_tc_offset_div2: specify the default deblocking parameter offsets for tC
>> + *			divided by 2
>> + * @log2_parallel_merge_level_minus2: plus 2 specifies the value of the variable
>> + *				      Log2ParMrgLevel
>> + * @flags: see V4L2_HEVC_PPS_FLAG_{}
>> + */
>>   struct v4l2_ctrl_hevc_pps {
>> -	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
>>   	__u8	pic_parameter_set_id;
>>   	__u8	num_extra_slice_header_bits;
>>   	__u8	num_ref_idx_l0_default_active_minus1;
>> @@ -148,6 +242,14 @@ struct v4l2_ctrl_hevc_pps {
>>   
>>   #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>>   
>> +/**
>> + * struct v4l2_hevc_dpb_entry - HEVC decoded picture buffer entry
>> + *
>> + * @timestamp: timestamp of the V4L2 capture buffer to use as reference.
>> + * @flags: long term flag for the reference frame
>> + * @field_pic: whether the reference is a field picture or a frame.
>> + * @pic_order_cnt_val: the picture order count of the reference.
>> + */
>>   struct v4l2_hevc_dpb_entry {
>>   	__u64	timestamp;
>>   	__u8	flags;
>> @@ -156,6 +258,31 @@ struct v4l2_hevc_dpb_entry {
>>   	__u8	padding[2];
>>   };
>>   
>> +/**
>> + * struct v4l2_hevc_pred_weight_table - HEVC weighted prediction parameters
>> + *
>> + * @delta_luma_weight_l0: the difference of the weighting factor applied
>> + *			  to the luma prediction value for list 0
>> + * @luma_offset_l0: the additive offset applied to the luma prediction value
>> + *		    for list 0
>> + * @delta_chroma_weight_l0: the difference of the weighting factor applied
>> + *			    to the chroma prediction values for list 0
>> + * @chroma_offset_l0: the difference of the additive offset applied to
>> + *		      the chroma prediction values for list 0
>> + * @delta_luma_weight_l1: the difference of the weighting factor applied
>> + *			  to the luma prediction value for list 1
>> + * @luma_offset_l1: the additive offset applied to the luma prediction value
>> + *		    for list 1
>> + * @delta_chroma_weight_l1: the difference of the weighting factor applied
>> + *			    to the chroma prediction values for list 1
>> + * @chroma_offset_l1: the difference of the additive offset applied to
>> + *		      the chroma prediction values for list 1
>> + * @luma_log2_weight_denom: the base 2 logarithm of the denominator for
>> + *			    all luma weighting factors
>> + * @delta_chroma_log2_weight_denom: the difference of the base 2 logarithm
>> + *				    of the denominator for all chroma
>> + *				    weighting factors
>> + */
>>   struct v4l2_hevc_pred_weight_table {
>>   	__s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> @@ -184,6 +311,50 @@ struct v4l2_hevc_pred_weight_table {
>>   #define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1ULL << 8)
>>   #define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)
>>   
>> +/**
>> + * v4l2_ctrl_hevc_slice_params - HEVC slice parameters
>> + *
>> + * @bit_size: size (in bits) of the current slice data
>> + * @data_bit_offset: offset (in bits) to the video data in the current slice data
>> + * @nal_unit_type: specifies the coding type of the slice (B, P or I)
>> + * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the NAL unit
>> + * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
>> + * @colour_plane_id: specifies the colour plane associated with the current slice
>> + * @slice_pic_order_cnt: specifies the picture order count
>> + * @num_ref_idx_l0_active_minus1: specifies the maximum reference index for
>> + *				  reference picture list 0 that may be used to decode
>> + *				  the slice
>> + * @num_ref_idx_l1_active_minus1: specifies the maximum reference index for
>> + *				  reference picture list 1 that may be used to decode
>> + *				  the slice
>> + * @collocated_ref_idx: specifies the reference index of the collocated picture used
>> + *			for temporal motion vector prediction
>> + * @five_minus_max_num_merge_cand: specifies the maximum number of merging
>> + *				   motion vector prediction candidates supported in
>> + *				   the slice subtracted from 5
>> + * @slice_qp_delta: specifies the initial value of QpY to be used for the coding
>> + *		    blocks in the slice
>> + * @slice_cb_qp_offset: specifies a difference to be added to the value of pps_cb_qp_offset
>> + * @slice_cr_qp_offset: specifies a difference to be added to the value of pps_cr_qp_offset
>> + * @slice_act_y_qp_offset: screen content extension parameters
>> + * @slice_act_cb_qp_offset: screen content extension parameters
>> + * @slice_act_cr_qp_offset: screen content extension parameters
>> + * @slice_beta_offset_div2: specify the deblocking parameter offsets for beta divided by 2
>> + * @slice_tc_offset_div2: specify the deblocking parameter offsets for tC divided by 2
>> + * @pic_struct: indicates whether a picture should be displayed as a frame or as one or
>> + *		more fields
>> + * @slice_segment_addr: specifies the address of the first coding tree block in
>> + *			the slice segment
>> + * @ref_idx_l0: the list of L0 reference elements as indices in the DPB
>> + * @ref_idx_l1: the list of L1 reference elements as indices in the DPB
>> + * @short_term_ref_pic_set_size: specifies the size of short-term reference
>> + *				 pictures included in the SPS
>> + * @long_term_ref_pic_set_size: specifies the size of long-term reference
>> + *				picture include in the SPS
>> + * @pred_weight_table: the prediction weight coefficients for inter-picture
>> + *		       prediction
>> + * @flags: see V4L2_HEVC_SLICE_PARAMS_FLAG_{}
>> + */
>>   struct v4l2_ctrl_hevc_slice_params {
>>   	__u32	bit_size;
>>   	__u32	data_bit_offset;
>> @@ -230,6 +401,28 @@ struct v4l2_ctrl_hevc_slice_params {
>>   #define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
>>   #define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
>>   
>> +/**
>> + * struct v4l2_ctrl_hevc_decode_params - HEVC decode parameters
>> + *
>> + * @pic_order_cnt_val: picture order count
>> + * @short_term_ref_pic_set_size: specifies the size of short-term reference
>> + *				 pictures set included in the SPS of the first slice
>> + * @long_term_ref_pic_set_size: specifies the size of long-term reference
>> + *				pictures set include in the SPS of the first slice
>> + * @num_active_dpb_entries: the number of entries in dpb
>> + * @dpb: the decoded picture buffer, for meta-data about reference frames
>> + * @num_poc_st_curr_before: the number of reference pictures in the short-term
>> + *			    set that come before the current frame
>> + * @num_poc_st_curr_after: the number of reference pictures in the short-term
>> + *			   set that come after the current frame
>> + * @num_poc_lt_curr: the number of reference pictures in the long-term set
>> + * @poc_st_curr_before: provides the index of the short term before references
>> + *			in DPB array
>> + * @poc_st_curr_after: provides the index of the short term after references
>> + *		       in DPB array
>> + * @poc_lt_curr: provides the index of the long term references in DPB array
>> + * @flags: see V4L2_HEVC_DECODE_PARAM_FLAG_{}
>> + */
>>   struct v4l2_ctrl_hevc_decode_params {
>>   	__s32	pic_order_cnt_val;
>>   	__u16	short_term_ref_pic_set_size;
>> @@ -245,6 +438,28 @@ struct v4l2_ctrl_hevc_decode_params {
>>   	__u64	flags;
>>   };
>>   
>> +/**
>> + * struct v4l2_ctrl_hevc_scaling_matrix - HEVC scaling lists parameters
>> + *
>> + * @scaling_list_4x4: scaling list is used for the scaling process for
>> + *		      transform coefficients. The values on each scaling
>> + *		      list are expected in raster scan order
>> + * @scaling_list_8x8: scaling list is used for the scaling process for
>> + *		      transform coefficients. The values on each scaling
>> + *		      list are expected in raster scan order
>> + * @scaling_list_16x16: scaling list is used for the scaling process for
>> + *			transform coefficients. The values on each scaling
>> + *			list are expected in raster scan order
>> + * @scaling_list_32x32:	scaling list is used for the scaling process for
>> + *			transform coefficients. The values on each scaling
>> + *			list are expected in raster scan order
>> + * @scaling_list_dc_coef_16x16: scaling list is used for the scaling process
>> + *				for transform coefficients. The values on each
>> + *				scaling list are expected in raster scan order.
>> + * @scaling_list_dc_coef_32x32:	scaling list is used for the scaling process
>> + *				for transform coefficients. The values on each
>> + *				scaling list are expected in raster scan order.
>> + */
>>   struct v4l2_ctrl_hevc_scaling_matrix {
>>   	__u8	scaling_list_4x4[6][16];
>>   	__u8	scaling_list_8x8[6][64];
> Regards,
>
> 	Hans

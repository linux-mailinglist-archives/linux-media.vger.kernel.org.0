Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC1F54B479
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 17:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356373AbiFNPUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 11:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiFNPUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 11:20:03 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F1031358;
        Tue, 14 Jun 2022 08:20:01 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46] (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7D48C66016B6;
        Tue, 14 Jun 2022 16:19:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655220000;
        bh=FLW3rBQJG448Plypio646nbZo8pZ8RL4jC5iqbrceSg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ic9Lhc6v6UArFD38yUoCYxHOWaTtaRst0ve5YFMs8Q6Cqv4O3D0bVyk39wyHixrCS
         8Xd6ocDOIS1jTgP0blCdQ04gxqJyZBhZya/zGFp/EDyp5Ww3xVUv53TZh3LXt15zJh
         qcfS23F9HLg5DxGcsL+TMociIwpRp1N2JbSWq3nUa6Ptk/D5Aa4RDteVnON8g0HN7w
         4foA79x4hWviqS2oDmt14QTuiOi+IQS0qCR/MASBw6RE9lD7nPSaGoUqFq7gJj1qz5
         rZ4PS8nnV47Er/s+GlZ/IX6V2wau+vi1TRp7l6lYzIW9DYbFuzMKgNgAxjcdLlOYJF
         ocJT26ujbd1Vg==
Message-ID: <b1618d76-4548-0bd2-0140-eddc0afde2d3@collabora.com>
Date:   Tue, 14 Jun 2022 17:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 15/17] media: uapi: HEVC: fix padding in v4l2 control
 structures
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
 <20220614083614.240641-16-benjamin.gaignard@collabora.com>
 <0c656c92-f029-bc02-6026-23649836d080@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0c656c92-f029-bc02-6026-23649836d080@xs4all.nl>
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


Le 14/06/2022 à 16:09, Hans Verkuil a écrit :
> On 6/14/22 10:36, Benjamin Gaignard wrote:
>> Fix padding where needed to remove holes and stay align on cache boundaries
> align -> aligned
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../media/v4l/ext-ctrls-codec.rst             |  6 +++---
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     |  9 ---------
>>   include/media/hevc-ctrls.h                    | 19 ++++++++++++-------
>>   3 files changed, 15 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 05228e280f66..48a8825a001b 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3509,9 +3509,6 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>       * - __u8
>>         - ``num_active_dpb_entries``
>>         - The number of entries in ``dpb``.
>> -    * - struct :c:type:`v4l2_hevc_dpb_entry`
>> -      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> -      - The decoded picture buffer, for meta-data about reference frames.
>>       * - __u8
>>         - ``num_poc_st_curr_before``
>>         - The number of reference pictures in the short-term set that come before
>> @@ -3535,6 +3532,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>         - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>         - PocLtCurr as described in section 8.3.2 "Decoding process for reference
>>           picture set": provides the index of the long term references in DPB array.
>> +    * - struct :c:type:`v4l2_hevc_dpb_entry`
>> +      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>> +      - The decoded picture buffer, for meta-data about reference frames.
>>       * - __u64
>>         - ``flags``
>>         - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index c5c5407584ff..fb68786c498b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -824,20 +824,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		if (p_hevc_decode_params->num_active_dpb_entries >
>>   		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
>>   			return -EINVAL;
>> -
>> -		for (i = 0; i < p_hevc_decode_params->num_active_dpb_entries;
>> -		     i++) {
>> -			struct v4l2_hevc_dpb_entry *dpb_entry =
>> -				&p_hevc_decode_params->dpb[i];
>> -
>> -			zero_padding(*dpb_entry);
>> -		}
>>   		break;
>>   
>>   	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
>>   		p_hevc_slice_params = p;
>>   
>> -		zero_padding(p_hevc_slice_params->pred_weight_table);
>>   		zero_padding(*p_hevc_slice_params);
>>   		break;
>>   
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index efc0412ac41e..9abca1a75bd4 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -133,7 +133,9 @@ struct v4l2_ctrl_hevc_sps {
>>   	__u8	chroma_format_idc;
>>   	__u8	sps_max_sub_layers_minus1;
>>   
>> +	__u8	reserved[6];
>>   	__u64	flags;
>> +	__u8	padding[24];
> Why are there 24 padding bytes at the end? For future use? If so, what is
> the rationale for '24'? Is it likely that new fields will be added in future
> HEVC revisions? Or is it in case we forget something?
>
> It's missing kerneldoc comments as well: it should state that the application
> must zero this.
>
> Why mix 'reserved' with 'padding'? It's odd to see both names in a single
> struct.
>
> In any case, this patch goes beyond 'fixing padding', it is doing more.
>
> If you really want to add space for future use at the end of structs,
> then do that in a separate patch together with a rationale for it.

I have used reserved fields in the middle of the structure to align the other
fields like show by pahole.
padding fields are there to be aligned on cache boundaries at the end of the
structures.
I don't plan to use in near future but trying to be future proof (maybe over
doing here...)

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>>   };
>>   
>>   #define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED	(1ULL << 0)
>> @@ -210,9 +212,10 @@ struct v4l2_ctrl_hevc_pps {
>>   	__s8	pps_beta_offset_div2;
>>   	__s8	pps_tc_offset_div2;
>>   	__u8	log2_parallel_merge_level_minus2;
>> +	__u8	reserved[9];
>>   
>> -	__u8	padding[4];
>>   	__u64	flags;
>> +	__u8	padding[56];
>>   };
>>   
>>   #define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>> @@ -245,8 +248,8 @@ struct v4l2_hevc_dpb_entry {
>>   	__u64	timestamp;
>>   	__u8	flags;
>>   	__u8	field_pic;
>> +	__u16	reserved;
>>   	__s32	pic_order_cnt_val;
>> -	__u8	padding[2];
>>   };
>>   
>>   /**
>> @@ -285,8 +288,6 @@ struct v4l2_hevc_pred_weight_table {
>>   	__s8	delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
>>   	__s8	chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
>>   
>> -	__u8	padding[6];
>> -
>>   	__u8	luma_log2_weight_denom;
>>   	__s8	delta_chroma_log2_weight_denom;
>>   };
>> @@ -381,18 +382,20 @@ struct v4l2_ctrl_hevc_slice_params {
>>   	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI message */
>>   	__u8	pic_struct;
>>   
>> +	__u8	reserved0[3];
>>   	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
>>   	__u32	slice_segment_addr;
>>   	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u16	short_term_ref_pic_set_size;
>>   	__u16	long_term_ref_pic_set_size;
>> -	__u8	padding;
>>   
>>   	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
>>   	struct v4l2_hevc_pred_weight_table pred_weight_table;
>>   
>> +	__u8	reserved1[2];
>>   	__u64	flags;
>> +	__u8	padding[40];
>>   };
>>   
>>   #define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
>> @@ -408,7 +411,6 @@ struct v4l2_ctrl_hevc_slice_params {
>>    * @long_term_ref_pic_set_size: specifies the size of long-term reference
>>    *				pictures set include in the SPS of the first slice
>>    * @num_active_dpb_entries: the number of entries in dpb
>> - * @dpb: the decoded picture buffer, for meta-data about reference frames
>>    * @num_poc_st_curr_before: the number of reference pictures in the short-term
>>    *			    set that come before the current frame
>>    * @num_poc_st_curr_after: the number of reference pictures in the short-term
>> @@ -419,6 +421,7 @@ struct v4l2_ctrl_hevc_slice_params {
>>    * @poc_st_curr_after: provides the index of the short term after references
>>    *		       in DPB array
>>    * @poc_lt_curr: provides the index of the long term references in DPB array
>> + * @dpb: the decoded picture buffer, for meta-data about reference frames
>>    * @flags: see V4L2_HEVC_DECODE_PARAM_FLAG_{}
>>    */
>>   struct v4l2_ctrl_hevc_decode_params {
>> @@ -426,14 +429,16 @@ struct v4l2_ctrl_hevc_decode_params {
>>   	__u16	short_term_ref_pic_set_size;
>>   	__u16	long_term_ref_pic_set_size;
>>   	__u8	num_active_dpb_entries;
>> -	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u8	num_poc_st_curr_before;
>>   	__u8	num_poc_st_curr_after;
>>   	__u8	num_poc_lt_curr;
>>   	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> +	__u8	reserved[4];
>> +	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>   	__u64	flags;
>> +	__u8	padding[56];
>>   };
>>   
>>   /**

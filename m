Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B514C3F9686
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 10:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244666AbhH0I4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 04:56:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52336 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244604AbhH0I4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 04:56:44 -0400
Received: from [IPv6:2a01:e0a:4cb:a870:de4d:a9ab:fdfa:6660] (unknown [IPv6:2a01:e0a:4cb:a870:de4d:a9ab:fdfa:6660])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 629061F44856;
        Fri, 27 Aug 2021 09:55:54 +0100 (BST)
Subject: Re: [PATCH] media: hevc: fix pictures lists type
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        John Cox <jc@kynesim.co.uk>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
 <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
 <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
 <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com>
 <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <da18a240-22bd-54d2-6306-f39f10a05b22@collabora.com>
Date:   Fri, 27 Aug 2021 10:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 26/08/2021 à 18:09, Nicolas Dufresne a écrit :
> Le lundi 23 août 2021 à 12:35 +0100, John Cox a écrit :
>> Hi
>>
>>> Le 23/08/2021 à 11:50, John Cox a écrit :
>>>>> The lists embedded Picture Order Count values which are s32 so their type
>>>>> most be s32 and not u8.
>>>> I'm not convinced that you can't calculate all of those lists from the
>>>> info already contained in the DPB array so this is probably redundant
>>>> info though I grant that having the list pre-calced might make your life
>>>> easier, and the userland side will have calculated the lists to
>>>> calculate other required things so it isn't much extra work for it.
>>> Yes the userland have already compute these lists and the number of items
>>> in each of them.
>>> Build them in the kernel would means to also compute the values of NumPocStCurrBefore,
>>> NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBefore and NumPocLtCurr
>>> and that requires information (NumNegativePics, NumPositivePics...) not provided to the kernel.
>>> Since it have to be done in userland anyway, I'm reluctant to modify the API to redo in the kernel.
>> Well, fair enough, I'm not going to argue
>>
>>>> Even if you do need the lists wouldn't it be a better idea to have them
>>>> as indices into the DPB (you can't have a frame in any of those lists
>>>> that isn't in the DPB) which already contains POCs then it will still
>>>> fit into u8 and be smaller?
>>> Hantro HW works with indexes but I think it is more simple to send PoC rather than indexes.
>> I'd disagree but as I don't use the info I'm not concerned. Though I
>> think I should point out that when Hantro converts the POCs to indicies
>> it compares the now s32 POC in these lists with the u16 POC in the DPB
>> so you might need to fix that too; by std (8.3.1) no POC diff can be
>> outside s16 so you can mask & compare or use u16 POCs in the lists or
>> s32 in the DPB.
> Fun fact, my interpretation with the API when I drafted GStreamer support was
> that it was DPB indexes:
>
> https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/hevc_wip/sys/v4l2codecs/gstv4l2codech265dec.c#L850
>
> It felt quite natural to be, since this is also how we pass references for l0/l1
> (unused by hantro I guess).
>
> Looking at old rkvdec code as a refresher:
>
>    for (j = 0; j < run->num_slices; j++) {
>                  sl_params = &run->slices_params[j];
>                  dpb = sl_params->dpb;
>
>                  hw_ps = &priv_tbl->rps[j];
>                  memset(hw_ps, 0, sizeof(*hw_ps));
>
>                  for (i = 0; i <= sl_params->num_ref_idx_l0_active_minus1; i++) {
>                          WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>                                    REF_PIC_LONG_TERM_L0(i));
>                          WRITE_RPS(sl_params->ref_idx_l0[i], REF_PIC_IDX_L0(i));
>                  }
>
>                  for (i = 0; i <= sl_params->num_ref_idx_l1_active_minus1; i++) {
>                          WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[i]].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>                                    REF_PIC_LONG_TERM_L1(i));
>                          WRITE_RPS(sl_params->ref_idx_l1[i], REF_PIC_IDX_L1(i));
>                  }
>
>
> This is code is clearly unsafe, but now I remember that dpb_entry has a flag
> "rps". So we know from the DPB in which of the list the reference lives, if any.
> In the case of RKVDEC the HW only cares to know if this is long term or not.
>
> So without looking at the spec, is that dpb represention enough to reconstruct
> these array ? If we pass these array, shall we keep the rps flag ? I think a
> little step back and cleanup will be needed. I doubt there is a single answer,
> perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we can
> collectively decide were we want V4L2 to sit ?

I have done some tests with Hantro driver and look at the spec, the order of the PoC
in the reference lists matters. You can deducted the order for DPB rps flags.
I would suggest to remove rps flags to avoid information duplication.

Benjamin

>
>> Regards
>>
>> John Cox
>>
>>> Benjamin
>>>
>>>> Full disclosure: Pi decode doesn't use this info at all so I'm only
>>>> arguing from a theoretical point of view - I think it is only relevant
>>>> if your h/w is parsing the reference list setups.
>>>>
>>>> Regards
>>>>
>>>> John Cox
>>>>
>>>>> Reported-by: John Cox <jc@kynesim.co.uk>
>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>> ---
>>>>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
>>>>> include/media/hevc-ctrls.h                                | 6 +++---
>>>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> index 976d34445a24..db9859ddc8b2 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>> @@ -3323,15 +3323,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>>>>       * - __u8
>>>>>         - ``num_poc_lt_curr``
>>>>>         - The number of reference pictures in the long-term set.
>>>>> -    * - __u8
>>>>> +    * - __s32
>>>>>         - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>         - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
>>>>>           picture set.
>>>>> -    * - __u8
>>>>> +    * - __s32
>>>>>         - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>         - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
>>>>>           picture set.
>>>>> -    * - __u8
>>>>> +    * - __s32
>>>>>         - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>         - PocLtCurr as described in section 8.3.2 "Decoding process for reference
>>>>>           picture set.
>>>>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>>>> index 781371bff2ad..04cd62e77f25 100644
>>>>> --- a/include/media/hevc-ctrls.h
>>>>> +++ b/include/media/hevc-ctrls.h
>>>>> @@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
>>>>> 	__u8	num_poc_st_curr_before;
>>>>> 	__u8	num_poc_st_curr_after;
>>>>> 	__u8	num_poc_lt_curr;
>>>>> -	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> -	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> -	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> +	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> +	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> +	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>> 	__u64	flags;
>>>>> };
>>>>>
>

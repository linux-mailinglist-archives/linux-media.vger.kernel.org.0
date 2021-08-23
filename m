Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1F3F498B
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 13:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbhHWLSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 07:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236457AbhHWLSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 07:18:38 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F197C061575;
        Mon, 23 Aug 2021 04:17:56 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:648a:6e9d:d5af:13ed] (unknown [IPv6:2a01:e0a:4cb:a870:648a:6e9d:d5af:13ed])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86CB01F424E9;
        Mon, 23 Aug 2021 12:17:47 +0100 (BST)
Subject: Re: [PATCH] media: hevc: fix pictures lists type
To:     John Cox <jc@kynesim.co.uk>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
 <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
Date:   Mon, 23 Aug 2021 13:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 23/08/2021 à 11:50, John Cox a écrit :
>> The lists embedded Picture Order Count values which are s32 so their type
>> most be s32 and not u8.
> I'm not convinced that you can't calculate all of those lists from the
> info already contained in the DPB array so this is probably redundant
> info though I grant that having the list pre-calced might make your life
> easier, and the userland side will have calculated the lists to
> calculate other required things so it isn't much extra work for it.

Yes the userland have already compute these lists and the number of items
in each of them.
Build them in the kernel would means to also compute the values of NumPocStCurrBefore,
NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBefore and NumPocLtCurr
and that requires information (NumNegativePics, NumPositivePics...) not provided to the kernel.
Since it have to be done in userland anyway, I'm reluctant to modify the API to redo in the kernel.

>
> Even if you do need the lists wouldn't it be a better idea to have them
> as indices into the DPB (you can't have a frame in any of those lists
> that isn't in the DPB) which already contains POCs then it will still
> fit into u8 and be smaller?

Hantro HW works with indexes but I think it is more simple to send PoC rather than indexes.

Benjamin

>
> Full disclosure: Pi decode doesn't use this info at all so I'm only
> arguing from a theoretical point of view - I think it is only relevant
> if your h/w is parsing the reference list setups.
>
> Regards
>
> John Cox
>
>> Reported-by: John Cox <jc@kynesim.co.uk>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
>> include/media/hevc-ctrls.h                                | 6 +++---
>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index 976d34445a24..db9859ddc8b2 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -3323,15 +3323,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>>      * - __u8
>>        - ``num_poc_lt_curr``
>>        - The number of reference pictures in the long-term set.
>> -    * - __u8
>> +    * - __s32
>>        - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>        - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
>>          picture set.
>> -    * - __u8
>> +    * - __s32
>>        - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>        - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
>>          picture set.
>> -    * - __u8
>> +    * - __s32
>>        - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>        - PocLtCurr as described in section 8.3.2 "Decoding process for reference
>>          picture set.
>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>> index 781371bff2ad..04cd62e77f25 100644
>> --- a/include/media/hevc-ctrls.h
>> +++ b/include/media/hevc-ctrls.h
>> @@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
>> 	__u8	num_poc_st_curr_before;
>> 	__u8	num_poc_st_curr_after;
>> 	__u8	num_poc_lt_curr;
>> -	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> -	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> -	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> +	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> +	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> +	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>> 	__u64	flags;
>> };
>>

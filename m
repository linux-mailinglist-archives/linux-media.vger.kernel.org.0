Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F643F49E7
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhHWLgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 07:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbhHWLgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 07:36:13 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D452C061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 04:35:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso13844133wmj.0
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 04:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=Dc7A45rdd8EAHtZ/uscRkJGY6bCmxk+2XNFv95tjVRM=;
        b=TUwniGW/Xte7lz7XZgquinAMkpiywSnUrpHTnHQcMRkbFVLMbfiNjuA000k7DB4w2f
         935M0pJyJM6/cRl7wixLeLt5n3Xsm5TaN6hmZaCh0Z4UFQFwENTOqvvNIid+vKXLH3/O
         WQ67Qb7k/lAGPxSdIzWvueVQhEYAHDeDT+vMWg6MFHC+B3eYiBGX2QDrVrLDfFmhdBT7
         LTIz0WswO+Gs6XBAwsAILr33fYvR3T8aV1AXhpBkHt5N/0Iokv7KxHjkjDVSDZLlSDxi
         +Y01uz47CLRazaAOO4O2KRKTj20VenmiLHmHt6lIWI+7JC0RmVT4G5aQ3xes9o+GNMu5
         4i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=Dc7A45rdd8EAHtZ/uscRkJGY6bCmxk+2XNFv95tjVRM=;
        b=DkfmW0QjhZOSNDqpefKGfCBife+zwv2Kst0+I9SQji/mpB0BUZWiBHqxvF6ZZNv42q
         J37rwfJKHZtVoniEa1N/Q2T2Alr+jzmaSJL+Q+jszlh/pkUsEZ80bLVqtFbp8N58z05s
         wb40Smsiuw8o+i+6IP6o6VKAxW7S1ZvQ6q9LTGTdo9nHSVA1W9CcFg2g0aKtATUu0N/R
         01btm0hsU4NhKkC45pR2K8o6zG7sPPY6W0O9ka+SidJz2GjQLXc3ITZj3Nm+XO5Gpgcy
         H4a8+DDYS9cFIAouOv/g33jCK994GbqlsM/98y6+4V4w3ojxGzf1lNSxz+otANYCzlol
         I85w==
X-Gm-Message-State: AOAM532Bh1rHx4Tj1njGYQub5wsbEd1MZ/RzqpRyfZRD6rKbRj4Qx8Aw
        Q+xDtQ/oZnEp/IN/a1X+ozyQBg==
X-Google-Smtp-Source: ABdhPJxfbLN6S/zmNSodR02DWJULMgKN7V3T4Tq9vwgy9MuQxoZBNiJPauxGJyVegRCVnPY+zfFuNg==
X-Received: by 2002:a05:600c:21d7:: with SMTP id x23mr15794742wmj.10.1629718529082;
        Mon, 23 Aug 2021 04:35:29 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id h16sm14978446wre.52.2021.08.23.04.35.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 23 Aug 2021 04:35:28 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] media: hevc: fix pictures lists type
Date:   Mon, 23 Aug 2021 12:35:28 +0100
Message-ID: <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com>
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com> <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com> <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
In-Reply-To: <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

>Le 23/08/2021 =C3=A0 11:50, John Cox a =C3=A9crit=C2=A0:
>>> The lists embedded Picture Order Count values which are s32 so their =
type
>>> most be s32 and not u8.
>> I'm not convinced that you can't calculate all of those lists from the
>> info already contained in the DPB array so this is probably redundant
>> info though I grant that having the list pre-calced might make your =
life
>> easier, and the userland side will have calculated the lists to
>> calculate other required things so it isn't much extra work for it.
>
>Yes the userland have already compute these lists and the number of =
items
>in each of them.
>Build them in the kernel would means to also compute the values of =
NumPocStCurrBefore,
>NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, NumPocStCurrBefore =
and NumPocLtCurr
>and that requires information (NumNegativePics, NumPositivePics...) not =
provided to the kernel.
>Since it have to be done in userland anyway, I'm reluctant to modify the=
 API to redo in the kernel.

Well, fair enough, I'm not going to argue

>> Even if you do need the lists wouldn't it be a better idea to have =
them
>> as indices into the DPB (you can't have a frame in any of those lists
>> that isn't in the DPB) which already contains POCs then it will still
>> fit into u8 and be smaller?
>
>Hantro HW works with indexes but I think it is more simple to send PoC =
rather than indexes.

I'd disagree but as I don't use the info I'm not concerned. Though I
think I should point out that when Hantro converts the POCs to indicies
it compares the now s32 POC in these lists with the u16 POC in the DPB
so you might need to fix that too; by std (8.3.1) no POC diff can be
outside s16 so you can mask & compare or use u16 POCs in the lists or
s32 in the DPB.

Regards

John Cox

>Benjamin
>
>>
>> Full disclosure: Pi decode doesn't use this info at all so I'm only
>> arguing from a theoretical point of view - I think it is only relevant
>> if your h/w is parsing the reference list setups.
>>
>> Regards
>>
>> John Cox
>>
>>> Reported-by: John Cox <jc@kynesim.co.uk>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
>>> include/media/hevc-ctrls.h                                | 6 +++---
>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git =
a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index 976d34445a24..db9859ddc8b2 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -3323,15 +3323,15 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>>>      * - __u8
>>>        - ``num_poc_lt_curr``
>>>        - The number of reference pictures in the long-term set.
>>> -    * - __u8
>>> +    * - __s32
>>>        - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>        - PocStCurrBefore as described in section 8.3.2 "Decoding =
process for reference
>>>          picture set.
>>> -    * - __u8
>>> +    * - __s32
>>>        - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>        - PocStCurrAfter as described in section 8.3.2 "Decoding =
process for reference
>>>          picture set.
>>> -    * - __u8
>>> +    * - __s32
>>>        - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>        - PocLtCurr as described in section 8.3.2 "Decoding process =
for reference
>>>          picture set.
>>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>> index 781371bff2ad..04cd62e77f25 100644
>>> --- a/include/media/hevc-ctrls.h
>>> +++ b/include/media/hevc-ctrls.h
>>> @@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
>>> 	__u8	num_poc_st_curr_before;
>>> 	__u8	num_poc_st_curr_after;
>>> 	__u8	num_poc_lt_curr;
>>> -	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> -	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> -	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> +	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> +	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> +	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>> 	__u64	flags;
>>> };
>>>

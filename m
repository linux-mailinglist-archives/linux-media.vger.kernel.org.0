Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF83F9910
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 14:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245101AbhH0MhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 08:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0MhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 08:37:20 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0333DC061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:36:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g18so2650786wrc.11
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=MBXqSB2KaNOZBru1wGtrwsx642pM/eG1P1XjDxQN0eQ=;
        b=u3JGPnVJS5F6liqEnZ4NRSv0oUoCnju0hrHkgqWXBRwcyIz0bPmO/keAQZqU9QQfuQ
         YcVpBMz1rJSnUSZK6IqTTfptK9Io/oljIk8PO9i2PHwIHpiJmz210MQTnqUTWUIyPI2v
         j+cfi+k4pxZeKLOrqaO9RAGHyS6FXb5HCb+clXaCK5x6mxiLClnqQTGLhepb5zcdOqoj
         7V2m/W/Rr25FV8zLYtOUUuSGmQ+NUCeQRGP7d2Jl6BYclriJtjN1RCbn85CwrO1hjAT5
         SIaj7PBpYh5SZlXfBpAB/Mz1pb0k4FrgV2/mVDRj5S+NxsTGoq4Rb46opNuY9RFN/0Hf
         +K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=MBXqSB2KaNOZBru1wGtrwsx642pM/eG1P1XjDxQN0eQ=;
        b=avho/BY5fV9Iqym++riaQn2ulbiDXZtpUfmYdhyQvkq+dUYFBnjZUOHK8yuPAH8H0g
         Iqw1edjREHj/d2bLtSJXXXCwpJgEiyEYbKzpUpfLPby9b2ClWW9f3Epl9L7b1RuU3hyD
         yML8nI+1F4UKauWMGOdvuK2gIp4uJ7Yl5/qC+h+Uas3wVqf3ouf6hFseiKOaIUR2db4/
         7/APklsY1RK3gcrhijOCTqnyjF1o0kvsm2GAbh/8Y3ap5TU9Qf9bozCySK+QbHhSwL6N
         CSJB2twzUqtQjTowNMLFtOr0hLaS2fKM17iNL1QxkwAgowyKakAV+E/RCLT0JJXVGpaT
         7EIw==
X-Gm-Message-State: AOAM531BojV3Q1+rYLSGAKIRwprzgo2X4bpdrf0evSurnu4kH+0QSlgM
        VLBlfIsciuB/rdpA04x8hxicxA==
X-Google-Smtp-Source: ABdhPJwybgWzCXJSR/B59bf816Dk2FVYXwhP1L9OyHZ987/e1/b66yHqa3+2Q0rCs1PntyThAGxrGw==
X-Received: by 2002:adf:c381:: with SMTP id p1mr10030062wrf.163.1630067789514;
        Fri, 27 Aug 2021 05:36:29 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id r12sm6518790wrv.96.2021.08.27.05.36.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 27 Aug 2021 05:36:28 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] media: hevc: fix pictures lists type
Date:   Fri, 27 Aug 2021 13:36:29 +0100
Message-ID: <mdmhigh3ubgs6r89061v19iagjs0il9b89@4ax.com>
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com> <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com> <e1df8e77-b4d1-481c-0f4b-4a20f42d5c9e@collabora.com> <i917ig582epdnpkmjdtvtnap6u8c032c1r@4ax.com> <9d6336fff6f122a9a4510a111387a000c65f797b.camel@ndufresne.ca> <da18a240-22bd-54d2-6306-f39f10a05b22@collabora.com> <r4ehigheq602qijsnjd8govhl4f1dpnr35@4ax.com> <b5ae0ebe-de90-5ebb-5e69-ea66ae0e0639@collabora.com>
In-Reply-To: <b5ae0ebe-de90-5ebb-5e69-ea66ae0e0639@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Le 27/08/2021 =C3=A0 12:10, John Cox a =C3=A9crit=C2=A0:
>>> Le 26/08/2021 =C3=A0 18:09, Nicolas Dufresne a =C3=A9crit=C2=A0:
>>>> Le lundi 23 ao=C3=BBt 2021 =C3=A0 12:35 +0100, John Cox a =
=C3=A9crit=C2=A0:
>>>>> Hi
>>>>>
>>>>>> Le 23/08/2021 =C3=A0 11:50, John Cox a =C3=A9crit=C2=A0:
>>>>>>>> The lists embedded Picture Order Count values which are s32 so =
their type
>>>>>>>> most be s32 and not u8.
>>>>>>> I'm not convinced that you can't calculate all of those lists =
from the
>>>>>>> info already contained in the DPB array so this is probably =
redundant
>>>>>>> info though I grant that having the list pre-calced might make =
your life
>>>>>>> easier, and the userland side will have calculated the lists to
>>>>>>> calculate other required things so it isn't much extra work for =
it.
>>>>>> Yes the userland have already compute these lists and the number =
of items
>>>>>> in each of them.
>>>>>> Build them in the kernel would means to also compute the values of=
 NumPocStCurrBefore,
>>>>>> NumPocStCurrAfter, NumPocLtCurr, NumPocStCurrAfter, =
NumPocStCurrBefore and NumPocLtCurr
>>>>>> and that requires information (NumNegativePics, =
NumPositivePics...) not provided to the kernel.
>>>>>> Since it have to be done in userland anyway, I'm reluctant to =
modify the API to redo in the kernel.
>>>>> Well, fair enough, I'm not going to argue
>>>>>
>>>>>>> Even if you do need the lists wouldn't it be a better idea to =
have them
>>>>>>> as indices into the DPB (you can't have a frame in any of those =
lists
>>>>>>> that isn't in the DPB) which already contains POCs then it will =
still
>>>>>>> fit into u8 and be smaller?
>>>>>> Hantro HW works with indexes but I think it is more simple to send=
 PoC rather than indexes.
>>>>> I'd disagree but as I don't use the info I'm not concerned. Though =
I
>>>>> think I should point out that when Hantro converts the POCs to =
indicies
>>>>> it compares the now s32 POC in these lists with the u16 POC in the =
DPB
>>>>> so you might need to fix that too; by std (8.3.1) no POC diff can =
be
>>>>> outside s16 so you can mask & compare or use u16 POCs in the lists =
or
>>>>> s32 in the DPB.
>>>> Fun fact, my interpretation with the API when I drafted GStreamer =
support was
>>>> that it was DPB indexes:
>>>>
>>>> =
https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/hevc_wip/=
sys/v4l2codecs/gstv4l2codech265dec.c#L850
>>>>
>>>> It felt quite natural to be, since this is also how we pass =
references for l0/l1
>>>> (unused by hantro I guess).
>>>>
>>>> Looking at old rkvdec code as a refresher:
>>>>
>>>>     for (j =3D 0; j < run->num_slices; j++) {
>>>>                   sl_params =3D &run->slices_params[j];
>>>>                   dpb =3D sl_params->dpb;
>>>>
>>>>                   hw_ps =3D &priv_tbl->rps[j];
>>>>                   memset(hw_ps, 0, sizeof(*hw_ps));
>>>>
>>>>                   for (i =3D 0; i <=3D =
sl_params->num_ref_idx_l0_active_minus1; i++) {
>>>>                           =
WRITE_RPS(!!(dpb[sl_params->ref_idx_l0[i]].rps =3D=3D =
V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>>>>                                     REF_PIC_LONG_TERM_L0(i));
>>>>                           WRITE_RPS(sl_params->ref_idx_l0[i], =
REF_PIC_IDX_L0(i));
>>>>                   }
>>>>
>>>>                   for (i =3D 0; i <=3D =
sl_params->num_ref_idx_l1_active_minus1; i++) {
>>>>                           =
WRITE_RPS(!!(dpb[sl_params->ref_idx_l1[i]].rps =3D=3D =
V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR),
>>>>                                     REF_PIC_LONG_TERM_L1(i));
>>>>                           WRITE_RPS(sl_params->ref_idx_l1[i], =
REF_PIC_IDX_L1(i));
>>>>                   }
>>>>
>>>>
>>>> This is code is clearly unsafe, but now I remember that dpb_entry =
has a flag
>>>> "rps". So we know from the DPB in which of the list the reference =
lives, if any.
>>>> In the case of RKVDEC the HW only cares to know if this is long term=
 or not.
>>>>
>>>> So without looking at the spec, is that dpb represention enough to =
reconstruct
>>>> these array ? If we pass these array, shall we keep the rps flag ? I=
 think a
>>>> little step back and cleanup will be needed. I doubt there is a =
single answer,
>>>> perhaps list what others do (VA, DXVA, NVDEC, Khronos, etc) and we =
can
>>>> collectively decide were we want V4L2 to sit ?
>>> I have done some tests with Hantro driver and look at the spec, the =
order of the PoC
>>> in the reference lists matters. You can deducted the order for DPB =
rps flags.
>>> I would suggest to remove rps flags to avoid information duplication.
>> I want the DPB rps member for long term reference marking.  I don't =
care
>> about before / after, but LTR can't be deduced from PoC and if you are
>> going to keep the member you might as well keep before / after.
>
>Ok so keep like it is.
>In this case my patch is enough, right ?

I still think there are better and smaller ways of constructing the
lists Hantro wants (e.g. using an index into the DPB as the L0/L1 lists
do) but this patch is capable of delivering the result you need.

Regards

John Cox

>Benjamin
>
>>
>> John Cox
>>
>>> Benjamin
>>>
>>>>> Regards
>>>>>
>>>>> John Cox
>>>>>
>>>>>> Benjamin
>>>>>>
>>>>>>> Full disclosure: Pi decode doesn't use this info at all so I'm =
only
>>>>>>> arguing from a theoretical point of view - I think it is only =
relevant
>>>>>>> if your h/w is parsing the reference list setups.
>>>>>>>
>>>>>>> Regards
>>>>>>>
>>>>>>> John Cox
>>>>>>>
>>>>>>>> Reported-by: John Cox <jc@kynesim.co.uk>
>>>>>>>> Signed-off-by: Benjamin Gaignard =
<benjamin.gaignard@collabora.com>
>>>>>>>> ---
>>>>>>>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 =
+++---
>>>>>>>> include/media/hevc-ctrls.h                                | 6 =
+++---
>>>>>>>> 2 files changed, 6 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git =
a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> index 976d34445a24..db9859ddc8b2 100644
>>>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>>>>>>> @@ -3323,15 +3323,15 @@ enum =
v4l2_mpeg_video_hevc_size_of_length_field -
>>>>>>>>        * - __u8
>>>>>>>>          - ``num_poc_lt_curr``
>>>>>>>>          - The number of reference pictures in the long-term =
set.
>>>>>>>> -    * - __u8
>>>>>>>> +    * - __s32
>>>>>>>>          - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>>>>          - PocStCurrBefore as described in section 8.3.2 =
"Decoding process for reference
>>>>>>>>            picture set.
>>>>>>>> -    * - __u8
>>>>>>>> +    * - __s32
>>>>>>>>          - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>>>>          - PocStCurrAfter as described in section 8.3.2 =
"Decoding process for reference
>>>>>>>>            picture set.
>>>>>>>> -    * - __u8
>>>>>>>> +    * - __s32
>>>>>>>>          - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>>>>>>>>          - PocLtCurr as described in section 8.3.2 "Decoding =
process for reference
>>>>>>>>            picture set.
>>>>>>>> diff --git a/include/media/hevc-ctrls.h =
b/include/media/hevc-ctrls.h
>>>>>>>> index 781371bff2ad..04cd62e77f25 100644
>>>>>>>> --- a/include/media/hevc-ctrls.h
>>>>>>>> +++ b/include/media/hevc-ctrls.h
>>>>>>>> @@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
>>>>>>>> 	__u8	num_poc_st_curr_before;
>>>>>>>> 	__u8	num_poc_st_curr_after;
>>>>>>>> 	__u8	num_poc_lt_curr;
>>>>>>>> -	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> -	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> -	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> +	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> +	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> +	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>>>>>>>> 	__u64	flags;
>>>>>>>> };
>>>>>>>>

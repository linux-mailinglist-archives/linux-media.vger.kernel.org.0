Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B663FC9CF
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 16:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238120AbhHaOe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 10:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbhHaOe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 10:34:27 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DFCC061575
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 07:33:32 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t15so21873036wrg.7
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=smPFOktGxjGC+Ka43r7/WQHSP01FF5/7pAB/RUjJpV4=;
        b=AsLarEwC2DIl28aNaxfHmcVDR7gDLzrwBaNfCtVmbTjYTzeuBYYtVHy299w2bZPviv
         ETmWhowsY0U9rXtNQNPN4MKmznVwFEVDZsyytb1jSoRUrrH5aforeiajolKjky2Nzibr
         7geWsndye6eIADa/BAjii6HRRxaVMhT6flG/c4dNOipJem/jjNwFaZE4Ja4PZi0o+Oyb
         e44rtVA6eMzcSBCXdh8RSrhh02I/fN0M07w7kxnTsAjmewoeBhgkJn2cCS69NLt+Y63H
         qj/51daTnKPEeLbhhy+Rkg0uLCJFpYMPb6EPbDLd+CpVYotV13Pt1jyL2fIjBjZ/63OL
         3WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=smPFOktGxjGC+Ka43r7/WQHSP01FF5/7pAB/RUjJpV4=;
        b=bxi6S2HXhcop0FbQeWFaRk6pzEIaFxWYSA2DZDZtonWcSYJ3McVooB/v8GmQ8C2d3q
         Rmzm0fYmKvfY0zz3phpJ7+or5KOPVLt6+9R29zcQ0R1IOuwlb0lBjF2BHEePL/y+k4GL
         Y+Zrbm853rgtFgUaTm/bzyDmcLipYiOZMlUFAXSbbCbxYt6xgnJAzYmW1tLpMa1f9kg2
         jp3QfVIqbZDFLvQ5bm2NGxcJcqJP2NSmqQrdTP8awOJc1TnlaPbLKOxG3F2cNTMVBYuM
         TP/P/321+DN9jKtBxbCk407mcQZ+fCtJK0CtZQujIzHgtKNMUTKwLXFLLViJhURKa05x
         l20Q==
X-Gm-Message-State: AOAM533nIvQoj8DB+YoSX45t609O/Tpo8gQUxDZlcp+MkLCbmTO4qFTd
        nHGJCifi/iZpM0gJriQrxpv7gg==
X-Google-Smtp-Source: ABdhPJyTTR6zGQEBSRbTCv9IzZ2WJeGXy2X5XoQq/beWXTSp/UY3OL+GBF9XPwA6D7i3seGROy3HXw==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr31334228wrs.175.1630420410752;
        Tue, 31 Aug 2021 07:33:30 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id c9sm16291108wrf.77.2021.08.31.07.33.29
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 31 Aug 2021 07:33:30 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] media: hevc: Remove RPS named flags
Date:   Tue, 31 Aug 2021 15:33:30 +0100
Message-ID: <l0fsigdnavn1n1n33a8a2ftfuj81tgv3if@4ax.com>
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com> <20210831094900.203283-2-benjamin.gaignard@collabora.com> <4g2sigpsttf80t72c7spdqqjvvijnths2d@4ax.com> <fdf6417e-09cd-f0a0-a351-fccd64bfc8c7@collabora.com>
In-Reply-To: <fdf6417e-09cd-f0a0-a351-fccd64bfc8c7@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Le 31/08/2021 =C3=A0 13:08, John Cox a =C3=A9crit=C2=A0:
>>> Marking a picture as long-term reference is valid for DPB but not for=
 RPS.
>>> Change flag name to match with it description in HEVC spec chapiter
>>> "8.3.2 Decoding process for reference picture set".
>>> Remove the other unused RPS flags.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++----
>>> drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
>>> drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
>>> include/media/hevc-ctrls.h                                | 4 +---
>>> 4 files changed, 5 insertions(+), 9 deletions(-)
>>>
>>> diff --git =
a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index 3865acb9e0fd..eff33c511090 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -3138,10 +3138,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field=
 -
>>> 	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
>>>      * - __u8
>>>        - ``rps``
>>> -      - The reference set for the reference frame
>>> -        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
>>> -        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
>>> -        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>>> +      - Long term flag for the reference frame
>>> +        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>>>      * - __u8
>>>        - ``field_pic``
>>>        - Whether the reference is a field picture or a frame.
>> If you are going to remove all the RPS values except for Long Term
>> wouldn't it be better to rename the field too, either to "flags" or a
>> bool "is_long_term"?  If we have a field called RPS it really should =
be
>> able to have a value for any of the 5 valid Reference Picture Sets =
that
>> a DPB entry can belong to.
>
>I will send a v2 and rename rps into flags.

OK. I was going to say that you should merge the "field_pic" entry into
a flags bitfield, but then I remembered that H265 doesn't have the
concept of field_pics in the way that H264 does and I believe that both
it and pic_order_count[1] are redundant (i.e. can never be used). But I
guess that is the subject of yet another patch.

Regards

John Cox

>> As a side note, it is important to my code that the DPB array contains
>> all the DPB entries not just the ones that are in use in this frame.  =
I
>> need them so I can track which frames have left the DPB so I can
>> reuse/free the MV tables associated with them (yes I could keep one =
for
>> every entry in the capture Q but that is generally wasteful on memory
>> and the Pi is often memory constrained). So maybe update the docn on =
DPB
>> to make this explicit please? (I suspect that current code does this
>> anyway as it is generally easier to do than to not.)
>
>That should be in another patch :-)
>
>Benjamin
>
>>
>> John Cox
>>
>>> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c =
b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>>> index 9ea864ca5625..be46b3c28b17 100644
>>> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>>> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>>> @@ -503,7 +503,7 @@ static int set_ref(struct hantro_ctx *ctx)
>>> 		compress_luma_addr =3D luma_addr + compress_luma_offset;
>>> 		compress_chroma_addr =3D luma_addr + compress_chroma_offset;
>>>
>>> -		if (dpb[i].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>>> +		if (dpb[i].rps =3D=3D V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>>> 			dpb_longterm_e |=3D BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>>>
>>> 		/*
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> index ef0311a16d01..6086cc35e8cc 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>>> @@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct=
 cedrus_dev *dev,
>>> 		unsigned int index =3D list[i];
>>> 		u8 value =3D list[i];
>>>
>>> -		if (dpb[index].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>>> +		if (dpb[index].rps =3D=3D V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>>> 			value |=3D VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
>>>
>>> 		/* Each SRAM word gathers up to 4 references. */
>>> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>>> index ef63bc205756..f587448ef495 100644
>>> --- a/include/media/hevc-ctrls.h
>>> +++ b/include/media/hevc-ctrls.h
>>> @@ -127,9 +127,7 @@ struct v4l2_ctrl_hevc_pps {
>>> 	__u64	flags;
>>> };
>>>
>>> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
>>> -#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
>>> -#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
>>> +#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>>>
>>> #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>>>

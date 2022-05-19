Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1FF52D972
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 17:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240167AbiESPyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 11:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240863AbiESPyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 11:54:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86AD8CB3D
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:54:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id g16so6767986lja.3
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hEfXYtwOaM3aKzovqEt8zgRIFofCugn1kYk3pPS6cpA=;
        b=DC69KdsWEW8WfwWQs4eK/d2SHp6ihoozgX7/qTV+ZVxvoevhL1rI1ZcNPJ2d4L+xUZ
         sqo+t1AaxEPZlbCejmWWurp+MQE0MGwa6166colhQXT2oFgl7tn8dWMVtwe6/KPaLNhO
         cOFR53hb0U/pNZzkfsgWK1GSSj330sHW1HEr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hEfXYtwOaM3aKzovqEt8zgRIFofCugn1kYk3pPS6cpA=;
        b=i+2YVpOhKcp1vXtqbiDB7N/I3PuGrmaFGY7aZDPFyTMY02mMZZx2Xi8wad+8easM/H
         wMdsJhj9xofcpm82a1/SGso+5da2z/WtZYwfM1s5AKwTORNabLTZxOjxFwOosfW2N8HO
         8slLDJP2CoLsNx67OxiLwYsZVU1atfUE7ZjwX0buh+64OwD45CMWuVRj8pxq2caJoDd/
         Ky8Ig7kc/PtLSTenNLs3uaqvMJR0zRniIklhI1TPEohtH0HY7iYgBONaQCUJr1CHKEI8
         G2f/mx3ew8ammIKh+Gek8AjiEvYjtQ3BbEUWvlH/+XqkRmFFk1k6nSd2Cg6CeOVcd4WS
         aNzw==
X-Gm-Message-State: AOAM530WK2zvUOZz7iuYoJTijmpv2K/55ICjYnVnmq4qzjgROM1aCNhC
        nBaJYanE0B8Fxhc5ffIsAIGfyPtTrNRLZG+Z8o2Evg==
X-Google-Smtp-Source: ABdhPJw7xJ2Do10QAl2hIu9kLA02vHRAjFMYMA/zUTRh0SRa6teduTMdabX/V6GP38/4soN4Y+bKPbyCnEaDd1pYGwA=
X-Received: by 2002:a2e:702:0:b0:253:bc1a:8a8c with SMTP id
 2-20020a2e0702000000b00253bc1a8a8cmr3018877ljh.128.1652975658067; Thu, 19 May
 2022 08:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
 <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com> <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
 <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
 <CAC-pXoPU_bOJu723POgWj+EdXHsPg3X9J5Phq-YTCpO9jt-seg@mail.gmail.com> <CAN0yncHrY6jfk6owTEue8PqGmxffU612UgccvPc9Y6XOz38LRA@mail.gmail.com>
In-Reply-To: <CAN0yncHrY6jfk6owTEue8PqGmxffU612UgccvPc9Y6XOz38LRA@mail.gmail.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Thu, 19 May 2022 08:54:07 -0700
Message-ID: <CAC-pXoPRAM8+xTPHHAxr_80vBGYaFO8R=v+2QMYJ5nEb0gvOTg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Few more style related comments.

1. "tab" seems to be used before "descr =3D ". [=E2=80=A6] for other cases.
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt=
)
                case V4L2_PIX_FMT_MT21C:        descr =3D "Mediatek
Compressed Format"; break;
+               case V4L2_PIX_FMT_AV1_FRAME: descr =3D "AV1 Frame"; break;

2. nit: s/the  AOMedia/the AOMedia/

This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.

3. nit: s/AV1 film_gram/AV1 film grain/ ?
+++ b/include/media/v4l2-ctrls.h

+ * @p_av1_film_grain:          Pointer to an AV1 film_grain.

I found these issues while reviewing Chen-Yu's change, which backports
this change to 5.10 kernel.
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
3650151

Steve

On Wed, May 18, 2022 at 4:26 PM Steve Cho <stevecho@google.com> wrote:
>
> Hi Daniel,
>
> Don't we also need V4L2_PIX_FMT_AV1 in addition to V4L2_PIX_FMT_AV1_FRAME
> as we do with both VP8 and VP9? I see V4L2_PIX_FMT_AV1 is missing.
>
> I think V4L2_PIX_FMT_VP9 is for compressed video frame
> and V4L2_PIX_FMT_VP9_FRAME is for parsed video frame.
>
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-com=
pressed.html
>
> Thanks,
> Steve
>
> On Wed, May 18, 2022 at 2:42 PM Steve Cho <stevecho@chromium.org> wrote:
>>
>> Optional: one comment about "v4l2_ctrl_av1_frame_header".
>>
>> struct v4l2_ctrl_av1_frame_header {
>>   struct v4l2_av1_tile_info tile_info;
>>   struct v4l2_av1_quantization quantization;
>>   struct v4l2_av1_segmentation segmentation;
>>   struct v4l2_av1_loop_filter loop_filter;
>>   struct v4l2_av1_cdef cdef;
>>   struct v4l2_av1_loop_restoration loop_restoration;
>>   struct v4l2_av1_global_motion global_motion;
>>
>> We used "v4l2_ctrl_vp9_frame" for the similar purpose.
>>
>> I thought "_header" can be confusing in a sense that these are
>> parameters setup from parsing av1 frame header,
>> not necessarily "header" itself.
>>
>> How about making it "v4l2_ctrl_av1_frame" similar to vp9,
>> or "v4l2_ctrl_av1_frame_params"?
>>
>> I don't think this alone justify for another update, but if we need to
>> have an update anyway,
>> then I thought it was worthwhile considering.
>>
>> Steve
>>
>> On Mon, May 16, 2022 at 10:42 AM Steve Cho <stevecho@chromium.org> wrote=
:
>> >
>> > Hi Daniel,
>> >
>> > Question about tile info structure.
>> >
>> > struct v4l2_av1_tile_info {
>> > __u8 flags;
>> > __u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
>> > __u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
>> > __u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
>> > __u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];
>> >
>> > I see below from the spec and gstreamer implementation
>> > for width_in_sbs_minus_1 and height_in_sbs_minus_1 computation.
>> >
>> >   sb_cols =3D seq_header->use_128x128_superblock ?
>> >       ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + =
15) >> 4);
>> >   sb_rows =3D seq_header->use_128x128_superblock ? ((parser->state.mi_=
rows +
>> >           31) >> 5) : ((parser->state.mi_rows + 15) >> 4);
>> >
>> > Are we confident that V4L2_AV1_MAX_TILE_COLS is good enough size for
>> > width_in_sbs_minus_1?
>> > Or does it potentially need to be V4L2_AV1_MAX_TILE_COLS+1?
>> >
>> > I am asking to double check because I see V4L2_AV1_MAX_TILE_COLS+1
>> > used for corresponding field in libgav1.
>> > int tile_column_width_in_superblocks[kMaxTileColumns + 1];
>> >
>> > https://source.chromium.org/chromium/chromium/src/+/main:third_party/l=
ibgav1/src/src/utils/types.h;l=3D291
>> >
>> > Steve
>> >
>> > On Wed, May 11, 2022 at 1:59 PM Steve Cho <stevecho@chromium.org> wrot=
e:
>> > >
>> > > Hi Daniel,
>> > >
>> > > I think the below definition is expected to cause a build error.
>> > >
>> > > +struct v4l2_av1_loop_restoration {
>> > > +       u8 flags;
>> > >
>> > > s/u8/__u8/ is needed.
>> > >
>> > > At least, this change was needed to fix this build error on Chromium
>> > > build environment.
>> > >
>> > > Steve
>> > >
>> > > On Tue, May 10, 2022 at 9:30 AM Daniel Almeida
>> > > <daniel.almeida@collabora.com> wrote:
>> > > >
>> > > > Hi Steve,
>> > > >
>> > > > > Hi Daniel,
>> > > > >
>> > > > > Found a minor typo.
>> > > > >
>> > > > >> See enum_v4l2_av1_frame_restoration_type.
>> > > > > Assume you meant v4l2_av1_frame_restoration_type instead here.
>> > > >
>> > > >
>> > > > Thanks for the heads up, this will be fixed in v3.
>> > > >
>> > > > -- Daniel
>> > > >

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023DB52C031
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 19:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240389AbiERQlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240390AbiERQlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 12:41:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F9513E98
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 09:41:18 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id c24so4581216lfv.11
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VLQuZRsYcKj9DGjJUjNPEZV/MlYtelhQsrqUJ/Nmj0I=;
        b=HVI4HClzJCC1X3fnV+1P2j2nU7xcN+3j+6NKbABTiEFWKa9i52CfTBjF02Is7uq0FE
         5VnB4CSA7lLbIgc+j9Ll+FZ7G8/VWoUaep6lvx/Uwjpdr2rISdEAZigxrPqGwOn2hBUO
         NOV5K4eazSeNBzaRH6oTARYvEuW3v2fKM2MYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VLQuZRsYcKj9DGjJUjNPEZV/MlYtelhQsrqUJ/Nmj0I=;
        b=tbxYxtBAwujFCGABKsXKXQpBM6UlZqwVN7xGzD4vND2BI/0FyoSWGV+Iv46gaswjoJ
         hWDG6JjC5ksGu9ZpIsXGMMsphxeJvoptU3/Fi0GmZqbvCi3dTb+QRT1xSEQaH9dlZ+03
         VBymD71+GK7PijucKLuj9f6mnHOOUixZujM/zzgykfZu+z2BIoTxJmNaObsZbGyVDDNe
         xBbGhumdjrpXHxiTZp78IOEfddN+wYaN4kBrwYRiyQ11DnRveds47RWFdpOowSRhB3hK
         brGOvcN9fntfTwB7FASuG7HDCajC0OnXJ8nu91AO9aV4AqvxKhSiLntRwbUZDWhg/mu5
         RJTQ==
X-Gm-Message-State: AOAM531NdPeSZhqmzxw2BQY9oCZZVUShZ+2Q9QLse0mFkggkTaHutT/H
        dqtfnsvfXl1Ce9pGFyfQ4cM3XUi2ml+fefhX3gIwWQ==
X-Google-Smtp-Source: ABdhPJy1Mwo5TxtICkm//81NZXA2xMyBQVSS6fpnnqW0fIn2x91QRG0PxvBaj0sqvRlLugVk/7n0l/JbD8kinrnKFE8=
X-Received: by 2002:a05:6512:31c3:b0:473:e6ef:368d with SMTP id
 j3-20020a05651231c300b00473e6ef368dmr238523lfe.141.1652892077287; Wed, 18 May
 2022 09:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
 <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com> <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
 <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
In-Reply-To: <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Wed, 18 May 2022 09:41:06 -0700
Message-ID: <CAC-pXoPU_bOJu723POgWj+EdXHsPg3X9J5Phq-YTCpO9jt-seg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
To:     Daniel Almeida <daniel.almeida@collabora.com>
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Optional: one comment about "v4l2_ctrl_av1_frame_header".

struct v4l2_ctrl_av1_frame_header {
  struct v4l2_av1_tile_info tile_info;
  struct v4l2_av1_quantization quantization;
  struct v4l2_av1_segmentation segmentation;
  struct v4l2_av1_loop_filter loop_filter;
  struct v4l2_av1_cdef cdef;
  struct v4l2_av1_loop_restoration loop_restoration;
  struct v4l2_av1_global_motion global_motion;

We used "v4l2_ctrl_vp9_frame" for the similar purpose.

I thought "_header" can be confusing in a sense that these are
parameters setup from parsing av1 frame header,
not necessarily "header" itself.

How about making it "v4l2_ctrl_av1_frame" similar to vp9,
or "v4l2_ctrl_av1_frame_params"?

I don't think this alone justify for another update, but if we need to
have an update anyway,
then I thought it was worthwhile considering.

Steve

On Mon, May 16, 2022 at 10:42 AM Steve Cho <stevecho@chromium.org> wrote:
>
> Hi Daniel,
>
> Question about tile info structure.
>
> struct v4l2_av1_tile_info {
> __u8 flags;
> __u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
> __u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
> __u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
> __u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];
>
> I see below from the spec and gstreamer implementation
> for width_in_sbs_minus_1 and height_in_sbs_minus_1 computation.
>
>   sb_cols = seq_header->use_128x128_superblock ?
>       ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + 15) >> 4);
>   sb_rows = seq_header->use_128x128_superblock ? ((parser->state.mi_rows +
>           31) >> 5) : ((parser->state.mi_rows + 15) >> 4);
>
> Are we confident that V4L2_AV1_MAX_TILE_COLS is good enough size for
> width_in_sbs_minus_1?
> Or does it potentially need to be V4L2_AV1_MAX_TILE_COLS+1?
>
> I am asking to double check because I see V4L2_AV1_MAX_TILE_COLS+1
> used for corresponding field in libgav1.
> int tile_column_width_in_superblocks[kMaxTileColumns + 1];
>
> https://source.chromium.org/chromium/chromium/src/+/main:third_party/libgav1/src/src/utils/types.h;l=291
>
> Steve
>
> On Wed, May 11, 2022 at 1:59 PM Steve Cho <stevecho@chromium.org> wrote:
> >
> > Hi Daniel,
> >
> > I think the below definition is expected to cause a build error.
> >
> > +struct v4l2_av1_loop_restoration {
> > +       u8 flags;
> >
> > s/u8/__u8/ is needed.
> >
> > At least, this change was needed to fix this build error on Chromium
> > build environment.
> >
> > Steve
> >
> > On Tue, May 10, 2022 at 9:30 AM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> > >
> > > Hi Steve,
> > >
> > > > Hi Daniel,
> > > >
> > > > Found a minor typo.
> > > >
> > > >> See enum_v4l2_av1_frame_restoration_type.
> > > > Assume you meant v4l2_av1_frame_restoration_type instead here.
> > >
> > >
> > > Thanks for the heads up, this will be fixed in v3.
> > >
> > > -- Daniel
> > >

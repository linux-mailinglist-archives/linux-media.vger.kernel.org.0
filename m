Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A62528C33
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 19:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238175AbiEPRmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 13:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344370AbiEPRmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 13:42:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E102D377DF
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 10:42:16 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h29so27167470lfj.2
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yb23JMC8kJczLxTDneVdxagX8QYXCNKML+ApaiTA5L0=;
        b=GJqqodNQnVFf1luFFLZdn8mUSZQMtnc4MSW4LQ6JbgDt6zGYhERxYtn0O9HvEkjlmC
         y6pWzYKwbEbQmU+9LFim+UsEE1ZXPOucoPbfY+MqEsno9dGgk4dKk2CV6khv7Peuihwf
         huZ4afCrpeI0rVoJ+t/FcDux54C324Uq45RYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yb23JMC8kJczLxTDneVdxagX8QYXCNKML+ApaiTA5L0=;
        b=jUFd55q/DdjEgI1m2Z3zbdgIl3qim9ahzYbRcsYxXChbMy2XOOCGC3qsRh/2nhdMq/
         jnv42u/h+jVX/GZrH87zk/ntvkoYgRMhJXmkk9jIslDGOUhZG6zUyY4Z7gGA1Zr6uHAM
         dQ0x6GXeXx1qlEsWM+qSfa46Oj3SOX2xOQJQuJnwrMOUORmaJYtrJKRSIPww5jwjJRYu
         VOmFW8RYRUkFFIbuCCAJSVCIHUwFEYK+qgv5RBnEV96LWGgdLp1CIXF6dBXW/vo1mm5p
         yB7x6lkB/k3JenRRcpQFUZnjfGPESk6+F1YKS5NRLm6M2RB1bsGkCnOqkYl5h+MUtFwi
         0TUQ==
X-Gm-Message-State: AOAM532klZ3mjosdANrhQ6v2WMnIYQoD12FiBCXlS/RHw7n9SJfSOETK
        K1Mn/lmML5cZ3kGwtEX+gPCDW9AUndwHNUd+AvDBKy84KHQcWQ==
X-Google-Smtp-Source: ABdhPJzRNZ3Y6rXJ/86I75xD9Dg1I49mRuB0X0eUMJXc68zXRngN+uLGpEvHoqrP9kHhGxqBPkczCQyd6D8gbMip4wE=
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id
 bq22-20020a056512151600b0044839b8d603mr13769984lfb.599.1652722935316; Mon, 16
 May 2022 10:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
 <CAC-pXoOQ5kD4bT95j+pwi7+Hb5s5H=0LFhAsk7K2sM9LkbAW1w@mail.gmail.com>
 <fa87fd58-dc73-24b0-0425-e466062c1d6d@collabora.com> <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
In-Reply-To: <CAC-pXoP77VZT1Ftu3Amws9-Y9i11r9M0LxSEwqkezm_3i=HE8g@mail.gmail.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Mon, 16 May 2022 10:42:04 -0700
Message-ID: <CAC-pXoOJPveE_+kjjkMS=anMCjJKc4VsxNrJbxkQsXqnLLb6XQ@mail.gmail.com>
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

Hi Daniel,

Question about tile info structure.

struct v4l2_av1_tile_info {
__u8 flags;
__u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
__u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
__u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
__u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];

I see below from the spec and gstreamer implementation
for width_in_sbs_minus_1 and height_in_sbs_minus_1 computation.

  sb_cols = seq_header->use_128x128_superblock ?
      ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + 15) >> 4);
  sb_rows = seq_header->use_128x128_superblock ? ((parser->state.mi_rows +
          31) >> 5) : ((parser->state.mi_rows + 15) >> 4);

Are we confident that V4L2_AV1_MAX_TILE_COLS is good enough size for
width_in_sbs_minus_1?
Or does it potentially need to be V4L2_AV1_MAX_TILE_COLS+1?

I am asking to double check because I see V4L2_AV1_MAX_TILE_COLS+1
used for corresponding field in libgav1.
int tile_column_width_in_superblocks[kMaxTileColumns + 1];

https://source.chromium.org/chromium/chromium/src/+/main:third_party/libgav1/src/src/utils/types.h;l=291

Steve

On Wed, May 11, 2022 at 1:59 PM Steve Cho <stevecho@chromium.org> wrote:
>
> Hi Daniel,
>
> I think the below definition is expected to cause a build error.
>
> +struct v4l2_av1_loop_restoration {
> +       u8 flags;
>
> s/u8/__u8/ is needed.
>
> At least, this change was needed to fix this build error on Chromium
> build environment.
>
> Steve
>
> On Tue, May 10, 2022 at 9:30 AM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
> >
> > Hi Steve,
> >
> > > Hi Daniel,
> > >
> > > Found a minor typo.
> > >
> > >> See enum_v4l2_av1_frame_restoration_type.
> > > Assume you meant v4l2_av1_frame_restoration_type instead here.
> >
> >
> > Thanks for the heads up, this will be fixed in v3.
> >
> > -- Daniel
> >

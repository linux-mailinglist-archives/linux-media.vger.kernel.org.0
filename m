Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E465E23F88B
	for <lists+linux-media@lfdr.de>; Sat,  8 Aug 2020 21:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgHHTMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 15:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgHHTMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 15:12:43 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44359C061756
        for <linux-media@vger.kernel.org>; Sat,  8 Aug 2020 12:12:43 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id df16so3598744edb.9
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2020 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6J+vkT0mY2JnMkxt9NmrpJ9KKLjtp6cUSjSFQDdnNU=;
        b=1REDy6Lyg8/50TV43G06cSWdeEpgnRgo2FYNEdydxvYhkMf+44LNnsXqD1LAv+wTdN
         fYJBWIQ235FhErE7YvpYsrIKoJ6mbGAOQKQWo0Epjn/63JU8QNA57OP1UdwvW5Fbd557
         6vmhle61Sf9SrSGh9a7jHxivdXKTi5S0jw6SOhr7fA1XSSxfkU2tnEug3drq0xJSrijI
         hcVXj1Lm3TojOFPktZhXchBxfOacqkXE4LtyQonRwlpC2uzQd7tfFWUxS6KVY6kW34aM
         WeWoTMSiM0MnSv0yS5h/NoH7aZkoSEE/ezBSzimsWuROAmrSXw16jA/2FmRm9XDWu9K/
         wJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6J+vkT0mY2JnMkxt9NmrpJ9KKLjtp6cUSjSFQDdnNU=;
        b=OKRBw2L5+dfNevQdUajlE0p7Hk13R43uBfXeaKlEntbTZhYQEAXoDfpE9IdnfkTSGV
         EuUoRA6WWK6ZGs+cwMwLAYJo1MU/w2Aj8I4uw5dzcEgy4DKNX+Ns5hSLAUaOT/BKJfW4
         tsCWGmmWqcqZtKM/gIyLHkCFjLmgvISdzUZEXrfYmaKo1hN/mgTFjMK/aw6VsWI0DPyI
         DWZs6NuMzBlzuEN30Q5BOFlnJ2a4bjR4BMdsPFxNwrZ9u/5Qt8PpjEONu691tRCeFVu8
         kDy05Ksf1aoweCMHmDxsnmfxsLiM4D+VXUL/0t35kXSxJvGCXNssJKqBqmoQ4uwUxge+
         P4iw==
X-Gm-Message-State: AOAM531uPFKxBGcTkuhTTe+39HkN3I++Mac08HxZ2NJhnkOwytrqIapp
        ZFbuQj4Si78OCzDV/zUiHrKP4DrHLrK+kUTF8Cj8zw==
X-Google-Smtp-Source: ABdhPJyA6C5C3GtCM+b4MiG+pdbZ5icHjsxwDP8zgscOWuML1P0/HBgBw1YSjux3bPgwEdgQvSqMzeMNxVurHl7J8Bk=
X-Received: by 2002:aa7:d3d9:: with SMTP id o25mr14735784edr.362.1596913961679;
 Sat, 08 Aug 2020 12:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200806151310.98624-1-ezequiel@collabora.com> <20200806151310.98624-2-ezequiel@collabora.com>
In-Reply-To: <20200806151310.98624-2-ezequiel@collabora.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 8 Aug 2020 16:12:29 -0300
Message-ID: <CAAEAJfA=q-mj8up7vSTsVY8+cvGSmipCAsNvfBrvOyaXNcJ4Qw@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] media: uapi: h264: Update reference lists
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 6 Aug 2020 at 14:38, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> When dealing with with interlaced frames, reference lists must tell if
> each particular reference is meant for top or bottom field. This info
> is currently not provided at all in the H264 related controls.
>
> Make reference lists hold a structure which will also hold an
> enumerator type along index into DPB array. The enumerator must
> be used to specify if reference is for top or bottom field.
>
> Currently the only user of these lists is Cedrus which is just compile
> fixed here. Actual usage of will come in a following commit.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v2:
> * As pointed out by Jonas, enum v4l2_h264_dpb_reference here.
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 44 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
>  include/media/h264-ctrls.h                    | 23 +++++++---
>  3 files changed, 62 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..f2b2a381369f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1843,10 +1843,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u32
>        - ``slice_group_change_cycle``
>        -
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list0[32]``
>        - Reference picture list after applying the per-slice modifications
> -    * - __u8
> +    * - struct :c:type:`v4l2_h264_reference`
>        - ``ref_pic_list1[32]``
>        - Reference picture list after applying the per-slice modifications
>      * - __u32
> @@ -1926,6 +1926,46 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``chroma_offset[32][2]``
>        -
>
> +``Picture Reference``
> +
> +.. c:type:: v4l2_h264_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_h264_reference
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - enum :c:type:`v4l2_h264_dpb_reference`
> +      - ``reference``
> +      - Specifies how the DPB entry is referenced.

Ah, a small overlook on my side. Given this struct
is used for DPB entries and slice references,
we should name this using something more generic,
and not mention DPB to avoid confusions.

Perhaps "struct v4l2_h264_field_reference".

Thanks!
Ezequiel


> +    * - __u8
> +      - ``index``
> +      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
> +
> +.. c:type:: v4l2_h264_dpb_reference
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_DPB_TOP_REF``
> +      - 0x1
> +      - The top field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_BOTTOM_REF``
> +      - 0x2
> +     - The bottom field in field pair is used for
> +        short-term reference.
> +    * - ``V4L2_H264_DPB_FRAME_REF``
> +      - 0x3
> +      - The frame (or the top/bottom fields, if it's a field pair)
> +        is used for short-term reference.
> +
>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
>      Specifies the decode parameters (as extracted from the bitstream)
>      for the associated H264 slice data. This includes the necessary
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index 54ee2aa423e2..cce527bbdf86 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -166,8 +166,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
>
>  static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>                                    struct cedrus_run *run,
> -                                  const u8 *ref_list, u8 num_ref,
> -                                  enum cedrus_h264_sram_off sram)
> +                                  const struct v4l2_h264_reference *ref_list,
> +                                  u8 num_ref, enum cedrus_h264_sram_off sram)
>  {
>         const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
>         struct vb2_queue *cap_q;
> @@ -188,7 +188,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>                 int buf_idx;
>                 u8 dpb_idx;
>
> -               dpb_idx = ref_list[i];
> +               dpb_idx = ref_list[i].index;
>                 dpb = &decode->dpb[dpb_idx];
>
>                 if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> index 080fd1293c42..4c0bb7f5fb05 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -19,6 +19,8 @@
>   */
>  #define V4L2_H264_NUM_DPB_ENTRIES 16
>
> +#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> +
>  /* Our pixel format isn't stable at the moment */
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>
> @@ -140,6 +142,19 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED    0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH             0x08
>
> +enum v4l2_h264_dpb_reference {
> +       V4L2_H264_DPB_TOP_REF = 0x1,
> +       V4L2_H264_DPB_BOTTOM_REF = 0x2,
> +       V4L2_H264_DPB_FRAME_REF = 0x3,
> +};
> +
> +struct v4l2_h264_reference {
> +       enum v4l2_h264_dpb_reference fields;
> +
> +       /* Index into v4l2_ctrl_h264_decode_params.dpb[] */
> +       __u8 index;
> +};
> +
>  struct v4l2_ctrl_h264_slice_params {
>         /* Size in bytes, including header */
>         __u32 size;
> @@ -178,12 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
>         __u8 num_ref_idx_l1_active_minus1;
>         __u32 slice_group_change_cycle;
>
> -       /*
> -        * Entries on each list are indices into
> -        * v4l2_ctrl_h264_decode_params.dpb[].
> -        */
> -       __u8 ref_pic_list0[32];
> -       __u8 ref_pic_list1[32];
> +       struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
> +       struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
>
>         __u32 flags;
>  };
> --
> 2.27.0
>

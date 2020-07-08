Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A782188FB
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 15:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgGHN3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 09:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgGHN3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 09:29:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAC2C061A0B
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 06:29:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d4so21675830pgk.4
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wN3EWgk/x5NoifjZbV2/MdXn6UXBSWUU/L+JDx5urmA=;
        b=Ck5EclqdTPhVTMFgg6o2aa4zQ3r7sKrPXh6IA93ELVlTG2AZl7EFcBYb+N/gLwYjHX
         Bm0/kaPLgwbKxHy5njCl9vz03Naus7hVgS6d89ulhKVVyrIbjuu4UmeQlr43Vdi59hv/
         fbO2EB06AGjRn4djiqh0weKEcBqT8NJXz8iElkjVljjKwahe/RbJp2XalZh8664e6oh5
         +IgBhD1OlDYIg5cA47MdzJIoZtCWNFgzddNttpZ5j7LqyB0e4f11g3jyvruslhrh1xzP
         M2RvCiYOAkYJ4Wlb0hJ6AaKqE0Ou9tm844RGkwG3AHBkvriw4SCU4sCTHLdgAFBgG6Iq
         dmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wN3EWgk/x5NoifjZbV2/MdXn6UXBSWUU/L+JDx5urmA=;
        b=b21spMYrAehiyA4GWTqNzoZIyBDGhBoHeYVburPJoPVcM3QGDErudfdPMhMEmxboI8
         0/naZwd8Wnc0srJklC4UIY42IjQkd+vbXt7WYwvdww9/mClgwDNODNDyt3/oarK6Xay3
         mYowOeSpMZV5LcCHADm2ascUsPReMlIfopYq/6FSjqCnG29CIhq8lMZAAN7vuX9j2R6L
         I3HLK6muj12/oK0XKKL7O+QT5ZJIiZxCocQxZAaT6J52jiDLjkjC3So+xh9xfo++ioRI
         T8rt62ZtgMZBOOXZbxEaJ2hrJzBCI7G8IjUKrRAGrgD/7k9PET0ClwzruOVmo4MjUncX
         3ihg==
X-Gm-Message-State: AOAM533UT92BUznH58kKzliFGyknSIFurpCIQC1VI/HSocedf7xe64Oh
        mhvGxSCdvq4KKeydeGyYvm/qmbIhdmWeBCOi2/Hhuw==
X-Google-Smtp-Source: ABdhPJy6eI1/TSJpreDxCQpqeyG6XeOm5xpbcgLAF1WPOQZyO2y0sMxOp79n/z1Tey4/S/Cd6hAidyyvLZgG66GhGlo=
X-Received: by 2002:a63:8c18:: with SMTP id m24mr51276927pgd.289.1594214943466;
 Wed, 08 Jul 2020 06:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200604185745.23568-1-jernej.skrabec@siol.net> <20200604185745.23568-2-jernej.skrabec@siol.net>
In-Reply-To: <20200604185745.23568-2-jernej.skrabec@siol.net>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 8 Jul 2020 10:28:52 -0300
Message-ID: <CAAEAJfAx4=RGJBVPccVFNYxNUqom7tkQD=J9oMfqajGxn6k+Zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uapi: h264: update reference lists
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jernej,

I'd like to post a new H264 uAPI cleanup series soon,
would you mind resending this, or otherwise do you
mind if I include this patch in the series?

See below for a tiny comment.

On Thu, 4 Jun 2020 at 15:55, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> When dealing with with interlaced frames, reference lists must tell if
> each particular reference is meant for top or bottom field. This info
> is currently not provided at all in the H264 related controls.
>
> Make reference lists hold a structure which will also hold flags along
> index into DPB array. Flags will tell if reference is meant for top or
> bottom field.
>
> Currently the only user of these lists is Cedrus which is just compile
> fixed here. Actual usage of newly introduced flags will come in
> following commit.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 +--
>  include/media/h264-ctrls.h                    | 12 +++++-
>  3 files changed, 51 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index d0d506a444b1..6c36d298db20 100644
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
> @@ -1926,6 +1926,42 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
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
> +    * - __u16
> +      - ``flags``
> +      - See :ref:`Picture Reference Flags <h264_reference_flags>`
> +    * - __u8
> +      - ``index``
> +      -
> +
> +.. _h264_reference_flags:
> +
> +``Picture Reference Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - ``V4L2_H264_REFERENCE_FLAG_TOP_FIELD``
> +      - 0x00000001
> +      -
> +    * - ``V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD``
> +      - 0x00000002
> +      -
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
> index 080fd1293c42..9b1cbc9bc38e 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/media/h264-ctrls.h
> @@ -140,6 +140,14 @@ struct v4l2_h264_pred_weight_table {
>  #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED    0x04
>  #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH             0x08
>
> +#define V4L2_H264_REFERENCE_FLAG_TOP_FIELD             0x01
> +#define V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD          0x02
> +
> +struct v4l2_h264_reference {
> +       __u8 flags;
> +       __u8 index;
> +};
> +
>  struct v4l2_ctrl_h264_slice_params {
>         /* Size in bytes, including header */
>         __u32 size;
> @@ -182,8 +190,8 @@ struct v4l2_ctrl_h264_slice_params {
>          * Entries on each list are indices into
>          * v4l2_ctrl_h264_decode_params.dpb[].
>          */
> -       __u8 ref_pic_list0[32];
> -       __u8 ref_pic_list1[32];
> +       struct v4l2_h264_reference ref_pic_list0[32];
> +       struct v4l2_h264_reference ref_pic_list1[32];
>

Could we use a macro for "32" here? Something like:

#define V4L2_H264_REF_PIC_LIST_LEN (V4L2_H264_NUM_DPB_ENTRIES * 2).

Does it make sense to add a comment as well?

I was thinking something along these lines:

"""
Pictures in the DPB can be a frame, a complementary field pair or a
single field.
Therefore, reference pictures lists need twice as much entries, so it
can reference
either field of a field pair.
"""

While it doesn't replace proper H264 specification reading,
it would add some clarity.

Thanks,
Ezequiel

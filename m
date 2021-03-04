Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29E232CEBC
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 09:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbhCDItB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 03:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbhCDItA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 03:49:00 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE66EC061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 00:48:19 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id u4so32330587ljh.6
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 00:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vBq0ajCwVzdZVO601P/viGnjKICToncPhaXCRhzbGM=;
        b=DnUZkWOMxY3yJ5jc+W9/HYxA+J1JUZ1qtc+Jdfr92o7ZMxgjJ/n6bPJ9swKB9cs9Ax
         QKwrek6YmH3n4Rl08oLbKivamWOAm4PyCieRAUrEkGOtxTNaZ9Vo0U5bnlS04rfTGw/r
         Q1/7GYYuOsghLEviUjSDsQgv9WhN29odOBd+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vBq0ajCwVzdZVO601P/viGnjKICToncPhaXCRhzbGM=;
        b=B274qW7z7S6mPreks9/pyE+GgoLsjUxd3rmxiW5C/Y4L4SZ2o00dKPYt5T18uu9292
         zF5BH2PFr0dwhzC9WrMx4YnnPQT6LV0IFmpbgOS5RV1dse3qXdcUsnqFY9ngD86RLxQD
         I0dqcdJWagNdFVkoVZiWfm3LaBD2fYW4+gY0KrcYhpN+7mnmeFuDXxauq25FQYk34p6u
         spZKEmNUn69ZFCgPlX17d+AdhZMX7P8H977wtlXI/TGxwruwvf4AqwS+BnNh09at1cAz
         OFz4wPG3Dcla88XGXK6llLyLrLyHqMQ93RqLOuQTdMCIxBPPsbs/QxRp9A89q9+VQmN7
         joFA==
X-Gm-Message-State: AOAM532/tzKe5lfFi+zXg6wFpPeJKIR5FWGlPNuPyc2QJGz3yjcTBo44
        yGd0gNQJeGaswVdxHTE+DUCKc2Jj6/VcJg==
X-Google-Smtp-Source: ABdhPJy7Tc2821OqU/aPBxZ7nLTk2SdUAS/Lo1MERmzd5rZiJWe7C9+n7QlBMIhPGnPAW9ZNNM525g==
X-Received: by 2002:a2e:330d:: with SMTP id d13mr1736247ljc.361.1614847697526;
        Thu, 04 Mar 2021 00:48:17 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id u25sm2403941lfk.213.2021.03.04.00.48.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 00:48:16 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id n16so24932182lfb.4
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 00:48:16 -0800 (PST)
X-Received: by 2002:ac2:532c:: with SMTP id f12mr1842628lfh.73.1614847695726;
 Thu, 04 Mar 2021 00:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20210303202714.212394-1-ezequiel@collabora.com> <20210303202714.212394-2-ezequiel@collabora.com>
In-Reply-To: <20210303202714.212394-2-ezequiel@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 4 Mar 2021 17:48:04 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVx9N8vtE4KsPyv4dTkAnFrtjPNMU+P7Qam1r6_ByG1zg@mail.gmail.com>
Message-ID: <CAPBb6MVx9N8vtE4KsPyv4dTkAnFrtjPNMU+P7Qam1r6_ByG1zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] media: uapi: vp8: Remove "header" from symbol
 names and macros
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 4, 2021 at 5:27 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> It doesn't seem to add any clarity to have a "header" suffix in controls,
> struct names and flags.
>
> Since this just makes names too long without any benefit, just drop it.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-codec.rst             | 80 +++++++--------
>  .../media/v4l/pixfmt-compressed.rst           |  2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 36 +++----
>  drivers/staging/media/hantro/hantro_drv.c     |  2 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  | 48 ++++-----
>  drivers/staging/media/hantro/hantro_hw.h      |  2 +-
>  drivers/staging/media/hantro/hantro_vp8.c     | 10 +-
>  .../media/hantro/rk3399_vpu_hw_vp8_dec.c      | 48 ++++-----
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +-
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 98 +++++++++----------
>  include/media/v4l2-ctrls.h                    |  4 +-
>  include/media/vp8-ctrls.h                     | 48 ++++-----
>  14 files changed, 192 insertions(+), 192 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 00944e97d638..006301e88554 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1749,7 +1749,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>
>  .. _v4l2-mpeg-vp8:
>
> -``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (struct)``
> +``V4L2_CID_MPEG_VIDEO_VP8_FRAME (struct)``
>      Specifies the frame parameters for the associated VP8 parsed frame data.
>      This includes the necessary parameters for
>      configuring a stateless hardware decoding pipeline for VP8.
> @@ -1760,28 +1760,28 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>         This compound control is not yet part of the public kernel API and
>         it is expected to change.
>
> -.. c:type:: v4l2_ctrl_vp8_frame_header
> +.. c:type:: v4l2_ctrl_vp8_frame
>
>  .. cssclass:: longtable
>
>  .. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
>
> -.. flat-table:: struct v4l2_ctrl_vp8_frame_header
> +.. flat-table:: struct v4l2_ctrl_vp8_frame
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
>
> -    * - struct :c:type:`v4l2_vp8_segment_header`
> -      - ``segment_header``
> +    * - struct :c:type:`v4l2_vp8_segment`
> +      - ``seg``
>        - Structure with segment-based adjustments metadata.
> -    * - struct :c:type:`v4l2_vp8_loopfilter_header`
> -      - ``loopfilter_header``
> +    * - struct :c:type:`v4l2_vp8_loopfilter`
> +      - ``lf``
>        - Structure with loop filter level adjustments metadata.
> -    * - struct :c:type:`v4l2_vp8_quantization_header`
> -      - ``quant_header``
> +    * - struct :c:type:`v4l2_vp8_quantization`
> +      - ``quant``
>        - Structure with VP8 dequantization indices metadata.
> -    * - struct :c:type:`v4l2_vp8_entropy_header`
> -      - ``entropy_header``
> +    * - struct :c:type:`v4l2_vp8_entropy`
> +      - ``entropy``
>        - Structure with VP8 entropy coder probabilities metadata.
>      * - struct :c:type:`v4l2_vp8_entropy_coder_state`
>        - ``coder_state``
> @@ -1850,11 +1850,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>         :c:type:`v4l2_buffer` to a __u64.
>      * - __u64
>        - ``flags``
> -      - See :ref:`Frame Header Flags <vp8_frame_header_flags>`
> +      - See :ref:`Frame Flags <vp8_frame_flags>`
>
> -.. _vp8_frame_header_flags:
> +.. _vp8_frame_flags:
>
> -``Frame Header Flags``
> +``Frame Flags``
>
>  .. cssclass:: longtable
>
> @@ -1863,22 +1863,22 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :stub-columns: 0
>      :widths:       1 1 2
>
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME``
> +    * - ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
>        - 0x01
>        - Indicates if the frame is a key frame.
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_EXPERIMENTAL``
> +    * - ``V4L2_VP8_FRAME_FLAG_EXPERIMENTAL``
>        - 0x02
>        - Experimental bitstream.
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SHOW_FRAME``
> +    * - ``V4L2_VP8_FRAME_FLAG_SHOW_FRAME``
>        - 0x04
>        - Show frame flag, indicates if the frame is for display.
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF``
> +    * - ``V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF``
>        - 0x08
>        - Enable/disable skipping of macroblocks with no non-zero coefficients.
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN``
> +    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN``
>        - 0x10
>        - Sign of motion vectors when the golden frame is referenced.
> -    * - ``V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT``
> +    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
>        - 0x20
>        - Sign of motion vectors when the alt frame is referenced.
>
> @@ -1906,13 +1906,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``padding``
>        - Applications and drivers must set this to zero.
>
> -.. c:type:: v4l2_vp8_segment_header
> +.. c:type:: v4l2_vp8_segment
>
>  .. cssclass:: longtable
>
>  .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
>
> -.. flat-table:: struct v4l2_vp8_segment_header
> +.. flat-table:: struct v4l2_vp8_segment
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> @@ -1931,11 +1931,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - Applications and drivers must set this to zero.
>      * - __u32
>        - ``flags``
> -      - See :ref:`Segment Header Flags <vp8_segment_header_flags>`
> +      - See :ref:`Segment Flags <vp8_segment_flags>`
>
> -.. _vp8_segment_header_flags:
> +.. _vp8_segment_flags:
>
> -``Segment Header Flags``
> +``Segment Flags``
>
>  .. cssclass:: longtable
>
> @@ -1944,27 +1944,27 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :stub-columns: 0
>      :widths:       1 1 2
>
> -    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED``
> +    * - ``V4L2_VP8_SEGMENT_FLAG_ENABLED``
>        - 0x01
>        - Enable/disable segment-based adjustments.
> -    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP``
> +    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP``
>        - 0x02
>        - Indicates if the macroblock segmentation map is updated in this frame.
> -    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_FEATURE_DATA``
> +    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA``
>        - 0x04
>        - Indicates if the segment feature data is updated in this frame.
> -    * - ``V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE``
> +    * - ``V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE``
>        - 0x08
>        - If is set, the segment feature data mode is delta-value.
>          If cleared, it's absolute-value.
>
> -.. c:type:: v4l2_vp8_loopfilter_header
> +.. c:type:: v4l2_vp8_loopfilter
>
>  .. cssclass:: longtable
>
>  .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
>
> -.. flat-table:: struct v4l2_vp8_loopfilter_header
> +.. flat-table:: struct v4l2_vp8_loopfilter
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> @@ -1986,11 +1986,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - Applications and drivers must set this to zero.
>      * - __u32
>        - ``flags``
> -      - See :ref:`Loopfilter Header Flags <vp8_loopfilter_header_flags>`
> +      - See :ref:`Loopfilter Flags <vp8_loopfilter_flags>`
>
> -.. _vp8_loopfilter_header_flags:
> +.. _vp8_loopfilter_flags:
>
> -``Loopfilter Header Flags``
> +``Loopfilter Flags``
>
>  .. cssclass:: longtable
>
> @@ -1999,10 +1999,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      :stub-columns: 0
>      :widths:       1 1 2
>
> -    * - ``V4L2_VP8_LF_HEADER_ADJ_ENABLE``
> +    * - ``V4L2_VP8_LF_ADJ_ENABLE``
>        - 0x01
>        - Enable/disable macroblock-level loop filter adjustment.
> -    * - ``V4L2_VP8_LF_HEADER_DELTA_UPDATE``
> +    * - ``V4L2_VP8_LF_DELTA_UPDATE``
>        - 0x02
>        - Indicates if the delta values used in an adjustment are updated.
>      * - ``V4L2_VP8_LF_FILTER_TYPE_SIMPLE``
> @@ -2010,13 +2010,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - If set, indicates the filter type is simple.
>          If cleared, the filter type is normal.
>
> -.. c:type:: v4l2_vp8_quantization_header
> +.. c:type:: v4l2_vp8_quantization
>
>  .. cssclass:: longtable
>
>  .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
>
> -.. flat-table:: struct v4l2_vp8_quantization_header
> +.. flat-table:: struct v4l2_vp8_quantization
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> @@ -2043,13 +2043,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``padding``
>        - Applications and drivers must set this to zero.
>
> -.. c:type:: v4l2_vp8_entropy_header
> +.. c:type:: v4l2_vp8_entropy
>
>  .. cssclass:: longtable
>
>  .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
>
> -.. flat-table:: struct v4l2_vp8_entropy_header
> +.. flat-table:: struct v4l2_vp8_entropy
>      :header-rows:  0
>      :stub-columns: 0
>      :widths:       1 1 2
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index acad5f3ca0c1..2e07e48053d6 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -151,7 +151,7 @@ Compressed Formats
>         This format is adapted for stateless video decoders that implement a
>         VP8 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
>         Metadata associated with the frame to decode is required to be passed
> -       through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER`` control.
> +       through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME`` control.
>         See the :ref:`associated Codec Control IDs <v4l2-mpeg-vp8>`.
>         Exactly one output and one capture buffer must be provided for use with
>         this pixel format. The output buffer must contain the appropriate number
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 016cf6204cbb..1a683f4fa978 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -971,7 +971,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:                   return "VP8 Profile";
>         case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:                   return "VP9 Profile";
>         case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:                     return "VP9 Level";
> -       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:              return "VP8 Frame Header";
> +       case V4L2_CID_MPEG_VIDEO_VP8_FRAME:                     return "VP8 Frame Parameters";
>
>         /* HEVC controls */
>         case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:               return "HEVC I-Frame QP Value";
> @@ -1470,8 +1470,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>         case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
>                 *type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
>                 break;
> -       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> -               *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> +       case V4L2_CID_MPEG_VIDEO_VP8_FRAME:
> +               *type = V4L2_CTRL_TYPE_VP8_FRAME;
>                 break;
>         case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
>                 *type = V4L2_CTRL_TYPE_HEVC_SPS;
> @@ -1642,7 +1642,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                               union v4l2_ctrl_ptr ptr)
>  {
>         struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> -       struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +       struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>         struct v4l2_ctrl_fwht_params *p_fwht_params;
>         void *p = ptr.p + idx * ctrl->elem_size;
>
> @@ -1666,9 +1666,9 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 p_mpeg2_slice_params->picture.picture_coding_type =
>                                         V4L2_MPEG2_PICTURE_CODING_TYPE_I;
>                 break;
> -       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> -               p_vp8_frame_header = p;
> -               p_vp8_frame_header->num_dct_parts = 1;
> +       case V4L2_CTRL_TYPE_VP8_FRAME:
> +               p_vp8_frame = p;
> +               p_vp8_frame->num_dct_parts = 1;
>                 break;
>         case V4L2_CTRL_TYPE_FWHT_PARAMS:
>                 p_fwht_params = p;
> @@ -1823,7 +1823,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                                  union v4l2_ctrl_ptr ptr)
>  {
>         struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
> -       struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +       struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>         struct v4l2_ctrl_fwht_params *p_fwht_params;
>         struct v4l2_ctrl_h264_sps *p_h264_sps;
>         struct v4l2_ctrl_h264_pps *p_h264_pps;
> @@ -2046,10 +2046,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 zero_reserved(*p_h264_dec_params);
>                 break;
>
> -       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> -               p_vp8_frame_header = p;
> +       case V4L2_CTRL_TYPE_VP8_FRAME:
> +               p_vp8_frame = p;
>
> -               switch (p_vp8_frame_header->num_dct_parts) {
> +               switch (p_vp8_frame->num_dct_parts) {
>                 case 1:
>                 case 2:
>                 case 4:
> @@ -2058,11 +2058,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 default:
>                         return -EINVAL;
>                 }
> -               zero_padding(p_vp8_frame_header->segment_header);
> -               zero_padding(p_vp8_frame_header->lf_header);
> -               zero_padding(p_vp8_frame_header->quant_header);
> -               zero_padding(p_vp8_frame_header->entropy_header);
> -               zero_padding(p_vp8_frame_header->coder_state);
> +               zero_padding(p_vp8_frame->seg);
> +               zero_padding(p_vp8_frame->lf);
> +               zero_padding(p_vp8_frame->quant);
> +               zero_padding(p_vp8_frame->entropy);
> +               zero_padding(p_vp8_frame->coder_state);
>                 break;
>
>         case V4L2_CTRL_TYPE_HEVC_SPS:
> @@ -2809,8 +2809,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>         case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
>                 elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
>                 break;
> -       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> -               elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
> +       case V4L2_CTRL_TYPE_VP8_FRAME:
> +               elem_size = sizeof(struct v4l2_ctrl_vp8_frame);
>                 break;
>         case V4L2_CTRL_TYPE_HEVC_SPS:
>                 elem_size = sizeof(struct v4l2_ctrl_hevc_sps);
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e5f200e64993..f1e7f0732e27 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -299,7 +299,7 @@ static const struct hantro_ctrl controls[] = {
>         }, {
>                 .codec = HANTRO_VP8_DECODER,
>                 .cfg = {
> -                       .id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
> +                       .id = V4L2_CID_MPEG_VIDEO_VP8_FRAME,
>                 },
>         }, {
>                 .codec = HANTRO_H264_DECODER,
> diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> index a5cdf150cd16..3f4311c1dab8 100644
> --- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> @@ -133,17 +133,17 @@ static const struct hantro_reg vp8_dec_pred_bc_tap[8][4] = {
>   * Set loop filters
>   */
>  static void cfg_lf(struct hantro_ctx *ctx,
> -                  const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                  const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> -       const struct v4l2_vp8_loopfilter_header *lf = &hdr->lf_header;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
> +       const struct v4l2_vp8_loopfilter *lf = &hdr->lf;
>         struct hantro_dev *vpu = ctx->dev;
>         unsigned int i;
>         u32 reg;
>
> -       if (!(seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED)) {
> +       if (!(seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED)) {
>                 hantro_reg_write(vpu, &vp8_dec_lf_level[0], lf->level);
> -       } else if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE) {
> +       } else if (seg->flags & V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE) {
>                 for (i = 0; i < 4; i++) {
>                         u32 lf_level = clamp(lf->level + seg->lf_update[i],
>                                              0, 63);
> @@ -161,7 +161,7 @@ static void cfg_lf(struct hantro_ctx *ctx,
>                 reg |= G1_REG_REF_PIC_FILT_TYPE_E;
>         vdpu_write_relaxed(vpu, reg, G1_REG_REF_PIC(0));
>
> -       if (lf->flags & V4L2_VP8_LF_HEADER_ADJ_ENABLE) {
> +       if (lf->flags & V4L2_VP8_LF_ADJ_ENABLE) {
>                 for (i = 0; i < 4; i++) {
>                         hantro_reg_write(vpu, &vp8_dec_mb_adj[i],
>                                          lf->mb_mode_delta[i]);
> @@ -175,16 +175,16 @@ static void cfg_lf(struct hantro_ctx *ctx,
>   * Set quantization parameters
>   */
>  static void cfg_qp(struct hantro_ctx *ctx,
> -                  const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                  const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_quantization_header *q = &hdr->quant_header;
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> +       const struct v4l2_vp8_quantization *q = &hdr->quant;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
>         struct hantro_dev *vpu = ctx->dev;
>         unsigned int i;
>
> -       if (!(seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED)) {
> +       if (!(seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED)) {
>                 hantro_reg_write(vpu, &vp8_dec_quant[0], q->y_ac_qi);
> -       } else if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE) {
> +       } else if (seg->flags & V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE) {
>                 for (i = 0; i < 4; i++) {
>                         u32 quant = clamp(q->y_ac_qi + seg->quant_update[i],
>                                           0, 127);
> @@ -230,7 +230,7 @@ static void cfg_qp(struct hantro_ctx *ctx,
>   *   4. the addresses set to the VPU must be 64-bits aligned
>   */
>  static void cfg_parts(struct hantro_ctx *ctx,
> -                     const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                     const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_src;
> @@ -328,7 +328,7 @@ static void cfg_parts(struct hantro_ctx *ctx,
>   * normal 6-tap filters
>   */
>  static void cfg_tap(struct hantro_ctx *ctx,
> -                   const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                   const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         struct hantro_reg reg;
> @@ -368,7 +368,7 @@ static void cfg_tap(struct hantro_ctx *ctx,
>  }
>
>  static void cfg_ref(struct hantro_ctx *ctx,
> -                   const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                   const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_dst;
> @@ -385,7 +385,7 @@ static void cfg_ref(struct hantro_ctx *ctx,
>         WARN_ON(!ref && hdr->golden_frame_ts);
>         if (!ref)
>                 ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> -       if (hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN)
> +       if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
>                 ref |= G1_REG_ADDR_REF_TOPC_E;
>         vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(4));
>
> @@ -393,15 +393,15 @@ static void cfg_ref(struct hantro_ctx *ctx,
>         WARN_ON(!ref && hdr->alt_frame_ts);
>         if (!ref)
>                 ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> -       if (hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT)
> +       if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
>                 ref |= G1_REG_ADDR_REF_TOPC_E;
>         vdpu_write_relaxed(vpu, ref, G1_REG_ADDR_REF(5));
>  }
>
>  static void cfg_buffers(struct hantro_ctx *ctx,
> -                       const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                       const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_dst;
>         dma_addr_t dst_dma;
> @@ -415,9 +415,9 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>
>         /* Set segment map address */
>         reg = G1_REG_FWD_PIC1_SEGMENT_BASE(ctx->vp8_dec.segment_map.dma);
> -       if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED) {
> +       if (seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED) {
>                 reg |= G1_REG_FWD_PIC1_SEGMENT_E;
> -               if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP)
> +               if (seg->flags & V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP)
>                         reg |= G1_REG_FWD_PIC1_SEGMENT_UPD_E;
>         }
>         vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(0));
> @@ -428,7 +428,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>
>  void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>  {
> -       const struct v4l2_ctrl_vp8_frame_header *hdr;
> +       const struct v4l2_ctrl_vp8_frame *hdr;
>         struct hantro_dev *vpu = ctx->dev;
>         size_t height = ctx->dst_fmt.height;
>         size_t width = ctx->dst_fmt.width;
> @@ -437,7 +437,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>
>         hantro_start_prepare_run(ctx);
>
> -       hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
> +       hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME);
>         if (WARN_ON(!hdr))
>                 return;
>
> @@ -462,9 +462,9 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>         reg = G1_REG_DEC_CTRL0_DEC_MODE(10);
>         if (!VP8_FRAME_IS_KEY_FRAME(hdr))
>                 reg |= G1_REG_DEC_CTRL0_PIC_INTER_E;
> -       if (!(hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF))
> +       if (!(hdr->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF))
>                 reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
> -       if (hdr->lf_header.level == 0)
> +       if (hdr->lf.level == 0)
>                 reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
>         vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 34c9e4649a25..ada482e514b8 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -216,6 +216,6 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx);
>  int hantro_vp8_dec_init(struct hantro_ctx *ctx);
>  void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
>  void hantro_vp8_prob_update(struct hantro_ctx *ctx,
> -                           const struct v4l2_ctrl_vp8_frame_header *hdr);
> +                           const struct v4l2_ctrl_vp8_frame *hdr);
>
>  #endif /* HANTRO_HW_H_ */
> diff --git a/drivers/staging/media/hantro/hantro_vp8.c b/drivers/staging/media/hantro/hantro_vp8.c
> index 91ec9a05645b..f5bd32b6be95 100644
> --- a/drivers/staging/media/hantro/hantro_vp8.c
> +++ b/drivers/staging/media/hantro/hantro_vp8.c
> @@ -47,9 +47,9 @@ const u32 hantro_vp8_dec_mc_filter[8][6] = {
>  };
>
>  void hantro_vp8_prob_update(struct hantro_ctx *ctx,
> -                           const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                           const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_entropy_header *entropy = &hdr->entropy_header;
> +       const struct v4l2_vp8_entropy *entropy = &hdr->entropy;
>         u32 i, j, k;
>         u8 *dst;
>
> @@ -60,9 +60,9 @@ void hantro_vp8_prob_update(struct hantro_ctx *ctx,
>         dst[1] = hdr->prob_intra;
>         dst[2] = hdr->prob_last;
>         dst[3] = hdr->prob_gf;
> -       dst[4] = hdr->segment_header.segment_probs[0];
> -       dst[5] = hdr->segment_header.segment_probs[1];
> -       dst[6] = hdr->segment_header.segment_probs[2];
> +       dst[4] = hdr->seg.segment_probs[0];
> +       dst[5] = hdr->seg.segment_probs[1];
> +       dst[6] = hdr->seg.segment_probs[2];
>         dst[7] = 0;
>
>         dst += 8;
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
> index a4a792f00b11..5c43f59ad531 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
> @@ -274,17 +274,17 @@ static const struct hantro_reg vp8_dec_start_dec = {
>  };
>
>  static void cfg_lf(struct hantro_ctx *ctx,
> -                  const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                  const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> -       const struct v4l2_vp8_loopfilter_header *lf = &hdr->lf_header;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
> +       const struct v4l2_vp8_loopfilter *lf = &hdr->lf;
>         struct hantro_dev *vpu = ctx->dev;
>         unsigned int i;
>         u32 reg;
>
> -       if (!(seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED)) {
> +       if (!(seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED)) {
>                 hantro_reg_write(vpu, &vp8_dec_lf_level[0], lf->level);
> -       } else if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE) {
> +       } else if (seg->flags & V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE) {
>                 for (i = 0; i < 4; i++) {
>                         u32 lf_level = clamp(lf->level + seg->lf_update[i],
>                                              0, 63);
> @@ -302,7 +302,7 @@ static void cfg_lf(struct hantro_ctx *ctx,
>                 reg |= VDPU_REG_REF_PIC_FILT_TYPE_E;
>         vdpu_write_relaxed(vpu, reg, VDPU_REG_FILTER_MB_ADJ);
>
> -       if (lf->flags & V4L2_VP8_LF_HEADER_ADJ_ENABLE) {
> +       if (lf->flags & V4L2_VP8_LF_ADJ_ENABLE) {
>                 for (i = 0; i < 4; i++) {
>                         hantro_reg_write(vpu, &vp8_dec_mb_adj[i],
>                                          lf->mb_mode_delta[i]);
> @@ -313,16 +313,16 @@ static void cfg_lf(struct hantro_ctx *ctx,
>  }
>
>  static void cfg_qp(struct hantro_ctx *ctx,
> -                  const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                  const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_quantization_header *q = &hdr->quant_header;
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> +       const struct v4l2_vp8_quantization *q = &hdr->quant;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
>         struct hantro_dev *vpu = ctx->dev;
>         unsigned int i;
>
> -       if (!(seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED)) {
> +       if (!(seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED)) {
>                 hantro_reg_write(vpu, &vp8_dec_quant[0], q->y_ac_qi);
> -       } else if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE) {
> +       } else if (seg->flags & V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE) {
>                 for (i = 0; i < 4; i++) {
>                         u32 quant = clamp(q->y_ac_qi + seg->quant_update[i],
>                                           0, 127);
> @@ -343,7 +343,7 @@ static void cfg_qp(struct hantro_ctx *ctx,
>  }
>
>  static void cfg_parts(struct hantro_ctx *ctx,
> -                     const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                     const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_src;
> @@ -426,7 +426,7 @@ static void cfg_parts(struct hantro_ctx *ctx,
>   * normal 6-tap filters
>   */
>  static void cfg_tap(struct hantro_ctx *ctx,
> -                   const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                   const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         int i, j;
> @@ -445,7 +445,7 @@ static void cfg_tap(struct hantro_ctx *ctx,
>  }
>
>  static void cfg_ref(struct hantro_ctx *ctx,
> -                   const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                   const struct v4l2_ctrl_vp8_frame *hdr)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_dst;
> @@ -462,7 +462,7 @@ static void cfg_ref(struct hantro_ctx *ctx,
>         WARN_ON(!ref && hdr->golden_frame_ts);
>         if (!ref)
>                 ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> -       if (hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN)
> +       if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
>                 ref |= VDPU_REG_VP8_GREF_SIGN_BIAS;
>         vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF2_5(2));
>
> @@ -470,15 +470,15 @@ static void cfg_ref(struct hantro_ctx *ctx,
>         WARN_ON(!ref && hdr->alt_frame_ts);
>         if (!ref)
>                 ref = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> -       if (hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT)
> +       if (hdr->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
>                 ref |= VDPU_REG_VP8_AREF_SIGN_BIAS;
>         vdpu_write_relaxed(vpu, ref, VDPU_REG_VP8_ADDR_REF2_5(3));
>  }
>
>  static void cfg_buffers(struct hantro_ctx *ctx,
> -                       const struct v4l2_ctrl_vp8_frame_header *hdr)
> +                       const struct v4l2_ctrl_vp8_frame *hdr)
>  {
> -       const struct v4l2_vp8_segment_header *seg = &hdr->segment_header;
> +       const struct v4l2_vp8_segment *seg = &hdr->seg;
>         struct hantro_dev *vpu = ctx->dev;
>         struct vb2_v4l2_buffer *vb2_dst;
>         dma_addr_t dst_dma;
> @@ -492,9 +492,9 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>
>         /* Set segment map address */
>         reg = VDPU_REG_FWD_PIC1_SEGMENT_BASE(ctx->vp8_dec.segment_map.dma);
> -       if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED) {
> +       if (seg->flags & V4L2_VP8_SEGMENT_FLAG_ENABLED) {
>                 reg |= VDPU_REG_FWD_PIC1_SEGMENT_E;
> -               if (seg->flags & V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP)
> +               if (seg->flags & V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP)
>                         reg |= VDPU_REG_FWD_PIC1_SEGMENT_UPD_E;
>         }
>         vdpu_write_relaxed(vpu, reg, VDPU_REG_VP8_SEGMENT_VAL);
> @@ -506,7 +506,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>
>  void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
>  {
> -       const struct v4l2_ctrl_vp8_frame_header *hdr;
> +       const struct v4l2_ctrl_vp8_frame *hdr;
>         struct hantro_dev *vpu = ctx->dev;
>         size_t height = ctx->dst_fmt.height;
>         size_t width = ctx->dst_fmt.width;
> @@ -515,7 +515,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
>
>         hantro_start_prepare_run(ctx);
>
> -       hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
> +       hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME);
>         if (WARN_ON(!hdr))
>                 return;
>
> @@ -555,9 +555,9 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
>         reg = VDPU_REG_DEC_CTRL0_DEC_MODE(10);
>         vdpu_write_relaxed(vpu, reg, VDPU_REG_DEC_FORMAT);
>
> -       if (!(hdr->flags & V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF))
> +       if (!(hdr->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF))
>                 hantro_reg_write(vpu, &vp8_dec_skip_mode, 1);
> -       if (hdr->lf_header.level == 0)
> +       if (hdr->lf.level == 0)
>                 hantro_reg_write(vpu, &vp8_dec_filter_disable, 1);
>
>         /* Frame dimensions */
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 7bd9291c8d5f..e233feb49c9c 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -147,7 +147,7 @@ static const struct cedrus_control cedrus_controls[] = {
>         },
>         {
>                 .cfg = {
> -                       .id             = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
> +                       .id     = V4L2_CID_MPEG_VIDEO_VP8_FRAME,
>                 },
>                 .codec          = CEDRUS_CODEC_VP8,
>         },
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 251a6a660351..15f147dad4cb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -79,7 +79,7 @@ struct cedrus_h265_run {
>  };
>
>  struct cedrus_vp8_run {
> -       const struct v4l2_ctrl_vp8_frame_header         *frame_params;
> +       const struct v4l2_ctrl_vp8_frame                *frame_params;
>  };
>
>  struct cedrus_run {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index a9090daf626a..b0a0559cd0eb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -72,7 +72,7 @@ void cedrus_device_run(void *priv)
>
>         case V4L2_PIX_FMT_VP8_FRAME:
>                 run.vp8.frame_params = cedrus_find_control_data(ctx,
> -                       V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER);
> +                       V4L2_CID_MPEG_VIDEO_VP8_FRAME);
>                 break;
>
>         default:
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> index ff613ebd1180..cab0770515c5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -522,7 +522,7 @@ static void cedrus_irq_clear(struct cedrus_dev *dev)
>  }
>
>  static void cedrus_read_header(struct cedrus_dev *dev,
> -                              const struct v4l2_ctrl_vp8_frame_header *slice)
> +                              const struct v4l2_ctrl_vp8_frame *slice)
>  {
>         int i, j;
>
> @@ -590,34 +590,34 @@ static void cedrus_read_header(struct cedrus_dev *dev,
>         }
>  }
>
> -static void cedrus_vp8_update_probs(const struct v4l2_ctrl_vp8_frame_header *slice,
> +static void cedrus_vp8_update_probs(const struct v4l2_ctrl_vp8_frame *slice,
>                                     u8 *prob_table)
>  {
>         int i, j, k;
>
> -       memcpy(&prob_table[0x1008], slice->entropy_header.y_mode_probs,
> -              sizeof(slice->entropy_header.y_mode_probs));
> -       memcpy(&prob_table[0x1010], slice->entropy_header.uv_mode_probs,
> -              sizeof(slice->entropy_header.uv_mode_probs));
> +       memcpy(&prob_table[0x1008], slice->entropy.y_mode_probs,
> +              sizeof(slice->entropy.y_mode_probs));
> +       memcpy(&prob_table[0x1010], slice->entropy.uv_mode_probs,
> +              sizeof(slice->entropy.uv_mode_probs));
>
> -       memcpy(&prob_table[0x1018], slice->segment_header.segment_probs,
> -              sizeof(slice->segment_header.segment_probs));
> +       memcpy(&prob_table[0x1018], slice->seg.segment_probs,
> +              sizeof(slice->seg.segment_probs));
>
>         prob_table[0x101c] = slice->prob_skip_false;
>         prob_table[0x101d] = slice->prob_intra;
>         prob_table[0x101e] = slice->prob_last;
>         prob_table[0x101f] = slice->prob_gf;
>
> -       memcpy(&prob_table[0x1020], slice->entropy_header.mv_probs[0],
> +       memcpy(&prob_table[0x1020], slice->entropy.mv_probs[0],
>                V4L2_VP8_MV_PROB_CNT);
> -       memcpy(&prob_table[0x1040], slice->entropy_header.mv_probs[1],
> +       memcpy(&prob_table[0x1040], slice->entropy.mv_probs[1],
>                V4L2_VP8_MV_PROB_CNT);
>
>         for (i = 0; i < 4; ++i)
>                 for (j = 0; j < 8; ++j)
>                         for (k = 0; k < 3; ++k)
>                                 memcpy(&prob_table[i * 512 + j * 64 + k * 16],
> -                                      slice->entropy_header.coeff_probs[i][j][k], 11);
> +                                      slice->entropy.coeff_probs[i][j][k], 11);
>  }
>
>  static enum cedrus_irq_status
> @@ -653,7 +653,7 @@ static void cedrus_vp8_irq_disable(struct cedrus_ctx *ctx)
>  static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>                              struct cedrus_run *run)
>  {
> -       const struct v4l2_ctrl_vp8_frame_header *slice = run->vp8.frame_params;
> +       const struct v4l2_ctrl_vp8_frame *slice = run->vp8.frame_params;
>         struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
>         struct vb2_buffer *src_buf = &run->src->vb2_buf;
>         struct cedrus_dev *dev = ctx->dev;
> @@ -719,34 +719,34 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>                 reg |= VE_VP8_PPS_FULL_PIXEL;
>                 break;
>         }
> -       if (slice->segment_header.flags & V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP)
> +       if (slice->seg.flags & V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP)
>                 reg |= VE_VP8_PPS_UPDATE_MB_SEGMENTATION_MAP;
> -       if (!(slice->segment_header.flags & V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE))
> +       if (!(slice->seg.flags & V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE))
>                 reg |= VE_VP8_PPS_MB_SEGMENT_ABS_DELTA;
> -       if (slice->segment_header.flags & V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED)
> +       if (slice->seg.flags & V4L2_VP8_SEGMENT_FLAG_ENABLED)
>                 reg |= VE_VP8_PPS_SEGMENTATION_ENABLE;
>         if (ctx->codec.vp8.last_filter_type)
>                 reg |= VE_VP8_PPS_LAST_LOOP_FILTER_SIMPLE;
> -       reg |= VE_VP8_PPS_SHARPNESS_LEVEL(slice->lf_header.sharpness_level);
> -       if (slice->lf_header.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE)
> +       reg |= VE_VP8_PPS_SHARPNESS_LEVEL(slice->lf.sharpness_level);
> +       if (slice->lf.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE)
>                 reg |= VE_VP8_PPS_LOOP_FILTER_SIMPLE;
> -       reg |= VE_VP8_PPS_LOOP_FILTER_LEVEL(slice->lf_header.level);
> -       if (slice->lf_header.flags & V4L2_VP8_LF_HEADER_ADJ_ENABLE)
> +       reg |= VE_VP8_PPS_LOOP_FILTER_LEVEL(slice->lf.level);
> +       if (slice->lf.flags & V4L2_VP8_LF_ADJ_ENABLE)
>                 reg |= VE_VP8_PPS_MODE_REF_LF_DELTA_ENABLE;
> -       if (slice->lf_header.flags & V4L2_VP8_LF_HEADER_DELTA_UPDATE)
> +       if (slice->lf.flags & V4L2_VP8_LF_DELTA_UPDATE)
>                 reg |= VE_VP8_PPS_MODE_REF_LF_DELTA_UPDATE;
>         reg |= VE_VP8_PPS_TOKEN_PARTITION(ilog2(slice->num_dct_parts));
> -       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF)
> +       if (slice->flags & V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF)
>                 reg |= VE_VP8_PPS_MB_NO_COEFF_SKIP;
>         reg |= VE_VP8_PPS_RELOAD_ENTROPY_PROBS;
> -       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN)
> +       if (slice->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN)
>                 reg |= VE_VP8_PPS_GOLDEN_SIGN_BIAS;
> -       if (slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT)
> +       if (slice->flags & V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT)
>                 reg |= VE_VP8_PPS_ALTREF_SIGN_BIAS;
>         if (ctx->codec.vp8.last_frame_p_type)
>                 reg |= VE_VP8_PPS_LAST_PIC_TYPE_P_FRAME;
>         reg |= VE_VP8_PPS_LAST_SHARPNESS_LEVEL(ctx->codec.vp8.last_sharpness_level);
> -       if (!(slice->flags & V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME))
> +       if (!(slice->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
>                 reg |= VE_VP8_PPS_PIC_TYPE_P_FRAME;
>         cedrus_write(dev, VE_VP8_PPS, reg);
>
> @@ -758,12 +758,12 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>         cedrus_write(dev, VE_H264_ERROR_CASE, 0);
>
>         reg = 0;
> -       reg |= VE_VP8_QP_INDEX_DELTA_UVAC(slice->quant_header.uv_ac_delta);
> -       reg |= VE_VP8_QP_INDEX_DELTA_UVDC(slice->quant_header.uv_dc_delta);
> -       reg |= VE_VP8_QP_INDEX_DELTA_Y2AC(slice->quant_header.y2_ac_delta);
> -       reg |= VE_VP8_QP_INDEX_DELTA_Y2DC(slice->quant_header.y2_dc_delta);
> -       reg |= VE_VP8_QP_INDEX_DELTA_Y1DC(slice->quant_header.y_dc_delta);
> -       reg |= VE_VP8_QP_INDEX_DELTA_BASE_QINDEX(slice->quant_header.y_ac_qi);
> +       reg |= VE_VP8_QP_INDEX_DELTA_UVAC(slice->quant.uv_ac_delta);
> +       reg |= VE_VP8_QP_INDEX_DELTA_UVDC(slice->quant.uv_dc_delta);
> +       reg |= VE_VP8_QP_INDEX_DELTA_Y2AC(slice->quant.y2_ac_delta);
> +       reg |= VE_VP8_QP_INDEX_DELTA_Y2DC(slice->quant.y2_dc_delta);
> +       reg |= VE_VP8_QP_INDEX_DELTA_Y1DC(slice->quant.y_dc_delta);
> +       reg |= VE_VP8_QP_INDEX_DELTA_BASE_QINDEX(slice->quant.y_ac_qi);
>         cedrus_write(dev, VE_VP8_QP_INDEX_DELTA, reg);
>
>         reg = 0;
> @@ -777,31 +777,31 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>         cedrus_write(dev, VE_VP8_PICSIZE, reg);
>
>         reg = 0;
> -       reg |= VE_VP8_SEGMENT3(slice->segment_header.quant_update[3]);
> -       reg |= VE_VP8_SEGMENT2(slice->segment_header.quant_update[2]);
> -       reg |= VE_VP8_SEGMENT1(slice->segment_header.quant_update[1]);
> -       reg |= VE_VP8_SEGMENT0(slice->segment_header.quant_update[0]);
> +       reg |= VE_VP8_SEGMENT3(slice->seg.quant_update[3]);
> +       reg |= VE_VP8_SEGMENT2(slice->seg.quant_update[2]);
> +       reg |= VE_VP8_SEGMENT1(slice->seg.quant_update[1]);
> +       reg |= VE_VP8_SEGMENT0(slice->seg.quant_update[0]);
>         cedrus_write(dev, VE_VP8_SEGMENT_FEAT_MB_LV0, reg);
>
>         reg = 0;
> -       reg |= VE_VP8_SEGMENT3(slice->segment_header.lf_update[3]);
> -       reg |= VE_VP8_SEGMENT2(slice->segment_header.lf_update[2]);
> -       reg |= VE_VP8_SEGMENT1(slice->segment_header.lf_update[1]);
> -       reg |= VE_VP8_SEGMENT0(slice->segment_header.lf_update[0]);
> +       reg |= VE_VP8_SEGMENT3(slice->seg.lf_update[3]);
> +       reg |= VE_VP8_SEGMENT2(slice->seg.lf_update[2]);
> +       reg |= VE_VP8_SEGMENT1(slice->seg.lf_update[1]);
> +       reg |= VE_VP8_SEGMENT0(slice->seg.lf_update[0]);
>         cedrus_write(dev, VE_VP8_SEGMENT_FEAT_MB_LV1, reg);
>
>         reg = 0;
> -       reg |= VE_VP8_LF_DELTA3(slice->lf_header.ref_frm_delta[3]);
> -       reg |= VE_VP8_LF_DELTA2(slice->lf_header.ref_frm_delta[2]);
> -       reg |= VE_VP8_LF_DELTA1(slice->lf_header.ref_frm_delta[1]);
> -       reg |= VE_VP8_LF_DELTA0(slice->lf_header.ref_frm_delta[0]);
> +       reg |= VE_VP8_LF_DELTA3(slice->lf.ref_frm_delta[3]);
> +       reg |= VE_VP8_LF_DELTA2(slice->lf.ref_frm_delta[2]);
> +       reg |= VE_VP8_LF_DELTA1(slice->lf.ref_frm_delta[1]);
> +       reg |= VE_VP8_LF_DELTA0(slice->lf.ref_frm_delta[0]);
>         cedrus_write(dev, VE_VP8_REF_LF_DELTA, reg);
>
>         reg = 0;
> -       reg |= VE_VP8_LF_DELTA3(slice->lf_header.mb_mode_delta[3]);
> -       reg |= VE_VP8_LF_DELTA2(slice->lf_header.mb_mode_delta[2]);
> -       reg |= VE_VP8_LF_DELTA1(slice->lf_header.mb_mode_delta[1]);
> -       reg |= VE_VP8_LF_DELTA0(slice->lf_header.mb_mode_delta[0]);
> +       reg |= VE_VP8_LF_DELTA3(slice->lf.mb_mode_delta[3]);
> +       reg |= VE_VP8_LF_DELTA2(slice->lf.mb_mode_delta[2]);
> +       reg |= VE_VP8_LF_DELTA1(slice->lf.mb_mode_delta[1]);
> +       reg |= VE_VP8_LF_DELTA0(slice->lf.mb_mode_delta[0]);
>         cedrus_write(dev, VE_VP8_MODE_LF_DELTA, reg);
>
>         luma_addr = cedrus_dst_buf_addr(ctx, run->dst->vb2_buf.index, 0);
> @@ -846,13 +846,13 @@ static void cedrus_vp8_setup(struct cedrus_ctx *ctx,
>                      VE_H264_CTRL_DECODE_ERR_INT |
>                      VE_H264_CTRL_SLICE_DECODE_INT);
>
> -       if (slice->lf_header.level) {
> +       if (slice->lf.level) {
>                 ctx->codec.vp8.last_filter_type =
> -                       !!(slice->lf_header.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE);
> +                       !!(slice->lf.flags & V4L2_VP8_LF_FILTER_TYPE_SIMPLE);
>                 ctx->codec.vp8.last_frame_p_type =
>                         !VP8_FRAME_IS_KEY_FRAME(slice);
>                 ctx->codec.vp8.last_sharpness_level =
> -                       slice->lf_header.sharpness_level;
> +                       slice->lf.sharpness_level;
>         }
>  }
>
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 167ca8c8424f..aa06ff1695fe 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -50,7 +50,7 @@ struct video_device;
>   * @p_h264_slice_params:       Pointer to a struct v4l2_ctrl_h264_slice_params.
>   * @p_h264_decode_params:      Pointer to a struct v4l2_ctrl_h264_decode_params.
>   * @p_h264_pred_weights:       Pointer to a struct v4l2_ctrl_h264_pred_weights.
> - * @p_vp8_frame_header:                Pointer to a VP8 frame header structure.
> + * @p_vp8_frame:               Pointer to a VP8 frame params structure.
>   * @p_hevc_sps:                        Pointer to an HEVC sequence parameter set structure.
>   * @p_hevc_pps:                        Pointer to an HEVC picture parameter set structure.
>   * @p_hevc_slice_params:       Pointer to an HEVC slice parameters structure.
> @@ -74,7 +74,7 @@ union v4l2_ctrl_ptr {
>         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
>         struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
>         struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
> -       struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> +       struct v4l2_ctrl_vp8_frame *p_vp8_frame;
>         struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>         struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>         struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
> index 3969550df148..86bb6e774604 100644
> --- a/include/media/vp8-ctrls.h
> +++ b/include/media/vp8-ctrls.h
> @@ -15,15 +15,15 @@
>
>  #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F')
>
> -#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (V4L2_CID_CODEC_BASE + 2000)
> -#define V4L2_CTRL_TYPE_VP8_FRAME_HEADER 0x301
> +#define V4L2_CID_MPEG_VIDEO_VP8_FRAME (V4L2_CID_CODEC_BASE + 2000)
> +#define V4L2_CTRL_TYPE_VP8_FRAME 0x301
>
> -#define V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED              0x01
> -#define V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_MAP           0x02
> -#define V4L2_VP8_SEGMENT_HEADER_FLAG_UPDATE_FEATURE_DATA  0x04
> -#define V4L2_VP8_SEGMENT_HEADER_FLAG_DELTA_VALUE_MODE     0x08
> +#define V4L2_VP8_SEGMENT_FLAG_ENABLED              0x01
> +#define V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP           0x02
> +#define V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA  0x04
> +#define V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE     0x08
>
> -struct v4l2_vp8_segment_header {
> +struct v4l2_vp8_segment {
>         __s8 quant_update[4];
>         __s8 lf_update[4];
>         __u8 segment_probs[3];
> @@ -31,10 +31,10 @@ struct v4l2_vp8_segment_header {
>         __u32 flags;
>  };
>
> -#define V4L2_VP8_LF_HEADER_ADJ_ENABLE  0x01
> -#define V4L2_VP8_LF_HEADER_DELTA_UPDATE        0x02
> +#define V4L2_VP8_LF_ADJ_ENABLE 0x01
> +#define V4L2_VP8_LF_DELTA_UPDATE       0x02
>  #define V4L2_VP8_LF_FILTER_TYPE_SIMPLE 0x04
> -struct v4l2_vp8_loopfilter_header {
> +struct v4l2_vp8_loopfilter {
>         __s8 ref_frm_delta[4];
>         __s8 mb_mode_delta[4];
>         __u8 sharpness_level;
> @@ -43,7 +43,7 @@ struct v4l2_vp8_loopfilter_header {
>         __u32 flags;
>  };
>
> -struct v4l2_vp8_quantization_header {
> +struct v4l2_vp8_quantization {
>         __u8 y_ac_qi;
>         __s8 y_dc_delta;
>         __s8 y2_dc_delta;
> @@ -55,7 +55,7 @@ struct v4l2_vp8_quantization_header {
>
>  #define V4L2_VP8_COEFF_PROB_CNT 11
>  #define V4L2_VP8_MV_PROB_CNT 19
> -struct v4l2_vp8_entropy_header {
> +struct v4l2_vp8_entropy {
>         __u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
>         __u8 y_mode_probs[4];
>         __u8 uv_mode_probs[3];
> @@ -70,21 +70,21 @@ struct v4l2_vp8_entropy_coder_state {
>         __u8 padding;
>  };
>
> -#define V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME           0x01
> -#define V4L2_VP8_FRAME_HEADER_FLAG_EXPERIMENTAL                0x02
> -#define V4L2_VP8_FRAME_HEADER_FLAG_SHOW_FRAME          0x04
> -#define V4L2_VP8_FRAME_HEADER_FLAG_MB_NO_SKIP_COEFF    0x08
> -#define V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_GOLDEN    0x10
> -#define V4L2_VP8_FRAME_HEADER_FLAG_SIGN_BIAS_ALT       0x20
> +#define V4L2_VP8_FRAME_FLAG_KEY_FRAME          0x01
> +#define V4L2_VP8_FRAME_FLAG_EXPERIMENTAL               0x02
> +#define V4L2_VP8_FRAME_FLAG_SHOW_FRAME         0x04
> +#define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF   0x08
> +#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN   0x10
> +#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT      0x20
>
>  #define VP8_FRAME_IS_KEY_FRAME(hdr) \
> -       (!!((hdr)->flags & V4L2_VP8_FRAME_HEADER_FLAG_KEY_FRAME))
> +       (!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
>
> -struct v4l2_ctrl_vp8_frame_header {
> -       struct v4l2_vp8_segment_header segment_header;
> -       struct v4l2_vp8_loopfilter_header lf_header;
> -       struct v4l2_vp8_quantization_header quant_header;
> -       struct v4l2_vp8_entropy_header entropy_header;
> +struct v4l2_ctrl_vp8_frame {
> +       struct v4l2_vp8_segment seg;

Sorry, I see the PR for this has already been sent, but why rename it
to "seg" instead of "segment"?

> +       struct v4l2_vp8_loopfilter lf;
> +       struct v4l2_vp8_quantization quant;
> +       struct v4l2_vp8_entropy entropy;
>         struct v4l2_vp8_entropy_coder_state coder_state;
>
>         __u16 width;
> --
> 2.30.0
>

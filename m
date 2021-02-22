Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C66322111
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 22:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhBVVBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 16:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBVVBm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 16:01:42 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC647C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 13:01:01 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 204so9175228qke.11
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 13:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6K4/mBbSnPNCHknLHCRkmYyf35khcBGrazvAgUyZabU=;
        b=VVFlCwNES6gwNIdwJYWODbJwOMnhphuU/6E+kkEz+xDrsdoDQVpW9qrg5TQrqjVjq+
         lZsL50F1Zw560UsvX7wxVWfXyAfF6cD7C13WxEgYTCpNr2QCz0po87hpaZmuuHY/56H6
         p4bDT2yEroCpOTp+upvlS8QbV0Jo4MSjWBxCmAHixEPSOWyQwSHkFdORBjyCJ4sZoEbn
         cOfxtkW/lnAlI0M+jwJWMkUgr85Sb2wM0CNFH8COwwNN0e+6DswEF4TkQxm1VOpPNGmC
         j86sNAAGecq5EzYd0mIPUay0vl3a8lVWqV7M9iE33iUUzuk7bFA1qMwIi/y0EVMZdkze
         9tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6K4/mBbSnPNCHknLHCRkmYyf35khcBGrazvAgUyZabU=;
        b=uHilpbSUxHw2VlFTLZq/DVjETvDRhnfMPYHDfjecJBp8Z5U+DvhWMvTpAYOUVSYJPB
         CeyeeRCVcGGP1E6OfVkcVxhwSUsvymAB+4hKpxKrerCo8+a5FowMbybUozsuSRgauOzp
         vIzq7s/+U4uiXId5019vNV9oBPZl1/DcklF2lHFCOkHzXvLnp1XjBowkPyF7IlyKDErN
         lCSg0i7HtiB7/QRk2b+GQaVRO3OGIaMQV5/h9Gj+oV40bwXRqTOFCbMuamel53RuAt8p
         zPdHHASd56JmQ7yLPUGgU2AXpFy1MjdorlO/7pTXVtklCAyMLJ2JocNpgVeVoA8D319R
         y/4w==
X-Gm-Message-State: AOAM531kKG9cS2sfh3BRPO2VD5Q1tI4Wb4VrGbbVlpmBZy0BmNI61eMp
        zhHK4OQGQuX4DuEeYvQksutE6A==
X-Google-Smtp-Source: ABdhPJyQXk5WKFLWx7/fyHp5v6hn4IRjh7aA3KcsJBq0KxfHE5OWvIzGZ8hCCzPrkuNDVYE7WhEnJQ==
X-Received: by 2002:a37:dd7:: with SMTP id 206mr22652012qkn.306.1614027660325;
        Mon, 22 Feb 2021 13:01:00 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id l65sm5468928qkf.113.2021.02.22.13.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 13:00:59 -0800 (PST)
Message-ID: <7ab687c91b971219efb510aeb3ac9792ba8081dc.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Daniel Almeida <dwlsalmeida@collabora.com>
Date:   Mon, 22 Feb 2021 16:00:56 -0500
In-Reply-To: <20201102190551.1223389-3-adrian.ratiu@collabora.com>
References: <20201102190551.1223389-1-adrian.ratiu@collabora.com>
         <20201102190551.1223389-3-adrian.ratiu@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Le lundi 02 novembre 2020 à 21:05 +0200, Adrian Ratiu a écrit :
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add the VP9 stateless decoder controls plus the documentation that goes
> with it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |  10 +
>  .../media/v4l/ext-ctrls-codec.rst             | 550 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 239 ++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   5 +
>  include/media/vp9-ctrls.h                     | 486 ++++++++++++++++
>  6 files changed, 1291 insertions(+)
>  create mode 100644 include/media/vp9-ctrls.h
> 
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst
> b/Documentation/userspace-api/media/v4l/biblio.rst
> index 7869b6f6ff72..6b4a83b053f5 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -407,3 +407,13 @@ VP8
>  :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
>  
>  :author:    J. Bankoski et al.
> +
> +.. _vp9:
> +
> +VP9
> +===
> +
> +
> +:title:     VP9 Bitstream & Decoding Process Specification
> +
> +:author:    Adrian Grange (Google), Peter de Rivaz (Argon Design), Jonathan
> Hunt (Argon Design)
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ce728c757eaf..456488f2b5ca 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2730,6 +2730,556 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>        - ``padding[3]``
>        - Applications and drivers must set this to zero.
>  
> +.. _v4l2-mpeg-vp9:
> +
> +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0..3) (struct)``
> +    Stores VP9 probabilities attached to a specific frame context. The VP9
> +    specification allows using a maximum of 4 contexts. Each frame being
> +    decoded refers to one of those context. See section '7.1.2 Refresh
> +    probs semantics' section of :ref:`vp9` for more details about these
> +    contexts.
> +
> +    This control is bi-directional:
> +
> +    * all 4 contexts must be initialized by userspace just after the
> +      stream is started and before the first decoding request is submitted.
> +    * the referenced context might be read by the kernel when a decoding
> +      request is submitted, and will be updated after the decoder is done
> +      decoding the frame if the `V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX` flag
> +      is set.
> +    * contexts will be read back by user space before each decoding request
> +      to retrieve the updated probabilities.
> +    * userspace will re-initialize the context to their default values when
> +      a reset context is required.

We are currently debating this in/out controls. We have identified that this
controls requires a lock/step decoding flow.

  request(), wait(), read_ctl(), ...

Otherwise the reading of the control would become racy, and in fact, you can't
really queue any new request, since the request depends on having the
probabilities updated from the counts/stats resulting of the decoding process.
We believe this mechanism will have a negative impact on the performance. We
already showed visible framerate gain by keeping the OUTPUT filled with RKVDEC
H.264.

Let's share a bit more details about this control. It is important to mention
that this control does not exist in any other stateless API (VA-VAPI and DXVA at
least). Each VP9 frames have two headers, the uncompressed and the compressed
headers. The compressed headers is mostly formed by the probability updates.
Effectively one of the compression method in VP9 is to use probabilities to
compress further the bitstream values. As the probabilities take space to store,
these are also compressed and expressed as deltas over computed statistics
during the decoding process (the decoder counts the occurence of specific values
for specific field).

It our case, the HW does not parse the compressed headers. This means the CPU
needs to be involved to update the probabilities. As per chromium code, it looks
like not all ChromeOS HW driver needed that control:

https://chromium.googlesource.com/chromium/src/+/master/media/gpu/v4l2/v4l2_vp9_accelerator_legacy.cc#190

What we'd like to attempt, is to try and turn this CODEC API in a way so we only
push work to the decoder, rather then doing push / pull. As a PoC we'll try and
parse the compressed headers, so that the handling of probabilities will
entirely be inside the kernel. We don't know yet how much parsing this will
represent. If that feels too risky (parsing variable length coding is not the
most tempting thing to do in a kernel), we'll have to try and find some hybrid
solution. One thing we seem to observe is that the parsing of the compressed
headers is not strictly dependent on having the updated probabilities. So we may
also try to store the probability updates in order to deffer the update of the
probabilities that would stay stored in the kernel.

Note that parsing the compressed header may have some impact on the ability to
carry encrypted (aka DRM) content. It would be very nice if someone with
knowledge would provide us pointers if the compressed headers is included in the
encrypted part for VP9.

regards,
Nicolas


> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_ctrl_vp9_frame_ctx
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp9_frame_ctx
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - struct :c:type:`v4l2_vp9_probabilities`
> +      - ``probs``
> +      - Structure with VP9 probabilities attached to the context.
> +
> +.. c:type:: v4l2_vp9_probabilities
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_probabilities
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``tx8[2][1]``
> +      - TX 8x8 probabilities.
> +    * - __u8
> +      - ``tx16[2][2]``
> +      - TX 16x16 probabilities.
> +    * - __u8
> +      - ``tx32[2][3]``
> +      - TX 32x32 probabilities.
> +    * - __u8
> +      - ``coef[4][2][2][6][6][3]``
> +      - Coefficient probabilities.
> +    * - __u8
> +      - ``skip[3]``
> +      - Skip probabilities.
> +    * - __u8
> +      - ``inter_mode[7][3]``
> +      - Inter prediction mode probabilities.
> +    * - __u8
> +      - ``interp_filter[4][2]``
> +      - Interpolation filter probabilities.
> +    * - __u8
> +      - ``is_inter[4]``
> +      - Is inter-block probabilities.
> +    * - __u8
> +      - ``comp_mode[5]``
> +      - Compound prediction mode probabilities.
> +    * - __u8
> +      - ``single_ref[5][2]``
> +      - Single reference probabilities.
> +    * - __u8
> +      - ``comp_mode[5]``
> +      - Compound reference probabilities.
> +    * - __u8
> +      - ``y_mode[4][9]``
> +      - Y prediction mode probabilities.
> +    * - __u8
> +      - ``uv_mode[10][9]``
> +      - UV prediction mode probabilities.
> +    * - __u8
> +      - ``partition[16][3]``
> +      - Partition probabilities.
> +    * - __u8
> +      - ``mv.joint[3]``
> +      - Motion vector joint probabilities.
> +    * - __u8
> +      - ``mv.sign[2]``
> +      - Motion vector sign probabilities.
> +    * - __u8
> +      - ``mv.class[2][10]``
> +      - Motion vector class probabilities.
> +    * - __u8
> +      - ``mv.class0_bit[2]``
> +      - Motion vector class0 bit probabilities.
> +    * - __u8
> +      - ``mv.bits[2][10]``
> +      - Motion vector bits probabilities.
> +    * - __u8
> +      - ``mv.class0_fr[2][2][3]``
> +      - Motion vector class0 fractional bit probabilities.
> +    * - __u8
> +      - ``mv.fr[2][3]``
> +      - Motion vector fractional bit probabilities.
> +    * - __u8
> +      - ``mv.class0_hp[2]``
> +      - Motion vector class0 high precision fractional bit probabilities.
> +    * - __u8
> +      - ``mv.hp[2]``
> +      - Motion vector high precision fractional bit probabilities.
> +
> +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS (struct)``
> +    Specifies the frame parameters for the associated VP9 frame decode
> request.
> +    This includes the necessary parameters for configuring a stateless
> hardware
> +    decoding pipeline for VP9. The bitstream parameters are defined according
> +    to :ref:`vp9`.
> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_ctrl_vp9_frame_decode_params
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp9_frame_decode_params
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``flags``
> +      - Combination of V4L2_VP9_FRAME_FLAG_* flags. See
> +        :c:type:`v4l2_vp9_frame_flags`.
> +    * - __u16
> +      - ``compressed_header_size``
> +      - Compressed header size in bytes.
> +    * - __u16
> +      - ``uncompressed_header_size``
> +      - Uncompressed header size in bytes.
> +    * - __u8
> +      - ``profile``
> +      - VP9 profile. Can be 0, 1, 2 or 3.
> +    * - __u8
> +      - ``reset_frame_context``
> +      - Frame context that should be used/updated when decoding the frame.
> +    * - __u8
> +      - ``bit_depth``
> +      - Component depth in bits. Must be 8 for profile 0 and 1. Must 10 or 12
> +        for profile 2 and 3.
> +    * - __u8
> +      - ``interpolation_filter``
> +      - Specifies the filter selection used for performing inter prediction.
> See
> +        :c:type:`v4l2_vp9_interpolation_filter`.
> +    * - __u8
> +      - ``tile_cols_log2``
> +      - Specifies the base 2 logarithm of the width of each tile (where the
> +        width is measured in units of 8x8 blocks). Shall be less than or
> equal
> +        to 6.
> +    * - __u8
> +      - ``tile_rows_log2``
> +      - Specifies the base 2 logarithm of the height of each tile (where the
> +        height is measured in units of 8x8 blocks)
> +    * - __u8
> +      - ``tx_mode``
> +      - Specifies the TX mode. See :c:type:`v4l2_vp9_tx_mode`.
> +    * - __u8
> +      - ``reference_mode``
> +      - Specifies the type of inter prediction to be used. See
> +        :c:type:`v4l2_vp9_reference_mode`.
> +    * - __u8
> +      - ``padding[7]``
> +      - Needed to make this struct 64 bit aligned. Shall be filled with
> zeroes.
> +    * - __u16
> +      - ``frame_width_minus_1``
> +      - Add 1 to get the frame width expressed in pixels.
> +    * - __u16
> +      - ``frame_height_minus_1``
> +      - Add 1 to get the frame height expressed in pixels.
> +    * - __u16
> +      - ``frame_width_minus_1``
> +      - Add 1 to get the expected render width expressed in pixels. This is
> +        not used during the decoding process but might be used by HW scalers
> to
> +        prepare a frame that's ready for scanout.
> +    * - __u16
> +      - frame_height_minus_1
> +      - Add 1 to get the expected render height expressed in pixels. This is
> +        not used during the decoding process but might be used by HW scalers
> to
> +        prepare a frame that's ready for scanout.
> +    * - __u64
> +      - ``refs[3]``
> +      - Array of reference frame timestamps.
> +    * - struct :c:type:`v4l2_vp9_loop_filter`
> +      - ``lf``
> +      - Loop filter parameters. See struct :c:type:`v4l2_vp9_loop_filter`.
> +    * - struct :c:type:`v4l2_vp9_quantization`
> +      - ``quant``
> +      - Quantization parameters. See :c:type:`v4l2_vp9_quantization`.
> +    * - struct :c:type:`v4l2_vp9_segmentation`
> +      - ``seg``
> +      - Segmentation parameters. See :c:type:`v4l2_vp9_segmentation`.
> +    * - struct :c:type:`v4l2_vp9_probabilities`
> +      - ``probs``
> +      - Probabilities. See :c:type:`v4l2_vp9_probabilities`.
> +
> +.. c:type:: v4l2_vp9_frame_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_frame_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_FRAME_FLAG_KEY_FRAME``
> +      - The frame is a key frame.
> +    * - ``V4L2_VP9_FRAME_FLAG_SHOW_FRAME``
> +      - The frame should be displayed.
> +    * - ``V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT``
> +      - The decoding should be error resilient.
> +    * - ``V4L2_VP9_FRAME_FLAG_INTRA_ONLY``
> +      - The frame does not reference other frames.
> +    * - ``V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV``
> +      - the frame might can high precision motion vectors.
> +    * - ``V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX``
> +      - Frame context should be updated after decoding.
> +    * - ``V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE``
> +      - Parallel decoding is used.
> +    * - ``V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING``
> +      - Vertical subsampling is enabled.
> +    * - ``V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING``
> +      - Horizontal subsampling is enabled.
> +    * - ``V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING``
> +      - The full UV range is used.
> +
> +.. c:type:: v4l2_vp9_ref_id
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_ref_id
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_REF_ID_LAST``
> +      - Last reference frame.
> +    * - ``V4L2_REF_ID_GOLDEN``
> +      - Golden reference frame.
> +    * - ``V4L2_REF_ID_ALTREF``
> +      - Alternative reference frame.
> +    * - ``V4L2_REF_ID_CNT``
> +      - Number of reference frames.
> +
> +.. c:type:: v4l2_vp9_tx_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_tx_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_TX_MODE_ONLY_4X4``
> +      - Transform size is 4x4.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_8X8``
> +      - Transform size can be up to 8x8.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_16X16``
> +      - Transform size can be up to 16x16.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_32X32``
> +      - transform size can be up to 32x32.
> +    * - ``V4L2_VP9_TX_MODE_SELECT``
> +      - Bitstream contains transform size for each block.
> +
> +.. c:type:: v4l2_vp9_reference_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_reference_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_REF_MODE_SINGLE``
> +      - Indicates that all the inter blocks use only a single reference frame
> +        to generate motion compensated prediction.
> +    * - ``V4L2_VP9_REF_MODE_COMPOUND``
> +      - Requires all the inter blocks to use compound mode. Single reference
> +        frame prediction is not allowed.
> +    * - ``V4L2_VP9_REF_MODE_SELECT``
> +      - Allows each individual inter block to select between single and
> +        compound prediction modes.
> +
> +.. c:type:: v4l2_vp9_interpolation_filter
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_interpolation_filter
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP``
> +      - Height tap filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH``
> +      - Height tap smooth filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SHARP``
> +      - Height tap sharp filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_BILINEAR``
> +      - Bilinear filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_SWITCHABLE``
> +      - Filter selection is signaled at the block level.
> +
> +.. c:type:: v4l2_vp9_reset_frame_context
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_reset_frame_context
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> +      - Do not reset any frame context.
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_SPEC``
> +      - Reset the frame context pointed by
> +        :c:type:`v4l2_ctrl_vp9_frame_decode_params`.frame_context_idx.
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_ALL``
> +      - Reset all frame contexts.
> +
> +.. c:type:: v4l2_vp9_intra_prediction_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_intra_prediction_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_INTRA_PRED_DC``
> +      - DC intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_V``
> +      - Vertical intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_H``
> +      - Horizontal intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D45``
> +      - D45 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D135``
> +      - D135 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D117``
> +      - D117 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D153``
> +      - D153 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D207``
> +      - D207 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D63``
> +      - D63 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_TM``
> +      - True motion intra prediction.
> +
> +.. c:type:: v4l2_vp9_segmentation
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_segmentation
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``flags``
> +      - Combination of V4L2_VP9_SEGMENTATION_FLAG_* flags. See
> +        :c:type:`v4l2_vp9_segmentation_flags`.
> +    * - __u8
> +      - ``tree_probs[7]``
> +      - Specifies the probability values to be used when decoding a Segment-
> ID.
> +        See '5.15. Segmentation map' section of :ref:`vp9` for more details.
> +    * - __u8
> +      - ``pred_prob[3]``
> +      - Specifies the probability values to be used when decoding a
> +        Predicted-Segment-ID. See '6.4.14. Get segment id syntax'
> +        section of :ref:`vp9` for more details.
> +    * - __u8
> +      - ``padding[5]``
> +      - Used to align this struct on 64 bit. Shall be filled with zeroes.
> +    * - __u8
> +      - ``feature_enabled[8]``
> +      - Bitmask defining which features are enabled in each segment.
> +    * - __u8
> +      - ``feature_data[8][4]``
> +      - Data attached to each feature. Data entry is only valid if the
> feature
> +        is enabled.
> +
> +.. c:type:: v4l2_vp9_segment_feature
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_segment_feature
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_QP_DELTA``
> +      - QP delta segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_LF``
> +      - Loop filter segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_REF_FRAME``
> +      - Reference frame segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_SKIP``
> +      - Skip segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_CNT``
> +      - Number of segment features.
> +
> +.. c:type:: v4l2_vp9_segmentation_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_segmentation_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ENABLED``
> +      - Indicates that this frame makes use of the segmentation tool.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP``
> +      - Indicates that the segmentation map should be updated during the
> +        decoding of this frame.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE``
> +      - Indicates that the updates to the segmentation map are coded
> +        relative to the existing segmentation map.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA``
> +      - Indicates that new parameters are about to be specified for each
> +        segment.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE``
> +      - Indicates that the segmentation parameters represent the actual
> values
> +        to be used.
> +
> +.. c:type:: v4l2_vp9_quantization
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_quantization
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``base_q_idx``
> +      - Indicates the base frame qindex.
> +    * - __s8
> +      - ``delta_q_y_dc``
> +      - Indicates the Y DC quantizer relative to base_q_idx.
> +    * - __s8
> +      - ``delta_q_uv_dc``
> +      - Indicates the UV DC quantizer relative to base_q_idx.
> +    * - __s8
> +      - ``delta_q_uv_ac``
> +      - Indicates the UV AC quantizer relative to base_q_idx.
> +    * - __u8
> +      - ``padding[4]``
> +      - Padding bytes used to align this struct on 64 bit. Must be set to 0.
> +
> +.. c:type:: v4l2_vp9_loop_filter
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_loop_filter
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``flags``
> +      - Combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags.
> +        See :c:type:`v4l2_vp9_loop_filter_flags`.
> +    * - __u8
> +      - ``level``
> +      - Indicates the loop filter strength.
> +    * - __u8
> +      - ``sharpness``
> +      - Indicates the sharpness level.
> +    * - __s8
> +      - ``ref_deltas[4]``
> +      - Contains the adjustment needed for the filter level based on the
> chosen
> +        reference frame.
> +    * - __s8
> +      - ``mode_deltas[2]``
> +      - Contains the adjustment needed for the filter level based on the
> chosen
> +        mode
> +    * - __u8
> +      - ``level_lookup[8][4][2]``
> +      - Level lookup table.
> +
> +
> +.. c:type:: v4l2_vp9_loop_filter_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_loop_filter_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED``
> +      - When set, the filter level depends on the mode and reference frame
> used
> +        to predict a block.
> +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE``
> +      - When set, the bitstream contains additional syntax elements that
> +        specify which mode and reference frame deltas are to be updated.
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-
> core/v4l2-ctrls.c
> index bd7f330c941c..a88e962ac8a1 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -971,6 +971,11 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:                   return "VP9
> Profile";
>         case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:                     return "VP9
> Level";
>         case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:              return "VP8
> Frame Header";
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS:       return "VP9
> Frame Decode Parameters";
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0):          return "VP9
> Frame Context 0";
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(1):          return "VP9
> Frame Context 1";
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(2):          return "VP9
> Frame Context 2";
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(3):          return "VP9
> Frame Context 3";
>  
>         /* HEVC controls */
>         case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:               return "HEVC
> I-Frame QP Value";
> @@ -1452,6 +1457,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum
> v4l2_ctrl_type *type,
>         case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
>                 *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
>                 break;
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS:
> +               *type = V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS;
> +               break;
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0):
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(1):
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(2):
> +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(3):
> +               *type = V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT;
> +               break;
>         case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
>                 *type = V4L2_CTRL_TYPE_HEVC_SPS;
>                 break;
> @@ -1754,6 +1768,219 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>         0;                                                      \
>  })
>  
> +static int
> +validate_vp9_lf_params(struct v4l2_vp9_loop_filter *lf)
> +{
> +       unsigned int i, j, k;
> +
> +       if (lf->flags &
> +           ~(V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED |
> +             V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE))
> +               return -EINVAL;
> +
> +       /*
> +        * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED implies
> +        * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE.
> +        */
> +       if (lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE &&
> +           !(lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED))
> +               return -EINVAL;
> +
> +       /* That all values are in the accepted range. */
> +       if (lf->level > GENMASK(5, 0))
> +               return -EINVAL;
> +
> +       if (lf->sharpness > GENMASK(2, 0))
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {
> +               if (lf->ref_deltas[i] < -63 || lf->ref_deltas[i] > 63)
> +                       return -EINVAL;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {
> +               if (lf->mode_deltas[i] < -63 || lf->mode_deltas[i] > 63)
> +                       return -EINVAL;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lf->level_lookup); i++) {
> +               for (j = 0; j < ARRAY_SIZE(lf->level_lookup[0]); j++) {
> +                       for (k = 0; k < ARRAY_SIZE(lf->level_lookup[0][0]);
> k++) {
> +                               if (lf->level_lookup[i][j][k] > 63)
> +                                       return -EINVAL;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +validate_vp9_quant_params(struct v4l2_vp9_quantization *quant)
> +{
> +       if (quant->delta_q_y_dc < -15 || quant->delta_q_y_dc > 15 ||
> +           quant->delta_q_uv_dc < -15 || quant->delta_q_uv_dc > 15 ||
> +           quant->delta_q_uv_ac < -15 || quant->delta_q_uv_ac > 15)
> +               return -EINVAL;
> +
> +       memset(quant->padding, 0, sizeof(quant->padding));
> +       return 0;
> +}
> +
> +static int
> +validate_vp9_seg_params(struct v4l2_vp9_segmentation *seg)
> +{
> +       unsigned int i, j;
> +
> +       if (seg->flags &
> +           ~(V4L2_VP9_SEGMENTATION_FLAG_ENABLED |
> +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> +             V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE |
> +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA |
> +             V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE))
> +               return -EINVAL;
> +
> +       /*
> +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP and
> +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA imply
> +        * V4L2_VP9_SEGMENTATION_FLAG_ENABLED.
> +        */
> +       if ((seg->flags &
> +            (V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA)) &&
> +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED))
> +               return -EINVAL;
> +
> +       /*
> +        * V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE implies
> +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP.
> +        */
> +       if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE &&
> +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP))
> +               return -EINVAL;
> +
> +       /*
> +        * V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE implies
> +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA.
> +        */
> +       if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE &&
> +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA))
> +               return -EINVAL;
> +
> +       for (i = 0; i < ARRAY_SIZE(seg->feature_enabled); i++) {
> +               if (seg->feature_enabled[i] &
> +                   ~(V4L2_VP9_SEGMENT_FEATURE_QP_DELTA |
> +                     V4L2_VP9_SEGMENT_FEATURE_LF |
> +                     V4L2_VP9_SEGMENT_FEATURE_REF_FRAME |
> +                     V4L2_VP9_SEGMENT_FEATURE_SKIP))
> +                       return -EINVAL;
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(seg->feature_data); i++) {
> +               const int range[] = {255, 63, 3, 0};
> +
> +               for (j = 0; j < ARRAY_SIZE(seg->feature_data[j]); j++) {
> +                       if (seg->feature_data[i][j] < -range[j] ||
> +                           seg->feature_data[i][j] > range[j])
> +                               return -EINVAL;
> +               }
> +       }
> +
> +       memset(seg->padding, 0, sizeof(seg->padding));
> +       return 0;
> +}
> +
> +static int
> +validate_vp9_frame_decode_params(struct v4l2_ctrl_vp9_frame_decode_params
> *dec_params)
> +{
> +       int ret;
> +
> +       /* Make sure we're not passed invalid flags. */
> +       if (dec_params->flags &
> +           ~(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
> +             V4L2_VP9_FRAME_FLAG_SHOW_FRAME |
> +             V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT |
> +             V4L2_VP9_FRAME_FLAG_INTRA_ONLY |
> +             V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV |
> +             V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> +             V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
> +             V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +             V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING |
> +             V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING))
> +               return -EINVAL;
> +
> +       /*
> +        * The refresh context and error resilient flags are mutually
> exclusive.
> +        * Same goes for parallel decoding and error resilient modes.
> +        */
> +       if (dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT &&
> +           dec_params->flags &
> +           (V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> +            V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE))
> +               return -EINVAL;
> +
> +       if (dec_params->profile > V4L2_VP9_PROFILE_MAX)
> +               return -EINVAL;
> +
> +       if (dec_params->reset_frame_context > V4L2_VP9_RESET_FRAME_CTX_ALL)
> +               return -EINVAL;
> +
> +       if (dec_params->frame_context_idx >= V4L2_VP9_NUM_FRAME_CTX)
> +               return -EINVAL;
> +
> +       /*
> +        * Profiles 0 and 1 only support 8-bit depth, profiles 2 and 3 only 10
> +        * and 12 bit depths.
> +        */
> +       if ((dec_params->profile < 2 && dec_params->bit_depth != 8) ||
> +           (dec_params->profile >= 2 &&
> +            (dec_params->bit_depth != 10 && dec_params->bit_depth != 12)))
> +               return -EINVAL;
> +
> +       /* Profile 0 and 2 only accept YUV 4:2:0. */
> +       if ((dec_params->profile == 0 || dec_params->profile == 2) &&
> +           (!(dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) ||
> +            !(dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
> +               return -EINVAL;
> +
> +       /* Profile 1 and 3 only accept YUV 4:2:2, 4:4:0 and 4:4:4. */
> +       if ((dec_params->profile == 1 || dec_params->profile == 3) &&
> +           ((dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) &&
> +            (dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
> +               return -EINVAL;
> +
> +       if (dec_params->interpolation_filter >
> V4L2_VP9_INTERP_FILTER_SWITCHABLE)
> +               return -EINVAL;
> +
> +       /*
> +        * According to the spec, tile_cols_log2 shall be less than or equal
> +        * to 6.
> +        */
> +       if (dec_params->tile_cols_log2 > 6)
> +               return -EINVAL;
> +
> +       if (dec_params->tx_mode > V4L2_VP9_TX_MODE_SELECT)
> +               return -EINVAL;
> +
> +       if (dec_params->reference_mode > V4L2_VP9_REF_MODE_SELECT)
> +               return -EINVAL;
> +
> +       ret = validate_vp9_lf_params(&dec_params->lf);
> +       if (ret)
> +               return ret;
> +
> +       ret = validate_vp9_quant_params(&dec_params->quant);
> +       if (ret)
> +               return ret;
> +
> +       ret = validate_vp9_seg_params(&dec_params->seg);
> +       if (ret)
> +               return ret;
> +
> +       memset(dec_params->padding, 0, sizeof(dec_params->padding));
> +       return 0;
> +}
> +
>  /* Validate a new control */
>  
>  #define zero_padding(s) \
> @@ -1871,6 +2098,12 @@ static int std_validate_compound(const struct v4l2_ctrl
> *ctrl, u32 idx,
>                 zero_padding(p_vp8_frame_header->coder_state);
>                 break;
>  
> +       case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> +               return validate_vp9_frame_decode_params(p);
> +
> +       case V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT:
> +               break;
> +
>         case V4L2_CTRL_TYPE_HEVC_SPS:
>                 p_hevc_sps = p;
>  
> @@ -2617,6 +2850,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct
> v4l2_ctrl_handler *hdl,
>         case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
>                 elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
>                 break;
> +       case V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT:
> +               elem_size = sizeof(struct v4l2_ctrl_vp9_frame_ctx);
> +               break;
> +       case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> +               elem_size = sizeof(struct v4l2_ctrl_vp9_frame_decode_params);
> +               break;
>         case V4L2_CTRL_TYPE_HEVC_SPS:
>                 elem_size = sizeof(struct v4l2_ctrl_hevc_sps);
>                 break;
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index eeff398fbdcc..27595054eea0 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1427,6 +1427,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_VP8:          descr = "VP8"; break;
>                 case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
>                 case V4L2_PIX_FMT_VP9:          descr = "VP9"; break;
> +               case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>                 case V4L2_PIX_FMT_HEVC:         descr = "HEVC"; break; /* aka
> H.265 */
>                 case V4L2_PIX_FMT_HEVC_SLICE:   descr = "HEVC Parsed Slice
> Data"; break;
>                 case V4L2_PIX_FMT_FWHT:         descr = "FWHT"; break; /* used
> in vicodec */
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index cb25f345e9ad..fb299d83df6b 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -21,6 +21,7 @@
>  #include <media/fwht-ctrls.h>
>  #include <media/h264-ctrls.h>
>  #include <media/vp8-ctrls.h>
> +#include <media/vp9-ctrls.h>
>  #include <media/hevc-ctrls.h>
>  
>  /* forward references */
> @@ -53,6 +54,8 @@ struct video_device;
>   * @p_h264_decode_params:      Pointer to a struct
> v4l2_ctrl_h264_decode_params.
>   * @p_h264_pred_weights:       Pointer to a struct
> v4l2_ctrl_h264_pred_weights.
>   * @p_vp8_frame_header:                Pointer to a VP8 frame header
> structure.
> + * @p_vp9_frame_ctx:           Pointer to a VP9 frame context structure.
> + * @p_vp9_frame_decode_params: Pointer to a VP9 frame params structure.
>   * @p_hevc_sps:                        Pointer to an HEVC sequence parameter
> set structure.
>   * @p_hevc_pps:                        Pointer to an HEVC picture parameter
> set structure.
>   * @p_hevc_slice_params:       Pointer to an HEVC slice parameters structure.
> @@ -80,6 +83,8 @@ union v4l2_ctrl_ptr {
>         struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>         struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>         struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +       struct v4l2_ctrl_vp9_frame_ctx *p_vp9_frame_ctx;
> +       struct v4l2_ctrl_vp9_frame_decode_params *p_vp9_frame_decode_params;
>         struct v4l2_area *p_area;
>         void *p;
>         const void *p_const;
> diff --git a/include/media/vp9-ctrls.h b/include/media/vp9-ctrls.h
> new file mode 100644
> index 000000000000..a14fffb3ad61
> --- /dev/null
> +++ b/include/media/vp9-ctrls.h
> @@ -0,0 +1,486 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * These are the VP9 state controls for use with stateless VP9
> + * codec drivers.
> + *
> + * It turns out that these structs are not stable yet and will undergo
> + * more changes. So keep them private until they are stable and ready to
> + * become part of the official public API.
> + */
> +
> +#ifndef _VP9_CTRLS_H_
> +#define _VP9_CTRLS_H_
> +
> +#include <linux/types.h>
> +
> +#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F')
> +
> +#define V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(i)       (V4L2_CID_MPEG_BASE +
> 4000 + (i))
> +#define V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS    (V4L2_CID_MPEG_BASE +
> 4004)
> +#define V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT               0x400
> +#define V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS         0x404
> +
> +/**
> + * enum v4l2_vp9_loop_filter_flags - VP9 loop filter flags
> + *
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED: the filter level depends on
> + *                                          the mode and reference frame used
> + *                                          to predict a block
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE: the bitstream contains additional
> + *                                         syntax elements that specify which
> + *                                         mode and reference frame deltas
> + *                                         are to be updated
> + *
> + * Those are the flags you should pass to &v4l2_vp9_loop_filter.flags. See
> + * section '7.2.8 Loop filter semantics' of the VP9 specification for more
> + * details.
> + */
> +enum v4l2_vp9_loop_filter_flags {
> +       V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED = 1 << 0,
> +       V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE = 1 << 1,
> +};
> +
> +/**
> + * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> + *
> + * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
> + * @level: indicates the loop filter strength
> + * @sharpness: indicates the sharpness level
> + * @ref_deltas: contains the adjustment needed for the filter level based on
> + *             the chosen reference frame
> + * @mode_deltas: contains the adjustment needed for the filter level based on
> + *              the chosen mode
> + * @level_lookup: level lookup table
> + *
> + * This structure contains all loop filter related parameters. See sections
> + * '7.2.8 Loop filter semantics' and '8.8.1 Loop filter frame init process'
> + * of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_loop_filter {
> +       __u8 flags;
> +       __u8 level;
> +       __u8 sharpness;
> +       __s8 ref_deltas[4];
> +       __s8 mode_deltas[2];
> +       __u8 level_lookup[8][4][2];
> +       __u8 padding;
> +};
> +
> +/**
> + * struct v4l2_vp9_quantization - VP9 quantization parameters
> + *
> + * @base_q_idx: indicates the base frame qindex
> + * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx
> + * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx
> + * @delta_q_uv_ac indicates the UV AC quantizer relative to base_q_idx
> + * @padding: padding bytes to align things on 64 bits. Must be set to 0
> + *
> + * Encodes the quantization parameters. See section '7.2.9 Quantization
> params
> + * syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_quantization {
> +       __u8 base_q_idx;
> +       __s8 delta_q_y_dc;
> +       __s8 delta_q_uv_dc;
> +       __s8 delta_q_uv_ac;
> +       __u8 padding[4];
> +};
> +
> +/**
> + * enum v4l2_vp9_segmentation_flags - VP9 segmentation flags
> + *
> + * @V4L2_VP9_SEGMENTATION_FLAG_ENABLED: indicates that this frame makes use
> of
> + *                                     the segmentation tool
> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP: indicates that the segmentation
> map
> + *                                        should be updated during the
> + *                                        decoding of this frame
> + * @V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE: indicates that the updates to
> + *                                             the segmentation map are coded
> + *                                             relative to the existing
> + *                                             segmentation map
> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA: indicates that new parameters are
> + *                                         about to be specified for each
> + *                                         segment
> + * @V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE: indicates that the
> + *                                                 segmentation parameters
> + *                                                 represent the actual
> values
> + *                                                 to be used
> + *
> + * Those are the flags you should pass to &v4l2_vp9_segmentation.flags. See
> + * section '7.2.10 Segmentation params syntax' of the VP9 specification for
> + * more details.
> + */
> +enum v4l2_vp9_segmentation_flags {
> +       V4L2_VP9_SEGMENTATION_FLAG_ENABLED = 1 << 0,
> +       V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP = 1 << 1,
> +       V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE = 1 << 2,
> +       V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA = 1 << 3,
> +       V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE = 1 << 4,
> +};
> +
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)   (1 << (id))
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK  0xf
> +
> +/**
> + * enum v4l2_vp9_segment_feature - VP9 segment feature IDs
> + *
> + * @V4L2_VP9_SEGMENT_FEATURE_QP_DELTA: QP delta segment feature
> + * @V4L2_VP9_SEGMENT_FEATURE_LF: loop filter segment feature
> + * @V4L2_VP9_SEGMENT_FEATURE_REF_FRAME: reference frame segment feature
> + * @V4L2_VP9_SEGMENT_FEATURE_SKIP: skip segment feature
> + * @V4L2_VP9_SEGMENT_FEATURE_CNT: number of segment features
> + *
> + * Segment feature IDs. See section '7.2.10 Segmentation params syntax' of
> the
> + * VP9 specification for more details.
> + */
> +enum v4l2_vp9_segment_feature {
> +       V4L2_VP9_SEGMENT_FEATURE_QP_DELTA,
> +       V4L2_VP9_SEGMENT_FEATURE_LF,
> +       V4L2_VP9_SEGMENT_FEATURE_REF_FRAME,
> +       V4L2_VP9_SEGMENT_FEATURE_SKIP,
> +       V4L2_VP9_SEGMENT_FEATURE_CNT,
> +};
> +
> +/**
> + * struct v4l2_vp9_segmentation - VP9 segmentation parameters
> + *
> + * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_* flags
> + * @tree_probs: specifies the probability values to be used when
> + *              decoding a Segment-ID. See '5.15. Segmentation map'
> + *              section of the VP9 specification for more details.
> + * @pred_prob: specifies the probability values to be used when decoding a
> + *            Predicted-Segment-ID. See '6.4.14. Get segment id syntax'
> + *            section of :ref:`vp9` for more details..
> + * @padding: padding used to make things aligned on 64 bits. Shall be zero
> + *          filled
> + * @feature_enabled: bitmask defining which features are enabled in each
> + *                  segment
> + * @feature_data: data attached to each feature. Data entry is only valid if
> + *               the feature is enabled
> + *
> + * Encodes the quantization parameters. See section '7.2.10 Segmentation
> + * params syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_segmentation {
> +       __u8 flags;
> +       __u8 tree_probs[7];
> +       __u8 pred_probs[3];
> +       __u8 padding[5];
> +       __u8 feature_enabled[8];
> +       __s16 feature_data[8][4];
> +};
> +
> +/**
> + * enum v4l2_vp9_intra_prediction_mode - VP9 Intra prediction modes
> + *
> + * @V4L2_VP9_INTRA_PRED_DC: DC intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_V: vertical intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_H: horizontal intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D45: D45 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D135: D135 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D117: D117 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D153: D153 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D207: D207 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_D63: D63 intra prediction
> + * @V4L2_VP9_INTRA_PRED_MODE_TM: True Motion intra prediction
> + *
> + * See section '7.4.5 Intra frame mode info semantics' for more details.
> + */
> +enum v4l2_vp9_intra_prediction_mode {
> +       V4L2_VP9_INTRA_PRED_MODE_DC,
> +       V4L2_VP9_INTRA_PRED_MODE_V,
> +       V4L2_VP9_INTRA_PRED_MODE_H,
> +       V4L2_VP9_INTRA_PRED_MODE_D45,
> +       V4L2_VP9_INTRA_PRED_MODE_D135,
> +       V4L2_VP9_INTRA_PRED_MODE_D117,
> +       V4L2_VP9_INTRA_PRED_MODE_D153,
> +       V4L2_VP9_INTRA_PRED_MODE_D207,
> +       V4L2_VP9_INTRA_PRED_MODE_D63,
> +       V4L2_VP9_INTRA_PRED_MODE_TM,
> +};
> +
> +/**
> + * struct v4l2_vp9_mv_probabilities - VP9 Motion vector probabilities
> + * @joint: motion vector joint probabilities
> + * @sign: motion vector sign probabilities
> + * @class: motion vector class probabilities
> + * @class0_bit: motion vector class0 bit probabilities
> + * @bits: motion vector bits probabilities
> + * @class0_fr: motion vector class0 fractional bit probabilities
> + * @fr: motion vector fractional bit probabilities
> + * @class0_hp: motion vector class0 high precision fractional bit
> probabilities
> + * @hp: motion vector high precision fractional bit probabilities
> + */
> +struct v4l2_vp9_mv_probabilities {
> +       __u8 joint[3];
> +       __u8 sign[2];
> +       __u8 class[2][10];
> +       __u8 class0_bit[2];
> +       __u8 bits[2][10];
> +       __u8 class0_fr[2][2][3];
> +       __u8 fr[2][3];
> +       __u8 class0_hp[2];
> +       __u8 hp[2];
> +};
> +
> +/**
> + * struct v4l2_vp9_probabilities - VP9 Probabilities
> + *
> + * @tx8: TX 8x8 probabilities
> + * @tx16: TX 16x16 probabilities
> + * @tx32: TX 32x32 probabilities
> + * @coef: coefficient probabilities
> + * @skip: skip probabilities
> + * @inter_mode: inter mode probabilities
> + * @interp_filter: interpolation filter probabilities
> + * @is_inter: is inter-block probabilities
> + * @comp_mode: compound prediction mode probabilities
> + * @single_ref: single ref probabilities
> + * @comp_ref: compound ref probabilities
> + * @y_mode: Y prediction mode probabilities
> + * @uv_mode: UV prediction mode probabilities
> + * @partition: partition probabilities
> + * @mv: motion vector probabilities
> + *
> + * Structure containing most VP9 probabilities. See the VP9 specification
> + * for more details.
> + */
> +struct v4l2_vp9_probabilities {
> +       __u8 tx8[2][1];
> +       __u8 tx16[2][2];
> +       __u8 tx32[2][3];
> +       __u8 coef[4][2][2][6][6][3];
> +       __u8 skip[3];
> +       __u8 inter_mode[7][3];
> +       __u8 interp_filter[4][2];
> +       __u8 is_inter[4];
> +       __u8 comp_mode[5];
> +       __u8 single_ref[5][2];
> +       __u8 comp_ref[5];
> +       __u8 y_mode[4][9];
> +       __u8 uv_mode[10][9];
> +       __u8 partition[16][3];
> +
> +       struct v4l2_vp9_mv_probabilities mv;
> +};
> +
> +/**
> + * enum v4l2_vp9_reset_frame_context - Valid values for
> + *                     &v4l2_ctrl_vp9_frame_decode_params-
> >reset_frame_context
> + *
> + * @V4L2_VP9_RESET_FRAME_CTX_NONE: don't reset any frame context
> + * @V4L2_VP9_RESET_FRAME_CTX_SPEC: reset the frame context pointed by
> + *                     &v4l2_ctrl_vp9_frame_decode_params.frame_context_idx
> + * @V4L2_VP9_RESET_FRAME_CTX_ALL: reset all frame contexts
> + *
> + * See section '7.2 Uncompressed header semantics' of the VP9 specification
> + * for more details.
> + */
> +enum v4l2_vp9_reset_frame_context {
> +       V4L2_VP9_RESET_FRAME_CTX_NONE,
> +       V4L2_VP9_RESET_FRAME_CTX_SPEC,
> +       V4L2_VP9_RESET_FRAME_CTX_ALL,
> +};
> +
> +/**
> + * enum v4l2_vp9_interpolation_filter - VP9 interpolation filter types
> + *
> + * @V4L2_VP9_INTERP_FILTER_8TAP: height tap filter
> + * @V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH: height tap smooth filter
> + * @V4L2_VP9_INTERP_FILTER_8TAP_SHARP: height tap sharp filter
> + * @V4L2_VP9_INTERP_FILTER_BILINEAR: bilinear filter
> + * @V4L2_VP9_INTERP_FILTER_SWITCHABLE: filter selection is signaled at the
> + *                                    block level
> + *
> + * See section '7.2.7 Interpolation filter semantics' of the VP9
> specification
> + * for more details.
> + */
> +enum v4l2_vp9_interpolation_filter {
> +       V4L2_VP9_INTERP_FILTER_8TAP,
> +       V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH,
> +       V4L2_VP9_INTERP_FILTER_8TAP_SHARP,
> +       V4L2_VP9_INTERP_FILTER_BILINEAR,
> +       V4L2_VP9_INTERP_FILTER_SWITCHABLE,
> +};
> +
> +/**
> + * enum v4l2_vp9_reference_mode - VP9 reference modes
> + *
> + * @V4L2_VP9_REF_MODE_SINGLE: indicates that all the inter blocks use only a
> + *                           single reference frame to generate motion
> + *                           compensated prediction
> + * @V4L2_VP9_REF_MODE_COMPOUND: requires all the inter blocks to use compound
> + *                             mode. Single reference frame prediction is not
> + *                             allowed
> + * @V4L2_VP9_REF_MODE_SELECT: allows each individual inter block to select
> + *                           between single and compound prediction modes
> + *
> + * See section '7.3.6 Frame reference mode semantics' of the VP9
> specification
> + * for more details.
> + */
> +enum v4l2_vp9_reference_mode {
> +       V4L2_VP9_REF_MODE_SINGLE,
> +       V4L2_VP9_REF_MODE_COMPOUND,
> +       V4L2_VP9_REF_MODE_SELECT,
> +};
> +
> +/**
> + * enum v4l2_vp9_tx_mode - VP9 TX modes
> + *
> + * @V4L2_VP9_TX_MODE_ONLY_4X4: transform size is 4x4
> + * @V4L2_VP9_TX_MODE_ALLOW_8X8: transform size can be up to 8x8
> + * @V4L2_VP9_TX_MODE_ALLOW_16X16: transform size can be up to 16x16
> + * @V4L2_VP9_TX_MODE_ALLOW_32X32: transform size can be up to 32x32
> + * @V4L2_VP9_TX_MODE_SELECT: bitstream contains transform size for each block
> + *
> + * See section '7.3.1 Tx mode semantics' of the VP9 specification for more
> + * details.
> + */
> +enum v4l2_vp9_tx_mode {
> +       V4L2_VP9_TX_MODE_ONLY_4X4,
> +       V4L2_VP9_TX_MODE_ALLOW_8X8,
> +       V4L2_VP9_TX_MODE_ALLOW_16X16,
> +       V4L2_VP9_TX_MODE_ALLOW_32X32,
> +       V4L2_VP9_TX_MODE_SELECT,
> +};
> +
> +/**
> + * enum v4l2_vp9_ref_id - VP9 Reference frame IDs
> + *
> + * @V4L2_REF_ID_LAST: last reference frame
> + * @V4L2_REF_ID_GOLDEN: golden reference frame
> + * @V4L2_REF_ID_ALTREF: alternative reference frame
> + * @V4L2_REF_ID_CNT: number of reference frames
> + *
> + * See section '7.4.12 Ref frames semantics' of the VP9 specification for
> more
> + * details.
> + */
> +enum v4l2_vp9_ref_id {
> +       V4L2_REF_ID_LAST,
> +       V4L2_REF_ID_GOLDEN,
> +       V4L2_REF_ID_ALTREF,
> +       V4L2_REF_ID_CNT,
> +};
> +
> +/**
> + * enum v4l2_vp9_frame_flags - VP9 frame flags
> + * @V4L2_VP9_FRAME_FLAG_KEY_FRAME: the frame is a key frame
> + * @V4L2_VP9_FRAME_FLAG_SHOW_FRAME: the frame should be displayed
> + * @V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT: the decoding should be error
> resilient
> + * @V4L2_VP9_FRAME_FLAG_INTRA_ONLY: the frame does not reference other frames
> + * @V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV: the frame might can high
> precision
> + *                                         motion vectors
> + * @V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX: frame context should be updated
> + *                                        after decoding
> + * @V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE: parallel decoding is used
> + * @V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING: vertical subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING: horizontal subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING: full UV range is used
> + *
> + * Check the VP9 specification for more details.
> + */
> +enum v4l2_vp9_frame_flags {
> +       V4L2_VP9_FRAME_FLAG_KEY_FRAME = 1 << 0,
> +       V4L2_VP9_FRAME_FLAG_SHOW_FRAME = 1 << 1,
> +       V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT = 1 << 2,
> +       V4L2_VP9_FRAME_FLAG_INTRA_ONLY = 1 << 3,
> +       V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV = 1 << 4,
> +       V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX = 1 << 5,
> +       V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE = 1 << 6,
> +       V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING = 1 << 7,
> +       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING = 1 << 8,
> +       V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING = 1 << 9,
> +};
> +
> +#define V4L2_VP9_PROFILE_MAX           3
> +
> +/**
> + * struct v4l2_ctrl_vp9_frame_decode_params - VP9 frame decoding control
> + *
> + * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
> + * @compressed_header_size: compressed header size in bytes
> + * @uncompressed_header_size: uncompressed header size in bytes
> + * @profile: VP9 profile. Can be 0, 1, 2 or 3
> + * @reset_frame_context: specifies whether the frame context should be reset
> + *                      to default values. See &v4l2_vp9_reset_frame_context
> + *                      for more details
> + * @frame_context_idx: frame context that should be used/updated
> + * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not all
> + *            profiles support 10 and/or 12 bits depths
> + * @interpolation_filter: specifies the filter selection used for performing
> + *                       inter prediction. See &v4l2_vp9_interpolation_filter
> + *                       for more details
> + * @tile_cols_log2: specifies the base 2 logarithm of the width of each tile
> + *                 (where the width is measured in units of 8x8 blocks).
> + *                 Shall be less than or equal to 6
> + * @tile_rows_log2: specifies the base 2 logarithm of the height of each tile
> + *                 (where the height is measured in units of 8x8 blocks)
> + * @tx_mode: specifies the TX mode. See &v4l2_vp9_tx_mode for more details
> + * @reference_mode: specifies the type of inter prediction to be used. See
> + *                 &v4l2_vp9_reference_mode for more details
> + * @padding: needed to make this struct 64 bit aligned. Shall be filled with
> + *          zeros
> + * @frame_width_minus_1: add 1 to it and you'll get the frame width expressed
> + *                      in pixels
> + * @frame_height_minus_1: add 1 to it and you'll get the frame height
> expressed
> + *                       in pixels
> + * @frame_width_minus_1: add 1 to it and you'll get the expected render width
> + *                      expressed in pixels. This is not used during the
> + *                      decoding process but might be used by HW scalers to
> + *                      prepare a frame that's ready for scanout
> + * @frame_height_minus_1: add 1 to it and you'll get the expected render
> height
> + *                      expressed in pixels. This is not used during the
> + *                      decoding process but might be used by HW scalers to
> + *                      prepare a frame that's ready for scanout
> + * @refs: array of ref frames timestamps. See &v4l2_vp9_ref_id for more
> details
> + * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more details
> + * @quant: quantization parameters. See &v4l2_vp9_quantization for more
> details
> + * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more details
> + * @probs: probabilities. See &v4l2_vp9_probabilities for more details
> + */
> +struct v4l2_ctrl_vp9_frame_decode_params {
> +       __u32 flags;
> +       __u16 compressed_header_size;
> +       __u16 uncompressed_header_size;
> +       __u8 profile;
> +       __u8 reset_frame_context;
> +       __u8 frame_context_idx;
> +       __u8 bit_depth;
> +       __u8 interpolation_filter;
> +       __u8 tile_cols_log2;
> +       __u8 tile_rows_log2;
> +       __u8 tx_mode;
> +       __u8 reference_mode;
> +       __u8 padding[7];
> +       __u16 frame_width_minus_1;
> +       __u16 frame_height_minus_1;
> +       __u16 render_width_minus_1;
> +       __u16 render_height_minus_1;
> +       __u64 refs[V4L2_REF_ID_CNT];
> +       struct v4l2_vp9_loop_filter lf;
> +       struct v4l2_vp9_quantization quant;
> +       struct v4l2_vp9_segmentation seg;
> +       struct v4l2_vp9_probabilities probs;
> +};
> +
> +#define V4L2_VP9_NUM_FRAME_CTX 4
> +
> +/**
> + * struct v4l2_ctrl_vp9_frame_ctx - VP9 frame context control
> + *
> + * @probs: VP9 probabilities
> + *
> + * This control is accessed in both direction. The user should initialize the
> + * 4 contexts with default values just after starting the stream. Then before
> + * decoding a frame it should query the current frame context (the one passed
> + * through &v4l2_ctrl_vp9_frame_decode_params.frame_context_idx) to
> initialize
> + * &v4l2_ctrl_vp9_frame_decode_params.probs. The probs are then adjusted
> based
> + * on the bitstream info and passed to the kernel. The codec should update
> + * the frame context after the frame has been decoded, so that next time
> + * userspace query this context it contains the updated probabilities.
> + */
> +struct v4l2_ctrl_vp9_frame_ctx {
> +       struct v4l2_vp9_probabilities probs;
> +};
> +
> +#endif /* _VP9_CTRLS_H_ */



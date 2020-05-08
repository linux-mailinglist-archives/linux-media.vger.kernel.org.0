Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D571CAA9B
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 14:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgEHM2r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 08:28:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49208 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgEHM2r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 08:28:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D0F152A2F29
Message-ID: <f885e94250778916c09a29269f9c9f42eb67cb66.camel@collabora.com>
Subject: Re: [PATCH v3 2/3] media: uapi: Add VP9 stateless decoder controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Date:   Fri, 08 May 2020 09:28:34 -0300
In-Reply-To: <6459bd9f-20f6-9910-8d45-04870a19019d@xs4all.nl>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-3-ezequiel@collabora.com>
         <6459bd9f-20f6-9910-8d45-04870a19019d@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, 2020-05-08 at 12:27 +0200, Hans Verkuil wrote:
> On 05/05/2020 15:41, Ezequiel Garcia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add the VP9 stateless decoder controls plus the documentation that goes
> > with it.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/biblio.rst        |  10 +
> >  .../media/v4l/ext-ctrls-codec.rst             | 581 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls.c          | 242 ++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/media/v4l2-ctrls.h                    |   1 +
> >  include/media/vp9-ctrls.h                     | 510 +++++++++++++++
> >  6 files changed, 1345 insertions(+)
> >  create mode 100644 include/media/vp9-ctrls.h
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> > index 3c9634173e82..e09102e572fd 100644
> > --- a/Documentation/userspace-api/media/v4l/biblio.rst
> > +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> > @@ -414,3 +414,13 @@ VP8
> >  :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
> >  
> >  :author:    J. Bankoski et al.
> > +
> > +.. _vp9:
> > +
> > +VP9
> > +===
> > +
> > +
> > +:title:     VP9 Bitstream & Decoding Process Specification
> > +
> > +:author:    Adrian Grange (Google), Peter de Rivaz (Argon Design), Jonathan Hunt (Argon Design)
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index d0d506a444b1..fb657197b372 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -2668,6 +2668,587 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - ``padding[3]``
> >        - Applications and drivers must set this to zero.
> >  
> > +.. _v4l2-mpeg-vp9:
> > +
> > +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0..3) (struct)``
> > +    Stores VP9 probabilities attached to a specific frame context. The VP9
> > +    specification allows using a maximum of 4 contexts. Each frame being
> > +    decoded refers to one of those context. See section '7.1.2 Refresh
> > +    probs semantics' section of :ref:`vp9` for more details about these
> > +    contexts.
> > +
> > +    This control is bi-directional:
> > +
> > +    * all 4 contexts must be initialized by userspace just after the
> > +      stream is started and before the first decoding request is submitted
> 
> Missing . at the end.
> 

Oops, thanks for catching this.

> > +    * the referenced context might be read by the kernel when a decoding
> > +      request is submitted, and will be updated after the decoder is done
> > +      decoding the frame if the `V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX` flag
> > +      is set.
> > +    * contexts will be read back by user space before each decoding request
> > +      to retrieve the updated probabilities.
> > +    * userspace will re-initialize the context to their default values when
> > +      a reset context is required.
> > +
> > +    .. note::
> > +
> > +       This compound control is not yet part of the public kernel API and
> > +       it is expected to change.
> > +
> > +.. c:type:: v4l2_ctrl_vp9_frame_ctx
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> > +
> > +.. flat-table:: struct v4l2_ctrl_vp9_frame_ctx
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - struct :c:type:`v4l2_vp9_probabilities`
> > +      - ``probs``
> > +      - Structure with VP9 probabilities attached to the context.
> > +
> > +.. c:type:: v4l2_vp9_probabilities
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: struct v4l2_vp9_probabilities
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u8
> > +      - ``tx8[2][1]``
> > +      - TX 8x8 probabilities.
> > +    * - __u8
> > +      - ``tx16[2][2]``
> > +      - TX 16x16 probabilities.
> > +    * - __u8
> > +      - ``tx32[2][3]``
> > +      - TX 32x32 probabilities.
> > +    * - __u8
> > +      - ``coef[4][2][2][6][6][3]``
> > +      - Coefficient probabilities.
> > +    * - __u8
> > +      - ``skip[3]``
> > +      - Skip probabilities.
> > +    * - __u8
> > +      - ``inter_mode[7][3]``
> > +      - Inter prediction mode probabilities.
> > +    * - __u8
> > +      - ``interp_filter[4][2]``
> > +      - Interpolation filter probabilities.
> > +    * - __u8
> > +      - ``is_inter[4]``
> > +      - Is inter-block probabilities.
> > +    * - __u8
> > +      - ``comp_mode[5]``
> > +      - Compound prediction mode probabilities.
> > +    * - __u8
> > +      - ``single_ref[5][2]``
> > +      - Single reference probabilities.
> > +    * - __u8
> > +      - ``comp_mode[5]``
> > +      - Compound reference probabilities.
> > +    * - __u8
> > +      - ``y_mode[4][9]``
> > +      - Y prediction mode probabilities.
> > +    * - __u8
> > +      - ``uv_mode[10][9]``
> > +      - UV prediction mode probabilities.
> > +    * - __u8
> > +      - ``partition[16][3]``
> > +      - Partition probabilities.
> > +    * - __u8
> > +      - ``mv.joint[3]``
> > +      - Motion vector joint probabilities.
> > +    * - __u8
> > +      - ``mv.sign[2]``
> > +      - Motion vector sign probabilities.
> > +    * - __u8
> > +      - ``mv.class[2][10]``
> > +      - Motion vector class probabilities.
> > +    * - __u8
> > +      - ``mv.class0_bit[2]``
> > +      - Motion vector class0 bit probabilities.
> > +    * - __u8
> > +      - ``mv.bits[2][10]``
> > +      - Motion vector bits probabilities.
> > +    * - __u8
> > +      - ``mv.class0_fr[2][2][3]``
> > +      - Motion vector class0 fractional bit probabilities.
> > +    * - __u8
> > +      - ``mv.fr[2][3]``
> > +      - Motion vector fractional bit probabilities.
> > +    * - __u8
> > +      - ``mv.class0_hp[2]``
> > +      - Motion vector class0 high precision fractional bit probabilities.
> > +    * - __u8
> > +      - ``mv.hp[2]``
> > +      - Motion vector high precision fractional bit probabilities.
> > +
> > +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS (struct)``
> > +    Specifies the frame parameters for the associated VP9 frame decode request.
> > +    This includes the necessary parameters for configuring a stateless hardware
> > +    decoding pipeline for VP9. The bitstream parameters are defined according
> > +    to :ref:`vp9`.
> > +
> > +    .. note::
> > +
> > +       This compound control is not yet part of the public kernel API and
> > +       it is expected to change.
> > +
> > +.. c:type:: v4l2_ctrl_vp9_frame_decode_params
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: struct v4l2_ctrl_vp9_frame_decode_params
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``flags``
> > +      - Combination of V4L2_VP9_FRAME_FLAG_* flags. See
> > +        :c:type:`v4l2_vp9_frame_flags`.
> > +    * - __u16
> > +      - ``compressed_header_size``
> > +      - Compressed header size in bytes.
> > +    * - __u16
> > +      - ``uncompressed_header_size``
> > +      - Uncompressed header size in bytes.
> > +    * - __u8
> > +      - ``profile``
> > +      - VP9 profile. Can be 0, 1, 2 or 3.
> > +    * - __u8
> > +      - ``reset_frame_context``
> > +      - Frame context that should be used/updated when decoding the frame.
> > +    * - __u8
> > +      - ``bit_depth``
> > +      - Component depth in bits. Must be 8 for profile 0 and 1. Must 10 or 12
> > +        for profile 2 and 3.
> > +    * - __u8
> > +      - ``color_space``
> > +      - Specifies the color space of the stream. See V4L2_VP9_COLOR_SPACE_*
> > +        values. See :c:type:`v4l2_vp9_color_space`
> 
> Ditto.
> 
> > +    * - __u8
> > +      - ``interpolation_filter``
> > +      - Specifies the filter selection used for performing inter prediction. See
> > +        :c:type:`v4l2_vp9_interpolation_filter`.
> > +    * - __u8
> > +      - ``tile_cols_log2``
> > +      - Specifies the base 2 logarithm of the width of each tile (where the
> > +        width is measured in units of 8x8 blocks). Shall be less than or equal
> > +        to 6.
> > +    * - __u8
> > +      - ``tile_rows_log2``
> > +      - Specifies the base 2 logarithm of the height of each tile (where the
> > +        height is measured in units of 8x8 blocks)
> 
> Ditto
> 
> > +    * - __u8
> > +      - ``tx_mode``
> > +      - Specifies the TX mode. See :c:type:`v4l2_vp9_tx_mode`.
> > +    * - __u8
> > +      - ``reference_mode``
> > +      - Specifies the type of inter prediction to be used. See
> > +        :c:type:`v4l2_vp9_reference_mode`.
> > +    * - __u8
> > +      - ``padding``
> > +      - Needed to make this struct 64 bit aligned. Shall be filled with zeros.
> > +    * - __u16
> > +      - ``frame_width_minus_1``
> > +      - Add 1 to get the frame width expressed in pixels.
> > +    * - __u16
> > +      - ``frame_height_minus_1``
> > +      - Add 1 to to get the frame height expressed in pixels.
> > +    * - __u16
> > +      - ``frame_width_minus_1``
> > +      - Add 1 to to get the expected render width expressed in pixels. This is
> > +        not used during the decoding process but might be used by HW scalers to
> > +        prepare a frame that's ready for scanout.
> > +    * - __u16
> > +      - frame_height_minus_1
> > +      - Add 1 to get the expected render height expressed in pixels. This is
> > +        not used during the decoding process but might be used by HW scalers to
> > +        prepare a frame that's ready for scanout.
> > +    * - __u64
> > +      - ``refs[3]``
> > +      - Array of reference frame timestamps.
> > +    * - struct :c:type:`v4l2_vp9_loop_filter`
> > +      - ``lf``
> > +      - Loop filter parameters. See struct :c:type:`v4l2_vp9_loop_filter`.
> > +    * - struct :c:type:`v4l2_vp9_quantization`
> > +      - ``quant``
> > +      - Quantization parameters. See :c:type:`v4l2_vp9_quantization`.
> > +    * - struct :c:type:`v4l2_vp9_segmentation`
> > +      - ``seg``
> > +      - Segmentation parameters. See :c:type:`v4l2_vp9_segmentation`.
> > +    * - struct :c:type:`v4l2_vp9_probabilities`
> > +      - ``probs``
> > +      - Probabilities. See :c:type:`v4l2_vp9_probabilities`.
> > +
> > +.. c:type:: v4l2_vp9_frame_flags
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_frame_flags
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_FRAME_FLAG_KEY_FRAME``
> > +      - The frame is a key frame.
> > +    * - ``V4L2_VP9_FRAME_FLAG_SHOW_FRAME``
> > +      - The frame should be displayed.
> > +    * - ``V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT``
> > +      - The decoding should be error resilient.
> > +    * - ``V4L2_VP9_FRAME_FLAG_INTRA_ONLY``
> > +      - The frame does not reference other frames.
> > +    * - ``V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV``
> > +      - the frame might can high precision motion vectors.
> > +    * - ``V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX``
> > +      - Frame context should be updated after decoding.
> > +    * - ``V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE``
> > +      - Parallel decoding is used.
> > +    * - ``V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING``
> > +      - Vertical subsampling is enabled.
> > +    * - ``V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING``
> > +      - Horizontal subsampling is enabled.
> > +    * - ``V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING``
> > +      - The full UV range is used.
> > +
> > +.. c:type:: v4l2_vp9_ref_id
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_ref_id
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_REF_ID_LAST``
> > +      - Last reference frame.
> > +    * - ``V4L2_REF_ID_GOLDEN``
> > +      - Golden reference frame.
> > +    * - ``V4L2_REF_ID_ALTREF``
> > +      - Alternative reference frame.
> > +    * - ``V4L2_REF_ID_CNT``
> > +      - Number of reference frames.
> > +
> > +.. c:type:: v4l2_vp9_tx_mode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_tx_mode
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_TX_MODE_ONLY_4X4``
> > +      - Transform size is 4x4.
> > +    * - ``V4L2_VP9_TX_MODE_ALLOW_8X8``
> > +      - Transform size can be up to 8x8.
> > +    * - ``V4L2_VP9_TX_MODE_ALLOW_16X16``
> > +      - Transform size can be up to 16x16.
> > +    * - ``V4L2_VP9_TX_MODE_ALLOW_32X32``
> > +      - transform size can be up to 32x32.
> > +    * - ``V4L2_VP9_TX_MODE_SELECT``
> > +      - Bitstream contains transform size for each block.
> > +
> > +.. c:type:: v4l2_vp9_reference_mode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_reference_mode
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_REF_MODE_SINGLE``
> > +      - Indicates that all the inter blocks use only a single reference frame
> > +        to generate motion compensated prediction.
> > +    * - ``V4L2_VP9_REF_MODE_COMPOUND``
> > +      - Requires all the inter blocks to use compound mode. Single reference
> > +        frame prediction is not allowed.
> > +    * - ``V4L2_VP9_REF_MODE_SELECT``
> > +      - Allows each individual inter block to select between single and
> > +        compound prediction modes.
> > +
> > +.. c:type:: v4l2_vp9_interpolation_filter
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_interpolation_filter
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP``
> > +      - Height tap filter.
> > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH``
> > +      - Height tap smooth filter.
> > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SHARP``
> > +      - Height tap sharp filter.
> > +    * - ``V4L2_VP9_INTERP_FILTER_BILINEAR``
> > +      - Bilinear filter.
> > +    * - ``V4L2_VP9_INTERP_FILTER_SWITCHABLE``
> > +      - Filter selection is signaled at the block level.
> > +
> > +.. c:type:: v4l2_vp9_color_space
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_color_space
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_COLOR_SPACE_UNKNOWN``
> > +      - Unknown color space. In this case the color space must be signaled
> > +        outside the VP9 bitstream.
> > +    * - ``V4L2_VP9_COLOR_SPACE_BT_601``
> > +      - Rec. ITU-R BT.601-7 color space.
> > +    * - ``V4L2_VP9_COLOR_SPACE_BT_709``
> > +      - Rec. ITU-R BT.709-6 color space.
> > +    * - ``V4L2_VP9_COLOR_SPACE_SMPTE_170``
> > +      - SMPTE-170 color space.
> > +    * - ``V4L2_VP9_COLOR_SPACE_SMPTE_240``
> > +      - SMPTE-240 color space.
> > +    * - ``V4L2_VP9_COLOR_SPACE_BT_2020``
> > +      - Rec. ITU-R BT.2020-2 color space.
> > +    * - ``V4L2_VP9_COLOR_SPACE_RESERVED``
> > +      - Reserved. This value shall never be passed.
> > +    * - ``V4L2_VP9_COLOR_SPACE_SRGB``
> > +      - sRGB (IEC 61966-2-1) color space.
> 
> Should this be here? We already have colorspace information in the pix format structs.
> 
> It is also unclear from reading just this bit whether e.g. V4L2_VP9_COLOR_SPACE_SRGB
> just describes the sRGB color primaries or also the transfer function and quantization
> range.
> 
> I'd like to see some more about how this is used. None of the other codec headers
> have this.
> 

I think this comes directly from the spec. The Rockchip VDEC doesn't
seem to use it.

Do you think we can drop it from here, and rely on the V4L2 colorspace
passed in the format negotiation?
 
> > +
> > +.. c:type:: v4l2_vp9_reset_frame_context
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_reset_frame_context
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> > +      - Do not reset any frame context.
> > +    * - ``V4L2_VP9_RESET_FRAME_CTX_SPEC``
> > +      - Reset the frame context pointed by
> > +        :c:type:`v4l2_ctrl_vp9_frame_decode_params`.frame_context_idx.
> > +    * - ``V4L2_VP9_RESET_FRAME_CTX_ALL``
> > +      - Reset all frame contexts.
> > +
> > +.. c:type:: v4l2_vp9_intra_prediction_mode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: enum v4l2_vp9_intra_prediction_mode
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 2
> > +
> > +    * - ``V4L2_VP9_INTRA_PRED_DC``
> > +      - DC intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_V``
> > +      - Vertical intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_H``
> > +      - Horizontal intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D45``
> > +      - D45 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D135``
> > +      - D135 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D117``
> > +      - D117 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D153``
> > +      - D153 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D207``
> > +      - D207 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D63``
> > +      - D63 intra prediction.
> > +    * - ``V4L2_VP9_INTRA_PRED_MODE_TM``
> > +      - True motion intra prediction.
> > +
> > +.. c:type:: v4l2_vp9_segmentation
> > +
> > +.. cssclass:: longtable
> > +
> > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > +
> > +.. flat-table:: struct v4l2_vp9_segmentation
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u8
> > +      - ``flags``
> > +      - Combination of V4L2_VP9_SEGMENTATION_FLAG_* flags. See
> > +        :c:type:`v4l2_vp9_segmentation_flags`.
> > +    * - __u8
> > +      - ``tree_probs[7]``
> > +      - Specifies the probability values to be used when decoding segment_id.
> 
> segment_id? Does this refer to a term defined in the VP9 spec?
> 

Yes, this is all strictly spec compliant. segment_id and seg_id_predicted
are VP9 syntax elements.

In particular that description is copy-pasted from the spec, but
I agree it may seem confusing in this context. How about:

"to be used when decoding a Segment-ID"

> > +    * - __u8
> > +      - ``pred_prob[3]``
> > +      - Specifies the probability values to be used when decoding
> > +        seg_id_predicte.
> 
> seg_id_predicte: typo? I don't see any field called seg_id_predicte.
> 
> It looks like segment_id and seg_id_predicte are C field names, but I suspect
> they are not. I think this should be clarified.
> 

Ditto,

"to be used when decoding a Predicted-Segment-ID"

Maybe this will be clearer ?


> > +    * - __u8
> > +      - ``padding[5]``
> > +      - Used to align this struct on 64 bit. Shall be filled with zeros.
> 
> zeroes.
> 

Oops, more typos :-)

Thanks for reviewing,
Ezequiel


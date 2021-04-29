Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A061B36E895
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 12:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240008AbhD2KVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 06:21:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42135 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240407AbhD2KVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 06:21:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id c3mPlaZNCk1MGc3mTlQ9Fh; Thu, 29 Apr 2021 12:20:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619691626; bh=+3YFlY+TBeaIcxlsPtkUdmg8bHNRYp/TTjGDAgFpAfg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HdXni5I7sl1Z394J/jtYfSH7pc6oPIGDuFLagT7y52QoBCSyXo6P95HDcDYmTJ6Pr
         /KhaPirvRrUB19yMoQBx5TDVkxCRAXbh6z0dl9rOu4fNzkvDkNeBNP3flXoopvp3mF
         kKGvNUWUHkLzjHYRjn9sqgGpIMQFoIZOAa9voxD13LRdZcWrSLWv5UCuXTN9kTL6fl
         7VotPlpAyZDv6JAn9xTBuJ5D/q/DHvfw3Uf7GN+V91Sv9QSixS9vxBAtOQg/mUF2ZQ
         Fg6Q3DcXxNiDPaIpN2UeO/url42wljouODd/ccJSWlWfmgga59lXntwLBSGYGdGpFi
         vDHb7dw3P7w2g==
Subject: Re: [RFC RESEND 2/3] media: uapi: Add VP9 stateless decoder controls
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>
References: <20210421100035.13571-1-andrzej.p@collabora.com>
 <20210421100035.13571-3-andrzej.p@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <12493c55-e6cf-0491-d310-7561c7f77258@xs4all.nl>
Date:   Thu, 29 Apr 2021 12:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210421100035.13571-3-andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMTBSeMQ68FwwPdeRo9QQhhchqiKWBFXn6+xGY28MKYUqzqFiPUMw3jqfTH/Q74x6zBJcxlZKg3spgy/8J1Y06qEG0pVNbL0qsNE+qNP4BYRFjG8b6fy
 7xabdD7QiHGDReJ7ujsWVZnbkzjmKHaWh8IaTYZmLs+JAGB0gCuVvqH4y8ssZbqcR5kH0fszY5kVuG2PzR41vvobbkZ1slXhWAWRAOeHu1dugXVxVInEpB/3
 DQRkPLETy/X4OcECy6723In8Qz6h4nhPaFsu+fQi48fXMHSO6wUo7TsZovLMb1vsWziuV4EfU7yJgj26oOv56T0fWcAwvBin1uSm9jjubVmJWzSbb2FKhS5l
 khRtlgdZ+7RzUgrkImvDuT/bROzbbucu1NZVYbPZy6LyVReZMtUf6Oy0PKKc6Hlui4yz6iOPFzrUiEs4jvDr/ADVEI4pC+QAPf2IdbjzKKAiokgTfzEXa6Ba
 RKjHRc1hrBTy4oa4D8q4avPtzJ351Z41CSbkPYj5dPKOAtvCEmrvqrqC23QtRHYQhKwLXBWC+DhhXuk5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 12:00, Andrzej Pietrasiewicz wrote:
> Add the VP9 stateless decoder controls plus the documentation that goes
> with it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  .../userspace-api/media/v4l/biblio.rst        |  10 +
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 523 ++++++++++++++++++
>  .../media/v4l/pixfmt-compressed.rst           |  15 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +
>  .../media/v4l/vidioc-queryctrl.rst            |  12 +
>  .../media/videodev2.h.rst.exceptions          |   2 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 244 ++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   4 +
>  include/uapi/linux/v4l2-controls.h            | 455 +++++++++++++++
>  include/uapi/linux/videodev2.h                |   6 +
>  11 files changed, 1280 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
> index 64d241daf63c..051982896375 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -417,3 +417,13 @@ VP8
>  :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
>  
>  :author:    J. Bankoski et al.
> +
> +.. _vp9:
> +
> +VP9
> +===
> +
> +
> +:title:     VP9 Bitstream & Decoding Process Specification
> +
> +:author:    Adrian Grange (Google), Peter de Rivaz (Argon Design), Jonathan Hunt (Argon Design)
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> index 3fc04daa9ffb..ab40c878c8ad 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -1244,3 +1244,526 @@ FWHT Flags
>      * - __u8
>        - ``padding[3]``
>        - Applications and drivers must set this to zero.
> +
> +.. _v4l2-codec-stateless-vp9:
> +
> +``V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS (struct)``
> +    Stores VP9 probabilities updates as parsed from the current compressed frame
> +    header. A value of zero in a struct member means no update of the relevant
> +    probability. Motion vector-related updates contain a new value or zero. All
> +    other updates contain values translated with inv_map_table[] (see 6.3.5 in
> +    :ref:`vp9`).
> +
> +.. c:type:: v4l2_ctrl_vp9_compressed_hdr_probs
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp9_compressed_hdr_probs
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``tx8[2][1]``
> +      - TX 8x8 probabilities delta.
> +    * - __u8
> +      - ``tx16[2][2]``
> +      - TX 16x16 probabilities delta.
> +    * - __u8
> +      - ``tx32[2][3]``
> +      - TX 32x32 probabilities delta.
> +    * - __u8
> +      - ``coef[4][2][2][6][6][3]``
> +      - Coefficient probabilities delta.
> +    * - __u8
> +      - ``skip[3]``
> +      - Skip probabilities delta.
> +    * - __u8
> +      - ``inter_mode[7][3]``
> +      - Inter prediction mode probabilities delta.
> +    * - __u8
> +      - ``interp_filter[4][2]``
> +      - Interpolation filter probabilities delta.
> +    * - __u8
> +      - ``is_inter[4]``
> +      - Is inter-block probabilities delta.
> +    * - __u8
> +      - ``comp_mode[5]``
> +      - Compound prediction mode probabilities delta.
> +    * - __u8
> +      - ``single_ref[5][2]``
> +      - Single reference probabilities delta.
> +    * - __u8
> +      - ``comp_mode[5]``
> +      - Compound reference probabilities delta.
> +    * - __u8
> +      - ``y_mode[4][9]``
> +      - Y prediction mode probabilities delta.
> +    * - __u8
> +      - ``uv_mode[10][9]``
> +      - UV prediction mode probabilities delta.
> +    * - __u8
> +      - ``partition[16][3]``
> +      - Partition probabilities delta.
> +    * - __u8
> +      - ``partition[16][3]``
> +      - Partition probabilities delta.
> +    * - __u8
> +      - ``mv.joint[3]``
> +      - Motion vector joint probabilities delta.
> +    * - __u8
> +      - ``mv.sign[2]``
> +      - Motion vector sign probabilities delta.
> +    * - __u8
> +      - ``mv.class[2][10]``
> +      - Motion vector class probabilities delta.
> +    * - __u8
> +      - ``mv.class0_bit[2]``
> +      - Motion vector class0 bit probabilities delta.
> +    * - __u8
> +      - ``mv.bits[2][10]``
> +      - Motion vector bits probabilities delta.
> +    * - __u8
> +      - ``mv.class0_fr[2][2][3]``
> +      - Motion vector class0 fractional bit probabilities delta.
> +    * - __u8
> +      - ``mv.fr[2][3]``
> +      - Motion vector fractional bit probabilities delta.
> +    * - __u8
> +      - ``mv.class0_hp[2]``
> +      - Motion vector class0 high precision fractional bit probabilities delta.
> +    * - __u8
> +      - ``mv.hp[2]``
> +      - Motion vector high precision fractional bit probabilities delta.
> +
> +``V4L2_CID_STATELESS_VP9_FRAME_DECODE_PARAMS (struct)``
> +    Specifies the frame parameters for the associated VP9 frame decode request.
> +    This includes the necessary parameters for configuring a stateless hardware
> +    decoding pipeline for VP9. The bitstream parameters are defined according
> +    to :ref:`vp9`.

Are there specific sections in the spec that define these parameters? Or is it
all over the place? If it's the latter, would it be possible to add a reference
to the respective sections in the field documentation below?

Update: I noticed a lot of references to the spec in v4l2-controls.h. If those
references would answer this question, then you can refer to that header from
here. Or just copy those section references into this documentation.

> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.

Since this patch series add this to uAPI right away, this note must be dropped.

> +
> +.. c:type:: v4l2_ctrl_vp9_frame_decode_params
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp9_frame_decode_params
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``flags``
> +      - Combination of V4L2_VP9_FRAME_FLAG_* flags. See
> +        :c:type:`v4l2_vp9_frame_flags`.
> +    * - __u16
> +      - ``compressed_header_size``
> +      - Compressed header size in bytes.
> +    * - __u16
> +      - ``uncompressed_header_size``
> +      - Uncompressed header size in bytes.
> +    * - __u8
> +      - ``profile``
> +      - VP9 profile. Can be 0, 1, 2 or 3.
> +    * - __u8
> +      - ``reset_frame_context``
> +      - Frame context that should be used/updated when decoding the frame.
> +    * - __u8
> +      - ``bit_depth``
> +      - Component depth in bits. Must be 8 for profile 0 and 1. Must 10 or 12
> +        for profile 2 and 3.
> +    * - __u8
> +      - ``interpolation_filter``
> +      - Specifies the filter selection used for performing inter prediction. See
> +        :c:type:`v4l2_vp9_interpolation_filter`.
> +    * - __u8
> +      - ``tile_cols_log2``
> +      - Specifies the base 2 logarithm of the width of each tile (where the
> +        width is measured in units of 8x8 blocks). Shall be less than or equal
> +        to 6.
> +    * - __u8
> +      - ``tile_rows_log2``
> +      - Specifies the base 2 logarithm of the height of each tile (where the
> +        height is measured in units of 8x8 blocks)

Missing period at the end of the sentence.

> +    * - __u8
> +      - ``tx_mode``
> +      - Specifies the TX mode. See :c:type:`v4l2_vp9_tx_mode`.
> +    * - __u8
> +      - ``reference_mode``
> +      - Specifies the type of inter prediction to be used. See
> +        :c:type:`v4l2_vp9_reference_mode`.
> +    * - __u8
> +      - ``padding[7]``
> +      - Needed to make this struct 64 bit aligned. Shall be filled with zeroes.
> +    * - __u16
> +      - ``frame_width_minus_1``
> +      - Add 1 to get the frame width expressed in pixels.
> +    * - __u16
> +      - ``frame_height_minus_1``
> +      - Add 1 to get the frame height expressed in pixels.

These two fields are weird. Isn't this defined by setting the output format?
And why the 'minus_1'?

> +    * - __u16
> +      - ``render_width_minus_1``
> +      - Add 1 to get the expected render width expressed in pixels. This is
> +        not used during the decoding process but might be used by HW scalers to
> +        prepare a frame that's ready for scanout.
> +    * - __u16
> +      - render_height_minus_1
> +      - Add 1 to get the expected render height expressed in pixels. This is
> +        not used during the decoding process but might be used by HW scalers to
> +        prepare a frame that's ready for scanout.

No idea what these fields are about. I suspect this can be defined by setting
the capture format, but I'm not sure.

> +    * - __u64
> +      - ``refs[3]``
> +      - Array of reference frame timestamps.
> +    * - __u8
> +      - ``ref_frame_sign_bias[4]``
> +      - Array of reference frames motion vector sign bias (prediction direction)

Missing period at the end.

> +    * - struct :c:type:`v4l2_vp9_loop_filter`
> +      - ``lf``
> +      - Loop filter parameters. See struct :c:type:`v4l2_vp9_loop_filter`.
> +    * - struct :c:type:`v4l2_vp9_quantization`
> +      - ``quant``
> +      - Quantization parameters. See :c:type:`v4l2_vp9_quantization`.
> +    * - struct :c:type:`v4l2_vp9_segmentation`
> +      - ``seg``
> +      - Segmentation parameters. See :c:type:`v4l2_vp9_segmentation`.
> +    * - struct :c:type:`v4l2_vp9_probabilities`
> +      - ``probs``
> +      - Probabilities. See :c:type:`v4l2_vp9_probabilities`.
> +
> +.. c:type:: v4l2_vp9_frame_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_frame_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_FRAME_FLAG_KEY_FRAME``
> +      - The frame is a key frame.
> +    * - ``V4L2_VP9_FRAME_FLAG_SHOW_FRAME``
> +      - The frame should be displayed.
> +    * - ``V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT``
> +      - The decoding should be error resilient.
> +    * - ``V4L2_VP9_FRAME_FLAG_INTRA_ONLY``
> +      - The frame does not reference other frames.
> +    * - ``V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV``
> +      - the frame might can high precision motion vectors.

'might can'? Should that be 'can use'?

> +    * - ``V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX``
> +      - Frame context should be updated after decoding.
> +    * - ``V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE``
> +      - Parallel decoding is used.
> +    * - ``V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING``
> +      - Vertical subsampling is enabled.
> +    * - ``V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING``
> +      - Horizontal subsampling is enabled.
> +    * - ``V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING``
> +      - The full UV range is used.
> +
> +.. c:type:: v4l2_vp9_ref_id
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_ref_id
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_REF_ID_LAST``
> +      - Last reference frame.
> +    * - ``V4L2_REF_ID_GOLDEN``
> +      - Golden reference frame.
> +    * - ``V4L2_REF_ID_ALTREF``
> +      - Alternative reference frame.
> +    * - ``V4L2_REF_ID_CNT``
> +      - Number of reference frames.
> +
> +.. c:type:: v4l2_vp9_tx_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_tx_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_TX_MODE_ONLY_4X4``
> +      - Transform size is 4x4.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_8X8``
> +      - Transform size can be up to 8x8.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_16X16``
> +      - Transform size can be up to 16x16.
> +    * - ``V4L2_VP9_TX_MODE_ALLOW_32X32``
> +      - transform size can be up to 32x32.
> +    * - ``V4L2_VP9_TX_MODE_SELECT``
> +      - Bitstream contains transform size for each block.

Either 'contains the transform size' or 'contains transform sizes',
whichever is appropriate.

> +
> +.. c:type:: v4l2_vp9_reference_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_reference_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_REF_MODE_SINGLE``
> +      - Indicates that all the inter blocks use only a single reference frame
> +        to generate motion compensated prediction.
> +    * - ``V4L2_VP9_REF_MODE_COMPOUND``
> +      - Requires all the inter blocks to use compound mode. Single reference
> +        frame prediction is not allowed.
> +    * - ``V4L2_VP9_REF_MODE_SELECT``
> +      - Allows each individual inter block to select between single and
> +        compound prediction modes.
> +
> +.. c:type:: v4l2_vp9_interpolation_filter
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_interpolation_filter
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP``
> +      - Height tap filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH``
> +      - Height tap smooth filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SHARP``
> +      - Height tap sharp filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_BILINEAR``
> +      - Bilinear filter.
> +    * - ``V4L2_VP9_INTERP_FILTER_SWITCHABLE``
> +      - Filter selection is signaled at the block level.
> +
> +.. c:type:: v4l2_vp9_reset_frame_context
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_reset_frame_context
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> +      - Do not reset any frame context.
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_SPEC``
> +      - Reset the frame context pointed by

pointed -> pointed to

> +        :c:type:`v4l2_ctrl_vp9_frame_decode_params`.frame_context_idx.
> +    * - ``V4L2_VP9_RESET_FRAME_CTX_ALL``
> +      - Reset all frame contexts.
> +
> +.. c:type:: v4l2_vp9_intra_prediction_mode
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_intra_prediction_mode
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_INTRA_PRED_DC``
> +      - DC intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_V``
> +      - Vertical intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_H``
> +      - Horizontal intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D45``
> +      - D45 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D135``
> +      - D135 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D117``
> +      - D117 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D153``
> +      - D153 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D207``
> +      - D207 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_D63``
> +      - D63 intra prediction.
> +    * - ``V4L2_VP9_INTRA_PRED_MODE_TM``
> +      - True motion intra prediction.
> +
> +.. c:type:: v4l2_vp9_segmentation
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_segmentation
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``flags``
> +      - Combination of V4L2_VP9_SEGMENTATION_FLAG_* flags. See
> +        :c:type:`v4l2_vp9_segmentation_flags`.
> +    * - __u8
> +      - ``tree_probs[7]``
> +      - Specifies the probability values to be used when decoding a Segment-ID.
> +        See '5.15. Segmentation map' section of :ref:`vp9` for more details.
> +    * - __u8
> +      - ``pred_prob[3]``
> +      - Specifies the probability values to be used when decoding a
> +        Predicted-Segment-ID. See '6.4.14. Get segment id syntax'
> +        section of :ref:`vp9` for more details.
> +    * - __u8
> +      - ``padding[5]``
> +      - Used to align this struct on 64 bit. Shall be filled with zeroes.

I would prefer to have this at the end of the struct. In general I
prefer padding at the end, not in the middle of a struct, if at all
possible.

> +    * - __u8
> +      - ``feature_enabled[8]``
> +      - Bitmask defining which features are enabled in each segment.
> +    * - __u8
> +      - ``feature_data[8][4]``
> +      - Data attached to each feature. Data entry is only valid if the feature
> +        is enabled.
> +
> +.. c:type:: v4l2_vp9_segment_feature
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_segment_feature
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_QP_DELTA``
> +      - QP delta segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_LF``
> +      - Loop filter segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_REF_FRAME``
> +      - Reference frame segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_SKIP``
> +      - Skip segment feature.
> +    * - ``V4L2_VP9_SEGMENT_FEATURE_CNT``
> +      - Number of segment features.
> +
> +.. c:type:: v4l2_vp9_segmentation_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_segmentation_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ENABLED``
> +      - Indicates that this frame makes use of the segmentation tool.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP``
> +      - Indicates that the segmentation map should be updated during the
> +        decoding of this frame.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE``
> +      - Indicates that the updates to the segmentation map are coded
> +        relative to the existing segmentation map.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA``
> +      - Indicates that new parameters are about to be specified for each
> +        segment.
> +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE``
> +      - Indicates that the segmentation parameters represent the actual values
> +        to be used.
> +
> +.. c:type:: v4l2_vp9_quantization
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_quantization
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``base_q_idx``
> +      - Indicates the base frame qindex.
> +    * - __s8
> +      - ``delta_q_y_dc``
> +      - Indicates the Y DC quantizer relative to base_q_idx.
> +    * - __s8
> +      - ``delta_q_uv_dc``
> +      - Indicates the UV DC quantizer relative to base_q_idx.
> +    * - __s8
> +      - ``delta_q_uv_ac``
> +      - Indicates the UV AC quantizer relative to base_q_idx.
> +    * - __u8
> +      - ``padding[4]``
> +      - Padding bytes used to align this struct on 64 bit. Must be set to 0.
> +
> +.. c:type:: v4l2_vp9_loop_filter
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: struct v4l2_vp9_loop_filter
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u8
> +      - ``flags``
> +      - Combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags.
> +        See :c:type:`v4l2_vp9_loop_filter_flags`.
> +    * - __u8
> +      - ``level``
> +      - Indicates the loop filter strength.
> +    * - __u8
> +      - ``sharpness``
> +      - Indicates the sharpness level.
> +    * - __s8
> +      - ``ref_deltas[4]``
> +      - Contains the adjustment needed for the filter level based on the chosen
> +        reference frame.
> +    * - __s8
> +      - ``mode_deltas[2]``
> +      - Contains the adjustment needed for the filter level based on the chosen
> +        mode
> +    * - __u8
> +      - ``level_lookup[8][4][2]``
> +      - Level lookup table.
> +
> +
> +.. c:type:: v4l2_vp9_loop_filter_flags
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> +
> +.. flat-table:: enum v4l2_vp9_loop_filter_flags
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 2
> +
> +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED``
> +      - When set, the filter level depends on the mode and reference frame used
> +        to predict a block.
> +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE``
> +      - When set, the bitstream contains additional syntax elements that
> +        specify which mode and reference frame deltas are to be updated.
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 6dba70da822b..7e34aeb1cb92 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -171,6 +171,21 @@ Compressed Formats
>        - VP9 compressed video frame. The encoder generates one
>  	compressed frame per buffer, and the decoder requires one
>  	compressed frame per buffer.
> +    * .. _V4L2-PIX-FMT-VP9_FRAME:
> +
> +      - ``V4L2_PIX_FMT_VP9_FRAME``
> +      - 'VP9F'
> +      - VP9 parsed frame, including the frame header, as extracted from the container.
> +	This format is adapted for stateless video decoders that implement an

an -> a

> +	VP9 pipeline with the :ref:`stateless_decoder`.
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_STATELESS_VP9_FRAME_DECODE_PARAMS`` and
> +	the ``V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS`` controls.
> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp9>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate number
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.
>      * .. _V4L2-PIX-FMT-HEVC:
>  
>        - ``V4L2_PIX_FMT_HEVC``
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 3ba22983d21f..3ff72ca63772 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -221,6 +221,14 @@ still cause this situation.
>        - ``p_vp8_frame``
>        - A pointer to a struct :c:type:`v4l2_ctrl_vp8_frame`. Valid if this control is
>          of type ``V4L2_CTRL_TYPE_VP8_FRAME``.
> +    * - struct :c:type:`v4l2_ctrl_vp9_compressed_hdr_probs` *
> +      - ``p_vp9_compressed_hdr_probs``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_compressed_hdr_probs'. Valid if this contro is

contro -> control

> +        of type ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS``.
> +    * - struct :c:type:`v4l2_ctrl_vp9_frame_decode_params` *
> +      - ``p_vp9_frame_decode_params``
> +      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_frame_decode_params'. Valid if this contro is

ditto

> +        of type ``V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS``.
>      * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
>        - ``p_hdr10_cll``
>        - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 8a285daedc6a..85fb8b7a9428 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -495,6 +495,18 @@ See also the examples in :ref:`control`.
>        - n/a
>        - A struct :c:type:`v4l2_ctrl_vp8_frame`, containing VP8
>  	frame parameters for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_vp9_compressed_hdr_probs`, containing VP9
> +	probabilities updates for stateless video decoders.
> +    * - ``V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS``
> +      - n/a
> +      - n/a
> +      - n/a
> +      - A struct :c:type:`v4l2_ctrl_vp9_compressed_hdr_probs`, containing VP9

v4l2_ctrl_vp9_compressed_hdr_probs -> v4l2_ctrl_vp9_frame_decode_params

> +	frame decode parameters for stateless video decoders.
>  
>  .. raw:: latex
>  
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index f59940352faa..fdc6f2b22df8 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -148,6 +148,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS :c:type:`v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 0d7fe1bd975a..8de7238593ab 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1215,6 +1215,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
>  	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
>  	case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
> +	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS:	return "VP9 Probabilities Updates";
> +	case V4L2_CID_STATELESS_VP9_FRAME_DECODE_PARAMS:	return "VP9 Frame Decode Parameters";
>  
>  	/* Colorimetry controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1517,6 +1519,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_STATELESS_VP8_FRAME:
>  		*type = V4L2_CTRL_TYPE_VP8_FRAME;
>  		break;
> +	case V4L2_CID_STATELESS_VP9_FRAME_DECODE_PARAMS:
> +		*type = V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS;
> +		break;
> +	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS:
> +		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS;
> +		break;

Let's swap the order of these two cases. Everywhere else it seems that
PROBS comes before DECODE_PARARMS, so stay consistent.

>  	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
>  		*type = V4L2_CTRL_TYPE_HEVC_SPS;
>  		break;
> @@ -1836,6 +1844,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_VP8_FRAME:
>  		pr_cont("VP8_FRAME");
>  		break;
> +	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS:
> +		pr_cont("VP9_COMPRESSED_HDR_PROBS");
> +		break;
> +	case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> +		pr_cont("VP9_FRAME_DECODE_PARAMS");
> +		break;
>  	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>  		pr_cont("HDR10_CLL_INFO");
>  		break;
> @@ -1869,6 +1883,224 @@ static void std_log(const struct v4l2_ctrl *ctrl)
>  	0;							\
>  })
>  
> +static int
> +validate_vp9_lf_params(struct v4l2_vp9_loop_filter *lf)
> +{
> +	unsigned int i, j, k;
> +
> +	if (lf->flags &
> +	    ~(V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED |
> +	      V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE))

This is more readable because it is clearer that you are
checking flags against invalid bits:

	if (lf->flags & ~(V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED |
			  V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE))

There are similar cases like this further down, do the same there
unless you get lines that are too long.

> +		return -EINVAL;
> +
> +	/*
> +	 * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED implies
> +	 * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE.
> +	 */
> +	if (lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE &&
> +	    !(lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED))
> +		return -EINVAL;
> +
> +	/* That all values are in the accepted range. */
> +	if (lf->level > GENMASK(5, 0))
> +		return -EINVAL;
> +
> +	if (lf->sharpness > GENMASK(2, 0))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {

You can drop { here.

> +		if (lf->ref_deltas[i] < -63 || lf->ref_deltas[i] > 63)
> +			return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {

ditto

> +		if (lf->mode_deltas[i] < -63 || lf->mode_deltas[i] > 63)
> +			return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(lf->level_lookup); i++) {

ditto

> +		for (j = 0; j < ARRAY_SIZE(lf->level_lookup[0]); j++) {

ditto

> +			for (k = 0; k < ARRAY_SIZE(lf->level_lookup[0][0]); k++) {

ditto

> +				if (lf->level_lookup[i][j][k] > 63)
> +					return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +validate_vp9_quant_params(struct v4l2_vp9_quantization *quant)
> +{
> +	if (quant->delta_q_y_dc < -15 || quant->delta_q_y_dc > 15 ||
> +	    quant->delta_q_uv_dc < -15 || quant->delta_q_uv_dc > 15 ||
> +	    quant->delta_q_uv_ac < -15 || quant->delta_q_uv_ac > 15)
> +		return -EINVAL;
> +
> +	memset(quant->padding, 0, sizeof(quant->padding));

Use the zero_padding macro for this. Check other occurrence of this.

> +	return 0;
> +}
> +
> +static int
> +validate_vp9_seg_params(struct v4l2_vp9_segmentation *seg)
> +{
> +	unsigned int i, j;
> +
> +	if (seg->flags &
> +	    ~(V4L2_VP9_SEGMENTATION_FLAG_ENABLED |
> +	      V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> +	      V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE |
> +	      V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA |
> +	      V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE))
> +		return -EINVAL;
> +
> +	/*
> +	 * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP and
> +	 * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA imply
> +	 * V4L2_VP9_SEGMENTATION_FLAG_ENABLED.
> +	 */
> +	if ((seg->flags &
> +	     (V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> +	      V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA)) &&
> +	    !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED))
> +		return -EINVAL;
> +
> +	/*
> +	 * V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE implies
> +	 * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP.
> +	 */
> +	if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE &&
> +	    !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP))
> +		return -EINVAL;
> +
> +	/*
> +	 * V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE implies
> +	 * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA.
> +	 */
> +	if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE &&
> +	    !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA))
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(seg->feature_enabled); i++) {
> +		if (seg->feature_enabled[i] &
> +		    ~(V4L2_VP9_SEGMENT_FEATURE_QP_DELTA |
> +		      V4L2_VP9_SEGMENT_FEATURE_LF |
> +		      V4L2_VP9_SEGMENT_FEATURE_REF_FRAME |
> +		      V4L2_VP9_SEGMENT_FEATURE_SKIP))
> +			return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(seg->feature_data); i++) {
> +		const int range[] = {255, 63, 3, 0};

Space after/before { and }.

> +
> +		for (j = 0; j < ARRAY_SIZE(seg->feature_data[j]); j++) {
> +			if (seg->feature_data[i][j] < -range[j] ||
> +			    seg->feature_data[i][j] > range[j])
> +				return -EINVAL;
> +		}
> +	}
> +
> +	memset(seg->padding, 0, sizeof(seg->padding));
> +	return 0;
> +}
> +
> +static int
> +validate_vp9_frame_decode_params(struct v4l2_ctrl_vp9_frame_decode_params *dec_params)
> +{
> +	int ret, i;
> +
> +	/* Make sure we're not passed invalid flags. */
> +	if (dec_params->flags &
> +	    ~(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
> +	      V4L2_VP9_FRAME_FLAG_SHOW_FRAME |
> +	      V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT |
> +	      V4L2_VP9_FRAME_FLAG_INTRA_ONLY |
> +	      V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV |
> +	      V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> +	      V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
> +	      V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +	      V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING |
> +	      V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING))
> +		return -EINVAL;
> +
> +	/*
> +	 * The refresh context and error resilient flags are mutually exclusive.
> +	 * Same goes for parallel decoding and error resilient modes.
> +	 */
> +	if (dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT &&
> +	    dec_params->flags &
> +	    (V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> +	     V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE))
> +		return -EINVAL;
> +
> +	if (dec_params->profile > V4L2_VP9_PROFILE_MAX)
> +		return -EINVAL;
> +
> +	if (dec_params->reset_frame_context > V4L2_VP9_RESET_FRAME_CTX_ALL)
> +		return -EINVAL;
> +
> +	if (dec_params->frame_context_idx >= V4L2_VP9_NUM_FRAME_CTX)
> +		return -EINVAL;
> +
> +	/*
> +	 * Profiles 0 and 1 only support 8-bit depth, profiles 2 and 3 only 10
> +	 * and 12 bit depths.
> +	 */
> +	if ((dec_params->profile < 2 && dec_params->bit_depth != 8) ||
> +	    (dec_params->profile >= 2 &&
> +	     (dec_params->bit_depth != 10 && dec_params->bit_depth != 12)))
> +		return -EINVAL;
> +
> +	/* Profile 0 and 2 only accept YUV 4:2:0. */
> +	if ((dec_params->profile == 0 || dec_params->profile == 2) &&
> +	    (!(dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) ||
> +	     !(dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
> +		return -EINVAL;
> +
> +	/* Profile 1 and 3 only accept YUV 4:2:2, 4:4:0 and 4:4:4. */
> +	if ((dec_params->profile == 1 || dec_params->profile == 3) &&
> +	    ((dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) &&
> +	     (dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
> +		return -EINVAL;
> +
> +	if (dec_params->interpolation_filter > V4L2_VP9_INTERP_FILTER_SWITCHABLE)
> +		return -EINVAL;
> +
> +	/*
> +	 * According to the spec, tile_cols_log2 shall be less than or equal
> +	 * to 6.
> +	 */
> +	if (dec_params->tile_cols_log2 > 6)
> +		return -EINVAL;
> +
> +	if (dec_params->tx_mode > V4L2_VP9_TX_MODE_SELECT)
> +		return -EINVAL;
> +
> +	if (dec_params->reference_mode > V4L2_VP9_REF_MODE_SELECT)
> +		return -EINVAL;
> +
> +	for (i = 0; i < V4L2_REF_ID_CNT + 1; ++i)
> +		if (dec_params->ref_frame_sign_bias[i] != 0 &&
> +		    dec_params->ref_frame_sign_bias[i] != 1)
> +			return -EINVAL;
> +
> +	ret = validate_vp9_lf_params(&dec_params->lf);
> +	if (ret)
> +		return ret;
> +
> +	ret = validate_vp9_quant_params(&dec_params->quant);
> +	if (ret)
> +		return ret;
> +
> +	ret = validate_vp9_seg_params(&dec_params->seg);
> +	if (ret)
> +		return ret;
> +
> +	memset(dec_params->padding, 0, sizeof(dec_params->padding));
> +	return 0;
> +}
> +
>  /* Validate a new control */
>  
>  #define zero_padding(s) \
> @@ -2127,6 +2359,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  		zero_padding(p_vp8_frame->coder_state);
>  		break;
>  
> +	case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> +		return validate_vp9_frame_decode_params(p);
> +
> +	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS:
> +		break;
> +
>  	case V4L2_CTRL_TYPE_HEVC_SPS:
>  		p_hevc_sps = p;
>  
> @@ -2938,6 +3176,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_VP8_FRAME:
>  		elem_size = sizeof(struct v4l2_ctrl_vp8_frame);
>  		break;
> +	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS:
> +		elem_size = sizeof(struct v4l2_ctrl_vp9_compressed_hdr_probs);
> +		break;
> +	case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> +		elem_size = sizeof(struct v4l2_ctrl_vp9_frame_decode_params);
> +		break;
>  	case V4L2_CTRL_TYPE_HEVC_SPS:
>  		elem_size = sizeof(struct v4l2_ctrl_hevc_sps);
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 6a5d1c6d11d6..dbdafa5ea127 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1431,6 +1431,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
>  		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
>  		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
> +		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
>  		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
>  		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
>  		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a5953b812878..8c5fb22ff545 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -50,6 +50,8 @@ struct video_device;
>   * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
>   * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
>   * @p_vp8_frame:		Pointer to a VP8 frame params structure.
> + * @p_vp9_compressed_hdr_probs:	Pointer to a VP9 frame compressed header probs structure.
> + * @p_vp9_frame_decode_params:	Pointer to a VP9 frame params structure.

Why is this called p_vp9_frame_decode_params while for VP8 it is called
p_vp8_frame? The mismatch is odd. This comment is of course about the general
naming of this control, not just this field.

>   * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
>   * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
>   * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
> @@ -79,6 +81,8 @@ union v4l2_ctrl_ptr {
>  	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
>  	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
>  	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_vp9_compressed_hdr_probs *p_vp9_compressed_hdr_probs;
> +	struct v4l2_ctrl_vp9_frame_decode_params *p_vp9_frame_decode_params;
>  	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
>  	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
>  	struct v4l2_area *p_area;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index d43bec5f1afd..ff5c574f2755 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1896,6 +1896,461 @@ struct v4l2_ctrl_hdr10_mastering_display {
>  	__u32 min_display_mastering_luminance;
>  };
>  
> +/* Stateless VP9 control */

control -> controls

> +
> +/**
> + * enum v4l2_vp9_loop_filter_flags - VP9 loop filter flags
> + *
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED: the filter level depends on
> + *					     the mode and reference frame used
> + *					     to predict a block
> + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE: the bitstream contains additional
> + *					    syntax elements that specify which
> + *					    mode and reference frame deltas
> + *					    are to be updated
> + *
> + * Those are the flags you should pass to &v4l2_vp9_loop_filter.flags. See
> + * section '7.2.8 Loop filter semantics' of the VP9 specification for more
> + * details.
> + */
> +enum v4l2_vp9_loop_filter_flags {
> +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED = 1 << 0,
> +	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE = 1 << 1,
> +};
> +
> +/**
> + * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> + *
> + * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
> + * @level: indicates the loop filter strength
> + * @sharpness: indicates the sharpness level
> + * @ref_deltas: contains the adjustment needed for the filter level based on
> + *		the chosen reference frame
> + * @mode_deltas: contains the adjustment needed for the filter level based on
> + *		 the chosen mode
> + * @level_lookup: level lookup table
> + *
> + * This structure contains all loop filter related parameters. See sections
> + * '7.2.8 Loop filter semantics' and '8.8.1 Loop filter frame init process'
> + * of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_loop_filter {
> +	__u8 flags;
> +	__u8 level;
> +	__u8 sharpness;
> +	__s8 ref_deltas[4];
> +	__s8 mode_deltas[2];
> +	__u8 level_lookup[8][4][2];
> +	__u8 padding;
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
> + * Encodes the quantization parameters. See section '7.2.9 Quantization params
> + * syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_quantization {
> +	__u8 base_q_idx;
> +	__s8 delta_q_y_dc;
> +	__s8 delta_q_uv_dc;
> +	__s8 delta_q_uv_ac;
> +	__u8 padding[4];
> +};
> +
> +/**
> + * enum v4l2_vp9_segmentation_flags - VP9 segmentation flags
> + *
> + * @V4L2_VP9_SEGMENTATION_FLAG_ENABLED: indicates that this frame makes use of
> + *					the segmentation tool

Don't indent so far to the right. In case like this you just add a single TAB
after the *. Same elsewhere.

> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP: indicates that the segmentation map
> + *					   should be updated during the
> + *					   decoding of this frame
> + * @V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE: indicates that the updates to
> + *						the segmentation map are coded
> + *						relative to the existing
> + *						segmentation map
> + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA: indicates that new parameters are
> + *					    about to be specified for each
> + *					    segment
> + * @V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE: indicates that the
> + *						    segmentation parameters
> + *						    represent the actual values
> + *						    to be used
> + *
> + * Those are the flags you should pass to &v4l2_vp9_segmentation.flags. See
> + * section '7.2.10 Segmentation params syntax' of the VP9 specification for
> + * more details.
> + */
> +enum v4l2_vp9_segmentation_flags {
> +	V4L2_VP9_SEGMENTATION_FLAG_ENABLED = 1 << 0,
> +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP = 1 << 1,
> +	V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE = 1 << 2,
> +	V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA = 1 << 3,
> +	V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE = 1 << 4,
> +};
> +
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
> +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK	0xf
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
> + * Segment feature IDs. See section '7.2.10 Segmentation params syntax' of the
> + * VP9 specification for more details.
> + */
> +enum v4l2_vp9_segment_feature {
> +	V4L2_VP9_SEGMENT_FEATURE_QP_DELTA,
> +	V4L2_VP9_SEGMENT_FEATURE_LF,
> +	V4L2_VP9_SEGMENT_FEATURE_REF_FRAME,
> +	V4L2_VP9_SEGMENT_FEATURE_SKIP,
> +	V4L2_VP9_SEGMENT_FEATURE_CNT,
> +};
> +
> +/**
> + * struct v4l2_vp9_segmentation - VP9 segmentation parameters
> + *
> + * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_* flags
> + * @tree_probs: specifies the probability values to be used when
> + *              decoding a Segment-ID. See '5.15. Segmentation map'
> + *              section of the VP9 specification for more details.
> + * @pred_prob: specifies the probability values to be used when decoding a
> + *	       Predicted-Segment-ID. See '6.4.14. Get segment id syntax'
> + *	       section of :ref:`vp9` for more details..
> + * @padding: padding used to make things aligned on 64 bits. Shall be zero
> + *	     filled
> + * @feature_enabled: bitmask defining which features are enabled in each
> + *		     segment
> + * @feature_data: data attached to each feature. Data entry is only valid if
> + *		  the feature is enabled
> + *
> + * Encodes the quantization parameters. See section '7.2.10 Segmentation
> + * params syntax' of the VP9 specification for more details.
> + */
> +struct v4l2_vp9_segmentation {
> +	__u8 flags;
> +	__u8 tree_probs[7];
> +	__u8 pred_probs[3];
> +	__u8 padding[5];
> +	__u8 feature_enabled[8];
> +	__s16 feature_data[8][4];
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
> +	V4L2_VP9_INTRA_PRED_MODE_DC,
> +	V4L2_VP9_INTRA_PRED_MODE_V,
> +	V4L2_VP9_INTRA_PRED_MODE_H,
> +	V4L2_VP9_INTRA_PRED_MODE_D45,
> +	V4L2_VP9_INTRA_PRED_MODE_D135,
> +	V4L2_VP9_INTRA_PRED_MODE_D117,
> +	V4L2_VP9_INTRA_PRED_MODE_D153,
> +	V4L2_VP9_INTRA_PRED_MODE_D207,
> +	V4L2_VP9_INTRA_PRED_MODE_D63,
> +	V4L2_VP9_INTRA_PRED_MODE_TM,
> +};
> +
> +/**
> + * enum v4l2_vp9_reset_frame_context - Valid values for
> + *			&v4l2_ctrl_vp9_frame_decode_params->reset_frame_context
> + *
> + * @V4L2_VP9_RESET_FRAME_CTX_NONE: don't reset any frame context
> + * @V4L2_VP9_RESET_FRAME_CTX_SPEC: reset the frame context pointed by
> + *			&v4l2_ctrl_vp9_frame_decode_params.frame_context_idx
> + * @V4L2_VP9_RESET_FRAME_CTX_ALL: reset all frame contexts
> + *
> + * See section '7.2 Uncompressed header semantics' of the VP9 specification
> + * for more details.
> + */
> +enum v4l2_vp9_reset_frame_context {
> +	V4L2_VP9_RESET_FRAME_CTX_NONE,
> +	V4L2_VP9_RESET_FRAME_CTX_SPEC,
> +	V4L2_VP9_RESET_FRAME_CTX_ALL,
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
> + *				       block level
> + *
> + * See section '7.2.7 Interpolation filter semantics' of the VP9 specification
> + * for more details.
> + */
> +enum v4l2_vp9_interpolation_filter {
> +	V4L2_VP9_INTERP_FILTER_8TAP,
> +	V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH,
> +	V4L2_VP9_INTERP_FILTER_8TAP_SHARP,
> +	V4L2_VP9_INTERP_FILTER_BILINEAR,
> +	V4L2_VP9_INTERP_FILTER_SWITCHABLE,
> +};
> +
> +/**
> + * enum v4l2_vp9_reference_mode - VP9 reference modes
> + *
> + * @V4L2_VP9_REF_MODE_SINGLE: indicates that all the inter blocks use only a
> + *			      single reference frame to generate motion
> + *			      compensated prediction
> + * @V4L2_VP9_REF_MODE_COMPOUND: requires all the inter blocks to use compound
> + *				mode. Single reference frame prediction is not
> + *				allowed
> + * @V4L2_VP9_REF_MODE_SELECT: allows each individual inter block to select
> + *			      between single and compound prediction modes
> + *
> + * See section '7.3.6 Frame reference mode semantics' of the VP9 specification
> + * for more details.
> + */
> +enum v4l2_vp9_reference_mode {
> +	V4L2_VP9_REF_MODE_SINGLE,
> +	V4L2_VP9_REF_MODE_COMPOUND,
> +	V4L2_VP9_REF_MODE_SELECT,
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
> +	V4L2_VP9_TX_MODE_ONLY_4X4,
> +	V4L2_VP9_TX_MODE_ALLOW_8X8,
> +	V4L2_VP9_TX_MODE_ALLOW_16X16,
> +	V4L2_VP9_TX_MODE_ALLOW_32X32,
> +	V4L2_VP9_TX_MODE_SELECT,
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
> + * See section '7.4.12 Ref frames semantics' of the VP9 specification for more
> + * details.
> + */
> +enum v4l2_vp9_ref_id {
> +	V4L2_REF_ID_LAST,
> +	V4L2_REF_ID_GOLDEN,
> +	V4L2_REF_ID_ALTREF,
> +	V4L2_REF_ID_CNT,
> +};
> +
> +/**
> + * enum v4l2_vp9_frame_flags - VP9 frame flags
> + * @V4L2_VP9_FRAME_FLAG_KEY_FRAME: the frame is a key frame
> + * @V4L2_VP9_FRAME_FLAG_SHOW_FRAME: the frame should be displayed
> + * @V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT: the decoding should be error resilient
> + * @V4L2_VP9_FRAME_FLAG_INTRA_ONLY: the frame does not reference other frames
> + * @V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV: the frame might can high precision
> + *					    motion vectors
> + * @V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX: frame context should be updated
> + *					   after decoding
> + * @V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE: parallel decoding is used
> + * @V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING: vertical subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING: horizontal subsampling is enabled
> + * @V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING: full UV range is used
> + *
> + * Check the VP9 specification for more details.
> + */
> +enum v4l2_vp9_frame_flags {
> +	V4L2_VP9_FRAME_FLAG_KEY_FRAME = 1 << 0,
> +	V4L2_VP9_FRAME_FLAG_SHOW_FRAME = 1 << 1,
> +	V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT = 1 << 2,
> +	V4L2_VP9_FRAME_FLAG_INTRA_ONLY = 1 << 3,
> +	V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV = 1 << 4,
> +	V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX = 1 << 5,
> +	V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE = 1 << 6,
> +	V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING = 1 << 7,
> +	V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING = 1 << 8,
> +	V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING = 1 << 9,
> +};
> +
> +#define V4L2_VP9_PROFILE_MAX		3
> +
> +#define V4L2_CID_STATELESS_VP9_FRAME_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 300)
> +/**
> + * struct v4l2_ctrl_vp9_frame_decode_params - VP9 frame decoding control
> + *
> + * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
> + * @compressed_header_size: compressed header size in bytes
> + * @uncompressed_header_size: uncompressed header size in bytes
> + * @profile: VP9 profile. Can be 0, 1, 2 or 3
> + * @reset_frame_context: specifies whether the frame context should be reset
> + *			 to default values. See &v4l2_vp9_reset_frame_context
> + *			 for more details
> + * @frame_context_idx: frame context that should be used/updated
> + * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not all
> + *	       profiles support 10 and/or 12 bits depths
> + * @interpolation_filter: specifies the filter selection used for performing
> + *			  inter prediction. See &v4l2_vp9_interpolation_filter
> + *			  for more details
> + * @tile_cols_log2: specifies the base 2 logarithm of the width of each tile
> + *		    (where the width is measured in units of 8x8 blocks).
> + *		    Shall be less than or equal to 6
> + * @tile_rows_log2: specifies the base 2 logarithm of the height of each tile
> + *		    (where the height is measured in units of 8x8 blocks)
> + * @tx_mode: specifies the TX mode. See &v4l2_vp9_tx_mode for more details
> + * @reference_mode: specifies the type of inter prediction to be used. See
> + *		    &v4l2_vp9_reference_mode for more details
> + * @padding: needed to make this struct 64 bit aligned. Shall be filled with
> + *	     zeros
> + * @frame_width_minus_1: add 1 to it and you'll get the frame width expressed
> + *			 in pixels
> + * @frame_height_minus_1: add 1 to it and you'll get the frame height expressed
> + *			  in pixels
> + * @render_width_minus_1: add 1 to it and you'll get the expected render width
> + *			 expressed in pixels. This is not used during the
> + *			 decoding process but might be used by HW scalers to
> + *			 prepare a frame that's ready for scanout
> + * @render_height_minus_1: add 1 to it and you'll get the expected render height
> + *			 expressed in pixels. This is not used during the
> + *			 decoding process but might be used by HW scalers to
> + *			 prepare a frame that's ready for scanout
> + * @refs: array of ref frames timestamps. See &v4l2_vp9_ref_id for more details
> + * @ref_frame_sign_bias: array of reference frames motion vector sign bias
> + *			(prediction direction)
> + * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more details
> + * @quant: quantization parameters. See &v4l2_vp9_quantization for more details
> + * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more details
> + */
> +struct v4l2_ctrl_vp9_frame_decode_params {
> +	__u32 flags;
> +	__u16 compressed_header_size;
> +	__u16 uncompressed_header_size;
> +	__u8 profile;
> +	__u8 reset_frame_context;
> +	__u8 frame_context_idx;
> +	__u8 bit_depth;
> +	__u8 interpolation_filter;
> +	__u8 tile_cols_log2;
> +	__u8 tile_rows_log2;
> +	__u8 tx_mode;
> +	__u8 reference_mode;
> +	__u8 padding[7];
> +	__u16 frame_width_minus_1;
> +	__u16 frame_height_minus_1;
> +	__u16 render_width_minus_1;
> +	__u16 render_height_minus_1;
> +	__u64 refs[V4L2_REF_ID_CNT];
> +	__u8 ref_frame_sign_bias[V4L2_REF_ID_CNT + 1];
> +	struct v4l2_vp9_loop_filter lf;
> +	struct v4l2_vp9_quantization quant;
> +	struct v4l2_vp9_segmentation seg;
> +};
> +
> +#define V4L2_VP9_NUM_FRAME_CTX	4
> +
> +/**
> + * struct v4l2_vp9_mv_compressed_hdr_probs - VP9 Motion vector probability updates
> + * @joint: motion vector joint probability updates
> + * @sign: motion vector sign probability updates
> + * @class: motion vector class probability updates
> + * @class0_bit: motion vector class0 bit probability updates
> + * @bits: motion vector bits probability updates
> + * @class0_fr: motion vector class0 fractional bit probability updates
> + * @fr: motion vector fractional bit probability updates
> + * @class0_hp: motion vector class0 high precision fractional bit probability updates
> + * @hp: motion vector high precision fractional bit probability updates
> + *
> + * This structure contains new values of motion vector probabilities.
> + * A value of zero means there is no update.

'A value of zero': do you mean that the whole struct is zeroed, or just specific
arrays or single bytes? It's not clear to me at what level this is done.

> + * See `struct v4l2_vp9_prob_updates` for details.
> + */
> +struct v4l2_vp9_mv_compressed_hdr_probs {
> +	__u8 joint[3];
> +	__u8 sign[2];
> +	__u8 class[2][10];
> +	__u8 class0_bit[2];
> +	__u8 bits[2][10];
> +	__u8 class0_fr[2][2][3];
> +	__u8 fr[2][3];
> +	__u8 class0_hp[2];
> +	__u8 hp[2];
> +};
> +
> +#define V4L2_CID_STATELESS_VP9_COMPRESSED_HDR_PROBS	(V4L2_CID_CODEC_STATELESS_BASE + 301)
> +/**
> + * struct v4l2_ctrl_vp9_compressed_hdr_probs - VP9 probability updates control
> + * @tx8: TX 8x8 probability updates
> + * @tx16: TX 16x16 probability updates
> + * @tx32: TX 32x32 probability updates
> + * @coef: coefficient probability updates
> + * @skip: skip probability updates
> + * @inter_mode: inter mode probability updates
> + * @interp_filter: interpolation filter probability updates
> + * @is_inter: is inter-block probability updates
> + * @comp_mode: compound prediction mode probability updates
> + * @single_ref: single ref probability updates
> + * @comp_ref: compound ref probability updates
> + * @y_mode: Y prediction mode probability updates
> + * @uv_mode: UV prediction mode probability updates
> + * @partition: partition probability updates
> + * @mv: motion vector probability updates
> + *
> + * This structure holds the probabilities update as parsed in the compressed
> + * header (Spec 6.3). These values represent the value of probability update after
> + * being translated with inv_map_table[] (see 6.3.5). A value of zero means that
> + * there is no update.

Same question.

> + */
> +struct v4l2_ctrl_vp9_compressed_hdr_probs {
> +	__u8 tx8[2][1];
> +	__u8 tx16[2][2];
> +	__u8 tx32[2][3];
> +	__u8 coef[4][2][2][6][6][3];
> +	__u8 skip[3];
> +	__u8 inter_mode[7][3];
> +	__u8 interp_filter[4][2];
> +	__u8 is_inter[4];
> +	__u8 comp_mode[5];
> +	__u8 single_ref[5][2];
> +	__u8 comp_ref[5];
> +	__u8 y_mode[4][9];
> +	__u8 uv_mode[10][9];
> +	__u8 partition[16][3];
> +
> +	struct v4l2_vp9_mv_compressed_hdr_probs mv;
> +};
> +
>  /* MPEG-compression definitions kept for backwards compatibility */
>  #ifndef __KERNEL__
>  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 311a01cc5775..508e2d6825b1 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -697,6 +697,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
>  #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
>  #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
> +#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
>  #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
>  #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
>  #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
> @@ -1747,6 +1748,8 @@ struct v4l2_ext_control {
>  		struct v4l2_ctrl_h264_decode_params __user *p_h264_decode_params;
>  		struct v4l2_ctrl_fwht_params __user *p_fwht_params;
>  		struct v4l2_ctrl_vp8_frame __user *p_vp8_frame;
> +		struct v4l2_ctrl_vp9_compressed_hdr_probs __user *p_vp9_compressed_hdr_probs;
> +		struct v4l2_ctrl_vp9_frame_decode_params __user *p_vp9_frame_decode_params;
>  		void __user *ptr;
>  	};
>  } __attribute__ ((packed));
> @@ -1807,6 +1810,9 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
>  
>  	V4L2_CTRL_TYPE_VP8_FRAME            = 0x0240,
> +
> +	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR_PROBS	= 0x0260,
> +	V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS	= 0x0261,
>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> 

Regards,

	Hans

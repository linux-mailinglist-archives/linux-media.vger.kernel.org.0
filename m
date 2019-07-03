Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A435E6A5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 16:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfGCO3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 10:29:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39193 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGCO3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 10:29:11 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1higFx-0003B7-Qx; Wed, 03 Jul 2019 16:29:09 +0200
Message-ID: <1562164149.4604.9.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] media: uapi: Add VP8 stateless decoder API
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Pawel Osciak <posciak@chromium.org>
Date:   Wed, 03 Jul 2019 16:29:09 +0200
In-Reply-To: <20190702170016.5210-2-ezequiel@collabora.com>
References: <20190702170016.5210-1-ezequiel@collabora.com>
         <20190702170016.5210-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-07-02 at 14:00 -0300, Ezequiel Garcia wrote:
> From: Pawel Osciak <posciak@chromium.org>
> 
> Add the parsed VP8 frame pixel format and controls, to be used
> with the new stateless decoder API for VP8 to provide parameters
> for accelerator (aka stateless) codecs.
> 
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> Changes from v1:
> * Move 1-bit fields to flags in the respective structures.
> * Add padding fields to make all structures 8-byte aligned.
> * Reorder fields where needed to avoid padding as much as possible.
> * Fix documentation as needed.
> 
> Changes from RFC:
> * Make sure the uAPI has the same size on x86, x86_64, arm and arm64.
> * Move entropy coder state fields to a struct.
> * Move key_frame field to the flags.
> * Remove unneeded first_part_offset field.
> * Add documentation.
> ---
>  Documentation/media/uapi/v4l/biblio.rst       |  10 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 323 ++++++++++++++++++
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  20 ++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   3 +
>  include/media/vp8-ctrls.h                     | 110 ++++++
>  7 files changed, 475 insertions(+)
>  create mode 100644 include/media/vp8-ctrls.h
> 
> diff --git a/Documentation/media/uapi/v4l/biblio.rst b/Documentation/media/uapi/v4l/biblio.rst
> index 8f4eb8823d82..ad2ff258afa8 100644
> --- a/Documentation/media/uapi/v4l/biblio.rst
> +++ b/Documentation/media/uapi/v4l/biblio.rst
> @@ -395,3 +395,13 @@ colimg
>  :title:     Color Imaging: Fundamentals and Applications
>  
>  :author:    Erik Reinhard et al.
> +
> +.. _vp8:
> +
> +VP8
> +===
> +
> +
> +:title:     RFC 6386: "VP8 Data Format and Decoding Guide"
> +
> +:author:    J. Bankoski et al.
> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> index d6ea2ffd65c5..aef335f175cd 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -2234,6 +2234,329 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Quantization parameter for a P frame for FWHT. Valid range: from 1
>      to 31.
>  
> +.. _v4l2-mpeg-vp8:
> +
> +``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (struct)``
> +    Specifies the frame parameters for the associated VP8 parsed frame data.
> +    This includes the necessary parameters for
> +    configuring a stateless hardware decoding pipeline for VP8.
> +    The bitstream parameters are defined according to :ref:`vp8`.
> +
> +    .. note::
> +
> +       This compound control is not yet part of the public kernel API and
> +       it is expected to change.
> +
> +.. c:type:: v4l2_ctrl_vp8_frame_header
> +
> +.. cssclass:: longtable
> +
> +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> +
> +.. flat-table:: struct v4l2_ctrl_vp8_frame_header
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - struct :c:type:`v4l2_vp8_segment_header`
> +      - ``segment_header``
> +      - Structure with segment-based adjustments metadata.
> +    * - struct :c:type:`v4l2_vp8_loopfilter_header`
> +      - ``loopfilter_header``
> +      - Structure with loop filter level adjustments metadata.
> +    * - struct :c:type:`v4l2_vp8_quantization_header`
> +      - ``quant_header``
> +      - Structure with VP8 dequantization indices metadata.
> +    * - struct :c:type:`v4l2_vp8_entropy_header`
> +      - ``entropy_header``
> +      - Structure with VP8 entropy coder probabilities metadata.
> +    * - struct :c:type:`v4l2_vp8_entropy_coder_state`
> +      - ``coder_state``
> +      - Structure with VP8 entropy coder state.
> +    * - __u16
> +      - ``width``
> +      - The width of the frame. Must be set for all frames.
> +    * - __u16
> +      - ``height``
> +      - The height of the frame. Must be set for all frames.
> +    * - __u8
> +      - ``horizontal_scale``
> +      - Horizontal scaling factor.
> +    * - __u8
> +      - ``vertical_scaling factor``
> +      - Vertical scale.
> +    * - __u8
> +      - ``version``
> +      - Bitstream version.
> +    * - __u8
> +      - ``prob_skip_false``
> +      - Indicates the probability that the macroblock is not skipped.
> +    * - __u8
> +      - ``prob_intra``
> +      - Indicates the probability that a macroblock is intra-predicted.
> +    * - __u8
> +      - ``prob_last``
> +      - Indicates the probability that the last reference frame is used
> +        for inter-prediction
> +    * - __u8
> +      - ``prob_gf``
> +      - Indicates the probability that the golden reference frame is used
> +        for inter-prediction
> +    * - __u8
> +      - ``num_dct_parts``
> +      - Number of DCT coefficients partitions.

I assume this must be no larger than 8. Is this mandated by the spec? If
so, should it be documented here and checked by v4l2-core?

regards
Philipp

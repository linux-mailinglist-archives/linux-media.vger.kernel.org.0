Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8DB0483D6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfFQNXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:23:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54092 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbfFQNXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:23:22 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9FA82639EE;
        Mon, 17 Jun 2019 14:23:19 +0100 (BST)
Date:   Mon, 17 Jun 2019 15:23:17 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pawel Osciak <posciak@chromium.org>
Subject: Re: [PATCH 1/2] media: uapi: Add VP8 stateless decoder API
Message-ID: <20190617152310.299d60e8@collabora.com>
In-Reply-To: <20190613151040.8971-2-ezequiel@collabora.com>
References: <20190613151040.8971-1-ezequiel@collabora.com>
        <20190613151040.8971-2-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 13 Jun 2019 12:10:39 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> From: Pawel Osciak <posciak@chromium.org>
> 
> Add the parsed VP8 frame pixel format and controls, to be used
> with the new stateless decoder API for VP8 to provide parameters
> for accelerator (aka stateless) codecs.
> 
> Signed-off-by: Pawel Osciak <posciak@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> Changes from RFC:
> * Make sure the uAPI has the same size on x86, x86_64, arm and arm64.
> * Move entropy coder state fields to a struct.
> * Move key_frame field to the flags.
> * Remove unneeded first_part_offset field.
> * Add documentation.
> ---
>  Documentation/media/uapi/v4l/biblio.rst       |  10 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        | 311 ++++++++++++++++++
>  .../media/uapi/v4l/pixfmt-compressed.rst      |  20 ++
>  drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/media/v4l2-ctrls.h                    |   3 +
>  include/media/vp8-ctrls.h                     | 110 +++++++
>  7 files changed, 463 insertions(+)
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
> index d6ea2ffd65c5..7a1947f5be96 100644
> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> @@ -2234,6 +2234,317 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Quantization parameter for a P frame for FWHT. Valid range: from 1
>      to 31.
>  
> +.. _v4l2-mpeg-vp8:
> +
> +``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (struct)``
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
> +    * - __u8
> +      - ``version``
> +      - Bitstream version.
> +    * - __u16
> +      - ``width``
> +      - The width of the frame

Nit: sometimes you finish your description with a final dot sometimes
not. It's probably better to make that consistent.


[...]

> diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
> new file mode 100644
> index 000000000000..3b0dcc125e25
> --- /dev/null
> +++ b/include/media/vp8-ctrls.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * These are the VP8 state controls for use with stateless VP8
> + * codec drivers.
> + *
> + * It turns out that these structs are not stable yet and will undergo
> + * more changes. So keep them private until they are stable and ready to
> + * become part of the official public API.
> + */
> +
> +#ifndef _VP8_CTRLS_H_
> +#define _VP8_CTRLS_H_
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frames */
> +
> +#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (V4L2_CID_MPEG_BASE + 2000)
> +#define V4L2_CTRL_TYPE_VP8_FRAME_HDR 0x301
> +
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED              0x01
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP           0x02
> +#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_FEATURE_DATA  0x04
> +
> +struct v4l2_vp8_segment_header {
> +	__u8 segment_feature_mode;
> +	__s8 quant_update[4];
> +	__s8 lf_update[4];
> +	__u8 segment_probs[3];
> +	__u32 flags;
> +};
> +
> +#define V4L2_VP8_LF_HDR_ADJ_ENABLE	0x01
> +#define V4L2_VP8_LF_HDR_DELTA_UPDATE	0x02
> +struct v4l2_vp8_loopfilter_header {
> +	__u16 type;
> +	__u8 level;
> +	__u8 sharpness_level;
> +	__s8 ref_frm_delta_magnitude[4];
> +	__s8 mb_mode_delta_magnitude[4];
> +	__u16 flags;
> +};
> +
> +struct v4l2_vp8_quantization_header {
> +	__u8 y_ac_qi;
> +	__s8 y_dc_delta;
> +	__s8 y2_dc_delta;
> +	__s8 y2_ac_delta;
> +	__s8 uv_dc_delta;
> +	__s8 uv_ac_delta;

Don't know what the policy in V4L, but it's usually a good thing to
have structs used to exchange data with userspace aligned on 64-bits.
Maybe you can add 2 padding bytes here. Note that the compiler might
anyway add padding to align struct fields to their natural alignment in
v4l2_ctrl_vp8_frame_header, so it's probably better to have these
padding bytes explicitly defined and mandate that they be set to 0 so
we can check them and complain when they're not 0.

> +	__u16 dequant_factors[4][3][2];
> +};
> +
> +struct v4l2_vp8_entropy_header {
> +	__u8 coeff_probs[4][8][3][11];
> +	__u8 y_mode_probs[4];
> +	__u8 uv_mode_probs[3];
> +	__u8 mv_probs[2][19];

Same here

> +};
> +
> +struct v4l2_vp8_entropy_coder_state {
> +	__u8 range;
> +	__u8 value;
> +	__u8 bit_count;

and here.

> +};
> +
> +#define V4L2_VP8_FRAME_HDR_FLAG_KEY_FRAME		0x01
> +#define V4L2_VP8_FRAME_HDR_FLAG_EXPERIMENTAL		0x02
> +#define V4L2_VP8_FRAME_HDR_FLAG_SHOW_FRAME		0x04
> +#define V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF	0x08
> +
> +#define VP8_FRAME_IS_KEY_FRAME(hdr) (!!(hdr->flags & V4L2_VP8_FRAME_HDR_FLAG_KEY_FRAME))
> +
> +struct v4l2_ctrl_vp8_frame_header {
> +	__u8 version;
> +

Maybe we should try to pack things so that the compiler does not
implicitly add extra padding bytes. That implies trying to group u8
fields by 2, 4 or 8 depending on what the next field natural alignment
is.

> +	/* Populated also if not a key frame */
> +	__u16 width;
> +	__u16 height;
> +	__u8 horizontal_scale;
> +	__u8 vertical_scale;
> +
> +	struct v4l2_vp8_segment_header segment_header;
> +	struct v4l2_vp8_loopfilter_header lf_header;
> +	struct v4l2_vp8_quantization_header quant_header;
> +	struct v4l2_vp8_entropy_header entropy_header;
> +
> +	__u16 sign_bias_golden;
> +	__u16 sign_bias_alternate;
> +
> +	__u8 prob_skip_false;
> +	__u8 prob_intra;
> +	__u8 prob_last;
> +	__u8 prob_gf;
> +
> +	__u32 first_part_size;
> +	__u32 macroblock_bit_offset;
> +	__u32 dct_part_sizes[8];
> +	__u8 num_dct_parts;
> +
> +	struct v4l2_vp8_entropy_coder_state coder_state;
> +
> +	__u64 last_frame_ts;
> +	__u64 golden_frame_ts;
> +	__u64 alt_frame_ts;
> +
> +	__u64 flags;
> +};
> +
> +#endif


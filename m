Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D1E34D820
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 21:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhC2T14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 15:27:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53606 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhC2T1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 15:27:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 577E61F454DE
Message-ID: <3e57b10998f610259d3d9702307ce30b744623a0.camel@collabora.com>
Subject: Re: [PATCH v7 04/13] media: hevc: Add fields and flags for hevc PPS
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        lee.jones@linaro.org, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Mon, 29 Mar 2021 16:27:31 -0300
In-Reply-To: <20210329065743.11961-5-benjamin.gaignard@collabora.com>
References: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
         <20210329065743.11961-5-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-03-29 at 08:57 +0200, Benjamin Gaignard wrote:
> Add fields and flags as they are defined in
> 7.4.3.3.1 "General picture parameter set RBSP semantics of the
> H.265 ITU specification.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 14 ++++++++++++++
>  include/media/hevc-ctrls.h                         |  4 ++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 188aef8e40d0..92314aec655a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -2967,6 +2967,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - __u8
>        - ``num_extra_slice_header_bits``
>        -
> +    * - __u8
> +      - ``num_ref_idx_l0_default_active_minus1``
> +      - Specifies the inferred value of num_ref_idx_l0_active_minus1
> +    * - __u8
> +      - ``num_ref_idx_l1_default_active_minus1``
> +      - Specifies the inferred value of num_ref_idx_l1_active_minus1
>      * - __s8
>        - ``init_qp_minus26``
>        -
> @@ -3077,6 +3083,14 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>      * - ``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
>        - 0x00040000
>        -
> +    * - ``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
> +      - 0x00080000
> +      - Specifies the presence of deblocking filter control syntax elements in
> +        the PPS
> +    * - ``V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING``
> +      - 0x00100000
> +      - Specifies that tile column boundaries and likewise tile row boundaries
> +        are distributed uniformly across the picture
>  
>  .. raw:: latex
>  
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index b4cb2ef02f17..003f819ecb26 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -100,10 +100,14 @@ struct v4l2_ctrl_hevc_sps {
>  #define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER       (1ULL << 16)
>  #define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT          (1ULL << 17)
>  #define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL << 18)
> +#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT   (1ULL << 19)
> +#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING                     (1ULL << 20)
>  
>  struct v4l2_ctrl_hevc_pps {
>         /* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
>         __u8    num_extra_slice_header_bits;
> +       __u8    num_ref_idx_l0_default_active_minus1;
> +       __u8    num_ref_idx_l1_default_active_minus1;
>         __s8    init_qp_minus26;
>         __u8    diff_cu_qp_delta_depth;
>         __s8    pps_cb_qp_offset;



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C0436EB7A
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbhD2Noh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:44:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35160 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbhD2Nod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:44:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0147E1F434AA
Message-ID: <47800413ff99225e39f46c841bfb8061aee6d1b6.camel@collabora.com>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
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
        kernel@collabora.com, cphealy@gmail.com
Date:   Thu, 29 Apr 2021 10:43:25 -0300
In-Reply-To: <20210420121046.181889-7-benjamin.gaignard@collabora.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-04-20 at 14:10 +0200, Benjamin Gaignard wrote:
> The HEVC HANTRO driver needs to know the number of bits to skip at
> the beginning of the slice header.
> That is a hardware specific requirement so create a dedicated control
> for this purpose.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |  1 +
>  include/media/hevc-ctrls.h                    | 13 +++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
> new file mode 100644
> index 000000000000..cd9754b4e005
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> @@ -0,0 +1,19 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Hantro video decoder driver
> +===========================
> +
> +The Hantro video decoder driver implements the following driver-specific controls:
> +
> +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
> +    skip in the slice segment header.
> +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> +    to before syntax element "slice_temporal_mvp_enabled_flag".
> +    If IDR, the skipped bits are just "pic_output_flag"
> +    (separate_colour_plane_flag is not supported).
> +
> +.. note::
> +
> +        This control is not yet part of the public kernel API and
> +        it is expected to change.
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 1a9038f5f9fa..12e3c512d718 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  
>         ccs
>         cx2341x-uapi
> +        hantro
>         imx-uapi
>         max2175
>         meye-uapi
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 8e0109eea454..b713eeed1915 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
>         __u64   flags;
>  };
>  
> +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
> +#define V4L2_CID_CODEC_HANTRO_BASE                             (V4L2_CTRL_CLASS_CODEC | 0x1200)
> +/*
> + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
> + * the number of data (in bits) to skip in the
> + * slice segment header.
> + * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> + * to before syntax element "slice_temporal_mvp_enabled_flag".
> + * If IDR, the skipped bits are just "pic_output_flag"
> + * (separate_colour_plane_flag is not supported).
> + */
> +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (V4L2_CID_CODEC_HANTRO_BASE + 0)
> +
>  #endif



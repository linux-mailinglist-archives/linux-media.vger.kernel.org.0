Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6733352AA8
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 14:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235377AbhDBM1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 08:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235373AbhDBM1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 08:27:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B49C0613E6;
        Fri,  2 Apr 2021 05:27:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5C3AE1F442CC
Message-ID: <5674859659f93ba547cad43528ac94ef145347b3.camel@collabora.com>
Subject: Re: [PATCH v8 09/13] media: uapi: Add a control for HANTRO driver
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
Date:   Fri, 02 Apr 2021 09:27:28 -0300
In-Reply-To: <20210401160003.88803-10-benjamin.gaignard@collabora.com>
References: <20210401160003.88803-1-benjamin.gaignard@collabora.com>
         <20210401160003.88803-10-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thanks for the patch.

On Thu, 2021-04-01 at 17:59 +0200, Benjamin Gaignard wrote:
> The HEVC HANTRO driver needs to know the number of bits to skip at
> the beginning of the slice header.
> That is a hardware specific requirement so create a dedicated control
> that this purpose.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 5:
>  - Be even more verbose in control documentation.
>  - Do not create class for the control.
> version 4:
> - The control is now an integer which is enough to provide the numbers
>   of bits to skip.
> version 3:
> - Fix typo in field name
> 
>  .../userspace-api/media/drivers/hantro.rst         | 14 ++++++++++++++
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  include/uapi/linux/v4l2-controls.h                 | 13 +++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
> 
> diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
> new file mode 100644
> index 000000000000..78dcd2a44a03
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> @@ -0,0 +1,14 @@
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
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index f3376aafea65..1dfb874b6272 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -869,6 +869,19 @@ enum v4l2_mpeg_mfc51_video_force_frame_type {
>  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC              (V4L2_CID_CODEC_MFC51_BASE+53)
>  #define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P               (V4L2_CID_CODEC_MFC51_BASE+54)
>  
> +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */

We are moving away from "MPEG" terminology for codecs.

> +#define V4L2_CID_CODEC_HANTRO_BASE                             (V4L2_CTRL_CLASS_CODEC | 0x1200)

Using V4L2_CTRL_CLASS_CODEC_STATELESS is IMO better,
since this belongs to a stateless decoder.

And also, since we are still a bit unsure about the
syntax of this parameter (given it's not documented):

how about keeping the V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP
definition in drivers/staging/media/hantro/hantro.h ?

This would be a hint for applications that this control
is a quirk.

Hans, Philipp, any thoughts on this?

Regards,
Ezequiel


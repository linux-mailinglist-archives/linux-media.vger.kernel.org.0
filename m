Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204B4373DFC
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 16:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhEEO4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 10:56:13 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39969 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233309AbhEEO4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 10:56:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id eIvblNhz3WztCeIvelLmDW; Wed, 05 May 2021 16:55:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620226512; bh=a9bwAO8/d8Jte5gbnZ6hWeu/N4gY3zXOYoK86Tx0wKo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l1jp6/QflViLdj07ys0xqiPUOqtxLytWpvBIV2eHJHfOOPitkWKkTxIMUnsLaS+W+
         N7USdyoN3rAXrm55ClG1YkG/bhznw5+8nCCM6JrFLqKzfbZS0Ht3Zk2BA9g1Ddu7WG
         DzWCHplasGzSXDsp2b1jx4H62jDxJTbesi0mCnTUUERb+mDKCoYXGHDuVODu5nnFLu
         lB+LtkQV+POlUOjQhpOw8y0lrKFl5k83IkRyBwFL7VSQdUVY3Voy1BW9WBiO6B0/5n
         HkdUiKCIs0YyxVpojUcqk4WrAImsea7g3EsuieV4gweRQ2yzoFMFULtemw+4Hhpper
         IVVkbx5ezxVWQ==
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
 <20210420121046.181889-7-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
Date:   Wed, 5 May 2021 16:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420121046.181889-7-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH+D4/P91TVy0EuRVOPmOcXqXGI+nR9CcO/KU85YvbZGxsCDh9RBU8noV/2jFD3cf4qzM2rx2mNW0gT+YGbLDQhyIzRGzmmogkVBCpTk//D/BBhVqUxO
 2RVIINc8ohtdbYxf6N7HREEB0rlkd1E/iaMdFfeWpiYFg3njYDHQamw7lFuGhNInaUMcMs6Hgx7Yv/ObKGZhXAFipEWi1jzZcA/F9GESyOOjVtYgKcotpxvc
 JV+185F+ZFivxeeeyfBP0nVI/ZMg4+iq2t6nCGDCgYUvXT+AHJ5fWHsKvTbtIM5sUr7omZONA6S9o09aYx2nzjiD7K+qjO1uvuXqGy9MjtvLG5BZ3NfgVeiQ
 X0cugdLM9wTygXqSJh4a1N7sKvzI3ZR8ru5AAhegDVQJ2qn3L90GzXzVpcPpk2kLsk61xDOZ57+sz0km5QQ9eJ3VzlqOjhcK0pIJ1IS7T2lFyqRLIB7cx/ts
 DtWJoSPMBFHCos8ma4I81IaXSVlWk+bZA9gkK7UU0zHlurQaMNa13My+2m1X5aoEjNyZ6bseI7mIwcNxbkhnVFJD/qTmRnkMmZY0VHj6dBJruf0UCXMBdwMH
 dSTHRD5KX8oRIr+5XGaJW77PgwnOewh5Ne4MXKSFJLDE7IenkYSz5Jl6/RVU12iZf1nFSgcfjTRa0oCqHWC77ivYQZvzRhUXO7X5piViNM1OOvuVr1e+8HWB
 yHaZuOnd7WUhrHqsXryjOdy73/oFvAVLCfgPU6UXqgs1WSAM3dIjRiviIH2CXUMMtRo7ShFWqAbJo5nehgao1uUSIaYGF2pPJ30QikGXteaJJ39gyDsWYo5E
 9GaJVvx0WuzIjPHy5F+40SchwiD3A0vwM0txuMiC+oKWUJqlqHhnAA8B6fMUN7DZsO+6wypdaui6bTCWCaz2JIvX/oXH5Fw1XR+JWIuqu+uf0aB6aebsUrUS
 +0G6yrQQAMvrwOplbFBcCxLlulukDGo31SE3ovfX8e4gZLNgLB2Mf7pnmlY2s8NsRW6OFl2wq9Uud+GdELuGrR5lk2qIuEWb6P2wFseTHEQXsKuh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 14:10, Benjamin Gaignard wrote:
> The HEVC HANTRO driver needs to know the number of bits to skip at
> the beginning of the slice header.
> That is a hardware specific requirement so create a dedicated control
> for this purpose.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |  1 +
>  include/media/hevc-ctrls.h                    | 13 +++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
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
> +    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
> +    skip in the slice segment header.
> +    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> +    to before syntax element "slice_temporal_mvp_enabled_flag".
> +    If IDR, the skipped bits are just "pic_output_flag"
> +    (separate_colour_plane_flag is not supported).

I'm not very keen on this. Without this information the video data cannot be
decoded, or will it just be suboptimal?

The problem is that a generic decoder would have to know that the HW is a hantro,
and then call this control. If they don't (and are testing on non-hantro HW), then
it won't work, thus defeating the purpose of the HW independent decoder API.

Since hantro is widely used, and if there is no other way to do this beside explitely
setting this control, then perhaps this should be part of the standard HEVC API.
Non-hantro drivers that do not need this can just skip it.

Regards,

	Hans

> +
> +.. note::
> +
> +        This control is not yet part of the public kernel API and
> +        it is expected to change.
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 1a9038f5f9fa..12e3c512d718 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  
>  	ccs
>  	cx2341x-uapi
> +        hantro
>  	imx-uapi
>  	max2175
>  	meye-uapi
> diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> index 8e0109eea454..b713eeed1915 100644
> --- a/include/media/hevc-ctrls.h
> +++ b/include/media/hevc-ctrls.h
> @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
>  	__u64	flags;
>  };
>  
> +/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
> +#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
> +/*
> + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
> + * the number of data (in bits) to skip in the
> + * slice segment header.
> + * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
> + * to before syntax element "slice_temporal_mvp_enabled_flag".
> + * If IDR, the skipped bits are just "pic_output_flag"
> + * (separate_colour_plane_flag is not supported).
> + */
> +#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
> +
>  #endif
> 


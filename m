Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24022325139
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 15:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhBYOGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 09:06:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43614 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhBYOG0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 09:06:26 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 439961F4617B
Message-ID: <3a2b4d06a363541c475dbc1bbf61d90b3a1b0cc0.camel@collabora.com>
Subject: Re: [PATCH v3 4/9] media: uapi: Add a control for HANTRO driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Thu, 25 Feb 2021 11:05:32 -0300
In-Reply-To: <20210222122406.41782-5-benjamin.gaignard@collabora.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
         <20210222122406.41782-5-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2021-02-22 at 13:24 +0100, Benjamin Gaignard wrote:
> The HEVC HANTRO driver needs to know the number of bits to skip at

s/HANTRO/Hantro

> the beginning of the slice header.

As discussed in a different thread, we should describe exactly
what the hardware is expecting, so applications can parse that
and pass a correct value.

> That is a hardware specific requirement so create a dedicated control
> that this purpose.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 3:
> - Fix typo in field name
> 
>  include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  5 +++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
> 
> diff --git a/include/uapi/linux/hantro-v4l2-controls.h b/include/uapi/linux/hantro-v4l2-controls.h
> new file mode 100644
> index 000000000000..a8dfd6b1a2a9
> --- /dev/null
> +++ b/include/uapi/linux/hantro-v4l2-controls.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#ifndef __UAPI_HANTRO_V4L2_CONYTROLS_H__
> +#define __UAPI_HANTRO_V4L2_CONYTROLS_H__
> +
> +#include <linux/v4l2-controls.h>
> +#include <media/hevc-ctrls.h>
> +
> +#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS       (V4L2_CID_USER_HANTRO_BASE + 0)
> +
> +/**
> + * struct hantro_hevc_extra_decode_params - extra decode parameters for hantro driver
> + * @hevc_hdr_skip_length:      header first bits offset
> + */
> +struct hantro_hevc_extra_decode_params {
> +       __u32   hevc_hdr_skip_length;
> +       __u8    padding[4];
> +};
> +

I think we can get away with a simpler solution. Since it's just one integer
we need, there's no need for a compound control. Something like this:

                .codec = HANTRO_HEVC_DECODER,                                    
                .cfg = {                                                         
                        .id = V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP,            
                        .name = "Hantro HEVC slice header skip bytes",           
                        .type = V4L2_CTRL_TYPE_INTEGER,                          
                        .min = 0,                                                
                        .max = 0x7fffffff,                                       
                        .step = 1,                                               
                },     

Also see V4L2_CID_CODA_MB_ERR_CNT which is defined in drivers/media/platform/coda/coda.h.
The control is sufficiently special that it could be kept in an internal driver header.

> +#endif
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 039c0d7add1b..ced7486c7f46 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -209,6 +209,11 @@ enum v4l2_colorfx {
>   * We reserve 128 controls for this driver.
>   */
>  #define V4L2_CID_USER_CCS_BASE                 (V4L2_CID_USER_BASE + 0x10f0)
> +/*
> + * The base for HANTRO driver controls.
> + * We reserve 32 controls for this driver.
> + */
> +#define V4L2_CID_USER_HANTRO_BASE              (V4L2_CID_USER_BASE + 0x1170)
>  
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls

Thanks,
Ezequiel


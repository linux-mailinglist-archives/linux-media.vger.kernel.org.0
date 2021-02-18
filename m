Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789AD31F1CF
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 22:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBRVpa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 18 Feb 2021 16:45:30 -0500
Received: from mailoutvs11.siol.net ([185.57.226.202]:59298 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229620AbhBRVp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 16:45:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 962EC521DBF;
        Thu, 18 Feb 2021 22:34:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ej1WVbFCk5fB; Thu, 18 Feb 2021 22:34:56 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 33026521ECB;
        Thu, 18 Feb 2021 22:34:56 +0100 (CET)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id A06FD521DBF;
        Thu, 18 Feb 2021 22:34:51 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 4/9] media: uapi: Add a control for HANTRO driver
Date:   Thu, 18 Feb 2021 22:34:51 +0100
Message-ID: <2850677.34AhzSeaHW@kista>
In-Reply-To: <20210218191844.297869-5-benjamin.gaignard@collabora.com>
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com> <20210218191844.297869-5-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne četrtek, 18. februar 2021 ob 20:18:39 CET je Benjamin Gaignard napisal(a):
> The HEVC HANTRO driver needs to know the number of bits to skip at
> the beginning of the slice header.
> That is a hardware specific requirement so create a dedicated control
> that this purpose.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  5 +++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
> 
> diff --git a/include/uapi/linux/hantro-v4l2-controls.h b/include/uapi/linux/
hantro-v4l2-controls.h
> new file mode 100644
> index 000000000000..30b1999b7af3
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
> +#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS	
(V4L2_CID_USER_HANTRO_BASE + 0)
> +
> +/**
> + * struct hantro_hevc_extra_decode_params - extra decode parameters for 
hantro driver
> + * @hevc_hdr_skip_lenght:	header first bits offset
> + */
> +struct hantro_hevc_extra_decode_params {
> +	__u32	hevc_hdr_skip_lenght;

typo: lenght -> length

Same mistake in description above.

Best regards,
Jernej

> +	__u8	padding[4];
> +};
> +
> +#endif
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-
controls.h
> index 039c0d7add1b..ced7486c7f46 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -209,6 +209,11 @@ enum v4l2_colorfx {
>   * We reserve 128 controls for this driver.
>   */
>  #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 
0x10f0)
> +/*
> + * The base for HANTRO driver controls.
> + * We reserve 32 controls for this driver.
> + */
> +#define V4L2_CID_USER_HANTRO_BASE		(V4L2_CID_USER_BASE + 
0x1170)
>  
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
> -- 
> 2.25.1
> 
> 



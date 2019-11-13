Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3912BFB205
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 15:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfKMOBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 09:01:03 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35330 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfKMOBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 09:01:02 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 09863290CD8
Message-ID: <58ed179388b6f9d6caddd91dc03e411ca714157d.camel@collabora.com>
Subject: Re: [PATCH 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Date:   Wed, 13 Nov 2019 11:00:35 -0300
In-Reply-To: <1573053633-21437-5-git-send-email-mirela.rabulea@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <1573053633-21437-5-git-send-email-mirela.rabulea@nxp.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

Thanks for the patch. It's nice to see support for i.MX8!

On Wed, 2019-11-06 at 17:20 +0200, Mirela Rabulea wrote:
> V4L2 driver for the JPEG encoder/decoder from i.MX8QXP/i.MX8QM application
> processors.
> The multi-planar buffers API is used.
> 
> Baseline and extended sequential jpeg decoding is supported.
> Progressive jpeg decoding is not supported by the IP.
> Supports encode and decode of various formats:
>      YUV444, YUV422, YUV420, RGB, ARGB, Gray
> YUV420 is the only multi-planar format supported.
> Minimum resolution is 64 x 64, maximum 8192 x 8192.
> The alignment requirements for the resolution depend on the format,
> multiple of 16 resolutions should work for all formats.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/imx-jpeg/Kconfig       |   10 +
>  drivers/media/platform/imx-jpeg/Makefile      |    3 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2266 +++++++++++++++++++++++++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  187 ++
>  8 files changed, 2777 insertions(+)
>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
> 
> [..]

> +};
> +
> +/*
> + * default configuration stream, 64x64 yuv422
> + * split by JPEG marker, so it's easier to modify & use
> + */
> +static const unsigned char jpeg_soi[] = {0xFF, 0xD8};
> +static const unsigned char jpeg_app0[] = {0xFF, 0xE0,

I think it's time to re-consider creating some common code
for drivers that deal with JPEG parsing. I don't know
exactly how this should be done, but it's worth a try.

Having been there, it might sound unfair to request you to
take such action. However, someone has to do these kinds
of cleanups and improvements, sooner or later, if we want
to keep a clean codebase.

Hope this makes sense.

Regards,
Ezequiel


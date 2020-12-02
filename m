Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B4F2CC115
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgLBPlv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgLBPlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:41:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD2EC0613CF
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:41:10 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkUFa-0001mY-Re; Wed, 02 Dec 2020 16:41:02 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkUFZ-0001K4-MD; Wed, 02 Dec 2020 16:41:01 +0100
Message-ID: <cce30b6ab6b15fe3e82f4ed79371ba4c81730249.camel@pengutronix.de>
Subject: Re: [PATCH v5 10/10] media: imx-jpeg: Use v4l2 jpeg helpers in
 mxc-jpeg
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Date:   Wed, 02 Dec 2020 16:41:01 +0100
In-Reply-To: <20201112030557.8540-11-mirela.rabulea@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-11-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-11-12 at 05:05 +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Use v4l2_jpeg_parse_header in mxc_jpeg_parse, remove the old
> parsing way, which was duplicated in other jpeg drivers.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
> Changes in v5:
> This was patch 11 in previous version
> Change triggered by patch 7 (app14 data change struct -> int)
> 
>  drivers/media/platform/imx-jpeg/Kconfig    |   1 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c | 267 ++++++---------------
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h |  26 +-
>  3 files changed, 80 insertions(+), 214 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
> index 7cc89e5eff90..d875f7c88cda 100644
> --- a/drivers/media/platform/imx-jpeg/Kconfig
> +++ b/drivers/media/platform/imx-jpeg/Kconfig
> @@ -4,6 +4,7 @@ config VIDEO_IMX8_JPEG
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> +	select V4L2_JPEG_HELPER
>  	default m
>  	help
>  	  This is a video4linux2 driver for the i.MX8 QXP/QM integrated
> diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> index 8f297803f2c3..d3b7581ce46e 100644
> --- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
[...]
> @@ -1448,12 +1317,11 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
>  	 * encoded with 3 components have RGB colorspace, see Recommendation
>  	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
>  	 */
> -	if (img_fmt == MXC_JPEG_YUV444 && app14 && app14_transform == 0)
> -		img_fmt = MXC_JPEG_RGB;
> -
> -	if (mxc_jpeg_imgfmt_to_fourcc(img_fmt, &fourcc)) {
> -		dev_err(dev, "Fourcc not found for %d", img_fmt);
> -		return -EINVAL;
> +	if (fourcc == V4L2_PIX_FMT_YUV24 || fourcc == V4L2_PIX_FMT_RGB24) {
> +		if (header.app14_tf == 0)

This is what I meant in patch 7, I think it would be more clear to have
an enum value that says "RGB color coding" than to rely on the reader to
know what the value 0 means.

> +			fourcc = V4L2_PIX_FMT_RGB24;
> +		else
> +			fourcc = V4L2_PIX_FMT_YUV24;
>  	}
>  
>  	/*
> 

Otherwise this patch looks fine to me.

regards
Philipp

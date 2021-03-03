Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1F732C7E2
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355438AbhCDAdF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234281AbhCCWH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 17:07:29 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8433C061765;
        Wed,  3 Mar 2021 13:56:35 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8B8851F45F5B
Message-ID: <22a8ea464f4c7dcb7a90889f53d85f003b7c739a.camel@collabora.com>
Subject: Re: [PATCH v4 03/11] media: hantro: change hantro_codec_ops run
 prototype to return errors
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
Date:   Wed, 03 Mar 2021 18:56:23 -0300
In-Reply-To: <20210303113952.178519-4-benjamin.gaignard@collabora.com>
References: <20210303113952.178519-1-benjamin.gaignard@collabora.com>
         <20210303113952.178519-4-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-03-03 at 12:39 +0100, Benjamin Gaignard wrote:
> Change hantro_codec_ops run prototype from 'void' to 'int'.
> This allow to cancel the job if an error occur while configuring
> the hardware.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c     |  4 +++-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |  6 ++++--
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |  4 +++-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |  6 ++++--
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c |  4 +++-
>  drivers/staging/media/hantro/hantro_hw.h      | 19 ++++++++++---------
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  4 +++-
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  4 +++-
>  .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |  6 ++++--
>  9 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e5f200e64993..ac1429f00b33 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -161,7 +161,9 @@ static void device_run(void *priv)
>  
>         v4l2_m2m_buf_copy_metadata(src, dst, true);
>  
> -       ctx->codec_ops->run(ctx);
> +       if (ctx->codec_ops->run(ctx))
> +               goto err_cancel_job;
> +
>         return;
>  
>  err_cancel_job:
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 845bef73d218..fcd4db13c9fe 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -273,13 +273,13 @@ static void set_buffers(struct hantro_ctx *ctx)
>         vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);
>  }
>  
> -void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
> +int hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
>  {
>         struct hantro_dev *vpu = ctx->dev;
>  
>         /* Prepare the H264 decoder context. */
>         if (hantro_h264_dec_prepare_run(ctx))
> -               return;
> +               return -EINVAL;

This should be returning the value from hantro_h264_dec_prepare_run.

Thanks!
Ezequiel


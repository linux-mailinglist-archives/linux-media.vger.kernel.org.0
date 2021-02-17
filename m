Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DAD31E009
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 21:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhBQUOp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 15:14:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59508 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhBQUOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 15:14:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 56F9C1F40F2C
Message-ID: <022df43285f6b6dd6c6a5dfd4e80ac7694a5582e.camel@collabora.com>
Subject: Re: [PATCH v1 15/18] media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE
 control
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Wed, 17 Feb 2021 17:13:48 -0300
In-Reply-To: <20210217080306.157876-16-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-16-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-02-17 at 09:03 +0100, Benjamin Gaignard wrote:
> Make sure that V4L2_PIX_FMT_HEVC_SLICE is correctly handle by v4l2
> of the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 1bc118e375a1..1608a3f78eaa 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -232,7 +232,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file, void *priv,
>         return 0;
>  }
>  
> -static int hantro_try_fmt(const struct hantro_ctx *ctx,
> +static int hantro_try_fmt(struct hantro_ctx *ctx,

Spurious change?

>                           struct v4l2_pix_format_mplane *pix_mp,
>                           enum v4l2_buf_type type)
>  {
> @@ -390,6 +390,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>         case V4L2_PIX_FMT_MPEG2_SLICE:
>         case V4L2_PIX_FMT_VP8_FRAME:
>         case V4L2_PIX_FMT_H264_SLICE:
> +       case V4L2_PIX_FMT_HEVC_SLICE:
>                 ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
>                 break;
>         default:

Otherwise looks good.

Thanks,
Ezequiel


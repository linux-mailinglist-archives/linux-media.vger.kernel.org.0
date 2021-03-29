Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B72434D83E
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 21:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhC2T3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 15:29:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhC2T27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 15:28:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3F7AA1F45515
Message-ID: <97b3722e5be95d269ebb57f85ac0318cc2c3f54e.camel@collabora.com>
Subject: Re: [PATCH v7 10/13] media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE
 control
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
Date:   Mon, 29 Mar 2021 16:28:46 -0300
In-Reply-To: <20210329065743.11961-11-benjamin.gaignard@collabora.com>
References: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
         <20210329065743.11961-11-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-03-29 at 08:57 +0200, Benjamin Gaignard wrote:
> Make sure that V4L2_PIX_FMT_HEVC_SLICE is correctly handle by v4l2
> of the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 77d7fe62ce81..0655324fd0d4 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -392,6 +392,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>         case V4L2_PIX_FMT_MPEG2_SLICE:
>         case V4L2_PIX_FMT_VP8_FRAME:
>         case V4L2_PIX_FMT_H264_SLICE:
> +       case V4L2_PIX_FMT_HEVC_SLICE:
>                 ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
>                 break;
>         default:



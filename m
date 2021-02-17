Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB8531E000
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 21:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhBQUMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 15:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhBQUMW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 15:12:22 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A96C061756;
        Wed, 17 Feb 2021 12:11:42 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D312B1F45878
Message-ID: <361ec02b1af1093684dfd33806025f3d044fc6e2.camel@collabora.com>
Subject: Re: [PATCH v1 06/18] media: hantro: Make sure that ctx->codex_ops
 is set
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
Date:   Wed, 17 Feb 2021 17:11:28 -0300
In-Reply-To: <20210217080306.157876-7-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-7-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> Do not try to call ctx->codec_ops->done if ctx->codec_ops is not set.
> 

If codec_ops is not set for a codec variant,
things will go south really fast. See hantro_start_streaming
for instance.

I think you can just drop this patch.

Thanks,
Ezequiel

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 0d58209fc55c..0570047c7fa0 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -93,7 +93,8 @@ void hantro_irq_done(struct hantro_dev *vpu,
>          * and will take care of finishing the job.
>          */
>         if (cancel_delayed_work(&vpu->watchdog_work)) {
> -               if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
> +               if (result == VB2_BUF_STATE_DONE &&
> +                   ctx->codec_ops && ctx->codec_ops->done)
>                         ctx->codec_ops->done(ctx);
>                 hantro_job_finish(vpu, ctx, result);
>         }



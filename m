Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A3531E0A7
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 21:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhBQUnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 15:43:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59748 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbhBQUnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 15:43:16 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EC2C61F450C4
Message-ID: <c10b0612d6d624c37750b16d611e3554dc41f151.camel@collabora.com>
Subject: Re: [PATCH v1 11/18] media: hantro: Add helper function for
 auxiliary buffers allocation
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
Date:   Wed, 17 Feb 2021 17:42:21 -0300
In-Reply-To: <20210217080306.157876-12-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-12-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> Add helper functions to allocate and free auxiliary buffers.
> These buffers aren't for frames but are needed by the hardware
> to store scaling matrix, tiles size, border filters etc...
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index a9b80b2c9124..7f842edbc341 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -446,6 +446,30 @@ hantro_get_dec_buf(struct hantro_ctx *ctx, struct vb2_buffer *vb)
>         return vb2_plane_vaddr(vb, 0);
>  }
>  
> +static inline int
> +hantro_aux_buf_alloc(struct hantro_dev *vpu,
> +                    struct hantro_aux_buf *buf, size_t size)
> +{

Can you add convert the dma_alloc_ calls in the driver,
and squash it in this patch?

I.e. hantro_h264_dec_init, hantro_vp8_dec_init, etc.

Thanks!
Ezequiel

> +       buf->cpu = dma_alloc_coherent(vpu->dev, size, &buf->dma, GFP_KERNEL);
> +       if (!buf->cpu)
> +               return -ENOMEM;
> +
> +       buf->size = size;
> +       return 0;
> +}
> +
> +static inline void
> +hantro_aux_buf_free(struct hantro_dev *vpu,
> +                   struct hantro_aux_buf *buf)
> +{
> +       if (buf->cpu)
> +               dma_free_coherent(vpu->dev, buf->size, buf->cpu, buf->dma);
> +
> +       buf->cpu = NULL;
> +       buf->dma = 0;
> +       buf->size = 0;
> +}
> +
>  void hantro_postproc_disable(struct hantro_ctx *ctx);
>  void hantro_postproc_enable(struct hantro_ctx *ctx);
>  void hantro_postproc_free(struct hantro_ctx *ctx);



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F85734D838
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 21:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbhC2T3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 15:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbhC2T2r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 15:28:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FACC061574;
        Mon, 29 Mar 2021 12:28:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 09D661F454DE
Message-ID: <aa7fad73a4f06d94273a1e26d36a96f51c477929.camel@collabora.com>
Subject: Re: [PATCH v7 08/13] media: hantro: Only use postproc when post
 processed formats are defined
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
Date:   Mon, 29 Mar 2021 16:28:35 -0300
In-Reply-To: <20210329065743.11961-9-benjamin.gaignard@collabora.com>
References: <20210329065743.11961-1-benjamin.gaignard@collabora.com>
         <20210329065743.11961-9-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-03-29 at 08:57 +0200, Benjamin Gaignard wrote:
> If the variant doesn't offert postprocessed formats make sure it will
> be ok.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro.h          |  8 ++------
>  drivers/staging/media/hantro/hantro_postproc.c | 14 ++++++++++++++
>  drivers/staging/media/hantro/hantro_v4l2.c     |  4 +++-
>  3 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index edb4561a6887..7a5ad93466c8 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -414,12 +414,8 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
>         return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  }
>  
> -static inline bool
> -hantro_needs_postproc(const struct hantro_ctx *ctx,
> -                     const struct hantro_fmt *fmt)
> -{
> -       return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
> -}
> +bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> +                          const struct hantro_fmt *fmt);
>  
>  static inline dma_addr_t
>  hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 6d2a8f2a8f0b..ed8916c950a4 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -50,6 +50,20 @@ const struct hantro_postproc_regs hantro_g1_postproc_regs = {
>         .display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
>  };
>  
> +bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> +                          const struct hantro_fmt *fmt)
> +{
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       if (ctx->is_encoder)
> +               return false;
> +
> +       if (!vpu->variant->postproc_fmts)
> +               return false;
> +
> +       return fmt->fourcc != V4L2_PIX_FMT_NV12;
> +}
> +
>  void hantro_postproc_enable(struct hantro_ctx *ctx)
>  {
>         struct hantro_dev *vpu = ctx->dev;
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 1bc118e375a1..77d7fe62ce81 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -55,7 +55,9 @@ static const struct hantro_fmt *
>  hantro_get_postproc_formats(const struct hantro_ctx *ctx,
>                             unsigned int *num_fmts)
>  {
> -       if (ctx->is_encoder) {
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       if (ctx->is_encoder || !vpu->variant->postproc_fmts) {
>                 *num_fmts = 0;
>                 return NULL;
>         }



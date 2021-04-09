Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7368335A3D0
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbhDIQpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbhDIQpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:45:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8364C061760;
        Fri,  9 Apr 2021 09:45:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 395CD1F4677C
Message-ID: <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 13:44:55 -0300
In-Reply-To: <20210409135404.GA26172@focaruja>
References: <20210409135404.GA26172@focaruja>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aline,

On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> code style.
> 

Where is this written in the Coding Style?

Thanks!
Ezequiel

> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/hantro/hantro_postproc.c | 34 +++++++++++++-------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 6d2a8f2a..06279c0 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -12,14 +12,14 @@
>  #include "hantro_hw.h"
>  #include "hantro_g1_regs.h"
>  
> -#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
> +#define hantro_pp_reg_write(vpu, reg_name, val) \
>  { \
>         hantro_reg_write(vpu, \
>                          &(vpu)->variant->postproc_regs->reg_name, \
>                          val); \
>  }
>  
> -#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
> +#define hantro_pp_reg_write_s(vpu, reg_name, val) \
>  { \
>         hantro_reg_write_s(vpu, \
>                            &(vpu)->variant->postproc_regs->reg_name, \
> @@ -61,7 +61,7 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
>                 return;
>  
>         /* Turn on pipeline mode. Must be done first. */
> -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
> +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x1);
>  
>         src_pp_fmt = VPU_PP_IN_NV12;
>  
> @@ -79,19 +79,19 @@ void hantro_postproc_enable(struct hantro_ctx *ctx)
>         dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>         dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>  
> -       HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
> -       HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
> -       HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
> -       HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
> -       HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
> -       HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
> -       HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
> -       HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
> -       HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
> -       HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
> -       HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
> -       HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
> -       HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> +       hantro_pp_reg_write(vpu, clk_gate, 0x1);
> +       hantro_pp_reg_write(vpu, out_endian, 0x1);
> +       hantro_pp_reg_write(vpu, out_swap32, 0x1);
> +       hantro_pp_reg_write(vpu, max_burst, 16);
> +       hantro_pp_reg_write(vpu, out_luma_base, dst_dma);
> +       hantro_pp_reg_write(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
> +       hantro_pp_reg_write(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
> +       hantro_pp_reg_write(vpu, input_fmt, src_pp_fmt);
> +       hantro_pp_reg_write(vpu, output_fmt, dst_pp_fmt);
> +       hantro_pp_reg_write(vpu, output_width, ctx->dst_fmt.width);
> +       hantro_pp_reg_write(vpu, output_height, ctx->dst_fmt.height);
> +       hantro_pp_reg_write(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
> +       hantro_pp_reg_write(vpu, display_width, ctx->dst_fmt.width);
>  }
>  
>  void hantro_postproc_free(struct hantro_ctx *ctx)
> @@ -146,5 +146,5 @@ void hantro_postproc_disable(struct hantro_ctx *ctx)
>         if (!vpu->variant->postproc_regs)
>                 return;
>  
> -       HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> +       hantro_pp_reg_write_s(vpu, pipeline_en, 0x0);
>  }



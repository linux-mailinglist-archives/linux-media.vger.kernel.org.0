Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44BF3AD2C7
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 21:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhFRT04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 15:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhFRT0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 15:26:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95168C061574;
        Fri, 18 Jun 2021 12:24:45 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E7E7C1F44CE8
Message-ID: <4d41485bb1452ec6b9dfa0a23a925c5dd2af72da.camel@collabora.com>
Subject: Re: [PATCH v3 6/8] media: hantro: enumerate scaled output formats
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 18 Jun 2021 16:24:32 -0300
In-Reply-To: <20210618131526.566762-7-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-7-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thanks for working on this.

On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> When enumerating the output formats take care of the hardware scaling
> capabilities.
> For a given input size G2 hardware block is capable of down scale the
> output by 2, 4 or 8 factor. When decoding 4K streams that to be could
> helpful to save memory bandwidth.
> 

Looking at https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html
I see that this case should be covered by the spec.

If I understand correctly, it would be:

1. VIDIOC_S_FMT(OUTPUT)
2. VIDIOC_ENUM_FMT(CAPTURE) / VIDIOC_ENUM_FRAMESIZES(CAPTURE)
3. VIDIOC_S_FMT(CAPTURE)
4. VIDIOC_G_FMT(CAPTURE) again to get buffer information.

Does v4l2codecs support this case as-is, if changes are needed,
I'd like to have the MR ready and reviewed by Nicolas.

I know it's a staging driver, but I believe it's important
to have users for new cases/feature to avoid bitrotting.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h         |  4 ++
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 46 ++++++++++++++++++-
>  drivers/staging/media/hantro/hantro_g2_regs.h |  6 +++
>  drivers/staging/media/hantro/hantro_hw.h      |  1 +
>  drivers/staging/media/hantro/hantro_v4l2.c    | 10 ++--
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  1 +
>  6 files changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 6a21d1e95b34..ca9038b0384a 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -71,6 +71,9 @@ struct hantro_irq {
>   * @reg_names:                 array of register range names
>   * @num_regs:                  number of register range names in the array
>   * @postproc_regs:             &struct hantro_postproc_regs pointer
> + * @scaling:                   Set possible scaled output formats.
> + *                             Returns zero if OK, a negative value in error cases.
> + *                             Optional.
>   */
>  struct hantro_variant {
>         unsigned int enc_offset;
> @@ -92,6 +95,7 @@ struct hantro_variant {
>         const char * const *reg_names;
>         int num_regs;
>         const struct hantro_postproc_regs *postproc_regs;
> +       int (*scaling)(struct hantro_ctx *ctx, struct v4l2_frmsizeenum *fsize);

Please add some .ops field, so we can put this
and move init and runtime_resume as well.
 
>  };
>  
>  /**
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 41dc89ec926c..3a8aa2ff109c 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -396,6 +396,17 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
>         }
>  }
>  
> +static int down_scale_factor(struct hantro_ctx *ctx)
> +{
> +       const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> +       const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> +
> +       if (sps->pic_width_in_luma_samples == ctx->dst_fmt.width)
> +               return 0;
> +
> +       return DIV_ROUND_CLOSEST(sps->pic_width_in_luma_samples, ctx->dst_fmt.width);
> +}
> +
>  static int set_ref(struct hantro_ctx *ctx)
>  {
>         const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> @@ -409,6 +420,7 @@ static int set_ref(struct hantro_ctx *ctx)
>         size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
>         size_t compress_luma_offset = hantro_hevc_luma_compress_offset(sps);
>         size_t compress_chroma_offset = hantro_hevc_chroma_compress_offset(sps);
> +       int down_scale = down_scale_factor(ctx);
>         u32 max_ref_frames;
>         u16 dpb_longterm_e;
>         static const struct hantro_reg cur_poc[] = {
> @@ -521,8 +533,18 @@ static int set_ref(struct hantro_ctx *ctx)
>         hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
>         hantro_write_addr(vpu, G2_REG_DMV_REF(i++), mv_addr);
>  
> -       hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
> -       hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
> +       if (down_scale) {
> +               chroma_addr = luma_addr + (cr_offset >> down_scale);
> +               hantro_reg_write(vpu, &g2_down_scale_e, 1);
> +               hantro_reg_write(vpu, &g2_down_scale_y, down_scale >> 2);
> +               hantro_reg_write(vpu, &g2_down_scale_x, down_scale >> 2);
> +               hantro_write_addr(vpu, G2_DS_DST, luma_addr);
> +               hantro_write_addr(vpu, G2_DS_DST_CHR, chroma_addr);
> +       } else {
> +               hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
> +               hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
> +       }
> +
>         hantro_write_addr(vpu, G2_ADDR_DST_MV, mv_addr);
>         hantro_write_addr(vpu, G2_COMP_ADDR_DST, compress_luma_addr);
>         hantro_write_addr(vpu, G2_COMP_CHR, compress_chroma_addr);
> @@ -603,6 +625,26 @@ static void hantro_g2_check_idle(struct hantro_dev *vpu)
>         }
>  }
>  
> +int hantro_g2_hevc_dec_scaling(struct hantro_ctx *ctx,
> +                              struct v4l2_frmsizeenum *fsize)

Maybe

s/hantro_g2_hevc_dec_scaling/hantro_g2_hevc_enum_framesizes

would be clear?

Is this restricted to HEVC or is it something that will
work on VP9 as well?

> +{
> +       /**
> +        * G2 scaler can scale down by 0, 2, 4 or 8
> +        * use fsize->index has power of 2 diviser
> +        **/

Please use

/*
 *
 */

style.

> +       if (fsize->index > 3)
> +               return -EINVAL;
> +
> +       if (!ctx->src_fmt.width || !ctx->src_fmt.height)
> +               return -EINVAL;
> +
> +       fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> +       fsize->discrete.width = ctx->src_fmt.width >> fsize->index;
> +       fsize->discrete.height = ctx->src_fmt.height >> fsize->index;
> +
> +       return 0;
> +}
> +
[..]
> -       /* This only makes sense for coded formats */
> -       if (fmt->codec_mode == HANTRO_MODE_NONE)
> +       /* For non-coded formats check if scaling is possible */
> +       if (fmt->codec_mode == HANTRO_MODE_NONE) {
> +               if (ctx->dev->variant->scaling)
> +                       return ctx->dev->variant->scaling(ctx, fsize);
> +
>                 return -EINVAL;

I wonder why we are returning EINVAL here. Can we support
.vidioc_enum_framesizes for coded and non-coded?

Thanks,
Ezequiel


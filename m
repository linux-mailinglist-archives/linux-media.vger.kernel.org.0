Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F562131E1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 04:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgGCCsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 22:48:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37480 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCCsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 22:48:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CCF222A6121
Message-ID: <abfa036dc0c997bb68280195b2cc422e88c6f4b5.camel@collabora.com>
Subject: Re: [PATCH 3/9] media: rkvdec: h264: Fix pic width and height in mbs
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 02 Jul 2020 23:48:34 -0300
In-Reply-To: <20200701215616.30874-4-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-4-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> The width and height in mbs is currently configured based on OUTPUT buffer
> resolution, this works for frame pictures but can cause issues for field
> pictures or when frmsize step_width is changed to support 10-bit decoding.
> 
> When frame_mbs_only_flag is 0 the height in mbs should be height of
> the field instead of height of frame.
> 
> Validate pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1
> against CAPTURE buffer resolution and use these values to configure HW.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 44 +++++++++++++++++++---
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index f0cfed84d60d..c9aebeb8f9b3 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -672,8 +672,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
>  		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
>  		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
> -	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.width, 16), PIC_WIDTH_IN_MBS);
> -	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.height, 16), PIC_HEIGHT_IN_MBS);
> +	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
> +	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
>  		  FRAME_MBS_ONLY_FLAG);
>  	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
> @@ -1058,10 +1058,33 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
>  	kfree(h264_ctx);
>  }
>  
> -static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
> -				     struct rkvdec_h264_run *run)
> +static int validate_sps(struct rkvdec_ctx *ctx,
> +			const struct v4l2_ctrl_h264_sps *sps)
> +{
> +	unsigned int width, height;
> +
> +	if (WARN_ON(!sps))
> +		return -EINVAL;
> +
> +	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
> +	height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
> +
> +	if (width > ctx->decoded_fmt.fmt.pix_mp.width ||
> +	    height > ctx->decoded_fmt.fmt.pix_mp.height) {

Why using decoded_fmt instead of coded_fmt?

Also, by the time the SPS control is passed, the OUTPUT
and CAPTURE formats should be already set, so it should be
possible to validate the SPS at TRY_EXT_CTRLS, using
v4l2_ctrl_ops.try_ctrl.

That would be much better, since once the application
calls STREAMON on both queues, I think things are
expected to be validated as much as possible.

Thanks,
Ezequiel

> +		dev_err(ctx->dev->dev,
> +			"unexpected bitstream resolution %ux%u\n",
> +			width, height);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
> +				    struct rkvdec_h264_run *run)
>  {
>  	struct v4l2_ctrl *ctrl;
> +	int ret;
>  
>  	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>  			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
> @@ -1080,6 +1103,12 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
>  	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
>  
>  	rkvdec_run_preamble(ctx, &run->base);
> +
> +	ret = validate_sps(ctx, run->sps);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> @@ -1088,8 +1117,13 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
>  	struct rkvdec_dev *rkvdec = ctx->dev;
>  	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
>  	struct rkvdec_h264_run run;
> +	int ret;
>  
> -	rkvdec_h264_run_preamble(ctx, &run);
> +	ret = rkvdec_h264_run_preamble(ctx, &run);
> +	if (ret) {
> +		rkvdec_run_postamble(ctx, &run.base);
> +		return ret;
> +	}
>  
>  	/* Build the P/B{0,1} ref lists. */
>  	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,



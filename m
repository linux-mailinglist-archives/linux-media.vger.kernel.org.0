Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922E3509D15
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 12:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240727AbiDUKFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 06:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388037AbiDUKFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 06:05:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516A2275EE
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 03:02:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C889861924
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 10:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F827C385A1;
        Thu, 21 Apr 2022 10:02:26 +0000 (UTC)
Message-ID: <0f5d9c16-860b-015f-8028-234d2fb96959@xs4all.nl>
Date:   Thu, 21 Apr 2022 12:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 5/7] media: coda: fix default JPEG colorimetry
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
 <20220404163533.707508-5-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220404163533.707508-5-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On 04/04/2022 18:35, Philipp Zabel wrote:
> Set default colorspace to SRGB for JPEG encoder and decoder devices,
> to fix the following v4l2-compliance test failure:
> 
> 	test VIDIOC_TRY_FMT: OK
> 		fail: v4l2-test-formats.cpp(818): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB
> 
> Also explicitly set transfer function, YCbCr encoding and quantization
> range, as required by v4l2-compliance for the JPEG encoded side.

I'm not quite sure if this patch addresses the correct issue.

> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../media/platform/chips-media/coda-common.c  | 36 +++++++++++++------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> index 4a7346ed771e..c068c16d1eb4 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -732,13 +732,22 @@ static int coda_try_fmt_vid_cap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static void coda_set_default_colorspace(struct v4l2_pix_format *fmt)
> +static void coda_set_default_colorspace(struct coda_ctx *ctx,
> +					struct v4l2_pix_format *fmt)
>  {
>  	enum v4l2_colorspace colorspace;
>  
> -	if (fmt->pixelformat == V4L2_PIX_FMT_JPEG)
> -		colorspace = V4L2_COLORSPACE_JPEG;

It's perfectly fine to keep this, the problem occurs with the raw image side
(capture for the decoder, output for the encoder).

There the colorspace must be SRGB, the xfer_func may be 0 or SRGB, and the
ycbcr_enc is 0 (if not a YUV pixelformat) or ENC_601 (if it is a YUV format).
Actually, if the hardware can convert from other YUV encodings such as 709,
then other YUV encodings are valid, but I assume that's not the case.

> -	else if (fmt->width <= 720 && fmt->height <= 576)
> +	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
> +	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG ||
> +	    fmt->pixelformat == V4L2_PIX_FMT_JPEG) {
> +		fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +		fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> +		fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +		fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		return;
> +	}
> +
> +	if (fmt->width <= 720 && fmt->height <= 576)
>  		colorspace = V4L2_COLORSPACE_SMPTE170M;
>  	else
>  		colorspace = V4L2_COLORSPACE_REC709;
> @@ -763,7 +772,7 @@ static int coda_try_fmt_vid_out(struct file *file, void *priv,
>  		return ret;
>  
>  	if (f->fmt.pix.colorspace == V4L2_COLORSPACE_DEFAULT)
> -		coda_set_default_colorspace(&f->fmt.pix);
> +		coda_set_default_colorspace(ctx, &f->fmt.pix);
>  
>  	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  	codec = coda_find_codec(dev, f->fmt.pix.pixelformat, q_data_dst->fourcc);
> @@ -1640,13 +1649,18 @@ static void set_default_params(struct coda_ctx *ctx)
>  	csize = coda_estimate_sizeimage(ctx, usize, max_w, max_h);
>  
>  	ctx->params.codec_mode = ctx->codec->mode;
> -	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG)
> -		ctx->colorspace = V4L2_COLORSPACE_JPEG;
> -	else
> +	if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_JPEG ||
> +	    ctx->cvd->dst_formats[0] == V4L2_PIX_FMT_JPEG) {
> +		ctx->colorspace = V4L2_COLORSPACE_SRGB;
> +		ctx->xfer_func = V4L2_XFER_FUNC_SRGB;
> +		ctx->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +		ctx->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	} else {
>  		ctx->colorspace = V4L2_COLORSPACE_REC709;

My guess is that the raw format colorspace is set to REC709, which is definitely
wrong for a JPEG codec. For a JPEG codec that must be set to SRGB.

I suspect that's the real bug here.

I'm skipping this patch for now.

Regards,

	Hans

> -	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> -	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> -	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +		ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +		ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +		ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	}
>  	ctx->params.framerate = 30;
>  
>  	/* Default formats for output and input queues */


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9592A6262
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgKDKmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:42:20 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39661 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729134AbgKDKmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 05:42:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id aGF1kUALH1R0xaGF4kHJqu; Wed, 04 Nov 2020 11:42:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604486537; bh=j0s8MNJ+Gz8ISxqs3k0IEhLeqAHoFHPoL2dw8TJa1d8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MP/kacEj3PKBy1WqVTjmVy6JnmRonN6gF083CU06b+F9LLie2FRyJegCvsc4ZaPma
         WZZSE3ktmC5XzOHlG2cdv8zRfSt5B/rLqjUGIRrxScnHuM60Yzy1U1+EdTVF5GavOg
         WJW36oFONSCF+2o9D1PWYBspU9Fk5Cvs0Z3TkltGmvxQPMOnSBytLsHmQPJTkHMk6/
         yBzBNO5oWNl4JJ9K/Tu8/CLvYRkZjktXy3wJI7k+DB09q744S4k1jr3qgfKj2sH0i9
         pEHfzpXQ9J+bxQg/50SXwTXmwU+8dFGN27WZT2sgHRmMfaaGttYZjQyrB+cP+dXWgq
         5Oub4HEoVvs8Q==
Subject: Re: [PATCH v3 2/2] coda: Add a V4L2 user for control error
 macroblocks count
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
References: <20201103213238.575909-1-ezequiel@collabora.com>
 <20201103213238.575909-3-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <334a7eca-df06-e640-4099-fe1bad1b66c5@xs4all.nl>
Date:   Wed, 4 Nov 2020 11:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201103213238.575909-3-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKj9yVIWZiZLEdUk3pcjG+U4OL9XlwIwJxxnTzgvCCgDSIZftvlz3KBTJLI3iQ+pmSSXJ5A5jDB5ZdghwDNikH2kA0wHCAKlRuqJwTAFzVUBykf08+DS
 XYXwkgsKJQR1ztrUtAkAYX9uzLnR1QJ51p2V8fATUEJvUGfTcAYqi1qN8pVRGXD/TIHv4yv7of5pRWAwE/sIum1Gaf3aG+fyXu4PNNYL8eIL9Mkrbs1jEBEV
 fvx1HMLZLnOOehQX1qSE4iS5RXGxdB/HM24iUswY7g3r9MlWq8trw5ayaG2iNQkyyjJeD0YAeguF2RimS11NPYO/LEuKT6LoZvTGRS3v6bccigfoZEM8gG0m
 3TcMCxnLUcrgqKohy9pfOE9qCsQidTb3QXZgTu27TM8fTwUsheY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Some more (small) comments:

On 03/11/2020 22:32, Ezequiel Garcia wrote:
> To avoid potentially overflowing the kernel logs in the case
> of corrupted streams, this commit replaces an error message with
> a per-stream counter to be read through a driver-specific
> control.
> 
> Applications can read the per-stream accumulated
> error macroblocks count.
> 
> The old error message is replaced by a rate-limited debug message.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-bit.c    | 10 +++++++---
>  drivers/media/platform/coda/coda-common.c | 18 ++++++++++++++++++
>  drivers/media/platform/coda/coda.h        | 10 ++++++++++
>  include/uapi/linux/v4l2-controls.h        |  4 ++++
>  4 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index 919b36d753ec..6ff7a001e578 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/log2.h>
>  #include <linux/platform_device.h>
> +#include <linux/ratelimit.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> @@ -2369,9 +2370,12 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>  	}
>  
>  	err_mb = coda_read(dev, CODA_RET_DEC_PIC_ERR_MB);
> -	if (err_mb > 0)
> -		v4l2_err(&dev->v4l2_dev,
> -			 "errors in %d macroblocks\n", err_mb);
> +	if (err_mb > 0) {
> +		if (__ratelimit(&dev->err_mb_rs))
> +			coda_dbg(1, ctx, "errors in %d macroblocks\n", err_mb);
> +		v4l2_ctrl_s_ctrl(ctx->err_mb_ctrl,
> +				 v4l2_ctrl_g_ctrl(ctx->err_mb_ctrl) + err_mb);
> +	}
>  
>  	if (dev->devtype->product == CODA_HX4 ||
>  	    dev->devtype->product == CODA_7541) {
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 487dd653b24a..d7b066a3300b 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -26,6 +26,7 @@
>  #include <linux/videodev2.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/media/coda.h>
> +#include <linux/ratelimit.h>
>  #include <linux/reset.h>
>  
>  #include <media/v4l2-ctrls.h>
> @@ -2062,6 +2063,7 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
>  	if (q_data_dst->fourcc == V4L2_PIX_FMT_JPEG)
>  		ctx->params.gop_size = 1;
>  	ctx->gopcounter = ctx->params.gop_size - 1;
> +	v4l2_ctrl_s_ctrl(ctx->err_mb_ctrl, 0);
>  
>  	ret = ctx->ops->start_streaming(ctx);
>  	if (ctx->inst_type == CODA_INST_DECODER) {
> @@ -2462,6 +2464,15 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
>  		ctx->mpeg4_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  }
>  
> +static const struct v4l2_ctrl_config coda_err_mb_ctrl_config = {

Please also update this struct name to coda_mb_err_cnt_ctrl_config.

> +	.id	= V4L2_CID_CODA_MB_ERR_CNT,
> +	.name	= "Macroblocks Error Count",
> +	.type	= V4L2_CTRL_TYPE_INTEGER,
> +	.min	= 0,
> +	.max	= 0x7fffffff,
> +	.step	= 1,
> +};
> +
>  static int coda_ctrls_setup(struct coda_ctx *ctx)
>  {
>  	v4l2_ctrl_handler_init(&ctx->ctrls, 2);
> @@ -2484,6 +2495,12 @@ static int coda_ctrls_setup(struct coda_ctx *ctx)
>  				  1, 1, 1, 1);
>  		if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_H264)
>  			coda_decode_ctrls(ctx);
> +
> +		ctx->err_mb_ctrl = v4l2_ctrl_new_custom(&ctx->ctrls,

And this to mb_err_cnt_ctrl. This keeps the naming consistent.

> +						&coda_err_mb_ctrl_config,
> +						NULL);
> +		if (ctx->err_mb_ctrl)
> +			ctx->err_mb_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	}
>  
>  	if (ctx->ctrls.error) {
> @@ -3202,6 +3219,7 @@ static int coda_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ratelimit_default_init(&dev->err_mb_rs);
>  	mutex_init(&dev->dev_mutex);
>  	mutex_init(&dev->coda_mutex);
>  	ida_init(&dev->ida);
> diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
> index e53f7a65d532..4dd7bdbcde52 100644
> --- a/drivers/media/platform/coda/coda.h
> +++ b/drivers/media/platform/coda/coda.h
> @@ -17,6 +17,7 @@
>  #include <linux/mutex.h>
>  #include <linux/kfifo.h>
>  #include <linux/videodev2.h>
> +#include <linux/ratelimit.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -28,6 +29,13 @@
>  #define CODA_MAX_FRAMEBUFFERS	19
>  #define FMO_SLICE_SAVE_BUF_SIZE	(32)
>  
> +/*
> + * This control allows aplications to read the per-stream

Typo: applications

> + * (i.e. per-context) Macroblocks Error Count. This value
> + * is CODA specific.
> + */
> +#define V4L2_CID_CODA_MB_ERR_CNT (V4L2_CID_USER_CODA_BASE + 0)
> +
>  enum {
>  	V4L2_M2M_SRC = 0,
>  	V4L2_M2M_DST = 1,
> @@ -92,6 +100,7 @@ struct coda_dev {
>  	struct v4l2_m2m_dev	*m2m_dev;
>  	struct ida		ida;
>  	struct dentry		*debugfs_root;
> +	struct ratelimit_state	err_mb_rs;
>  };
>  
>  struct coda_codec {
> @@ -242,6 +251,7 @@ struct coda_ctx {
>  	struct v4l2_ctrl		*mpeg2_level_ctrl;
>  	struct v4l2_ctrl		*mpeg4_profile_ctrl;
>  	struct v4l2_ctrl		*mpeg4_level_ctrl;
> +	struct v4l2_ctrl		*err_mb_ctrl;
>  	struct v4l2_fh			fh;
>  	int				gopcounter;
>  	int				runcounter;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a184c4939438..b4481d9579e7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -198,6 +198,10 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
>  
> +/* The base for the CODA driver controls.
> + * We reserve 16 controls for this driver. */
> +#define V4L2_CID_USER_CODA_BASE			(V4L2_CID_USER_BASE + 0x10e0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> 

Regards,

	Hans

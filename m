Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A720339F30E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 11:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhFHJ5C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 8 Jun 2021 05:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhFHJ47 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 05:56:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCCFC0617A6
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 02:55:06 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqYRr-0002kc-Dt; Tue, 08 Jun 2021 11:55:03 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqYRr-0002l8-4e; Tue, 08 Jun 2021 11:55:03 +0200
Message-ID: <7ff9ab255bc95ae7400b77bef6e0a2949858f04c.camel@pengutronix.de>
Subject: Re: [PATCH RESENT] MEDIA CODA: Fix NULL ptr dereference in the
 encoder.
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Krzysztof Halasa <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 08 Jun 2021 11:55:03 +0200
In-Reply-To: <m3k0n6gciy.fsf@t19.piap.pl>
References: <m3k0n6gciy.fsf@t19.piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

thank you for the patch.

On Mon, 2021-06-07 at 13:05 +0200, Krzysztof Halasa wrote:
> ctx->mb_err_cnt_ctrl could be NULL in case of failed initialization
> (on decoders), and encoders don't use it at all.
> 
> Fixes: b2d3bef1aa78 ("media: coda: Add a V4L2 user for control error macroblocks count")
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> Cc: stable@vger.kernel.org # 5.11+
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index 2f42808c43a4..26e37cbfe8dd 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -2373,8 +2373,10 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>  	if (err_mb > 0) {
>  		if (__ratelimit(&dev->mb_err_rs))
>  			coda_dbg(1, ctx, "errors in %d macroblocks\n", err_mb);
> -		v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl,
> -				 v4l2_ctrl_g_ctrl(ctx->mb_err_cnt_ctrl) + err_mb);
> +		if (ctx->mb_err_cnt_ctrl)
> +			v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl,
> +					 v4l2_ctrl_g_ctrl(ctx->mb_err_cnt_ctrl)
> +					 + err_mb);
>  	}
>  
>  	if (dev->devtype->product == CODA_HX4 ||

I don't think this is required though. If v4l2_ctrl_new_custom() fails
in coda_ctrls_setup(), ctx->ctrls.error is set and the function returns
-EINVAL, causing coda_open() to fail with the error message "failed to
setup coda controls". I see no way to reach coda_finish_decode() without
ctx->mb_err_cnt_ctrl being set correctly.

> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 96802b8f47ea..285c80f87b65 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -2062,7 +2062,8 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
>  	if (q_data_dst->fourcc == V4L2_PIX_FMT_JPEG)
>  		ctx->params.gop_size = 1;
>  	ctx->gopcounter = ctx->params.gop_size - 1;
> -	v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl, 0);
> +	if (ctx->mb_err_cnt_ctrl)
> +		v4l2_ctrl_s_ctrl(ctx->mb_err_cnt_ctrl, 0);
>  
>  	ret = ctx->ops->start_streaming(ctx);
>  	if (ctx->inst_type == CODA_INST_DECODER) {

This is already fixed by [1] in media-tree/master.

[1] 0b276e470a4d ("media: coda: fix macroblocks count control usage")

regards
Philipp

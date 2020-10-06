Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C57284D8A
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgJFOXF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFOXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:23:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3E3C061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:23:05 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnrr-0005C4-O2; Tue, 06 Oct 2020 16:23:03 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnrr-0008ET-Eq; Tue, 06 Oct 2020 16:23:03 +0200
Message-ID: <2b695d728a6f4078f0583ec3af295127500afbf9.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] coda: Simplify H.264 small buffer padding logic
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:23:03 +0200
In-Reply-To: <20201006104414.67984-3-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-3-ezequiel@collabora.com>
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

On Tue, 2020-10-06 at 07:44 -0300, Ezequiel Garcia wrote:
> The H.264 small buffer padding is done under
> the (ctx->qsequence == 0 && payload < 512) condition.
> 
> Given this is the exact same condition immediately
> above, we can move it right there, making the code
> slightly clearer.
> 
> This change shouldn't affect functionality as it's just
> cosmetics.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-bit.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index aa0a47c34413..659fcf77b0ed 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -293,12 +293,11 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
>  			coda_dbg(1, ctx,
>  				 "could not parse header, sequence initialization might fail\n");
>  		}
> -	}
>  
> -	/* Add padding before the first buffer, if it is too small */
> -	if (ctx->qsequence == 0 && payload < 512 &&
> -	    ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
> -		coda_h264_bitstream_pad(ctx, 512 - payload);
> +		/* Add padding before the first buffer, if it is too small */
> +		if (ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
> +			coda_h264_bitstream_pad(ctx, 512 - payload);
> +	}
>  
>  	ret = coda_bitstream_queue(ctx, vaddr, payload);
>  	if (ret < 0) {

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

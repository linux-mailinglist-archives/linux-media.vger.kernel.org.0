Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AEE284D89
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgJFOXD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgJFOXD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:23:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32C9C061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:23:02 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnrp-0005Bt-Db; Tue, 06 Oct 2020 16:23:01 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPnrn-0008ED-17; Tue, 06 Oct 2020 16:22:59 +0200
Message-ID: <c5b8f6f4f7cfd0d78749eddd41d0292c852e2859.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] coda: Remove redundant ctx->initialized setting
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:22:58 +0200
In-Reply-To: <20201006104414.67984-2-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-2-ezequiel@collabora.com>
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

Hi Ezequiel,

On Tue, 2020-10-06 at 07:44 -0300, Ezequiel Garcia wrote:
> The ctx->initialized flag is set in __coda_decoder_seq_init,
> so it's redundant to set it in coda_dec_seq_init_work.
> Remove the redundant set, which allows to simplify the
> implementation quite a bit.
> 
> This change shouldn't affect functionality as it's just
> cosmetics.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-bit.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index bf75927bac4e..aa0a47c34413 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -2005,21 +2005,13 @@ static void coda_dec_seq_init_work(struct work_struct *work)
>  	struct coda_ctx *ctx = container_of(work,
>  					    struct coda_ctx, seq_init_work);
>  	struct coda_dev *dev = ctx->dev;
> -	int ret;
>  
>  	mutex_lock(&ctx->buffer_mutex);
>  	mutex_lock(&dev->coda_mutex);
>  
> -	if (ctx->initialized == 1)
> -		goto out;
> -
> -	ret = __coda_decoder_seq_init(ctx);
> -	if (ret < 0)
> -		goto out;
> -
> -	ctx->initialized = 1;
> +	if (!ctx->initialized)
> +		__coda_decoder_seq_init(ctx);
>  
> -out:
>  	mutex_unlock(&dev->coda_mutex);
>  	mutex_unlock(&ctx->buffer_mutex);
>  }

Thank you for the cleanup! In general, I'd put the fixes before the
cosmetics unless they somehow simplify the following steps, but in this
case it doesn't matter much.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

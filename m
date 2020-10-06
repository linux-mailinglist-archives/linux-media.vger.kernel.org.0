Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C048E284E46
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgJFOtF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFOtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:49:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733B1C061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:49:05 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPoH2-0002m6-3V; Tue, 06 Oct 2020 16:49:04 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPoH1-0001wl-NT; Tue, 06 Oct 2020 16:49:03 +0200
Message-ID: <1df9ace07ef6fde81f729e4b5d02b0d1aa895be3.camel@pengutronix.de>
Subject: Re: [PATCH 5/6] coda: coda_buffer_meta housekeeping fix
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:49:03 +0200
In-Reply-To: <20201006104414.67984-6-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-6-ezequiel@collabora.com>
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
> It's possible that the VPU was initialized using just one buffer,
> containing only codec headers.
> 
> In this case, right after the initialization and after updating
> the FIFO read pointer, we need to iterate through all the coda_buffer_meta
> and release any metas that have been already used by the VPU.
> 
> This issue is affecting indirectly the bitstream buffer fill
> threshold, which depends on the meta end position of the first
> queued meta, which is passed to coda_bitstream_can_fetch_past().
> 
> Without this fix, it's possible that for certain videos, the
> bitstream buffer level is not filled properly, resulting in a PIC_RUN
> timeout.
> 
> Reported-by: Benjamin Bara <benjamin.bara@skidata.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/coda/coda-bit.c | 42 +++++++++++++++++++++++---
>  drivers/media/platform/coda/coda.h     |  1 +
>  2 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index 659fcf77b0ed..928a640b0056 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -1836,6 +1836,29 @@ static bool coda_reorder_enable(struct coda_ctx *ctx)
>  	return profile > V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
>  }
>  
> +static void __coda_decoder_drop_used_metas(struct coda_ctx *ctx)

Let's just call this coda_decoder_drop_used_metas.
Otherwise this looks fine,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> +{
> +	struct coda_buffer_meta *meta, *tmp;
> +
> +	/*
> +	 * All metas that end at or before the RD pointer (fifo out),
> +	 * are now consumed by the VPU and should be released.
> +	 */
> +	spin_lock(&ctx->buffer_meta_lock);
> +	list_for_each_entry_safe(meta, tmp, &ctx->buffer_meta_list, list) {
> +		if (ctx->bitstream_fifo.kfifo.out >= meta->end) {
> +			coda_dbg(2, ctx, "releasing meta: seq=%d start=%d end=%d\n",
> +				 meta->sequence, meta->start, meta->end);
> +
> +			list_del(&meta->list);
> +			ctx->num_metas--;
> +			ctx->first_frame_sequence++;
> +			kfree(meta);
> +		}

Here it should also be possible to

		  else {
			break;
		}

as meta->end ever increases.

regards
Philipp

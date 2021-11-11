Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0409244DAEE
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 18:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbhKKRFy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 11 Nov 2021 12:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbhKKRFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 12:05:54 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5230C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 09:03:04 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mlDTb-0001Eq-7w; Thu, 11 Nov 2021 18:03:03 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mlDTZ-000Kf5-V0; Thu, 11 Nov 2021 18:03:01 +0100
Message-ID: <bf7129460b4fb0c9daa92cfc628248ee92399074.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: Keep metas sync with hardware fifo
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Date:   Thu, 11 Nov 2021 18:03:01 +0100
In-Reply-To: <20211108142404.598968-1-benjamin.gaignard@collabora.com>
References: <20211108142404.598968-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2021-11-08 at 15:24 +0100, Benjamin Gaignard wrote:
> After updating the output fifo position be sure that metas are also
> synchronised with this position.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/coda/coda-bit.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index c484c008ab02..28c56286b0de 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -2315,6 +2315,12 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>  	/* Update kfifo out pointer from coda bitstream read pointer */
>  	coda_kfifo_sync_from_device(ctx);
>
> +	/*
> +	 * After updating the read pointer, we need to check if
> +	 * any metas are consumed and should be released.
> +	 */
> +	coda_decoder_drop_used_metas(ctx);
> +

This doesn't look right. If you drop all metas seen by the decoder right
away, they can't be copied into the decoded picture's meta slot later in
this function. I'd expect you run into the "empty timestamp list!"
errors if you do this.

regards
Philipp

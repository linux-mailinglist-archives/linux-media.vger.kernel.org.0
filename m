Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A804623041C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 09:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgG1H3T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 28 Jul 2020 03:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgG1H3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 03:29:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A54DC061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 00:29:19 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k0K34-0006CB-2u; Tue, 28 Jul 2020 09:29:18 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k0K33-0002Ou-N9; Tue, 28 Jul 2020 09:29:17 +0200
Message-ID: <181950351490aab7c4abf3c2e89957722959dcf0.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] hantro: postproc: Fix motion vector space
 allocation
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>, kernel@collabora.com
Date:   Tue, 28 Jul 2020 09:29:17 +0200
In-Reply-To: <20200727170538.32894-3-ezequiel@collabora.com>
References: <20200727170538.32894-1-ezequiel@collabora.com>
         <20200727170538.32894-3-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-07-27 at 14:05 -0300, Ezequiel Garcia wrote:
> When the post-processor is enabled, the driver allocates
> "shadow buffers" which are used for the decoder core,
> and exposes the post-processed buffers to userspace.
> 
> For this reason, extra motion vector space has to
> be allocated on the shadow buffers, which the driver
> wasn't doing. Fix it.
> 
> This fix should address artifacts on high profile bitstreams.
> 
> Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 44062ffceaea..6d2a8f2a8f0b 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -118,7 +118,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>  	unsigned int num_buffers = cap_queue->num_buffers;
>  	unsigned int i, buf_size;
>  
> -	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
> +		   hantro_h264_mv_size(ctx->dst_fmt.width,
> +				       ctx->dst_fmt.height);
>  
>  	for (i = 0; i < num_buffers; ++i) {
>  		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

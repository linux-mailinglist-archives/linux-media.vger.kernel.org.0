Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C11823041B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 09:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgG1H3R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 28 Jul 2020 03:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgG1H3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 03:29:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344CFC061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 00:29:17 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k0K31-0006Bs-TV; Tue, 28 Jul 2020 09:29:15 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k0K30-0002Og-Is; Tue, 28 Jul 2020 09:29:14 +0200
Message-ID: <7bfa9af00772926269ac752e0fdae1cbfd58c277.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] hantro: h264: Get the correct fallback reference
 buffer
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>, kernel@collabora.com
Date:   Tue, 28 Jul 2020 09:29:14 +0200
In-Reply-To: <20200727170538.32894-2-ezequiel@collabora.com>
References: <20200727170538.32894-1-ezequiel@collabora.com>
         <20200727170538.32894-2-ezequiel@collabora.com>
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
> If the bitstream and the application are incorrectly configuring
> the reference pictures, the hardware will need to fallback
> to using some other reference picture.
> 
> When the post-processor is enabled, the fallback buffer
> should be a shadow buffer (postproc.dec_q), and not a
> CAPTURE queue buffer, since the latter is post-processed
> and not really the output of the decoder core.
> 
> Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> index 194d05848077..6dcd47bd9ed3 100644
> --- a/drivers/staging/media/hantro/hantro_h264.c
> +++ b/drivers/staging/media/hantro/hantro_h264.c
> @@ -325,7 +325,7 @@ dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
>  		 */
>  		dst_buf = hantro_get_dst_buf(ctx);
>  		buf = &dst_buf->vb2_buf;
> -		dma_addr = vb2_dma_contig_plane_dma_addr(buf, 0);
> +		dma_addr = hantro_get_dec_buf_addr(ctx, buf);
>  	}
>  
>  	return dma_addr;

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

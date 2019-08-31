Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4DEA43B0
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2019 11:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfHaJiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Aug 2019 05:38:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52620 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfHaJiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Aug 2019 05:38:54 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D582B25AD78;
        Sat, 31 Aug 2019 19:38:51 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id A8C49E22BF5; Sat, 31 Aug 2019 11:38:49 +0200 (CEST)
Date:   Sat, 31 Aug 2019 11:38:49 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Use div64_ul() for u64-by-unsigned-long
 divide
Message-ID: <20190831093849.sddptyff24i6ufn7@verge.net.au>
References: <20190830134827.12237-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830134827.12237-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 30, 2019 at 03:48:27PM +0200, Geert Uytterhoeven wrote:
> div_u64() does a 64-by-32 division, while the divisor max2175.xtal_freq
> is unsigned long, thus 64-bit on 64-bit platforms.  Hence the proper
> function to call is div64_ul().
> 
> Note that this change does not have any functional impact, as the
> crystal frequency must be much lower than the 32-bit limit anyway.
> On 32-bit platforms, the generated code is the same.  But at least on
> arm64, this saves an AND-instruction to truncate xtal_freq to 32-bit.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/media/i2c/max2175.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
> index 19a3ceea3bc20f0f..506a30e69ced45c4 100644
> --- a/drivers/media/i2c/max2175.c
> +++ b/drivers/media/i2c/max2175.c
> @@ -591,8 +591,8 @@ static int max2175_set_lo_freq(struct max2175 *ctx, u32 lo_freq)
>  		lo_freq *= lo_mult;
>  
>  	int_desired = lo_freq / ctx->xtal_freq;
> -	frac_desired = div_u64((u64)(lo_freq % ctx->xtal_freq) << 20,
> -			       ctx->xtal_freq);
> +	frac_desired = div64_ul((u64)(lo_freq % ctx->xtal_freq) << 20,
> +				ctx->xtal_freq);
>  
>  	/* Check CSM is not busy */
>  	ret = max2175_poll_csm_ready(ctx);
> -- 
> 2.17.1
> 

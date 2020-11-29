Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5B1E2C787E
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 10:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgK2Jiu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 04:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2Jit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 04:38:49 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45918C0613CF
        for <linux-media@vger.kernel.org>; Sun, 29 Nov 2020 01:38:09 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5BE87C6334; Sun, 29 Nov 2020 09:38:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606642687; bh=9eoEK83GJhsMJeAJ3uD6oecUjmpKsGK78UxkiOEckrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EwqqCRaEnO1mq7sjMhK5xZWUlvNo8w1+rMcnNLW+7Np0Yb4k8PigM+ApqsOQGyp5W
         zrwsLvhdNH2d+/0oKpOj2Herb8kj8ikmx+ewaRPZwuH5Pm0MgJinytzjL53UtzLqiT
         V+Dv0IkAhnsKgxTh8na4cB8T6XrTAidoWRGvDxqIsiy3JklPoxcrKHoRa6GCUUpJqI
         yOJv0GoWb0+KcjE8MFf4XcI42OM5lpQpS6X3liHR8pyeSi1H+2zy/8jJPSGfO3/hoD
         gJFF4RZfVG9fcfRjU6BYt/3GhPQIIjlnptivopz7EAOnrUgMfLbSeU/i6zk75seRQ/
         fV1FULXrIXelw==
Date:   Sun, 29 Nov 2020 09:38:07 +0000
From:   Sean Young <sean@mess.org>
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mtk-cir: fix calculation of chk period
Message-ID: <20201129093807.GA12812@gofer.mess.org>
References: <20201128165728.29756-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128165728.29756-1-sean@mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frank,

On Sat, Nov 28, 2020 at 04:57:28PM +0000, Sean Young wrote:
> Since commit 528222d853f9 ("media: rc: harmonize infrared durations to
> microseconds"), the calculation of the chk period is wrong. As a result,
> all reported IR will have incorrect timings.
> 
> Now that the calculations are done in microseconds rather than nanoseconds,
> we can fold the calculations in a simpler form with less rounding error.

Would you be able to test this change please? That would be super-helpful.

Thank you,

Sean

> 
> Cc: Frank Wunderlich <frank-w@public-files.de>
> Fixes: 528222d853f9 ("media: rc: harmonize infrared durations to microseconds")
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/mtk-cir.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
> index 5051a5e5244b..cdfb1eded306 100644
> --- a/drivers/media/rc/mtk-cir.c
> +++ b/drivers/media/rc/mtk-cir.c
> @@ -151,15 +151,12 @@ static inline u32 mtk_chk_period(struct mtk_ir *ir)
>  {
>  	u32 val;
>  
> -	/* Period of raw software sampling in ns */
> -	val = DIV_ROUND_CLOSEST(1000000000ul,
> -				clk_get_rate(ir->bus) / ir->data->div);
> -
>  	/*
>  	 * Period for software decoder used in the
>  	 * unit of raw software sampling
>  	 */
> -	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, val);
> +	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE * clk_get_rate(ir->bus),
> +				USEC_PER_SEC * ir->data->div);
>  
>  	dev_dbg(ir->dev, "@pwm clk  = \t%lu\n",
>  		clk_get_rate(ir->bus) / ir->data->div);
> -- 
> 2.28.0

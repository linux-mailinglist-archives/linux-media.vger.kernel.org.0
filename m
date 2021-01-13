Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCD2F4D28
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 15:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAMOeZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 09:34:25 -0500
Received: from gofer.mess.org ([88.97.38.141]:50591 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbhAMOeZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 09:34:25 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 62E44C6378; Wed, 13 Jan 2021 14:33:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1610548423; bh=mEnNij7JtIsgICbFjxm+XkheIaJlysr8bzezKdXpPkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T7WMkVijJRJ16g0Fr2qpEN8GGavduKlAN2AQWhQqh1KOk9KGJ1mIiwLDYEXE8st95
         17TgOxns/z69eqWtVXQvo7o9FUDpORK5YHvBs/KloWUCmrlPwKTVMZDBoA8v8vPNro
         Cd+3K9wPRwQmDQ2v2xOq1Z9zGAp1svJutxlPulMkg+muLzM7AVr9oaiQRBrPGQYMCO
         c1/nivxi7uKZVd/UUj5lk5ycR4f3N8NkknHm+Y7q63vwEafeUNZoYbYbsnBRXpU+ci
         Vl/CAJr99jf3x7aEZVtNkugYnOi62ZwgmhAZCztI80fLvIQbMK2WsNHBlSawfM3M2c
         cJ2uq3zMxEBzw==
Date:   Wed, 13 Jan 2021 14:33:43 +0000
From:   Sean Young <sean@mess.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/4] media: sunxi-cir: Clean up dead register writes
Message-ID: <20210113143343.GA8430@gofer.mess.org>
References: <20210113045132.31430-1-samuel@sholland.org>
 <20210113045132.31430-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113045132.31430-2-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 10:51:29PM -0600, Samuel Holland wrote:
> The register writes during driver removal occur after the device is
> already put back in reset, so they never had any effect.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/media/rc/sunxi-cir.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 8555c7798706..0a7f7eab3cc3 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -342,22 +342,12 @@ static int sunxi_ir_probe(struct platform_device *pdev)
>  
>  static int sunxi_ir_remove(struct platform_device *pdev)
>  {
> -	unsigned long flags;
>  	struct sunxi_ir *ir = platform_get_drvdata(pdev);
>  
>  	clk_disable_unprepare(ir->clk);
>  	clk_disable_unprepare(ir->apb_clk);
>  	reset_control_assert(ir->rst);
>  
> -	spin_lock_irqsave(&ir->ir_lock, flags);
> -	/* disable IR IRQ */
> -	writel(0, ir->base + SUNXI_IR_RXINT_REG);
> -	/* clear All Rx Interrupt Status */
> -	writel(REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
> -	/* disable IR */
> -	writel(0, ir->base + SUNXI_IR_CTL_REG);
> -	spin_unlock_irqrestore(&ir->ir_lock, flags);
> -
>  	rc_unregister_device(ir->rc);
>  	return 0;
>  }

I don't think there is anything wrong with the patch, however here the
driver does rc_unregister_device() *after* disabling it. Userspace can
still hold a file descriptor open, and call e.g. LIRC_SET_REC_TIMEOUT
ioctl, which causes various writes the sunxi-cir registers.

The order should be reversed.


Sean

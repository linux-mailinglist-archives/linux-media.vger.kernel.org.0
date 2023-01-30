Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FF6680B6E
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 11:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbjA3K70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 05:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbjA3K7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 05:59:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0BA2B0B9
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 02:59:14 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pMRsX-00025o-DT; Mon, 30 Jan 2023 11:59:13 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pMRsW-00041p-Tv; Mon, 30 Jan 2023 11:59:12 +0100
Date:   Mon, 30 Jan 2023 11:59:12 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: tc358746: init m/p_best to 0
Message-ID: <20230130105912.vufkpuhiejuyipt7@pengutronix.de>
References: <15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

thanks for the patch.

On 23-01-30, Hans Verkuil wrote:
> This fixes compiler warnings:
> 
> In file included from include/linux/printk.h:566,
>                  from include/linux/kernel.h:29,
>                  from include/linux/clk.h:13,
>                  from drivers/media/i2c/tc358746.c:12:
> drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
> include/linux/dynamic_debug.h:272:33: warning: 'p_best' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>       |                                 ^~~~~~~~~~~~~~~~~
> drivers/media/i2c/tc358746.c:817:13: note: 'p_best' was declared here
>   817 |         u16 p_best, p;
>       |             ^~~~~~
> In file included from include/linux/printk.h:566,
>                  from include/linux/kernel.h:29,
>                  from include/linux/clk.h:13,
>                  from drivers/media/i2c/tc358746.c:12:
> include/linux/dynamic_debug.h:272:33: warning: 'm_best' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>       |                                 ^~~~~~~~~~~~~~~~~
> drivers/media/i2c/tc358746.c:816:13: note: 'm_best' was declared here
>   816 |         u16 m_best, mul;
>       |             ^~~~~~

I'm not sure why this is printed. The m/p_best variables are only used
if best_freq != 0 else it is not used. If best_freq != 0 m/p_best is set
to the found mul/p. So IMHO this is a false positiv from the compiler.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to make the compiler happy:

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> ---
>  drivers/media/i2c/tc358746.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index d1f552bd81d4..b86baa5c2d82 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -813,8 +813,8 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
>  	u32 min_delta = 0xffffffff;
>  	u16 prediv_max = 17;
>  	u16 prediv_min = 1;
> -	u16 m_best, mul;
> -	u16 p_best, p;
> +	u16 m_best = 0, mul;
> +	u16 p_best = 0, p;
>  	u8 postdiv;
> 
>  	if (fout > 1000 * HZ_PER_MHZ) {
> -- 
> 2.39.0
> 
> 
> 

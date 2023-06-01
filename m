Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB3E719B7A
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 14:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjFAMEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 08:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbjFAMEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 08:04:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D3ED7
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 05:04:52 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4h2w-0002jY-Mw; Thu, 01 Jun 2023 14:04:50 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4h2v-0007Sf-9W; Thu, 01 Jun 2023 14:04:49 +0200
Date:   Thu, 1 Jun 2023 14:04:49 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/1] media: tc358746: Address compiler warnings
Message-ID: <20230601120449.z7uj4qmvkkdegkqx@pengutronix.de>
References: <20230601110642.3361516-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601110642.3361516-1-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23-06-01, Sakari Ailus wrote:
> Address these compiler warnings by initialising the m_best and p_best
> values to 0 and 1 respectively (as latter is used as a divisor):
> 
>    drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
> >> drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used uninitialized
> [-Wuninitialized]
>      817 |         u16 p_best, p;
>          |             ^~~~~~
> >> drivers/media/i2c/tc358746.c:816:13: warning: 'm_best' is used uninitialized
> [-Wuninitialized]
>      816 |         u16 m_best, mul;
>          |             ^~~~~~
> 
> The warnings may well be a false positive but it is difficult for a
> compiler to find out whether that truly is the case.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305301627.fLT3Bkds-lkp@intel.com/
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> ---
> since v1:
> 
> - Note that this may be a false positive.
> 
>  drivers/media/i2c/tc358746.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index ec1a193ba161a..25fbce5cabdaa 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -813,8 +813,8 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
>  	u32 min_delta = 0xffffffff;
>  	u16 prediv_max = 17;
>  	u16 prediv_min = 1;
> -	u16 m_best, mul;
> -	u16 p_best, p;
> +	u16 m_best = 0, mul;
> +	u16 p_best = 1, p;
>  	u8 postdiv;
>  
>  	if (fout > 1000 * HZ_PER_MHZ) {
> -- 
> 2.30.2
> 
> 

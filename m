Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFFB7179CA
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 10:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbjEaISP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 04:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbjEaISO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 04:18:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FA593
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 01:18:13 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4H23-00078I-MI; Wed, 31 May 2023 10:18:11 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1q4H22-0004UG-UG; Wed, 31 May 2023 10:18:10 +0200
Date:   Wed, 31 May 2023 10:18:10 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] media: tc358746: Address compiler warnings
Message-ID: <20230531081810.pprennf7riycnvsm@pengutronix.de>
References: <20230530102126.2886766-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530102126.2886766-1-sakari.ailus@linux.intel.com>
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

Hi Sakari,

Hans already sent a patch a few months ago:
 - https://lore.kernel.org/linux-media/15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl/

It turned out that the compiler had a bug albeit the compiler listed in
'Closes:' is already a gcc-12 and now the warning used is slightly
different.

I'm not again the patch but we should point out that this patch is only
required to make the compiler happy.

Regards,
  Marco

On 23-05-30, Sakari Ailus wrote:
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
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305301627.fLT3Bkds-lkp@intel.com/
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
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

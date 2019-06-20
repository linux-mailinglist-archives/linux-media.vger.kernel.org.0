Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2924CA71
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 11:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfFTJPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 05:15:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50489 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTJPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 05:15:12 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdt9y-0006rh-Tm; Thu, 20 Jun 2019 11:15:10 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hdt9y-00030m-Hw; Thu, 20 Jun 2019 11:15:10 +0200
Date:   Thu, 20 Jun 2019 11:15:10 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 1/2] mt9m111: No need to check for the regulator
Message-ID: <20190620091510.cpmvs7mlfoi3znli@pengutronix.de>
References: <20190618115910.17272-1-sakari.ailus@linux.intel.com>
 <20190618115910.17272-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618115910.17272-2-sakari.ailus@linux.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:14:20 up 33 days, 15:32, 46 users,  load average: 0.07, 0.07,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 19-06-18 14:59, Sakari Ailus wrote:
> The regulator_get() function returns a regulator when it succeeds. There's
> no need to check whether the regulator is NULL later on.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/mt9m111.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Looks good feel free to add my

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 746d1345b505..bb19f8c346cb 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -984,11 +984,9 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (mt9m111->regulator) {
> -		ret = regulator_enable(mt9m111->regulator);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret = regulator_enable(mt9m111->regulator);
> +	if (ret < 0)
> +		return ret;
>  
>  	ret = mt9m111_resume(mt9m111);
>  	if (ret < 0) {
> @@ -1002,8 +1000,7 @@ static int mt9m111_power_on(struct mt9m111 *mt9m111)
>  static void mt9m111_power_off(struct mt9m111 *mt9m111)
>  {
>  	mt9m111_suspend(mt9m111);
> -	if (mt9m111->regulator)
> -		regulator_disable(mt9m111->regulator);
> +	regulator_disable(mt9m111->regulator);
>  	v4l2_clk_disable(mt9m111->clk);
>  }
>  
> -- 
> 2.11.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

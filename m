Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D848762498
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 23:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjGYVkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 17:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjGYVky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 17:40:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240751FD2
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 14:40:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78B76558;
        Tue, 25 Jul 2023 23:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690321192;
        bh=mm51wpGV2vTXmsaz015+a0YhQgWDD7h+K72Jc3srHmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q81qZEPfjztKnXoF8jr4MQQL3Jl9rTr1cTujd336OX+8V43lG2uPM27KdvqX4J2HM
         aa/WkqKHU1ZzHU6FLkTC6tXvknTrLmMrIzvghw2MSe3z07hq6yT8aq3NwSCfyUgHXE
         bpF3u8cn9eCre3wPcUur7LQMAOPkcnWt7vpDEU1s=
Date:   Wed, 26 Jul 2023 00:40:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: Switch three more drivers back to use struct
 i2c_driver::probe()
Message-ID: <20230725214058.GV31069@pendragon.ideasonboard.com>
References: <20230718204541.3955386-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230718204541.3955386-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Uwe,

Thank you for the patch.

On Tue, Jul 18, 2023 at 10:45:41PM +0200, Uwe Kleine-König wrote:
> struct i2c_driver::probe_new() is about to go away. Since I converted
> all drivers below drivers/media use struct i2c_driver::probe, three more
> drivers were added in the following commits that use .probe_new():
> 
> 	6363db1c9d45 media: i2c: add DS90UB953 driver
> 	c158d0d4ff15 media: i2c: add DS90UB913 driver
> 	afe267f2d368 media: i2c: add DS90UB960 driver
> 
> Switch these driver to use the probe callback.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Hello,
> 
> these three drivers are currently added in next and introduce new usages
> of .probe_new which I intend to remove after the next -rc1.
> 
> To reduce the amount of patches that are necessary to apply together
> with the patch that drops .probe_new() it would be great if you make
> sure that this patch makes it in before v6.6-rc1.
> 
> Thanks
> Uwe
> 
>  drivers/media/i2c/ds90ub913.c | 2 +-
>  drivers/media/i2c/ds90ub953.c | 2 +-
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 203f7cceae23..4dae5afa9fa9 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -889,7 +889,7 @@ static const struct of_device_id ub913_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, ub913_dt_ids);
>  
>  static struct i2c_driver ds90ub913_driver = {
> -	.probe_new	= ub913_probe,
> +	.probe		= ub913_probe,
>  	.remove		= ub913_remove,
>  	.id_table	= ub913_id,
>  	.driver = {
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 1e3827a60029..87a7420366ea 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -1382,7 +1382,7 @@ static const struct of_device_id ub953_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, ub953_dt_ids);
>  
>  static struct i2c_driver ds90ub953_driver = {
> -	.probe_new	= ub953_probe,
> +	.probe		= ub953_probe,
>  	.remove		= ub953_remove,
>  	.id_table	= ub953_id,
>  	.driver = {
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index e101bcf2356a..548c257f922f 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -4034,7 +4034,7 @@ static const struct of_device_id ub960_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, ub960_dt_ids);
>  
>  static struct i2c_driver ds90ub960_driver = {
> -	.probe_new	= ub960_probe,
> +	.probe		= ub960_probe,
>  	.remove		= ub960_remove,
>  	.id_table	= ub960_id,
>  	.driver = {
> 
> base-commit: 6363db1c9d45a54ddc1582423b74b5f9935b5958

-- 
Regards,

Laurent Pinchart

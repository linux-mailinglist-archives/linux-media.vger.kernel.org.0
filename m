Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08EB4D9A4B
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 12:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347575AbiCOLYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 07:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237382AbiCOLYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 07:24:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D2E7671
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 04:23:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E68F1AD5;
        Tue, 15 Mar 2022 12:23:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647343398;
        bh=AHPn8BtUVuMiwfMMem376fE7pdsVjDvLNUds/QJTm7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D9NyuwzOAAwjpuXAvRvoVgcPSGr4KD05QiNI6UG/fkFeYz8WZuHWbQ2cH4A1oFev1
         E+gkFC+TSXJ4ZD51SGig0nTkV4AWubTPHjikyEosn2cMtvLjjOTm/TkGyh5QMELj3z
         /HT8YlQ9C0LJbdOx26S3aa9tCq18pyX+9Qeoo2rc=
Date:   Tue, 15 Mar 2022 13:23:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/5] media: imx: imx-mipi-csis: Drop powered flag
Message-ID: <YjB3FX3Mdd0+cTTd@pendragon.ideasonboard.com>
References: <20220314103941.46021-1-jacopo@jmondi.org>
 <20220314103941.46021-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314103941.46021-3-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 14, 2022 at 11:39:38AM +0100, Jacopo Mondi wrote:
> The mipi_csis_device.powered flag only serves for the purpose of
> not accessing registers in mipi_csis_log_status() when the interface
> is not powered up.
> 
> Instead of manually tracking the power state, rely on
> pm_runtime_get_if_in_use() to remove the 'powered' flag. Also remove
> the locking in the function as runtime_pm() is refcounted and there's no
> risk of the interface being powered down behind our backs.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 60e7f0452582..b76bb129a416 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -327,10 +327,9 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
> -	struct mutex lock;	/* Protect csis_fmt, format_mbus and powered */
> +	struct mutex lock;	/* Protect csis_fmt and format_mbus */
>  	const struct csis_pix_format *csis_fmt;
>  	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
> -	bool powered;
>  
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> @@ -1174,11 +1173,11 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
>  {
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
>  
> -	mutex_lock(&csis->lock);
>  	mipi_csis_log_counters(csis, true);
> -	if (csis->debug.enable && csis->powered)
> +	if (csis->debug.enable && pm_runtime_get_if_in_use(csis->dev)) {
>  		mipi_csis_dump_regs(csis);
> -	mutex_unlock(&csis->lock);
> +		pm_runtime_put(csis->dev);

I was going to write that you could move runtime PM to
mipi_csis_dump_regs(), and then noticed patch 5/5 that does so. Is there
any reason it can't be done here already (essentially squashing this
with 5/5) ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
>  
>  	return 0;
>  }
> @@ -1344,8 +1343,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
>  
>  	mipi_csis_clk_disable(csis);
>  
> -	csis->powered = false;
> -
>  unlock:
>  	mutex_unlock(&csis->lock);
>  
> @@ -1366,8 +1363,6 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
>  
>  	mipi_csis_clk_enable(csis);
>  
> -	csis->powered = true;
> -
>  unlock:
>  	mutex_unlock(&csis->lock);
>  

-- 
Regards,

Laurent Pinchart

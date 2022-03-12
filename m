Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5134D7079
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 20:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiCLSwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 13:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiCLSwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 13:52:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5A414076D
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 10:50:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD5CB183C;
        Sat, 12 Mar 2022 19:50:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647111058;
        bh=AKx3scubGuB11zo319vCyuxVmBrzwLvbWOULCTJFKCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=niFu+wlqxLmpCM/tApZpuvTbSxf0YzxfajjHPnPvGYAHe72i3BZugMSO8qbqer8RS
         LZVTuNyaxXtx28NnzZFp6HEKDJFmOfDzynQgqCcCO+xkkuNUU+E8QZ8wawgB6nnjrP
         kck0Z0xZ3VErLXOAXg2d0WhgZUn6yDcfPkZLc2H0=
Date:   Sat, 12 Mar 2022 20:50:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/2] media: imx: imx-mipi-csis: Drop powered flag
Message-ID: <YizrgHiUiOeSImw3@pendragon.ideasonboard.com>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220312152505.145453-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220312152505.145453-2-jacopo@jmondi.org>
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

On Sat, Mar 12, 2022 at 04:25:05PM +0100, Jacopo Mondi wrote:
> The mipi_csis_device.powered flag only serves for the purpose of
> not accessing registers in mipi_csis_log_status() when the interface
> is not powered up.
> 
> Instead of manually tracking the power state, rely on
> pm_runtime_get_if_in_use() and remove the flag.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index fa00b36fc394..505dd373b40c 100644
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
> @@ -1176,8 +1175,15 @@ static int mipi_csis_log_status(struct v4l2_subdev *sd)
> 
>  	mutex_lock(&csis->lock);
>  	mipi_csis_log_counters(csis, true);
> -	if (csis->debug.enable && csis->powered)
> -		mipi_csis_dump_regs(csis);
> +	if (!csis->debug.enable ||
> +	    !pm_runtime_get_if_in_use(csis->dev))
> +		goto unlock;
> +
> +	mipi_csis_dump_regs(csis);
> +
> +	pm_runtime_put(csis->dev);
> +
> +unlock:

I like this change, but I think we can go one step further and drop the
lock here, as there's no powered field to access anymore:

	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);

	mipi_csis_log_counters(csis, true);

	if (csis->debug.enable && pm_runtime_get_if_in_use(csi->dev)) {
		mipi_csis_dump_regs(csis);
		pm_runtime_put(csis->dev);
	}

	return 0;

A third patch could then drop the lock from mipi_csis_runtime_suspend()
and mipi_csis_runtime_resume(). What do you think ?

>  	mutex_unlock(&csis->lock);
> 
>  	return 0;
> @@ -1344,8 +1350,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
> 
>  	mipi_csis_clk_disable(csis);
> 
> -	csis->powered = false;
> -
>  unlock:
>  	mutex_unlock(&csis->lock);
> 
> @@ -1366,8 +1370,6 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
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

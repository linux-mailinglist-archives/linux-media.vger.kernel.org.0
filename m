Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C4A4D66E3
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 17:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237478AbiCKQ4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 11:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbiCKQ4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 11:56:31 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAE6E1B68
        for <linux-media@vger.kernel.org>; Fri, 11 Mar 2022 08:55:23 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8CD8D240003;
        Fri, 11 Mar 2022 16:55:20 +0000 (UTC)
Date:   Fri, 11 Mar 2022 17:55:19 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Paul Elder <paul.elder@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 3/4] media: imx: imx-mipi-csis: Don't stop streaming at
 runtime suspend time
Message-ID: <20220311165519.bispto2x5vcl5un2@uno.localdomain>
References: <20220311135535.30108-1-laurent.pinchart@ideasonboard.com>
 <20220311135535.30108-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220311135535.30108-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 11, 2022 at 03:55:34PM +0200, Laurent Pinchart wrote:
> Streaming is guaranteed to have been stopped by the time the device gets
> runtime suspended, as pm_runtime_put() is called from .s_stream(0) only.
> Drop the manual stop.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 3bdfe05a6c54..d656b8bfcc33 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -1355,7 +1355,6 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
>
>  	mutex_lock(&csis->lock);
>  	if (csis->state & ST_POWERED) {
> -		mipi_csis_stop_stream(csis);
>  		ret = mipi_csis_phy_disable(csis);
>  		if (ret)
>  			goto unlock;
> --
> Regards,
>
> Laurent Pinchart
>

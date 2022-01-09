Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72C2488A42
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 16:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiAIPfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 10:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbiAIPfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 10:35:31 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C7AC06173F;
        Sun,  9 Jan 2022 07:35:30 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ABD47E0008;
        Sun,  9 Jan 2022 15:35:27 +0000 (UTC)
Date:   Sun, 9 Jan 2022 16:36:28 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: rdacm20: Fix indentation in comment
Message-ID: <20220109153628.lyn62toisoln67jy@uno.localdomain>
References: <20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sat, Jan 01, 2022 at 07:35:40PM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Fix a small indentation issue in a comment block.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Ups :)
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/rdacm20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 025a610de893..e1eff4678ab3 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -463,8 +463,8 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  		return ret;
>
>  	/*
> -	 *  Ensure that we have a good link configuration before attempting to
> -	 *  identify the device.
> +	 * Ensure that we have a good link configuration before attempting to
> +	 * identify the device.
>  	 */
>  	ret = max9271_configure_i2c(&dev->serializer,
>  				    MAX9271_I2CSLVSH_469NS_234NS |
>
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
> --
> Regards,
>
> Laurent Pinchart
>

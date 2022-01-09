Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5031E488A3F
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 16:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbiAIPeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 10:34:09 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:58253 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbiAIPeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 10:34:08 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A0280240007;
        Sun,  9 Jan 2022 15:34:06 +0000 (UTC)
Date:   Sun, 9 Jan 2022 16:35:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: i2c: max9271: Add header include guards to
 max9271.h
Message-ID: <20220109153506.2o7ot34i4c5mlz3u@uno.localdomain>
References: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 03, 2022 at 12:48:03AM +0200, Laurent Pinchart wrote:
> Protect against multiple inclusions of the max9271.h header with include
> guards.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Indeed
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/max9271.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
> index dc5e4e70ba6f..0bf1d40811eb 100644
> --- a/drivers/media/i2c/max9271.h
> +++ b/drivers/media/i2c/max9271.h
> @@ -8,6 +8,9 @@
>   * Copyright (C) 2015 Cogent Embedded, Inc.
>   */
>
> +#ifndef __MEDIA_I2C_MAX9271_H__
> +#define __MEDIA_I2C_MAX9271_H__
> +
>  #include <linux/i2c.h>
>
>  #define MAX9271_DEFAULT_ADDR	0x40
> @@ -231,3 +234,5 @@ int max9271_set_deserializer_address(struct max9271_device *dev, u8 addr);
>   * Return 0 on success or a negative error code on failure
>   */
>  int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest);
> +
> +#endif /* __MEDIA_I2C_MAX9271_H__ */
> --
> Regards,
>
> Laurent Pinchart
>

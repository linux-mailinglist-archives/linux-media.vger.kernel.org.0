Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99E8316AF1
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhBJQQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:16:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhBJQQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:16:37 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5D40DD;
        Wed, 10 Feb 2021 17:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612973753;
        bh=YJ27IC32WQwEVgulGqZWPtZvgX7OJVwTZloEWIJv/a8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbkdpSICoeMyJku9RfEgmyNwYYsT8fLmaRAVCUgkgrFOsIV6KGJp+gf8KFkD2ZVM/
         WVjipBZfw1s7vKo2xfQA/uLuqhTUzf/HYBbaZBA3RK9Of8w6iANA38s0brU9pak+70
         iTPoir0TQ6emZxi8GNVuCfisLnjciFlKWnyAl/Dg=
Date:   Wed, 10 Feb 2021 18:15:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] media: i2c: max9271: Add MODULE_* macros
Message-ID: <YCQGod8Qm9o60GVd@pendragon.ideasonboard.com>
References: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Feb 10, 2021 at 04:49:08PM +0100, Jacopo Mondi wrote:
> Since commit 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271
> a module") the max9271 library is built as a module but no
> MODULE_*() attributes were specified, causing a build error
> due to missing license information.
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/media/i2c/max9271.o
> 
> Fix this by adding MODULE attributes to the driver.
> 
> Fixes: 7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271 a module")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/max9271.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index c247db569bab..c495582dcff6 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -18,6 +18,7 @@
> 
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/module.h>
> 
>  #include "max9271.h"
> 
> @@ -339,3 +340,7 @@ int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(max9271_set_translation);
> +
> +MODULE_DESCRIPTION("Maxim MAX9271 GMSL Serializer");
> +MODULE_AUTHOR("Jacopo Mondi");
> +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart

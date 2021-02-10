Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B03316B36
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhBJQ3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:29:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:58024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhBJQ3H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:29:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 125D664E6F;
        Wed, 10 Feb 2021 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612974505;
        bh=UGN81+/o4itC9u4ga/xqesHyIFpMtGcJwcG0gRS6xmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A+Yd41PRoSPG4uQyTew0y9BKZl6uND6ILGgJnRCjbsicOYproNwGeXf/AH2n0IO5l
         BayEGK6aGG6hByPNpu706K8Lj4nzc6uV+lQVXrlQKqVle3C4xUTiWjFrAnBRmkUKf2
         PofmEYhZ8SJEFKHEGDSUimztxMgzIZbBoQVtXpomwMWOJfF+JubTcziP6bsObLchcI
         na7C+ofeimRXs/y3lZqOdwta5GdmwVnLteWAe+il/S+qpaA/9u65KbNy7e18co93bF
         F+hoYGbPgxh/nqgc8g9BhHdQw6XPPQQpE2V+vpQ3n+2sKAMHv8ZpG8mO8ay+MXAJoT
         qOQNsE0x9pYzg==
Date:   Wed, 10 Feb 2021 09:28:23 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-next@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] media: i2c: max9271: Add MODULE_* macros
Message-ID: <20210210162823.GA1583432@ubuntu-m3-large-x86>
References: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210154908.1227203-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

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
> --
> 2.30.0
> 

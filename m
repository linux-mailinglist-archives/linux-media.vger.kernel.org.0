Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BC22FCE74
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387700AbhATKm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732248AbhATKR6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:17:58 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 817EE813;
        Wed, 20 Jan 2021 11:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611137836;
        bh=9LS1tzVULivXbxvsb4fOqaJBauUFKNy4KU9N+8aTcpo=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=cerHDvXdwMHMWqmvTHi+HwigwJqHXAIq2h/BlCbCQDg85zA6AdSOnF4T24kUMvaNB
         4aQbtgMbJr9f4NqfdWTCo5iS9/tkWynjddiGFpSe682QaRKuVjYRmlPWK1r8cYg1YY
         JD1EI5xmeh4IqeREbcQMTx18ZK7S1BCSYTYBUVaM=
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com>
Date:   Wed, 20 Jan 2021 10:17:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 20/01/2021 09:01, Lad Prabhakar wrote:
> Fix OV772x build breakage by selecting V4L2_FWNODE config:
> 
> ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
> ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
> ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> 
> Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I see this driver uses subdev API too.

Should the driver also select VIDEO_V4L2_SUBDEV_API?

Or is that covered sufficiently already on any platforms that would use
the driver?

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index eddb10220953..bb1b5a340431 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
>  	tristate "OmniVision OV772x sensor support"
>  	depends on I2C && VIDEO_V4L2
>  	select REGMAP_SCCB
> +	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV772x camera.
> 


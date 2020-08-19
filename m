Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA76249865
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 10:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgHSIpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 04:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgHSIpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 04:45:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9EEC061757
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 01:45:38 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA50729E;
        Wed, 19 Aug 2020 10:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597826735;
        bh=ciHollep2F4tWN4ZTOS5CU/LCvcr8DiIsqxPbXMFl0M=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vkQimNVHrUGVI89H79W4xd5Nrl6x0JV7cjLj9pDzPsUHI17ycDmb2Z5KBKmo5jbc8
         8CVUK+b432NtQQd6TUlN2gQ5AXPs9LVAsTQrTwX7gO9SVDgwKhfuPiCA9WLia7UcG1
         Yy2IfY4sSTqHsDRf+0RkY698EdbeuUxYFWkgXLEA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c: max9286: Depend on GPIOLIB
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org
References: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <12f93522-5ca3-7da8-c819-e1f29429e0b6@ideasonboard.com>
Date:   Wed, 19 Aug 2020 09:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 19/08/2020 01:22, Laurent Pinchart wrote:
> The max9286 driver depends on the GPIO library, list the dependency in
> Kconfig.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Sakari has already posted a fix for this on the 3rd August at:

[PATCH 1/1] max9286: Depend on OF_GPIO

https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/

However he chose to depend upon OF_GPIO.

I think in this instance, his patch is more correct as this particular
issue is regarding the setting of the of_node on the GPIO component,
which is guarded by CONFIG_OF_GPIO in the headers, thus I believe we can
have GPIOLIB && !OF_GPIO, which would still leave compile breakage with
your patch.

--
Regards

Kieran



> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 48ae60a2c603..70ba6ca1b912 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -466,6 +466,7 @@ config VIDEO_VPX3220
>  
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
> +	depends on GPIOLIB
>  	depends on I2C && I2C_MUX
>  	depends on OF
>  	select V4L2_FWNODE
> 


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B537A23BD59
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 17:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgHDPle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 11:41:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42032 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgHDPlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 11:41:32 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 750A727B;
        Tue,  4 Aug 2020 17:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596555689;
        bh=zqv2Am3zfJjBlics+38WSvzsuglqU4H3tHkF0SUgbhA=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=NvbTtoJ8Y9zmPV99QAR6Yy/acO3LKFwvBVzgHizpZABsY599q18thpxMauVQDYSjw
         Ig5T7ikQoBayAlpxjKDKpMyW5SITWMqQdxdEpJmOKZLj4DYOde5dotuIU7H4bDh2C3
         nmuEupt9UkeXALMpmydhr2n+g/8EmKre3CBHWIbM=
Subject: Re: [PATCH 1/1] max9286: Depend on OF_GPIO
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20200803090935.23619-1-sakari.ailus@linux.intel.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b8246861-40d0-e914-01f6-7e3587e43314@ideasonboard.com>
Date:   Tue, 4 Aug 2020 16:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803090935.23619-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 03/08/2020 10:09, Sakari Ailus wrote:
> The driver expects struct gpio_chip has of_node field and that field is
> only there if CONFIG_OF_GPIO is defined. Fix this by changing the OF
> dependency to OF_GPIO.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 48ae60a2c603..915b840f1783 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -467,7 +467,7 @@ config VIDEO_VPX3220
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
>  	depends on I2C && I2C_MUX
> -	depends on OF
> +	depends on OF_GPIO
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
> 


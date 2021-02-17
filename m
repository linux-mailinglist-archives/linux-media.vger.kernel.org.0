Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BE531D9F8
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhBQNJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:09:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49536 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhBQNJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:09:16 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 187FB8C4;
        Wed, 17 Feb 2021 14:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613567313;
        bh=NNpm0Hf3kc3W6OJD+qsniy9E/7kXWfNfBU8EusaNjks=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oYKeghuHn4yo3hFxXoPlFvqYk/t7MAVnMx8/Fcdf/wVCS2pphuQzTHpNo1cbXyMfu
         4q6UcjD3H1P61UXiQpjOuv3ihuX4SsTmZoO3sx1mR4Nd+yYkxWP4fwdL1Jx4LpHrvi
         iWafh47BA2zodEqR8MAvNLGGgDapQmZIEsdpK2tA=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 05/16] media: i2c: rdacm20: Check return values
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-6-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a96ca801-06a4-952c-a58d-7325eea92c32@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:08:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-6-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> The camera module initialization routine does not check the return
> value of a few functions. Fix that.
> 

Sounds quite valid to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 56406d82b5ac..e982373908f2 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -470,11 +470,16 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
>  	 *  Ensure that we have a good link configuration before attempting to
>  	 *  identify the device.
>  	 */
> -	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
> -						MAX9271_I2CSLVTO_1024US |
> -						MAX9271_I2CMSTBT_105KBPS);
> +	ret = max9271_configure_i2c(&dev->serializer,
> +				    MAX9271_I2CSLVSH_469NS_234NS |
> +				    MAX9271_I2CSLVTO_1024US |
> +				    MAX9271_I2CMSTBT_105KBPS);
> +	if (ret)
> +		return ret;
>  
> -	max9271_configure_gmsl_link(&dev->serializer);
> +	ret = max9271_configure_gmsl_link(&dev->serializer);
> +	if (ret)
> +		return ret;
>  
>  	ret = max9271_verify_id(&dev->serializer);
>  	if (ret < 0)
> 


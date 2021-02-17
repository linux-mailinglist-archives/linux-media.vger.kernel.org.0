Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD3131DB06
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 14:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhBQN42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 08:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbhBQN4Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 08:56:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974EDC061574;
        Wed, 17 Feb 2021 05:55:44 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BB208C4;
        Wed, 17 Feb 2021 14:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613570143;
        bh=R7osoee4kcMq/rCIg8WjLb7+RqLp/8fGBINFY//63RM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WY/iaR8bIKo9Psk8cfxKKKAAt/4NZoMbimWz1xkh4uwEbqxjroQqMobH1KKsXONRP
         n7+gB7s+l4YqSL5BX0CK/rY1tKFmavG09sGi/4TV1+VE5q40jn2UKnLeiPGRIZVm7S
         ogp9EsyOy+f/9YC97LAIz1cYlFfTjqBD17ZR8rP4=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 09/16] media: i2c: rdacm21: Re-work OV10640 initialization
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-10-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <106ffb6f-dc21-d45f-dfe8-824f05e453f4@ideasonboard.com>
Date:   Wed, 17 Feb 2021 13:55:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216174146.106639-10-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/02/2021 17:41, Jacopo Mondi wrote:
> The OV10640 image sensor reset and powerdown on signals are controlled
> by the embedded OV490 ISP. The current reset procedure does not respect
> the 1 millisecond power-up delay and releases the reset signal before
> the powerdown one.
> 
> Fix the OV10640 power up sequence by releasing the powerdown signal,
> waiting the mandatory 1 millisecond power up delay and then releasing
> the reset signal. The reset delay is not characterized in the chip
> manual if not as "255 XVCLK + initialization". Wait for at least 3
> milliseconds to guarantee the SCCB bus is available.
> 
> This commit fixes a sporadic start-up error triggered by a failure to
> read the OV10640 chip ID:
> rdacm21 8-0054: OV10640 ID mismatch: (0x01)

Have you done a similar initialisation rework for the RDACM21 as you do
in [03/16] of this series for the RDACM20 (or was it already better
perhaps?)

Only interested because of noting that I think the 'mismatch' check is
now gone from the RDAMC20.


> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm21.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index b22a2ca5340b..c420a6b96879 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -333,13 +333,15 @@ static int ov10640_initialize(struct rdacm21_device *dev)
>  {
>  	u8 val;
>  
> -	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
> +	/* Power-up OV10640 by setting PWDNB and RESETB pins high. */
>  	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
>  	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
>  	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
>  	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
> -	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> +
>  	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
> +	usleep_range(1500, 3000);
> +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
>  	usleep_range(3000, 5000);
>  
>  	/* Read OV10640 ID to test communications. */
> 


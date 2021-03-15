Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EF333C3FE
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 18:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhCORUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 13:20:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38946 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhCORUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 13:20:20 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDE93316;
        Mon, 15 Mar 2021 18:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615828819;
        bh=EfmuDX1Homi+ciII042TtgOrjGfPcOAsZFWHSi2vgdg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XwALossDYbr2SBUlo68kqmYc9RdL1vRHiN95l19MQ/tNXIOeoa/trHKfOC5x6x9pu
         j9wooIgQyrZgAZN0LchHYVXDIq3Dmdo4vaBf9uHxJmdWVgbU9KZqXvwmEYOmItnynk
         pu9g3mQV3sav4dKaBs+yPX97/hSEacg4lH+ly96U=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 11/18] media: i2c: rdacm21: Fix OV10640 powerdown
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-12-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <76196b54-304f-f17f-04af-67bcacd9d923@ideasonboard.com>
Date:   Mon, 15 Mar 2021 17:20:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-12-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/03/2021 13:15, Jacopo Mondi wrote:
> The OV10640 image sensor powerdown signal is controlled by the first
> line of the OV490 GPIO pad #1, but the pad #0 identifier
> OV490_GPIO_OUTPUT_VALUE0 was erroneously used. As a result the image
> sensor powerdown signal was never asserted but was kept high by an
> internal pull-up resistor, causing sporadic failures during the
> image sensor startup phase.
> 
> Fix this by using the correct GPIO pad identifier.
> 
> While at it also fix the GPIO signal handling sequence, as the reset
> line was released before the powerdown one, and introduce the correct
> delays in between the two operations.
> 
> Wait the mandatory 1 millisecond delay after the powerup lane is

Technically you wait 1.5 milliseconds below - but I think that's fine
here ;-)

> asserted. The reset delay is not characterized in the chip manual if
> not as "255 XVCLK + initialization". Wait for at least 3 milliseconds
> to guarantee the SCCB bus is available.
> 
> This commit fixes a sporadic start-up error triggered by a failure to
> read the OV10640 chip ID:
> rdacm21 8-0054: OV10640 ID mismatch: (0x01)
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Sometime it might be nice to see this look more like the GPIO
interfaces, but I think this is fine for now.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 7bce55adfd7c..50a9b0d8255d 100644
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
> +
> +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE1, OV490_SPWDN0);
> +	usleep_range(1500, 3000);
>  	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> -	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);
>  	usleep_range(3000, 5000);
>  
>  	/* Read OV10640 ID to test communications. */
> 


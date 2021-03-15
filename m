Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A782433C8B1
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbhCOVql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbhCOVqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:46:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D86C06174A;
        Mon, 15 Mar 2021 14:46:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89CFB316;
        Mon, 15 Mar 2021 22:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615844780;
        bh=5Znf7F2pIW9/0KS0yAG1GRuyRuzXBbLYiAw7C6bRsWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GAkCWva6IvbMhlMMl/CRterOQ3BIiA/YzAn8m6tjQso7IOR2iRcSOOmeYS214oSiG
         ZpNd1/MaDH3dkcyScIL3H3ywQzFGeU/mZKUaJV7U3POhaMA0OvGNa2JvVbKPeKzdi2
         cgp4q+7baeAqUhdxxkoWx9sy99M8AvuFTI2td5UE=
Date:   Mon, 15 Mar 2021 23:45:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] media: i2c: rdacm21: Fix OV10640 powerdown
Message-ID: <YE/ViFp87iNg+6pz@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-12-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:15:05PM +0100, Jacopo Mondi wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

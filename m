Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EE833BFB5
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 16:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhCOP17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 11:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCOP1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 11:27:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B877C06174A;
        Mon, 15 Mar 2021 08:27:35 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2BDA556;
        Mon, 15 Mar 2021 16:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615822052;
        bh=RegwFdBrJUnjKobGQYC0Hi87r85UosRY93bBvmMOJTY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pMOFIaBXZXMHS3KHcXIk3td/XBs6egcrPDws2/9Nc25nkwYGz56rlXLChCwErzrnD
         t+WlhJQWAkLBKBtfOxnE+gbepz7718y9zF0mthPnqv5pCu8IduaO8trmNEC7Puo10d
         aSOqj0epIcHABgJK3NgMR3QwtcVt6zVureJ/8vPM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 01/18] media: i2c: rdamc21: Fix warning on u8 cast
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-2-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0dac151b-35ea-c5e8-8826-661b69ed75dc@ideasonboard.com>
Date:   Mon, 15 Mar 2021 15:27:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315131512.133720-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/03/2021 13:14, Jacopo Mondi wrote:
> Sparse reports a warning on a cast to u8 of a 16 bits constant.
> 
> drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits
> from constant value (300a becomes a)
> 
> Even if the behaviour is intended, silence the sparse warning replacing
> the cast with a bitwise & operation.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Sounds good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index dcc21515e5a4..179d107f494c 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -345,7 +345,7 @@ static int ov10640_initialize(struct rdacm21_device *dev)
>  	/* Read OV10640 ID to test communications. */
>  	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
>  	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
> -	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
> +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
>  
>  	/* Trigger SCCB slave transaction and give it some time to complete. */
>  	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);
> 


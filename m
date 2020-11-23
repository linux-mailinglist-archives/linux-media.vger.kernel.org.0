Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA872C0D05
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731346AbgKWOOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729562AbgKWOOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:14:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B90C0613CF;
        Mon, 23 Nov 2020 06:14:42 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B9302A4;
        Mon, 23 Nov 2020 15:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606140879;
        bh=cqYcWBxxRdiroukACA2GX9TWCAK8fr3As9+XxoGpe+M=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BFzvW1MQAi7HgaIHuns7KsQnWOMxnzBgzsrmjdc3GuhwM78yuatk8YEvJcmwpmFZt
         emgt/3AbXYrfQL2bFZ3X8d0KPrWVN/a/mBAWhSPUy3ADEv3FkDsIBKBcuGnc39TGzr
         ncPYmVsn4aMNV0DZoLDD/CLCsg2GK+6W4amVhtRY=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/2] media: max9271: Fix GPIO enable/disable
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
 <20201120161529.236447-2-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <04709485-b438-d169-64b6-beb61d22d562@ideasonboard.com>
Date:   Mon, 23 Nov 2020 14:14:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120161529.236447-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 20/11/2020 16:15, Jacopo Mondi wrote:
> Fix GPIO enable/disable operations which wrongly read the 0x0f register
> to obtain the current mask of the enabled lines instead of using
> the correct 0x0e register.
> 
> Also fix access to bit 0 of the register which is marked as reserved.
> 
> Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Took me a few reads of this and the datasheet to be sure :S

But now I am :-D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9271.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index 0f6f7a092a46..c247db569bab 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -223,12 +223,12 @@ int max9271_enable_gpios(struct max9271_device *dev, u8 gpio_mask)
>  {
>  	int ret;
>  
> -	ret = max9271_read(dev, 0x0f);
> +	ret = max9271_read(dev, 0x0e);
>  	if (ret < 0)
>  		return 0;
>  
>  	/* BIT(0) reserved: GPO is always enabled. */
> -	ret |= gpio_mask | BIT(0);
> +	ret |= (gpio_mask & ~BIT(0));
>  	ret = max9271_write(dev, 0x0e, ret);
>  	if (ret < 0) {
>  		dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n", ret);
> @@ -245,12 +245,12 @@ int max9271_disable_gpios(struct max9271_device *dev, u8 gpio_mask)
>  {
>  	int ret;
>  
> -	ret = max9271_read(dev, 0x0f);
> +	ret = max9271_read(dev, 0x0e);
>  	if (ret < 0)
>  		return 0;
>  
>  	/* BIT(0) reserved: GPO cannot be disabled */
> -	ret &= (~gpio_mask | BIT(0));
> +	ret &= ~(gpio_mask | BIT(0));
>  	ret = max9271_write(dev, 0x0e, ret);
>  	if (ret < 0) {
>  		dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n", ret);
> 


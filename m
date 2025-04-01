Return-Path: <linux-media+bounces-29092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CAA771CE
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 02:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A759F16543E
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 00:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DD770831;
	Tue,  1 Apr 2025 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qgWIommj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCB35942;
	Tue,  1 Apr 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466721; cv=none; b=gSAvwszdh7eYlrmDgqWqi0tJKStTQVV+forI2/qv+n65THpfua07XeCWz4vCQgdrj2Rmecv0xCtjXuKGv51yj1A7yOxR0K7S5ofaf6tNKY9rp01yHTveYpSY1RXvl1qAPwwMxO9or9pJAUL7SSF/DterlONavTHt6Ct90gfJmkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466721; c=relaxed/simple;
	bh=G5QapmnXkU5MHRQoP+ZhNE7B1kKHB9/yTNo1Y6G0ZWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZRYP5O7Q0gbC/xV/A4Ch7p6xS/msrdvsFG9uCmWX9EpZ7QZDQpNXiw9IT3bZCwLjqff6OnX82ojBfPB0hQ1QjAHz2TxgQjZrY1nlsHecmiMBJgsQHeXGYIjxaGUq4s2DZOGKsfHoUYbOGGZABpMNWejbhq3PHzvWAHFff5IicE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qgWIommj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-147-224-nat.elisa-mobile.fi [85.76.147.224])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F0EA3E;
	Tue,  1 Apr 2025 02:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743466605;
	bh=G5QapmnXkU5MHRQoP+ZhNE7B1kKHB9/yTNo1Y6G0ZWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgWIommj84sCWjZwU40srtchN9Rt4InsJWxwzLvuH45/3tTUic+9arTH2KsRIy+F2
	 hu9xKc7l8i5e0kH0+Dbpz36frp+0GFgM3hO2Ug9KcX6gpzhwdnzs67C5+nhA6ZY9SJ
	 4oBCl+r7QuvPINNtEWGho+P5FZoNHsfk1nl2lph4=
Date: Tue, 1 Apr 2025 03:18:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	acopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/1] media: i2c: rdacm2x: Make use of device properties
Message-ID: <20250401001812.GA15030@pendragon.ideasonboard.com>
References: <20250331083511.4005934-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331083511.4005934-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

Thank you for the patch.

On Mon, Mar 31, 2025 at 11:35:04AM +0300, Andy Shevchenko wrote:
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> 
> v2: fixed error message wording (Kieran)
> 
>  drivers/media/i2c/rdacm20.c | 7 +++----
>  drivers/media/i2c/rdacm21.c | 7 +++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index b8bd8354d100..52e8e2620b4d 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -16,10 +16,10 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/fwnode.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  
> @@ -575,10 +575,9 @@ static int rdacm20_probe(struct i2c_client *client)
>  	dev->dev = &client->dev;
>  	dev->serializer.client = client;
>  
> -	ret = of_property_read_u32_array(client->dev.of_node, "reg",
> -					 dev->addrs, 2);
> +	ret = device_property_read_u32_array(dev->dev, "reg", dev->addrs, 2);
>  	if (ret < 0) {
> -		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
> +		dev_err(dev->dev, "Invalid FW reg property: %d\n", ret);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 3e22df36354f..bcab462708c7 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -11,10 +11,10 @@
>   */
>  
>  #include <linux/delay.h>
> -#include <linux/fwnode.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  
> @@ -551,10 +551,9 @@ static int rdacm21_probe(struct i2c_client *client)
>  	dev->dev = &client->dev;
>  	dev->serializer.client = client;
>  
> -	ret = of_property_read_u32_array(client->dev.of_node, "reg",
> -					 dev->addrs, 2);
> +	ret = device_property_read_u32_array(dev->dev, "reg", dev->addrs, 2);
>  	if (ret < 0) {
> -		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
> +		dev_err(dev->dev, "Invalid FW reg property: %d\n", ret);
>  		return -EINVAL;
>  	}
>  

-- 
Regards,

Laurent Pinchart


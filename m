Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E16E2C0FAD
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 17:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389833AbgKWP7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:59:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732573AbgKWP7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:59:05 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15BEC061A4D;
        Mon, 23 Nov 2020 07:59:04 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so8324979lfl.13;
        Mon, 23 Nov 2020 07:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjB6THgFfAGNOmPEWbFN7h54KgyZNiFVqrDhQfHhZxw=;
        b=hqZLFq/dAnLg0d8QRN7oYGB8URkZqNG/1BmOZg5zQ/UGMj3t3ofcV1zE1AIL+3I77q
         zyJxYd2GXCHnEjrVgsEBXeVNwtyR0ZAtRSUxwDBHL59PxPTJ7RWt2Qr01pcBe9/XAWjH
         7sZEEjO+RV4AI1gikoVFSdT+xlbU5BgjVqVwUZ2vsGqMmWv7KxN1guVTOeqM85R1UFPB
         upBZzGs/cE1i5Ov/AXMkITqLr5jVTwaHokuWqTqfAoggDuIY50QkfopuCfINgmqYKdAU
         ymzjGBDXbqZ0YuLu8/ST1B+SG1dq7UarmBoTVgZlRFPotProEdt/6D5i9Fgzba06h84D
         200w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjB6THgFfAGNOmPEWbFN7h54KgyZNiFVqrDhQfHhZxw=;
        b=TgYLTnE/xUwL6CK6t+q2FKvVJY1iYChMV/f/ix93T6v5z5ET0pNZd5yC/bYuqI1vfy
         JdPIBaF5+B5KYH+jHJe58DwFNd2pfv5Ks5tx5uOwSHpCG6goqKu7QUi4ZBFcLhDFNdKD
         2d3w6XxPJzrN0MSmTvJ1XftOWD6Sui5Cf3/n4Taf9X4iO34GbvjkzM/NYbQeEDF7b0PX
         c26lDI9oVdWPhBwbSiDc3jv6Er8K3uDSw8QDlmrS0HcSnYcjlaBCi9fC4/de13NpiSuN
         qLBGhw6zub1jcuM99ueBMqES8p6bJt8ak5S57jzwAkVNsR53S3br/qKk/jGZ6ieBeFEq
         xsSg==
X-Gm-Message-State: AOAM5305VXBUjrYVagjObszZxlOHekrqrqn9+NX9WyJFGdHZSixwbfz8
        xdUfdFTmrGeoBBiY4DPCMREEM67vh2s=
X-Google-Smtp-Source: ABdhPJw4G/w7sb5nk91yMkULl1enFhQsDNfT9QxRePl5UTCHTB3ld7KdAXjEuu5MW/oHds6AzM16MA==
X-Received: by 2002:a19:2389:: with SMTP id j131mr14015245lfj.324.1606147143341;
        Mon, 23 Nov 2020 07:59:03 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:2d9:200d:7c26:7999:20ce:bced? ([2a00:1fa0:2d9:200d:7c26:7999:20ce:bced])
        by smtp.gmail.com with ESMTPSA id d18sm5859ljo.115.2020.11.23.07.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 07:59:02 -0800 (PST)
Subject: Re: [PATCH 1/2] media: max9271: Fix GPIO enable/disable
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201120161529.236447-1-jacopo+renesas@jmondi.org>
 <20201120161529.236447-2-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <bef922f7-f9c9-de6f-dd3c-9a0d22581edc@gmail.com>
Date:   Mon, 23 Nov 2020 18:59:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120161529.236447-2-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/20/20 7:15 PM, Jacopo Mondi wrote:

> Fix GPIO enable/disable operations which wrongly read the 0x0f register
> to obtain the current mask of the enabled lines instead of using
> the correct 0x0e register.
> 
> Also fix access to bit 0 of the register which is marked as reserved.
> 
> Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
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

   () hardly needed here, = and <op>= have very low prio...

[...]

MBR, Sergei

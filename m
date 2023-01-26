Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC4867CD93
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 15:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjAZOVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 09:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjAZOVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 09:21:18 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3932720
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 06:21:16 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 0E36B20073;
        Thu, 26 Jan 2023 16:21:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1674742872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lSnNxMzmjPWS0sRZGtNQarsvOtFWVkdTIhYq2IQidj0=;
        b=t2zTRlQ+/nY4ipUSRkE/AKyjwy/YIu7b5iImiM5JY8QEKZQN7SnhCSqRWYHKJwODLW3UXD
        h7y5x8BMo3r5fI4qR58SpcjOyX+fUWADALoBc9pjAxIqis76cF57X5dmJUCUb5ZiqI8ORj
        Ubv7ZOI6h9Tifg02fkoZLxyXs5b0s4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1674742872;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lSnNxMzmjPWS0sRZGtNQarsvOtFWVkdTIhYq2IQidj0=;
        b=DqiePzDegLoy1oSH0M4okULrU0d3rS6bzGYLNMVn9/A6qswJTRTMZK1b93o8TAcNc1wOFc
        Eks15BB1zKD524sdbMt63rT7WksmhNlPzJ+RP/YLlGpQ+fnrIpaChagfy1zKsTNnXH9OfW
        9Dd09MXPqxtXN9DgSeqJRqJCQxifQzM=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1674742872; a=rsa-sha256; cv=none;
        b=mmlGuwTm63f+eOJTET29A10SnGTA2+CA1pB+ujaSmtmg0rZEQ0+0F1Z6GENYmVNl8YT6/Y
        y5CrXkPEKmjfpIPJeBEKyvR8/zB/62j/Jh7TVoZ/sTBmkthXWmRpmrW1IU03vhj3/XBrmO
        NZ81nm80yq1U0rK9/R7JvuOkG8bd3MU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 41E1D634C91;
        Thu, 26 Jan 2023 16:21:05 +0200 (EET)
Date:   Thu, 26 Jan 2023 16:21:04 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>, laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 3/9] media: i2c: ov5670: Probe clocks with OF
Message-ID: <Y9KMUKLe5Rz3SQoF@valkosipuli.retiisi.eu>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
 <20230126124632.45842-4-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126124632.45842-4-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Jan 26, 2023 at 01:46:26PM +0100, Jacopo Mondi wrote:
> Add support for probing the main system clock using the common clock
> framework and its OF bindings.

The OF bindings are actually not related to this patch directly. Only
indirectly. It's all about CCF.

> 
> Maintain ACPI compatibility by falling back to parse 'clock-frequency'.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5670.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 07a396c8ab68..c8beb2bc3d0f 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017 Intel Corporation.
>  
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
>  #include <linux/i2c.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> @@ -2475,13 +2476,10 @@ static int ov5670_probe(struct i2c_client *client)
>  	struct ov5670 *ov5670;
>  	const char *err_msg;
>  	u32 input_clk = 0;
> +	struct clk *clk;
>  	bool full_power;
>  	int ret;
>  
> -	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> -	if (input_clk != 19200000)
> -		return -EINVAL;
> -
>  	ov5670 = devm_kzalloc(&client->dev, sizeof(*ov5670), GFP_KERNEL);
>  	if (!ov5670) {
>  		ret = -ENOMEM;
> @@ -2489,6 +2487,25 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_print;
>  	}
>  
> +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
> +	if (is_of_node(dev_fwnode(&client->dev))) {

This is not a great way to test whether you're expecting a clock: you might
have one in an ACPI system as well.

See e.g. what CCS does: for -ENOENT (clock not found) it relies on
clock-frequency property. Could you do the same here?

> +		clk = devm_clk_get(&client->dev, NULL);
> +		if (IS_ERR(clk))
> +			return dev_err_probe(&client->dev, PTR_ERR(clk),
> +					     "error getting clock\n");
> +
> +		input_clk = clk_get_rate(clk);
> +	} else {
> +		device_property_read_u32(&client->dev, "clock-frequency",
> +					 &input_clk);
> +	}
> +
> +	if (input_clk != 19200000) {
> +		dev_err(&client->dev,
> +			"Unsupported clock frequency %u\n", input_clk);
> +		return -EINVAL;
> +	}
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
>  

-- 
Kind regards,

Sakari Ailus

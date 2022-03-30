Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244124EBA3D
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 07:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243005AbiC3FdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 01:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbiC3FdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 01:33:07 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971581E3190
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 22:31:20 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8BFCC21100;
        Wed, 30 Mar 2022 08:31:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648618278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uMcAtdr3fTbJHieS5jWMJQGU3Q19PAdC/4UqgQfm2p8=;
        b=J7qz6k0afaSVJ/BRmTJyb4PeA7xOoiA25uGcNoBnwKNeKN0+5Zbp+zxsP/breo5jMoQcV3
        r1f1w66CtmQ70fphmUbfEGEx3u76Yvy16X5/VRf7gmkWurgmkkNXSfwjjNxqzvgBbRgh5d
        +qzziLcuiUZLpvGlccCuD8umLT6gEq8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3FBC0634C90;
        Wed, 30 Mar 2022 08:31:18 +0300 (EEST)
Date:   Wed, 30 Mar 2022 08:31:18 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v3 3/8] media: i2c: ov5670: Probe clocks with OF
Message-ID: <YkPrJg64PpiOB5M/@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329090133.338073-4-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648618278; a=rsa-sha256; cv=none;
        b=rz79OmLY+aeLnWNzJZXCdJtTXylFwm6HJW7pZprcS0UweoNm/LZ1F3rCSJ+2CjG2BFGiBY
        WDjZYj79p/DDarPQiUcKnUFV2rNBj8uglcLpbhGwlNGDzIHospJ/Yf/+7zQZgXJSQyHzNG
        S+k2vqu4ex7j4eSo/u1EHL1NglQxGB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648618278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uMcAtdr3fTbJHieS5jWMJQGU3Q19PAdC/4UqgQfm2p8=;
        b=MZfA55A2Fs8GMtst2HBX3W0ZeQHPfPVPTjRx/gPTtHXKTxJ4AuSB/JusS9ZMUnzM2h2/mJ
        jUU1ZhEsrwtbxYCquL23uA8O6kg7MO9zjUO3Mt+MHj8PlR5wOtywhk/cWbMhqQqmfSrdeM
        b6E+mHNOq1ZoOupGZIJk5c+5Legb9k0=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 29, 2022 at 11:01:28AM +0200, Jacopo Mondi wrote:
> Add support for probing the main system clock using the common clock
> framework and its OF bindings.
> 
> Maintain ACPI compatibility by falling back to parse 'clock-frequency'.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 721441024598..1cc312981c82 100644
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
> @@ -2489,6 +2487,22 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_print;
>  	}
>  
> +	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
> +	if (is_of_node(dev_fwnode(&client->dev))) {
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
> +	if (input_clk != 19200000)
> +		return -EINVAL;

You could tell what that wrong frequency is. Up to you.

> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
>  

-- 
Regards,

Sakari Ailus

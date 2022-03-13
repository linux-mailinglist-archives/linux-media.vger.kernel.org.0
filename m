Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68AC4D75E2
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbiCMOel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiCMOei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:34:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C093362A0D
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 07:33:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3C14475;
        Sun, 13 Mar 2022 15:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647182009;
        bh=fVrvOK+dW/7LcD2Ukxc0fAbOw0yh/fZGW4Q1raQuR64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VO6BAWWH4po2S0dyJ4oWFoqXtQOWCgrQk+SMfbUsdYmiaCxT0ETwYAIbqyInyHDjd
         ebAyBthsfJsd+oiko6BScK7T2qtzvWjp1O3ee75jnmneUrbldLdkz1+7KZwulv3eZV
         nsJ9w/pi4daucBCyjwZ4Q8S3OtJlLZQMoJHlO4dQ=
Date:   Sun, 13 Mar 2022 16:33:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Message-ID: <Yi4AqIrOWBEY7DHU@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-3-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Mar 10, 2022 at 02:08:25PM +0100, Jacopo Mondi wrote:
> The ov5670 driver currently only supports probing using ACPI matching.
> Add support for OF and add a missing header inclusion.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 02f75c18e480..39786f3c9489 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -3,7 +3,9 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -2583,6 +2585,12 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
>  };
>  
>  MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
> +#elif defined CONFIG_OF

This should be

#ifdef CONFIG_OF
...
#endif

to support kernels compiled with both CONFIG_ACPI and CONFIG_OF.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +static const struct of_device_id ov5670_of_ids[] = {
> +	{ .compatible = "ovti,ov5670" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov5670_of_ids);
>  #endif
>  
>  static struct i2c_driver ov5670_i2c_driver = {
> @@ -2590,6 +2598,7 @@ static struct i2c_driver ov5670_i2c_driver = {
>  		.name = "ov5670",
>  		.pm = &ov5670_pm_ops,
>  		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> +		.of_match_table = of_match_ptr(ov5670_of_ids),
>  	},
>  	.probe_new = ov5670_probe,
>  	.remove = ov5670_remove,

-- 
Regards,

Laurent Pinchart

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E27F4EBA3B
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 07:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243018AbiC3FcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 01:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243010AbiC3FcJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 01:32:09 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC381D4C15
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 22:30:21 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8D72C21102;
        Wed, 30 Mar 2022 08:30:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1648618218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LtcaZUU7SwijG9iC1UFns4Hlhozkjqh5qxw0WWNTHpg=;
        b=mH9yGcWuNIJkLNwWvpBxbbnxPxvxDlkmt2eHfYtIua4AhnkOQbMc83LILsebTSenV/KeDw
        Q2SlIcTFqUlAtSJVgmeVNKyN29DEOAJOpz1GFYGFgQLl9RAPONKopcm+fQDgFByx9Q+TYM
        wMGy9Cxvlw42gkoQJ17hz9E/hYu6Z/c=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0EA44634C90;
        Wed, 30 Mar 2022 08:30:17 +0300 (EEST)
Date:   Wed, 30 Mar 2022 08:30:17 +0300
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
Subject: Re: [PATCH v3 2/8] media: i2c: ov5670: Allow probing with OF
Message-ID: <YkPq6SKx5QsEU32g@valkosipuli.retiisi.eu>
References: <20220329090133.338073-1-jacopo@jmondi.org>
 <20220329090133.338073-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329090133.338073-3-jacopo@jmondi.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1648618218; a=rsa-sha256; cv=none;
        b=vIeFxXshTi+/cw7hmEwt9b/TazGIs9okGCTKJ20CR5g7nVUq7puupOUxARjJdPN9nzVhrl
        8Do1r89iPafWNOsUsl6dLYtMNY+l/4V51OHXv0CVERoAWoJUkvT62GcJidne1GUnpPCrDT
        cTpRnFK4Lk8RV5tftVTP5z+qyuRid5g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1648618218;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LtcaZUU7SwijG9iC1UFns4Hlhozkjqh5qxw0WWNTHpg=;
        b=p8JLCSseEA7kCNHyVkqs8b7fMhDraxhoQc/pJVOxUxjN/23ZloJY4dRNYWkfUWAGht9kJn
        SdowUP8TebvoEamHJ+zuFxLZ1X4XLlU3Be4ubYpj0GLMF5fBA0KJyrRUlprItwqCBwlqUk
        TU7pb+RX3RSL/XXRbnpbL8cdSwNQV1g=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Mar 29, 2022 at 11:01:27AM +0200, Jacopo Mondi wrote:
> The ov5670 driver currently only supports probing using ACPI matching.
> Add support for OF and add a missing header inclusion.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5670.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 02f75c18e480..721441024598 100644
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
> @@ -2585,11 +2587,20 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
>  MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
>  #endif
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id ov5670_of_ids[] = {
> +	{ .compatible = "ovti,ov5670" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov5670_of_ids);
> +#endif

No need for ifdefs here.

The compatible strings are also relevant on ACPI (as alternative for _HID
and _CID).

> +
>  static struct i2c_driver ov5670_i2c_driver = {
>  	.driver = {
>  		.name = "ov5670",
>  		.pm = &ov5670_pm_ops,
>  		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> +		.of_match_table = of_match_ptr(ov5670_of_ids),

Nor of_match_ptr() here.

>  	},
>  	.probe_new = ov5670_probe,
>  	.remove = ov5670_remove,

-- 
Regards,

Sakari Ailus

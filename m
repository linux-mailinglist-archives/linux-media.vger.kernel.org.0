Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49125637535
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 10:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiKXJcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 04:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiKXJb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 04:31:59 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781C911E714;
        Thu, 24 Nov 2022 01:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669282317; x=1700818317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWlBaxQt3W9WLLicNYqXQv+njBhdZsXbYEamMElvhBg=;
  b=TrlWeY5c+Gf5vHSGEA5X/TO85o/Ic1tB/hT5OQmPv/fTCQVx4ozVB8b0
   HSiGVY96OD7chy9yBfUu4okeHL9+W2tY7heCEcKzh/Jp5E5/jfY3J8eCW
   lkg+4sKkJwBX+xopQIn0IyQ3IX7vfB5GgjSuCBLCycX/SQaK4v3Pe+bNX
   mbyrsUL8mrPW9qHX2/YKWXKW/xjn5mo2ctM5hfi9BosfY5iE/wZbUU1Cf
   6JZR2KZBhRXhMD75PsNr8w5oUWrVEpTGMWHDvYpkRo1PAUK5uqNkNVLT1
   z12UDDywuQ6u9ip6af+tDguXWxd9+V4InjHFzuMuuihJJH1B8kkj8AqAU
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27556206"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 10:31:55 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 10:31:55 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 10:31:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669282315; x=1700818315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWlBaxQt3W9WLLicNYqXQv+njBhdZsXbYEamMElvhBg=;
  b=FUo0INdzNkSLDoipxieVO3+38xrbJWWzyhpz9SQXic3zgoW4PQbpy+Fg
   EoOXtBPZDsLhRWMkrZNzQKlgBCaLUpLi9HlKk8EgDduNUe+gq58e0ozpr
   Ta/b0196tZaCywXmaQP2kQQeH+mTy7/WwkzaDc8DYb4e/l3FaUCZLv/D/
   fw55DK9VJvPq4tKFg9Qo/F2dfDEaXbKNbycM0/L2NU4XjVLN5QKAsH2pg
   SnemQDZcPNELqve/xz1hUQjMwIh/E32Sti98Z6C2fITXhHcIlJdunSsM2
   CBpNTN9+CZEyTzszSzyjGDvUtLZ/xuw7VXZeQiRA/QDP39GlC8ik4s9Qb
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27556205"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 10:31:55 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0E87A280056;
        Thu, 24 Nov 2022 10:31:55 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/2] media: i2c: ov9282: Add support for regulators.
Date:   Thu, 24 Nov 2022 10:31:53 +0100
Message-ID: <834648869.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221005152018.3783890-3-dave.stevenson@raspberrypi.com>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com> <20221005152018.3783890-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dave,

Am Mittwoch, 5. Oktober 2022, 17:20:18 CET schrieb Dave Stevenson:
> The sensor takes 3 supply rails - AVDD, DVDD, and DOVDD.
> 
> Add hooks into the regulator framework for each of these
> regulators.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2e0b315801e5..699fc5b753b4 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> 
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> @@ -55,6 +56,14 @@
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
> 
> +static const char * const ov9282_supply_names[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
> +
>  /**
>   * struct ov9282_reg - ov9282 sensor register
>   * @address: Register address
> @@ -128,6 +137,7 @@ struct ov9282 {
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
>  	struct clk *inclk;
> +	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];

Please add documentation for supplies.

>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *pclk_ctrl;
> @@ -767,6 +777,18 @@ static int ov9282_detect(struct ov9282 *ov9282)
>  	return 0;
>  }
> 
> +static int ov9282_configure_regulators(struct ov9282 *ov9282)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < OV9282_NUM_SUPPLIES; i++)
> +		ov9282->supplies[i].supply = ov9282_supply_names[i];
> +
> +	return devm_regulator_bulk_get(ov9282->dev,
> +				       OV9282_NUM_SUPPLIES,
> +				       ov9282->supplies);
> +}
> +
>  /**
>   * ov9282_parse_hw_config() - Parse HW configuration and check if supported
> * @ov9282: pointer to ov9282 device
> @@ -803,6 +825,12 @@ static int ov9282_parse_hw_config(struct ov9282
> *ov9282) return PTR_ERR(ov9282->inclk);
>  	}
> 
> +	ret = ov9282_configure_regulators(ov9282);
> +	if (ret) {
> +		dev_err(ov9282->dev, "Failed to get power regulators\n");

dev_err_probe seems sensible here.

> +		return ret;
> +	}
> +
>  	rate = clk_get_rate(ov9282->inclk);
>  	if (rate != OV9282_INCLK_RATE) {
>  		dev_err(ov9282->dev, "inclk frequency mismatch");
> @@ -874,6 +902,12 @@ static int ov9282_power_on(struct device *dev)
>  	struct ov9282 *ov9282 = to_ov9282(sd);
>  	int ret;
> 
> +	ret = regulator_bulk_enable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
>  	usleep_range(400, 600);
> 
>  	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
> @@ -891,6 +925,8 @@ static int ov9282_power_on(struct device *dev)
>  error_reset:
>  	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
> 
> +	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> +
>  	return ret;
>  }
> 
> @@ -909,6 +945,8 @@ static int ov9282_power_off(struct device *dev)
> 
>  	clk_disable_unprepare(ov9282->inclk);
> 
> +	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
> +
>  	return 0;
>  }

Despite the nits above
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>




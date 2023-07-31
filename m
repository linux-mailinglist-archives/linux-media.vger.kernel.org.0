Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E5E769695
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 14:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjGaMoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 08:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbjGaMoS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 08:44:18 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACB7E63
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 05:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690807457; x=1722343457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BN/iHHXFzSBWFMVY0gqb9fkRb/UnwoDHQZRo3hSTUBo=;
  b=g5MYPqXpV2C/I27AoUgM5NY3vU7zddPZgSEGejdO7OZommt0JCGxVC8h
   iAb9JlJdhrCkOW8bIUNj2Q1tMz82NTYue2ipnigAkLVQYg2M27GBeNoCB
   waH127blDR6DLbmllBzwhl/TeJNaS88hfJZZ7+2Itki0UPCKzN5qCbODp
   TjcnGu0VhNcBQbWhkykXRrCRPZXjmGbwJwYJ3eDvsFi9rM01/2A+Ik9qs
   mwXbYehYRWoo6c145xlJPucZUAsGUh7nU1lnJsryl4VFpnnT64srds1Dr
   eBH4CDW7JJ95r89q0HgsvvyIMeOGSmkFi8WKxVaXjyuZcsU2Cvc3szCHE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349309985"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="349309985"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="852019315"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="852019315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:44:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 022F311F863;
        Mon, 31 Jul 2023 15:44:10 +0300 (EEST)
Date:   Mon, 31 Jul 2023 12:44:09 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 14/29] media: ov2680: Add support for more clk setups
Message-ID: <ZMesmcoad6ez8kst@kekkonen.localdomain>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627131830.54601-15-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jun 27, 2023 at 03:18:15PM +0200, Hans de Goede wrote:
> On ACPI systems the following 2 scenarios are possible:
> 
> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>    is no "xvclk" for the driver to get (since it is abstracted away).
>    In this case there will be a "clock-frequency" device property
>    to tell the driver the xvclk rate.
> 
> 2. There is a xvclk modelled in the clk framework for the driver,
>    but the clk-generator may not be set to the right frequency
>    yet. In this case there will also be a "clock-frequency" device
>    property and the driver is expected to set the rate of the xvclk
>    through this frequency through the clk framework.
> 
> Handle both these scenarios by switching to devm_clk_get_optional()
> and checking for a "clock-frequency" device property.
> 
> This is modelled after how the same issue was fixed for the ov8865 in
> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
> 
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b7c23286700e..a6a83f0e53f3 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  {
>  	struct device *dev = sensor->dev;
>  	struct gpio_desc *gpio;
> +	unsigned int rate = 0;
>  	int ret;
>  
>  	/*
> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  
>  	sensor->pwdn_gpio = gpio;
>  
> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
>  	if (IS_ERR(sensor->xvclk)) {
>  		dev_err(dev, "xvclk clock missing or invalid\n");
>  		return PTR_ERR(sensor->xvclk);
>  	}
>  
> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
> +	/*
> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
> +	 * ACPI... but we also need to support the weird IPU3 case which will
> +	 * have an external clock AND a clock-frequency property. Check for the

Where does this happen? This puts the driver in an awful situation. :-(

> +	 * clock-frequency property and if found, set that rate if we managed
> +	 * to acquire a clock. This should cover the ACPI case. If the system
> +	 * uses devicetree then the configured rate should already be set, so
> +	 * we can just read it.
> +	 */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &rate);
> +	if (ret && !sensor->xvclk)
> +		return dev_err_probe(dev, ret, "invalid clock config\n");
> +
> +	if (!ret && sensor->xvclk) {
> +		ret = clk_set_rate(sensor->xvclk, rate);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set clock rate\n");
> +	}
> +
> +	sensor->xvclk_freq = rate ?: clk_get_rate(sensor->xvclk);
>  	if (sensor->xvclk_freq != OV2680_XVCLK_VALUE) {
>  		dev_err(dev, "wrong xvclk frequency %d HZ, expected: %d Hz\n",
>  			sensor->xvclk_freq, OV2680_XVCLK_VALUE);

-- 
Kind regards,

Sakari Ailus

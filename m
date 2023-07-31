Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F14C7697B4
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 15:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjGaNfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 09:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjGaNfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 09:35:20 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEAD1708
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 06:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690810519; x=1722346519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qyz8CuQxa4vZInHD+ZZ+5+G4XaWJQFwWrYbovRiP/qE=;
  b=iVug0NVoOQ8h0prSssPV2eEyvtmKSlYn7M50gPV6Hp9Y5dTu1zXsMAty
   V6tDR4i26oCI/OD4SwN2QJyqWwKg+rN1vdgZ3hG3I59ftisWAXxzCb4rj
   pUMx+oGkWit5hpFl2ESci+Oa1+Q3YjEMsrV4gDxyJMRoGzsD56Auw+sEp
   uxf4PnJ1nM0wvQeIIPjHhgR7TeUiOX0hnybio+kdte55dP5lyXhdzlOWC
   VKfEeUK5HyLrYmMWT2MQ45jIjXlsnDiLa5wC3jzpOK9HmA/1c+EWFKSz7
   l0XchPd50MIcN+H9EhVsdQfWwIQA190WXZM6ypR5siUHY9i6knPxspdT/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371728654"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371728654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 06:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871674971"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 06:35:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 82F9A11F863;
        Mon, 31 Jul 2023 16:35:14 +0300 (EEST)
Date:   Mon, 31 Jul 2023 13:35:14 +0000
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
Message-ID: <ZMe4kktsgQ7nrr+t@kekkonen.localdomain>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
 <ZMesmcoad6ez8kst@kekkonen.localdomain>
 <2593f770-dca5-c368-7776-a2b938fbd09e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2593f770-dca5-c368-7776-a2b938fbd09e@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jul 31, 2023 at 02:54:13PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 7/31/23 14:44, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Jun 27, 2023 at 03:18:15PM +0200, Hans de Goede wrote:
> >> On ACPI systems the following 2 scenarios are possible:
> >>
> >> 1. The xvclk is fully controlled by ACPI powermanagement, so there
> >>    is no "xvclk" for the driver to get (since it is abstracted away).
> >>    In this case there will be a "clock-frequency" device property
> >>    to tell the driver the xvclk rate.
> >>
> >> 2. There is a xvclk modelled in the clk framework for the driver,
> >>    but the clk-generator may not be set to the right frequency
> >>    yet. In this case there will also be a "clock-frequency" device
> >>    property and the driver is expected to set the rate of the xvclk
> >>    through this frequency through the clk framework.
> >>
> >> Handle both these scenarios by switching to devm_clk_get_optional()
> >> and checking for a "clock-frequency" device property.
> >>
> >> This is modelled after how the same issue was fixed for the ov8865 in
> >> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
> >>
> >> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
> >>  1 file changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index b7c23286700e..a6a83f0e53f3 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> >>  {
> >>  	struct device *dev = sensor->dev;
> >>  	struct gpio_desc *gpio;
> >> +	unsigned int rate = 0;
> >>  	int ret;
> >>  
> >>  	/*
> >> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> >>  
> >>  	sensor->pwdn_gpio = gpio;
> >>  
> >> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
> >> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
> >>  	if (IS_ERR(sensor->xvclk)) {
> >>  		dev_err(dev, "xvclk clock missing or invalid\n");
> >>  		return PTR_ERR(sensor->xvclk);
> >>  	}
> >>  
> >> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
> >> +	/*
> >> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
> >> +	 * ACPI... but we also need to support the weird IPU3 case which will
> >> +	 * have an external clock AND a clock-frequency property. Check for the
> > 
> > Where does this happen? This puts the driver in an awful situation. :-(
> 
> This happens on IPU3 setups where the INT3472 device represents an actual
> i2c attached sensor PMIC (rather then just some GPIOs) in this case
> there is a clk generator inside the PMIC which is used and that is programmable,
> so the driver needs to set the clk-rate.
> 
> Note this patch is pretty much a 1:1 copy of the same patch for the ov8865
> and ov7251 drivers.
> 
> I guess it might be good to start a discussion about doing this more
> elegantly but that seems out of scope for this series.

Works for me.

Do you happen to know which systems use the clock generator feature of the
PMIC?

I guess it could be as simple as putting this to tps68470 platform data for
the clock. And then hope no other PMICs will be used with this format.

-- 
Kind regards,

Sakari Ailus

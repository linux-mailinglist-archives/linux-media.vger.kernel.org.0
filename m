Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46218C98E1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfJCHRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:17:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39174 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725879AbfJCHRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 03:17:20 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 9D432634C87;
        Thu,  3 Oct 2019 10:16:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iFvLy-0002Ge-4R; Thu, 03 Oct 2019 10:16:46 +0300
Date:   Thu, 3 Oct 2019 10:16:46 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Message-ID: <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
 <20191002103715.GR896@valkosipuli.retiisi.org.uk>
 <20191003053338.GA7868@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003053338.GA7868@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Thu, Oct 03, 2019 at 11:03:38AM +0530, Manivannan Sadhasivam wrote:
....
> > > > > +static int imx290_set_gain(struct imx290 *imx290, u32 value)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	u32 adjusted_value = (value * 10) / 3;
> > > > 
> > > > What's the purpose of this? Why not to use the value directly?
> > > > 
> > > 
> > > The gain register accepts the value 10/3 of the actual gain required. Hence,
> > > we need to manually do the calculation before updating the value. I can
> > > add a comment here to clarify.
> > 
> > It's better to use the register value directly. Otherwise the granularity
> > won't be available to the user space.
> > 
> 
> The sensor datasheet clearly defines that the 10/3'rd of the expected gain
> should be set to this register. So, IMO we should be setting the value as

The unit of that gain is decibels, but the controls do not have a unit.
Register value is really preferred here.

> mentioned in the datasheet. I agree that we are missing the userspace
> granularity here but sticking to the device limitation shouldn't be a problem.
> As I said, I'll add a comment here to clarify.

The comment isn't visible in the uAPI.

> 
> > > 
> > > > > +
> > > > > +	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, adjusted_value);
> > > > > +	if (ret)
> > > > > +		dev_err(imx290->dev, "Unable to write gain\n");
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int imx290_set_power_on(struct imx290 *imx290)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = clk_prepare_enable(imx290->xclk);
> > > > 
> > > > Please move the code from this function to the runtime PM runtime suspend
> > > > callback. The same for imx290_set_power_off().
> > > > 
> > > 
> > > May I know why? I think since this is being used only once, you're suggesting
> > > to move to the callback function itself but please see the comment below. I
> > > will reuse this function to power on the device during probe.
> > 
> > Yes, you can call the same function from probe, even if it's used as a
> > runtime PM callback.
> > 
> > There's no need to have a function that acts as a wrapper for calling it
> > with a different type of an argument.
> > 
> 
> You mean directly calling imx290_runtime_resume() from probe is fine?

Yes. Feel free to call it e.g. imx290_power_on or something.

-- 
Regards,

Sakari Ailus

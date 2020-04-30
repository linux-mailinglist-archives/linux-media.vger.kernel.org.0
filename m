Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D647A1BF50F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 12:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgD3KMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 06:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726405AbgD3KMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 06:12:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6294CC035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 03:12:05 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jU6Ah-000826-Ty; Thu, 30 Apr 2020 12:11:59 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jU6Af-00047P-AG; Thu, 30 Apr 2020 12:11:57 +0200
Date:   Thu, 30 Apr 2020 12:11:57 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 2/3] media: ov8856: Add devicetree support
Message-ID: <20200430101157.GD2188@pengutronix.de>
References: <20200429162437.2025699-1-robert.foss@linaro.org>
 <20200429162437.2025699-3-robert.foss@linaro.org>
 <20200430093524.GB2188@pengutronix.de>
 <20200430094549.GF867@valkosipuli.retiisi.org.uk>
 <20200430095332.GC2188@pengutronix.de>
 <20200430095907.GG867@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430095907.GG867@valkosipuli.retiisi.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:00:34 up 68 days, 21:17, 162 users,  load average: 1.44, 7.88,
 6.50
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20-04-30 12:59, Sakari Ailus wrote:
> Hi Marco,
> 
> On Thu, Apr 30, 2020 at 11:53:32AM +0200, Marco Felsch wrote:
> > Hi Sakari,
> > 
> > On 20-04-30 12:45, Sakari Ailus wrote:
> > > Hi Marco,
> > > 
> > > On Thu, Apr 30, 2020 at 11:35:24AM +0200, Marco Felsch wrote:

...

> > > > > -	if (mclk != OV8856_MCLK) {
> > > > > -		dev_err(dev, "external clock %d is not supported", mclk);
> > > > > -		return -EINVAL;
> > > > > +	if (!is_acpi_node(fwnode)) {
> > > > > +		ov8856->xvclk = devm_clk_get(dev, "xvclk");
> > > > > +		if (IS_ERR(ov8856->xvclk)) {
> > > > > +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > > > +					ov8856->xvclk);
> > > > > +			return PTR_ERR(ov8856->xvclk);
> > > > > +		}
> > > > > +
> > > > > +		clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > > > +		xvclk_rate = clk_get_rate(ov8856->xvclk);
> > > > >  	}
> > > > 
> > > > Why do we handle the clock only in DT case? Is there a problem with the
> > > > clock handling and ACPI?
> > > 
> > > Not really, it's just that ACPI does not provide an interface to the clocks
> > > as such.
> > 
> > But you will get a clk by devm_clk_get()?
> 
> No, because ACPI does not expose one to drivers. Effectively the entire
> power sequences are implemented in ACPI, not in the driver.
> 

Ah okay, thanks for the explanation. I'm really not into the ACPI
stuff.. So this means the __power_off / power_on should only be done if
we are using DT's?

Regards,
  Marco

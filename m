Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55461BF537
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 12:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgD3KUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 06:20:31 -0400
Received: from retiisi.org.uk ([95.216.213.190]:57268 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725280AbgD3KU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 06:20:26 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8AD6A634C8F;
        Thu, 30 Apr 2020 13:20:18 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jU6Ik-0000QX-ER; Thu, 30 Apr 2020 13:20:18 +0300
Date:   Thu, 30 Apr 2020 13:20:18 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v6 2/3] media: ov8856: Add devicetree support
Message-ID: <20200430102018.GI867@valkosipuli.retiisi.org.uk>
References: <20200429162437.2025699-1-robert.foss@linaro.org>
 <20200429162437.2025699-3-robert.foss@linaro.org>
 <20200430093524.GB2188@pengutronix.de>
 <20200430094549.GF867@valkosipuli.retiisi.org.uk>
 <20200430095332.GC2188@pengutronix.de>
 <20200430095907.GG867@valkosipuli.retiisi.org.uk>
 <20200430101157.GD2188@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430101157.GD2188@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 30, 2020 at 12:11:57PM +0200, Marco Felsch wrote:
> On 20-04-30 12:59, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Thu, Apr 30, 2020 at 11:53:32AM +0200, Marco Felsch wrote:
> > > Hi Sakari,
> > > 
> > > On 20-04-30 12:45, Sakari Ailus wrote:
> > > > Hi Marco,
> > > > 
> > > > On Thu, Apr 30, 2020 at 11:35:24AM +0200, Marco Felsch wrote:
> 
> ...
> 
> > > > > > -	if (mclk != OV8856_MCLK) {
> > > > > > -		dev_err(dev, "external clock %d is not supported", mclk);
> > > > > > -		return -EINVAL;
> > > > > > +	if (!is_acpi_node(fwnode)) {
> > > > > > +		ov8856->xvclk = devm_clk_get(dev, "xvclk");
> > > > > > +		if (IS_ERR(ov8856->xvclk)) {
> > > > > > +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > > > > +					ov8856->xvclk);
> > > > > > +			return PTR_ERR(ov8856->xvclk);
> > > > > > +		}
> > > > > > +
> > > > > > +		clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > > > > +		xvclk_rate = clk_get_rate(ov8856->xvclk);
> > > > > >  	}
> > > > > 
> > > > > Why do we handle the clock only in DT case? Is there a problem with the
> > > > > clock handling and ACPI?
> > > > 
> > > > Not really, it's just that ACPI does not provide an interface to the clocks
> > > > as such.
> > > 
> > > But you will get a clk by devm_clk_get()?
> > 
> > No, because ACPI does not expose one to drivers. Effectively the entire
> > power sequences are implemented in ACPI, not in the driver.
> > 
> 
> Ah okay, thanks for the explanation. I'm really not into the ACPI
> stuff.. So this means the __power_off / power_on should only be done if
> we are using DT's?

Correct. That's why it bails out early. It could be yet earlier though,
without doing anything.

-- 
Sakari Ailus

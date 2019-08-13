Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B738B797
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbfHMLwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:52:14 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53200 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725981AbfHMLwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:52:14 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 58F8C634C89;
        Tue, 13 Aug 2019 14:52:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxVLQ-0000fI-OT; Tue, 13 Aug 2019 14:52:04 +0300
Date:   Tue, 13 Aug 2019 14:52:04 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        c.barrett@framos.com, linux-kernel@vger.kernel.org,
        a.brela@framos.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813115204.GB2527@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813113846.GG13294@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813113846.GG13294@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Russell,

On Tue, Aug 13, 2019 at 12:38:46PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > +Required Properties:
> > +- compatible: Should be "sony,imx290"
> > +- reg: I2C bus address of the device
> > +- clocks: Reference to the xclk clock.
> > +- clock-names: Should be "xclk".
> > +- clock-frequency: Frequency of the xclk clock.
> 
> Driver code:
> 
> +       ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);+       if (ret) {
> +               dev_err(dev, "Could not get xclk frequency\n");
> +               return ret;
> +       }
> +
> +       /* external clock must be 37.125 MHz */
> +       if (xclk_freq != 37125000) {
> +               dev_err(dev, "External clock frequency %u is not supported\n",
> +                       xclk_freq);
> +               return -EINVAL;
> +       }
> 
> So, only 37125000 is supported - is that not worth mentioning in this
> description?  Is this a hard requirement of the sensor?  If so, why
> does it need to be mentioned in the DT binding?

The driver only supports a particular frequency, but the sensor is not
limited to that. Unfortunately this is not uncommon for camera sensors, for
the vendors often provide register settings for a given configuration only
(external clock frequency, number of CSI-2 lanes, CSI-2 bus frequency,
image cropping, binning etc.).

That still doesn't mean there are no alternative configurations for
different external clock frequencies, or that there could not be a driver
that was able to configure the sensor to use a given frequency.

-- 
Regards,

Sakari Ailus

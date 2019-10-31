Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B48EB2AF
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 15:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbfJaO3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 10:29:11 -0400
Received: from retiisi.org.uk ([95.216.213.190]:34512 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727742AbfJaO3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 10:29:11 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id AF5C9634C87;
        Thu, 31 Oct 2019 16:28:18 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iQBQv-0001lR-Oc; Thu, 31 Oct 2019 16:28:17 +0200
Date:   Thu, 31 Oct 2019 16:28:17 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191031142817.GK6253@valkosipuli.retiisi.org.uk>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191030094902.32582-2-manivannan.sadhasivam@linaro.org>
 <20191031131538.GA9170@pendragon.ideasonboard.com>
 <20191031134512.GB24273@mani>
 <20191031141141.GD5018@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031141141.GD5018@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Oct 31, 2019 at 04:11:41PM +0200, Laurent Pinchart wrote:
> Hi Mani,
> 
> On Thu, Oct 31, 2019 at 07:15:12PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Oct 31, 2019 at 03:15:38PM +0200, Laurent Pinchart wrote:
> > > On Wed, Oct 30, 2019 at 03:19:01PM +0530, Manivannan Sadhasivam wrote:
> > >> Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > >> add MAINTAINERS entry for the binding and driver.
> > >> 
> > >> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >> ---
> > >>  .../devicetree/bindings/media/i2c/imx296.yaml | 94 +++++++++++++++++++
> > >>  MAINTAINERS                                   |  8 ++
> > >>  2 files changed, 102 insertions(+)
> > >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >> 
> > >> diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >> new file mode 100644
> > >> index 000000000000..c04ec2203268
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >> @@ -0,0 +1,94 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > >> +
> > >> +maintainers:
> > >> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >> +
> > >> +description: |-
> > >> +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > >> +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > >> +  features a global shutter with variable charge-integration time. It is
> > >> +  programmable through I2C and 4-wire interfaces. The sensor output is
> > >> +  available via CSI-2 serial data output (1 Lane).
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: sony,imx296
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  clocks:
> > >> +    maxItems: 1
> > >> +
> > >> +  clock-names:
> > >> +    description:
> > >> +      Input clock for the sensor.
> > >> +    items:
> > >> +      - const: mclk
> > > 
> > > The pin is named INCK, let's name the clock accordingly.
> > 
> > Okay, I thought generic names are preferred here!
> >  
> > >> +  clock-frequency:
> > >> +    description:
> > >> +      Frequency of the mclk clock in Hertz.
> > > 
> > > This shouldn't be needed, you can retrieve the clock frequency at
> > > runtime from the clock source.
> > 
> > Unless the clock source is a fixed one! What if the clock source comes from
> > SoC? We need to set the rate, right?
> 
> In that case, if you want to hardcode the clock in DT, the preferred way
> is to use the assigned-clock-rates property. Otherwise, if the driver
> requires a specific clock frequency, it's better to hardcode it in the
> driver itself. In this specific case, I think assigned-clock-rates is
> best as the device can support three different clock frequencies.

Just note that if ACPI support is added to the sensor driver, you'll need
the clock-frequency property again, for that's the only way how the driver
will get the clock frequency.

This is certainly not something that has to be taken into account in DT
bindings, but in any case it'll add some lines of code in the driver which
are not very useful.

-- 
Sakari Ailus

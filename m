Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00DFEEEB26
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 22:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbfKDVbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 16:31:45 -0500
Received: from retiisi.org.uk ([95.216.213.190]:35740 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728741AbfKDVbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 16:31:45 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 03C84634C87;
        Mon,  4 Nov 2019 23:30:33 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iRjvl-0002Ko-04; Mon, 04 Nov 2019 23:30:33 +0200
Date:   Mon, 4 Nov 2019 23:30:32 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191104213032.GT6253@valkosipuli.retiisi.org.uk>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191030094902.32582-2-manivannan.sadhasivam@linaro.org>
 <20191031131538.GA9170@pendragon.ideasonboard.com>
 <20191031134512.GB24273@mani>
 <20191031141141.GD5018@pendragon.ideasonboard.com>
 <20191031142817.GK6253@valkosipuli.retiisi.org.uk>
 <20191031165444.GE5018@pendragon.ideasonboard.com>
 <20191031170837.GN6253@valkosipuli.retiisi.org.uk>
 <20191104190201.GF4913@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104190201.GF4913@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Nov 04, 2019 at 09:02:01PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Oct 31, 2019 at 07:08:37PM +0200, Sakari Ailus wrote:
> > On Thu, Oct 31, 2019 at 06:54:44PM +0200, Laurent Pinchart wrote:
> > > On Thu, Oct 31, 2019 at 04:28:17PM +0200, Sakari Ailus wrote:
> > >> On Thu, Oct 31, 2019 at 04:11:41PM +0200, Laurent Pinchart wrote:
> > >>> On Thu, Oct 31, 2019 at 07:15:12PM +0530, Manivannan Sadhasivam wrote:
> > >>>> On Thu, Oct 31, 2019 at 03:15:38PM +0200, Laurent Pinchart wrote:
> > >>>>> On Wed, Oct 30, 2019 at 03:19:01PM +0530, Manivannan Sadhasivam wrote:
> > >>>>>> Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > >>>>>> add MAINTAINERS entry for the binding and driver.
> > >>>>>> 
> > >>>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >>>>>> ---
> > >>>>>>  .../devicetree/bindings/media/i2c/imx296.yaml | 94 +++++++++++++++++++
> > >>>>>>  MAINTAINERS                                   |  8 ++
> > >>>>>>  2 files changed, 102 insertions(+)
> > >>>>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >>>>>> 
> > >>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >>>>>> new file mode 100644
> > >>>>>> index 000000000000..c04ec2203268
> > >>>>>> --- /dev/null
> > >>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > >>>>>> @@ -0,0 +1,94 @@
> > >>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >>>>>> +%YAML 1.2
> > >>>>>> +---
> > >>>>>> +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > >>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>>>>> +
> > >>>>>> +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > >>>>>> +
> > >>>>>> +maintainers:
> > >>>>>> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >>>>>> +
> > >>>>>> +description: |-
> > >>>>>> +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > >>>>>> +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > >>>>>> +  features a global shutter with variable charge-integration time. It is
> > >>>>>> +  programmable through I2C and 4-wire interfaces. The sensor output is
> > >>>>>> +  available via CSI-2 serial data output (1 Lane).
> > >>>>>> +
> > >>>>>> +properties:
> > >>>>>> +  compatible:
> > >>>>>> +    const: sony,imx296
> > >>>>>> +
> > >>>>>> +  reg:
> > >>>>>> +    maxItems: 1
> > >>>>>> +
> > >>>>>> +  clocks:
> > >>>>>> +    maxItems: 1
> > >>>>>> +
> > >>>>>> +  clock-names:
> > >>>>>> +    description:
> > >>>>>> +      Input clock for the sensor.
> > >>>>>> +    items:
> > >>>>>> +      - const: mclk
> > >>>>> 
> > >>>>> The pin is named INCK, let's name the clock accordingly.
> > >>>> 
> > >>>> Okay, I thought generic names are preferred here!
> > >>>>  
> > >>>>>> +  clock-frequency:
> > >>>>>> +    description:
> > >>>>>> +      Frequency of the mclk clock in Hertz.
> > >>>>> 
> > >>>>> This shouldn't be needed, you can retrieve the clock frequency at
> > >>>>> runtime from the clock source.
> > >>>> 
> > >>>> Unless the clock source is a fixed one! What if the clock source comes from
> > >>>> SoC? We need to set the rate, right?
> > >>> 
> > >>> In that case, if you want to hardcode the clock in DT, the preferred way
> > >>> is to use the assigned-clock-rates property. Otherwise, if the driver
> > >>> requires a specific clock frequency, it's better to hardcode it in the
> > >>> driver itself. In this specific case, I think assigned-clock-rates is
> > >>> best as the device can support three different clock frequencies.
> > >> 
> > >> Just note that if ACPI support is added to the sensor driver, you'll need
> > >> the clock-frequency property again, for that's the only way how the driver
> > >> will get the clock frequency.
> > > 
> > > Why is so ? Why can't we implement of assigned-clock-rates for ACPI ?
> > 
> > ACPI doesn't deal with clocks as such. So there's also no ACPI defined way
> > to access clocks specifically, including the frequency --- instead the
> > clock is controlled by an AML methods which implement power on and off
> > sequences for the device.
> 
> It's a shortcoming of ACPI, which should be addressed at the ACPI level.
> We shouldn't polute the DT bindings with a clock-frequency property for
> this reason.

It's really not a shortcoming but a design decision: what belongs to the
scope of the firmware? And in this case system and device power management
implementation is included. I do not believe this will be revisited in any
foreseeable future, i.e. there will be no clock control interface for ACPI.

Explicitly stating the frequency also has an added benefit: the driver
can be certain that the given frequency is intended to be used on the
board. Otherwise the frequency could have been changed by e.g. another
driver. This does matter, as the frequency determines which link
frequencies can be achieved, and as the two effectively have to be
compliant, an unintended external clock frequency also means there will be
no match between possible link frequencies and configured link frequencies.

I.e. no images to capture either.

That said, I don't know if this has been a practical issue in the past.

-- 
Regards,

Sakari Ailus

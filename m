Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55128B76F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfHMLqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:46:52 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53126 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbfHMLqw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:46:52 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D8AB3634C88;
        Tue, 13 Aug 2019 14:46:43 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxVGF-0000fC-7e; Tue, 13 Aug 2019 14:46:43 +0300
Date:   Tue, 13 Aug 2019 14:46:43 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813114643.GA2527@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
 <20190813113358.GA28877@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813113358.GA28877@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Tue, Aug 13, 2019 at 05:03:58PM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> Thanks for the review!
> 
> On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > > Add devicetree binding for IMX290 CMOS image sensor.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> > >  1 file changed, 51 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > new file mode 100644
> > > index 000000000000..7535b5b5b24b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > @@ -0,0 +1,51 @@
> > > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > > +
> > > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > > +Low voltage LVDS DDR output and CSI-2 serial data output.
> > 
> > If there are three to choose from, then you should specify which one is in
> > use. Given that I think chances remain slim we'd add support for the other
> > two (it's certainly not ruled out though), CSI-2 could be the default. But
> > this needs to be documented.
> > 
> 
> Hmm... I'm not sure here. Bindings should describe the hardware and not the
> limitations of the driver. Here as you said, the sensor can output frames
> in 3 different modes/formats but the driver only supports CSI2. I can add a
> note in the driver but not sure whether dt-binding is the right place or not!

I guess alternatively you could document the necessary bindings for the
other two busses.

But what I'm saying here is that it's highly unlikely they'll be ever
needed, and it'd be mostly a waste of time to implement that. (That said, I
have nothing against the use of these busses, but I've never seen anyone
using them.) Many other devices use defaults for more contentious settings.

> 
> > > +
> > > +Required Properties:
> > > +- compatible: Should be "sony,imx290"
> > > +- reg: I2C bus address of the device
> > > +- clocks: Reference to the xclk clock.
> > > +- clock-names: Should be "xclk".
> > > +- clock-frequency: Frequency of the xclk clock.
> > 
> > ...in Hz.
> > 
> 
> Ack.
> 
> > > +- vdddo-supply: Sensor digital IO regulator.
> > > +- vdda-supply: Sensor analog regulator.
> > > +- vddd-supply: Sensor digital core regulator.
> > > +
> > > +Optional Properties:
> > > +- reset-gpios: Sensor reset GPIO
> > > +
> > > +The imx290 device node should contain one 'port' child node with
> > > +an 'endpoint' subnode. For further reading on port node refer to
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > 
> > Which other properties are relevant for the device?
> 
> Not much other than, clock/data lanes.

Please document data-lanes, and which values it may have.

> 
> > I suppose you can't change the lane order, so clock-lanes is redundant
> > (don't use it in the example) and data-lanes should be monotonically
> > incrementing series from 1 to 4.
> > 
> 
> We can change the order and the example here illustrates how it has been
> wired in FRAMOS module. If I change the lane order like you said, it won't
> work.

I highly doubt that. Neither the driver nor the sensor uses the lane
ordering information.

And even if the driver only supported four lanes, then it should check the
number of lanes is actually four.

-- 
Regards,

Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC6ADD379
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2019 00:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733018AbfJRWHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 18:07:35 -0400
Received: from retiisi.org.uk ([95.216.213.190]:56118 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732957AbfJRWHe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 18:07:34 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 103D1634C8A;
        Sat, 19 Oct 2019 01:06:57 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iLaOf-0001ge-N7; Sat, 19 Oct 2019 01:06:57 +0300
Date:   Sat, 19 Oct 2019 01:06:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191018220657.GI4735@valkosipuli.retiisi.org.uk>
References: <20191011035613.13598-1-manivannan.sadhasivam@linaro.org>
 <20191011035613.13598-2-manivannan.sadhasivam@linaro.org>
 <20191015224554.GA5634@bogus>
 <20191016083748.GA2288@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016083748.GA2288@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan, Rob,

On Wed, Oct 16, 2019 at 02:07:48PM +0530, Manivannan Sadhasivam wrote:
> Hi Rob,
> 
> On Tue, Oct 15, 2019 at 05:45:54PM -0500, Rob Herring wrote:
> > On Fri, Oct 11, 2019 at 09:26:12AM +0530, Manivannan Sadhasivam wrote:
> > > Add devicetree binding for IMX296 CMOS image sensor.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx296.txt  | 55 +++++++++++++++++++
> > >  1 file changed, 55 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.txt
> > 
> > You should know by now, use DT schema format please.
> > 
> 
> I know for other subsystems but by having a vague look at the existing bindings
> I thought media subsystem is still using .txt. But I now see few yaml bindings
> in linux-next and will switch over this.
> 
> Btw, is it mandatory now to use YAML bindings for all subsystems? I don't
> see any issue (instead I prefer) but I remember that you defer to the preference
> of the subsystem maintainers before!
> 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.txt b/Documentation/devicetree/bindings/media/i2c/imx296.txt
> > > new file mode 100644
> > > index 000000000000..25d3b15162c1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.txt
> > > @@ -0,0 +1,55 @@
> > > +* Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > > +
> > > +The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > > +sensor with square pixel array and 1.58 M effective pixels. This chip features
> > > +a global shutter with variable charge-integration time. It is programmable
> > > +through I2C and 4-wire interfaces. The sensor output is available via CSI-2
> > > +serial data output (1 Lane).
> > > +
> > > +Required Properties:
> > > +- compatible: Should be "sony,imx296"
> > > +- reg: I2C bus address of the device
> > > +- clocks: Reference to the mclk clock.
> > > +- clock-names: Should be "mclk".
> > > +- clock-frequency: Frequency of the mclk clock in Hz.
> > > +- vddo-supply: Interface power supply.
> > > +- vdda-supply: Analog power supply.
> > > +- vddd-supply: Digital power supply.
> > > +
> > > +Optional Properties:
> > > +- reset-gpios: Sensor reset GPIO
> > > +
> > > +The imx296 device node should contain one 'port' child node with
> > > +an 'endpoint' subnode. For further reading on port node refer to
> > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +
> > > +Required Properties on endpoint:
> > > +- data-lanes: check ../video-interfaces.txt
> > 
> > This should only be required when not using all the lanes on the device.
> > 
> 
> This is a bit weird! How will someone know how many lanes the device is using
> by looking at the binding? He can anyway refer the datasheet but still...

Many current bindings document data-lanes as mandatory. Nothing prevents
making all lanes are connected the default though, thus making data-lanes
optional.

The V4L2 fwnode framework supports easy parsing of that, too, by driver
providing that default value before letting V4L2 fwnode framework to parse
the endpoint properties.

Looking at this particular sensor --- doesn't it only have a single lane,
and thus nothing to configure here?

-- 
Regards,

Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 817ED8BB47
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 16:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbfHMOSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 10:18:20 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55220 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729151AbfHMOST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 10:18:19 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 5863F634C88;
        Tue, 13 Aug 2019 17:18:09 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hxXcm-0000gO-Li; Tue, 13 Aug 2019 17:18:08 +0300
Date:   Tue, 13 Aug 2019 17:18:08 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813141808.GF2527@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
 <20190813113358.GA28877@Mani-XPS-13-9360>
 <20190813114643.GA2527@valkosipuli.retiisi.org.uk>
 <20190813121400.GA29378@Mani-XPS-13-9360>
 <20190813122212.GE2527@valkosipuli.retiisi.org.uk>
 <20190813135209.GA30945@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813135209.GA30945@Mani-XPS-13-9360>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani,

On Tue, Aug 13, 2019 at 07:22:09PM +0530, Manivannan Sadhasivam wrote:
> Hi Sakari,
> 
> On Tue, Aug 13, 2019 at 03:22:12PM +0300, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > On Tue, Aug 13, 2019 at 05:44:00PM +0530, Manivannan Sadhasivam wrote:
> > > Hi Sakari,
> > > 
> > > On Tue, Aug 13, 2019 at 02:46:43PM +0300, Sakari Ailus wrote:
> > > > Hi Manivannan,
> > > > 
> > > > On Tue, Aug 13, 2019 at 05:03:58PM +0530, Manivannan Sadhasivam wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > Thanks for the review!
> > > > > 
> > > > > On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> > > > > > Hi Manivannan,
> > > > > > 
> > > > > > On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > Add devicetree binding for IMX290 CMOS image sensor.
> > > > > > > 
> > > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> > > > > > >  1 file changed, 51 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > > 
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..7535b5b5b24b
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > > @@ -0,0 +1,51 @@
> > > > > > > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > > > > > > +
> > > > > > > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > > > > > > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > > > > > > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > > > > > > +Low voltage LVDS DDR output and CSI-2 serial data output.
> > > > > > 
> > > > > > If there are three to choose from, then you should specify which one is in
> > > > > > use. Given that I think chances remain slim we'd add support for the other
> > > > > > two (it's certainly not ruled out though), CSI-2 could be the default. But
> > > > > > this needs to be documented.
> > > > > > 
> > > > > 
> > > > > Hmm... I'm not sure here. Bindings should describe the hardware and not the
> > > > > limitations of the driver. Here as you said, the sensor can output frames
> > > > > in 3 different modes/formats but the driver only supports CSI2. I can add a
> > > > > note in the driver but not sure whether dt-binding is the right place or not!
> > > > 
> > > > I guess alternatively you could document the necessary bindings for the
> > > > other two busses.
> > > > 
> > > > But what I'm saying here is that it's highly unlikely they'll be ever
> > > > needed, and it'd be mostly a waste of time to implement that. (That said, I
> > > > have nothing against the use of these busses, but I've never seen anyone
> > > > using them.) Many other devices use defaults for more contentious settings.
> > > > 
> > > 
> > > Agree with you but my question was, whether I could document the supported
> > > mode in bindings or not! I have seen comments from Rob in the past that the
> > > binding should not document the limitations of the driver. But anyway, one
> > > can infer from the current binding that only CSI2 is supported for now, it's
> > > just stating it explicitly makes me doubtful!
> > 
> > I think it could be e.g.:
> > 
> > The CSI-2 bus is the default. No bindings have been defined for the other
> > busses.
> > 
> 
> Ack.
> 
> > ...
> > 
> > > > > > I suppose you can't change the lane order, so clock-lanes is redundant
> > > > > > (don't use it in the example) and data-lanes should be monotonically
> > > > > > incrementing series from 1 to 4.
> > > > > > 
> > > > > 
> > > > > We can change the order and the example here illustrates how it has been
> > > > > wired in FRAMOS module. If I change the lane order like you said, it won't
> > > > > work.
> > > > 
> > > > I highly doubt that. Neither the driver nor the sensor uses the lane
> > > > ordering information.
> > > > 
> > > 
> > > Agree but CSI2 host will need this informtion, right? Please correct me if
> > > I'm wrong!
> > 
> > The CSI-2 receiver may need that configuration, but it's not addressed by a
> > sensor's binding documentation (it's configured in the endpoint on the
> > receiver's side).
> > 
> 
> Yes but I thought that documenting the sensor lane configuration based on one
> example implementation might help interfacing w/ different hosts. Anyway, to be
> host agnostic, I can drop the clock lane and make data lane start from 1 as you
> suggested.

You could well have a different configuration from the default in an
example. But my point is that this is simply the wrong place for
configuring the lane mapping on the host.

-- 
Sakari Ailus

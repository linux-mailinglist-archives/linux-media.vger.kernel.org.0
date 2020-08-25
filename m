Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8ED251C07
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 17:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgHYPSD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 25 Aug 2020 11:18:03 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51857 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgHYPRf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 11:17:35 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E216C20003;
        Tue, 25 Aug 2020 15:17:01 +0000 (UTC)
Date:   Tue, 25 Aug 2020 17:17:01 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/7] dt-bindings: media: i2c: Add documentation for
 ov8865
Message-ID: <20200825171701.158c77c6@lhopital-XPS-13-9360>
In-Reply-To: <20200824165910.tnsalyxfuimfx5rd@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200821145935.20346-3-kevin.lhopital@bootlin.com>
        <20200824165910.tnsalyxfuimfx5rd@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Le Mon, 24 Aug 2020 18:59:10 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> Hi,
> 
> On Fri, Aug 21, 2020 at 04:59:30PM +0200, Kévin L'hôpital wrote:
> > Add a documentation for the sensor ov8865 from Omnivision.
> > 
> > Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>  
> 
> In order to ease the submission of both drivers, you should probably
> split this series into two, one with the MIPI-CSI driver, and one with
> the ov8865 driver.
> 

Yes, you are right. I will do this.

> > ---
> >  .../devicetree/bindings/media/i2c/ov8865.txt  | 51
> > +++++++++++++++++++ 1 file changed, 51 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/ov8865.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8865.txt
> > b/Documentation/devicetree/bindings/media/i2c/ov8865.txt new file
> > mode 100644 index 000000000000..ac5a662288de
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8865.txt
> > @@ -0,0 +1,51 @@
> > +* Omnivision OV8865 MIPI CSI-2
> > +
> > +Required Properties:
> > +- compatible: should be "ovti,ov8865"
> > +- clocks: reference to the xclk input clock.
> > +- clock-names: should be "xclk".
> > +- DOVDD-supply: Digital I/O voltage supply, 2.8 volts
> > +- AVDD-supply: Analog voltage supply, 2.8 volts
> > +- AFVDD-supply: Analog voltage supply, 2.8 volts
> > +- DVDD-supply: Digital core voltage supply, 1.2 volts
> > +- reset-gpios: reference to the GPIO connected to the reset pin.
> > +	       This is an active low signal to the OV8865.
> > +- powerdown-gpios: reference to the GPIO connected to the
> > powerdown pin.
> > +		   This is an active low signal to the OV8865.
> > +- rotation: as defined in
> > +
> > Documentation/devicetree/bindings/media/video-interfaces.txt,
> > +	    valid values are 0 (sensor mounted upright) and 180
> > (sensor
> > +	    mounted upside down).
> > +- remote-endpoint: a phandle to the bus receiver's endpoint node.
> > +- clock-lanes: should be set to <0> (clock lane on hardware lane
> > 0). +- data-lanes: should be set to <4> (four CSI-2 lanes
> > supported). +
> > +The device node must contain one 'port' child node for its digital
> > output video +port, in accordance with the video interface bindings
> > defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.  
> 
> Free form DT documentation is deprecated nowadays, you should be
> doing a YAML schema instead (like the ov8856 driver).
> 

All right, I will do a YAML schema.

> Maxime

Thank you very much for the review.
Kévin


-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

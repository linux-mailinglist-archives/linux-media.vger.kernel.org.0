Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3414C8B320
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 10:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfHMI4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 04:56:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44293 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfHMI4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 04:56:13 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hxSbA-0000Vw-3g; Tue, 13 Aug 2019 10:56:08 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hxSb8-0005dI-UO; Tue, 13 Aug 2019 10:56:06 +0200
Date:   Tue, 13 Aug 2019 10:56:06 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 06/13] media: dt-bindings: tvp5150: Add input port
 connectors DT bindings
Message-ID: <20190813085606.hddsu4qjnju23kl4@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-7-m.felsch@pengutronix.de>
 <20190516180557.GR14820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516180557.GR14820@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:55:29 up 87 days, 15:13, 57 users,  load average: 0.50, 0.15,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 19-05-16 21:05, Laurent Pinchart wrote:
> Hi Marco,
> 
> Thank you for the patch.
> 
> On Mon, Apr 15, 2019 at 02:44:06PM +0200, Marco Felsch wrote:
> > The TVP5150/1 decoders support different video input sources to their
> > AIP1A/B pins.
> > 
> > Possible configurations are as follows:
> >   - Analog Composite signal connected to AIP1A.
> >   - Analog Composite signal connected to AIP1B.
> >   - Analog S-Video Y (luminance) and C (chrominance)
> >     signals connected to AIP1A and AIP1B respectively.
> > 
> > This patch extends the device tree bindings documentation to describe
> > how the input connectors for these devices should be defined in a DT.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > Changelog:
> > 
> > v3:
> > - remove examples for one and two inputs
> > - replace space by tabs
> > 
> > v2:
> > - adapt port layout in accordance with
> >   https://www.spinics.net/lists/linux-media/msg138546.html with the
> >   svideo-connector deviation (use only one endpoint)
> 
> As far as I understand the above link, you need two endpoints.
> 
> tvp-5150 port@0 (AIP1A)
> 	endpoint@0 -----------> Comp0-Con  port
> 	endpoint@1 -----+-----> Svideo-Con port
> tvp-5150 port@1	(AIP1B) |
> 	endpoint@1 -----+
> 	endpoint@0 -----------> Comp1-Con  port
> tvp-5150 port@2
> 	endpoint (video bitstream output at YOUT[0-7] parallel bus)
> 
> The configuration below isn't accepted.

You're right. I changed that.

> 
> >  .../devicetree/bindings/media/i2c/tvp5150.txt | 92 +++++++++++++++++--
> >  1 file changed, 85 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> > index 8c0fc1a26bf0..bdd273d8b44d 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> > @@ -12,11 +12,31 @@ Optional Properties:
> >  - pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
> >  - reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
> >  
> > -The device node must contain one 'port' child node for its digital output
> > -video port, in accordance with the video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +The device node must contain one 'port' child node per device physical input
> > +and output port, in accordance with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> > +are numbered as follows
> >  
> > -Required Endpoint Properties for parallel synchronization:
> > +	  Name		Type		Port
> > +	--------------------------------------
> > +	  AIP1A		sink		0
> > +	  AIP1B		sink		1
> > +	  Y-OUT		src		2
> > +
> > +The device node must contain at least one sink port and the src port. Each input
> > +port must be linked to an endpoint defined in
> > +Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
> > +port/connector layout is as follows
> > +
> > +tvp-5150 port@0 (AIP1A)
> > +	endpoint@0 -----------> Comp0-Con  port
> > +	endpoint@1 -----------> Svideo-Con port
> > +tvp-5150 port@1 (AIP1B)
> > +	endpoint   -----------> Comp1-Con  port
> > +tvp-5150 port@2
> > +	endpoint (video bitstream output at YOUT[0-7] parallel bus)
> > +
> > +Required Endpoint Properties for parallel synchronization on output port:
> >  
> >  - hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
> >  - vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
> > @@ -26,17 +46,75 @@ Required Endpoint Properties for parallel synchronization:
> >  If none of hsync-active, vsync-active and field-even-active is specified,
> >  the endpoint is assumed to use embedded BT.656 synchronization.
> >  
> > -Example:
> > +Example - three input sources:
> > +
> > +comp_connector_0 {
> > +	compatible = "composite-video-connector";
> > +	label = "Composite0";
> > +
> > +	port {
> > +		composite0_to_tvp5150: endpoint {
> > +			remote-endpoint = <&tvp5150_to_composite0>;
> > +		};
> > +	};
> > +};
> > +
> > +comp_connector_1 {
> > +	compatible = "composite-video-connector";
> > +	label = "Composite1";
> > +
> > +	port {
> > +		composite1_to_tvp5150: endpoint {
> > +			remote-endpoint = <&tvp5150_to_composite1>;
> > +		};
> > +	};
> > +};
> > +
> > +svid_connector {
> > +	compatible = "svideo-connector";
> > +	label = "S-Video";
> > +
> > +	port {
> > +		svideo_to_tvp5150: endpoint {
> > +			remote-endpoint = <&tvp5150_to_svideo>;
> > +		};
> > +	};
> > +};
> >  
> >  &i2c2 {
> > -	...
> >  	tvp5150@5c {
> >  		compatible = "ti,tvp5150";
> >  		reg = <0x5c>;
> >  		pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
> >  		reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
> >  
> > -		port {
> > +		port@0 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <0>;
> > +
> > +			tvp5150_to_composite0: endpoint@0 {
> > +				reg = <0>;
> > +				remote-endpoint = <&composite0_to_tvp5150>;
> > +			};
> > +
> > +			tvp5150_to_svideo: endpoint@1 {
> > +				reg = <1>;
> > +				remote-endpoint = <&svideo_to_tvp5150>;
> > +			};
> > +		};
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +
> > +			tvp5150_to_composite1: endpoint {
> > +                                remote-endpoint = <&composite1_to_tvp5150>;
> > +			};
> > +		};
> > +
> > +		port@2 {
> > +			reg = <2>;
> > +
> >  			tvp5150_1: endpoint {
> >  				remote-endpoint = <&ccdc_ep>;
> >  			};
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

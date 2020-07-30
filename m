Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88418233704
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgG3Qo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgG3Qo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:44:58 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D32C061574;
        Thu, 30 Jul 2020 09:44:58 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 728A7634C89;
        Thu, 30 Jul 2020 19:43:59 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k1Bex-0001W8-8X; Thu, 30 Jul 2020 19:43:59 +0300
Date:   Thu, 30 Jul 2020 19:43:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 08/13] dt-bindings: media: ov5640: Remove data-shift
Message-ID: <20200730164359.GB5201@valkosipuli.retiisi.org.uk>
References: <20200717132859.237120-9-jacopo+renesas@jmondi.org>
 <20200717205722.GJ5961@pendragon.ideasonboard.com>
 <20200723222259.GB829@valkosipuli.retiisi.org.uk>
 <20200723231549.GE21353@pendragon.ideasonboard.com>
 <20200725211833.GE829@valkosipuli.retiisi.org.uk>
 <20200725213125.GE6253@pendragon.ideasonboard.com>
 <20200729142936.GF829@valkosipuli.retiisi.org.uk>
 <20200729144608.GF6183@pendragon.ideasonboard.com>
 <20200730162219.GA5201@valkosipuli.retiisi.org.uk>
 <20200730163211.GB6107@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730163211.GB6107@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jul 30, 2020 at 07:32:11PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jul 30, 2020 at 07:22:19PM +0300, Sakari Ailus wrote:
> > On Wed, Jul 29, 2020 at 05:46:08PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 29, 2020 at 05:29:36PM +0300, Sakari Ailus wrote:
> > > > On Sun, Jul 26, 2020 at 12:31:25AM +0300, Laurent Pinchart wrote:
> > > > > On Sun, Jul 26, 2020 at 12:18:33AM +0300, Sakari Ailus wrote:
> > > > > > On Fri, Jul 24, 2020 at 02:15:49AM +0300, Laurent Pinchart wrote:
> > > > > > > On Fri, Jul 24, 2020 at 01:22:59AM +0300, Sakari Ailus wrote:
> > > > > > > > On Fri, Jul 17, 2020 at 11:57:22PM +0300, Laurent Pinchart wrote:
> > > > > > > > > Hi Jacopo,
> > > > > > > > > 
> > > > > > > > > (CC'ing Sakari)
> > > > > > > > > 
> > > > > > > > > Thank you for the patch.
> > > > > > > > > 
> > > > > > > > > On Fri, Jul 17, 2020 at 03:28:54PM +0200, Jacopo Mondi wrote:
> > > > > > > > > > The value of the data-shift property solely depend on the selected
> > > > > > > > > > bus width and it's not freely configurable.
> > > > > > > > > > 
> > > > > > > > > > Remove it from the bindings document and update its users accordingly.
> > > > > > > > > 
> > > > > > > > > Hmmmm that's an interesting one. Sakari, what do you think ?
> > > > > > > > > 
> > > > > > > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > > > > > > ---
> > > > > > > > > >  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
> > > > > > > > > >  arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
> > > > > > > > > >  2 files changed, 10 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > > > > > > index 5e1662e848bd..ab700a1830aa 100644
> > > > > > > > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > > > > > > > > > @@ -92,12 +92,6 @@ properties:
> > > > > > > > > >                parallel bus.
> > > > > > > > > >              enum: [8, 10]
> > > > > > > > > > 
> > > > > > > > > > -          data-shift:
> > > > > > > > > > -            description: |
> > > > > > > > > > -              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> > > > > > > > > > -              <0> for 10 bits parallel bus.
> > > > > > > > > > -            enum: [0, 2]
> > > > > > > > > 
> > > > > > > > > Should you document in the description of bus-width that data-shift is
> > > > > > > > > implied ?
> > > > > > > > 
> > > > > > > > The purpose of the datas-shift property is to convey how the parallel bus
> > > > > > > > lines are connected for a given bus width for devices where it is
> > > > > > > > configurable. As this device does not not support that, then indeed this
> > > > > > > > property is not relevant for the device IMO.
> > > > > > > 
> > > > > > > Could you elaborate on this ? I believe the case that Jacopo is
> > > > > > > describing connects D[9:2] from the sensor to D[7:0] of the receiver
> > > > > > > (Jacopo, could you confirm ?). Isn't that what data-shift is for ?
> > > > > > 
> > > > > > Yes, it is. But in this case what data-shift configures is not configurable
> > > > > > as such but defined by another configuration, making the data-shift
> > > > > > property redundant. We generally haven't documented redundant things in DT
> > > > > > bindings --- for instance data-lanes is documented in bindings only if it
> > > > > > is configurable.
> > > > > 
> > > > > Then I think we share the same understanding. I believe the
> > > > > documentation in video-interfaces.txt needs to be expanded, as it's
> > > > > quite terse and not very clear.
> > > > 
> > > > The DT spec states that:
> > > > 
> > > > 	A DTSpec-compliant devicetree describes device information in a
> > > > 	system that cannot necessarily be dynamically detected by a client
> > > > 	program. For example, the architecture of PCI enables a client to
> > > > 	probe and detect attached devices, and thus devicetree nodes
> > > > 	describing PCI devices might not be required. However, a device
> > > > 	node is required to describe a PCI host bridge device in the system
> > > > 	if it cannot be detected by probing.
> > > > 
> > > > I'd read that as there's no need to specify properties that do not provide
> > > > additional information to software.
> > > 
> > > That's a bit of a stretch interpretation :-)
> > > 
> > > > As some properties are dependent on
> > > > others and and this depends on hardware features, I don't think we can in
> > > > general case take this account in generic binding documentation, but device
> > > > specific ones.
> > > > 
> > > > Of course we could add this to data-shift documentation, but then I wonder
> > > > how many other similar cases there are where in hardware the configuration
> > > > defined by one property determines the value of another?
> > > 
> > > I was mostly thinking about documenting *how* data-shift interacts with
> > > bus-width. I think that specifying the default data-shift value based on
> > > the bus-width value, for the case where data-shift is not specified,
> > > would also make sense.
> > 
> > Do you mean in device binding documentation or in generic documentation?
> > Device bindings should have this information, yes.
> 
> I mean in video-interfaces.txt (which should become
> video-interfaces.yaml :-)) for the general rules, and in specific
> bindings for any device-specific rule.

Please send a patch. :-)

> 
> We will likely need a runtime API too, it's entirely conceivable that a
> 10-bit parallel sensor, which D[9:0] signals, could use either D[9:2] or
> D[7:0] when configured to transmit 10-bit data. This isn't something
> that can be encoded in DT. It's a separate topic though.

You can set defaults in the current API but those defaults are basically a
C struct. I don't think we should be looking into making those defaults
depend on property values, unless there's a clear reason to do so --- and
in this case there isn't one.

-- 
Kind regards,

Sakari Ailus

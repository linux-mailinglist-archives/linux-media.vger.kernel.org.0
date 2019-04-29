Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22BE0E801
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 18:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfD2Qok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 12:44:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36079 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728681AbfD2Qok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 12:44:40 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hL9OJ-0004ea-Em; Mon, 29 Apr 2019 18:44:31 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hL9OG-0006mR-0q; Mon, 29 Apr 2019 18:44:28 +0200
Date:   Mon, 29 Apr 2019 18:44:28 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        Ian Arkver <ian.arkver.dev@gmail.com>, hans.verkuil@cisco.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        mchehab@kernel.org, graphics@pengutronix.de,
        linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
Message-ID: <20190429164427.naz6fqbbnqi5gqum@pengutronix.de>
References: <20190218100333.qvptfllrd4pyhsyb@paasikivi.fi.intel.com>
 <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
 <a51ecc47-df19-a48b-3d82-01b21d03972c@gmail.com>
 <20190301130118.jy57g5wcsn7mqclk@pengutronix.de>
 <20190304123621.l3ocvdiya5z5wzal@paasikivi.fi.intel.com>
 <20190304165528.n4sqxjhfsplmt5km@pengutronix.de>
 <20190304181747.ax7nvbvhdul4vtna@kekkonen.localdomain>
 <20190305084902.vzaqr53q77oy2o7r@uno.localdomain>
 <20190305181419.kqdaqnjte3v7663f@pengutronix.de>
 <20190416104550.htexnpzgypuuubo4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416104550.htexnpzgypuuubo4@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 18:41:26 up 100 days, 21:23, 80 users,  load average: 0.21, 0.08,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

sorry instead of adding you to To you was on Cc.
Do you have any preferences about the below discussion?

Regards,
  Marco

On 19-04-16 12:45, Marco Felsch wrote:
> Hi Rob,
> 
> gentle ping.
> 
> Regards,
>   Marco
> 
> On 19-03-05 19:14, Marco Felsch wrote:
> > Hi Rob,
> > 
> > I think you didn't followed the discussion in detail so I will ask you
> > personal. In short the tc358746 can act as parallel-in -> csi-out or as
> > csi->in -> parallel-out device. The phyiscal pins are always the same
> > only the internal timings are different. So we have two ports with two
> > endpoints.
> > 
> > Now the question is how we determine the mode. We have two approaches:
> > 1)
> >   port@0 -> input port
> >   port@1 -> output port
> > 
> >   pro:
> >   + no extra vendor specific binding is needed to determine the mode
> > 
> >   con:
> >   - input/output endpoint can be parallel or mipi-csi2.
> > 
> > 2)
> >   port@0 -> parallel port
> >   port@1 -> mipi-csi2 port
> > 
> >   pro:
> >   + input/output endpoint are fixed to parallel or mipi
> > 
> >   con:
> >   - vendor specific binding is needed to determine the mode
> > 
> > Thanks for your comments :)
> > 
> > Regards,
> > Marco
> > 
> > On 19-03-05 09:49, Jacopo Mondi wrote:
> > > Hi Sakari, Marco,
> > > 
> > > On Mon, Mar 04, 2019 at 08:17:48PM +0200, Sakari Ailus wrote:
> > > > Hi Marco,
> > > >
> > > > On Mon, Mar 04, 2019 at 05:55:28PM +0100, Marco Felsch wrote:
> > > > > > > (more device specific)
> > > > > > > tc358746,default-mode = <CSI-Tx> /* Parallel-in -> CSI-out */
> > > > > > > tc358746,default-mode = <CSI-Rx> /* CSI-in -> Parallel-out */
> > > > > > >
> > > > > > > or
> > > > > > >
> > > > > > > (more generic)
> > > > > > > tc358746,default-dir = <PARALLEL_TO_CSI2>
> > > > > > > tc358746,default-dir = <CSI2_TO_PARALLEL>
> > > > > >
> > > > > > The prefix for Toshiba is "toshiba". What would you think of
> > > > > > "toshiba,csi2-direction" with values of either "rx" or "tx"? Or
> > > > > > "toshiba,csi2-mode" with either "master" or "slave", which would be a
> > > > > > little bit more generic, but could be slightly more probable to get wrong
> > > > > > as well.
> > > > >
> > > > > You're right mixed the prefix with the device.. If we need to introduce
> > > > > a property I would prefer the "toshiba,csi2-direction" one. I said if
> > > > > because as Jacopo mentioned we can avoid the property by define port@0
> > > > > as input and port@1 as output. I tink that's the best solution, since we
> > > > > can avoid device specific bindings and it's common to use the last port
> > > > > as output (e.g. video-mux).
> > > >
> > > > The ports represent hardware and I think I would avoid reordering them. I
> > > > wonder what would the DT folks prefer.
> > > >
> > > 
> > > I might have missed why you mention re-ordering? :)
> > > 
> > > > The device specific property is to the point at least: it describes an
> > > > orthogonal part of the device configuration. That's why I'd pick that if I
> > > > were to choose. But I'll let Rob to comment on this.
> > > 
> > > That's true indeed. Let's wait for inputs from DT people, I'm fine
> > > with both approaches.
> > > 
> > > Thanks
> > >    j
> > > 
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Sakari Ailus
> > > > sakari.ailus@linux.intel.com
> > 
> > 
> > 
> > -- 
> > Pengutronix e.K.                           |                             |
> > Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

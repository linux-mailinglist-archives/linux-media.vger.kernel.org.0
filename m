Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3240D8EC51
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbfHONEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:04:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34699 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732036AbfHONEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:04:45 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyFQk-0004Vh-4M; Thu, 15 Aug 2019 15:04:38 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyFQj-0002rp-Hv; Thu, 15 Aug 2019 15:04:37 +0200
Date:   Thu, 15 Aug 2019 15:04:37 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190815130437.fmmq6a7aw4fauqkh@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-3-m.felsch@pengutronix.de>
 <20190516163632.GO14820@pendragon.ideasonboard.com>
 <20190809075536.pukp444dmb7haoxj@pengutronix.de>
 <20190815123810.GC13823@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815123810.GC13823@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:51:02 up 89 days, 19:09, 59 users,  load average: 0.08, 0.05,
 0.01
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

On 19-08-15 15:38, Laurent Pinchart wrote:
> Hi Marco,
> 
> On Fri, Aug 09, 2019 at 09:55:36AM +0200, Marco Felsch wrote:
> > On 19-05-16 19:36, Laurent Pinchart wrote:
> > > On Mon, Apr 15, 2019 at 02:44:02PM +0200, Marco Felsch wrote:
> > > > Currently every driver needs to parse the connector endpoints by it self.
> > > 
> > > s/it self/itself/
> > > 
> > > > This is the initial work to make this generic. The generic connector has
> > > > some common fields and some connector specific parts. The generic one
> > > > includes:
> > > >   - type
> > > >   - label
> > > >   - remote_port (the port where the connector is connected to)
> > > >   - remote_id   (the endpoint where the connector is connected to)
> > > 
> > > This assumes a single connection between a connector and a remote port,
> > > and a single port on the connector side. Is this guaranteed ? For the
> > > mini-DIN-4 connectors (often used for S-Video) for instance, I recall
> > > from the extensive discussions we had in the past that they should be
> > > modeled with two pins, one for the Y component and one for C components.
> > > The rationale for this is to support systems where such a connector
> > > could be used to carry S-Video, but also two composite video signals
> > > (usually through an external adapter from 2 RCA female connectors to one
> > > S-Video male connector) that would be routed to two separate video
> > > decoders (or two different inputs of the same video decoder). Other
> > > topologies may be possible too.
> > 
> > I got your concerns and I also remember the tvp5150 port bindings
> > myself in the past. Do you know how often such a setup you described
> > above happens these days? I would rather add more documentation to the
> > bindings [1] and add a check to v4l2_fwnode_parse_connector() to
> > guarantee that one port has only one endpoint. Because I don't think
> > that analog connectors has a bright future these days.
> > 
> > [1] Documentation/devicetree/bindings/display/connector/ \
> >     analog-tv-connector.txt
> 
> I have seen it on older hardware, I don't know about more recent
> systems. For the S-Video case at least, you need to support two DT
> ports, even if you don't support connecting them to two different
> devices yet.

Can you take a look on the v7 I send a few minutes ago? I changed the
layout ;)

> In any case, I'm fine if those topologies are not supported yet, but it
> should be possible to support them in a backward-compatible way. In
> particular, in this case, we should make sure the DT bindings will allow
> such topologies, and the DT parsing API should make it possible to
> support them without fugure changes to drivers that use the API from
> this patch for "simple" topologies.

You're right. I adapted the struct to be more extendible.

Regards,
  Marco

> 
> > > > The specific fields are within a union, since only one of them can be
> > > > available at the time. Since this is the initial support the patch adds
> > > > only the analog-connector specific ones.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > > [1] https://patchwork.kernel.org/cover/10794703/
> > > > 
> > > > v6:
> > > > - fix some spelling and style issues
> > > > - rm unnecessary comments
> > > > - drop vga and dvi connector
> > > > 
> > > > v2-v4:
> > > > - nothing since the patch was squashed from series [1] into this
> > > >   series.
> > > > 
> > > >  include/media/v4l2-connector.h | 30 ++++++++++++++++++++++++++++++
> > > >  include/media/v4l2-fwnode.h    | 33 +++++++++++++++++++++++++++++++++
> > > >  2 files changed, 63 insertions(+)
> > > >  create mode 100644 include/media/v4l2-connector.h
> > > > 
> > > > diff --git a/include/media/v4l2-connector.h b/include/media/v4l2-connector.h
> > > > new file mode 100644
> > > > index 000000000000..3a951c54f50e
> > > > --- /dev/null
> > > > +++ b/include/media/v4l2-connector.h
> > > > @@ -0,0 +1,30 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * v4l2-connector.h
> > > > + *
> > > > + * V4L2 connector types.
> > > > + *
> > > > + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > > + */
> > > > +
> > > > +#ifndef V4L2_CONNECTOR_H
> > > > +#define V4L2_CONNECTOR_H
> > > > +
> > > > +#define V4L2_CONNECTOR_MAX_LABEL 41
> > > 
> > > Hans pointed out this was a weird number. Should you turn the label
> > > field into a pointer to make this more generic (with a
> > > v4l2_fwnode_connector_cleanup() function then) ?
> > 
> > Yes, that would be the better approach. I will change that.
> > 
> > > > +
> > > > +/**
> > > > + * enum v4l2_connector_type - connector type
> > > > + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration
> > > > + * @V4L2_CON_COMPOSITE: analog composite connector
> > > > + * @V4L2_CON_SVIDEO:    analog svideo connector
> > > > + * @V4L2_CON_HDMI:      digital hdmi connector
> > > > + */
> > > > +enum v4l2_connector_type {
> > > > +	V4L2_CON_UNKNOWN,
> > > > +	V4L2_CON_COMPOSITE,
> > > > +	V4L2_CON_SVIDEO,
> > > > +	V4L2_CON_HDMI,
> > > > +};
> > > > +
> > > > +#endif /* V4L2_CONNECTOR_H */
> > > > +
> > > > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > > > index 6c07825e18b9..f4df1b95c5ef 100644
> > > > --- a/include/media/v4l2-fwnode.h
> > > > +++ b/include/media/v4l2-fwnode.h
> > > > @@ -22,6 +22,7 @@
> > > >  #include <linux/list.h>
> > > >  #include <linux/types.h>
> > > >  
> > > > +#include <media/v4l2-connector.h>
> > > >  #include <media/v4l2-mediabus.h>
> > > >  #include <media/v4l2-subdev.h>
> > > >  
> > > > @@ -126,6 +127,38 @@ struct v4l2_fwnode_link {
> > > >  	unsigned int remote_port;
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct v4l2_fwnode_connector_analog - analog connector data structure
> > > > + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> > > > + *                     if no restrictions are specified.
> > > > + */
> > > > +struct v4l2_fwnode_connector_analog {
> > > > +	v4l2_std_id supported_tvnorms;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct v4l2_fwnode_connector - the connector data structure
> > > > + * @remote_port: identifier of the remote endpoint port the connector connects
> > > > + *		 to
> > > > + * @remote_id: identifier of the remote endpoint the connector connects to
> > > > + * @label: connetor label
> > > > + * @type: connector type
> > > > + * @connector: connector configuration
> > > > + * @connector.analog: analog connector configuration
> > > > + *                    &struct v4l2_fwnode_connector_analog
> > > > + */
> > > > +struct v4l2_fwnode_connector {
> > > > +	unsigned int remote_port;
> > > > +	unsigned int remote_id;
> > > > +	char label[V4L2_CONNECTOR_MAX_LABEL];
> > > > +	enum v4l2_connector_type type;
> > > > +
> > > > +	union {
> > > > +		struct v4l2_fwnode_connector_analog analog;
> > > > +		/* future connectors */
> > > > +	} connector;
> > > > +};
> > > > +
> > > >  /**
> > > >   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
> > > >   * @fwnode: pointer to the endpoint's fwnode handle
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

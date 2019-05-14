Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBD1CEE5
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 20:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfENSRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 14:17:48 -0400
Received: from casper.infradead.org ([85.118.1.10]:48620 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfENSRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 14:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d5oCW7u5tSYDL5M32/knT8cVQm6uHXOniLjaK5gB9lk=; b=HIqsdIgF8p/icyYPPuta7NXVyo
        Rv9YUMK4P6htpUQoNX/ntTta+p/bYY2AXEEGHj9euwiwDS0iB4HQTsIk2we5L4WCj+ePoYpR5WANV
        qQwUyM2Q72ZOPxsK33XegXYFqQlNF6nbVR+hn+zfy1JXUixzIyBfy8XlOzBjiJUqsBRalFBfuPs3u
        USmxt3mdPbvelQCe+QL9CjjVLW1x5Xr69xqGbEnjYRDwB7sOoDW9EgQNH9wNcUG2zBM9GhPDeXUY0
        3fC1MsEyIKNKmmd9EPE2l5L8wqHuRCv1GZ35K9vLKt5fBj5vViCqHqg4uoWXuzaoQYJkxWkJeMAcj
        lJYQI+CQ==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQbzf-0003eD-2v; Tue, 14 May 2019 18:17:39 +0000
Date:   Tue, 14 May 2019 15:17:33 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 02/13] media: v4l2-fwnode: add v4l2_fwnode_connector
Message-ID: <20190514151733.21acb051@coco.lan>
In-Reply-To: <c5c4b88d-7977-e253-1242-b9a86228a302@xs4all.nl>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190415124413.18456-3-m.felsch@pengutronix.de>
        <c5c4b88d-7977-e253-1242-b9a86228a302@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 6 May 2019 11:50:20 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 4/15/19 2:44 PM, Marco Felsch wrote:
> > Currently every driver needs to parse the connector endpoints by it self.
> > This is the initial work to make this generic. The generic connector has
> > some common fields and some connector specific parts. The generic one
> > includes:
> >   - type
> >   - label
> >   - remote_port (the port where the connector is connected to)
> >   - remote_id   (the endpoint where the connector is connected to)
> > 
> > The specific fields are within a union, since only one of them can be
> > available at the time. Since this is the initial support the patch adds
> > only the analog-connector specific ones.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> > [1] https://patchwork.kernel.org/cover/10794703/
> > 
> > v6:
> > - fix some spelling and style issues
> > - rm unnecessary comments
> > - drop vga and dvi connector
> > 
> > v2-v4:
> > - nothing since the patch was squashed from series [1] into this
> >   series.
> > 
> >  include/media/v4l2-connector.h | 30 ++++++++++++++++++++++++++++++
> >  include/media/v4l2-fwnode.h    | 33 +++++++++++++++++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >  create mode 100644 include/media/v4l2-connector.h
> > 
> > diff --git a/include/media/v4l2-connector.h b/include/media/v4l2-connector.h
> > new file mode 100644
> > index 000000000000..3a951c54f50e
> > --- /dev/null
> > +++ b/include/media/v4l2-connector.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * v4l2-connector.h
> > + *
> > + * V4L2 connector types.
> > + *
> > + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > + */
> > +
> > +#ifndef V4L2_CONNECTOR_H
> > +#define V4L2_CONNECTOR_H
> > +
> > +#define V4L2_CONNECTOR_MAX_LABEL 41  
> 
> Where does 41 come from? It's a weird number...
> 
> > +
> > +/**
> > + * enum v4l2_connector_type - connector type
> > + * @V4L2_CON_UNKNOWN:   unknown connector type, no V4L2 connetor configuration  
> 
> typo: connetor -> connector
> 
> > + * @V4L2_CON_COMPOSITE: analog composite connector
> > + * @V4L2_CON_SVIDEO:    analog svideo connector
> > + * @V4L2_CON_HDMI:      digital hdmi connector
> > + */
> > +enum v4l2_connector_type {
> > +	V4L2_CON_UNKNOWN,
> > +	V4L2_CON_COMPOSITE,
> > +	V4L2_CON_SVIDEO,
> > +	V4L2_CON_HDMI,
> > +};
> > +
> > +#endif /* V4L2_CONNECTOR_H */
> > +  
> 
> Is there a reason to create a new header for this? I think it is perfectly OK to
> add this define + enum for v4l2-fwnode.h.
> 
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index 6c07825e18b9..f4df1b95c5ef 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -22,6 +22,7 @@
> >  #include <linux/list.h>
> >  #include <linux/types.h>
> >  
> > +#include <media/v4l2-connector.h>
> >  #include <media/v4l2-mediabus.h>
> >  #include <media/v4l2-subdev.h>
> >  
> > @@ -126,6 +127,38 @@ struct v4l2_fwnode_link {
> >  	unsigned int remote_port;
> >  };
> >  
> > +/**
> > + * struct v4l2_fwnode_connector_analog - analog connector data structure
> > + * @supported_tvnorms: tv norms this connector supports, set to V4L2_STD_ALL
> > + *                     if no restrictions are specified.
> > + */
> > +struct v4l2_fwnode_connector_analog {
> > +	v4l2_std_id supported_tvnorms;
> > +};
> > +
> > +/**
> > + * struct v4l2_fwnode_connector - the connector data structure
> > + * @remote_port: identifier of the remote endpoint port the connector connects
> > + *		 to
> > + * @remote_id: identifier of the remote endpoint the connector connects to
> > + * @label: connetor label  
> 
> Same typo. It's probably a good idea to grep for this typo in this patch series :-)

Except for the points that Hans underlined, patch looks ok to me.

> 
> > + * @type: connector type
> > + * @connector: connector configuration
> > + * @connector.analog: analog connector configuration
> > + *                    &struct v4l2_fwnode_connector_analog
> > + */
> > +struct v4l2_fwnode_connector {
> > +	unsigned int remote_port;
> > +	unsigned int remote_id;
> > +	char label[V4L2_CONNECTOR_MAX_LABEL];
> > +	enum v4l2_connector_type type;
> > +
> > +	union {
> > +		struct v4l2_fwnode_connector_analog analog;
> > +		/* future connectors */
> > +	} connector;
> > +};
> > +
> >  /**
> >   * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
> >   * @fwnode: pointer to the endpoint's fwnode handle
> >   
> 
> Regards,
> 
> 	Hans



Thanks,
Mauro

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFEC181375
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbgCKIj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:39:28 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58163 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgCKIj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:39:28 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBwtZ-0005wM-TF; Wed, 11 Mar 2020 09:39:17 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBwtY-0002rw-9z; Wed, 11 Mar 2020 09:39:16 +0100
Date:   Wed, 11 Mar 2020 09:39:16 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        jacopo+renesas@jmondi.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, hans.verkuil@cisco.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v12 04/19] media: v4l2-fwnode: add endpoint id field to
 v4l2_fwnode_link
Message-ID: <20200311083916.5kxcpsyj56o6jun3@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
 <20200309101428.15267-5-m.felsch@pengutronix.de>
 <20200311081518.GE5379@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311081518.GE5379@paasikivi.fi.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:35:18 up 116 days, 23:53, 136 users,  load average: 0.15, 0.15,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 20-03-11 10:15, Sakari Ailus wrote:
> Hi Marco,
> 
> On Mon, Mar 09, 2020 at 11:14:13AM +0100, Marco Felsch wrote:
> > A link is between two endpoints not between two ports to be more
> > precise. Add the local_id/remote_id field which stores the endpoint
> > reg/port property to the link. Now the link holds all necessary
> > information about a link.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > 
> > v12:
> > - New in this serie
> > 
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 2 ++
> >  include/media/v4l2-fwnode.h           | 4 ++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 6ece4320e1d2..78c32aebbe03 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -565,6 +565,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
> >  
> >  	memset(link, 0, sizeof(*link));
> >  
> > +	fwnode_property_read_u32(__fwnode, "reg", &link->local_id);
> >  	fwnode = fwnode_get_parent(__fwnode);
> >  	fwnode_property_read_u32(fwnode, port_prop, &link->local_port);
> >  	fwnode = fwnode_get_next_parent(fwnode);
> > @@ -578,6 +579,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
> >  		return -ENOLINK;
> >  	}
> >  
> > +	fwnode_property_read_u32(fwnode, "reg", &link->remote_id);
> 
> This code really should use fwnode_graph_parse_endpoint(), and not
> implement the parsing locally.
> 
> I do think the end result would be better if the code using this function
> would be calling the fwnode graph APIs directly.

I think doing it manually was used due to the
"port" (ACPI) <-> "reg" (DT) property difference. I'm completely with
you to change it to fwnode_graph_parse_endpoint() since ACPI also uses
"reg" as port numbering (as you explained it to me).

Regards,
  Marco

> >  	fwnode = fwnode_get_parent(fwnode);
> >  	fwnode_property_read_u32(fwnode, port_prop, &link->remote_port);
> >  	fwnode = fwnode_get_next_parent(fwnode);
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index f6a7bcd13197..7bba6dfa3fd6 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -113,14 +113,18 @@ struct v4l2_fwnode_endpoint {
> >   * struct v4l2_fwnode_link - a link between two endpoints
> >   * @local_node: pointer to device_node of this endpoint
> >   * @local_port: identifier of the port this endpoint belongs to
> > + * @local_id: identifier of the id this endpoint belongs to
> >   * @remote_node: pointer to device_node of the remote endpoint
> >   * @remote_port: identifier of the port the remote endpoint belongs to
> > + * @remote_id: identifier of the id the remote endpoint belongs to
> >   */
> >  struct v4l2_fwnode_link {
> >  	struct fwnode_handle *local_node;
> >  	unsigned int local_port;
> > +	unsigned int local_id;
> >  	struct fwnode_handle *remote_node;
> >  	unsigned int remote_port;
> > +	unsigned int remote_id;
> >  };
> >  
> >  /**
> 
> -- 
> Sakari Ailus
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F43487999
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 14:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406715AbfHIMQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 08:16:21 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38359 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbfHIMQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 08:16:21 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hw3oX-00078D-Qr; Fri, 09 Aug 2019 14:16:09 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hw3oU-00046a-Uk; Fri, 09 Aug 2019 14:16:06 +0200
Date:   Fri, 9 Aug 2019 14:16:06 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 03/13] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20190809121606.pv3ieak5f2ffpj3x@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-4-m.felsch@pengutronix.de>
 <67f45a50-1eef-89d7-c008-17f085940eb2@xs4all.nl>
 <20190514152004.30d7838b@coco.lan>
 <20190516165114.GP14820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516165114.GP14820@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:00:07 up 83 days, 15:18, 57 users,  load average: 0.04, 0.05,
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

On 19-05-16 19:51, Laurent Pinchart wrote:
> Hello Marco,
> 
> Thank you for the patch.

Thanks for the review.

> 
> On Tue, May 14, 2019 at 03:20:04PM -0300, Mauro Carvalho Chehab wrote:
> > Em Mon, 6 May 2019 12:10:41 +0200 Hans Verkuil escreveu:
> > > On 4/15/19 2:44 PM, Marco Felsch wrote:
> > > > The patch adds the initial connector parsing code, so we can move from a
> > > > driver specific parsing code to a generic one. Currently only the
> > > > generic fields and the analog-connector specific fields are parsed. Parsing
> > > > the other connector specific fields can be added by a simple callbacks.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > ---
> > > > [1] https://patchwork.kernel.org/cover/10794703/
> > > > 
> > > > v6:
> > > > - use 'unsigned int' count var
> > > > - fix comment and style issues
> > > > - place '/* fall through */' to correct places
> > > > - fix error handling and cleanup by releasing fwnode
> > > > - drop vga and dvi parsing support as those connectors are rarely used
> > > >   these days
> > > > 
> > > > v5:
> > > > - s/strlcpy/strscpy/
> > > > 
> > > > v2-v4:
> > > > - nothing since the patch was squashed from series [1] into this
> > > >   series.
> > > > 
> > > >  drivers/media/v4l2-core/v4l2-fwnode.c | 111 ++++++++++++++++++++++++++
> > > >  include/media/v4l2-fwnode.h           |  16 ++++
> > > >  2 files changed, 127 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > index 20571846e636..f1cca95c8fef 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > @@ -592,6 +592,117 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> > > >  
> > > > +static const struct v4l2_fwnode_connector_conv {
> > > > +	enum v4l2_connector_type type;
> > > > +	const char *name;
> 
> Maybe compatible instead of name ?

Okay, I can change that.

> > > > +} connectors[] = {
> > > > +	{
> > > > +		.type = V4L2_CON_COMPOSITE,
> > > > +		.name = "composite-video-connector",
> > > > +	}, {
> > > > +		.type = V4L2_CON_SVIDEO,
> > > > +		.name = "svideo-connector",
> > > > +	}, {
> > > > +		.type = V4L2_CON_HDMI,
> > > > +		.name = "hdmi-connector",
> > > > +	},
> > > > +};
> > > > +
> > > > +static enum v4l2_connector_type
> > > > +v4l2_fwnode_string_to_connector_type(const char *con_str)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> > > > +		if (!strcmp(con_str, connectors[i].name))
> > > > +			return connectors[i].type;
> > > > +
> > > > +	/* no valid connector found */
> 
> The usual comment style in this file is to start with a capital letter
> and end sentences with a period. I would however drop this comment, it's
> not very useful. The other comments should be updated accordingly.
> 

I will change my comments and drop this one.

> > > > +	return V4L2_CON_UNKNOWN;
> > > > +}
> > > > +
> > > > +static int
> > > > +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> > > > +				   struct v4l2_fwnode_connector *vc)
> > > > +{
> > > > +	u32 tvnorms;
> > > > +	int ret;
> > > > +
> > > > +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> > > > +
> > > > +	/* tvnorms is optional */
> > > > +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> 
> Please document all exported functions with kerneldoc.

It is documented within the header file. To be aligned with the other
functions I wouldn't change that.

> > > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> > > > +				struct v4l2_fwnode_connector *connector)
> > > > +{
> > > > +	struct fwnode_handle *fwnode;
> > > > +	struct fwnode_endpoint __ep;
> > > > +	const char *c_type_str, *label;
> > > > +	int ret;
> > > > +
> > > > +	memset(connector, 0, sizeof(*connector));
> > > > +
> > > > +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);
> 
> I would rename the argument __fwnode to fwnode, and rename the fwnode
> variable to remote (or similar) to make this clearer.

Okay.

> 
> > > > +	if (!fwnode)
> > > > +		return -EINVAL;
> 
> Is EINVAL the right error here ? Wouldn't it be useful for the caller to
> differentiate between unconnected connector nodes and invalid ones ?

Yes it would. Should I return ENOLINK instead?

> 
> > > > +
> > > > +	/* parse all common properties first */
> > > > +	/* connector-type is stored within the compatible string */
> > > > +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);
> 
> Prefixing or postfixing names with types is usually frowned upon. You
> could rename this to type_name for instance.

Okay.

> > > > +	if (ret) {
> > > > +		fwnode_handle_put(fwnode);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> > > > +
> > > > +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> > > > +	connector->remote_port = __ep.port;
> > > > +	connector->remote_id = __ep.id;
> > > > +
> > > > +	ret = fwnode_property_read_string(fwnode, "label", &label);
> > > > +	if (!ret) {
> > > > +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> > > > +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> > > > +	} else {
> > > > +		/*
> > > > +		 * labels are optional, if none is given create one:
> > > > +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> > > > +		 */
> > > > +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> > > > +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> > > > +			 connector->remote_id);
> 
> Should we really try to create labels when none is available ? If so
> this needs much more careful thoughts, we need to think about what the
> label will be used for, and create a good naming scheme accordingly. If
> the label will be displayed to the end-user I don't think the above name
> would be very useful, it would be best to leave it empty and let
> applications create a name based on the connector type and other
> information they have at their disposal.

Hm.. I don't have a strong opinion on that. If the others are with you I
will leave it empty.

> > > > +	}
> > > > +
> > > > +	/* now parse the connector specific properties */
> > > > +	switch (connector->type) {
> > > > +	case V4L2_CON_COMPOSITE:
> > > > +		/* fall through */
> 
> I don't think you need a fall-through comment when the two cases are
> adjacent with no line in-between.

Hm.. I don't know the compiler behaviour. According the official
gcc documentation [1] I would not leave that.

[1] https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html

> 
> > > > +	case V4L2_CON_SVIDEO:
> > > > +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> > > > +		break;
> > > > +	case V4L2_CON_HDMI:
> > > > +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> > > > +			c_type_str);  
> > > 
> > > Why warn? Just drop this.
> > 
> > good point. I would prefer to have some warning here, in order to warn a
> > developer that might be using it that this part of the code would require 
> > some change.
> > 
> > perhaps pr_warn_once()?
> >
> > > > +		ret = 0;
> > > > +		break;
> 
> If it's not supported we should warn and return an error. Otherwise we
> should be silent and return success. Combining a warning with success
> isn't a good idea, this is either a normal case or an error, not both.

The generic part still applies and is valid. That was the reason why I
did return success.

> > > > +	case V4L2_CON_UNKNOWN:
> > > > +		/* fall through */
> > > > +	default:
> > > > +		pr_err("Unknown connector type\n");
> > > > +		ret = -EINVAL;
> > > > +	};
> > > > +
> > > > +	fwnode_handle_put(fwnode);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> > > > +
> > > >  static int
> > > >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> > > >  					  struct v4l2_async_notifier *notifier,
> > > > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > > > index f4df1b95c5ef..e072f2915ddb 100644
> > > > --- a/include/media/v4l2-fwnode.h
> > > > +++ b/include/media/v4l2-fwnode.h
> > > > @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> > > >   */
> > > >  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> > > >  
> 
> And I see here that the function is documented. One more reason to move
> kerneldoc to the .c files...

Please check my comment above.

> > > > +/**
> > > > + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> > > > + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> > > > + *          connected to
> 
> This is very unclear, I would interpret that as the remote endpoint, not
> the local endpoint. Could you please try to clarify the documentation ?

Hm.. I have no good idea how I should describe it..

"""
The device (local) endpoint fwnode handle on which the connector is
connected to using the remote-enpoint property.
"""

Regards,
  Marco

> > > > + * @connector: pointer to the V4L2 fwnode connector data structure
> > > > + *
> > > > + * Fill the connector data structure with the connector type, label and the
> > > > + * endpoint id and port where the connector belongs to. If no label is present
> > > > + * a unique one will be created. Labels with more than 40 characters are cut.
> > > > + *
> > > > + * Return: %0 on success or a negative error code on failure:
> > > > + *	   %-EINVAL on parsing failure
> > > > + */
> > > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> > > > +				struct v4l2_fwnode_connector *connector);
> > > > +
> > > >  /**
> > > >   * typedef parse_endpoint_func - Driver's callback function to be called on
> > > >   *	each V4L2 fwnode endpoint.
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

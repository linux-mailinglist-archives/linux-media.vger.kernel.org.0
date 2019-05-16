Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1901A20D6A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 18:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfEPQve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 12:51:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40694 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfEPQve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 12:51:34 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0861C2FD;
        Thu, 16 May 2019 18:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558025491;
        bh=ixtf6JNvnFoM+9BS9a5jXnzrdn3vsMfW+VeDuNZDnMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uv8x19HjZJDs7eBjTJjBHKH5r0GS3gyz336yuoG5ROiGWBshptj4KAPWhwnyTeVXa
         pKi4l4qoOALr9wxKr2UOquSExLSEPjQdioNEPtDgiZAJMqfSqTdWLQOt+g7CZopaa2
         hTjANVIKcLQgBhSveSnNYv9O8pTdhuPZHt2zOaK4=
Date:   Thu, 16 May 2019 19:51:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 03/13] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20190516165114.GP14820@pendragon.ideasonboard.com>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-4-m.felsch@pengutronix.de>
 <67f45a50-1eef-89d7-c008-17f085940eb2@xs4all.nl>
 <20190514152004.30d7838b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190514152004.30d7838b@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Marco,

Thank you for the patch.

On Tue, May 14, 2019 at 03:20:04PM -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 6 May 2019 12:10:41 +0200 Hans Verkuil escreveu:
> > On 4/15/19 2:44 PM, Marco Felsch wrote:
> > > The patch adds the initial connector parsing code, so we can move from a
> > > driver specific parsing code to a generic one. Currently only the
> > > generic fields and the analog-connector specific fields are parsed. Parsing
> > > the other connector specific fields can be added by a simple callbacks.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > > [1] https://patchwork.kernel.org/cover/10794703/
> > > 
> > > v6:
> > > - use 'unsigned int' count var
> > > - fix comment and style issues
> > > - place '/* fall through */' to correct places
> > > - fix error handling and cleanup by releasing fwnode
> > > - drop vga and dvi parsing support as those connectors are rarely used
> > >   these days
> > > 
> > > v5:
> > > - s/strlcpy/strscpy/
> > > 
> > > v2-v4:
> > > - nothing since the patch was squashed from series [1] into this
> > >   series.
> > > 
> > >  drivers/media/v4l2-core/v4l2-fwnode.c | 111 ++++++++++++++++++++++++++
> > >  include/media/v4l2-fwnode.h           |  16 ++++
> > >  2 files changed, 127 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index 20571846e636..f1cca95c8fef 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -592,6 +592,117 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> > >  
> > > +static const struct v4l2_fwnode_connector_conv {
> > > +	enum v4l2_connector_type type;
> > > +	const char *name;

Maybe compatible instead of name ?

> > > +} connectors[] = {
> > > +	{
> > > +		.type = V4L2_CON_COMPOSITE,
> > > +		.name = "composite-video-connector",
> > > +	}, {
> > > +		.type = V4L2_CON_SVIDEO,
> > > +		.name = "svideo-connector",
> > > +	}, {
> > > +		.type = V4L2_CON_HDMI,
> > > +		.name = "hdmi-connector",
> > > +	},
> > > +};
> > > +
> > > +static enum v4l2_connector_type
> > > +v4l2_fwnode_string_to_connector_type(const char *con_str)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> > > +		if (!strcmp(con_str, connectors[i].name))
> > > +			return connectors[i].type;
> > > +
> > > +	/* no valid connector found */

The usual comment style in this file is to start with a capital letter
and end sentences with a period. I would however drop this comment, it's
not very useful. The other comments should be updated accordingly.

> > > +	return V4L2_CON_UNKNOWN;
> > > +}
> > > +
> > > +static int
> > > +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> > > +				   struct v4l2_fwnode_connector *vc)
> > > +{
> > > +	u32 tvnorms;
> > > +	int ret;
> > > +
> > > +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> > > +
> > > +	/* tvnorms is optional */
> > > +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;
> > > +
> > > +	return 0;
> > > +}
> > > +

Please document all exported functions with kerneldoc.

> > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> > > +				struct v4l2_fwnode_connector *connector)
> > > +{
> > > +	struct fwnode_handle *fwnode;
> > > +	struct fwnode_endpoint __ep;
> > > +	const char *c_type_str, *label;
> > > +	int ret;
> > > +
> > > +	memset(connector, 0, sizeof(*connector));
> > > +
> > > +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);

I would rename the argument __fwnode to fwnode, and rename the fwnode
variable to remote (or similar) to make this clearer.

> > > +	if (!fwnode)
> > > +		return -EINVAL;

Is EINVAL the right error here ? Wouldn't it be useful for the caller to
differentiate between unconnected connector nodes and invalid ones ?

> > > +
> > > +	/* parse all common properties first */
> > > +	/* connector-type is stored within the compatible string */
> > > +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);

Prefixing or postfixing names with types is usually frowned upon. You
could rename this to type_name for instance.

> > > +	if (ret) {
> > > +		fwnode_handle_put(fwnode);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> > > +
> > > +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> > > +	connector->remote_port = __ep.port;
> > > +	connector->remote_id = __ep.id;
> > > +
> > > +	ret = fwnode_property_read_string(fwnode, "label", &label);
> > > +	if (!ret) {
> > > +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> > > +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> > > +	} else {
> > > +		/*
> > > +		 * labels are optional, if none is given create one:
> > > +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> > > +		 */
> > > +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> > > +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> > > +			 connector->remote_id);

Should we really try to create labels when none is available ? If so
this needs much more careful thoughts, we need to think about what the
label will be used for, and create a good naming scheme accordingly. If
the label will be displayed to the end-user I don't think the above name
would be very useful, it would be best to leave it empty and let
applications create a name based on the connector type and other
information they have at their disposal.

> > > +	}
> > > +
> > > +	/* now parse the connector specific properties */
> > > +	switch (connector->type) {
> > > +	case V4L2_CON_COMPOSITE:
> > > +		/* fall through */

I don't think you need a fall-through comment when the two cases are
adjacent with no line in-between.

> > > +	case V4L2_CON_SVIDEO:
> > > +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> > > +		break;
> > > +	case V4L2_CON_HDMI:
> > > +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> > > +			c_type_str);  
> > 
> > Why warn? Just drop this.
> 
> good point. I would prefer to have some warning here, in order to warn a
> developer that might be using it that this part of the code would require 
> some change.
> 
> perhaps pr_warn_once()?
>
> > > +		ret = 0;
> > > +		break;

If it's not supported we should warn and return an error. Otherwise we
should be silent and return success. Combining a warning with success
isn't a good idea, this is either a normal case or an error, not both.

> > > +	case V4L2_CON_UNKNOWN:
> > > +		/* fall through */
> > > +	default:
> > > +		pr_err("Unknown connector type\n");
> > > +		ret = -EINVAL;
> > > +	};
> > > +
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> > > +
> > >  static int
> > >  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> > >  					  struct v4l2_async_notifier *notifier,
> > > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > > index f4df1b95c5ef..e072f2915ddb 100644
> > > --- a/include/media/v4l2-fwnode.h
> > > +++ b/include/media/v4l2-fwnode.h
> > > @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> > >   */
> > >  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> > >  

And I see here that the function is documented. One more reason to move
kerneldoc to the .c files...

> > > +/**
> > > + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> > > + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> > > + *          connected to

This is very unclear, I would interpret that as the remote endpoint, not
the local endpoint. Could you please try to clarify the documentation ?

> > > + * @connector: pointer to the V4L2 fwnode connector data structure
> > > + *
> > > + * Fill the connector data structure with the connector type, label and the
> > > + * endpoint id and port where the connector belongs to. If no label is present
> > > + * a unique one will be created. Labels with more than 40 characters are cut.
> > > + *
> > > + * Return: %0 on success or a negative error code on failure:
> > > + *	   %-EINVAL on parsing failure
> > > + */
> > > +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> > > +				struct v4l2_fwnode_connector *connector);
> > > +
> > >  /**
> > >   * typedef parse_endpoint_func - Driver's callback function to be called on
> > >   *	each V4L2 fwnode endpoint.

-- 
Regards,

Laurent Pinchart

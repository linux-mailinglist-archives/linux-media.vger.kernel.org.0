Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2398EBD8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbfHOMsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:48:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfHOMsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:48:16 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 582B22AF;
        Thu, 15 Aug 2019 14:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565873293;
        bh=hO7FDkAVGrSdCByC0ZlanQ6nqO1ZSVRXDWkJnw5GLxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J2D/arjxloPxdJnjtwgtsaTQv/lA4bx8zd70aY7j33SDOs/jGvlnbWArNc6WqPfgs
         zgKkGRsuvCtZaKMOE98lA8hU2wsuRTr1ad80ZiloM6zuE8hASDrcohN+3TVCpTcHi0
         o7nqWmWm7YcwLTVEgwID8GfO2er93NSL0bqjbbe4=
Date:   Thu, 15 Aug 2019 15:48:10 +0300
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
Message-ID: <20190815124810.GD13823@pendragon.ideasonboard.com>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-4-m.felsch@pengutronix.de>
 <67f45a50-1eef-89d7-c008-17f085940eb2@xs4all.nl>
 <20190514152004.30d7838b@coco.lan>
 <20190516165114.GP14820@pendragon.ideasonboard.com>
 <20190809121606.pv3ieak5f2ffpj3x@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190809121606.pv3ieak5f2ffpj3x@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Fri, Aug 09, 2019 at 02:16:06PM +0200, Marco Felsch wrote:
> On 19-05-16 19:51, Laurent Pinchart wrote:
> > On Tue, May 14, 2019 at 03:20:04PM -0300, Mauro Carvalho Chehab wrote:
> >> Em Mon, 6 May 2019 12:10:41 +0200 Hans Verkuil escreveu:
> >>> On 4/15/19 2:44 PM, Marco Felsch wrote:
> >>>> The patch adds the initial connector parsing code, so we can move from a
> >>>> driver specific parsing code to a generic one. Currently only the
> >>>> generic fields and the analog-connector specific fields are parsed. Parsing
> >>>> the other connector specific fields can be added by a simple callbacks.
> >>>> 
> >>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >>>> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>> ---
> >>>> [1] https://patchwork.kernel.org/cover/10794703/
> >>>> 
> >>>> v6:
> >>>> - use 'unsigned int' count var
> >>>> - fix comment and style issues
> >>>> - place '/* fall through */' to correct places
> >>>> - fix error handling and cleanup by releasing fwnode
> >>>> - drop vga and dvi parsing support as those connectors are rarely used
> >>>>   these days
> >>>> 
> >>>> v5:
> >>>> - s/strlcpy/strscpy/
> >>>> 
> >>>> v2-v4:
> >>>> - nothing since the patch was squashed from series [1] into this
> >>>>   series.
> >>>> 
> >>>>  drivers/media/v4l2-core/v4l2-fwnode.c | 111 ++++++++++++++++++++++++++
> >>>>  include/media/v4l2-fwnode.h           |  16 ++++
> >>>>  2 files changed, 127 insertions(+)
> >>>> 
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>> index 20571846e636..f1cca95c8fef 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> >>>> @@ -592,6 +592,117 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> >>>>  
> >>>> +static const struct v4l2_fwnode_connector_conv {
> >>>> +	enum v4l2_connector_type type;
> >>>> +	const char *name;
> > 
> > Maybe compatible instead of name ?
> 
> Okay, I can change that.
> 
> >>>> +} connectors[] = {
> >>>> +	{
> >>>> +		.type = V4L2_CON_COMPOSITE,
> >>>> +		.name = "composite-video-connector",
> >>>> +	}, {
> >>>> +		.type = V4L2_CON_SVIDEO,
> >>>> +		.name = "svideo-connector",
> >>>> +	}, {
> >>>> +		.type = V4L2_CON_HDMI,
> >>>> +		.name = "hdmi-connector",
> >>>> +	},
> >>>> +};
> >>>> +
> >>>> +static enum v4l2_connector_type
> >>>> +v4l2_fwnode_string_to_connector_type(const char *con_str)
> >>>> +{
> >>>> +	unsigned int i;
> >>>> +
> >>>> +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> >>>> +		if (!strcmp(con_str, connectors[i].name))
> >>>> +			return connectors[i].type;
> >>>> +
> >>>> +	/* no valid connector found */
> > 
> > The usual comment style in this file is to start with a capital letter
> > and end sentences with a period. I would however drop this comment, it's
> > not very useful. The other comments should be updated accordingly.
> 
> I will change my comments and drop this one.
> 
> >>>> +	return V4L2_CON_UNKNOWN;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> >>>> +				   struct v4l2_fwnode_connector *vc)
> >>>> +{
> >>>> +	u32 tvnorms;
> >>>> +	int ret;
> >>>> +
> >>>> +	ret = fwnode_property_read_u32(fwnode, "tvnorms", &tvnorms);
> >>>> +
> >>>> +	/* tvnorms is optional */
> >>>> +	vc->connector.analog.supported_tvnorms = ret ? V4L2_STD_ALL : tvnorms;
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> > 
> > Please document all exported functions with kerneldoc.
> 
> It is documented within the header file. To be aligned with the other
> functions I wouldn't change that.

It's not your fault, but this policy REALLY makes review painful and is
EXTREMELY annoying.

> >>>> +int v4l2_fwnode_parse_connector(struct fwnode_handle *__fwnode,
> >>>> +				struct v4l2_fwnode_connector *connector)
> >>>> +{
> >>>> +	struct fwnode_handle *fwnode;
> >>>> +	struct fwnode_endpoint __ep;
> >>>> +	const char *c_type_str, *label;
> >>>> +	int ret;
> >>>> +
> >>>> +	memset(connector, 0, sizeof(*connector));
> >>>> +
> >>>> +	fwnode = fwnode_graph_get_remote_port_parent(__fwnode);
> > 
> > I would rename the argument __fwnode to fwnode, and rename the fwnode
> > variable to remote (or similar) to make this clearer.
> 
> Okay.
> 
> >>>> +	if (!fwnode)
> >>>> +		return -EINVAL;
> > 
> > Is EINVAL the right error here ? Wouldn't it be useful for the caller to
> > differentiate between unconnected connector nodes and invalid ones ?
> 
> Yes it would. Should I return ENOLINK instead?

Good idea.

> >>>> +
> >>>> +	/* parse all common properties first */
> >>>> +	/* connector-type is stored within the compatible string */
> >>>> +	ret = fwnode_property_read_string(fwnode, "compatible", &c_type_str);
> > 
> > Prefixing or postfixing names with types is usually frowned upon. You
> > could rename this to type_name for instance.
> 
> Okay.
> 
> >>>> +	if (ret) {
> >>>> +		fwnode_handle_put(fwnode);
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	connector->type = v4l2_fwnode_string_to_connector_type(c_type_str);
> >>>> +
> >>>> +	fwnode_graph_parse_endpoint(__fwnode, &__ep);
> >>>> +	connector->remote_port = __ep.port;
> >>>> +	connector->remote_id = __ep.id;
> >>>> +
> >>>> +	ret = fwnode_property_read_string(fwnode, "label", &label);
> >>>> +	if (!ret) {
> >>>> +		/* ensure label doesn't exceed V4L2_CONNECTOR_MAX_LABEL size */
> >>>> +		strscpy(connector->label, label, V4L2_CONNECTOR_MAX_LABEL);
> >>>> +	} else {
> >>>> +		/*
> >>>> +		 * labels are optional, if none is given create one:
> >>>> +		 * <connector-type-string>@port<endpoint_port>/ep<endpoint_id>
> >>>> +		 */
> >>>> +		snprintf(connector->label, V4L2_CONNECTOR_MAX_LABEL,
> >>>> +			 "%s@port%u/ep%u", c_type_str, connector->remote_port,
> >>>> +			 connector->remote_id);
> > 
> > Should we really try to create labels when none is available ? If so
> > this needs much more careful thoughts, we need to think about what the
> > label will be used for, and create a good naming scheme accordingly. If
> > the label will be displayed to the end-user I don't think the above name
> > would be very useful, it would be best to leave it empty and let
> > applications create a name based on the connector type and other
> > information they have at their disposal.
> 
> Hm.. I don't have a strong opinion on that. If the others are with you I
> will leave it empty.
> 
> >>>> +	}
> >>>> +
> >>>> +	/* now parse the connector specific properties */
> >>>> +	switch (connector->type) {
> >>>> +	case V4L2_CON_COMPOSITE:
> >>>> +		/* fall through */
> > 
> > I don't think you need a fall-through comment when the two cases are
> > adjacent with no line in-between.
> 
> Hm.. I don't know the compiler behaviour. According the official
> gcc documentation [1] I would not leave that.

Not leave the fall-through comment, and thus remove it ? :-) I really
think it's not needed (otherwise imagine how the big switch-case in
v4l2-ctrls.c would look like for instance).

> [1] https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
> 
> >>>> +	case V4L2_CON_SVIDEO:
> >>>> +		ret = v4l2_fwnode_connector_parse_analog(fwnode, connector);
> >>>> +		break;
> >>>> +	case V4L2_CON_HDMI:
> >>>> +		pr_warn("Connector specific parsing is currently not supported for %s\n",
> >>>> +			c_type_str);  
> >>> 
> >>> Why warn? Just drop this.
> >> 
> >> good point. I would prefer to have some warning here, in order to warn a
> >> developer that might be using it that this part of the code would require 
> >> some change.
> >> 
> >> perhaps pr_warn_once()?
> >>
> >>>> +		ret = 0;
> >>>> +		break;
> > 
> > If it's not supported we should warn and return an error. Otherwise we
> > should be silent and return success. Combining a warning with success
> > isn't a good idea, this is either a normal case or an error, not both.
> 
> The generic part still applies and is valid. That was the reason why I
> did return success.

But the HDMI-specific part won't work, so the code will likely not
operate correctly. I'd rather make it an error to for developers using
HDMI connectors to fix it.

> >>>> +	case V4L2_CON_UNKNOWN:
> >>>> +		/* fall through */
> >>>> +	default:
> >>>> +		pr_err("Unknown connector type\n");
> >>>> +		ret = -EINVAL;
> >>>> +	};
> >>>> +
> >>>> +	fwnode_handle_put(fwnode);
> >>>> +
> >>>> +	return ret;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(v4l2_fwnode_parse_connector);
> >>>> +
> >>>>  static int
> >>>>  v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >>>>  					  struct v4l2_async_notifier *notifier,
> >>>> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> >>>> index f4df1b95c5ef..e072f2915ddb 100644
> >>>> --- a/include/media/v4l2-fwnode.h
> >>>> +++ b/include/media/v4l2-fwnode.h
> >>>> @@ -269,6 +269,22 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
> >>>>   */
> >>>>  void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
> >>>>  
> > 
> > And I see here that the function is documented. One more reason to move
> > kerneldoc to the .c files...
> 
> Please check my comment above.

I know, it's not your fault, I was complaining about the state of the
universe in general :-)

> >>>> +/**
> >>>> + * v4l2_fwnode_parse_connector() - parse the connector on endpoint
> >>>> + * @fwnode: pointer to the endpoint's fwnode handle where the connector is
> >>>> + *          connected to
> > 
> > This is very unclear, I would interpret that as the remote endpoint, not
> > the local endpoint. Could you please try to clarify the documentation ?
> 
> Hm.. I have no good idea how I should describe it..
> 
> """
> The device (local) endpoint fwnode handle on which the connector is
> connected to using the remote-enpoint property.
> """
> 
> >>>> + * @connector: pointer to the V4L2 fwnode connector data structure
> >>>> + *
> >>>> + * Fill the connector data structure with the connector type, label and the
> >>>> + * endpoint id and port where the connector belongs to. If no label is present
> >>>> + * a unique one will be created. Labels with more than 40 characters are cut.
> >>>> + *
> >>>> + * Return: %0 on success or a negative error code on failure:
> >>>> + *	   %-EINVAL on parsing failure
> >>>> + */
> >>>> +int v4l2_fwnode_parse_connector(struct fwnode_handle *fwnode,
> >>>> +				struct v4l2_fwnode_connector *connector);
> >>>> +
> >>>>  /**
> >>>>   * typedef parse_endpoint_func - Driver's callback function to be called on
> >>>>   *	each V4L2 fwnode endpoint.

-- 
Regards,

Laurent Pinchart

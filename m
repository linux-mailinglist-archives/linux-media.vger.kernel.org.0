Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91DFFFE874
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfKOXFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:05:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:47701 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727168AbfKOXF3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:05:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Nov 2019 15:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; 
   d="scan'208";a="230601559"
Received: from awiatrow-mobl.ger.corp.intel.com (HELO mara.localdomain) ([10.249.149.170])
  by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2019 15:05:24 -0800
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iVkfz-0000i5-UA; Sat, 16 Nov 2019 01:06:54 +0200
Date:   Sat, 16 Nov 2019 01:06:51 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 03/14] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20191115230650.GA2696@mara.localdomain>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-4-m.felsch@pengutronix.de>
 <20191002070303.GK896@valkosipuli.retiisi.org.uk>
 <20191002080735.yyoxo5wg35t7k26x@pengutronix.de>
 <20191023105739.GN5433@paasikivi.fi.intel.com>
 <20191023122157.qu3eodamlye5zsax@pengutronix.de>
 <20191024120213.GC3966@mara.localdomain>
 <20191108085852.rujiwio3yo43u6sy@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108085852.rujiwio3yo43u6sy@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Fri, Nov 08, 2019 at 09:58:52AM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> sorry for my delay now ^^
> 
> On 19-10-24 15:02, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Wed, Oct 23, 2019 at 02:21:57PM +0200, Marco Felsch wrote:
> > > Hi Sakari,
> > > 
> > > On 19-10-23 13:57, Sakari Ailus wrote:
> > > > Hi Marco,
> > > > 
> > > > Apologies for the delay.
> > > 
> > > No problem.
> > > 
> > > > On Wed, Oct 02, 2019 at 10:07:35AM +0200, Marco Felsch wrote:
> > > > > Hi Sakari,
> > > > > 
> > > > > On 19-10-02 10:03, Sakari Ailus wrote:
> > > > > > Hi Marco,
> > > > > > 
> > > > > > On Fri, Aug 30, 2019 at 12:16:35PM +0200, Marco Felsch wrote:
> > > > > > > The patch adds the initial connector parsing code, so we can move from a
> > > > > > > driver specific parsing code to a generic one. Currently only the
> > > > > > > generic fields and the analog-connector specific fields are parsed. Parsing
> > > > > > > the other connector specific fields can be added by a simple callbacks.
> > > > > > > 
> > > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > > ---
> > > > > > > [1] https://patchwork.kernel.org/cover/10794703/
> > > > > > > 
> > > > > > > v10:
> > > > > > > - drop V4L2_CONN_HDMI support
> > > > > > > - adapt pr_err msg to reflect new state (-> connector is unkown)
> > > > > > > 
> > > > > > > v9:
> > > > > > > - Fix leading semicolon found by kbuild semicolon.cocci
> > > > > > > 
> > > > > > > v8:
> > > > > > > - V4L2_CON_* -> V4L2_CONN_*
> > > > > > > - tvnorms -> sdtv-standards
> > > > > > > - adapt to new v4l2_fwnode_connector_analog member
> > > > > > > - return error in case of V4L2_CONN_HDMI
> > > > > > > 
> > > > > > > v7:
> > > > > > > @Jacopo: I dropped your r b tag becuase of the amount of changes I
> > > > > > > made..
> > > > > > > 
> > > > > > > - drop unnecessary comments
> > > > > > > - fix commet style
> > > > > > > - s/v4l2_fwnode_connector_conv.name/v4l2_fwnode_connector_conv.compatible/
> > > > > > > - make label size variable and drop V4L2_CONNECTOR_MAX_LABEL usage
> > > > > > > - do not assign a default label in case of no label was specified
> > > > > > > - remove useless /* fall through */ comments
> > > > > > > - add support for N connector links
> > > > > > > - rename local variables to be more meaningful
> > > > > > > - adjust kernedoc
> > > > > > > - add v4l2_fwnode_connector_free()
> > > > > > > - improve error handling (use different error values)
> > > > > > > - make use of pr_warn_once()
> > > > > > > 
> > > > > > > v6:
> > > > > > > - use unsigned count var
> > > > > > > - fix comment and style issues
> > > > > > > - place '/* fall through */' to correct places
> > > > > > > - fix error handling and cleanup by releasing fwnode
> > > > > > > - drop vga and dvi parsing support as those connectors are rarely used
> > > > > > >   these days
> > > > > > > 
> > > > > > > v5:
> > > > > > > - s/strlcpy/strscpy/
> > > > > > > 
> > > > > > > v2-v4:
> > > > > > > - nothing since the patch was squashed from series [1] into this
> > > > > > >   series.
> > > > > > > 
> > > > > > >  drivers/media/v4l2-core/v4l2-fwnode.c | 129 ++++++++++++++++++++++++++
> > > > > > >  include/media/v4l2-fwnode.h           |  38 ++++++++
> > > > > > >  2 files changed, 167 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > > > > index 3bd1888787eb..0bfa7cbf78df 100644
> > > > > > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > > > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > > > > > @@ -595,6 +595,135 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> > > > > > >  }
> > > > > > >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> > > > > > >  
> > > > > > > +static const struct v4l2_fwnode_connector_conv {
> > > > > > > +	enum v4l2_connector_type type;
> > > > > > > +	const char *compatible;
> > > > > > > +} connectors[] = {
> > > > > > > +	{
> > > > > > > +		.type = V4L2_CONN_COMPOSITE,
> > > > > > > +		.compatible = "composite-video-connector",
> > > > > > > +	}, {
> > > > > > > +		.type = V4L2_CONN_SVIDEO,
> > > > > > > +		.compatible = "svideo-connector",
> > > > > > > +	},
> > > > > > > +};
> > > > > > > +
> > > > > > > +static enum v4l2_connector_type
> > > > > > > +v4l2_fwnode_string_to_connector_type(const char *con_str)
> > > > > > > +{
> > > > > > > +	unsigned int i;
> > > > > > > +
> > > > > > > +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> > > > > > > +		if (!strcmp(con_str, connectors[i].compatible))
> > > > > > > +			return connectors[i].type;
> > > > > > > +
> > > > > > > +	return V4L2_CONN_UNKNOWN;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int
> > > > > > > +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> > > > > > > +				   struct v4l2_fwnode_connector *vc)
> > > > > > > +{
> > > > > > > +	u32 stds;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	ret = fwnode_property_read_u32(fwnode, "sdtv-standards", &stds);
> > > > > > > +
> > > > > > > +	/* The property is optional. */
> > > > > > > +	vc->connector.analog.sdtv_stds = ret ? V4L2_STD_ALL : stds;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> > > > > > > +{
> > > > > > > +	unsigned int i;
> > > > > > > +
> > > > > > > +	if (IS_ERR_OR_NULL(connector))
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	for (i = 0; i < connector->nr_of_links; i++)
> > > > > > > +		v4l2_fwnode_put_link(&connector->links[i]);
> > > > > > > +	kfree(connector->links);
> > > > > > 
> > > > > > Please assign connector->links NULL here, and nr_of_links to zero.
> > > > > 
> > > > > Okay, I can do that.
> > > > > 
> > > > > > > +}
> > > > > > > +EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_free);
> > > > > > > +
> > > > > > > +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> > > > > > > +				      struct v4l2_fwnode_connector *connector)
> > > > > > > +{
> > > > > > > +	struct fwnode_handle *remote_pp, *remote_ep;
> > > > > > > +	const char *type_name;
> > > > > > > +	unsigned int i = 0, ep_num = 0;
> > > > > > > +	int err;
> > > > > > > +
> > > > > > > +	memset(connector, 0, sizeof(*connector));
> > > > > > > +
> > > > > > > +	remote_pp = fwnode_graph_get_remote_port_parent(fwnode);
> > > > > > 
> > > > > > How do you know a remote endpoint is a connector, and not another device's
> > > > > > endpoint?
> > > > > 
> > > > > Well, I think that the caller won't use this function if it isn't a
> > > > > connector. If it helps I can check if the compatible of the remote ends
> > > > > with "-connector".
> > > > 
> > > > The function is called by a driver. A driver shouldn't know what's at the
> > > > other end of the graph arc; the information should come from the firmware
> > > > instead.
> > > > 
> > > > On some board there could be another device where you have a connector now.
> > > > 
> > > > As the connector has its own compatible string, there could be a connector
> > > > driver to tell this is actually a connector, even if there's nothing to
> > > > control. It'd be a very tiny driver.
> > > 
> > > Yes I know a connector driver would be the best. This also have the
> > > advantage to do drop the connector handling in each subdev driver.. But
> > > unfortunately I haven't the time yet. Would it be okay for you too check
> > > that the remote is a connector and if not to exit?
> > 
> > The current design is also problematic in the sense that it parses remote DT
> > graph endpoints (as well as device nodes) that are not under the device's
> > own scope.
> 
> You are right that is not good. Would it be okay with you to parse only
> the local node so the caller must pass the connector node?
> 
> > I wonder what kind of changes would that require, and how much more
> > difficult would the changes be to implement later on if a number of drivers
> > uses the newly added APIs.
> > 
> > v4l2_fwnode_parse_endpoint() should be considered as well. This is the
> > current API to parse endpoints. Could connectors be meaningfully parsed
> > within v4l2_fwnode_parse_endpoint()?
> 
> I think v4l2_fwnode_endpoint_parse() isn't the correct place. Of course
> it is a endpoint but I don't think that a connector should be placed
> there. Currently the endpoint is mostly used to describe the connection
> between the isp and a sensor. I think we shouldn't add something
> unrelated just because it's an fw-endpoint. The connector just describes
> who users can interact with the device. A connector isn't connected to a
> chip using mipi or something else.

If the endpoints pointing to a connector are not parsed by
v4l2_fwnode_endpoint_parse(), then it means that they're parsed somewhere
else, and that's something the caller needs to know. The fact that there is
a connector, is only apparent from the compatible string of the remote
device. That's simply not something for the caller to figure out.

Endpoints in general refer to other devices' connection points. It doesn't
matter what kind of a device it is, they should be treated the same way.

I'm still not proposing to mangle connectors with the bus properties. Still,
the two are mostly exclusive: if there's a connector, then any properties of
the signal likely have nothing to do what was described in the firmware.

How about adding an fwnode API function called e.g.g
v4l2_fwnode_is_connector(), to tell whether a given local endpoint is
connected to a remote which is a connector? That, I think, would be
sufficient to make the connectors vs. wired busses easy for drivers to work
with.

I think we'll probably have some naming rework coming up, for connectors,
too, are represented by endpoints. That's in-kernel only, too, so I'm not
worried. And to be postponed after this set obviously.

> 
> > What you're doing with connectors looks very much the same as what one would
> > do with async sub-devices, and if this is re-implemented for connectors,
> > there should be a good reason to do so.
> 
> I don't think that it has something to do with a async device because
> connectors shouldn't disappear so there is no need to probe it async.
> Also we shouldn't probe it async only because we can add a custom probe
> parse handler and furthermore we can't fill the connector struct..

There's indeed likely little to gain from using async sub-devices for the
connectors right now. If there would be more to do, then this probably
should be revisited.

-- 
Regards,

Sakari Ailus

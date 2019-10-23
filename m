Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE87E186C
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 12:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391006AbfJWK6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 06:58:15 -0400
Received: from mga02.intel.com ([134.134.136.20]:14401 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390486AbfJWK6P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 06:58:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 03:58:13 -0700
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="203925078"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 03:58:11 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3958B20D56; Wed, 23 Oct 2019 13:57:39 +0300 (EEST)
Date:   Wed, 23 Oct 2019 13:57:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, mchehab@kernel.org,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 03/14] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20191023105739.GN5433@paasikivi.fi.intel.com>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-4-m.felsch@pengutronix.de>
 <20191002070303.GK896@valkosipuli.retiisi.org.uk>
 <20191002080735.yyoxo5wg35t7k26x@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002080735.yyoxo5wg35t7k26x@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Apologies for the delay.

On Wed, Oct 02, 2019 at 10:07:35AM +0200, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-10-02 10:03, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Fri, Aug 30, 2019 at 12:16:35PM +0200, Marco Felsch wrote:
> > > The patch adds the initial connector parsing code, so we can move from a
> > > driver specific parsing code to a generic one. Currently only the
> > > generic fields and the analog-connector specific fields are parsed. Parsing
> > > the other connector specific fields can be added by a simple callbacks.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > [1] https://patchwork.kernel.org/cover/10794703/
> > > 
> > > v10:
> > > - drop V4L2_CONN_HDMI support
> > > - adapt pr_err msg to reflect new state (-> connector is unkown)
> > > 
> > > v9:
> > > - Fix leading semicolon found by kbuild semicolon.cocci
> > > 
> > > v8:
> > > - V4L2_CON_* -> V4L2_CONN_*
> > > - tvnorms -> sdtv-standards
> > > - adapt to new v4l2_fwnode_connector_analog member
> > > - return error in case of V4L2_CONN_HDMI
> > > 
> > > v7:
> > > @Jacopo: I dropped your r b tag becuase of the amount of changes I
> > > made..
> > > 
> > > - drop unnecessary comments
> > > - fix commet style
> > > - s/v4l2_fwnode_connector_conv.name/v4l2_fwnode_connector_conv.compatible/
> > > - make label size variable and drop V4L2_CONNECTOR_MAX_LABEL usage
> > > - do not assign a default label in case of no label was specified
> > > - remove useless /* fall through */ comments
> > > - add support for N connector links
> > > - rename local variables to be more meaningful
> > > - adjust kernedoc
> > > - add v4l2_fwnode_connector_free()
> > > - improve error handling (use different error values)
> > > - make use of pr_warn_once()
> > > 
> > > v6:
> > > - use unsigned count var
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
> > >  drivers/media/v4l2-core/v4l2-fwnode.c | 129 ++++++++++++++++++++++++++
> > >  include/media/v4l2-fwnode.h           |  38 ++++++++
> > >  2 files changed, 167 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index 3bd1888787eb..0bfa7cbf78df 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -595,6 +595,135 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
> > >  
> > > +static const struct v4l2_fwnode_connector_conv {
> > > +	enum v4l2_connector_type type;
> > > +	const char *compatible;
> > > +} connectors[] = {
> > > +	{
> > > +		.type = V4L2_CONN_COMPOSITE,
> > > +		.compatible = "composite-video-connector",
> > > +	}, {
> > > +		.type = V4L2_CONN_SVIDEO,
> > > +		.compatible = "svideo-connector",
> > > +	},
> > > +};
> > > +
> > > +static enum v4l2_connector_type
> > > +v4l2_fwnode_string_to_connector_type(const char *con_str)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(connectors); i++)
> > > +		if (!strcmp(con_str, connectors[i].compatible))
> > > +			return connectors[i].type;
> > > +
> > > +	return V4L2_CONN_UNKNOWN;
> > > +}
> > > +
> > > +static int
> > > +v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
> > > +				   struct v4l2_fwnode_connector *vc)
> > > +{
> > > +	u32 stds;
> > > +	int ret;
> > > +
> > > +	ret = fwnode_property_read_u32(fwnode, "sdtv-standards", &stds);
> > > +
> > > +	/* The property is optional. */
> > > +	vc->connector.analog.sdtv_stds = ret ? V4L2_STD_ALL : stds;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	if (IS_ERR_OR_NULL(connector))
> > > +		return;
> > > +
> > > +	for (i = 0; i < connector->nr_of_links; i++)
> > > +		v4l2_fwnode_put_link(&connector->links[i]);
> > > +	kfree(connector->links);
> > 
> > Please assign connector->links NULL here, and nr_of_links to zero.
> 
> Okay, I can do that.
> 
> > > +}
> > > +EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_free);
> > > +
> > > +int v4l2_fwnode_connector_alloc_parse(struct fwnode_handle *fwnode,
> > > +				      struct v4l2_fwnode_connector *connector)
> > > +{
> > > +	struct fwnode_handle *remote_pp, *remote_ep;
> > > +	const char *type_name;
> > > +	unsigned int i = 0, ep_num = 0;
> > > +	int err;
> > > +
> > > +	memset(connector, 0, sizeof(*connector));
> > > +
> > > +	remote_pp = fwnode_graph_get_remote_port_parent(fwnode);
> > 
> > How do you know a remote endpoint is a connector, and not another device's
> > endpoint?
> 
> Well, I think that the caller won't use this function if it isn't a
> connector. If it helps I can check if the compatible of the remote ends
> with "-connector".

The function is called by a driver. A driver shouldn't know what's at the
other end of the graph arc; the information should come from the firmware
instead.

On some board there could be another device where you have a connector now.

As the connector has its own compatible string, there could be a connector
driver to tell this is actually a connector, even if there's nothing to
control. It'd be a very tiny driver.

-- 
Regards,

Sakari Ailus

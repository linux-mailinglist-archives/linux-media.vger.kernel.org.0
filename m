Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EACE61CF08
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 20:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbfENS0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 14:26:00 -0400
Received: from casper.infradead.org ([85.118.1.10]:49352 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfENSZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 14:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FiTEv5Xpb6HD0E1z5CtCmF/4xNa61ZnY/DZ5zcyhTI4=; b=lzSAGTZngeOVR6wA3Ajxe+29EX
        rfM8HLddeDEsXnpcaYJW+e3zI4Ib1KXOIeRUt8/vcCnRXaSs8b6CAraBavxpq+qZZmAL9APrp40ss
        6THQ0b7BIG+V6yzANoDO0Hxl9r6CE4UY+a8m04FrliQw3qcsaKq2speiZdEH+HIaev1zugtE/NWs5
        Rda5//aDvciug+4TC1ry1R06tixw1dLnDotQhJDYtk12/KCBWYTrWW+VlVmhFTRRIeMBSfz2MVfWT
        mWYSGdsdNYBN6nqjR61XjSOWZLTYjHvEPUea2dnSit9fR5ywgSdH4xBIEaKs95E/QfAJa14LuN9F5
        TEMJ5bPw==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQc7b-0003wA-26; Tue, 14 May 2019 18:25:51 +0000
Date:   Tue, 14 May 2019 15:25:45 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v6 05/13] media: tvp5150: add input source selection
 of_graph support
Message-ID: <20190514152545.6020dcd8@coco.lan>
In-Reply-To: <20190415124413.18456-6-m.felsch@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190415124413.18456-6-m.felsch@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 15 Apr 2019 14:44:05 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> This patch adds the of_graph support to describe the tvp connections.
> Physical the TVP5150 has three ports: AIP1A, AIP1B and YOUT. As result
> of discussion [1],[2] the device-tree maps these ports 1:1. The svideo
> connector must be conneted to port@0/endpoint@1, look at the Documentation
> for more information. Since the TVP5150 is a converter the device-tree
> must contain at least 1-input and 1-output port. The mc-connectors and
> mc-links are only created if the device-tree contains the corresponding
> connector nodes. If more than one connector is available the
> media_entity_operations.link_setup() callback ensures that only one
> connector is active.
> 
> [1] https://www.spinics.net/lists/linux-media/msg138545.html
> [2] https://www.spinics.net/lists/linux-media/msg138546.html
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
> 
> [1] https://patchwork.kernel.org/cover/10794703/
> [2] https://patchwork.kernel.org/cover/10786553/
> 
> v6:
> - fix misspelled comments
> - use 'unsigned int' where it's possible
> - cleanup ifdef part-2:
>   - tvp5150_mc_init, tvp5150_add_of_connectors: add surrounding
>     CONFIG_MEDIA_CONTROLLER ifdef and stubs to improve readability
> - tvp5150_mc_init: uniform interface, use 'struct tvp5150' since all
>   internal function do this.
> - tvp5150_add_of_connectors: call within probe() to make it cleaner
> - tvp5150_parse_dt: move local loop vars within the loop.
> 
> v5:
> - Fixing build deps:
>   - tvp5150_mc_init: fix CONFIG_MEDIA_CONTROLLER deps
>   - struct tvp5150: drop CONFIG_MEDIA_CONTROLLER conditional property
>     includes. This leads into to complex deps for futher development.
>   - tvp5150_dt_cleanup: enable function only if CONFIG_OF is enabled
>   - tvp5150_parse_dt: enable function only if CONFIG_OF is enabled
>   - tvp5150_probe: call tvp5150_dt_cleanup only if CONFIG_OF is enabled
> 
> - Simplify link_setup routine:
>   - use generic connector parsing since both series [1,2] are squashed into
>     one
>   - struct tvp5150: drop pads_state and modify_second_link property
>     due to link_setup() rework.
>   - tvp5150_link_setup: add more comments
>   - tvp5150_link_setup: simply the link setup routine a lot. Edit the 2nd
>     link directly within the driver instead of a recursive media-framework
>     call (__media_entity_setup_link). This improves the readability and
>     shrinks the driver code.
>   - tvp5150_link_setup: disable all active links in case user switches
>     connectors without disable it first.
>   - tvp5150_registered: simplify default link enable path due to link_setup()
>     rework.
> 
> - General cleanups
>   - tvp5150_parse_dt: drop unecessary test
>   - tvp5150_parse_dt: add err message due to misconfiguration
>   - tvp5150_parse_dt: make use of V4L2_MBUS_UNKNOWN definition
>   - s/dev_dbg/dev_dbg_lvl
> 
> v4:
>  - rebase on top of media_tree/master, fix merge conflict due to commit
>    60359a28d592 ("media: v4l: fwnode: Initialise the V4L2 fwnode endpoints
>    to zero")
> 
> v3:
> - probe(): s/err/err_free_v4l2_ctrls
> - drop MC dependency for tvp5150_pads
> 
> v2:
> - adapt commit message
> - unify ifdef switches
> - rename tvp5150_valid_input -> tvp5150_of_valid_input, to be more precise
> - mc: use 2-input and 1-output pad
> - mc: link svideo connector to both input pads
> - mc: enable/disable svideo links in one go
> - mc: change link_setup() behaviour, switch the input src don't require a
>       explicite disable before.
> - mc: rename 'local' media_pad param to tvp5150_pad to avoid confusion
> - mc: enable link to the first available connector and set the
>       corresponding tvp5150 input src per default during registered()
> - mc/of: factor out oftree connector allocation
> - of: drop svideo dt port
> - of: move svideo connector to port@0/endpoint@1
> - of: require at least 1-in and 1-out endpoint
> 
>  drivers/media/i2c/tvp5150.c | 409 ++++++++++++++++++++++++++++++++----
>  1 file changed, 370 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 89da921c8886..4e3228b2ccbc 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -44,16 +44,29 @@ MODULE_PARM_DESC(debug, "Debug level (0-2)");
>  #define dprintk0(__dev, __arg...) dev_dbg_lvl(__dev, 0, 0, __arg)
>  
>  enum tvp5150_pads {
> -	TVP5150_PAD_IF_INPUT,
> +	TVP5150_PAD_AIP1A = TVP5150_COMPOSITE0,
> +	TVP5150_PAD_AIP1B,
>  	TVP5150_PAD_VID_OUT,
>  	TVP5150_NUM_PADS
>  };
>  
> +struct tvp5150_connector {
> +	struct v4l2_fwnode_connector base;
> +	struct media_entity ent;
> +	struct media_pad pad;
> +};
> +
>  struct tvp5150 {
>  	struct v4l2_subdev sd;
> -#ifdef CONFIG_MEDIA_CONTROLLER
> +	/* additional endpoint for the svideo connector */
> +	struct device_node *endpoints[TVP5150_NUM_PADS + 1];
> +	unsigned int endpoints_num;
> +
> +	/* media-ctl properties */
>  	struct media_pad pads[TVP5150_NUM_PADS];
> -#endif
> +	struct tvp5150_connector *connectors;
> +	int connectors_num;
> +
>  	struct v4l2_ctrl_handler hdl;
>  	struct v4l2_rect rect;
>  	struct regmap *regmap;
> @@ -1167,6 +1180,131 @@ static int tvp5150_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +/****************************************************************************
> + *			Media entity ops
> + ****************************************************************************/
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +static int tvp5150_set_link(struct media_pad *connector_pad,
> +			    struct media_pad *tvp5150_pad, u32 flags)
> +{
> +	struct media_link *link;
> +
> +	link = media_entity_find_link(connector_pad, tvp5150_pad);
> +	if (!link)
> +		return -EINVAL;
> +
> +	link->flags = flags;
> +	link->reverse->flags = link->flags;
> +
> +	return 0;
> +}
> +
> +static int tvp5150_disable_all_input_links(struct tvp5150 *decoder)
> +{
> +	struct media_pad *connector_pad;
> +	unsigned int i;
> +	int err;
> +
> +	for (i = 0; i < TVP5150_NUM_PADS - 1; i++) {
> +		connector_pad = media_entity_remote_pad(&decoder->pads[i]);
> +		if (!connector_pad)
> +			continue;
> +
> +		err = tvp5150_set_link(connector_pad, &decoder->pads[i], 0);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tvp5150_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
> +			     u32 config);
> +
> +static int tvp5150_link_setup(struct media_entity *entity,
> +			      const struct media_pad *tvp5150_pad,
> +			      const struct media_pad *remote, u32 flags)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	struct media_pad *other_tvp5150_pad =
> +		&decoder->pads[tvp5150_pad->index ^ 1];
> +	bool is_svideo = false;
> +	unsigned int i;
> +	int err;
> +
> +	/*
> +	 * The TVP5150 state is determined by the enabled sink pad link(s).
> +	 * Enabling or disabling the source pad link has no effect.
> +	 */
> +	if (tvp5150_pad->flags & MEDIA_PAD_FL_SOURCE)
> +		return 0;
> +
> +	/* Check if the svideo connector should be enabled */
> +	for (i = 0; i < decoder->connectors_num; i++) {
> +		if (remote->entity == &decoder->connectors[i].ent) {

> +			is_svideo =
> +			   decoder->connectors[i].base.type == V4L2_CON_SVIDEO;

Nitpick:

I would actually prefer to keep this on a single line. Ok, it will violate
the 80-columns, but it would be better than the above (IMHO).

> +			break;
> +		}
> +	}
> +
> +	dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
> +		    remote->entity->name, remote->index,
> +		    tvp5150_pad->entity->name, tvp5150_pad->index,
> +		    flags & MEDIA_LNK_FL_ENABLED);
> +	if (is_svideo)
> +		dev_dbg_lvl(sd->dev, 1, debug,
> +			    "link setup '%s':%d->'%s':%d[%d]",
> +			    remote->entity->name, remote->index,
> +			    other_tvp5150_pad->entity->name,
> +			    other_tvp5150_pad->index,
> +			    flags & MEDIA_LNK_FL_ENABLED);
> +
> +	/*
> +	 * The TVP5150 has an internal mux which allows the following setup:
> +	 *
> +	 * comp-connector1  --\
> +	 *		       |---> AIP1A
> +	 *		      /
> +	 * svideo-connector -|
> +	 *		      \
> +	 *		       |---> AIP1B
> +	 * comp-connector2  --/
> +	 *
> +	 * We can't rely on user space that the current connector gets disabled
> +	 * first before enabling the new connector. Disable all active
> +	 * connector links to be on the safe side.
> +	 */
> +	err = tvp5150_disable_all_input_links(decoder);
> +	if (err)
> +		return err;
> +
> +	tvp5150_s_routing(sd, is_svideo ? TVP5150_SVIDEO : tvp5150_pad->index,
> +			  flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
> +			  TVP5150_BLACK_SCREEN, 0);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {
> +		/*
> +		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
> +		 * Both links must be enabled in one-shot regardless which link
> +		 * the user requests.
> +		 */
> +		if (is_svideo) {
> +			err = tvp5150_set_link((struct media_pad *) remote,
> +					       other_tvp5150_pad, flags);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct media_entity_operations tvp5150_sd_media_ops = {
> +	.link_setup = tvp5150_link_setup,
> +};
> +#endif
>  /****************************************************************************
>  			I2C Command
>   ****************************************************************************/
> @@ -1314,6 +1452,65 @@ static int tvp5150_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
>  	return 0;
>  }
>  
> +static int tvp5150_registered(struct v4l2_subdev *sd)
> +{
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	struct tvp5150 *decoder = to_tvp5150(sd);
> +	unsigned int i;
> +	int ret;
> +
> +	/*
> +	 * Setup connector pads and links. Enable the link to the first
> +	 * available connector per default.
> +	 */
> +	for (i = 0; i < decoder->connectors_num; i++) {
> +		struct media_entity *con = &decoder->connectors[i].ent;
> +		struct media_pad *pad = &decoder->connectors[i].pad;
> +		unsigned int port = decoder->connectors[i].base.remote_port;
> +		bool is_svideo =
> +			decoder->connectors[i].base.type == V4L2_CON_SVIDEO;
> +		int flags = i ? 0 : MEDIA_LNK_FL_ENABLED;
> +
> +		pad->flags = MEDIA_PAD_FL_SOURCE;
> +		ret = media_entity_pads_init(con, 1, pad);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = media_device_register_entity(sd->v4l2_dev->mdev, con);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = media_create_pad_link(con, 0, &sd->entity, port, flags);
> +		if (ret < 0) {
> +			media_device_unregister_entity(con);
> +			return ret;
> +		}
> +
> +		if (is_svideo) {
> +			/* svideo links to both aip1a and aip1b */
> +			ret = media_create_pad_link(con, 0, &sd->entity,
> +						    port + 1, flags);
> +			if (ret < 0) {
> +				media_device_unregister_entity(con);
> +				return ret;
> +			}
> +		}
> +
> +		/* enable default input */
> +		if (flags == MEDIA_LNK_FL_ENABLED) {
> +			decoder->input =
> +				is_svideo ? TVP5150_SVIDEO :
> +				port == 0 ? TVP5150_COMPOSITE0 :
> +				TVP5150_COMPOSITE1;
> +
> +			tvp5150_selmux(sd);
> +		}
> +	}
> +#endif
> +	return 0;
> +}
> +
> +
>  /* ----------------------------------------------------------------------- */
>  
>  static const struct v4l2_ctrl_ops tvp5150_ctrl_ops = {
> @@ -1367,6 +1564,10 @@ static const struct v4l2_subdev_ops tvp5150_ops = {
>  	.pad = &tvp5150_pad_ops,
>  };
>  
> +static const struct v4l2_subdev_internal_ops tvp5150_internal_ops = {
> +	.registered = tvp5150_registered,
> +};
> +
>  /****************************************************************************
>  			I2C Client & Driver
>   ****************************************************************************/
> @@ -1515,38 +1716,168 @@ static int tvp5150_init(struct i2c_client *c)
>  	return 0;
>  }
>  
> -static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +static int tvp5150_add_of_connectors(struct tvp5150 *decoder)
>  {
> -	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> -	struct device_node *ep;
> -	unsigned int flags;
> -	int ret = 0;
> +	struct device *dev = decoder->sd.dev;
> +	struct tvp5150_connector *connectors;
> +	unsigned int connectors_num = decoder->connectors_num;
> +	int i, ret;
>  
> -	ep = of_graph_get_next_endpoint(np, NULL);
> -	if (!ep)
> -		return -EINVAL;
> +	/*
> +	 * Only add of_connectors if device really is a OF device since
> +	 * the driver is used by usb devices e.g. em28xx and embedded
> +	 * devices.
> +	 */
> +	if (!decoder->connectors_num)
> +		return 0;
>  
> -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
> -	if (ret)
> -		goto err;
> +	/* Allocate and initialize all available input connectors */
> +	connectors = devm_kcalloc(dev, connectors_num, sizeof(*connectors),
> +				  GFP_KERNEL);
> +	if (!connectors)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < connectors_num; i++) {
> +		struct v4l2_fwnode_connector *c = &connectors[i].base;
> +
> +		ret = v4l2_fwnode_parse_connector(
> +				   of_fwnode_handle(decoder->endpoints[i]), c);
> +
> +		connectors[i].ent.flags = MEDIA_ENT_FL_CONNECTOR;
> +		connectors[i].ent.function = c->type == V4L2_CON_SVIDEO ?
> +			MEDIA_ENT_F_CONN_SVIDEO : MEDIA_ENT_F_CONN_COMPOSITE;
> +		connectors[i].ent.name = c->label;
> +	}
> +
> +	decoder->connectors = connectors;
> +
> +	return 0;
> +}
> +
> +static int tvp5150_mc_init(struct tvp5150 *decoder)
> +{
> +	struct v4l2_subdev *sd = &decoder->sd;
> +	unsigned int i;
> +
> +	sd->entity.ops = &tvp5150_sd_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
> +
> +	/* Initialize all TVP5150 pads */
> +	for (i = 0; i < TVP5150_NUM_PADS; i++) {
> +		if (i < TVP5150_NUM_PADS - 1) {
> +			decoder->pads[i].flags = MEDIA_PAD_FL_SINK;
> +			decoder->pads[i].sig_type = PAD_SIGNAL_ANALOG;
> +		} else {
> +			decoder->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +			decoder->pads[i].sig_type = PAD_SIGNAL_DV;
> +		}
> +	}
> +
> +	return media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS,
> +				      decoder->pads);
> +}
> +
> +#else /* !defined(CONFIG_MEDIA_CONTROLLER) */
> +
> +static inline int tvp5150_add_of_connectors(struct tvp5150 *decoder)
> +{
> +	return 0;
> +}
>  
> -	flags = bus_cfg.bus.parallel.flags;
> +static inline int tvp5150_mc_init(struct tvp5150 *decoder)
> +{
> +	return 0;
> +}
> +#endif /* defined(CONFIG_MEDIA_CONTROLLER) */
>  
> -	if (bus_cfg.bus_type == V4L2_MBUS_PARALLEL &&
> -	    !(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH &&
> -	      flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH &&
> -	      flags & V4L2_MBUS_FIELD_EVEN_LOW)) {
> +static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
> +{
> +	struct device *dev = decoder->sd.dev;
> +	struct device_node *ep_np;
> +	unsigned int i = 0, in = 0;
> +	int ret;
> +	bool found = false;
> +
> +	/* at least 1 output and 1 input */
> +	decoder->endpoints_num = of_graph_get_endpoint_count(np);
> +	if (decoder->endpoints_num < 2 || decoder->endpoints_num > 4) {
> +		dev_err(dev, "At least 1 input and 1 output must be connected to the device.\n");
>  		ret = -EINVAL;
>  		goto err;
>  	}
>  
> -	decoder->mbus_type = bus_cfg.bus_type;
> +	for_each_endpoint_of_node(np, ep_np) {
> +		struct v4l2_fwnode_endpoint bus_cfg = {
> +			.bus_type = V4L2_MBUS_UNKNOWN
> +		};
> +		struct v4l2_fwnode_connector c;
> +		struct of_endpoint ep;
> +		unsigned int flags;
> +
> +		of_graph_parse_endpoint(ep_np, &ep);
> +		switch (ep.port) {
> +		case TVP5150_PAD_AIP1A:
> +			/* fall through */
> +		case TVP5150_PAD_AIP1B:
> +			ret = v4l2_fwnode_parse_connector(
> +						   of_fwnode_handle(ep_np), &c);
> +			if (c.type != V4L2_CON_COMPOSITE &&
> +			    c.type != V4L2_CON_SVIDEO) {
> +				dev_err(dev,
> +					"Invalid endpoint %d on port %d\n",
> +					c.remote_id, c.remote_port);
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +			in++;
> +			break;
> +		case TVP5150_PAD_VID_OUT:
> +			ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_np),
> +							 &bus_cfg);
> +			if (ret)
> +				goto err;
> +
> +			flags = bus_cfg.bus.parallel.flags;
> +
> +			if (bus_cfg.bus_type == V4L2_MBUS_PARALLEL &&
> +			    !(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH &&
> +			      flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH &&
> +			      flags & V4L2_MBUS_FIELD_EVEN_LOW)) {
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +
> +			decoder->mbus_type = bus_cfg.bus_type;
> +			break;
> +		default:
> +			dev_err(dev, "Invalid port %d for endpoint %pOF\n",
> +				ep.port, ep.local_node);
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		of_node_get(ep_np);
> +		decoder->endpoints[i] = ep_np;
> +		i++;
> +
> +		found = true;
> +	}
>  
> +	decoder->connectors_num = in;
> +	return found ? 0 : -ENODEV;
>  err:
> -	of_node_put(ep);
>  	return ret;
>  }
>  
> +static void tvp5150_dt_cleanup(struct tvp5150 *decoder)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < TVP5150_NUM_PADS; i++)
> +		of_node_put(decoder->endpoints[i]);
> +}
> +
>  static const char * const tvp5150_test_patterns[2] = {
>  	"Disabled",
>  	"Black screen"
> @@ -1585,7 +1916,7 @@ static int tvp5150_probe(struct i2c_client *c,
>  		res = tvp5150_parse_dt(core, np);
>  		if (res) {
>  			dev_err(sd->dev, "DT parsing error: %d\n", res);
> -			return res;
> +			goto err_cleanup_dt;
>  		}
>  	} else {
>  		/* Default to BT.656 embedded sync */
> @@ -1593,25 +1924,20 @@ static int tvp5150_probe(struct i2c_client *c,
>  	}
>  
>  	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> +	sd->internal_ops = &tvp5150_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
> -#if defined(CONFIG_MEDIA_CONTROLLER)
> -	core->pads[TVP5150_PAD_IF_INPUT].flags = MEDIA_PAD_FL_SINK;
> -	core->pads[TVP5150_PAD_IF_INPUT].sig_type = PAD_SIGNAL_ANALOG;
> -	core->pads[TVP5150_PAD_VID_OUT].flags = MEDIA_PAD_FL_SOURCE;
> -	core->pads[TVP5150_PAD_VID_OUT].sig_type = PAD_SIGNAL_DV;
> -
> -	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
> -
> -	res = media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS, core->pads);
> -	if (res < 0)
> -		return res;
> +	res = tvp5150_mc_init(core);
> +	if (res)
> +		goto err_cleanup_dt;
>  
> -#endif
> +	res = tvp5150_add_of_connectors(core);
> +	if (res)
> +		goto err_cleanup_dt;
>  
>  	res = tvp5150_detect_version(core);
>  	if (res < 0)
> -		return res;
> +		goto err_cleanup_dt;
>  
>  	core->norm = V4L2_STD_ALL;	/* Default is autodetect */
>  	core->detected_norm = V4L2_STD_UNKNOWN;
> @@ -1637,7 +1963,7 @@ static int tvp5150_probe(struct i2c_client *c,
>  	sd->ctrl_handler = &core->hdl;
>  	if (core->hdl.error) {
>  		res = core->hdl.error;
> -		goto err;
> +		goto err_free_v4l2_ctrls;
>  	}
>  
>  	tvp5150_set_default(tvp5150_read_std(sd), &core->rect);
> @@ -1649,19 +1975,24 @@ static int tvp5150_probe(struct i2c_client *c,
>  						tvp5150_isr, IRQF_TRIGGER_HIGH |
>  						IRQF_ONESHOT, "tvp5150", core);
>  		if (res)
> -			goto err;
> +			goto err_free_v4l2_ctrls;
>  	}
>  
>  	res = v4l2_async_register_subdev(sd);
>  	if (res < 0)
> -		goto err;
> +		goto err_free_v4l2_ctrls;
>  
>  	if (debug > 1)
>  		tvp5150_log_status(sd);
> +
>  	return 0;
>  
> -err:
> +err_free_v4l2_ctrls:
>  	v4l2_ctrl_handler_free(&core->hdl);
> +err_cleanup_dt:
> +	if (IS_ENABLED(CONFIG_OF) && np)
> +		tvp5150_dt_cleanup(core);
> +
>  	return res;
>  }
>  



Thanks,
Mauro

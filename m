Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169511482E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfEFKIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:08:53 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:60805 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfEFKIw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 06:08:52 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D8CF24001F;
        Mon,  6 May 2019 10:08:44 +0000 (UTC)
Date:   Mon, 6 May 2019 12:09:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 05/13] media: tvp5150: add input source selection
 of_graph support
Message-ID: <20190506100939.pyjnmc5jqyrfexdf@uno.localdomain>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-6-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="av6bjzwu7nupzdn3"
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-6-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--av6bjzwu7nupzdn3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,
   thanks, I still have a few more suggestions, but they're minors,
feel free to pick what you consider more appropriate.

On Mon, Apr 15, 2019 at 02:44:05PM +0200, Marco Felsch wrote:
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

Does this imply when you enable a link to comp-connector2 the existing
link on comp-connector1 gets disabled? Is this desirable? Shouldn't
you do this only when dealing with s-video ?

> +	if (err)
> +		return err;
> +
> +	tvp5150_s_routing(sd, is_svideo ? TVP5150_SVIDEO : tvp5150_pad->index,
> +			  flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
> +			  TVP5150_BLACK_SCREEN, 0);
> +
> +	if (flags & MEDIA_LNK_FL_ENABLED) {

nit: you could check for is_video here.

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

Additional blank linke maybe?

> +	return 0;
> +}
> +

Double empty line.

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

i can be unsigned, and as noted below, you can remove ret.

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

You never use ret, drop it or check for the return value.

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

Nit:
I would loop up to NUM_PADS - 1 and initialize the only source pad
separately. Up to you.

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

Could you declare this inside the case block that actually uses it?

> +		struct v4l2_fwnode_connector c;

Same here

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

Couldn't you increment decoder->num_connectors here?

Also, I really think you should not re-parse the connctor with a
separate tvp5150_add_of_connectors() call later. You can have up to
two connectors, I would say just allocate both of them and use the
appropriate ones.

It would save you the need to keep track of the endpoints in
'decoder->endpoints[]' which now you have to manually free at a later time
with a call to dt_cleanup(). You would also save parsing the connector
twice.

I would say this is up to you, this is not wrong, just harder to
follow.

With the minor issues reported above fixed:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

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
> --
> 2.20.1
>

--av6bjzwu7nupzdn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzQB9kACgkQcjQGjxah
Vjw9bRAAq99zHqfjiYTdqk9jPPNYK2I6YdWhtDLvPhgNHzk8t8Mhm8d4/b++4izs
kK/7ufXUZMC09fzpA4HT/koyVf1wJ6qVV+qeIFjNQr0jclpBhjj6+QO7H9L/rbtD
97377kcIKlyoW+llA3q/Mhw8ax4P9fCnaHmCJMw84Y+4Y3dS/m0Y9OKjLjbLCAgY
nvQIBjDE7SvVYoIX0YROd6m5I+mRouYhqVaqlctoIVeSKciUhh/5MVaCpKUXuZiE
MVn3LLNI6yr+QB67OrkNQjjPYa0WCn3KVMdDgrkIEiXHncPDRrgSfjRP4x2wjjTj
SFNQwTHohJDg+yjHRLobQlWEw7bdC8vL8vHZiFSgNoKshHeJlrLbYgGgWRPEDhC1
17vHtZE6POTmeMN7Q0Aj2X2e1IFMTPjVBFf9s5rZSpyU2GHgGKE2U1Fzv4i0ZqQj
8/1gKnNDyZs27/RpsEdhtwvu4aRPvmIVTwdVzHepC4ZQgc85oBcL2Ot3ZxSBjP24
6ZAWgk6/IE8aaeBAvWwcWKzsrEqlhP5sU6hgU+Decc/smS9O5r63PhTJjMvvkDG+
70IjIHq+fZUUn342x2TlPNsGC65P1uxYlZct4vbcPVoqqQ3NArXRu0KtJRYOd67F
Pa1HaKvG6we7vrGfW/XJymIM1kh5X3Qmc6wKIAM8bPOaH7MPPUs=
=/lm0
-----END PGP SIGNATURE-----

--av6bjzwu7nupzdn3--

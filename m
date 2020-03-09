Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 934AA17DD2B
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgCIKO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42587 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgCIKOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:48 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQm-0003mb-Nw; Mon, 09 Mar 2020 11:14:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lz-Pq; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 08/19] media: tvp5150: add input source selection of_graph support
Date:   Mon,  9 Mar 2020 11:14:17 +0100
Message-Id: <20200309101428.15267-9-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds the of_graph support to describe the tvp input connections.
Physical the TVP5150 has three ports: AIP1A, AIP1B and YOUT. As result
of discussion [1],[2] the device-tree maps these ports 1:1. Look at the
Documentation for more information. Since the TVP5150 is a converter/bridge
the device-tree must contain at least 1-input and 1-output port. The
mc-connectors and mc-links are only created if the device-tree contains the
corresponding connector nodes. If more than one connector is available the
media_entity_operations.link_setup() callback ensures that only one
connector is active.

[1] https://www.spinics.net/lists/linux-media/msg138545.html
[2] https://www.spinics.net/lists/linux-media/msg138546.html

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

---
Changelog:

[1] https://patchwork.kernel.org/cover/10794703/
[2] https://patchwork.kernel.org/cover/10786553/

v12:
- remove duplicated connector name assignment
- make v4l2_fwnode_connector variable names unqiue
- convert to new v4l2-fwnode helpers
  - drop tvp5150_add_connector() and use v4l2-fwnode helpers directly
    within tvp5150_parse_dt()
  - Add new tvp5150_validate_connectors()
- add v4l2_fwnode_connector_free() and media_device_unregister_entity()
  to remove() to fix memory leak

v11:
- add local struct v4l2_fwnode_connector *v4lc to address 'over 80
  characters' warning
- fix casting style issue

v8:
- fix rebasing issue
- fix error handling during tvp5150_registered()
- adapt to new v4l2_connector_type enum

v7:
- don't init enum tvp5150_pads with TVP5150_COMPOSITE0 functionality
- break some 80 character limitation to improve readability
- fix comment style -> always start with capital letters and end with dot
- fix some minor style issues
- fix tvp5150_registered error handling
- simplify tvp5150_mc_init
- make connectors static
  -> since now only three connectors are possible (as described in DT)
  -> drop tvp5150.endpoints storage
  -> squash tvp5150_parse_dt and tvp5150_add_of_connectors
- improve tvp5150_parse_dt:
  -> make parsing stricter and fix not detected missconfigured dt-data
  -> svideo must be connected now to port@[0,1]/endpoint@1

v6:
- fix misspelled comments
- use 'unsigned int' where it's possible
- cleanup ifdef part-2:
  * tvp5150_mc_init, tvp5150_add_of_connectors: add surrounding
    CONFIG_MEDIA_CONTROLLER if def and stubs to improve quality
- tvp5150_mc_init: uniform interface, use 'struct tvp5150' since all
  internal function do this.
- tvp5150_add_of_connectors: call within probe() to make it cleaner
- tvp5150_parse_dt: move local loop vars within the loop.

v5:
- Fixing build deps:
  - tvp5150_mc_init: fix CONFIG_MEDIA_CONTROLLER deps
  - struct tvp5150: drop CONFIG_MEDIA_CONTROLLER conditional property
    includes. This leads into to complex deps for futher development.
  - tvp5150_dt_cleanup: enable function only if CONFIG_OF is enabled
  - tvp5150_parse_dt: enable function only if CONFIG_OF is enabled
  - tvp5150_probe: call tvp5150_dt_cleanup only if CONFIG_OF is enabled

- Simplify link_setup routine:
  - use generic connector parsing since both series [1,2] are squashed into
    one
  - struct tvp5150: drop pads_state and modify_second_link property
    due to link_setup() rework.
  - tvp5150_link_setup: add more comments
  - tvp5150_link_setup: simply the link setup routine a lot. Edit the 2nd
    link directly within the driver instead of a recursive media-framework
    call (__media_entity_setup_link). This improves the readability and
    shrinks the driver code.
  - tvp5150_link_setup: disable all active links in case user switches
    connectors without disable it first.
  - tvp5150_registered: simplify default link enable path due to link_setup()
    rework.

- General cleanups
  - tvp5150_parse_dt: drop unecessary test
  - tvp5150_parse_dt: add err message due to misconfiguration
  - tvp5150_parse_dt: make use of V4L2_MBUS_UNKNOWN definition
  - s/dev_dbg/dev_dbg_lvl

v4:
 - rebase on top of media_tree/master, fix merge conflict due to commit
   60359a28d592 ("media: v4l: fwnode: Initialise the V4L2 fwnode endpoints
   to zero")

v3:
- probe(): s/err/err_free_v4l2_ctrls
- drop MC dependency for tvp5150_pads

v2:
- adapt commit message
- unify ifdef switches
- rename tvp5150_valid_input -> tvp5150_of_valid_input, to be more precise
- mc: use 2-input and 1-output pad
- mc: link svideo connector to both input pads
- mc: enable/disable svideo links in one go
- mc: change link_setup() behaviour, switch the input src don't require a
      explicite disable before.
- mc: rename 'local' media_pad param to tvp5150_pad to avoid confusion
- mc: enable link to the first available connector and set the
      corresponding tvp5150 input src per default during registered()
- mc/of: factor out oftree connector allocation
- of: drop svideo dt port
- of: move svideo connector to port@0/endpoint@1
- of: require at least 1-in and 1-out endpoint

squash! media: tvp5150: add input source selection of_graph support

v12:
- fix remove path: delete possible media-entities
---
 drivers/media/i2c/tvp5150.c | 431 +++++++++++++++++++++++++++++++++---
 1 file changed, 404 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 11a5fd7e2f58..90d4fd47f80d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -32,6 +32,8 @@
 #define TVP5150_FIELD		V4L2_FIELD_ALTERNATE
 #define TVP5150_COLORSPACE	V4L2_COLORSPACE_SMPTE170M
 
+#define TVP5150_MAX_CONNECTORS	3 /* Check dt-bindings for more information */
+
 MODULE_DESCRIPTION("Texas Instruments TVP5150A/TVP5150AM1/TVP5151 video decoder driver");
 MODULE_AUTHOR("Mauro Carvalho Chehab");
 MODULE_LICENSE("GPL v2");
@@ -44,16 +46,25 @@ MODULE_PARM_DESC(debug, "Debug level (0-2)");
 #define dprintk0(__dev, __arg...) dev_dbg_lvl(__dev, 0, 0, __arg)
 
 enum tvp5150_pads {
-	TVP5150_PAD_IF_INPUT,
+	TVP5150_PAD_AIP1A,
+	TVP5150_PAD_AIP1B,
 	TVP5150_PAD_VID_OUT,
 	TVP5150_NUM_PADS
 };
 
+struct tvp5150_connector {
+	struct v4l2_fwnode_connector base;
+	struct media_entity ent;
+	struct media_pad pad;
+};
+
 struct tvp5150 {
 	struct v4l2_subdev sd;
-#ifdef CONFIG_MEDIA_CONTROLLER
+
 	struct media_pad pads[TVP5150_NUM_PADS];
-#endif
+	struct tvp5150_connector connectors[TVP5150_MAX_CONNECTORS];
+	unsigned int connectors_num;
+
 	struct v4l2_ctrl_handler hdl;
 	struct v4l2_rect rect;
 	struct regmap *regmap;
@@ -1167,6 +1178,132 @@ static int tvp5150_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/****************************************************************************
+ *			Media entity ops
+ ****************************************************************************/
+#if defined(CONFIG_MEDIA_CONTROLLER)
+static int tvp5150_set_link(struct media_pad *connector_pad,
+			    struct media_pad *tvp5150_pad, u32 flags)
+{
+	struct media_link *link;
+
+	link = media_entity_find_link(connector_pad, tvp5150_pad);
+	if (!link)
+		return -EINVAL;
+
+	link->flags = flags;
+	link->reverse->flags = link->flags;
+
+	return 0;
+}
+
+static int tvp5150_disable_all_input_links(struct tvp5150 *decoder)
+{
+	struct media_pad *connector_pad;
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < TVP5150_NUM_PADS - 1; i++) {
+		connector_pad = media_entity_remote_pad(&decoder->pads[i]);
+		if (!connector_pad)
+			continue;
+
+		err = tvp5150_set_link(connector_pad, &decoder->pads[i], 0);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int tvp5150_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
+			     u32 config);
+
+static int tvp5150_link_setup(struct media_entity *entity,
+			      const struct media_pad *tvp5150_pad,
+			      const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	struct media_pad *other_tvp5150_pad =
+		&decoder->pads[tvp5150_pad->index ^ 1];
+	struct v4l2_fwnode_connector *v4l2c;
+	bool is_svideo = false;
+	unsigned int i;
+	int err;
+
+	/*
+	 * The TVP5150 state is determined by the enabled sink pad link(s).
+	 * Enabling or disabling the source pad link has no effect.
+	 */
+	if (tvp5150_pad->flags & MEDIA_PAD_FL_SOURCE)
+		return 0;
+
+	/* Check if the svideo connector should be enabled */
+	for (i = 0; i < decoder->connectors_num; i++) {
+		if (remote->entity == &decoder->connectors[i].ent) {
+			v4l2c = &decoder->connectors[i].base;
+			is_svideo = v4l2c->type == V4L2_CONN_SVIDEO;
+			break;
+		}
+	}
+
+	dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
+		    remote->entity->name, remote->index,
+		    tvp5150_pad->entity->name, tvp5150_pad->index,
+		    flags & MEDIA_LNK_FL_ENABLED);
+	if (is_svideo)
+		dev_dbg_lvl(sd->dev, 1, debug,
+			    "link setup '%s':%d->'%s':%d[%d]",
+			    remote->entity->name, remote->index,
+			    other_tvp5150_pad->entity->name,
+			    other_tvp5150_pad->index,
+			    flags & MEDIA_LNK_FL_ENABLED);
+
+	/*
+	 * The TVP5150 has an internal mux which allows the following setup:
+	 *
+	 * comp-connector1  --\
+	 *		       |---> AIP1A
+	 *		      /
+	 * svideo-connector -|
+	 *		      \
+	 *		       |---> AIP1B
+	 * comp-connector2  --/
+	 *
+	 * We can't rely on user space that the current connector gets disabled
+	 * first before enabling the new connector. Disable all active
+	 * connector links to be on the safe side.
+	 */
+	err = tvp5150_disable_all_input_links(decoder);
+	if (err)
+		return err;
+
+	tvp5150_s_routing(sd, is_svideo ? TVP5150_SVIDEO : tvp5150_pad->index,
+			  flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
+			  TVP5150_BLACK_SCREEN, 0);
+
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		/*
+		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
+		 * Both links must be enabled in one-shot regardless which link
+		 * the user requests.
+		 */
+		if (is_svideo) {
+			err = tvp5150_set_link((struct media_pad *)remote,
+					       other_tvp5150_pad, flags);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tvp5150_sd_media_ops = {
+	.link_setup = tvp5150_link_setup,
+};
+#endif
 /****************************************************************************
 			I2C Command
  ****************************************************************************/
@@ -1314,6 +1451,76 @@ static int tvp5150_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 	return 0;
 }
 
+static int tvp5150_registered(struct v4l2_subdev *sd)
+{
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Setup connector pads and links. Enable the link to the first
+	 * available connector per default.
+	 */
+	for (i = 0; i < decoder->connectors_num; i++) {
+		struct media_entity *con = &decoder->connectors[i].ent;
+		struct media_pad *pad = &decoder->connectors[i].pad;
+		struct v4l2_fwnode_connector *v4l2c =
+			&decoder->connectors[i].base;
+		struct v4l2_connector_link *link =
+			v4l2_connector_first_link(v4l2c);
+		unsigned int port = link->fwnode_link.remote_port;
+		unsigned int flags = i ? 0 : MEDIA_LNK_FL_ENABLED;
+		bool is_svideo = v4l2c->type == V4L2_CONN_SVIDEO;
+
+		pad->flags = MEDIA_PAD_FL_SOURCE;
+		ret = media_entity_pads_init(con, 1, pad);
+		if (ret < 0)
+			goto err;
+
+		ret = media_device_register_entity(sd->v4l2_dev->mdev, con);
+		if (ret < 0)
+			goto err;
+
+		ret = media_create_pad_link(con, 0, &sd->entity, port, flags);
+		if (ret < 0)
+			goto err;
+
+		if (is_svideo) {
+			/*
+			 * Check tvp5150_link_setup() comments for more
+			 * information.
+			 */
+			link = v4l2_connector_last_link(v4l2c);
+			port = link->fwnode_link.remote_port;
+			ret = media_create_pad_link(con, 0, &sd->entity, port,
+						    flags);
+			if (ret < 0)
+				goto err;
+		}
+
+		/* Enable default input. */
+		if (flags == MEDIA_LNK_FL_ENABLED) {
+			decoder->input =
+				is_svideo ? TVP5150_SVIDEO :
+				port == 0 ? TVP5150_COMPOSITE0 :
+				TVP5150_COMPOSITE1;
+
+			tvp5150_selmux(sd);
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = 0; i < decoder->connectors_num; i++)
+		media_device_unregister_entity(&decoder->connectors[i].ent);
+	return ret;
+#endif
+
+	return 0;
+}
+
 /* ----------------------------------------------------------------------- */
 
 static const struct v4l2_ctrl_ops tvp5150_ctrl_ops = {
@@ -1367,6 +1574,10 @@ static const struct v4l2_subdev_ops tvp5150_ops = {
 	.pad = &tvp5150_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops tvp5150_internal_ops = {
+	.registered = tvp5150_registered,
+};
+
 /****************************************************************************
 			I2C Client & Driver
  ****************************************************************************/
@@ -1515,35 +1726,205 @@ static int tvp5150_init(struct i2c_client *c)
 	return 0;
 }
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+static int tvp5150_mc_init(struct tvp5150 *decoder)
+{
+	struct v4l2_subdev *sd = &decoder->sd;
+	unsigned int i;
+
+	sd->entity.ops = &tvp5150_sd_media_ops;
+	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
+
+	for (i = 0; i < TVP5150_NUM_PADS - 1; i++) {
+		decoder->pads[i].flags = MEDIA_PAD_FL_SINK;
+		decoder->pads[i].sig_type = PAD_SIGNAL_ANALOG;
+	}
+
+	decoder->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+	decoder->pads[i].sig_type = PAD_SIGNAL_DV;
+
+	return media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS,
+				      decoder->pads);
+}
+
+#else /* !defined(CONFIG_MEDIA_CONTROLLER) */
+
+static inline int tvp5150_mc_init(struct tvp5150 *decoder)
+{
+	return 0;
+}
+#endif /* defined(CONFIG_MEDIA_CONTROLLER) */
+
+static int tvp5150_validate_connectors(struct tvp5150 *decoder)
+{
+	struct device *dev = decoder->sd.dev;
+	struct tvp5150_connector *tvpc;
+	struct v4l2_fwnode_connector *v4l2c;
+	unsigned int i;
+
+	if (!decoder->connectors_num) {
+		dev_err(dev, "No valid connector found\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < decoder->connectors_num; i++) {
+		struct v4l2_connector_link *link0 = NULL;
+		struct v4l2_connector_link *link1;
+
+		tvpc = &decoder->connectors[i];
+		v4l2c = &tvpc->base;
+
+		if (v4l2c->type == V4L2_CONN_COMPOSITE) {
+			if (v4l2c->nr_of_links != 1) {
+				dev_err(dev, "Composite: connector needs 1 link\n");
+				return -EINVAL;
+			}
+			link0 = v4l2_connector_first_link(v4l2c);
+			if (!link0) {
+				dev_err(dev, "Composite: invalid first link\n");
+				return -EINVAL;
+			}
+			if (link0->fwnode_link.remote_id == 1) {
+				dev_err(dev, "Composite: invalid endpoint id\n");
+				return -EINVAL;
+			}
+		}
+
+		if (v4l2c->type == V4L2_CONN_SVIDEO) {
+			if (v4l2c->nr_of_links != 2) {
+				dev_err(dev, "SVideo: connector needs 2 links\n");
+				return -EINVAL;
+			}
+			link0 = v4l2_connector_first_link(v4l2c);
+			if (!link0) {
+				dev_err(dev, "SVideo: invalid first link\n");
+				return -EINVAL;
+			}
+			link1 = v4l2_connector_last_link(v4l2c);
+			if (link0->fwnode_link.remote_port ==
+			    link1->fwnode_link.remote_port) {
+				dev_err(dev, "SVideo: invalid link setup\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int tvp5150_parse_dt(struct tvp5150 *decoder, struct device_node *np)
 {
-	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
-	struct device_node *ep;
-	unsigned int flags;
-	int ret = 0;
+	struct device *dev = decoder->sd.dev;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_UNKNOWN
+	};
+	struct device_node *ep_np;
+	struct tvp5150_connector *tvpc;
+	struct v4l2_fwnode_connector *v4l2c;
+	unsigned int flags, ep_num;
+	unsigned int i;
+	int ret;
 
-	ep = of_graph_get_next_endpoint(np, NULL);
-	if (!ep)
+	/* At least 1 output and 1 input */
+	ep_num = of_graph_get_endpoint_count(np);
+	if (ep_num < 2 || ep_num > 5) {
+		dev_err(dev, "At least 1 input and 1 output must be connected to the device.\n");
 		return -EINVAL;
+	}
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
+	/* Layout if all connectors are used:
+	 *
+	 * tvp-5150 port@0 (AIP1A)
+	 *	endpoint@0 -----------> Comp0-Con  port
+	 *	endpoint@1 --------+--> Svideo-Con port
+	 * tvp-5150 port@1 (AIP1B) |
+	 *	endpoint@1 --------+
+	 *	endpoint@0 -----------> Comp1-Con  port
+	 * tvp-5150 port@2
+	 *	endpoint (video bitstream output at YOUT[0-7] parallel bus)
+	 */
+	for_each_endpoint_of_node(np, ep_np) {
+		struct fwnode_handle *ep_fwnode = of_fwnode_handle(ep_np);
+		unsigned int next_connector = decoder->connectors_num;
+		struct of_endpoint ep;
+
+		of_graph_parse_endpoint(ep_np, &ep);
+		if (ep.port > 1 || ep.id > 1) {
+			dev_dbg(dev, "Ignore connector on port@%u/ep@%u\n",
+				ep.port, ep.id);
+			continue;
+		}
+
+		tvpc = &decoder->connectors[next_connector];
+		v4l2c = &tvpc->base;
+
+		if (ep.port == 0 || (ep.port == 1 && ep.id == 0)) {
+			ret = v4l2_fwnode_connector_parse(ep_fwnode, v4l2c);
+			if (ret)
+				goto err_put;
+			ret = v4l2_fwnode_connector_add_link(ep_fwnode, v4l2c);
+			if (ret)
+				goto err_put;
+			decoder->connectors_num++;
+		} else {
+			/* Adding the 2nd svideo link */
+			for (i = 0; i < TVP5150_MAX_CONNECTORS; i++) {
+				tvpc = &decoder->connectors[i];
+				v4l2c = &tvpc->base;
+				if (v4l2c->type == V4L2_CONN_SVIDEO)
+					break;
+			}
+
+			ret = v4l2_fwnode_connector_add_link(ep_fwnode, v4l2c);
+			if (ret)
+				goto err_put;
+		}
+	}
+
+	ret = tvp5150_validate_connectors(decoder);
 	if (ret)
-		goto err;
+		goto err_free;
+
+	for (i = 0; i < decoder->connectors_num; i++) {
+		tvpc = &decoder->connectors[i];
+		v4l2c = &tvpc->base;
+		tvpc->ent.flags = MEDIA_ENT_FL_CONNECTOR;
+		tvpc->ent.function = v4l2c->type == V4L2_CONN_SVIDEO ?
+			MEDIA_ENT_F_CONN_SVIDEO : MEDIA_ENT_F_CONN_COMPOSITE;
+		tvpc->ent.name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						v4l2c->name, v4l2c->label ?
+						v4l2c->label : "");
+	}
 
-	flags = bus_cfg.bus.parallel.flags;
+	ep_np = of_graph_get_endpoint_by_regs(np, TVP5150_PAD_VID_OUT, 0);
+	if (!ep_np) {
+		dev_err(dev, "Error no output endpoint available\n");
+		goto err_free;
+	}
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_np), &bus_cfg);
+	of_node_put(ep_np);
+	if (ret)
+		goto err_free;
 
+	flags = bus_cfg.bus.parallel.flags;
 	if (bus_cfg.bus_type == V4L2_MBUS_PARALLEL &&
 	    !(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH &&
 	      flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH &&
 	      flags & V4L2_MBUS_FIELD_EVEN_LOW)) {
 		ret = -EINVAL;
-		goto err;
+		goto err_free;
 	}
 
 	decoder->mbus_type = bus_cfg.bus_type;
 
-err:
-	of_node_put(ep);
+	return 0;
+
+err_put:
+	of_node_put(ep_np);
+err_free:
+	for (i = 0; i < TVP5150_MAX_CONNECTORS; i++)
+		v4l2_fwnode_connector_free(&decoder->connectors[i].base);
+
 	return ret;
 }
 
@@ -1592,22 +1973,13 @@ static int tvp5150_probe(struct i2c_client *c)
 	}
 
 	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
+	sd->internal_ops = &tvp5150_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-#if defined(CONFIG_MEDIA_CONTROLLER)
-	core->pads[TVP5150_PAD_IF_INPUT].flags = MEDIA_PAD_FL_SINK;
-	core->pads[TVP5150_PAD_IF_INPUT].sig_type = PAD_SIGNAL_ANALOG;
-	core->pads[TVP5150_PAD_VID_OUT].flags = MEDIA_PAD_FL_SOURCE;
-	core->pads[TVP5150_PAD_VID_OUT].sig_type = PAD_SIGNAL_DV;
-
-	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;
-
-	res = media_entity_pads_init(&sd->entity, TVP5150_NUM_PADS, core->pads);
-	if (res < 0)
+	res = tvp5150_mc_init(core);
+	if (res)
 		return res;
 
-#endif
-
 	res = tvp5150_detect_version(core);
 	if (res < 0)
 		return res;
@@ -1668,11 +2040,16 @@ static int tvp5150_remove(struct i2c_client *c)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(c);
 	struct tvp5150 *decoder = to_tvp5150(sd);
+	unsigned int i;
 
 	dev_dbg_lvl(sd->dev, 1, debug,
 		"tvp5150.c: removing tvp5150 adapter on address 0x%x\n",
 		c->addr << 1);
 
+	for (i = 0; i < decoder->connectors_num; i++)
+		v4l2_fwnode_connector_free(&decoder->connectors[i].base);
+	for (i = 0; i < decoder->connectors_num; i++)
+		media_device_unregister_entity(&decoder->connectors[i].ent);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&decoder->hdl);
 	return 0;
-- 
2.20.1


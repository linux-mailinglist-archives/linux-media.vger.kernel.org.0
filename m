Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633AB17DD21
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgCIKOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37821 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgCIKOw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:52 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mW-6P; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lt-Nr; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 06/19] media: v4l2-fwnode: add initial connector parsing support
Date:   Mon,  9 Mar 2020 11:14:15 +0100
Message-Id: <20200309101428.15267-7-m.felsch@pengutronix.de>
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

The patch adds the initial connector parsing code, so we can move from a
driver specific parsing code to a generic one. Currently only the
generic fields and the analog-connector specific fields are parsed. Parsing
the other connector specific fields can be added by a simple callbacks.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
[1] https://patchwork.kernel.org/cover/10794703/

v12:
- all: adapt documentation
- v4l2_fwnode_connector_parse_analog: convert to void
- v4l2_fwnode_get_connector_type: new helper
- split v4l2_fwnode_connector_alloc_parse into:
  - v4l2_fwnode_connector_parse: setup the connector ready to add links
  - v4l2_fwnode_connector_add_link: add a link to the connector
    - add helpers to get first and last link
- v4l2_fwnode_connector_parse: improve error handling
- v4l2_fwnode_connector_parse: improve connector type handling
- v4l2_fwnode_connector_free: freed resources to NULL

v10:
- drop V4L2_CONN_HDMI support
- adapt pr_err msg to reflect new state (-> connector is unkown)

v9:
- Fix leading semicolon found by kbuild semicolon.cocci

v8:
- V4L2_CON_* -> V4L2_CONN_*
- tvnorms -> sdtv-standards
- adapt to new v4l2_fwnode_connector_analog member
- return error in case of V4L2_CONN_HDMI

v7:
@Jacopo: I dropped your r b tag becuase of the amount of changes I
made..

- drop unnecessary comments
- fix commet style
- s/v4l2_fwnode_connector_conv.name/v4l2_fwnode_connector_conv.compatible/
- make label size variable and drop V4L2_CONNECTOR_MAX_LABEL usage
- do not assign a default label in case of no label was specified
- remove useless /* fall through */ comments
- add support for N connector links
- rename local variables to be more meaningful
- adjust kernedoc
- add v4l2_fwnode_connector_free()
- improve error handling (use different error values)
- make use of pr_warn_once()

v6:
- use unsigned count var
- fix comment and style issues
- place '/* fall through */' to correct places
- fix error handling and cleanup by releasing fwnode
- drop vga and dvi parsing support as those connectors are rarely used
  these days

v5:
- s/strlcpy/strscpy/

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 164 ++++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           |  82 +++++++++++++
 2 files changed, 246 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 78c32aebbe03..d8e1bcba2464 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -598,6 +598,170 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
 
+static const struct v4l2_fwnode_connector_conv {
+	enum v4l2_connector_type type;
+	const char *compatible;
+} connectors[] = {
+	{
+		.type = V4L2_CONN_COMPOSITE,
+		.compatible = "composite-video-connector",
+	}, {
+		.type = V4L2_CONN_SVIDEO,
+		.compatible = "svideo-connector",
+	},
+};
+
+static enum v4l2_connector_type
+v4l2_fwnode_string_to_connector_type(const char *con_str)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(connectors); i++)
+		if (!strcmp(con_str, connectors[i].compatible))
+			return connectors[i].type;
+
+	return V4L2_CONN_UNKNOWN;
+}
+
+static void
+v4l2_fwnode_connector_parse_analog(struct fwnode_handle *fwnode,
+				   struct v4l2_fwnode_connector *vc)
+{
+	u32 stds;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "sdtv-standards", &stds);
+
+	/* The property is optional. */
+	vc->connector.analog.sdtv_stds = ret ? V4L2_STD_ALL : stds;
+}
+
+void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
+{
+	struct v4l2_connector_link *link, *tmp;
+
+	if (IS_ERR_OR_NULL(connector) ||
+	    connector->type == V4L2_CONN_UNKNOWN)
+		return;
+
+	list_for_each_entry_safe(link, tmp, &connector->links, head) {
+		v4l2_fwnode_put_link(&link->fwnode_link);
+		list_del(&link->head);
+		kfree(link);
+	}
+
+	kfree(connector->label);
+	connector->label = NULL;
+	connector = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_free);
+
+static enum v4l2_connector_type
+v4l2_fwnode_get_connector_type(struct fwnode_handle *fwnode)
+{
+	const char *type_name;
+	int err;
+
+	if (!fwnode)
+		return V4L2_CONN_UNKNOWN;
+
+	/* The connector-type is stored within the compatible string. */
+	err = fwnode_property_read_string(fwnode, "compatible", &type_name);
+	if (err)
+		return V4L2_CONN_UNKNOWN;
+
+	return v4l2_fwnode_string_to_connector_type(type_name);
+}
+
+int v4l2_fwnode_connector_parse(struct fwnode_handle *fwnode,
+				struct v4l2_fwnode_connector *connector)
+{
+	struct fwnode_handle *connector_node;
+	enum v4l2_connector_type connector_type;
+	const char *label;
+	int err;
+
+	if (!fwnode)
+		return -EINVAL;
+
+	memset(connector, 0, sizeof(*connector));
+
+	INIT_LIST_HEAD(&connector->links);
+
+	connector_node = fwnode_graph_get_port_parent(fwnode);
+	connector_type = v4l2_fwnode_get_connector_type(connector_node);
+	if (connector_type == V4L2_CONN_UNKNOWN) {
+		fwnode_handle_put(connector_node);
+		connector_node = fwnode_graph_get_remote_port_parent(fwnode);
+		connector_type = v4l2_fwnode_get_connector_type(connector_node);
+	}
+
+	if (connector_type == V4L2_CONN_UNKNOWN) {
+		pr_err("Unknown connector type\n");
+		err = -ENOTCONN;
+		goto out;
+	}
+
+	connector->type = connector_type;
+	connector->name = fwnode_get_name(connector_node);
+	err = fwnode_property_read_string(connector_node, "label", &label);
+	connector->label = err ? NULL : kstrdup_const(label, GFP_KERNEL);
+
+	/* Parse the connector specific properties. */
+	switch (connector->type) {
+	case V4L2_CONN_COMPOSITE:
+	case V4L2_CONN_SVIDEO:
+		v4l2_fwnode_connector_parse_analog(connector_node, connector);
+		break;
+	/* Avoid compiler warnings */
+	case V4L2_CONN_UNKNOWN:
+		;
+	}
+
+out:
+	fwnode_handle_put(connector_node);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_parse);
+
+int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
+				   struct v4l2_fwnode_connector *connector)
+{
+	struct fwnode_handle *connector_ep;
+	struct v4l2_connector_link *link;
+	int err;
+
+	if (!fwnode || !connector || connector->type == V4L2_CONN_UNKNOWN)
+		return -EINVAL;
+
+	link = kzalloc(sizeof(*link), GFP_KERNEL);
+	if (!link)
+		return -ENOMEM;
+
+	connector_ep = fwnode_graph_get_remote_endpoint(fwnode);
+	if (!connector_ep)
+		return -ENOTCONN;
+
+	err = v4l2_fwnode_parse_link(connector_ep, &link->fwnode_link);
+	if (err)
+		goto err;
+
+	fwnode_handle_put(connector_ep);
+
+	list_add(&link->head, &connector->links);
+	connector->nr_of_links++;
+
+	return 0;
+
+err:
+	kfree(link);
+	fwnode_handle_put(connector_ep);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
+
 static int
 v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 					  struct v4l2_async_notifier *notifier,
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 6cf39d447b10..dd82d6d9764e 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -294,6 +294,66 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
  */
 void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
 
+/**
+ * v4l2_fwnode_connector_free() - free the V4L2 connector acquired memory
+ * @connector: the V4L2 connector resources of which are to be released
+ *
+ * Free all allocated memory and put all links acquired by
+ * v4l2_fwnode_connector_parse() and v4l2_fwnode_connector_add_link().
+ *
+ * It is safe to call this function with NULL argument or on a V4L2 connector
+ * the parsing of which failed.
+ */
+void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector);
+
+/**
+ * v4l2_fwnode_connector_parse() - initialize the 'struct v4l2_fwnode_connector'
+ * @fwnode: pointer to the subdev endpoint's fwnode handle where the connector
+ *	    is connected to or to the connector endpoint fwnode handle.
+ * @connector: pointer to the V4L2 fwnode connector data structure
+ *
+ * Fill the &struct v4l2_fwnode_connector with the connector type, label and
+ * all &enum v4l2_connector_type specific connector data. The label is optional
+ * so it is set to %NULL if no one was found. The function initialize the links
+ * to zero. Adding links to the connector is done by calling
+ * v4l2_fwnode_connector_add_link().
+ *
+ * The memory allocated for the label must be freed when no longer needed.
+ * Freeing the memory is done by v4l2_fwnode_connector_free().
+ *
+ * Return:
+ * * %0 on success or a negative error code on failure:
+ * * %-EINVAL if @fwnode is invalid
+ * * %-ENOTCONN if connector type is unknown or connector device can't be found
+ */
+int v4l2_fwnode_connector_parse(struct fwnode_handle *fwnode,
+				struct v4l2_fwnode_connector *connector);
+
+/**
+ * v4l2_fwnode_connector_add_link - add a link between a connector node and
+ *				    a v4l2-subdev node.
+ * @fwnode: pointer to the subdev endpoint's fwnode handle where the connector
+ *          is connected to
+ * @connector: pointer to the V4L2 fwnode connector data structure
+ *
+ * Add a new &struct v4l2_connector_link link to the
+ * &struct v4l2_fwnode_connector connector links list. The link local_node
+ * points to the connector node, the remote_node to the host v4l2 (sub)dev.
+ *
+ * The taken references to remote_node and local_node must be dropped and the
+ * allocated memory must be freed when no longer needed. Both is done by calling
+ * v4l2_fwnode_connector_free().
+ *
+ * Return:
+ * * %0 on success or a negative error code on failure:
+ * * %-EINVAL if @fwnode or @connector is invalid or @connector type is unknown
+ * * %-ENOMEM on link memory allocation failure
+ * * %-ENOTCONN if remote connector device can't be found
+ * * %-ENOLINK if link parsing between v4l2 (sub)dev and connector fails
+ */
+int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
+				   struct v4l2_fwnode_connector *connector);
+
 /**
  * typedef parse_endpoint_func - Driver's callback function to be called on
  *	each V4L2 fwnode endpoint.
@@ -467,4 +527,26 @@ v4l2_async_register_fwnode_subdev(struct v4l2_subdev *sd,
 				  unsigned int num_ports,
 				  parse_endpoint_func parse_endpoint);
 
+/* Helper macros to access the connector links. */
+
+/** v4l2_connector_last_link - Helper macro to get the first
+ *                             &struct v4l2_fwnode_connector link
+ * @v4l2c: &struct v4l2_fwnode_connector owning the connector links
+ *
+ * This marco returns the first added &struct v4l2_connector_link connector
+ * link or @NULL if the connector has no links.
+ */
+#define v4l2_connector_first_link(v4l2c)				       \
+	list_first_entry_or_null(&(v4l2c)->links,			       \
+				 struct v4l2_connector_link, head)
+
+/** v4l2_connector_last_link - Helper macro to get the last
+ *                             &struct v4l2_fwnode_connector link
+ * @v4l2c: &struct v4l2_fwnode_connector owning the connector links
+ *
+ * This marco returns the last &struct v4l2_connector_link added connector link.
+ */
+#define v4l2_connector_last_link(v4l2c)					       \
+	list_last_entry(&(v4l2c)->links, struct v4l2_connector_link, head)
+
 #endif /* _V4L2_FWNODE_H */
-- 
2.20.1


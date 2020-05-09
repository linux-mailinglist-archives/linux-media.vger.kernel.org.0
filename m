Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065F01CBF7D
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgEIJCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:14 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60665 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:14 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6FC691C0008;
        Sat,  9 May 2020 09:02:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 06/13] media: v4l2-fwnode: Add helper to parse device properties
Date:   Sat,  9 May 2020 11:04:49 +0200
Message-Id: <20200509090456.3496481-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an helper function to parse common device properties in the same
way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.

Parse the 'rotation' and 'orientation' properties from the firmware
interface.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 42 ++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           | 47 +++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 97f0f8b23b5dd..17b68cec8b083 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -756,6 +756,48 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
 
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	u32 val;
+	int ret;
+
+	memset(props, 0, sizeof(*props));
+
+	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
+	ret = fwnode_property_read_u32(fwnode, "orientation", &val);
+	if (!ret) {
+		switch (val) {
+		case V4L2_FWNODE_ORIENTATION_FRONT:
+		case V4L2_FWNODE_ORIENTATION_BACK:
+		case V4L2_FWNODE_ORIENTATION_EXTERNAL:
+			break;
+		default:
+			dev_warn(dev, "Unsupported device orientation: %u\n", val);
+			return -EINVAL;
+		}
+
+		props->orientation = val;
+		dev_dbg(dev, "device orientation: %u\n", val);
+	}
+
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
+	if (!ret) {
+		if (val >= 360) {
+			dev_warn(dev, "Unsupported device rotation: %u\n", val);
+			return -EINVAL;
+		}
+
+		props->rotation = val;
+		dev_dbg(dev, "device rotation: %u\n", val);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
+
 static int
 v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 					  struct v4l2_async_notifier *notifier,
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index dd82d6d9764ef..68c415fdaac53 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -109,6 +109,36 @@ struct v4l2_fwnode_endpoint {
 	unsigned int nr_of_link_frequencies;
 };
 
+/**
+ * V4L2_FWNODE_PROPERTY_UNSET - identify a non initialized property
+ *
+ * All properties in &struct v4l2_fwnode_device_properties are initialized
+ * to this value.
+ */
+#define V4L2_FWNODE_PROPERTY_UNSET   (-1U)
+
+/**
+ * enum v4l2_fwnode_orientation - possible device orientation
+ * @V4L2_FWNODE_ORIENTATION_FRONT: device installed on the front side
+ * @V4L2_FWNODE_ORIENTATION_BACK: device installed on the back side
+ * @V4L2_FWNODE_ORIENTATION_EXTERNAL: device externally located
+ */
+enum v4l2_fwnode_orientation {
+	V4L2_FWNODE_ORIENTATION_FRONT,
+	V4L2_FWNODE_ORIENTATION_BACK,
+	V4L2_FWNODE_ORIENTATION_EXTERNAL
+};
+
+/**
+ * struct v4l2_fwnode_device_properties - fwnode device properties
+ * @orientation: device orientation. See &enum v4l2_fwnode_orientation
+ * @rotation: device rotation
+ */
+struct v4l2_fwnode_device_properties {
+	enum v4l2_fwnode_orientation orientation;
+	unsigned int rotation;
+};
+
 /**
  * struct v4l2_fwnode_link - a link between two endpoints
  * @local_node: pointer to device_node of this endpoint
@@ -354,6 +384,23 @@ int v4l2_fwnode_connector_parse(struct fwnode_handle *fwnode,
 int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 				   struct v4l2_fwnode_connector *connector);
 
+/**
+ * v4l2_fwnode_device_parse() - parse fwnode device properties
+ * @dev: pointer to &struct device
+ * @props: pointer to &struct v4l2_fwnode_device_properties where to store the
+ *	   parsed properties values
+ *
+ * This function parses and validates the V4L2 fwnode device properties from the
+ * firmware interface, and fills the @struct v4l2_fwnode_device_properties
+ * provided by the caller.
+ *
+ * Return:
+ *	% 0 on success
+ *	%-EINVAL if a parsed property value is not valid
+ */
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props);
+
 /**
  * typedef parse_endpoint_func - Driver's callback function to be called on
  *	each V4L2 fwnode endpoint.
-- 
2.26.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A5BF505B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfKHP6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:10 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:51649 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKHP6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:10 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0E759100006;
        Fri,  8 Nov 2019 15:58:04 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 06/11] media: v4l2-fwnode: Add helper to parse device properties
Date:   Fri,  8 Nov 2019 16:59:39 +0100
Message-Id: <20191108155944.1040883-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an helper function to parse common device properties in the same
way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.

Parse the 'rotation' and 'location' properties from the firmware
interface.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++
 include/media/v4l2-fwnode.h           | 48 +++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 192cac076761..8af4174a2bbf 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -596,6 +596,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_put_link);
 
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	u32 val;
+	int ret;
+
+	memset(props, 0, sizeof(*props));
+
+	props->location = V4L2_FWNODE_PROPERTY_UNSET;
+	ret = fwnode_property_read_u32(fwnode, "location", &val);
+	if (!ret) {
+		switch (val) {
+		case V4L2_FWNODE_LOCATION_FRONT:
+		case V4L2_FWNODE_LOCATION_BACK:
+		case V4L2_FWNODE_LOCATION_EXTERNAL:
+			break;
+		default:
+			dev_warn(dev, "Unsupported device location: %u\n", val);
+			return -EINVAL;
+		}
+
+		props->location = val;
+		dev_dbg(dev, "device location: %u\n", val);
+	}
+
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
+	if (!ret) {
+		if (val >= 360 || val % 90) {
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
index f6a7bcd13197..6d46d6fc3007 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -109,6 +109,36 @@ struct v4l2_fwnode_endpoint {
 	unsigned int nr_of_link_frequencies;
 };
 
+/**
+ * v4l2_fwnode_location - identify a non initialized property.
+ *
+ * All properties in &struct v4l2_fwnode_device_properties are initialized
+ * to this value.
+ */
+#define V4L2_FWNODE_PROPERTY_UNSET   (-1U)
+
+/**
+ * enum v4l2_fwnode_location - possible device locations
+ * @V4L2_FWNODE_LOCATION_FRONT: device installed on the front side
+ * @V4L2_FWNODE_LOCATION_BACK: device installed on the back side
+ * @V4L2_FWNODE_LOCATION_EXTERNAL: device externally located
+ */
+enum v4l2_fwnode_location {
+	V4L2_FWNODE_LOCATION_FRONT,
+	V4L2_FWNODE_LOCATION_BACK,
+	V4L2_FWNODE_LOCATION_EXTERNAL
+};
+
+/**
+ * struct v4l2_fwnode_device_properties - fwnode device properties
+ * @location: device location. See &enum v4l2_fwnode_location
+ * @rotation: device rotation
+ */
+struct v4l2_fwnode_device_properties {
+	enum v4l2_fwnode_location location;
+	unsigned int rotation;
+};
+
 /**
  * struct v4l2_fwnode_link - a link between two endpoints
  * @local_node: pointer to device_node of this endpoint
@@ -233,6 +263,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
  */
 void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link);
 
+/**
+ * v4l2_fwnode_device_parse() - parse fwnode device properties
+ * @dev: pointer to &struct device
+ * @props: pointer to &struct v4l2_fwnode_device_properties where to store the
+ *	   parsed properties values
+ *
+ * This function parses and validates the V4L2 fwnode device properties from
+ * the firmware interface. It is responsibility of the caller to allocate a
+ * valid @struct v4l2_fwnode_device_properties structure and provide a pointer
+ * to it in the @props parameter.
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
2.23.0


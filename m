Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2290B152F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 22:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfILUJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 16:09:54 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39559 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfILUJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 16:09:54 -0400
X-Originating-IP: 85.243.204.24
Received: from uno.lan (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BEE7920004;
        Thu, 12 Sep 2019 20:09:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v3 06/11] media: v4l2-fwnode: Add helper to parse device properties
Date:   Thu, 12 Sep 2019 22:10:50 +0200
Message-Id: <20190912201055.13964-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912201055.13964-1-jacopo@jmondi.org>
References: <20190912201055.13964-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an helper function to parse common device properties in the same
way as v4l2_fwnode_endpoint_parse() parses common endpoint properties.

Initially parse the 'rotation' and 'location' properties from the
firmware interface.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 42 +++++++++++++++++++++++++++
 include/media/v4l2-fwnode.h           | 40 +++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3bd1888787eb..d325a2d5c088 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -595,6 +595,48 @@ void v4l2_fwnode_put_link(struct v4l2_fwnode_link *link)
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
+	dev_dbg(dev, "===== begin V4L2 device properties parsing\n");
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
+	dev_dbg(dev, "===== end V4L2 device properties parsing\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
+
 static int
 v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 					  struct v4l2_async_notifier *notifier,
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f6a7bcd13197..86af6d9d11fe 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -109,6 +109,28 @@ struct v4l2_fwnode_endpoint {
 	unsigned int nr_of_link_frequencies;
 };
 
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
@@ -233,6 +255,24 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
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


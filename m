Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408F817DD25
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCIKO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:37841 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgCIKOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mT-6Z; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001lq-NI; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 05/19] media: v4l2-fwnode: add v4l2_fwnode_connector
Date:   Mon,  9 Mar 2020 11:14:14 +0100
Message-Id: <20200309101428.15267-6-m.felsch@pengutronix.de>
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

Currently every driver needs to parse the connector endpoints by it self.
This is the initial work to make this generic. A generic connector has
common members and connector specific members. The common members are:
  - type
  - label (optional)
  - links
  - nr_of_links

The specific members are stored within a union, since only one of them
can be available at the time. Since this is the initial support the
patch adds only the analog-connector specific ones.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
[1] https://patchwork.kernel.org/cover/10794703/

v12:
- convert links to a list
- adapt docs
- add connector name porperty

v10:
- drop unused V4L2_CONN_HDMI support

v8:
- rename CON -> CONN
- supported_tvnorms_stds -> sdtv_stds and adapt description

v7:
- fix spelling issues
- constify label
- support variable label size
- replace single remote_port/id members by links member of variable
  size
- squash v4l2-connector into v4l2-fwnode

@Jacopo: I dropped your r b tag because I changed the port/id logic.

v6:
- fix some spelling and style issues
- rm unnecessary comments
- drop vga and dvi connector
- fix misspelt connector

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.

 include/media/v4l2-fwnode.h | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 7bba6dfa3fd6..6cf39d447b10 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -127,6 +127,63 @@ struct v4l2_fwnode_link {
 	unsigned int remote_id;
 };
 
+/**
+ * enum v4l2_connector_type - connector type
+ * @V4L2_CONN_UNKNOWN:   unknown connector type, no V4L2 connector configuration
+ * @V4L2_CONN_COMPOSITE: analog composite connector
+ * @V4L2_CONN_SVIDEO:    analog svideo connector
+ */
+enum v4l2_connector_type {
+	V4L2_CONN_UNKNOWN,
+	V4L2_CONN_COMPOSITE,
+	V4L2_CONN_SVIDEO,
+};
+
+/**
+ * struct v4l2_connector_link - connector link data structure
+ * @head: structure to be used to add the link to the
+ *        &struct v4l2_fwnode_connector
+ * @fwnode_link: &struct v4l2_fwnode_link link between the connector and the
+ *               device the connector belongs to.
+ */
+struct v4l2_connector_link {
+	struct list_head head;
+	struct v4l2_fwnode_link fwnode_link;
+};
+
+/**
+ * struct v4l2_fwnode_connector_analog - analog connector data structure
+ * @sdtv_stds: sdtv standards this connector supports, set to V4L2_STD_ALL
+ *             if no restrictions are specified.
+ */
+struct v4l2_fwnode_connector_analog {
+	v4l2_std_id sdtv_stds;
+};
+
+/**
+ * struct v4l2_fwnode_connector - the connector data structure
+ * @name: the connector device name
+ * @label: optional connector label
+ * @type: connector type
+ * @links: list of all connector &struct v4l2_connector_link links
+ * @nr_of_links: total number of links
+ * @connector: connector configuration
+ * @connector.analog: analog connector configuration
+ *                    &struct v4l2_fwnode_connector_analog
+ */
+struct v4l2_fwnode_connector {
+	const char *name;
+	const char *label;
+	enum v4l2_connector_type type;
+	struct list_head links;
+	unsigned int nr_of_links;
+
+	union {
+		struct v4l2_fwnode_connector_analog analog;
+		/* future connectors */
+	} connector;
+};
+
 /**
  * v4l2_fwnode_endpoint_parse() - parse all fwnode node properties
  * @fwnode: pointer to the endpoint's fwnode handle
-- 
2.20.1


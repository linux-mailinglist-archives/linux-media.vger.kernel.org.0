Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7426617DD1F
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgCIKOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:51 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51227 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgCIKOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:49 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mR-6e; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001ln-Mk; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 04/19] media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
Date:   Mon,  9 Mar 2020 11:14:13 +0100
Message-Id: <20200309101428.15267-5-m.felsch@pengutronix.de>
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

A link is between two endpoints not between two ports to be more
precise. Add the local_id/remote_id field which stores the endpoint
reg/port property to the link. Now the link holds all necessary
information about a link.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---

v12:
- New in this serie

 drivers/media/v4l2-core/v4l2-fwnode.c | 2 ++
 include/media/v4l2-fwnode.h           | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 6ece4320e1d2..78c32aebbe03 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -565,6 +565,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
 
 	memset(link, 0, sizeof(*link));
 
+	fwnode_property_read_u32(__fwnode, "reg", &link->local_id);
 	fwnode = fwnode_get_parent(__fwnode);
 	fwnode_property_read_u32(fwnode, port_prop, &link->local_port);
 	fwnode = fwnode_get_next_parent(fwnode);
@@ -578,6 +579,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
 		return -ENOLINK;
 	}
 
+	fwnode_property_read_u32(fwnode, "reg", &link->remote_id);
 	fwnode = fwnode_get_parent(fwnode);
 	fwnode_property_read_u32(fwnode, port_prop, &link->remote_port);
 	fwnode = fwnode_get_next_parent(fwnode);
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index f6a7bcd13197..7bba6dfa3fd6 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -113,14 +113,18 @@ struct v4l2_fwnode_endpoint {
  * struct v4l2_fwnode_link - a link between two endpoints
  * @local_node: pointer to device_node of this endpoint
  * @local_port: identifier of the port this endpoint belongs to
+ * @local_id: identifier of the id this endpoint belongs to
  * @remote_node: pointer to device_node of the remote endpoint
  * @remote_port: identifier of the port the remote endpoint belongs to
+ * @remote_id: identifier of the id the remote endpoint belongs to
  */
 struct v4l2_fwnode_link {
 	struct fwnode_handle *local_node;
 	unsigned int local_port;
+	unsigned int local_id;
 	struct fwnode_handle *remote_node;
 	unsigned int remote_port;
+	unsigned int remote_id;
 };
 
 /**
-- 
2.20.1


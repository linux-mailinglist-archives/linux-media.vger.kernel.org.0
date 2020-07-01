Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EE32103D3
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgGAGVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAGVy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:21:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE7CC061755;
        Tue, 30 Jun 2020 23:21:54 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A59D959E;
        Wed,  1 Jul 2020 08:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593584513;
        bh=By9nG0sVTJPkuH36AHQTfyuFCCNiT/9/wrM557TfLRI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cozHP655k5ihnyhmY/GrPNQiFCkjlO/35Ubj62QcSLru4Nel4R+G3TTZ696p1lRTe
         1RcadrTNJtG+igzZwJhO0ozjZwT3O+3xjh1dTjyVBbou8v4ckeG0++k2IJk608ThKM
         1yh3H8vTw4hHbd9D2r64BsudUDnstf3ynkTs1xK8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [PATCH v4 2/4] media: v4l2-async: Accept endpoints and devices for fwnode matching
Date:   Wed,  1 Jul 2020 09:21:38 +0300
Message-Id: <20200701062140.12953-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fwnode matching was designed to match on nodes corresponding to a
device. Some drivers, however, needed to match on endpoints, and have
passed endpoint fwnodes to v4l2-async. This works when both the subdev
and the notifier use the same fwnode types (endpoint or device), but
makes drivers that use different types incompatible.

Fix this by extending the fwnode match to handle fwnodes of different
types. When the types (deduced from the presence of remote endpoints)
are different, retrieve the device fwnode for the side that provides an
endpoint fwnode, and compare it with the device fwnode provided by the
other side. This allows interoperability between all drivers, regardless
of which type of fwnode they use for matching.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v3:

- Use fwnode_graph_is_endpoint()

Changes since v2:

- Add comment to explain that we're matching connecting endpoints
- Don't check fwnode name to detect endpoint
---
 drivers/media/v4l2-core/v4l2-async.c | 43 +++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce4..e9c3d41c9449 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -71,7 +71,48 @@ static bool match_devname(struct v4l2_subdev *sd,
 
 static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
-	return sd->fwnode == asd->match.fwnode;
+	struct fwnode_handle *other_fwnode;
+	struct fwnode_handle *dev_fwnode;
+	bool asd_fwnode_is_ep;
+	bool sd_fwnode_is_ep;
+
+	/*
+	 * Both the subdev and the async subdev can provide either an endpoint
+	 * fwnode or a device fwnode. Start with the simple case of direct
+	 * fwnode matching.
+	 */
+	if (sd->fwnode == asd->match.fwnode)
+		return true;
+
+	/*
+	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
+	 * endpoint or a device. If they're of the same type, there's no match.
+	 * Technically speaking this checks if the nodes refer to a connected
+	 * endpoint, which is the simplest check that works for both OF and
+	 * ACPI. This won't make a difference, as drivers should not try to
+	 * match unconnected endpoints.
+	 */
+	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
+	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
+
+	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
+		return false;
+
+	/*
+	 * The sd and asd fwnodes are of different types. Get the device fwnode
+	 * parent of the endpoint fwnode, and compare it with the other fwnode.
+	 */
+	if (sd_fwnode_is_ep) {
+		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
+		other_fwnode = asd->match.fwnode;
+	} else {
+		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
+		other_fwnode = sd->fwnode;
+	}
+
+	fwnode_handle_put(dev_fwnode);
+
+	return dev_fwnode == other_fwnode;
 }
 
 static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
-- 
Regards,

Laurent Pinchart


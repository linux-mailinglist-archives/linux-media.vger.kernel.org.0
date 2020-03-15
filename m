Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91435185C7C
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 13:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgCOMzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 08:55:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgCOMzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 08:55:21 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8439E2D6;
        Sun, 15 Mar 2020 13:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584276919;
        bh=pX9IGJBTv9Vi8Y6108B7eJtEiWem/ujDCUoDYF4PPos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZJgRXep6Ro2XwsqhiSvqyBx+4rr+YtD921CM5G6xB9RD5B9bw73pWdPwfkoO+LmEs
         I1K35gp+azA3bnPbzdJ/GiuyivJkJjzWIEWE6fxoW8JlqXwtD9nxUlUClwjH3u41ai
         buFPOxNCFTuyRhCLRHFH0QYaYKw8zWLHLX82jO2M=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] media: v4l2-async: Accept endpoints and devices for fwnode matching
Date:   Sun, 15 Mar 2020 14:55:11 +0200
Message-Id: <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
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
types. When the types (deduced from the node name) are different,
retrieve the device fwnode for the side that provides an endpoint
fwnode, and compare it with the device fwnode provided by the other
side. This allows interoperability between all drivers, regardless of
which type of fwnode they use for matching.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
This has been compile-tested only. Prabhakar, could you check if it
fixes your issue ?

 drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 8bde33c21ce4..995e5464cba7 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
 
 static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
-	return sd->fwnode == asd->match.fwnode;
+	struct fwnode_handle *other_fwnode;
+	struct fwnode_handle *dev_fwnode;
+	bool asd_fwnode_is_ep;
+	bool sd_fwnode_is_ep;
+	const char *name;
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
+	 */
+	name = fwnode_get_name(sd->fwnode);
+	sd_fwnode_is_ep = name && strstarts(name, "endpoint");
+	name = fwnode_get_name(asd->match.fwnode);
+	asd_fwnode_is_ep = name && strstarts(name, "endpoint");
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


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810471892DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 01:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgCRAZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 20:25:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgCRAZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 20:25:23 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37F9D504;
        Wed, 18 Mar 2020 01:25:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584491121;
        bh=skEXzsL2tu5WrqhmZAQxofau2ZISmajSMYp+88epHKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oQPUa8niciD1Dkjg12LTGoVyVPJKhBC8j11BU4wJthnmQdyOalA4ZS28Ihv6VH8Mk
         w2FG7LIcnEWN5tSXtYJTqcAHiCa4wEJQJhbe7zMCr+nCTqTGMJYapN/N2Md56OSSLy
         6zCE3Zh1Y5isYg2ZZmr+A4+0nq5PPj8hV2ZwHK10=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] media: v4l2-async: Accept endpoints and devices for fwnode matching
Date:   Wed, 18 Mar 2020 02:25:04 +0200
Message-Id: <20200318002507.30336-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
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
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
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


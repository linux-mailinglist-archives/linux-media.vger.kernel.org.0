Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D04124217E
	for <lists+linux-media@lfdr.de>; Tue, 11 Aug 2020 23:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgHKVAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 17:00:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34456 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgHKVAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 17:00:06 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DD90124E;
        Tue, 11 Aug 2020 22:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597179599;
        bh=bebzei2fJh+WYOaPJ+LX4SEx2KRY9Bkky/7fnBZ2PJE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XV3LyaqUVyJC8/72CQhedd0/E1/gmZtuwNohEMzmj+9uespa1ow5LtCydA8jIW9GF
         pDyVTAi9+sh7aoalhP6rWWDnSDr5i8ULSBdQRlxBruod2Od/M+1iBDhZRubaMHHjaH
         J8pFeDiDDryiOGLhLwdR/Ar/V43dDV3MqsRsyVGA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 3/5] media: rcar_drif: Allocate v4l2_async_subdev dynamically
Date:   Tue, 11 Aug 2020 23:59:37 +0300
Message-Id: <20200811205939.19550-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_async_notifier_add_subdev() requires the asd to be allocated
dynamically, but the rcar-drif driver embeds it in the
rcar_drif_graph_ep structure. This causes memory corruption when the
notifier is destroyed at remove time with v4l2_async_notifier_cleanup().

Fix this issue by registering the asd with
v4l2_async_notifier_add_fwnode_subdev(), which allocates it dynamically
internally.

Fixes: d079f94c9046 ("media: platform: Switch to v4l2_async_notifier_add_subdev")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar_drif.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
index 3f1e5cb8b197..f318cd4b8086 100644
--- a/drivers/media/platform/rcar_drif.c
+++ b/drivers/media/platform/rcar_drif.c
@@ -185,7 +185,6 @@ struct rcar_drif_frame_buf {
 /* OF graph endpoint's V4L2 async data */
 struct rcar_drif_graph_ep {
 	struct v4l2_subdev *subdev;	/* Async matched subdev */
-	struct v4l2_async_subdev asd;	/* Async sub-device descriptor */
 };
 
 /* DMA buffer */
@@ -1109,12 +1108,6 @@ static int rcar_drif_notify_bound(struct v4l2_async_notifier *notifier,
 	struct rcar_drif_sdr *sdr =
 		container_of(notifier, struct rcar_drif_sdr, notifier);
 
-	if (sdr->ep.asd.match.fwnode !=
-	    of_fwnode_handle(subdev->dev->of_node)) {
-		rdrif_err(sdr, "subdev %s cannot bind\n", subdev->name);
-		return -EINVAL;
-	}
-
 	v4l2_set_subdev_hostdata(subdev, sdr);
 	sdr->ep.subdev = subdev;
 	rdrif_dbg(sdr, "bound asd %s\n", subdev->name);
@@ -1218,7 +1211,7 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 {
 	struct v4l2_async_notifier *notifier = &sdr->notifier;
 	struct fwnode_handle *fwnode, *ep;
-	int ret;
+	struct v4l2_async_subdev *asd;
 
 	v4l2_async_notifier_init(notifier);
 
@@ -1237,12 +1230,13 @@ static int rcar_drif_parse_subdevs(struct rcar_drif_sdr *sdr)
 		return -EINVAL;
 	}
 
-	sdr->ep.asd.match.fwnode = fwnode;
-	sdr->ep.asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	ret = v4l2_async_notifier_add_subdev(notifier, &sdr->ep.asd);
+	asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
+						    sizeof(*asd));
 	fwnode_handle_put(fwnode);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
-	return ret;
+	return 0;
 }
 
 /* Check if the given device is the primary bond */
-- 
Regards,

Laurent Pinchart


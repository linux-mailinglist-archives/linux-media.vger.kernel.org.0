Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B4E23EC3A
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 13:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgHGLQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 07:16:43 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:13303 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgHGLQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 07:16:40 -0400
X-Halon-ID: 766772cd-d89f-11ea-a39b-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 766772cd-d89f-11ea-a39b-005056917f90;
        Fri, 07 Aug 2020 13:16:39 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] v4l: async: Use endpoint node, not device node, for fwnode match
Date:   Fri,  7 Aug 2020 13:16:18 +0200
Message-Id: <20200807111619.3664763-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

V4L2 async framework can use both device's fwnode and endpoints's fwnode
for matching the async sub-device with the sub-device. In order to proceed
moving towards endpoint matching assign the endpoint to the async
sub-device.

As most async sub-device drivers (and the related hardware) only supports
a single endpoint, use the first endpoint found. This works for all
current drivers --- we only ever supported a single async sub-device per
device to begin with.

For async devices that have no endpoints, continue to use the fwnode
related to the device. This includes e.g. lens devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-async.c  | 8 ++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index e3ab003a6c851881..f3b0338718e0f0a9 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -758,8 +758,12 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 	 * (struct v4l2_subdev.dev), and async sub-device does not
 	 * exist independently of the device at any point of time.
 	 */
-	if (!sd->fwnode && sd->dev)
-		sd->fwnode = dev_fwnode(sd->dev);
+	if (!sd->fwnode && sd->dev) {
+		sd->fwnode = fwnode_graph_get_next_endpoint(
+			dev_fwnode(sd->dev), NULL);
+		if (!sd->fwnode)
+			sd->fwnode = dev_fwnode(sd->dev);
+	}
 
 	mutex_lock(&list_lock);
 
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index a4c3c77c1894648e..79706129e28b668a 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -815,7 +815,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode =
-		fwnode_graph_get_remote_port_parent(endpoint);
+		fwnode_graph_get_remote_endpoint(endpoint);
 	if (!asd->match.fwnode) {
 		dev_dbg(dev, "no remote endpoint found\n");
 		ret = -ENOTCONN;
-- 
2.28.0


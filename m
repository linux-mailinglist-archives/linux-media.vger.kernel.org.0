Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876FA3447A1
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 15:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCVOob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 10:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCVOoM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 10:44:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E4BC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 07:44:11 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lOLms-000691-2Z; Mon, 22 Mar 2021 15:44:10 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: video-mux: Skip dangling endpoints
Date:   Mon, 22 Mar 2021 15:44:08 +0100
Message-Id: <20210322144408.31461-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

i.MX6 device tree include files contain dangling endpoints for the
board device tree writers' convenience. These are still included in
many existing device trees.
Treat dangling endpoints as non-existent to support them.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/video-mux.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 133122e38515..9bc0b4d8de09 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -362,7 +362,7 @@ static int video_mux_async_register(struct video_mux *vmux,
 
 	for (i = 0; i < num_input_pads; i++) {
 		struct v4l2_async_subdev *asd;
-		struct fwnode_handle *ep;
+		struct fwnode_handle *ep, *remote_ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(
 			dev_fwnode(vmux->subdev.dev), i, 0,
@@ -370,6 +370,14 @@ static int video_mux_async_register(struct video_mux *vmux,
 		if (!ep)
 			continue;
 
+		/* Skip dangling endpoints for backwards compatibility */
+		remote_ep = fwnode_graph_get_remote_endpoint(ep);
+		if (!remote_ep) {
+			fwnode_handle_put(ep);
+			continue;
+		}
+		fwnode_handle_put(remote_ep);
+
 		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
 			&vmux->notifier, ep, struct v4l2_async_subdev);
 
-- 
2.29.2


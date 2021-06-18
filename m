Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65ADF3AD28A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 21:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhFRTL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 15:11:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50668 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFRTLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 15:11:25 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92B5B3F0;
        Fri, 18 Jun 2021 21:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624043354;
        bh=4XJfXPrsv+/8lp80oVWiqyRtb2RTHa3MA6/bu8ZWY18=;
        h=From:To:Cc:Subject:Date:From;
        b=ArMgnp0ELJ0QkS0Rc3T1qq7K3K6vVfxmz3313kNJXeQMyDbjpOUQujKKpQr/foSLI
         3GIEqz34422bST/9nEWlGeWyMqQ7K/KP2cOI4Z/tdzMuXkgRCBNB8t2S89VcGZbFHL
         /aE70xTN75+OXwT24eudxJk2p0bxlj/DQQmXRSQI=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: vsp1: Simplify DRM UIF handling
Date:   Fri, 18 Jun 2021 20:09:05 +0100
Message-Id: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

In commit 6732f3139380 ("media: v4l: vsp1: Fix uif null pointer access")
the handling of the UIF was over complicated, and the patch applied
before review.

Simplify it to keep the conditionals small.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

Another one that I had lying around in my tree for too long ....

 drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 06f74d410973..0c2507dc03d6 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -455,6 +455,10 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 		dev_err(vsp1->dev, "%s: failed to setup UIF after %s\n",
 			__func__, BRX_NAME(pipe->brx));
 
+	/* If the DRM pipe does not have a UIF there is nothing we can update. */
+	if (!drm_pipe->uif)
+		return 0;
+
 	/*
 	 * If the UIF is not in use schedule it for removal by setting its pipe
 	 * pointer to NULL, vsp1_du_pipeline_configure() will remove it from the
@@ -462,9 +466,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 	 * make sure it is present in the pipeline's list of entities if it
 	 * wasn't already.
 	 */
-	if (drm_pipe->uif && !use_uif) {
+	if (!use_uif) {
 		drm_pipe->uif->pipe = NULL;
-	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
+	} else if (!drm_pipe->uif->pipe) {
 		drm_pipe->uif->pipe = pipe;
 		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
 	}
-- 
2.30.2


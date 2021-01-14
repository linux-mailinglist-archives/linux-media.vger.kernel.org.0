Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C59A2F65D4
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbhANQYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbhANQYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:24:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D3BC061757;
        Thu, 14 Jan 2021 08:24:10 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 898998EF;
        Thu, 14 Jan 2021 17:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610641446;
        bh=zORDbomIFkIlxQcbzHxSvw0hoVYkwxy+GP1jaPdQttI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BVRHKfLuvX2oIcA3436bIz+udANvVwJ/h0tXTOS8t4bSjGbOizrMIMhyAYbXsKUak
         6RzdIUVSqlZPpkH5JLYMfUrJsUqD0u0q/0vvVenD49cX5MOP+/BNNzc4XlUZIFV1RY
         +ZESZkSoJcjjVPgrLhLUyMivXa7l8MKKE4okZdzU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v4 02/10] media: vsp1: drm: Don't configure hardware when the pipeline is disabled
Date:   Thu, 14 Jan 2021 16:22:47 +0000
Message-Id: <20210114162255.705868-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The vsp1_du_atomic_flush() function calls vsp1_du_pipeline_configure()
to configure the hardware pipeline. The function is currently guaranteed
to be called with the pipeline enabled, but this will change by future
rework of the DU driver. Guard the hardware configuration to skip it
when the pipeline is disabled. The hardware will be configured the next
time the pipeline gets enabled.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 13 ++++++++++++-
 drivers/media/platform/vsp1/vsp1_drm.h |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 2bac80014bf4..fa79cac32e49 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -723,6 +723,8 @@ int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
 	/* Configure all entities in the pipeline. */
 	vsp1_du_pipeline_configure(pipe);
 
+	drm_pipe->enabled = true;
+
 unlock:
 	mutex_unlock(&vsp1->drm->lock);
 
@@ -799,6 +801,8 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
 	pipe->brx->pipe = NULL;
 	pipe->brx = NULL;
 
+	drm_pipe->enabled = false;
+
 	mutex_unlock(&vsp1->drm->lock);
 
 	vsp1_dlm_reset(pipe->output->dlm);
@@ -991,7 +995,14 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
 	}
 
 	vsp1_du_pipeline_setup_inputs(vsp1, pipe);
-	vsp1_du_pipeline_configure(pipe);
+
+	/*
+	 * We may get called before the pipeline gets enabled, postpone
+	 * configuration in that case. vsp1_du_pipeline_configure() will be
+	 * called from vsp1_du_atomic_enable().
+	 */
+	if (drm_pipe->enabled)
+		vsp1_du_pipeline_configure(pipe);
 
 done:
 	mutex_unlock(&vsp1->drm->lock);
diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
index e85ad4366fbb..d780dafc1324 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/vsp1/vsp1_drm.h
@@ -20,6 +20,7 @@
 /**
  * vsp1_drm_pipeline - State for the API exposed to the DRM driver
  * @pipe: the VSP1 pipeline used for display
+ * @enabled: true if the pipeline is enabled
  * @width: output display width
  * @height: output display height
  * @force_brx_release: when set, release the BRx during the next reconfiguration
@@ -31,6 +32,7 @@
  */
 struct vsp1_drm_pipeline {
 	struct vsp1_pipeline pipe;
+	bool enabled;
 
 	unsigned int width;
 	unsigned int height;
-- 
2.25.1


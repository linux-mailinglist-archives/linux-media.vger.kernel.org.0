Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BFE49208
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbfFQVJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:09:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41562 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfFQVJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:09:55 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1D78B83;
        Mon, 17 Jun 2019 23:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805792;
        bh=rrQm9QeL60zCnwWVRCIXXDU0Fkq0JMmZFbuZfAUBsdA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biowfa+dhIVUOkw3YNYElV/z0oGWIPKRXm4bxw0Z71LzHfpdDlXNkWgTDN1Q1kRfh
         caPQISzfzt+I9Vv+azkxeWFM7a951xSlxDTnUXKWyCq7z10qGyGJcNrnE5Pthrky3U
         0K+2Qt0X7QdkEPqxxsd7WqBqQzc5NboQ09sVBMm4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 02/10] media: vsp1: drm: Don't configure hardware when the pipeline is disabled
Date:   Tue, 18 Jun 2019 00:09:22 +0300
Message-Id: <20190617210930.6054-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vsp1_du_atomic_flush() function calls vsp1_du_pipeline_configure()
to configure the hardware pipeline. The function is currently guaranteed
to be called with the pipeline enabled, but this will change by future
rework of the DU driver. Guard the hardware configuration to skip it
when the pipeline is disabled. The hardware will be configured the next
time the pipeline gets enabled.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 13 ++++++++++++-
 drivers/media/platform/vsp1/vsp1_drm.h |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 7957e1439de0..900465caf1bf 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -723,6 +723,8 @@ int vsp1_du_atomic_enable(struct device *dev, unsigned int pipe_index,
 	/* Configure all entities in the pipeline. */
 	vsp1_du_pipeline_configure(pipe);
 
+	drm_pipe->enabled = true;
+
 unlock:
 	mutex_unlock(&vsp1->drm->lock);
 
@@ -800,6 +802,8 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
 	pipe->brx->pipe = NULL;
 	pipe->brx = NULL;
 
+	drm_pipe->enabled = false;
+
 	mutex_unlock(&vsp1->drm->lock);
 
 	vsp1_dlm_reset(pipe->output->dlm);
@@ -992,7 +996,14 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
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
Regards,

Laurent Pinchart


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44C24920E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfFQVJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:09:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41562 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbfFQVJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:09:58 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A9CEE34;
        Mon, 17 Jun 2019 23:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805793;
        bh=ZRujnJlPLQRSDC+sZ3+ymI5m/p5xPLVdUAgypr6FUCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ijbmpjbiNK39b06bSXRJkr7OnYLKlsfyxDv+Sg8mGxJyXMCWeVBRcRN7A0imkntT+
         YQcsqruJQXeytIkGdqLDjd3vKJHpAo5g7s68Bl9cB/BWYarb6wfLacJ/1iOi+u/w3H
         UgPRSpYnSHBc+Xr3DOVLjxo+ZEeH1K+dJWFJKYHY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 04/10] media: vsp1: drm: Remove vsp1_du_setup_lif()
Date:   Tue, 18 Jun 2019 00:09:24 +0300
Message-Id: <20190617210930.6054-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The vsp1_du_setup_lif() function is deprecated, and the users have been
removed. Remove the implementation and the associated configuration
structure.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 46 --------------------------
 include/media/vsp1.h                   | 22 ------------
 2 files changed, 68 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 900465caf1bf..3452d7a6dd89 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -815,52 +815,6 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
 }
 EXPORT_SYMBOL_GPL(vsp1_du_atomic_disable);
 
-/**
- * vsp1_du_setup_lif - Setup the output part of the VSP pipeline
- * @dev: the VSP device
- * @pipe_index: the DRM pipeline index
- * @cfg: the LIF configuration
- *
- * Configure the output part of VSP DRM pipeline for the given frame @cfg.width
- * and @cfg.height. This sets up formats on the BRx source pad, the WPF sink and
- * source pads, and the LIF sink pad.
- *
- * The @pipe_index argument selects which DRM pipeline to setup. The number of
- * available pipelines depend on the VSP instance.
- *
- * As the media bus code on the blend unit source pad is conditioned by the
- * configuration of its sink 0 pad, we also set up the formats on all blend unit
- * sinks, even if the configuration will be overwritten later by
- * vsp1_du_setup_rpf(). This ensures that the blend unit configuration is set to
- * a well defined state.
- *
- * Return 0 on success or a negative error code on failure.
- */
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg)
-{
-	struct vsp1_du_modeset_config modes;
-	struct vsp1_du_enable_config enable;
-	int ret;
-
-	if (!cfg)
-		return vsp1_du_atomic_disable(dev, pipe_index);
-
-	modes.width = cfg->width;
-	modes.height = cfg->height;
-	modes.interlaced = cfg->interlaced;
-
-	ret = vsp1_du_atomic_modeset(dev, pipe_index, &modes);
-	if (ret)
-		return ret;
-
-	enable.callback = cfg->callback;
-	enable.callback_data = cfg->callback_data;
-
-	return vsp1_du_atomic_enable(dev, pipe_index, &enable);
-}
-EXPORT_SYMBOL_GPL(vsp1_du_setup_lif);
-
 /**
  * vsp1_du_atomic_begin - Prepare for an atomic update
  * @dev: the VSP device
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index 56643f97d4c9..b8eadd62fd15 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -20,28 +20,6 @@ int vsp1_du_init(struct device *dev);
 #define VSP1_DU_STATUS_COMPLETE		BIT(0)
 #define VSP1_DU_STATUS_WRITEBACK	BIT(1)
 
-/**
- * struct vsp1_du_lif_config - VSP LIF configuration - Deprecated
- * @width: output frame width
- * @height: output frame height
- * @interlaced: true for interlaced pipelines
- * @callback: frame completion callback function (optional). When a callback
- *	      is provided, the VSP driver guarantees that it will be called once
- *	      and only once for each vsp1_du_atomic_flush() call.
- * @callback_data: data to be passed to the frame completion callback
- */
-struct vsp1_du_lif_config {
-	unsigned int width;
-	unsigned int height;
-	bool interlaced;
-
-	void (*callback)(void *data, unsigned int status, u32 crc);
-	void *callback_data;
-};
-
-int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
-		      const struct vsp1_du_lif_config *cfg);
-
 /**
  * struct vsp1_du_modeset_config - VSP display mode configuration
  * @width: output frame width
-- 
Regards,

Laurent Pinchart


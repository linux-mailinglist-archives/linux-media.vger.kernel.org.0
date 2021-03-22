Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2867A344B9A
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 17:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCVQf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 12:35:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45324 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCVQfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 12:35:44 -0400
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 426DAAD6;
        Mon, 22 Mar 2021 17:35:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616430942;
        bh=YeLkrOWMAdO9m8ZGYv3QSV1CzEXd3/2dbs9QC2k1zdI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mIVpxNYuhD+sZaeC3sM62bf1fp2k2D/89zCK7DpPRkxlqCPPIdmme9RdeMZllPft/
         hLeAQJEJs4+CiaCDKDCrMVEq2S4Z2OfBzUC89XxQgcfiLOQjr+x6Hgmyy4eMj7djvC
         NtyZf0lgDESU2DMRWG70J0feId2yAM7DTTWMLGSU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 04/10] media: vsp1: drm: Remove vsp1_du_setup_lif()
Date:   Mon, 22 Mar 2021 16:35:29 +0000
Message-Id: <20210322163535.1090570-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163535.1090570-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210322163535.1090570-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vsp1_du_setup_lif() function is deprecated, and the users have been
removed. Remove the implementation and the associated configuration
structure.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 46 --------------------------
 include/media/vsp1.h                   | 22 ------------
 2 files changed, 68 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index 4132027ead6c..a48986a24c31 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -814,52 +814,6 @@ int vsp1_du_atomic_disable(struct device *dev, unsigned int pipe_index)
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
index 253db8029752..a4eda8c9d048 100644
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
2.25.1


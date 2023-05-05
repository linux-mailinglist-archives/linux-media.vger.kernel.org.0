Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2726F8A68
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbjEEUvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjEEUvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:51:09 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDAF2129
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683319867; x=1714855867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTGGaI+VYTUKX3D8ADcBoMdayo22We1GDY4OVzoI3X4=;
  b=h5VQF1E2anbEsTdrLVJtxvlsfgpXNwvwVJyH5kbdsdLHbWLPHpwdTgip
   9x56WuryJZ9wAcZ9vSxITXnHzJf5DlaCYyPJf3DB5i5hgSVXsq+6Zh15D
   WpBFbgp3WDLr4r2RDbHcDjLqp44Jw61SaO+hYbqyhPEeOYsTglggYDstx
   TSPivqOHICm4jouMwZYS/saJGij2pcqje0Jh/shq6OeBhIByABo5yFd0Z
   lE0bmx1Ee5IxPdvuHhR/kqjZ2tDlaUApqT09TxEWLQePf9tov1fJWhMfl
   5QLc2aWE8Zsu1npiSG9IHymMHu1hs5fFFLL3lGopE8VekA48uTtM1uILk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352346066"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352346066"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762602656"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="762602656"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:05 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 85CC4120945;
        Fri,  5 May 2023 23:51:02 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: [PATCH 1/3] media: mc: Make media_get_pad_index() use pad type flag
Date:   Fri,  5 May 2023 23:50:59 +0300
Message-Id: <20230505205101.54569-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pad flag specifying the pad type instead of a boolean in
preparation for internal source pads.

Also make the loop variable unsigned.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/dvb-core/dvbdev.c        |  4 +--
 drivers/media/mc/mc-entity.c           | 16 ++++-------
 drivers/media/usb/au0828/au0828-core.c |  2 +-
 drivers/media/v4l2-core/v4l2-mc.c      | 38 +++++++++++++++++---------
 include/media/media-entity.h           |  4 +--
 5 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 0ed087caf7f3..0091b5375e45 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -707,7 +707,7 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
 						     MEDIA_LNK_FL_ENABLED,
 						     false);
 		} else {
-			pad_sink = media_get_pad_index(tuner, true,
+			pad_sink = media_get_pad_index(tuner, MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_sink < 0)
 				return -EINVAL;
@@ -725,7 +725,7 @@ int dvb_create_media_graph(struct dvb_adapter *adap,
 
 	if (ntuner && ndemod) {
 		/* NOTE: first found tuner source pad presumed correct */
-		pad_source = media_get_pad_index(tuner, false,
+		pad_source = media_get_pad_index(tuner, MEDIA_PAD_FL_SOURCE,
 						 PAD_SIGNAL_ANALOG);
 		if (pad_source < 0)
 			return -EINVAL;
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index e7216a985ba6..ef34ddd715c9 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1052,25 +1052,19 @@ static void __media_entity_remove_link(struct media_entity *entity,
 	kfree(link);
 }
 
-int media_get_pad_index(struct media_entity *entity, bool is_sink,
+int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 			enum media_pad_signal_type sig_type)
 {
-	int i;
-	bool pad_is_sink;
+	unsigned int i;
 
 	if (!entity)
 		return -EINVAL;
 
 	for (i = 0; i < entity->num_pads; i++) {
-		if (entity->pads[i].flags & MEDIA_PAD_FL_SINK)
-			pad_is_sink = true;
-		else if (entity->pads[i].flags & MEDIA_PAD_FL_SOURCE)
-			pad_is_sink = false;
-		else
-			continue;	/* This is an error! */
-
-		if (pad_is_sink != is_sink)
+		if ((entity->pads[i].flags &
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
 			continue;
+
 		if (entity->pads[i].sig_type == sig_type)
 			return i;
 	}
diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index b3a09d3ac7d2..1e246b47766d 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -250,7 +250,7 @@ static void au0828_media_graph_notify(struct media_entity *new,
 
 create_link:
 	if (decoder && mixer) {
-		ret = media_get_pad_index(decoder, false,
+		ret = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
 					  PAD_SIGNAL_AUDIO);
 		if (ret >= 0)
 			ret = media_create_pad_link(decoder, ret,
diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index bf0c18100664..209a7efd08fe 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -105,9 +105,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 	/* Link the tuner and IF video output pads */
 	if (tuner) {
 		if (if_vid) {
-			pad_source = media_get_pad_index(tuner, false,
+			pad_source = media_get_pad_index(tuner,
+							 MEDIA_PAD_FL_SOURCE,
 							 PAD_SIGNAL_ANALOG);
-			pad_sink = media_get_pad_index(if_vid, true,
+			pad_sink = media_get_pad_index(if_vid,
+						       MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_source < 0 || pad_sink < 0) {
 				dev_warn(mdev->dev, "Couldn't get tuner and/or PLL pad(s): (%d, %d)\n",
@@ -122,9 +124,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 				return ret;
 			}
 
-			pad_source = media_get_pad_index(if_vid, false,
+			pad_source = media_get_pad_index(if_vid,
+							 MEDIA_PAD_FL_SOURCE,
 							 PAD_SIGNAL_ANALOG);
-			pad_sink = media_get_pad_index(decoder, true,
+			pad_sink = media_get_pad_index(decoder,
+						       MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_source < 0 || pad_sink < 0) {
 				dev_warn(mdev->dev, "get decoder and/or PLL pad(s): (%d, %d)\n",
@@ -139,9 +143,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 				return ret;
 			}
 		} else {
-			pad_source = media_get_pad_index(tuner, false,
+			pad_source = media_get_pad_index(tuner,
+							 MEDIA_PAD_FL_SOURCE,
 							 PAD_SIGNAL_ANALOG);
-			pad_sink = media_get_pad_index(decoder, true,
+			pad_sink = media_get_pad_index(decoder,
+						       MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_source < 0 || pad_sink < 0) {
 				dev_warn(mdev->dev, "couldn't get tuner and/or decoder pad(s): (%d, %d)\n",
@@ -156,9 +162,11 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 		}
 
 		if (if_aud) {
-			pad_source = media_get_pad_index(tuner, false,
+			pad_source = media_get_pad_index(tuner,
+							 MEDIA_PAD_FL_SOURCE,
 							 PAD_SIGNAL_AUDIO);
-			pad_sink = media_get_pad_index(if_aud, true,
+			pad_sink = media_get_pad_index(if_aud,
+						       MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_AUDIO);
 			if (pad_source < 0 || pad_sink < 0) {
 				dev_warn(mdev->dev, "couldn't get tuner and/or decoder pad(s) for audio: (%d, %d)\n",
@@ -180,7 +188,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 
 	/* Create demod to V4L, VBI and SDR radio links */
 	if (io_v4l) {
-		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
+		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
+						 PAD_SIGNAL_DV);
 		if (pad_source < 0) {
 			dev_warn(mdev->dev, "couldn't get decoder output pad for V4L I/O\n");
 			return -EINVAL;
@@ -195,7 +204,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 	}
 
 	if (io_swradio) {
-		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
+		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
+						 PAD_SIGNAL_DV);
 		if (pad_source < 0) {
 			dev_warn(mdev->dev, "couldn't get decoder output pad for SDR\n");
 			return -EINVAL;
@@ -210,7 +220,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 	}
 
 	if (io_vbi) {
-		pad_source = media_get_pad_index(decoder, false, PAD_SIGNAL_DV);
+		pad_source = media_get_pad_index(decoder, MEDIA_PAD_FL_SOURCE,
+						 PAD_SIGNAL_DV);
 		if (pad_source < 0) {
 			dev_warn(mdev->dev, "couldn't get decoder output pad for VBI\n");
 			return -EINVAL;
@@ -231,7 +242,7 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 		case MEDIA_ENT_F_CONN_RF:
 			if (!tuner)
 				continue;
-			pad_sink = media_get_pad_index(tuner, true,
+			pad_sink = media_get_pad_index(tuner, MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_sink < 0) {
 				dev_warn(mdev->dev, "couldn't get tuner analog pad sink\n");
@@ -243,7 +254,8 @@ int v4l2_mc_create_media_graph(struct media_device *mdev)
 			break;
 		case MEDIA_ENT_F_CONN_SVIDEO:
 		case MEDIA_ENT_F_CONN_COMPOSITE:
-			pad_sink = media_get_pad_index(decoder, true,
+			pad_sink = media_get_pad_index(decoder,
+						       MEDIA_PAD_FL_SINK,
 						       PAD_SIGNAL_ANALOG);
 			if (pad_sink < 0) {
 				dev_warn(mdev->dev, "couldn't get decoder analog pad sink\n");
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 741f9c629c6f..e4f556911c3f 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -741,7 +741,7 @@ static inline void media_entity_cleanup(struct media_entity *entity) {}
  * media_get_pad_index() - retrieves a pad index from an entity
  *
  * @entity:	entity where the pads belong
- * @is_sink:	true if the pad is a sink, false if it is a source
+ * @pad_type:	the type of the pad, one of MEDIA_PAD_FL_* pad types
  * @sig_type:	type of signal of the pad to be search
  *
  * This helper function finds the first pad index inside an entity that
@@ -752,7 +752,7 @@ static inline void media_entity_cleanup(struct media_entity *entity) {}
  * On success, return the pad number. If the pad was not found or the media
  * entity is a NULL pointer, return -EINVAL.
  */
-int media_get_pad_index(struct media_entity *entity, bool is_sink,
+int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 			enum media_pad_signal_type sig_type);
 
 /**
-- 
2.30.2


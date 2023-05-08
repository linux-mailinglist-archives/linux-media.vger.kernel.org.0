Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574BF6FA349
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233695AbjEHJ2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 05:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233725AbjEHJ2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 05:28:18 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB1922F64
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683538096; x=1715074096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ayxhnRIeh+yLoEVgha/DBkkn2S1YgpSzN+HcXyFzzLA=;
  b=eRJi7gkV1h9D38N0XirvYM+X2X8tVm4PS+JaUhY+PaFwWiFrAgaI8vvs
   FS2QQybO54aMby8auXih6Eu4qUpxOmPOoNAdV1TybfDrKJH8UZSRIBEwQ
   bGV8eLWbUNtND0DEfYQBZnGakv/9ezmP6KLvdnLxf2XTXBvnhinqueH6d
   zQ4UXv6t7As5yPEXFvK0hi9H6j6ILv4hJVQqiRGC+BSPwWpAwedqnFnMN
   Wqwe8rnaYIs6SqEs7FqJqGL5Kb4t45VRAYyn67AoVfCZzDg3NBLfYS1vD
   egs1l7OgEJ0EP/vqu68nalXsRWV/NWQd4INHOUj0O1LQ5VEeh8oYFzoMd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415159369"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415159369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810191835"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="810191835"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:27:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9616F120C31;
        Mon,  8 May 2023 12:17:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: [PATCH 1/3] media: mc: Make media_get_pad_index() use pad type flag
Date:   Mon,  8 May 2023 12:17:51 +0300
Message-Id: <20230508091753.80803-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230508091753.80803-1-sakari.ailus@linux.intel.com>
References: <20230508091753.80803-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pad flag specifying the pad type instead of a boolean in
preparation for internal source pads.

Also make the loop variable unsigned.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


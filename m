Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E23338D6F
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhCLMtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhCLMsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:48:37 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C79C0613D7
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:37 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id h13so7765109eds.5
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 04:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RYWQRmXCJ6/UasbZqdSmOkECNSkwLA511lEj8hQno1s=;
        b=P0zLdIoN9Db+vChLZxTPPY7MrgEFqGwJOeV2eA0S3GkEL36dCyhMCAkosfL0Z30qwH
         s16cojezgadqigRoWXf5IhZNME9w3flx3uoVQ1Cthgx4iBBJzr/9JEnxCm7cW3zG590Z
         CglKO0vbm9C5QK55JEaqGRuslBSKCFLftSEyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RYWQRmXCJ6/UasbZqdSmOkECNSkwLA511lEj8hQno1s=;
        b=sSoHR3zmq5GxTiETQj3fiLRfqyyThLSbC9IzEP69+v+5Cax0Q9irggm5u4wZwpUXbo
         5uaHb+GGR6SIv2r1X2wsCHVMtCMIa9kmqIC8BiNrsdOwLOtzE0Z5yBGpJennhQC/XoJu
         7+oJDo+6T/uxvVDELs0MsK1FEip8NMc2s12zGKVq+oyJCUW8Cn1P3UocwrzA8JhypmyQ
         6ic7eiJdCiVB2ZqBr3GRG39CRP3k57EDbHPOaczYuSPFh2mHA5ZSUbv8jO6HlXVLTRlI
         TEkxRhkSqiFKoj6jEsG89pc9VU8RwbzwluCY2bCpfL5gjWPGJp1SB991hkfLnbuOYzQ/
         YhJQ==
X-Gm-Message-State: AOAM532XCRuHp+A+RZZhh+BXLOtXc3/O71aMb8FkQaKSmYFYQs4aYaW2
        vLujCGTVWFUzpnz1/d22l0R1SQ==
X-Google-Smtp-Source: ABdhPJx9YdxadcVvV2c8nkrrz+EIfOtZ1hMfeAhgAv7JomUf+Zjmo0mag5/xaiZDj3KFIIXq59ovcA==
X-Received: by 2002:a05:6402:d07:: with SMTP id eb7mr13509064edb.242.1615553316058;
        Fri, 12 Mar 2021 04:48:36 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t6sm2924402edq.48.2021.03.12.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:48:35 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 5/8] media: uvcvideo: refactor __uvc_ctrl_add_mapping
Date:   Fri, 12 Mar 2021 13:48:27 +0100
Message-Id: <20210312124830.1344255-6-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312124830.1344255-1-ribalda@chromium.org>
References: <20210312124830.1344255-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass the chain instead of the device. We want to keed the reference to
the chain that controls belong to.

We need to delay the initialization of the controls after the chains
have been initialized.

This is a cleanup needed for the next patches.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_driver.c |  8 +++---
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b3dde98499f4..90ecdc24d70a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2057,7 +2057,7 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
 /*
  * Add a control mapping to a given control.
  */
-static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
+static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 	struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
 {
 	struct uvc_control_mapping *map;
@@ -2086,7 +2086,7 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
 		map->set = uvc_set_le_value;
 
 	list_add_tail(&map->list, &ctrl->info.mappings);
-	uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
+	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
 		map->name, ctrl->info.entity, ctrl->info.selector);
 
 	return 0;
@@ -2168,7 +2168,7 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
 		goto done;
 	}
 
-	ret = __uvc_ctrl_add_mapping(dev, ctrl, mapping);
+	ret = __uvc_ctrl_add_mapping(chain, ctrl, mapping);
 	if (ret < 0)
 		atomic_dec(&dev->nmappings);
 
@@ -2244,7 +2244,8 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
  * Add control information and hardcoded stock control mappings to the given
  * device.
  */
-static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
+static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
+			       struct uvc_control *ctrl)
 {
 	const struct uvc_control_info *info = uvc_ctrls;
 	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
@@ -2263,14 +2264,14 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
 	for (; info < iend; ++info) {
 		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
 		    ctrl->index == info->index) {
-			uvc_ctrl_add_info(dev, ctrl, info);
+			uvc_ctrl_add_info(chain->dev, ctrl, info);
 			/*
 			 * Retrieve control flags from the device. Ignore errors
 			 * and work with default flag values from the uvc_ctrl
 			 * array when the device doesn't properly implement
 			 * GET_INFO on standard controls.
 			 */
-			uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
+			uvc_ctrl_get_flags(chain->dev, ctrl, &ctrl->info);
 			break;
 		 }
 	}
@@ -2281,22 +2282,20 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
 	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
-			__uvc_ctrl_add_mapping(dev, ctrl, mapping);
+			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
 	}
 }
 
 /*
  * Initialize device controls.
  */
-int uvc_ctrl_init_device(struct uvc_device *dev)
+static int uvc_ctrl_init_chain(struct uvc_video_chain *chain)
 {
 	struct uvc_entity *entity;
 	unsigned int i;
 
-	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
-
 	/* Walk the entities list and instantiate controls */
-	list_for_each_entry(entity, &dev->entities, list) {
+	list_for_each_entry(entity, &chain->entities, chain) {
 		struct uvc_control *ctrl;
 		unsigned int bControlSize = 0, ncontrols;
 		u8 *bmControls = NULL;
@@ -2316,7 +2315,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 		}
 
 		/* Remove bogus/blacklisted controls */
-		uvc_ctrl_prune_entity(dev, entity);
+		uvc_ctrl_prune_entity(chain->dev, entity);
 
 		/* Count supported controls and allocate the controls array */
 		ncontrols = memweight(bmControls, bControlSize);
@@ -2338,7 +2337,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 			ctrl->entity = entity;
 			ctrl->index = i;
 
-			uvc_ctrl_init_ctrl(dev, ctrl);
+			uvc_ctrl_init_ctrl(chain, ctrl);
 			ctrl++;
 		}
 	}
@@ -2346,6 +2345,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 	return 0;
 }
 
+int uvc_ctrl_init_device(struct uvc_device *dev)
+{
+	struct uvc_video_chain *chain;
+	int ret;
+
+	INIT_WORK(&dev->async_ctrl.work, uvc_ctrl_status_event_work);
+
+	list_for_each_entry(chain, &dev->chains, list) {
+		ret = uvc_ctrl_init_chain(chain);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 /*
  * Cleanup device controls.
  */
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 30ef2a3110f7..35873cf2773d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2423,14 +2423,14 @@ static int uvc_probe(struct usb_interface *intf,
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
 
-	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0)
-		goto error;
-
 	/* Scan the device for video chains. */
 	if (uvc_scan_device(dev) < 0)
 		goto error;
 
+	/* Initialize controls. */
+	if (uvc_ctrl_init_device(dev) < 0)
+		goto error;
+
 	/* Register video device nodes. */
 	if (uvc_register_chains(dev) < 0)
 		goto error;
-- 
2.31.0.rc2.261.g7f71774620-goog


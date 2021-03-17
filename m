Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B76D33F5E4
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 17:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhCQQpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 12:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhCQQpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 12:45:21 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E35C061760
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:21 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y6so3112877eds.1
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LyOZSvQ+FKwW7E5BHy4fGSxNISgDCKWH+IcVuvUxQPk=;
        b=iYLu0JRgeTaPpxL5DIp4RNVc4Y7prE4PLoanku/C4jPfTy+3a6bCgOg0IvWdX88RL3
         I2h+A3rkiAl/pdJNCJ/sH1tvXctOn56nwqlTmhuEAXVAMIV4deEOQA5RWf29G43VQ+qo
         NNVDc+JwfloqVsI5xT+8u3vpMs1gMusn8Subo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LyOZSvQ+FKwW7E5BHy4fGSxNISgDCKWH+IcVuvUxQPk=;
        b=HgiM5sEY0ef83CNAcfpzbjCT6UbMth06keFgRETE6MsXdNsi7xOeoxH4nkUfpuSy6h
         1bCxCq21hN13UUkBAXw9xlGlzvx18zr4jumcB23n9c0+g4W4lcv/Ecsfv4AC/bupgRVi
         efgwCMVpElm/DdvwyJsCphAfeMC/oPm8cAYSL6bY84bBmisqB4SA5NaCzWJKLc5v1bNP
         62WVZuDnxof8vEnOxiQZu5WHh3cTCjUhoGt9F7ig4XlW0NH3OjKP5jlC63xKb71bEHAN
         A8zvOy5iH7oVjNDmv9AoAWQq20aaNm+FIWhJvTGWbIkO+BUjNAsdg4dJJwiS7jDgY0xs
         Ac9w==
X-Gm-Message-State: AOAM53234V1QMOrgyy9xnKM/VYXUfBIZpc/gqvQ4eXyyjmGoLuuA8ri0
        WMfc1zjb+0Qw2mI8e22Co3JVhQ==
X-Google-Smtp-Source: ABdhPJzthV3I5PE60pkq56h496C//OeXYM1dzfMBm8vnvqf1BBS86gWkzoFRIhi8v/b+VVj+ssVYNA==
X-Received: by 2002:aa7:d503:: with SMTP id y3mr42668912edq.142.1615999519426;
        Wed, 17 Mar 2021 09:45:19 -0700 (PDT)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hy25sm12088128ejc.119.2021.03.17.09.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 09:45:19 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 09/17] media: uvcvideo: refactor __uvc_ctrl_add_mapping
Date:   Wed, 17 Mar 2021 17:45:03 +0100
Message-Id: <20210317164511.39967-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210317164511.39967-1-ribalda@chromium.org>
References: <20210317164511.39967-1-ribalda@chromium.org>
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_driver.c |  8 +++---
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b3dde98499f4..b75da65115ef 100644
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
+	return 0;
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


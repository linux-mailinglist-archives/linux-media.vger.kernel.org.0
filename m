Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040092F319C
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbhALNZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbhALNZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:25:16 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8401AC0617A3
        for <linux-media@vger.kernel.org>; Tue, 12 Jan 2021 05:24:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 923521F451D7
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 10/13] media: davinci: vpif_display: Remove unused v4l2-async code
Date:   Tue, 12 Jan 2021 10:23:36 -0300
Message-Id: <20210112132339.5621-11-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112132339.5621-1-ezequiel@collabora.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are no users for vpif_display_config.asd_sizes
and vpif_display_config.asd members, which means the v4l2-async
subdevices aren't being defined anywhere.

Remove the v4l2-async, leaving only the synchronous setup.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/davinci/vpif_display.c | 86 ++++---------------
 drivers/media/platform/davinci/vpif_display.h |  1 -
 include/media/davinci/vpif_types.h            |  2 -
 3 files changed, 15 insertions(+), 74 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index 46afc029138f..e5f61d9b221d 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -1117,23 +1117,6 @@ static void free_vpif_objs(void)
 		kfree(vpif_obj.dev[i]);
 }
 
-static int vpif_async_bound(struct v4l2_async_notifier *notifier,
-			    struct v4l2_subdev *subdev,
-			    struct v4l2_async_subdev *asd)
-{
-	int i;
-
-	for (i = 0; i < vpif_obj.config->subdev_count; i++)
-		if (!strcmp(vpif_obj.config->subdevinfo[i].name,
-			    subdev->name)) {
-			vpif_obj.sd[i] = subdev;
-			vpif_obj.sd[i]->grp_id = 1 << i;
-			return 0;
-		}
-
-	return -EINVAL;
-}
-
 static int vpif_probe_complete(void)
 {
 	struct common_obj *common;
@@ -1230,16 +1213,6 @@ static int vpif_probe_complete(void)
 	return err;
 }
 
-static int vpif_async_complete(struct v4l2_async_notifier *notifier)
-{
-	return vpif_probe_complete();
-}
-
-static const struct v4l2_async_notifier_operations vpif_async_ops = {
-	.bound = vpif_async_bound,
-	.complete = vpif_async_complete,
-};
-
 /*
  * vpif_probe: This function creates device entries by register itself to the
  * V4L2 driver and initializes fields of each channel objects
@@ -1294,52 +1267,28 @@ static __init int vpif_probe(struct platform_device *pdev)
 		goto vpif_unregister;
 	}
 
-	v4l2_async_notifier_init(&vpif_obj.notifier);
-
-	if (!vpif_obj.config->asd_sizes) {
-		i2c_adap = i2c_get_adapter(vpif_obj.config->i2c_adapter_id);
-		for (i = 0; i < subdev_count; i++) {
-			vpif_obj.sd[i] =
-				v4l2_i2c_new_subdev_board(&vpif_obj.v4l2_dev,
-							  i2c_adap,
-							  &subdevdata[i].
-							  board_info,
-							  NULL);
-			if (!vpif_obj.sd[i]) {
-				vpif_err("Error registering v4l2 subdevice\n");
-				err = -ENODEV;
-				goto probe_subdev_out;
-			}
-
-			if (vpif_obj.sd[i])
-				vpif_obj.sd[i]->grp_id = 1 << i;
-		}
-		err = vpif_probe_complete();
-		if (err) {
+	i2c_adap = i2c_get_adapter(vpif_obj.config->i2c_adapter_id);
+	for (i = 0; i < subdev_count; i++) {
+		vpif_obj.sd[i] =
+			v4l2_i2c_new_subdev_board(&vpif_obj.v4l2_dev,
+						  i2c_adap,
+						  &subdevdata[i].board_info,
+						  NULL);
+		if (!vpif_obj.sd[i]) {
+			vpif_err("Error registering v4l2 subdevice\n");
+			err = -ENODEV;
 			goto probe_subdev_out;
 		}
-	} else {
-		for (i = 0; i < vpif_obj.config->asd_sizes[0]; i++) {
-			err = v4l2_async_notifier_add_subdev(
-				&vpif_obj.notifier, vpif_obj.config->asd[i]);
-			if (err)
-				goto probe_cleanup;
-		}
 
-		vpif_obj.notifier.ops = &vpif_async_ops;
-		err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
-						   &vpif_obj.notifier);
-		if (err) {
-			vpif_err("Error registering async notifier\n");
-			err = -EINVAL;
-			goto probe_cleanup;
-		}
+		if (vpif_obj.sd[i])
+			vpif_obj.sd[i]->grp_id = 1 << i;
 	}
+	err = vpif_probe_complete();
+	if (err)
+		goto probe_subdev_out;
 
 	return 0;
 
-probe_cleanup:
-	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 probe_subdev_out:
 	kfree(vpif_obj.sd);
 vpif_unregister:
@@ -1358,11 +1307,6 @@ static int vpif_remove(struct platform_device *device)
 	struct channel_obj *ch;
 	int i;
 
-	if (vpif_obj.config->asd_sizes) {
-		v4l2_async_notifier_unregister(&vpif_obj.notifier);
-		v4l2_async_notifier_cleanup(&vpif_obj.notifier);
-	}
-
 	v4l2_device_unregister(&vpif_obj.v4l2_dev);
 
 	kfree(vpif_obj.sd);
diff --git a/drivers/media/platform/davinci/vpif_display.h b/drivers/media/platform/davinci/vpif_display.h
index f731a65eefd6..f98062e79167 100644
--- a/drivers/media/platform/davinci/vpif_display.h
+++ b/drivers/media/platform/davinci/vpif_display.h
@@ -118,7 +118,6 @@ struct vpif_device {
 	struct v4l2_device v4l2_dev;
 	struct channel_obj *dev[VPIF_DISPLAY_NUM_CHANNELS];
 	struct v4l2_subdev **sd;
-	struct v4l2_async_notifier notifier;
 	struct vpif_display_config *config;
 };
 
diff --git a/include/media/davinci/vpif_types.h b/include/media/davinci/vpif_types.h
index 8439e46fb993..d03e5c54347a 100644
--- a/include/media/davinci/vpif_types.h
+++ b/include/media/davinci/vpif_types.h
@@ -48,8 +48,6 @@ struct vpif_display_config {
 	int i2c_adapter_id;
 	struct vpif_display_chan_config chan_config[VPIF_DISPLAY_MAX_CHANNELS];
 	const char *card_name;
-	struct v4l2_async_subdev **asd;	/* Flat array, arranged in groups */
-	int *asd_sizes;		/* 0-terminated array of asd group sizes */
 };
 
 struct vpif_input {
-- 
2.29.2


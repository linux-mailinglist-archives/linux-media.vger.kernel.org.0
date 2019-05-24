Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5991A28FA5
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 05:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388884AbfEXDbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 23:31:15 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:39788 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388842AbfEXDbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 23:31:07 -0400
Received: by mail-it1-f193.google.com with SMTP id 9so11747597itf.4
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 20:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NOUKIenyWb7JRfVgX8S9ZQxhYo8YmVHyOF5VfRnqqnU=;
        b=X0ZyTNLUV4MYdlt/N9pw7L0gcErjDhxg4776cUOYRdKvdZE6axWY4ADF/n4JSJL45S
         yc41KrztoFZ55N/9hhs9G+aRFN9SV65DFmTe4qiwZq1VZ69vgyBxmvtVkZ6qxEFa8Sdm
         7JR0xozjFco66xO7BLKXBUUWaxwmEyat0S5+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NOUKIenyWb7JRfVgX8S9ZQxhYo8YmVHyOF5VfRnqqnU=;
        b=Kz8cg8SJLSUX1scmL9PjjEbDl4Wsoq/5cselxGO1476T9EHjEguxN5qwBnS/akEgmU
         G5focBQl+wSi6FadJPP1e9sUQttLRXEc6HbS5BWvOZCrn/n5Dg3W0BMZzNkwLgWXmQsE
         LZe/vUalFbPe/4IwlGi+0ULgPZx69lGOBjnhGqTVkgx0niHiWujgTITebx2mo6OZsNtE
         JPSW/8sfqKdEx/TA/e8FzTPDFpAtrF6LdNlsZQu7/G9wxBQ8mRd9gYpQyP++grZbutF/
         4VzEYpUOejaBi0zhS6YijF3HQXn8QkDMBxidVfY8nSUuAOy0w03u3HjOzrim1HQ8Pjwi
         Z85Q==
X-Gm-Message-State: APjAAAXtY+LhAx1KrDbdVg8FOT5ZOscfju+qZZtQf1h91+GV0EZcuIf7
        avn0pv1gOgywB20fJU1Rw4OUBw==
X-Google-Smtp-Source: APXvYqxrC7TCMRHK8N8IHE5h7ev8RjCQc4FxNge1LGVH5IeG8wiGGrGpvbHa86ZtBjIaAtF1NprWpQ==
X-Received: by 2002:a24:8957:: with SMTP id s84mr14440493itd.131.1558668666550;
        Thu, 23 May 2019 20:31:06 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h185sm794380itb.16.2019.05.23.20.31.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 20:31:06 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        helen.koike@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] vimc: fix BUG: unable to handle kernel NULL pointer dereference
Date:   Thu, 23 May 2019 21:31:02 -0600
Message-Id: <8186974e3b6976e1391343e5b0da11ffc98ac75d.1558667245.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1558667245.git.skhan@linuxfoundation.org>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If vimc module is removed while streaming is active, vimc_exit runs
into NULL pointer dereference error when streaming thread tries to
access and lock graph_mutex in the struct media_device.

media_device is embedded in struct vimc_device and when vimc is removed
vimc_device and the embedded media_device goes with it, while the active
stream and vimc_capture continue to access it.

Fix the media_device lifetime problem by changing vimc to create shared
media_device using Media Device Allocator API and vimc_capture getting
a reference to vimc module. With this change, vimc module can be removed
only when the references are gone. vimc can be removed after vimc_capture
is removed.

The following panic is fixed with this change.

 kernel: [ 1844.098372] Call Trace:
 kernel: [ 1844.098376]  lock_acquire+0xb4/0x160
 kernel: [ 1844.098379]  ? media_pipeline_stop+0x23/0x40
 kernel: [ 1844.098381]  ? media_pipeline_stop+0x23/0x40
 kernel: [ 1844.098385]  __mutex_lock+0x8b/0x950
 kernel: [ 1844.098386]  ? media_pipeline_stop+0x23/0x40
 kernel: [ 1844.098389]  ? wait_for_completion+0xac/0x150
 kernel: [ 1844.098391]  ? wait_for_completion+0x12a/0x150
 kernel: [ 1844.098395]  ? wake_up_q+0x80/0x80
 kernel: [ 1844.098397]  mutex_lock_nested+0x1b/0x20
 kernel: [ 1844.098398]  ? mutex_lock_nested+0x1b/0x20
 kernel: [ 1844.098400]  media_pipeline_stop+0x23/0x40
 kernel: [ 1844.098404]  vimc_cap_stop_streaming+0x28/0x40 [vimc_capture]
 kernel: [ 1844.098406]  __vb2_queue_cancel+0x30/0x2a0
 kernel: [ 1844.098408]  vb2_core_queue_release+0x23/0x50
 kernel: [ 1844.098410]  vb2_queue_release+0xe/0x10
 kernel: [ 1844.098412]  vimc_cap_comp_unbind+0x1d/0x40 [vimc_capture]
 kernel: [ 1844.098414]  component_unbind.isra.8+0x27/0x40
 kernel: [ 1844.098416]  component_unbind_all+0xaa/0xc0
 kernel: [ 1844.098418]  vimc_comp_unbind+0x2d/0x60 [vimc]
 kernel: [ 1844.098420]  take_down_master+0x24/0x40
 kernel: [ 1844.098422]  component_master_del+0x5e/0x80
 kernel: [ 1844.098424]  vimc_remove+0x27/0x90 [vimc]
 kernel: [ 1844.098426]  platform_drv_remove+0x28/0x50
 kernel: [ 1844.098428]  device_release_driver_internal+0xec/0x1c0
 kernel: [ 1844.098429]  driver_detach+0x49/0x90
 kernel: [ 1844.098432]  bus_remove_driver+0x5c/0xd0
 kernel: [ 1844.098433]  driver_unregister+0x2c/0x40
 kernel: [ 1844.098435]  platform_driver_unregister+0x12/0x20
 kernel: [ 1844.098437]  vimc_exit+0x10/0x9fa [vimc]
 kernel: [ 1844.098439]  __x64_sys_delete_module+0x148/0x280
 kernel: [ 1844.098443]  do_syscall_64+0x5a/0x120
 kernel: [ 1844.098446]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/platform/vimc/vimc-capture.c | 17 +++++-
 drivers/media/platform/vimc/vimc-core.c    | 60 ++++++++++++----------
 2 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index e7d0fc2228a6..2e5cf794f60f 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
+#include <media/media-dev-allocator.h>
 
 #include "vimc-common.h"
 #include "vimc-streamer.h"
@@ -72,6 +73,8 @@ struct vimc_cap_device {
 	struct mutex lock;
 	u32 sequence;
 	struct vimc_stream stream;
+	/* Used for holding reference to media dev allocated by vimc-core */
+	struct media_device *mdev;
 };
 
 static const struct v4l2_pix_format fmt_default = {
@@ -371,6 +374,7 @@ static void vimc_cap_release(struct video_device *vdev)
 		container_of(vdev, struct vimc_cap_device, vdev);
 
 	vimc_pads_cleanup(vcap->ved.pads);
+	media_device_delete(vcap->mdev, VIMC_CAP_DRV_NAME, THIS_MODULE);
 	kfree(vcap);
 }
 
@@ -440,12 +444,21 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	if (!vcap)
 		return -ENOMEM;
 
+	/* first get reference to media device allocated by vimc */
+	vcap->mdev = media_device_allocate(master, NULL, NULL,
+					   VIMC_CAP_DRV_NAME,
+					   THIS_MODULE);
+	if (!vcap->mdev) {
+		ret = PTR_ERR(vcap->mdev);
+		goto err_free_vcap;
+	}
+
 	/* Allocate the pads */
 	vcap->ved.pads =
 		vimc_pads_init(1, (const unsigned long[1]) {MEDIA_PAD_FL_SINK});
 	if (IS_ERR(vcap->ved.pads)) {
 		ret = PTR_ERR(vcap->ved.pads);
-		goto err_free_vcap;
+		goto err_mdev_rls_ref;
 	}
 
 	/* Initialize the media entity */
@@ -524,6 +537,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	media_entity_cleanup(&vcap->vdev.entity);
 err_clean_pads:
 	vimc_pads_cleanup(vcap->ved.pads);
+err_mdev_rls_ref:
+	media_device_delete(vcap->mdev, VIMC_CAP_DRV_NAME, THIS_MODULE);
 err_free_vcap:
 	kfree(vcap);
 
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 3aa62d7e3d0e..d381993f3d7e 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <media/media-device.h>
+#include <media/media-dev-allocator.h>
 #include <media/v4l2-device.h>
 
 #include "vimc-common.h"
@@ -42,7 +43,7 @@ struct vimc_device {
 	const struct vimc_pipeline_config *pipe_cfg;
 
 	/* The Associated media_device parent */
-	struct media_device mdev;
+	struct media_device *mdev;
 
 	/* Internal v4l2 parent device*/
 	struct v4l2_device v4l2_dev;
@@ -182,9 +183,9 @@ static int vimc_comp_bind(struct device *master)
 	dev_dbg(master, "bind");
 
 	/* Register the v4l2 struct */
-	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
+	ret = v4l2_device_register(vimc->mdev->dev, &vimc->v4l2_dev);
 	if (ret) {
-		dev_err(vimc->mdev.dev,
+		dev_err(vimc->mdev->dev,
 			"v4l2 device register failed (err=%d)\n", ret);
 		return ret;
 	}
@@ -200,9 +201,9 @@ static int vimc_comp_bind(struct device *master)
 		goto err_comp_unbind_all;
 
 	/* Register the media device */
-	ret = media_device_register(&vimc->mdev);
+	ret = media_device_register(vimc->mdev);
 	if (ret) {
-		dev_err(vimc->mdev.dev,
+		dev_err(vimc->mdev->dev,
 			"media device register failed (err=%d)\n", ret);
 		goto err_comp_unbind_all;
 	}
@@ -210,7 +211,7 @@ static int vimc_comp_bind(struct device *master)
 	/* Expose all subdev's nodes*/
 	ret = v4l2_device_register_subdev_nodes(&vimc->v4l2_dev);
 	if (ret) {
-		dev_err(vimc->mdev.dev,
+		dev_err(vimc->mdev->dev,
 			"vimc subdev nodes registration failed (err=%d)\n",
 			ret);
 		goto err_mdev_unregister;
@@ -219,8 +220,7 @@ static int vimc_comp_bind(struct device *master)
 	return 0;
 
 err_mdev_unregister:
-	media_device_unregister(&vimc->mdev);
-	media_device_cleanup(&vimc->mdev);
+	media_device_delete(vimc->mdev, VIMC_PDEV_NAME, THIS_MODULE);
 err_comp_unbind_all:
 	component_unbind_all(master, NULL);
 err_v4l2_unregister:
@@ -236,8 +236,7 @@ static void vimc_comp_unbind(struct device *master)
 
 	dev_dbg(master, "unbind");
 
-	media_device_unregister(&vimc->mdev);
-	media_device_cleanup(&vimc->mdev);
+	media_device_delete(vimc->mdev, VIMC_PDEV_NAME, THIS_MODULE);
 	component_unbind_all(master, NULL);
 	v4l2_device_unregister(&vimc->v4l2_dev);
 }
@@ -301,42 +300,51 @@ static int vimc_probe(struct platform_device *pdev)
 	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
 	struct component_match *match = NULL;
 	int ret;
+	char bus_info[32]; /* same size as struct media_device bus_info */
 
 	dev_dbg(&pdev->dev, "probe");
 
-	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
+	/* Initialize media device */
+	snprintf(bus_info, sizeof(bus_info), "platform:%s", VIMC_PDEV_NAME);
+	vimc->mdev = media_device_allocate(&pdev->dev,
+					   VIMC_MDEV_MODEL_NAME,
+					   bus_info,
+					   VIMC_PDEV_NAME,
+					   THIS_MODULE);
+	if (!vimc->mdev)
+		return -ENOMEM;
 
 	/* Create platform_device for each entity in the topology*/
 	vimc->subdevs = devm_kcalloc(&vimc->pdev.dev, vimc->pipe_cfg->num_ents,
 				     sizeof(*vimc->subdevs), GFP_KERNEL);
-	if (!vimc->subdevs)
-		return -ENOMEM;
+	if (!vimc->subdevs) {
+		ret = -ENOMEM;
+		goto err_delete_media_device;
+	}
 
 	match = vimc_add_subdevs(vimc);
-	if (IS_ERR(match))
-		return PTR_ERR(match);
+	if (IS_ERR(match)) {
+		ret = PTR_ERR(match);
+		goto err_delete_media_device;
+	}
 
 	/* Link the media device within the v4l2_device */
-	vimc->v4l2_dev.mdev = &vimc->mdev;
-
-	/* Initialize media device */
-	strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
-		sizeof(vimc->mdev.model));
-	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
-		 "platform:%s", VIMC_PDEV_NAME);
-	vimc->mdev.dev = &pdev->dev;
-	media_device_init(&vimc->mdev);
+	vimc->v4l2_dev.mdev = vimc->mdev;
 
 	/* Add self to the component system */
 	ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
 					      match);
 	if (ret) {
-		media_device_cleanup(&vimc->mdev);
 		vimc_rm_subdevs(vimc);
-		return ret;
+		goto err_delete_media_device;
 	}
 
 	return 0;
+
+err_delete_media_device:
+	media_device_delete(vimc->mdev, VIMC_PDEV_NAME, THIS_MODULE);
+
+	return ret;
 }
 
 static int vimc_remove(struct platform_device *pdev)
-- 
2.17.1


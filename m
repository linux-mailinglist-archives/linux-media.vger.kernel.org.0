Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D03E3C25E5
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhGIO3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5284DC0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:30 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r11so7146739wro.9
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJbTV9HbgtZtuGVRujZ4GmQHg/F2jWWQ4ik4RBG2kic=;
        b=vxhAEW7zhvlhX1tmL1Es4zdOvj03oJQSfNkveAAEXCP1DDEHWHcz4fnRyPlXSj7Gf6
         CZFEyb2Uq4IUsJkQMFkxt5ovOSOj2ECDm+78mGOuCbimFfJpYf9oVhNDri3Y1Umt+w4e
         3vvcVR35P2RwveluJ9J1Yz/hES8eBe+7qLpu48shxJGS7O2eignH/xMLaIJ5S3kfRdeN
         TkgqUB63VvANg7EBkV1zQktlD4CeDeVGqT5Z9bJ2KNO230N9wBcMBiEzZshUIqmyVZxf
         rziS+h+yhRHYz1tvTGr2rwLWBa/TKeQqkoBQFdVYXERHT2l9dmGXKIN9BLo4+pg2pe+J
         2m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJbTV9HbgtZtuGVRujZ4GmQHg/F2jWWQ4ik4RBG2kic=;
        b=c168TNOO2gg3AMwIMZ3pCu3Ko7Ln779AvTJw5bg4EtNBiDZ++z6cDM9uzoOcXTpATk
         5vnCcYxdePo8nruLgLo/d+FToeqhWyDCVXRzXI73uwNehClGCMJzBNDar+WhwQCjHRca
         SdQ8JPq8q+ViRI1IXxH/kFhbBLfpdRr+Pp813whmDp7EE5Ql6dYge5K5EcVEOBsPk6Co
         BCMKnAwuOtCxPlN39WJzf+2jm8Gxqogbz7tN5jYX1wGo2+OR7yYGll2WD+eKDOsj1Uyj
         lKu2ZASw1jReq/KQ/VdMUs80NSMp7T3dNaCxV00HW0DQY4ChfC0U0CJp7V1ahZOKbDKp
         p9Kg==
X-Gm-Message-State: AOAM531HVOSnUqjlAwMIxh6PRm/C1vwK8EzTokduaqmIyKgZFf9eGNur
        v5Ix/6jrmnnKh467blsu+HlCZA==
X-Google-Smtp-Source: ABdhPJx3ApCr0sZhk8mSA2m/gLQ108Z6k9mAMVDM6a+qusTKVElEZ5VXEmVWkg4rAbGZT1Zc0AKJAg==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr40516250wrs.136.1625840788960;
        Fri, 09 Jul 2021 07:26:28 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:28 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 01/11] rcar-vin: Refactor controls creation for video device
Date:   Fri,  9 Jul 2021 16:25:50 +0200
Message-Id: <20210709142600.651718-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The controls for the video device are created in different code paths
depending on if the driver is using the media graph centric model (Gen3)
or the device centric model (Gen2 and earlier). This have lead to code
duplication that can be consolidated.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 82 +++++++++++----------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 33957cc9118ca79e..6ea561fcd7a394fa 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -405,6 +405,45 @@ static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
 	.s_ctrl = rvin_s_ctrl,
 };
 
+static void rvin_free_controls(struct rvin_dev *vin)
+{
+	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	vin->vdev.ctrl_handler = NULL;
+}
+
+static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+{
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	if (ret < 0)
+		return ret;
+
+	/* The VIN directly deals with alpha component. */
+	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
+			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
+
+	if (vin->ctrl_handler.error) {
+		ret = vin->ctrl_handler.error;
+		rvin_free_controls(vin);
+		return ret;
+	}
+
+	/* For the non-MC mode add controls from the subdevice. */
+	if (subdev) {
+		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
+					    subdev->ctrl_handler, NULL, true);
+		if (ret < 0) {
+			rvin_free_controls(vin);
+			return ret;
+		}
+	}
+
+	vin->vdev.ctrl_handler = &vin->ctrl_handler;
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * Async notifier
  */
@@ -490,28 +529,10 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 		return ret;
 
 	/* Add the controls */
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	ret = rvin_create_controls(vin, subdev);
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
-			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
-
-	if (vin->ctrl_handler.error) {
-		ret = vin->ctrl_handler.error;
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	vin->vdev.ctrl_handler = &vin->ctrl_handler;
-
 	vin->parallel.subdev = subdev;
 
 	return 0;
@@ -522,10 +543,8 @@ static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
 	rvin_v4l2_unregister(vin);
 	vin->parallel.subdev = NULL;
 
-	if (!vin->info->use_mc) {
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		vin->vdev.ctrl_handler = NULL;
-	}
+	if (!vin->info->use_mc)
+		rvin_free_controls(vin);
 }
 
 static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
@@ -935,21 +954,10 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	if (ret)
 		rvin_group_put(vin);
 
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
+	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
-			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
-
-	if (vin->ctrl_handler.error) {
-		ret = vin->ctrl_handler.error;
-		v4l2_ctrl_handler_free(&vin->ctrl_handler);
-		return ret;
-	}
-
-	vin->vdev.ctrl_handler = &vin->ctrl_handler;
-
 	return ret;
 }
 
@@ -1450,7 +1458,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	return 0;
 
 error_group_unregister:
-	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	rvin_free_controls(vin);
 
 	if (vin->info->use_mc) {
 		mutex_lock(&vin->group->lock);
@@ -1485,7 +1493,7 @@ static int rcar_vin_remove(struct platform_device *pdev)
 		rvin_group_put(vin);
 	}
 
-	v4l2_ctrl_handler_free(&vin->ctrl_handler);
+	rvin_free_controls(vin);
 
 	rvin_dma_unregister(vin);
 
-- 
2.32.0


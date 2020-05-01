Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACED1C1B66
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729686AbgEARQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E866C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:22 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id p25so1819712pfn.11
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cvFFu/w/Sqd1CjEtVEg3CHkjbOlulSOPdqVl8s8dGaI=;
        b=Cqia4m0ldgnKSrzy62lTb8j3aY85o+cpyVKOjBunkw5WCAloV7HKA/KhDUmuoK2PPJ
         6LUwK9CQR7Bq7ujIR5CLPPOOndYmTEjotw3gr/kkEaLk4q1aMBLHvyGBkaEqpt++WjpL
         cvY+j+tbymS453VN568HEbL5nG0q9BHa84Y3P/Svtl4wj2doEE0mcbjPbJ/26DHanVCw
         vaxsoLLIdEUCsoje1s9Dx8FSYGt7oVq6zuNGlkEbbFGT43Zm5Q2rYgHlrZXU/iR9wypJ
         zFslpGoH4n+2S0tsMLVY7JUZ7tkDkQ6/CxK+ll20NN/W4BQTUCi5Ni4D93dGE+nLdmeK
         Ey4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cvFFu/w/Sqd1CjEtVEg3CHkjbOlulSOPdqVl8s8dGaI=;
        b=qMK7hL1hatnAoDptJV8a0XA60WeuowTZ13Nrnno8wuG6N0xVO51GKVHdvjwNgd0VXT
         qQX8oHydz6yZD4Ej4ntIWTtSrv8VKJbcueVYImAurh8LO6kWG5YAGmajXJhKGVjLInKV
         dAmL3UsJNt7V0kehqd4p6xIWF+6tSh1ojDvkdxgPg9iUtpo7FIbgozOvTi1QRrQPjyFl
         N8oqYyo9GuCEU95sML6/wMlsY+2Z/d3Tdn/jNSh/p9tx8v65zIOHg2M7eG+0C1ojmWlm
         27Yp/vRgPGKU1MALQyRjr8Rzmf21riq5SxItBubZDHgUaIXYv3fFN7BLuTEivTXzXftm
         ZrLw==
X-Gm-Message-State: AGi0PuajjcHEo4dsGImxFX8qSQ6V7//4sQZYwyS3KLVxJmPTXb5BW0Y1
        +v9aa8An3sCqnd2OlYh3YBasgzTH
X-Google-Smtp-Source: APiQypILAL97XnNE/TTeRW5PvBMLjOWPrP5SmvyHwT8HZiDhsRDvnXB7N5YuJcWlyDyF/XYNLBqi7w==
X-Received: by 2002:a63:513:: with SMTP id 19mr5258582pgf.48.1588353381359;
        Fri, 01 May 2020 10:16:21 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:20 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 14/22] media: imx7: mipi csis: Create media links in bound notifier
Date:   Fri,  1 May 2020 10:15:48 -0700
Message-Id: <20200501171556.14731-15-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_links_to_pad().
Changes in v4:
- none
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
  unnecessary inline, and rename to mipi_notifier_to_csis_state().
  Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 7b5c3e662d0d..1025e42740f1 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -26,6 +26,7 @@
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
 #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
@@ -385,6 +386,12 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 	return 0;
 }
 
+static struct csi_state *
+mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_state, notifier);
+}
+
 static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
 {
 	return container_of(sdev, struct csi_state, mipi_sd);
@@ -948,6 +955,20 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 
 static int mipi_csis_pm_resume(struct device *dev, bool runtime);
 
+static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
+	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
+	.bound = mipi_csis_notify_bound,
+};
+
 static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
@@ -1016,6 +1037,8 @@ static int mipi_csis_async_register(struct csi_state *state)
 
 	fwnode_handle_put(ep);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&state->mipi_sd,
 						  &state->notifier);
 	if (ret)
-- 
2.17.1


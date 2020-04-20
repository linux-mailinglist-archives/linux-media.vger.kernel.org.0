Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160DC1AFF4A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgDTAj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:58 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0576C061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:58 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d24so3301877pll.8
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zeq7U4bgVi6QRt2+oSb5yHP0cc+C7xZkBs+2BlV9yu0=;
        b=CVo2VKUwaFM7LPyrdFtvIU7eVPn59p8JVgohZFOLY2mZ9WAcV/T0AY48BpGHU5kzT8
         4GoZ8o6rbyRqFEDpGawL7OaMy7zzeffRCnZWIYeccsfKk1CVECJAAlnZYHcTPL2o70Pz
         KXUl2GOUtUu3Qod3QqF+blEi4rWlWkV8emFxjRglDupFulv06Sr9g6MFzHYeTzMd4Dwa
         kSVCiBgqq+mhyeEj7eeLb3PCeYbn3ShHDUDvINhX7B5rIAuR6vJVxG7xE4TIU1TeV4Jf
         fbdjw+t8U5xXtoM/FCIn3AoboRQDc1eyT8yJ8e810Bagwd74Vf8dW/EMbm+MxwSl8ND/
         KSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zeq7U4bgVi6QRt2+oSb5yHP0cc+C7xZkBs+2BlV9yu0=;
        b=CuhXpLuQJ5xmrLdAO6V1MAq6sp+qGIOSR8yaFKZMh7m+lwkn9GDzDC1vtW7CGRyHTI
         1IicNOMNhN8ol8I4FPzfvuMbIUdW803H++0x5nGw7wGRPneEkSR6d9CKQxttFTaC7Flt
         MmhJacd13sdXkN3WvKFkjx7r/YIziEZzGLd4GgYxB8WMbrh1WP2smwjNcdAdu8Y5KESR
         64HD1A8fjXdIzmRAx0Ynxr8qAgnaDhSB1kk73jXnJxAohInDJ7O0L980eEfJ3kRVCQHR
         iCH62Wyb25ZzDhY8rnlkptrVXLnRTp4x/P2KMx43XcJw4+ndU7k02iBNifeSUiyK/8oO
         /7EA==
X-Gm-Message-State: AGi0PuaJqBGsvkG/k4wZnA0jKM76IoTsG45d+3P4NQl0BtXlr3yb7tED
        kJgGcaVyToshMUYlLU6Z0YagVm4qum0=
X-Google-Smtp-Source: APiQypIKkFIulezgjXHm/ADUWFo5cYbATROwvLrV3boIKohxK90C+75ib3N+xs74GeIV1QRUHr4sMQ==
X-Received: by 2002:a17:90a:8a06:: with SMTP id w6mr19560817pjn.191.1587343198018;
        Sun, 19 Apr 2020 17:39:58 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:57 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 15/23] media: imx7: mipi csis: Create media links in bound notifier
Date:   Sun, 19 Apr 2020 17:39:22 -0700
Message-Id: <20200420003930.11463-16-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 1b3af031d136..6a13dc119c1f 100644
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


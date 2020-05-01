Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30081C1B65
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgEARQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA989C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:20 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o185so4818046pgo.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NDcuwhR6BjNJeJU0nAbykERqerCKLETI+zIr/z5d1lU=;
        b=BmxUYWWWp4biiIhDSaHqr2BaLw7p5EUGP2yky9iHxwrNtAWQL7Dep9tgF4ljwDO+fg
         auQi4lkJJfkTQpKt5noapcZpIAshbgV0oty73vGx7VLh91YBkxdjWFC0NP/ifCH+InUb
         TGTYnKRgQgVdUQayWV0g07IX6w+y0yc7RF23x60sBNTCJpWl7sO197DKFJ8tG9YSzfPO
         FrDy4ZUCg9UFGi/r5xci1iGvRr03jnxIM7r5qJZ/hiB5CwNkj5JZEw/ehONtsEm2a0j5
         CRN9YkwrJ5iwd6PbSp76oppF12XW/wWVn4y/g7BtFWZkoT26CoBqj4gn381a8kqMH6zO
         gZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NDcuwhR6BjNJeJU0nAbykERqerCKLETI+zIr/z5d1lU=;
        b=POSLX+kW9L9eTEx8Pc/fxRz7EMkyRmESFQaNvoUpuBytjyzud2F01wA9jv3YW6vPao
         go7oSfZ/CJdGCs2AerJ8icAoiS0v/WJ6IYUOdaSjWi41waAfX2g5EzLRwKV05RemxuMh
         y9dJ/Q0/jvARyZ3tAOOAZ7TTGWxjZlb+N6qMQmi/9AeVDoAMZ+OaLwdkPSaweosVe8iZ
         2BHcWSJ6ZwyUBsup0UxJqTbYYEbTjLOr884K6RTJ+BQRMyxwdpLPLjTPNtbVIWV3AiFy
         LSlZsilmxHFa3TdzJ7NvWBxXGTuiKpAsYy9kn63vzbOhtmyWrvqvhCOvv9OR+PYXjV70
         hurg==
X-Gm-Message-State: AGi0PuZ1yps/Snf5S53qJkk96BPNLPlz7dpmsKuQXtUY+WfSdTbuNkDU
        k0C5PhggMopZIG+SZjE2g2PjrBwc
X-Google-Smtp-Source: APiQypIYkhipQCvmMkyPn/b20KAbAhWY0Ylvf6HGLfb4YqsVRDboSPY2mybsJ++wlrHyG1HLAxKQdw==
X-Received: by 2002:a62:2544:: with SMTP id l65mr5146020pfl.288.1588353380129;
        Fri, 01 May 2020 10:16:20 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:19 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 13/22] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Fri,  1 May 2020 10:15:47 -0700
Message-Id: <20200501171556.14731-14-slongerbeam@gmail.com>
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
Chnges in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_links_to_pad().
Changes in v4:
- none
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link()
  that creates a single link.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 23823c8c6c3d..94d87d27d389 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 #include "imx-media.h"
 
@@ -91,6 +92,11 @@ static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct csi2_dev, sd);
 }
 
+static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi2_dev, notifier);
+}
+
 /*
  * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
  * reference manual is as follows:
@@ -532,6 +538,20 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
+static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *sd,
+			     struct v4l2_async_subdev *asd)
+{
+	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations csi2_notify_ops = {
+	.bound = csi2_notify_bound,
+};
+
 static int csi2_async_register(struct csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -570,6 +590,8 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 	fwnode_handle_put(ep);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi2->sd,
 						  &csi2->notifier);
 	if (ret)
-- 
2.17.1


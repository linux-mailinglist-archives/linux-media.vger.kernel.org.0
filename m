Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6061C1B68
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbgEARQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2485C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 18so1831737pfx.6
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g7H6Ri9yWcJp790asZwo8Gkl5sN2mkHYDZM5qgRTUO8=;
        b=HKk0pN0P9R0udEGF97Q8GdCXalVJISAOlTxj5t+4BeTRDQTKDeia/GR7e1V/BT2qGd
         JSgiyzl8M3Ng58REBps3wZ7dFLq8lC5gTzV4VPRCjViUGqQzG4IF9PcBFi3o5101UR5n
         2JneKdiEbq6EdKy3Jx3clqu7avMM16NygX40EjgoECe1EShuG6slybJTt+7nmtgf7Bjj
         RH0OEIkJxlYysqrbXiKIOtYLjGXtMFbRdOKn5khsh5Y+NTJT5XRwfMIp/ttqFOrCYrM9
         8cx+Kb6iOiPQWreq8rwuywhiDilRformQxGuGEwvR7DMOXafa/Regdei0wp+Ee8Q+4ev
         8NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g7H6Ri9yWcJp790asZwo8Gkl5sN2mkHYDZM5qgRTUO8=;
        b=j3AaXnwEb18B0fx2f8RjKlMgAEw6LMqkgcUfrXDvrTxz/jjkKW9KiDxkZtCNpO5N48
         XHIvPF6vIY3z0bUr5lLElcjaWesFXk+tM2qotTAmuLIfNK1fp6putfALXbD0D+wvdtMj
         RCg60Cx47JUONVNbHhcQP6WVOLBqZf2YSE6viyzlkzifX8tFuBWKjYlW//GXrHMo+WDT
         8oUpNGKjDcTXRLs4Hnqqx70ue0ddH8io5ceTQL/ycgfN2+qArRoG2Qkh3EyYSHvCcJdY
         roRvDLvPT7Z2rVvQrgRqqDn/HvyoBiLx6ZEagEf4TADHSCpiyYoVti+Sim9xpQ/wF5pi
         VSgA==
X-Gm-Message-State: AGi0PuYhCmb3+kaO9e+DJ756nKg1e96OvwhC8GlPKfJFKK6FLX/DBDw+
        s7O61Gu/LEc0ebtQzweBDk2HQ6ZF
X-Google-Smtp-Source: APiQypKCr3ktUWmpW+i+BLkDvjUg3N0FL72RK2+PsJGuu7/ovNnUMMWPJQNTZdwMbcwS91P2ckRbkA==
X-Received: by 2002:a63:130c:: with SMTP id i12mr4920149pgl.122.1588353384057;
        Fri, 01 May 2020 10:16:24 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:23 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 16/22] media: imx: csi: Create media links in bound notifier
Date:   Fri,  1 May 2020 10:15:50 -0700
Message-Id: <20200501171556.14731-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_links_to_pad().
Changes in v4:
- none
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
---
 drivers/staging/media/imx/imx-media-csi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 08f698af4797..a051a063a2db 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -120,6 +120,11 @@ static inline struct csi_priv *sd_to_dev(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct csi_priv, sd);
 }
 
+static inline struct csi_priv *notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_priv, notifier);
+}
+
 static inline bool is_parallel_bus(struct v4l2_fwnode_endpoint *ep)
 {
 	return ep->bus_type != V4L2_MBUS_CSI2_DPHY;
@@ -1894,6 +1899,20 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
 	.unregistered = csi_unregistered,
 };
 
+static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_subdev *asd)
+{
+	struct csi_priv *priv = notifier_to_dev(notifier);
+	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations csi_notify_ops = {
+	.bound = imx_csi_notify_bound,
+};
+
 static int imx_csi_async_register(struct csi_priv *priv)
 {
 	struct v4l2_async_subdev *asd = NULL;
@@ -1931,6 +1950,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 		}
 	}
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&priv->sd,
 						  &priv->notifier);
 	if (ret)
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9C91AFF4C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDTAkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC7EC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o15so3641542pgi.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XhPOvVCqZ5d3wZcpuBJWgpQLz/1gKin/AejGcxf3OiU=;
        b=SdGX7gpF8ZGiiJ2SJWfNkvUHNiGvvOPcXnFXe1puAiNfplfMlB8l4Cb6P56km6DDEz
         WWAc5qkBcsRBt35av2FZuUeGC+8lJEl+XdlO3xIzteq4WRimFLvLcl6eER3TvMlVw3YT
         BiLqZqt7jcLs9C9eRd3uj87qZDO64E2KFfQ4LNhGV2mFeTGOox9FRhH84Bg+khlfvC5G
         ps8gIUGeR4ULf7EJSCawSxSTSinG29L3PPjdbO7+2x4ria2rXoXJ7mYtUIcQ9eBNS6LJ
         XwrqcxsnUjHWFW2IIGQU/zhVtZ0dd+Jc/2tvgMLSg5wgS1yIq4ireH1FOGADs5gZb++x
         FNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XhPOvVCqZ5d3wZcpuBJWgpQLz/1gKin/AejGcxf3OiU=;
        b=NzOT+qHB70BsS55EZ/nnDsjs8De/DapCfhL0xIqdN4kM9qiHYl6Gc6myaa7tOVUBnV
         voWrd7V61ileWAqkMnCeukNClJOSAzHTZIeh1JXoWaLyKis1088WM7abH6Vj4Bwzk8cp
         Dbw6G7wym10xr4Fqtw1EQvkRZ1TC9rM93h4MURLsXgb43dMh+XqMej8KO7p4lm932Gfz
         z97CPrJOLGExAr2uTOUUaEPoyWDJQHwf4IgXHeoa00ZAOFrJ9pqiDfqGXpG1OKl1Rnqh
         3q9l2DO4Yj9Cez6ycv6z4KhRoY01CmlhbA/jNlgPmceylni8pJ7Xg445gCyM4UBcZFLZ
         ZS+Q==
X-Gm-Message-State: AGi0PuZQn4v7asRQLa3X5TDwH9RVzzr2QipUQa7INhZEwY35goVr9wGl
        gnEMtfAbpzcLSUvFaRPogtnEgqraTKE=
X-Google-Smtp-Source: APiQypKliirT5V2/ablTdxa6Qq3bzPsMY9CEGfVrCoLucELZVVcHzTx5tniTPHvC7L+oQfFzNnGM6A==
X-Received: by 2002:a62:7656:: with SMTP id r83mr14065752pfc.71.1587343200739;
        Sun, 19 Apr 2020 17:40:00 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:40:00 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 17/23] media: imx: csi: Create media links in bound notifier
Date:   Sun, 19 Apr 2020 17:39:24 -0700
Message-Id: <20200420003930.11463-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 8501efaf9484..8153ae5935cf 100644
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
@@ -1892,6 +1897,20 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
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
@@ -1929,6 +1948,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 		}
 	}
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&priv->sd,
 						  &priv->notifier);
 	if (ret)
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A8A1AFF3E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDTAjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgDTAjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:41 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE1CC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:41 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e6so1265561pjt.4
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=q/D4Oi9U6YWOZjW+n+hLsbyUmbrnB8ZHPL+zrDmH5wo=;
        b=uIbEvBm7g5QFEKaNJL24wc3tQ3V0IYDKaRcu/U/UYsM4Ld71wKpvaDDIDFPLQdv5JV
         rS6bCkniZEfMaFynOoBPDn63G2bXx6GG/H/IkFWpatZ0dtLTBZweOE82JQxdt3Idm/WE
         Bm0G0OoLIbv7iF/VXr+r2F+r0ZGOVF2GIlCiFotb5fdgrFWBb0FtxVJfYJ96bhI2IMoh
         XYNvgAXmw7env0NnV1bXhGL9yMZN2fAOlYGUKln8PC3jiamFGNAEcxiD2HlgaEnPauMS
         933ud8iDFBESkLJXam1MxdEH+MWM2g26ns929R5p5m6eaaRzF/cKHHtDtYsxnKHJVspT
         k1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=q/D4Oi9U6YWOZjW+n+hLsbyUmbrnB8ZHPL+zrDmH5wo=;
        b=Al9EI5j6SxQFkx+S140StXJaaypK1SQgrZyuO46Jash5iAKip8RTTg/urfC9GcnNds
         fSrFB9up7ZhiTmdXYSJfbs1vX4mXTyznqm0vZklXddc0Vy2zg7ayPZCSZ5Xwm05hQud3
         TNQyURBEvO5oJlZ4JyF+ZYLbLSsbDn0ttISc8k3hcnBLZBoLm2kyNq8qVJ9ppUqBeAxg
         cgiSeaFow8TMrSJdtY8sFf4qZu8QmYFTuTX11XLQoAwI2tkoh7WuLg9uf9t3ZRHw10HG
         SukdDnYAfR2pmH4mQia102i9HcnbTp9dGaXciD/q+XrNo5SzVQZzgpYRs6phrxsC+ZQL
         u0UA==
X-Gm-Message-State: AGi0PubRlZ1CyZsx/1c+QhhHIDbbt/IrKXioDQ8vPjto5FUttWhOgUbO
        rTTuUWc8LPGeFFaC71mbMeVc8frlp2I=
X-Google-Smtp-Source: APiQypKhE9x81VWijriZ+9Gvb+NjghavjHSRYnIto1uQaKjnI68yraSnNrXj0xuuYEIOEjqUXxaiog==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id ci12mr15982579pjb.104.1587343181089;
        Sun, 19 Apr 2020 17:39:41 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:40 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 03/23] media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_default
Date:   Sun, 19 Apr 2020 17:39:10 -0700
Message-Id: <20200420003930.11463-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a convenience function that can be used as the .get_fwnode_pad
operation for subdevices that map port numbers and pad indexes 1:1.
The function verifies the endpoint is owned by the subdevice, and if
so returns the endpoint port number.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a376b351135f..d5b5cd7a6049 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -696,6 +696,31 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 };
 
 #ifdef CONFIG_MEDIA_CONTROLLER
+
+int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
+				       struct fwnode_endpoint *endpoint)
+{
+	struct fwnode_handle *ep;
+	struct v4l2_subdev *sd;
+
+	if (!is_media_entity_v4l2_subdev(entity))
+		return -EINVAL;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), ep) {
+		if (ep != endpoint->local_fwnode)
+			continue;
+
+		fwnode_handle_put(ep);
+
+		return endpoint->port;
+	}
+
+	return -ENXIO;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_fwnode_pad_default);
+
 int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 				      struct media_link *link,
 				      struct v4l2_subdev_format *source_fmt,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de59852..940181323427 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1027,6 +1027,23 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 
+/**
+ * v4l2_subdev_get_fwnode_pad_default - Get pad number from a subdev fwnode
+ *                                      endpoint, assuming 1:1 port:pad
+ *
+ * @entity - Pointer to the subdev entity
+ * @endpoint - Pointer to a parsed fwnode endpoint
+ *
+ * This function can be used as the .get_fwnode_pad operation for
+ * subdevices that map port numbers and pad indexes 1:1. If the endpoint
+ * is owned by the subdevice, the function returns the endpoint port
+ * number.
+ *
+ * Returns the endpoint port number on success or a negative error code.
+ */
+int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
+				       struct fwnode_endpoint *endpoint);
+
 /**
  * v4l2_subdev_link_validate_default - validates a media link
  *
-- 
2.17.1


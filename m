Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB821C1B5A
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbgEARQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729037AbgEARQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:05 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE9AC061A0E
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:05 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v2so3842945plp.9
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/RVoX7yT7iGvoW/qYzoH+jpIAMj0AtP9LvPCJFybw1A=;
        b=JiD72NVjDtz3enhXc7RGkxBL+K1uTheOlPVTi9xueyKWRcDLMAATycu9ppnGl20NyT
         +a1oDIawnsYaZiM1whtrJMGzgKRUi1dcbtdJyTXPvBYnFJnsmUkVvg4SegU9n7q4H/47
         H3F77Ia/pGac8/Hjm1rkSNivInEg49FOeezUfK7o4j1gFhC5/GOUAO8Yx2IFmWVQxu2W
         cro9zV/O6zB8q4HgTCWIeoHC/k5qb0oYoPAvnbRvcfXaqwQP3NabKbq/8DjjNCkOmnB0
         Pbs5/1wlkgQQW5OB4RLKcEM8rXIq6pFZLf8IoVs44hSw8BnzaTzpdkNfsxbUWbKwPIWX
         P+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/RVoX7yT7iGvoW/qYzoH+jpIAMj0AtP9LvPCJFybw1A=;
        b=n9sssEOHqaya22/QpkR2izaThQN8QvMQlXaEx7MZWRTJ3UUsrlUETaIhwWp8oKE6uI
         u0D4NDg5rBQVbDkk4WwJNPu3F5Z/wP8GSdT5ADMYaJ0/0rgUvmDAWEQpb4Mf7xoxBlQI
         ltARGYpOoiipZkbavU7CLki28so4aB1C08TAPltYp19iycXtOqgSlMaV6HvyHeOJ5N2S
         B3ZPSXGvhPd4hGy2KhH9FAK5Rshy/RzzEO+3VrDWRGRrVMhv//s/pXZgAi0McJCgvOU8
         pRSGgh+KP7Gj/fafp743hODVxgxZgIZCFzCqqgtXiWfRQ0dQhTgZ3Br3Q41hEgrs2cWI
         ml0A==
X-Gm-Message-State: AGi0PubHLxvlVc82UexrGDnnmMnInEEu6NApTnFz9dufyWBEiCK94b8V
        BTWWmwfx0R/m1msQ1iHtjnJUXK3K
X-Google-Smtp-Source: APiQypIGQLRj5b3HPqLRhGAA9gLVcvDelGhiVn0VbK0+DaLDTDHWcsg9UEcZpiyw7Jh9WL2HZEu8lg==
X-Received: by 2002:a17:90a:a40e:: with SMTP id y14mr680710pjp.101.1588353364997;
        Fri, 01 May 2020 10:16:04 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:04 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 02/22] media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1
Date:   Fri,  1 May 2020 10:15:36 -0700
Message-Id: <20200501171556.14731-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a376b351135f..3bdda686341f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -696,6 +696,28 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 };
 
 #ifdef CONFIG_MEDIA_CONTROLLER
+
+int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
+				      struct fwnode_endpoint *endpoint)
+{
+	struct fwnode_handle *fwnode;
+	struct v4l2_subdev *sd;
+
+	if (!is_media_entity_v4l2_subdev(entity))
+		return -EINVAL;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+
+	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
+	fwnode_handle_put(fwnode);
+
+	if (dev_fwnode(sd->dev) == fwnode)
+		return endpoint->port;
+
+	return -ENXIO;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_fwnode_pad_1_to_1);
+
 int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 				      struct media_link *link,
 				      struct v4l2_subdev_format *source_fmt,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de59852..f7fe78a6f65a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1027,6 +1027,23 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 
+/**
+ * v4l2_subdev_get_fwnode_pad_1_to_1 - Get pad number from a subdev fwnode
+ *                                     endpoint, assuming 1:1 port:pad
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
+int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
+				      struct fwnode_endpoint *endpoint);
+
 /**
  * v4l2_subdev_link_validate_default - validates a media link
  *
-- 
2.17.1


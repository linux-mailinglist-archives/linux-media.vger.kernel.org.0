Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E001084A3
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfKXTHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:33 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36489 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbfKXTHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:31 -0500
Received: by mail-pl1-f196.google.com with SMTP id d7so5439883pls.3
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=B88IjOh997RjEzZHRef+LU6pcPdmsGPGPMI2gOZJFRtuN6Pe7sXujXbmZ+4SN6rm4k
         vluL1xdL/y/oqjF8EHPG4sLVc9mjyunGLK77RR6WcWuG7Ce3Ghe4QMiyh/4pfT9HkAAj
         cXhC63FNHZ1EbZWrroIxGie7RvNndAQw8tNy1R7gAWr5lFzTFgoeD7Tay75fVe6KL0kc
         NCmdP4eKStGKE6LLr9KLTcxKomBdx8ocwRVZe9Uo9lODmyQMCIzDPaFSIcHm1SE5E+ou
         y81Ydk89/9oIa54s7JOcadsb05xxMPhlX0Q7VCmHS8hRHECYGNJO8M/zKcHOTHUOnByo
         F6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=nhPkJ8HYxTBuAzPuRVbshhNbJqOyT6HA4H5Iwla6pN/iZMKh2ZD0Gl30P6QSsVjaJ9
         2S17CAzWoGDkathsReYwknyuR5sWXiaKIik2ec3d4uTyJIBkPlT0zdOZne8xnDuFUMEG
         jJiolCPLt7wwijtXIU5VjPuNEma+5mb6S7DbWbPCltel7YESqmW9nfmF0WJV541gLtBD
         +VVmtNnKIqDVmXH4Lh2XqBdXCyb+fnkMxRs4C+ebYc67qrIIuRr8a+Ky7DQ7cNTjcq5Q
         3uxexruX2HdIyq8MOa+xyk8cv2ZAiys5bLtGKK9PBDO/cxFlYUD+ZnVcIGB/r3iNgRL0
         uUGA==
X-Gm-Message-State: APjAAAWPyFu+fQXh9NgJbIOPejQp0gw7ab6CHT+qNfUBo0xBWJu8XaXS
        ekcCBgSRlKwRjqfB8Gl4QxzjZroPHAI=
X-Google-Smtp-Source: APXvYqxZtqOa9ZbCa4yGN9FvLcxy35OT7zk3TIpQt2Y3+cN/Qout3S8alCWmv8O0/nlM7MFbNi9LjQ==
X-Received: by 2002:a17:90a:a63:: with SMTP id o90mr33582830pjo.81.1574622450683;
        Sun, 24 Nov 2019 11:07:30 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:30 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 18/23] media: imx: csi: Implement get_fwnode_pad
Date:   Sun, 24 Nov 2019 11:06:58 -0800
Message-Id: <20191124190703.12138-19-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI does not have a 1:1 relationship between fwnode port numbers and
pad indexes. In fact the CSI fwnode device is itself a port which is the
sink, containing only a single fwnode endpoint. Implement media_entity
operation get_fwnode_pad to first verify the given endpoint is the CSI's
sink endpoint, and if so return the CSI sink pad index.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b60ed4f22f6d..dc5fe25fe7b8 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1825,9 +1825,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
 		ipu_csi_put(priv->csi);
 }
 
+/*
+ * The CSI has only one fwnode endpoint, at the sink pad. Verify the
+ * endpoint belongs to us, and return CSI_SINK_PAD.
+ */
+static int csi_get_fwnode_pad(struct media_entity *entity,
+			      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi_priv *priv = v4l2_get_subdevdata(sd);
+	struct fwnode_handle *csi_port = dev_fwnode(priv->dev);
+	struct fwnode_handle *csi_ep;
+	int ret;
+
+	csi_ep = fwnode_get_next_child_node(csi_port, NULL);
+
+	ret = endpoint->local_fwnode == csi_ep ? CSI_SINK_PAD : -ENXIO;
+
+	fwnode_handle_put(csi_ep);
+
+	return ret;
+}
+
 static const struct media_entity_operations csi_entity_ops = {
 	.link_setup = csi_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = csi_get_fwnode_pad,
 };
 
 static const struct v4l2_subdev_core_ops csi_core_ops = {
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632721C1B5F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgEARQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:12 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF7BC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r4so4820223pgg.4
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=amjt0D7pRAoNOQO2ul5J9FAiqMKYe4q4mNXCQU5qr60=;
        b=dhgtSVhGsqT3dd2K3cp09aW3o6kqpzWy6OPC08r65D9JU1Z1+DJTQlZ5AbmrFAflLX
         TABwMSyy4xwebCw2v3g4kx+LDoK7MeIPbk3L46LdiDCIVODNEu5IkCtSnScUAAN5s+aj
         +Izgt6cvfPYDQYV5qY1BrHV4TPokCwxqz2zvJUKUPWkT94e29SZrjCjfcCVjrHNjWPzt
         KSMcwJ5opSGvkmOHVSqsNRgcferkQYv+BtXevqys47ReIUt9HMdTo3ZlXV35F9mg+uIE
         0h8YcYgbKKSUe/oz+xytaqhr7cWsmKcKTNIsYiUP3eJovNLd8JD6O/3oLGuSKmU8K9TS
         SSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=amjt0D7pRAoNOQO2ul5J9FAiqMKYe4q4mNXCQU5qr60=;
        b=gILAYqO+Wb2KhAYDkO7EzO9L+29tAzm+takB+fIIgduP8f7UJFYfu4SClf5U3oIUYj
         3Arj6Wz6eKfXz67k8WX5m4/WhON4lMgVp8wOV705TcGj3hBwt2mkIy1KpQ9sWb6Og+rK
         Qskb0mPmit53DeZiNgWkwTdXnXIR0qd96sBO/qKVxg+57GJfcxrJwZTVZER4FwmcAjnX
         aERnPZu68cEVroIR0vEgT71tBN44T+eSdGRCt58IrrEY0+4zaSu1k3drg6u9uA1bj3bU
         t87oOQh1jHCohDHiD69wBwbepRV546UaKbaaU0VsvsULyI7bKID4IwS8HijUsFx1DoLj
         JJCg==
X-Gm-Message-State: AGi0PubhQHB0x/tUoX/AsdmOSTJq1GdNw2aHABNK7YddOMmWD6zxFbwy
        lVgUrVlS9C2UvHlHCUkrBGL1SG0J
X-Google-Smtp-Source: APiQypI4Nxz5XaLOsdfjgBCZzpUHMk7AF+E532rIrDcRy8Qb5yT7hVT6+0U+JXPjHBw2STvcO+NWzw==
X-Received: by 2002:a63:eb15:: with SMTP id t21mr4961320pgh.279.1588353371738;
        Fri, 01 May 2020 10:16:11 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:11 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 07/22] media: imx: csi: Implement get_fwnode_pad op
Date:   Fri,  1 May 2020 10:15:41 -0700
Message-Id: <20200501171556.14731-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 905b1ee27db6..08f698af4797 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1832,9 +1832,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
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


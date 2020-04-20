Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5800D1AFF43
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgDTAjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725991AbgDTAjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A3DC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d1so4135545pfh.1
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rMR8kO8nK/Jq2/K37BPFuSD9GOIbjwp/Otnbct7wVOI=;
        b=INh0tyDTNiMqXR+Nsd1Xo9dIk9FhThE1MVHV4Ln4RPulZ3HuhUPJQX8nGLUveN/jl7
         S6cqw97lIT7hAChQF5IY2XLY6Ysz3NdzUlG+cXHjXc7gSlBo6QZZ0sJxZ8SqrQqF9COE
         2IYxHG0rEW0k1ay0GG3Xfj5ZkPWVaGp1oOxg8d7jnwqLc3rzeChzzKVcNvXBEQK8DZ0i
         01k5xaFa+7a7LDD8741HxQpc234BBh8TkbNaxPLzP2AvXJO+PVvjHYCTTiQn0fppXYcc
         4ENzNVJY1pe7hJQPLEzjO1QkeQr5780m1YWgaw7bDnxB5HBesX0aAOTe+Mf2fDk41MoQ
         wmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rMR8kO8nK/Jq2/K37BPFuSD9GOIbjwp/Otnbct7wVOI=;
        b=F4xi3vjGUZI85Gf92L6CzQK+CHfgMrawWsNip/UAhj6QlyFXWNv7FmHt0+Pe0aP2pq
         NnVn0Jc5HWopOulXG5XNGyzvz80ZffyhGOGq/K06HQe/JTqJN4PjSQNwY8Z97hqn5cOA
         RIdkYqEDqMiu8/Wj6JD7bjbgOOkATo4IyDkbHxDCyw9w75tkIFiLJtIghO2UXYCaUY5Q
         E0JNdJk4sA6oASHi2+d/vwV02WIhISsp1yl1oulnQpXGfDn1AFaS3QyOypQVrWeaXDQW
         /47/5vUrj0qj+uGRYWxvugvdVcZpzuVL9ItBeVEyj8x3XE+4VHKOZGKWGc2ld3I9PnMr
         xTQA==
X-Gm-Message-State: AGi0PuaXOe3hFXtGHni4GCTj+RBhEScGajobphRjPqx7drvFY5AMNykw
        8xTVovsN5qWfdyF0PG5DmxAz1ji1I1s=
X-Google-Smtp-Source: APiQypKSKDapeQBzoaTybXLwYJpZep4vctVObsOQj63VGW7M2x1aWaj9bGQqalfCRK2wk99IxJC7Zw==
X-Received: by 2002:a63:f211:: with SMTP id v17mr11695614pgh.83.1587343188131;
        Sun, 19 Apr 2020 17:39:48 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:47 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 08/23] media: imx: csi: Implement get_fwnode_pad op
Date:   Sun, 19 Apr 2020 17:39:15 -0700
Message-Id: <20200420003930.11463-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index 58349c449c4d..8501efaf9484 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1830,9 +1830,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
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


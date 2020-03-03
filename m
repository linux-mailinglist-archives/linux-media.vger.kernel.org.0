Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66F917869B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgCCXnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:23 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33745 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgCCXnW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:22 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so2329296pfn.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tRajCHkCPnS+6BeYHw+Smokn34AQmfROoq0aYGtX0Dg=;
        b=sR4O67PFDK1J5aO2SMM4YjzLIcIh4TnlSItBFn5CmIZXE4wrefACazjfvRM1QBbZgA
         Y6+3K4VDTO7nutklK/brQokcbq+RSP3zEN0hBnaeLoVPOQBRG1s6cDW3V4/iL90Agh7x
         1DFwEioCwFqYtGm1oVSfb+HfbeDr08/wA9T8BQlfLEVy3c9PCr9HZO041KX1Ir9FyPMy
         szINe8pTUdk9eLuvnrMzfZqYo8/apzbveYxbTiIMkMsg/ESsqeubprXyqTyo1qa7NimE
         TkRABaIY79FTRFJng5Lod2vlhKiWUhC/vP66sziTeErqiBF1J0BeSVenSH1TBcYDjmAC
         1KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tRajCHkCPnS+6BeYHw+Smokn34AQmfROoq0aYGtX0Dg=;
        b=Vo2EfeBmbcEhO2pdp1U9DDtmGbcS/HPLV+ZFTYmH5JnhrDCMXh3eUwWn4d0Kh2LqwW
         ra/XYI9Xd0eSYGBC8PflAlVKSymM/r9Qc7gww2f8FqtoZUrPXeOHojn43DWGoDvVIOap
         djDBYx0obPtbvlPB5alPLJo/88qkH2y/gJ+n8wyijATpai2yA0vuwhHaZNPp4ftqqP/6
         qvKhjK1M1d0N/8b/bDer0olhh5qhCozf0rKU1MmbYbOyD6j3pZpNeik1dsHw1TyJQdnF
         gCProHnzT8Y4FfYt6tMG2jOSZI2xOhYBdreZqUQqc3bseHygEIqXLzZ5QFqG4/gZ+KHL
         sLJg==
X-Gm-Message-State: ANhLgQ39HjeDvduWa0iQe33eiPmPZ9KATsf6fJ/e7i5DnTDFjkMBs152
        kNOEV0kDy0wMi2DQtm9ZtsPbE2GwRK0=
X-Google-Smtp-Source: ADFU+vtkSmiPqq/y/3o/3gpQvWHB8YCbRzN/ibyA7FHz9Teq5V8WdcHLJHrTPQoDfbhv6Wy0aTi3ng==
X-Received: by 2002:a63:e053:: with SMTP id n19mr4926976pgj.64.1583279001042;
        Tue, 03 Mar 2020 15:43:21 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:20 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 08/17] media: imx: Add imx_media_create_fwnode_pad_link()
Date:   Tue,  3 Mar 2020 15:42:47 -0800
Message-Id: <20200303234256.8928-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create media links between a source and sink subdevice
based on fwnode endpoint connections between them.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 91 +++++++++++++++++++++
 drivers/staging/media/imx/imx-media.h       |  4 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0788a1874557..87152bd9af22 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -729,6 +729,97 @@ void imx_media_grp_id_to_sd_name(char *sd_name, int sz, u32 grp_id, int ipu_id)
 }
 EXPORT_SYMBOL_GPL(imx_media_grp_id_to_sd_name);
 
+/*
+ * Look for and create a single fwnode link that connects a source
+ * subdevice to a sink pad.
+ */
+int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
+				     struct media_pad *sink)
+{
+	struct fwnode_handle *endpoint;
+
+	/* loop thru the source's fwnode endpoints */
+	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
+		struct fwnode_handle *remote_ep;
+		int src_idx, sink_idx, ret;
+		struct media_pad *src;
+
+		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
+		if (!remote_ep)
+			continue;
+
+		/*
+		 * ask the sink entity to verify that this fwnode link
+		 * actually does connect with the entity, and if so that
+		 * it connects to its requested sink pad.
+		 */
+		sink_idx = media_entity_get_fwnode_pad(sink->entity,
+						       remote_ep,
+						       MEDIA_PAD_FL_SINK);
+		fwnode_handle_put(remote_ep);
+
+		if (sink_idx < 0 || sink_idx != sink->index)
+			continue;
+
+		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
+						      endpoint,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0)
+			continue;
+
+		/*
+		 * found the fwnode link that works, create the media
+		 * link for it.
+		 */
+
+		fwnode_handle_put(endpoint);
+
+		src = &src_sd->entity.pads[src_idx];
+
+		/* success if it already exists */
+		if (media_entity_find_link(src, sink))
+			return 0;
+
+		dev_dbg(src_sd->dev, "%s:%d -> %s:%d\n",
+			src_sd->entity.name, src_idx,
+			sink->entity->name, sink_idx);
+
+		ret = media_create_pad_link(&src_sd->entity, src_idx,
+					    sink->entity, sink_idx, 0);
+		if (ret)
+			dev_err(src_sd->dev,
+				"%s:%d -> %s:%d failed with %d\n",
+				src_sd->entity.name, src_idx,
+				sink->entity->name, sink_idx, ret);
+
+		return ret;
+	}
+
+	return -ENXIO;
+}
+EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_link);
+
+int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
+				      struct v4l2_subdev *sink_sd)
+{
+	int i;
+
+	for (i = 0; i < sink_sd->entity.num_pads; i++) {
+		struct media_pad *pad = &sink_sd->entity.pads[i];
+		int ret;
+
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		ret = imx_media_create_fwnode_pad_link(src_sd, pad);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_links);
+
 struct v4l2_subdev *
 imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
 				struct fwnode_handle *fwnode)
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 11861191324a..f90a65ba4ced 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -183,6 +183,10 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 				    struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
+int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
+				     struct media_pad *sink);
+int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
+				      struct v4l2_subdev *sink_sd);
 struct v4l2_subdev *
 imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
 				struct fwnode_handle *fwnode);
-- 
2.17.1


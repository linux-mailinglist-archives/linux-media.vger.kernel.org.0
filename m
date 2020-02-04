Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D60C915238C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgBDXug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:50:36 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33351 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbgBDXtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:47 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay11so80231plb.0;
        Tue, 04 Feb 2020 15:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0UeHl1Dd9diRnbI2rT7HKFn8mPPNQOcd6CGGZuCp63s=;
        b=je6p4JtnrsQJgU5HRv7LG/DWeA5nUeQ876l1bbDqix79BNZBL1WFwSWBcPg+eNhb+v
         kd9GvQghy2Q2ollGwJFeSYH6iYubc+m+ZSQSruBP+joBpdpksb6g+YgDOb6wMJEV6Fy6
         h462nCEEqZgtJi5qkGQ84zqt8NIN7sUkohqvVIxFzisjlN80EE5gSm7Jz8Bp71vDl4rc
         EyQLT5g7xHGvLQfhqwNJsuoDaaGXCQzYK01+dSINnkgLknGHFqsrJCK6SCjo8BheX5w7
         cDT4TPB+YFLrF3IkQndJfH80v8/9Gw+he8uv80EN+W6ais/+le82IYf5RX7j9yPj9O/+
         wvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0UeHl1Dd9diRnbI2rT7HKFn8mPPNQOcd6CGGZuCp63s=;
        b=FN/8Eokg2H1uGRuUWnXKzCMVQzt52NnT5LvWnvV1JupdGUOnY2Xnmiyrf7JJ48VkbG
         R6l+VZtXHDIAc2Yhj155uxIqsZywcv08DufmAr5WWfxs6aqN/GXcootgoC4kauoti0XD
         3lFrxLhyjL4SqeN7QeQVzgBId/075zG+g2Isfr/HKVKSwB9Yf/LdDRGwgwZra0gkN7BI
         m9/lbyneSVLQ2cgmTW1uY0uqe3oFa6+O7P6LRj5yGJvOSGC0Mv6KcqWpWqo0N0fz36Hr
         nrnLtxneuRB2B5jqoY+snoWdwgQFjGnk12YWW/E8iYvo4nJEcEoVCmN/aL5LuJu2Yic1
         uvzQ==
X-Gm-Message-State: APjAAAVpzSbCeG+KCB4VS2ysQl8wiLslVM1BIpjkROz/HSKaPmcuzNqu
        A34rsIJcFoOxO+ThS2OszB/U3Q7M
X-Google-Smtp-Source: APXvYqwE9MALBruftzHtjQib2jg9yrrMeSI1bfo5Fhf0lDaNpE4ULauWZfLkuf6FZ/FiGpO4TrbJRw==
X-Received: by 2002:a17:902:b612:: with SMTP id b18mr30588327pls.318.1580860185998;
        Tue, 04 Feb 2020 15:49:45 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:45 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 07/17] media: video-mux: Create media links in bound notifier
Date:   Tue,  4 Feb 2020 15:49:08 -0800
Message-Id: <20200204234918.20425-8-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the video-mux sink pad(s).

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- this version does the work inline. The previous version called
  a media_create_fwnode_links() which is removed in v3.
---
 drivers/media/platform/video-mux.c | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index c1c477e4e33f..a6b09a79fbe3 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -36,6 +36,12 @@ static const struct v4l2_mbus_framefmt video_mux_format_mbus_default = {
 	.field = V4L2_FIELD_NONE,
 };
 
+static inline struct video_mux *
+notifier_to_video_mux(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct video_mux, notifier);
+}
+
 static inline struct video_mux *v4l2_subdev_to_video_mux(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct video_mux, subdev);
@@ -372,6 +378,90 @@ static int video_mux_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
 }
 
+static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct video_mux *vmux = notifier_to_video_mux(notifier);
+	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
+	struct fwnode_handle *sd_fwnode = dev_fwnode(sd->dev);
+	struct fwnode_handle *vmux_ep;
+
+	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
+		struct fwnode_handle *remote_ep, *sd_ep;
+		struct media_pad *src_pad, *sink_pad;
+		struct fwnode_endpoint fwep;
+		int src_idx, sink_idx, ret;
+		bool remote_ep_belongs;
+
+		ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
+		if (ret)
+			continue;
+
+		/* only create links to the vmux sink pads */
+		if (fwep.port >= vmux->subdev.entity.num_pads - 1)
+			continue;
+
+		sink_idx = fwep.port;
+		sink_pad = &vmux->subdev.entity.pads[sink_idx];
+
+		remote_ep = fwnode_graph_get_remote_endpoint(vmux_ep);
+		if (!remote_ep)
+			continue;
+
+		/*
+		 * verify that this remote endpoint is owned by the
+		 * sd, in case the sd does not check for that in its
+		 * .get_fwnode_pad operation or does not implement it.
+		 */
+		remote_ep_belongs = false;
+		fwnode_graph_for_each_endpoint(sd_fwnode, sd_ep) {
+			if (sd_ep == remote_ep) {
+				remote_ep_belongs = true;
+				fwnode_handle_put(sd_ep);
+				break;
+			}
+		}
+		if (!remote_ep_belongs)
+			continue;
+
+		src_idx = media_entity_get_fwnode_pad(&sd->entity, remote_ep,
+						      MEDIA_PAD_FL_SOURCE);
+		fwnode_handle_put(remote_ep);
+
+		if (src_idx < 0)
+			continue;
+
+		src_pad = &sd->entity.pads[src_idx];
+
+		/* skip this link if it already exists */
+		if (media_entity_find_link(src_pad, sink_pad))
+			continue;
+
+		ret = media_create_pad_link(&sd->entity, src_idx,
+					    &vmux->subdev.entity,
+					    sink_idx, 0);
+		if (ret) {
+			dev_err(vmux->subdev.dev,
+				"%s:%d -> %s:%d failed with %d\n",
+				sd->entity.name, src_idx,
+				vmux->subdev.entity.name, sink_idx, ret);
+			fwnode_handle_put(vmux_ep);
+			return ret;
+		}
+
+		dev_dbg(vmux->subdev.dev, "%s:%d -> %s:%d\n",
+			sd->entity.name, src_idx,
+			vmux->subdev.entity.name, sink_idx);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations video_mux_notify_ops = {
+	.bound = video_mux_notify_bound,
+};
+
 static int video_mux_async_register(struct video_mux *vmux,
 				    unsigned int num_input_pads)
 {
@@ -386,6 +476,8 @@ static int video_mux_async_register(struct video_mux *vmux,
 
 	v4l2_async_notifier_init(&vmux->notifier);
 
+	vmux->notifier.ops = &video_mux_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(
 		&vmux->subdev, &vmux->notifier,
 		sizeof(struct v4l2_async_subdev),
-- 
2.17.1


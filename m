Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 374E517869C
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgCCXnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:24 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44653 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgCCXnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:24 -0500
Received: by mail-pg1-f194.google.com with SMTP id a14so48116pgb.11
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k6owUehipygcgAwE4Me8A8yJ7y3IgmI/s2YT+RYiWrU=;
        b=RQnyTS1GVHyM/wqenjZEcEphz5ki44UCxuB7xvFLnSSlm+E+CCKGBPXXPSuqyJMSgp
         cbdyE3YnZsbXfdpAez13hXgLKilYuMnWnfaffHhwvDaFeP+5H/x1cmpDCHM8G4QDr6xS
         ZbFw7i0P3PS+nMgeKbSwTJqWY/0emSLf+tBdGbqrNIVjL20B02j8DXhZ1x54GQYVYQ07
         ROYmcrCDc2jWwSiBgE+qvn5DoXtgkMwbCUW56mlOmot7ez0NqEVGIk518TSZFqDNkRm5
         0fzS5KYwwaUL0lNvcSQ4PFMXpuqixBU2WNX8zngHRsHyEIJJJ1QU/xIcziBHRqAI4FaF
         IFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k6owUehipygcgAwE4Me8A8yJ7y3IgmI/s2YT+RYiWrU=;
        b=ZILmavwulaWLPsbvgNTVGx5H5QuztN3gd9E5/si7Q0LRNn325F7EbwX4b3iS5iDj+k
         2hBvfwR3E+9/pAnqVIsYTyHyOqLCSvF8nZPrsAzE9JOX1JNEHZDm2EHyWs2Jj1DgZ4KP
         uHhJnB1SFni9qbfmoPmUhZz7vfD5L0tHI9Zw4L79rvp3+EireBvDqj6YW79l3IMv1DjZ
         WpLLjgwM10MTgD4jYqnItxt5odQHGcdqiPTcBawOnyF3+QV5lxfNTFSo33IucOI2G57G
         DX3tVEW3Ye+Lvi9CaBxlcgHWLKWZl8M0uPb5HZdhKHToDnARpi7HH/FKjyJj9pWCStTw
         A/tQ==
X-Gm-Message-State: ANhLgQ2hVpjno1JOpVnehIimxmSLMr65aNxYN4wdG3ewKTg7YZMg/ju9
        T3y85ICACnQoxkw87dsBAY41z2ApEgc=
X-Google-Smtp-Source: ADFU+vuRm0jjviy7TdxZFlUv1X1b4torFfy4MgusLE8b9kJcAEs1+hORa8zIReIgnlMwtoLFOHDgwQ==
X-Received: by 2002:a63:a741:: with SMTP id w1mr6386585pgo.131.1583279002573;
        Tue, 03 Mar 2020 15:43:22 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:22 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 09/17] media: video-mux: Create media links in bound notifier
Date:   Tue,  3 Mar 2020 15:42:48 -0800
Message-Id: <20200303234256.8928-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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
index f446ada82176..3991b1ea671c 100644
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
@@ -360,6 +366,90 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 	.video = &video_mux_subdev_video_ops,
 };
 
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
@@ -397,6 +487,8 @@ static int video_mux_async_register(struct video_mux *vmux,
 		}
 	}
 
+	vmux->notifier.ops = &video_mux_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
 						  &vmux->notifier);
 	if (ret)
-- 
2.17.1


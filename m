Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DB9178695
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgCCXnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:11 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34204 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:11 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so70173pgn.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=aCq1K/12PXEkM8yC3VgArgoUYGauSVUmUkL+HjXkGfMVdkBO+NGB3SMNNzsuBepora
         eGkdxS2dl6rvLgaCe6rF95nhyRJQ1lpbFrYqvM6dWB7tX9F/e6IW8OK3xH3rCWDxRzLG
         T3bih4hRYhWmDOhi4WU8IxGUvWAoGA62U7QhU6FxHIIheW1mtUOtdvwx4RDIwi+HgMzF
         RI84Pusr3oQ1jTEGVUwedUCRDBrQK1zKH9WcLuaOWxX2oNaf/gZna1+8FsxMmaqJNw29
         90sVuUlQzMWTxd65hWFJasYULkGq9mhilVkqtG21pdEhaI/wyEEauoBpMTPp2qpJcdBA
         b5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=B3n30OTaqSyYMZ3+5gnQnLC+ZjErP+UeQHoYyFnTgJj3KBk4DIZcAvkk0QMPVV+cXA
         9BBY333w9RDYZd2hJDnKw/9jE4uHcStapkUJHYuTib0Lb7e+DKjb/wBsTo1LOQBwhAXc
         8oIRFlgihsydHqCxXNQygu7ePJjk9ApyVTiUgSjM9zN1xaN0DvBit/P9JddBxrDgio9R
         dekCGBggykBA0xRpJz2ujF/w3olDZV+lRq50UQuo9qBQc3Rt5HLykog+7cLiuoOScWRq
         uAwt7e+sI6Vb1Unfqeh/W1lI3Pt09kbVBbWqdvw28i9SyDdUwDp48MkErtgXHQyp/SDH
         adqg==
X-Gm-Message-State: ANhLgQ28P6ZvBBOvkMflU7pXkNTSCIOItT11iKLg5v/tOKMWoc1RK5wU
        bGy+O5IZHFs+8vYnHHzAOhQM/fTW+pc=
X-Google-Smtp-Source: ADFU+vvsLgpZ+HCRuKVE4YovNzsTULV3ubxG/a4KFsRfViFqVpqisGf+XHTlM6g98lwuVnfGAU4f7w==
X-Received: by 2002:aa7:96f6:: with SMTP id i22mr184044pfq.61.1583278989750;
        Tue, 03 Mar 2020 15:43:09 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:09 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 02/17] media: video-mux: Parse information from firmware without using callbacks
Date:   Tue,  3 Mar 2020 15:42:41 -0800
Message-Id: <20200303234256.8928-3-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using the convenience function
v4l2_async_register_fwnode_subdev(), parse the video-mux input endpoints
and set up the async sub-devices without using callbacks. The video-mux
knows which ports it must parse (the input ports) and how to handle
unconnected remotes, so it makes the code simpler to transfer control
of endpoint parsing to the driver.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/video-mux.c | 70 ++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index ddd0e338f9e4..7b6c96a29aa5 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -21,6 +21,7 @@
 
 struct video_mux {
 	struct v4l2_subdev subdev;
+	struct v4l2_async_notifier notifier;
 	struct media_pad *pads;
 	struct v4l2_mbus_framefmt *format_mbus;
 	struct mux_control *mux;
@@ -330,36 +331,49 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
 	.video = &video_mux_subdev_video_ops,
 };
 
-static int video_mux_parse_endpoint(struct device *dev,
-				    struct v4l2_fwnode_endpoint *vep,
-				    struct v4l2_async_subdev *asd)
-{
-	/*
-	 * it's not an error if remote is missing on a video-mux
-	 * input port, return -ENOTCONN to skip this endpoint with
-	 * no error.
-	 */
-	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
-}
-
 static int video_mux_async_register(struct video_mux *vmux,
 				    unsigned int num_input_pads)
 {
-	unsigned int i, *ports;
+	unsigned int i;
 	int ret;
 
-	ports = kcalloc(num_input_pads, sizeof(*ports), GFP_KERNEL);
-	if (!ports)
-		return -ENOMEM;
-	for (i = 0; i < num_input_pads; i++)
-		ports[i] = i;
+	v4l2_async_notifier_init(&vmux->notifier);
 
-	ret = v4l2_async_register_fwnode_subdev(
-		&vmux->subdev, sizeof(struct v4l2_async_subdev),
-		ports, num_input_pads, video_mux_parse_endpoint);
+	for (i = 0; i < num_input_pads; i++) {
+		struct v4l2_async_subdev *asd;
+		struct fwnode_handle *ep;
 
-	kfree(ports);
-	return ret;
+		ep = fwnode_graph_get_endpoint_by_id(
+			dev_fwnode(vmux->subdev.dev), i, 0,
+			FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!ep)
+			continue;
+
+		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+		if (!asd) {
+			fwnode_handle_put(ep);
+			return -ENOMEM;
+		}
+
+		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&vmux->notifier, ep, asd);
+
+		fwnode_handle_put(ep);
+
+		if (ret) {
+			kfree(asd);
+			/* OK if asd already exists */
+			if (ret != -EEXIST)
+				return ret;
+		}
+	}
+
+	ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
+						  &vmux->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&vmux->subdev);
 }
 
 static int video_mux_probe(struct platform_device *pdev)
@@ -434,7 +448,13 @@ static int video_mux_probe(struct platform_device *pdev)
 
 	vmux->subdev.entity.ops = &video_mux_ops;
 
-	return video_mux_async_register(vmux, num_pads - 1);
+	ret = video_mux_async_register(vmux, num_pads - 1);
+	if (ret) {
+		v4l2_async_notifier_unregister(&vmux->notifier);
+		v4l2_async_notifier_cleanup(&vmux->notifier);
+	}
+
+	return ret;
 }
 
 static int video_mux_remove(struct platform_device *pdev)
@@ -442,6 +462,8 @@ static int video_mux_remove(struct platform_device *pdev)
 	struct video_mux *vmux = platform_get_drvdata(pdev);
 	struct v4l2_subdev *sd = &vmux->subdev;
 
+	v4l2_async_notifier_unregister(&vmux->notifier);
+	v4l2_async_notifier_cleanup(&vmux->notifier);
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
 
-- 
2.17.1


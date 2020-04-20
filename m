Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8F31AFF40
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgDTAjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbgDTAjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D552C061A0F
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t9so1675787pjw.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=TpZUcxTFyHbT/DrioLzn6Nb2phk0iviW6Pw1bDU0R1oWNSJjKyKA+cRNpoCvPc0mgd
         cHlZ2mQAK2LpCDr+O18kAa833syQf6wDIitvcVrDFx/HxokdhGQbD4A3KQQ6gsqaRZOU
         LwlBZmIhUUqdLy2/ZtLFZSmq7l+dCuYdITINuPPdHdIWRZVEpdIi7+aszPFTNC32d5o8
         XJLnuX3XAV7M40Cst1vbUlL+f4V0Y4CWKH0GbGmLO20g9KiMMyqjVxSILVMllU7pez0u
         3BcmyvFjmjksw6850R7KO58xQi52BQS3WWcu+aDwxYSaVXADBOBZ2iLtXb9MsJVNJdV+
         ZbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=Os/g6CmE+sXn+ASOFN7yjdZeLTnudDhD2WbsBM5gzd1qkBZebWs8+hZbJ/aUPg39xI
         rCMmN25tGGsHEEDl6ITPZPtOTnEEEVMVtJoK0KfmC9hBKo2DX0vp2p20ChuJoJEOjdIH
         8rVdevg/oA4nzPojleGm3B4Au/OJsDTf2/GAARsy7ipn/zkGWalFNOYCGWPn4IfbtDvA
         LA/Ls2nhLz9bcko0tF36pZNDNheJ2wEtGD6wSVFdIm9+MB5O3psaXjmLKytf+de9Yaw6
         9to4RMoHLbNY1/dS7GMZymQ5Z4Jw0leIX3fZ8Bds0RfH69iyhXhFDbQ0WrbUR9gmLXKq
         xyvw==
X-Gm-Message-State: AGi0PuZBx9KwrlWjcwLvVKc5C0GmWbI3O/R02kwJRDWE8inq83VyrPR1
        Z4yTVkOdTXuvNzCL1e4ZoUeXF5gQzjc=
X-Google-Smtp-Source: APiQypJI2TSWYjAghXZ07v+lRA4aBHgMb3Zlt1Jsi3PO1tyElkUWAf2reEJzeAurMNQXoVFYofsFZQ==
X-Received: by 2002:a17:90a:7d16:: with SMTP id g22mr18589163pjl.179.1587343183861;
        Sun, 19 Apr 2020 17:39:43 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:43 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 05/23] media: video-mux: Parse information from firmware without using callbacks
Date:   Sun, 19 Apr 2020 17:39:12 -0700
Message-Id: <20200420003930.11463-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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


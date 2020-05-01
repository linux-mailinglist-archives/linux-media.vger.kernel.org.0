Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BEF1C1B5C
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgEARQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728933AbgEARQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E63EC061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:08 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w3so3847705plz.5
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=DBpS263QMw5+MtOoiLyAmY6fQZOYrYNAGwCi0tNjVcbT6AqH3gpz6A9dWFGm4mgnEp
         bkd/3rFxMxpUTZUBIfRkEFAswfnECV223JcYZbMgp2PgtZRTN4Q4/UOQUGeNxCqN0+Xj
         I7MQrpMEHqVdghyv3p7sCep0nGhNgU1gfyokLhkJHAp/FqUyeWaPy+YpSAlqaAo1azKV
         8iKcjitszyn5f8H/oG22o2tZ7Qm5o25Ui19Od8cgrHqpwTLXYFoR9878LvGiUSpl0nkN
         lpiyzH993iNG52/4LMXWtV55X03tWJJ/qsRV16CVaxSFEP9FqRi6GX/WSKSuGjJWGtYg
         bCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=da6/kHTa4PmSLjQMbuwmheSk9zUOW8puN02Um2cjqfY=;
        b=neMaXt3WWzEu9Rlv/p1rI2DUZSm/9vtlKUd9Xdeo/lEHHZ8iF+ghvzv8U5Bla2bJ/w
         AQi4F2LDwkSvdvrO6+jh/rZvoOAzpAa8NNmIbg6E9nLZ19icbfa7WatJlKckjPP3FwfV
         kK92oTs22I1FmeoRyNVnMJ+pnKDEwfumNSZaMcVNW4+5inn+aGuo/QtBRpBGBUClCot2
         a0D/lkpool/fnPzAgH/PUTdJg52BYQv1knbU9IgNjHwAJELJVWDU2gPiDlYYXbMcSfLg
         pD2qvinelN/RgZrJS7AO6klcmOSoLYBfp2tBj/WoWUYnKr2CsL7iCXU645F/XL3w72hf
         h/Vg==
X-Gm-Message-State: AGi0PubCqsyadFEiNfAvclVwvwvkZzscUSS+6x5gVCIlrL6nk0YGujST
        Zci7BoxEpN5ZL0WzNQ4ltnq0VilH
X-Google-Smtp-Source: APiQypLEHLY7P5/rVu4uifih+nyf4vN5dlGCEhLuaXE/lzWAriDGJUwU7da6JEPbHRKY6txWdgkp2A==
X-Received: by 2002:a17:90a:6343:: with SMTP id v3mr646254pjs.127.1588353367674;
        Fri, 01 May 2020 10:16:07 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:07 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 04/22] media: video-mux: Parse information from firmware without using callbacks
Date:   Fri,  1 May 2020 10:15:38 -0700
Message-Id: <20200501171556.14731-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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


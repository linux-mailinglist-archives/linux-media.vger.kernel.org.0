Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098DC10849F
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfKXTH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:28 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43987 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfKXTH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:27 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so5412260pju.10
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y+3BTNqSaca7NC83BwvFX9hsocsd054ub84DKx6q1XE=;
        b=Dofu17LzGuSXiaHHruDlmYUGjrDSnY9WRhZSKfz2itAURgVQn16MkDQjhM2gxKGQQg
         254OvPZTk3uKwsPNEB0cfE4aQE7aBbIwnNRmtOcuxmmz1wSsWkbramjbYLTfsNLFW+OE
         jjRbTcmGaupEDoOhs78njdUw6N18EsvowKuj9c1rbyq3ytgfuGcyU7q0mV0bHdMg28XQ
         zZM3bHVSMCo1QcIdrkWFdnanKc8EwLdZceyQbXt7BwQrJT/Hy3WrsW51DNt3QyqpWBuU
         E++kyLa2y8VLO5HIsYGjTkKMTpgBOAkLVCy4EW6HMnrqC/8ensG9XEBdzzQBIEMEmrX+
         Xugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y+3BTNqSaca7NC83BwvFX9hsocsd054ub84DKx6q1XE=;
        b=RcWjI0z6AncOzw9l7Fk3xSwlgdDuijc8zbkzFQgDbhNcWD3iuz/p8EhlfFV7LHBQHl
         r/J1ldlkxixOaCcBenCPRZNcqDqlt6rtz2VZqUe8ZKtvyDZJZ2WjI75c1nUjx/fua+l5
         KhFmMiG6wod4JWCB9K1qJhG/GpX7IHN46milzQRkfAPrtALnVCY/jRon1y51midaG6xv
         hMS5hfXtMzS85vwvJ7gc9pb98cI25/tIgA5/0UH8t/hn3tTITBF5rpcBbW0vKMLY7kcu
         eFa/NBYcMfoIeOurFcdWKNNyddORICopxLUhTpAuAE1KTmtUTm8IU4W+wk16xpPZXY5r
         1fJQ==
X-Gm-Message-State: APjAAAVlT6zwQI48zNWs4ABcj3DywxNTbUvZ6m1YSuLJW3+s77IbWbyf
        n+VrLLt40rz+ouax8ZldWXqVyl9Rsqo=
X-Google-Smtp-Source: APXvYqxc9kfZR4O98X1U/sM6uQlAWgs4j8WLOAIRutZq3gVZygIoahnr4QdxFHcFK0N3Ae7S+YMEvw==
X-Received: by 2002:a17:90a:7188:: with SMTP id i8mr32788304pjk.6.1574622446562;
        Sun, 24 Nov 2019 11:07:26 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:25 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 14/23] media: video-mux: Create media links in bound notifier
Date:   Sun, 24 Nov 2019 11:06:54 -0800
Message-Id: <20191124190703.12138-15-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pads to all of the video-mux sink pads.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/media/platform/video-mux.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index ca1cef783646..de5b0698fc1d 100644
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
@@ -343,6 +349,22 @@ static int video_mux_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
 }
 
+static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct video_mux *vmux = notifier_to_video_mux(notifier);
+
+	return media_create_fwnode_links(&vmux->subdev.entity,
+					 dev_fwnode(vmux->subdev.dev),
+					 &sd->entity,
+					 dev_fwnode(sd->dev), 0);
+}
+
+static const struct v4l2_async_notifier_operations video_mux_notify_ops = {
+	.bound = video_mux_notify_bound,
+};
+
 static int video_mux_async_register(struct video_mux *vmux,
 				    unsigned int num_input_pads)
 {
@@ -357,6 +379,8 @@ static int video_mux_async_register(struct video_mux *vmux,
 
 	v4l2_async_notifier_init(&vmux->notifier);
 
+	vmux->notifier.ops = &video_mux_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(
 		&vmux->subdev, &vmux->notifier,
 		sizeof(struct v4l2_async_subdev),
-- 
2.17.1


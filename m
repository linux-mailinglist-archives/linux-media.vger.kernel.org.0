Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD2B82819
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731194AbfHEXfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41144 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731115AbfHEXf3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so40432226pff.8;
        Mon, 05 Aug 2019 16:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y+3BTNqSaca7NC83BwvFX9hsocsd054ub84DKx6q1XE=;
        b=KoKc5DK30Md16JA+DyXHLNy33mpCUrYqHHRCkddG8pzUv9kdPZK/iQalA1WFhuM8E1
         CySVvGmma07vfpeZRuy67pE6/W2/kPU9GtIuHAzgJVcf4cEsluharV+eONBG+qcTqGq7
         ApEFWz0upkwViZh6KIZ0S3jDOZpo307dMP/DG07srgjcypogMOfNpXetQSOGt8MkyP/f
         D3LSYPhs+EfV/u0Xj+qMn7beIb5zBLYUEhNuyC7sP4U6h5sfq9JPtMxpN5jOQrVZYFCA
         0yCcfTFwHirxl1lcPUotkWooGXujerpoB0DWUJbWkZ1YzK7QR49hIc5IS91aEf8bgY9u
         TENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y+3BTNqSaca7NC83BwvFX9hsocsd054ub84DKx6q1XE=;
        b=QZJI6eOwsCVXDvoF9jkRjvO3fthZyowykqbVbC4O2ayU3tc0gk8hVTrDvud0ZvEqjg
         C1vQthlEfVhx+9G/1SNGV7O9tYi3hO8Xo5/7UqVf4BDW/ugGSL1SFOjMzoxvC3pxH9H3
         qaLYRWYFOAi91b04YhX8MGowelm2adsxc4eCvACTkvrm8ojgSUYGtP9N28ianAKgmN5Q
         niNa//gWyTP++EAutAQmN3/g+xLjMnAiFyWlbMZxKhbisyW2Fvs0aq626PPu09RWMhoz
         dlxVBfATpAR39DTR/o20KG5sSX4Xjwfh4bnK5hhoo0aF8ZWBMP2s68b6/hTGSLphZKNj
         +M2Q==
X-Gm-Message-State: APjAAAWKL/zej9NNwwyxAnvDrQKDzsyv31TL5F3QzG1VGSw4KTRe/yL4
        2AUoel7S2SJ4fF5P9MFG9wNYMSKC
X-Google-Smtp-Source: APXvYqwjVjMjyeJjldrM9dQ93kuihvd5boLWfVbSw0+/fP9idMGt/uh0HYrkaEumlKFactdy8oQXRQ==
X-Received: by 2002:a62:2ccc:: with SMTP id s195mr525087pfs.256.1565048128785;
        Mon, 05 Aug 2019 16:35:28 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:28 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/22] media: video-mux: Create media links in bound notifier
Date:   Mon,  5 Aug 2019 16:34:55 -0700
Message-Id: <20190805233505.21167-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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


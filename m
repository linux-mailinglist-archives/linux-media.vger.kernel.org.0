Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0FE17869D
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgCCXn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:26 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35834 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgCCXn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:26 -0500
Received: by mail-pj1-f65.google.com with SMTP id s8so46946pjq.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1tZkatKoDWfM8xQlN+YOV09B4S9XGa85i1t4wiiwXPM=;
        b=A0bJ/Sr826VvVDedd+k+B2P457U3N1QgyYnkOWEcOTDxhS5OjUywGBf0e/1ZfXfTzB
         1Zt+poGNgB1RGOQU0A9azGFJlCELUjBHiJqmIZbCSHy5Q/w2oGuNpGKvNGPKJH+18GzF
         uhPt2M+BgJUuCCkIjP9FoZHQi7HuMBtwLvmSHHkOv1KL78znN80TYtCp8Uc3YGNtY1ce
         f0g9op8KvFzLo2la08QbLqxdZPkj00Z6/uHEaONOl/3xZMju35HAEGOIy5n/iavlBT52
         HdhPWMYjjrz0rhL/Tj4viWXNBfDI0hlV/f/WS96G8GIn1kAq3JDWRgbCS22qcNAhThvJ
         52dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1tZkatKoDWfM8xQlN+YOV09B4S9XGa85i1t4wiiwXPM=;
        b=JS/OzRn03BRPnny+J6icShbOnQICRlvOqoaw2+o+iRJfGlTEM+Um/qWdF9qQvnw364
         82kPshjceisCOAa76WAdb8SiMf2lkv2toV2Ra81APavb0FkbrhCphXAL9XinwVueR0hQ
         bYRJqFNo/nxHt+NI01S6deiaMin1RYoRg1KLYG/P6TUivhS4RKUslyYk4jYimfuZ0fdg
         t/aUn/8RupNcNJ8xF8HihCI1+LpLKqzM4nY3ZmwD2Nh+WZknMySeOZHOP/McGm2K+z0C
         7WMA0xtDVhC7p8rKKxu6YH5T8xzXJGTrcTpTt0ec8InAQX8ybPKSIs4bf4brhSRMGYQv
         v8qg==
X-Gm-Message-State: ANhLgQ0X44lRh6vpc0jBgcM3YZNGD6wjYNQpz1jF25L7zAtRvgfvbmDK
        x5mha8WakHQW46UdsM2ivpMkQiZ1aA0=
X-Google-Smtp-Source: ADFU+vubyQ1hhBKgHV3jjgKeA7S5/pkLy77VvS9iW/lYmbdJWLY3qKn8QQfVCRpN08YGYRdexnzDHA==
X-Received: by 2002:a17:902:8a89:: with SMTP id p9mr344665plo.286.1583279004119;
        Tue, 03 Mar 2020 15:43:24 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:23 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 10/17] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Tue,  3 Mar 2020 15:42:49 -0800
Message-Id: <20200303234256.8928-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link()
  that creates a single link.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 8500207e5ea9..26c0b579e6ae 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -91,6 +91,11 @@ static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct csi2_dev, sd);
 }
 
+static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi2_dev, notifier);
+}
+
 /*
  * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
  * reference manual is as follows:
@@ -559,6 +564,20 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
+static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *sd,
+			     struct v4l2_async_subdev *asd)
+{
+	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations csi2_notify_ops = {
+	.bound = csi2_notify_bound,
+};
+
 static int csi2_async_register(struct csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -597,6 +616,8 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 	fwnode_handle_put(ep);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi2->sd,
 						  &csi2->notifier);
 	if (ret)
-- 
2.17.1


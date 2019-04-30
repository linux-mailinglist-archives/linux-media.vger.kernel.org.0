Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86393102B1
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbfD3Wun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:50:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41237 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfD3Wum (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:50:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id f6so7517431pgs.8;
        Tue, 30 Apr 2019 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/tMVTYKS5f19+Vm4lAbyz0i8RYRYsyQ7fmIGeWfhtUU=;
        b=g8UnKYciCcCeuxEBsFXx9BB0P12k+LHkSTyBE0sTAkr61T4IPd1irA6y4ARoI9o7FZ
         FfvwtujtrOWCUw9DxyxWCqWB7wtALILsGinhawVuPo2yyj4JIF7Q0kKSSUgo9dDIi1Hb
         FP2rYZud3bdZuNpOagA7DzgGc6ndwauBUfewhG3/6vMywxYsKo5j8MyxJv1aRRtLVEKN
         TLBIgIvskDGVT1gayJSt4MrkX7zPbaC9dT6jUdmG10+glVK101thai+zGaO7fZ0bK6DY
         POwCCgFsj7W5eDqiyUWszD0+g+kdbKyG2LAbagDbQSyV/XpBx2MF0O8zqKCZUlxqdAwl
         4CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/tMVTYKS5f19+Vm4lAbyz0i8RYRYsyQ7fmIGeWfhtUU=;
        b=jKpKdNkM0z5nyVAZ/WJ7w1K9qhi4YHZOjYvJbWJwyCt8C7CbJLTKj6KNcPkX8ZbGr3
         2Y+3Os1b99KFBt9QQeAT8IjEKBRM+ZdNUlOO+/bIis0tJnXb3MHK7/kPrEtbby+313I4
         n7MMAa8czv63egKo7vcwEjRYA6GBCQfqJTIueQuIreqzL+sFVFnoWHAfuaSQuDdv7syf
         FbgqBoZIYy23zVtlvBdqKeliXDVldKXkx+KsMruOQQuEHbDJktvSj1E3agZdKg2iN+Uz
         YULLySGBohb9PysW5mzLV8Mf+Sd2WP2hjXxhyv+hmKOZoMt9Ga/xdGNWon5sPOqpA7AA
         EdLw==
X-Gm-Message-State: APjAAAXX4fobLnEigWBXt8hpBeL8hhtLnd6vC+lxEjI56ypecL4jgSYt
        vP/fd/rYqagl7R+J67doLTNEcUu8
X-Google-Smtp-Source: APXvYqxv34ziQubJh4BxSyUCO8v71+zp7yo39zeBhh/bEpP1aYlhXbHb4YuXLJ4JczsxjUJhlDqKLw==
X-Received: by 2002:aa7:9245:: with SMTP id 5mr34274893pfp.252.1556664641403;
        Tue, 30 Apr 2019 15:50:41 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id l23sm9804654pgj.36.2019.04.30.15.50.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:50:40 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 8/8] media: staging/imx: Don't set driver data for v4l2_dev
Date:   Tue, 30 Apr 2019 15:50:18 -0700
Message-Id: <20190430225018.30252-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430225018.30252-1-slongerbeam@gmail.com>
References: <20190430225018.30252-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media device is already available via multiple methods, there is no
need to set driver data for v4l2_dev to the media device.

In imx_media_link_notify(), get media device from link->graph_obj.mdev.

In imx_media_capture_device_register(), get media device from
v4l2_dev->mdev.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c    | 5 +++--
 drivers/staging/media/imx/imx-media-dev-common.c | 7 ++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index b77a67bda47c..565d21f169d8 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -732,15 +732,16 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
+	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
 	struct video_device *vfd = vdev->vfd;
 	struct vb2_queue *vq = &priv->q;
 	struct v4l2_subdev_format fmt_src;
 	int ret;
 
 	/* get media device */
-	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
+	priv->md = container_of(v4l2_dev->mdev, struct imx_media_dev, md);
 
-	vfd->v4l2_dev = sd->v4l2_dev;
+	vfd->v4l2_dev = v4l2_dev;
 
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
 	if (ret) {
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 89dc4ec8dadb..66b505f7e8df 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -260,10 +260,11 @@ static int imx_media_inherit_controls(struct imx_media_dev *imxmd,
 static int imx_media_link_notify(struct media_link *link, u32 flags,
 				 unsigned int notification)
 {
+	struct imx_media_dev *imxmd = container_of(link->graph_obj.mdev,
+						   struct imx_media_dev, md);
 	struct media_entity *source = link->source->entity;
 	struct imx_media_pad_vdev *pad_vdev;
 	struct list_head *pad_vdev_list;
-	struct imx_media_dev *imxmd;
 	struct video_device *vfd;
 	struct v4l2_subdev *sd;
 	int pad_idx, ret;
@@ -279,8 +280,6 @@ static int imx_media_link_notify(struct media_link *link, u32 flags,
 	sd = media_entity_to_v4l2_subdev(source);
 	pad_idx = link->source->index;
 
-	imxmd = dev_get_drvdata(sd->v4l2_dev->dev);
-
 	pad_vdev_list = to_pad_vdev_list(sd, pad_idx);
 	if (!pad_vdev_list) {
 		/* nothing to do if source sd has no pad vdev list */
@@ -384,8 +383,6 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 		goto cleanup;
 	}
 
-	dev_set_drvdata(imxmd->v4l2_dev.dev, imxmd);
-
 	INIT_LIST_HEAD(&imxmd->vdev_list);
 
 	v4l2_async_notifier_init(&imxmd->notifier);
-- 
2.17.1


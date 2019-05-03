Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3A0A135C8
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 00:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfECWnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 18:43:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39435 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfECWnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 18:43:50 -0400
Received: by mail-pl1-f194.google.com with SMTP id e92so3355290plb.6;
        Fri, 03 May 2019 15:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HM8iB4CzObwG2SEPGqDToLb7gQBrHKKFyiCMsrsHU3Y=;
        b=mm7sdVx6f2OEyOlk42Jw8HFX6fxKqEPe3irB1UsEQqPzp89d3+kSzdDq0fWSWwBHyf
         duXJdPyZEtNdgrPv+ip2oSYATqkxMXonj3AAcXPMQhLlqrhtdYoniWGsdxc7MhZfxMut
         gNmpGrwtDJaqEYrc3MB7yjckdLdkHSDdabxra8tlNP5hbeL8Hx7BxBuVZCVibXlKdQdE
         HA/Y6kVC9sh4/Miq+EYQvT/ltxs5hMm58GwVVL361XmOaquZtiz3Ens5Zy8VieGaK/z8
         mnK5WcVN0tjmj+0AKTLtGlh7nDy1VluqQVWgy/zjFncgIhbTjrbRJSFazUebMPUkfvSq
         9WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HM8iB4CzObwG2SEPGqDToLb7gQBrHKKFyiCMsrsHU3Y=;
        b=rignVnVDv+CvSZLzDnB2Z4heiYaKCC3X53722yiyG7oFtX0rhR0P7iW+j9Qv5GGJF8
         vTguiuycIMXCtp9URBi6U8UBfZbKe5gxvrGs9T9rCibHQ45yEjPUq44egVaQFxRKvNVJ
         yhKiRBdu9l9FoLE4ZZyKrsTwwbeu+IYdRdigbJbBnV6dtCGUkYg8oskY+eq3UF344XnQ
         2l9mHnGi7MH/+/o3O52i3KTcjRKPE1hmnyk4DwLsZNFJBGagr2+vIyYbfJhi3JGBdms1
         cHnA4Bu2Mw+LubN5oGkqsUNWdvqbJQK3h4DmWHsUP4nTvBvPkpwnfwabzGfsA9kbY5QM
         AGKw==
X-Gm-Message-State: APjAAAX2CTYymk3VvuWme/m8Y+pNax+v+F4EWcvSqKrxQw9xqNZfsV50
        sbuX4jH6kq1sfoKN8a5kEGDMEPdc
X-Google-Smtp-Source: APXvYqwLjaVOhyMKWnhVjw4/hXIu+HbUJy3eNp9/wbSTaU7dfZGxnJdwBqHfrpl5viIUsQ79HxXQlw==
X-Received: by 2002:a17:902:1e2:: with SMTP id b89mr13646101plb.278.1556923428992;
        Fri, 03 May 2019 15:43:48 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e62sm4793871pfa.50.2019.05.03.15.43.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 15:43:48 -0700 (PDT)
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
Subject: [PATCH v4 8/8] media: staging/imx: Don't set driver data for v4l2_dev
Date:   Fri,  3 May 2019 15:43:26 -0700
Message-Id: <20190503224326.21039-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503224326.21039-1-slongerbeam@gmail.com>
References: <20190503224326.21039-1-slongerbeam@gmail.com>
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
index 8a908c3e5e60..ea7f2decfc16 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -735,15 +735,16 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
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


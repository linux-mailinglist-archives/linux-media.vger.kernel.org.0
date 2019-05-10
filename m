Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5127D1A4DA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfEJVum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:50:42 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37535 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbfEJVul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:50:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id p15so3406361pll.4;
        Fri, 10 May 2019 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HM8iB4CzObwG2SEPGqDToLb7gQBrHKKFyiCMsrsHU3Y=;
        b=NgXXGSE9dUt5C/NqrKnCc2UqY9QJJYvFLuj2267CRjQO49pJWLXHbQS1IqB+yFALMG
         k9sTKqAHSFlRQpxcGNnmQGvb9FwJHfOeuijjzpnMUSsmiXq1owLbVbTi2QD337nU2gWV
         qqXtEtb9dzEWiHffUE5BcKhbYT8FnpmbPWpsWLAegbsdaBX/NKst26rNV32GqVa+u9NB
         ITszyXft/DO4qYjn0pkuO5q8pfhD147urgycJgQuYX1zv6etn66n66cZa/M9JWnjJONl
         c3++HHYtN84InhNRX7vFq4prmWlbkg05rrC6gl9eOOUsoLu9BFHVVMzYFZ1VV5DX4DQ5
         aMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HM8iB4CzObwG2SEPGqDToLb7gQBrHKKFyiCMsrsHU3Y=;
        b=CSB5dw7/TGXtj2yQ0BMzKpxdASZKUux8PzgWkJ//SWdty26m5nv4DZLxDBc5oQT/pB
         /VNkPqYMYDxY98iX4NWr8BkI3pRs1ZXa8aBVV8C8edPeUoubBUuOVKzB1lfnkqesztkF
         /y/t48H0XQoSq7cnGTmcD55R9WUHP/CRyXfP0giNEJGBPpFhKZoNdbRDq5mH9pLl8lfA
         6HR2Mx7VPnkUruJDVFvWd0yGbV1XYpDgkGIYwt28AMZ2AzpcOClZ/L/GmZUPt8ki4KQe
         9A99JvQUIf8C4zjK2Ba5sBFiyBuL5gLBCtxYwjoSnaUicxMqTa5EZjOe/PaKFuuvQeC9
         gnow==
X-Gm-Message-State: APjAAAW5JuHrGiT2vf4pcb8xTqGp5hgE5prHuzCQJC1cv6UpmxY67dI4
        lZ3hFPLMm8zA61fmc6tiyjIaUN7a
X-Google-Smtp-Source: APXvYqzeA56o0lX0C5kucO+TP19p5SLh1xvQ90ckb1eSEgmgse3i7wnFyVr4AFouuna3FP2qlWPwxQ==
X-Received: by 2002:a17:902:7406:: with SMTP id g6mr15440315pll.328.1557525040632;
        Fri, 10 May 2019 14:50:40 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e14sm1524108pff.60.2019.05.10.14.50.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 14:50:39 -0700 (PDT)
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
Subject: [PATCH v5 9/9] media: staging/imx: Don't set driver data for v4l2_dev
Date:   Fri, 10 May 2019 14:50:12 -0700
Message-Id: <20190510215012.13881-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510215012.13881-1-slongerbeam@gmail.com>
References: <20190510215012.13881-1-slongerbeam@gmail.com>
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


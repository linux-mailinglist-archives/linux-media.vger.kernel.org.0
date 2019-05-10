Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141F71A4C5
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfEJVu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:50:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42872 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbfEJVu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:50:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id 13so3882878pfw.9;
        Fri, 10 May 2019 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ILFENIjP3pNWcBKSRP9eS47C60iumECdMiBouSjU6so=;
        b=I8EBxrb4hQF/HSjVAZ0eX7cqdImmzwpA3qZcWlY5J2qRLntWR6PFM5K78S3hQJZfJS
         kxG157XHFOBnJa/z2didiEjDqhpbMxmPCHOuUo7T2HCmcNED9Z9IKsopKIrbLIHxXNJz
         ILpQQs1NFcRsLNrJy1iTllpA2zyb2LQ/B8bTQaqK5C2GwbaxTk52zsz2A65Ms7ORJnVS
         tf+2X8dszuwdO/2iTA+QIxc441zuMjN9umjxNCZZeSoDzQpkK5hqe5q3hrPT9r1Pa9B6
         Fz+kIRQilBs0OWeOwyp0ac9tHtav93sXvMT/u8+CYvwPW8MgsIhu5tF5vvL5TTnAad2x
         hTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ILFENIjP3pNWcBKSRP9eS47C60iumECdMiBouSjU6so=;
        b=S0w6BIJ2pzJVwnvynDPU+I+7Tb8wkK03r9rhD4WbnKJBHHesd8w/ameVGPlVhn44Xa
         FeTCKaD4tFKOs6kgdmAYJ5vHu//Qy+jKYJVnY3pf7NOXMmSKR21hOBrhkh8B4FfgQobY
         tnQ4DZCVAwY2ion5FEsWh2hgflZkzyv8t2hLH5N+XSINH7nQLX/+YaaBsziU34f7ET1o
         K+QEBXgOMipUje8gOxDmDkBxxbDbCN6EvX/YEK81EwFSxmFLj9orvQUBI1og2qV1db0R
         wFAgb3oTj+cPCY5Rjq+WuEWEibhjgo1yarM4RXn+cKn/XsQshPraaDf+fJPr3ZLOv66r
         AX0g==
X-Gm-Message-State: APjAAAXgXIcilnMcpJETwDChgRYiUDCCfDO7P1IWt/r6eXzswVApyEDn
        bx0tol48whfC47BNPzNfxOLMsv/0
X-Google-Smtp-Source: APXvYqzaJ6rfIHRoopXu6KSUaSoTGT0Dcukd0y1BznTi/uh/wLgpQfhBydkA1OoqzeaoXG8sz0DNLA==
X-Received: by 2002:a65:500d:: with SMTP id f13mr17052699pgo.250.1557525024766;
        Fri, 10 May 2019 14:50:24 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e14sm1524108pff.60.2019.05.10.14.50.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 14:50:23 -0700 (PDT)
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
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/9] Revert "media: staging/imx: add media device to capture register"
Date:   Fri, 10 May 2019 14:50:04 -0700
Message-Id: <20190510215012.13881-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510215012.13881-1-slongerbeam@gmail.com>
References: <20190510215012.13881-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx6-specific subdevs that register a capture device will no
longer hold a reference to the media device, so this commit must be
reverted.

This reverts commit 16204b8a1c1af77725533b77936e6c73953486ae.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 2 +-
 drivers/staging/media/imx/imx-media-capture.c | 6 +++---
 drivers/staging/media/imx/imx-media-csi.c     | 2 +-
 drivers/staging/media/imx/imx-media.h         | 3 +--
 drivers/staging/media/imx/imx7-media-csi.c    | 2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 3ca1422f6154..5c8e6ad8c025 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1270,7 +1270,7 @@ static int prp_registered(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	ret = imx_media_capture_device_register(priv->md, priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 7688238a3396..9703c85b19c4 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -706,8 +706,7 @@ void imx_media_capture_device_error(struct imx_media_video_dev *vdev)
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_error);
 
-int imx_media_capture_device_register(struct imx_media_dev *md,
-				      struct imx_media_video_dev *vdev)
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct v4l2_subdev *sd = priv->src_sd;
@@ -716,7 +715,8 @@ int imx_media_capture_device_register(struct imx_media_dev *md,
 	struct v4l2_subdev_format fmt_src;
 	int ret;
 
-	priv->md = md;
+	/* get media device */
+	priv->md = dev_get_drvdata(sd->v4l2_dev->dev);
 
 	vfd->v4l2_dev = sd->v4l2_dev;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index c33d714ed953..41965d8b56c4 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1816,7 +1816,7 @@ static int csi_registered(struct v4l2_subdev *sd)
 	if (ret)
 		goto free_fim;
 
-	ret = imx_media_capture_device_register(priv->md, priv->vdev);
+	ret = imx_media_capture_device_register(priv->vdev);
 	if (ret)
 		goto free_fim;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index fc5d969ded79..dd603a6b3a70 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -272,8 +272,7 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 struct imx_media_video_dev *
 imx_media_capture_device_init(struct v4l2_subdev *src_sd, int pad);
 void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
-int imx_media_capture_device_register(struct imx_media_dev *md,
-				      struct imx_media_video_dev *vdev);
+int imx_media_capture_device_register(struct imx_media_video_dev *vdev);
 void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a708a0340eb1..18eb5d3ecf10 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1126,7 +1126,7 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = imx_media_capture_device_register(csi->imxmd, csi->vdev);
+	ret = imx_media_capture_device_register(csi->vdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1


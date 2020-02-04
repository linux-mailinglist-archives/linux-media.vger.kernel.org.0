Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F7015236C
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgBDXtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:53 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:56102 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgBDXtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:52 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so126503pjz.5;
        Tue, 04 Feb 2020 15:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=Yy9WKoJxny1WM1LTJAaHQp4AkTgd8LBI0xpYLY6Fn0oeSdfohwks8vumgGn8JP3Yj2
         +4hupFpmWJDqwsNDq4eQ/VCgwhYYJ6i2pr9H4QplI4Vw+QZKC09SCn5y7RB/PCD1ZVRG
         HXxnXpugQb3SFC8tfPrvcpwAnA8MLwgyuTp2Q1BdAfs7cAMfi2Jaowa0b9KSsECDGBjM
         Sya0BgFaa2vQEGhDhOjJoJ46panfmfwJgvYIjywdBpcZ18pznnsWs8zxyBSctFs0YgbM
         VovFpV/24b5dlIzNkjlJ0OkQc21k4vS6607CXahqymGABgwBU8pvIKVpBnIHLBVikYJW
         vHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=B8wepfbGp3F3rAEFK/8RtfWDl3q1Pwzr9fDuXUJdCYC7QoXuGb+oH8+5l0iLb8OJJz
         2L69k1+Yh+HGiPT+hz1o8fGkAKP2b3XRGEyR4mN5pMbwi36QVclntfAzM+WvQq45721G
         dvDhV3oPzeur2KcN5Yl89XI8u1qdZbPEWUm43T41BS29LGy0Oo0ppbRYxAaBl2k8V0RK
         QUQzCqYUvVz3QqCL3SgErGtAQiVlqCCOMSbo8g0ZbbNnEBpVQh08vKt02c3ZblE48X28
         QVR/QCSjMx+XOXfotkLIYTgbwnPBn13u4nr+cq7ykL87LwTKkw2yj0VKEmIHzcLd9ylw
         MMxA==
X-Gm-Message-State: APjAAAXnZ+O6eJppTfOhmFjbzRU6L7BUcWLUv9n1scvomZjMX6Q8F/DM
        eqeetTtxGS5LqtREKem7athvMuZs
X-Google-Smtp-Source: APXvYqzubusBvsBD9wy7XWJhiFY4WOQKzM1XZxKRj5dG2YKTAV1RksFDtvGAJxFrohKb/059exTxcw==
X-Received: by 2002:a17:902:8549:: with SMTP id d9mr31416618plo.153.1580860191823;
        Tue, 04 Feb 2020 15:49:51 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:51 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
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
Subject: [PATCH v3 11/17] media: imx: csi: Embed notifier in struct csi_priv
Date:   Tue,  4 Feb 2020 15:49:12 -0800
Message-Id: <20200204234918.20425-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Embed the notifier in 'struct csi_priv', instead of dynamically allocating
it, to make it possible to retrieve csi_priv in a notifier callback op.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 25 +++++++++--------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index dc5fe25fe7b8..3e2afdd59276 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -58,6 +58,8 @@ struct csi_priv {
 	struct ipu_soc *ipu;
 	struct v4l2_subdev sd;
 	struct media_pad pad[CSI_NUM_PADS];
+	struct v4l2_async_notifier notifier;
+
 	/* the video device at IDMAC output pad */
 	struct imx_media_video_dev *vdev;
 	struct imx_media_fim *fim;
@@ -1896,31 +1898,28 @@ static int imx_csi_parse_endpoint(struct device *dev,
 
 static int imx_csi_async_register(struct csi_priv *priv)
 {
-	struct v4l2_async_notifier *notifier;
 	struct fwnode_handle *fwnode;
 	unsigned int port;
 	int ret;
 
-	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
-	if (!notifier)
-		return -ENOMEM;
-
-	v4l2_async_notifier_init(notifier);
+	v4l2_async_notifier_init(&priv->notifier);
 
 	fwnode = dev_fwnode(priv->dev);
 
 	/* get this CSI's port id */
 	ret = fwnode_property_read_u32(fwnode, "reg", &port);
 	if (ret < 0)
-		goto out_free;
+		return ret;
 
 	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
-		priv->dev->parent, notifier, sizeof(struct v4l2_async_subdev),
+		priv->dev->parent, &priv->notifier,
+		sizeof(struct v4l2_async_subdev),
 		port, imx_csi_parse_endpoint);
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_subdev_notifier_register(&priv->sd, notifier);
+	ret = v4l2_async_subdev_notifier_register(&priv->sd,
+						  &priv->notifier);
 	if (ret < 0)
 		goto out_cleanup;
 
@@ -1928,16 +1927,12 @@ static int imx_csi_async_register(struct csi_priv *priv)
 	if (ret < 0)
 		goto out_unregister;
 
-	priv->sd.subdev_notifier = notifier;
-
 	return 0;
 
 out_unregister:
-	v4l2_async_notifier_unregister(notifier);
+	v4l2_async_notifier_unregister(&priv->notifier);
 out_cleanup:
-	v4l2_async_notifier_cleanup(notifier);
-out_free:
-	kfree(notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
 
 	return ret;
 }
-- 
2.17.1


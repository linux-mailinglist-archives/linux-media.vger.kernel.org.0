Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC036827FE
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731240AbfHEXfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42295 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731115AbfHEXff (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:35 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay6so37098798plb.9;
        Mon, 05 Aug 2019 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bCNueNWeJXTLrTZ3Gue5cMu55WsUG1STmKF9FRV9s+k=;
        b=rIpRcB1BhG0BVBiNb6PGBxOSF1DpSDhe84KSk3pvLNQv3cUbn/23W6D3K/Zmjox+vX
         foyZFaKt89ShO7Iz6ACajUVuOCsCH0aKrxZ3R7i2U27rwESg+mXZuj+B1n/eUYZ9cXM9
         0kf1MgdxKLGEZb8fNcGz/zndSK5NAH4hNFqoCzv4ZO5ijR7C5LbnW6dfz0+AsXsdOj9A
         D6f83KMbyH6LX6ey0ZnClcPUmBVhLZsk2C2VpPfz6p3mH+PZvDUPMXF22lbiFL2hLmuE
         xOACOyVKgVhiqvrzjqdpSalDnRxmDUDB+0SzcsgrxwOMjR6i0wUxoT++O9I0zM6nIWMx
         0YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bCNueNWeJXTLrTZ3Gue5cMu55WsUG1STmKF9FRV9s+k=;
        b=FA/n8Oen1Fq9dpdQ0MhaxB/sZAj2JPmAN/Xv/tE9HY1wotVDcTxF0wgSBhhQWrSQtb
         Z2NZmtdEomPGbV6Er1+G/kHtf4pgIEMozV0p9VZi2ooBoS7qIkTXN4d1AuTnqQt/Igbe
         WaGRhFdc+W/4iKiTl4xi1ajDm+Ulh4O2bwZxIokXgScHdPI0EA3ScjYhPWNf/1kgmD41
         0MyEfU6XOGtWF0RdrVHKXO8/4UhFdZH22M0IL3ZeHlx+u7Ru/bgU69CqR7WvQHbQRRLd
         B3lGegZr53owmqYAt1Qv9NIx/NkuT8JUfoorDYR9Wb0ISBrz+eqRU6BrprHEkWBdSATr
         Uc9Q==
X-Gm-Message-State: APjAAAWl0m9wTWS3YMk73lUFB+72m9LMpE9+q0K/+an0+hKxA5Y0s0r+
        ftjIU+jfqKAeKMkHAOD7amF1K1oZ
X-Google-Smtp-Source: APXvYqxpbMjWVmnzuUM113Irj8RV4B5McZoB/4/bm7rnZLncgrGREH4kOM/mJnNymVLlq9X+TkbBzA==
X-Received: by 2002:a17:902:820c:: with SMTP id x12mr272388pln.216.1565048134995;
        Mon, 05 Aug 2019 16:35:34 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:34 -0700 (PDT)
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
Subject: [PATCH 17/22] media: imx: csi: Embed notifier in struct csi_priv
Date:   Mon,  5 Aug 2019 16:35:00 -0700
Message-Id: <20190805233505.21167-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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
index e193f66fa230..b39d79e63ac2 100644
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
@@ -1895,31 +1897,28 @@ static int imx_csi_parse_endpoint(struct device *dev,
 
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
 
@@ -1927,16 +1926,12 @@ static int imx_csi_async_register(struct csi_priv *priv)
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


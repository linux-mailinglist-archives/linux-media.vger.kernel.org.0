Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E084160034
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgBOTmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:40 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35596 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgBOTmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:37 -0500
Received: by mail-pj1-f67.google.com with SMTP id q39so5500517pjc.0;
        Sat, 15 Feb 2020 11:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=k3GIXKvWft0N1NbpenDUFg5zblDqcbUwzZDit6j5Lnn/XVvhgo5upPEa6pf+6EAMEz
         Xt3hbI7ZN7uQ3ZpDboF8dsqWS8SmiaQmTx7VTEHl/ogj+jq5hURSLNGK4VHhyJZj/Qus
         +bYF9uSPWj7Z8BwAyKR14ry4FKmhnTxJnPRiFZM9Vq4XZLEY9Al273TDUbppvZnGanEN
         XgsTT3BtOW7qp0sc+wDR8OgJhZGQ16Af0TNYgqSPglzYcYGIUZbTkO3OohkZb/hBFwDh
         v72JbltSB5enu0WPMOhZW9Ko/dsfsGdL+Qu6goM7QvrgD4+O2up1IqK+TKGYEk2J8ha6
         rYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=l859wukbdJLfS4auFUVmfBk5i7Ge2CcaUtmJxSasK8B2fOT2HhiNF7Xj50nds9rzxt
         yRUPFffVC3XWIEcxz0NsTi6fWZ5kfT1Jl5l9mOVthBajldgESc+CNuq8aOf8lgEJHVLu
         khXR3xJw1XFM8BPXs+OqHLtducOz/Ovwx030gkN2O4F5lDDpMLTn8SNTDqZXRRulYC+x
         MOBo9z/l7dE86BTxpJ+tsO6QrIIKxPC78yL4ske96c8KnLLTG8vllg318kpq73m3lOZi
         nbcbzvs4zWuD3JWGb72km4JSE0pQYx7JscXGNLSiFRJcTl/M2sp7ZPqFkk6CRN6pdtnG
         /Pig==
X-Gm-Message-State: APjAAAVmV5sufEsyTkqaQSWvoF/zAF6Zw9gAnfuuESGsl/KNsJo/Mb0C
        CoC/7sIiaKkdLHEwwxyfgPahQcwA8Us=
X-Google-Smtp-Source: APXvYqzkUXyKopzlHELwFuMNAOIllbGui1hUS/4slzE0JVfp8tA7A3yD2KKHvzv5nTeYgrIuLTwJ1w==
X-Received: by 2002:a17:902:5ace:: with SMTP id g14mr8946961plm.311.1581795756922;
        Sat, 15 Feb 2020 11:42:36 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:36 -0800 (PST)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 11/17] media: imx: csi: Embed notifier in struct csi_priv
Date:   Sat, 15 Feb 2020 11:41:30 -0800
Message-Id: <20200215194136.10131-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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


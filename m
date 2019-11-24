Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3AA1084A5
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKXTHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:34 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46722 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKXTHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:32 -0500
Received: by mail-pl1-f196.google.com with SMTP id k20so964178pll.13
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=U2MezOHPJhlXIpIZfS7PEXG3iMfNJxWJI2aEME50rey1eZLQv4gQi3Kex0Xragapaf
         7XnQ+1nMZJFbCARscIKYeIgTzw36a1e3LGyKbPZu3AMEmfxSNHu/5E7d2Q95KkGyBDHH
         xahr9/rNTTS5Tfl/14qBSGen4NzFdF9eljHKfta4ZGebVVV1ZqZTeYY+DrCXZeIdJBRA
         eH1BHLhhee5CycsJeV2GygQ/dD6SkruE6CjgzgzdtaX/Q4zbNrHFBFtxb5OCfuWpES7z
         04EvYcUkj73PUBZSSbxOGCxR09DWdBNWx9KksIMJK/WYgCtYixXz9lsK/y202LBmjaTJ
         IYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nw6qFQx6S/L6ma/0AlsKxKIDrQ4PZDVJaM1fr3Im7gQ=;
        b=VSti/mupEdlHrpo9cyw6smmj2E2v4/MI3xjXjwEV1qayVj7XiNUpsgNsiej7/+HkY2
         SoucYyrljW4y59JqOgRtaCNSwwdZaxbS+LsCBPF1gVoj7A8GBMLVWGnWCLLw0MKmxL71
         tvMm2EbEmYZWpEtxfQrxBeUl719M9vlQxNmqmlRklp+KDABJKRsndKeK/PwUfWHrMHr4
         kWlW1DOpA3G7Anib6cE6h75OHSTV5/LZ4Brp4blSaETG/9f+IYuwqSev3BtgYFO0bgDQ
         L//gDwLd2UeWCaxCTcAbhKdfQWbDl1iG0OyPc571c0MpoP1YXjbzV9NYfpMV0EcEWIvq
         0NKQ==
X-Gm-Message-State: APjAAAU4ePmniicRK7aMBYxrWNF2PRbHS2smKdgY3bLSIRsjG7nI6lQa
        VjT4gZ5h2JASfi6+2X+QMsQ5uj1m7mg=
X-Google-Smtp-Source: APXvYqxkV/vJTfmI9pPZGK0M8+q8xT1guwvcfzS/N0eHl5AJod0byvFdIwjmgJ9eozKQzv89JxjDtg==
X-Received: by 2002:a17:90a:610:: with SMTP id j16mr34191037pjj.85.1574622451699;
        Sun, 24 Nov 2019 11:07:31 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:31 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 19/23] media: imx: csi: Embed notifier in struct csi_priv
Date:   Sun, 24 Nov 2019 11:06:59 -0800
Message-Id: <20191124190703.12138-20-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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


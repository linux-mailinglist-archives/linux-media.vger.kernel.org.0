Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5171E82816
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbfHEXgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40166 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731186AbfHEXfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:31 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so40516675pgj.7;
        Mon, 05 Aug 2019 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fq0ktF/hBsnVFU7IozmhPFjtW2ydpZCCyFzM6I7LgOw=;
        b=X1OFNeqhQV0f90G9Q7+G/pt7EmUwrtUkbHW/9JOGxoTbmYiXMk1Gj8dkdpGlNnMIGU
         wlOOqDsjYDIbpNdCyuIysrh8YqS3FTQHYSEsfxu6VJSZV5FBXrd9ZVMZkzOSiUR3yA7q
         EAktoUHQQMN5VidRCbgrtsBJqlD4u9AH8Dm6kJwWq5rluZLYfKVE6zRJIScYE3HNRgY2
         xXDcJi1j75wi81PTvQQXY3CRCCF1fL1MkxWwNbdulab2B9AxUf4/X8cRgu5k9ittbDTD
         fXbDLmVbTjoaPuzBDLcfgAcjPvA4XeY6rSQEgAl2eIpxNNDhoQSNJUtKymgqCZv9GaaG
         30JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fq0ktF/hBsnVFU7IozmhPFjtW2ydpZCCyFzM6I7LgOw=;
        b=U6TNY6AgcJ+fxwUqgwrTZWCAM77oh4chTfP/irMDek5O/WJkjkMcoWq7uzRFnSr9hK
         ETEu4H5cHaMe28WDiuLxtFdpfrFEG4dgHXoisvsISn69b2oJV0oiW0nUCdCPV4efQG/W
         I2vD0av7ZHaZPpVBjWm97Mz0b12Wv+Zy8bnGRQGP0gzYULKVb9Qxb1smiNmP/bCKNzbd
         3/uB3mPQfsWiEL/uSiyP7DHlKhqZQ+GYrH25T5ilu5nx5c80oY4+JbMc7bIXK8caA37C
         iX54GOYhEXq0psCTIylQwsQHYZ3F9WEvGHxHmqxl9CtawT97MqV+XAmNSuL7y9/AEL/S
         sM7A==
X-Gm-Message-State: APjAAAVDS+RFFoiFO1d8wEdH62Xn0+LOUaUWw1de6c0G1ZgXWcaXLLla
        d5cgQx1F80CQMP4MhtgqkLxKFjvZ
X-Google-Smtp-Source: APXvYqz//7Zz8md/vVO2OPMxigo9UdlkkrkEJTsuzTyBl7CXjyfMV9TJYqhZbR9u7wNriFPY1YaD/w==
X-Received: by 2002:a17:90a:cb81:: with SMTP id a1mr189808pju.81.1565048130114;
        Mon, 05 Aug 2019 16:35:30 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:29 -0700 (PDT)
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
Subject: [PATCH 13/22] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Mon,  5 Aug 2019 16:34:56 -0700
Message-Id: <20190805233505.21167-14-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 408ee2765e77..5b2258156781 100644
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
@@ -573,6 +578,23 @@ static int csi2_parse_endpoint(struct device *dev,
 	return 0;
 }
 
+static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *sd,
+			     struct v4l2_async_subdev *asd)
+{
+	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+
+	return media_create_fwnode_pad_links(sink,
+					     dev_fwnode(csi2->dev),
+					     &sd->entity,
+					     dev_fwnode(sd->dev), 0);
+}
+
+static const struct v4l2_async_notifier_operations csi2_notify_ops = {
+	.bound = csi2_notify_bound,
+};
+
 static int csi2_probe(struct platform_device *pdev)
 {
 	unsigned int sink_port = 0;
@@ -646,6 +668,8 @@ static int csi2_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi2->notifier);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(
 		&csi2->sd, &csi2->notifier, sizeof(struct v4l2_async_subdev),
 		&sink_port, 1, csi2_parse_endpoint);
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A39B152387
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgBDXtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:49 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36119 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgBDXts (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:48 -0500
Received: by mail-pl1-f193.google.com with SMTP id a6so74016plm.3;
        Tue, 04 Feb 2020 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j/2evpY7A0C04k+gk98K37iMCYdFmql/BmRTWB1csrg=;
        b=Le9ycugOfEEybykcT8+miCmVKrq1TITIUOBemZS+jQOP3orUFyi38fSpfiRSq1UyOB
         pf3wQI/DtHAfBlQpH/0VDZOe5UYWreuBz1Y/+MDCTgy6j66TIQr3MN4Vd0IB2qDRjGZi
         xAxZ/tExX08f3od/rBpZ1SHFML1yWq540pS4Wd8rvs6xrUurW1w2xy563mxmtgM7JPaV
         cq/cE4uhXMt7XyQ+SlAz9gA1yvX9f3sPhyUww6iz2tGkwvHyr3soulGOUCbbjfJhPJAZ
         ZNZlnK9SPDu6AXDVtKSgFlxbWa5feYE4EvPIKzlb1aDS98rtw7a3cMC1XvRijjJAF7hr
         eZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j/2evpY7A0C04k+gk98K37iMCYdFmql/BmRTWB1csrg=;
        b=g4aP3lWaPgtjkWDiSuirAr5qkz+/VaKA8q2HDLPeqiGJldLZjylEfN1CAh/Bke80EZ
         kgzgEnqigY3YuKQobII46vzOZLwjreo6yqvxm5slTj+oeL2DDAZEJNHNpbQCZrTf5xdk
         MTO+xINt5ZCuHpb7v+wn2DWnGNv+UP08OKiKgwrNvDvBQjupb0K05T7+r8jbveXfvE6V
         cRDxwp2JDcQdggPB7p8cyIbclPMui6Sat5VRWkLXqCv2fJpVg/1dW2xNeYDxErJa0xNb
         wkQeOg+HtwaZcKeP2JYp2VfWHvk6r84y8yXpRM43k63gLv9yTihOuP/2QfDNnKwFoZgb
         R3sg==
X-Gm-Message-State: APjAAAXXYU+G7W6OVUVp0/olnhG/zZqkgcLzCvTVP2o1dw9JKPXs9BS3
        vBIfbxPIzfIFT8Ea7IcbfKqN50H1
X-Google-Smtp-Source: APXvYqzd5F1QfdHZ4Puy966CryZKh3FhnnA+0FjfKGt35fUDUUvC8HOzxic58qwpCy2MTsi8+gEBzA==
X-Received: by 2002:a17:90a:cc02:: with SMTP id b2mr1960199pju.137.1580860187663;
        Tue, 04 Feb 2020 15:49:47 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:47 -0800 (PST)
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
Subject: [PATCH v3 08/17] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Tue,  4 Feb 2020 15:49:09 -0800
Message-Id: <20200204234918.20425-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
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
index e27a342751fc..fddf6388348a 100644
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
@@ -584,6 +589,20 @@ static int csi2_parse_endpoint(struct device *dev,
 	return 0;
 }
 
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
 static int csi2_probe(struct platform_device *pdev)
 {
 	unsigned int sink_port = 0;
@@ -667,6 +686,8 @@ static int csi2_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi2->notifier);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(
 		&csi2->sd, &csi2->notifier, sizeof(struct v4l2_async_subdev),
 		&sink_port, 1, csi2_parse_endpoint);
-- 
2.17.1


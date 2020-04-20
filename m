Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA8A1AFF49
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDTAj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726105AbgDTAj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:39:58 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EBEC061A0F
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id e6so1265751pjt.4
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5iZ4ElvB1SxhCL6livyWFYVITUmBqykVUIxdDCLmPkM=;
        b=h2fxC/39hH7LZJ/r5hx7fmLAOWPI+IWasPWXpFJ/Yc1NGuogTqlyIYiyY+W6oSQY7j
         NdAN9JtJdpxYr2eQl33EOzzSx/deTuOEblN4vixI8zDqqt+UKueYI105dPBt/nN9t5KO
         WFCJ08ZcY1GrtsiUcb1djU+3LmdQSShXRlUWB+8BD+dncLQms3lHRO6+BRkeJoV0F/Fg
         0HoSrjcuftIs4CGjyfwUvbPN8OtaWAdCbKubcMXlmmukGojmscXSay85sOTucNohZ2n3
         HNpOWIIcSbV7Nk8hPgZ2Deu9nl0lVFLdMJKHC2Ln0xUh3l5PZAfsAvZ+H1M1lyplp9Ti
         uDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5iZ4ElvB1SxhCL6livyWFYVITUmBqykVUIxdDCLmPkM=;
        b=kmsz9DLzdVTn8Hew19AGGsTuvZZanHciaSTSoQMC5AA6mTmccxx4b+hpCzlbBN8AlE
         4zWPppiaq7G65QHZJE17DvoHhG5SavKj68tt6jOQcjfVqZXAWo8gc8WA5/n4+RXCh6E/
         4wmyGDUeDxTO2xQtiBTr8eIUIyf4d3m6M07CTm/LMxFdFbL99uWPEVodkyLprJ6dQC6d
         Y0jcLWBAF2waJaqoVWRobbs/6ToAPgKTi8QOMJTksii1pxSdg9YAV/b275YI7Un0ZUAl
         ecY4CihSaVEYIMULoWfGu6HCdo4K/6SedH+XqPfxNR4ahJP9cP6l+xoHkuqNX6DlEqOB
         PDYw==
X-Gm-Message-State: AGi0PuZazbgPDVDCjty4JU7msMZxbCP2RCoivQrMIcOwNpWsszqkxQHB
        qzKXKTWgQasWSHcXxDVuwv/0cylXRH0=
X-Google-Smtp-Source: APiQypLF9WnbLr3fkkmoj+yGLriKL8lDXDvAEjx17D9cZsoF+kSCoPZpRI7LL6tOwG5AoTarGwDwCA==
X-Received: by 2002:a17:902:ba86:: with SMTP id k6mr14810831pls.47.1587343196651;
        Sun, 19 Apr 2020 17:39:56 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:56 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 14/23] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Sun, 19 Apr 2020 17:39:21 -0700
Message-Id: <20200420003930.11463-15-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Chnges in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_links_to_pad().
Changes in v4:
- none
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link()
  that creates a single link.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 5f5aef658a04..41d61c9a09f9 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 #include "imx-media.h"
 
@@ -91,6 +92,11 @@ static inline struct csi2_dev *sd_to_dev(struct v4l2_subdev *sdev)
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
@@ -532,6 +538,20 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
+static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *sd,
+			     struct v4l2_async_subdev *asd)
+{
+	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations csi2_notify_ops = {
+	.bound = csi2_notify_bound,
+};
+
 static int csi2_async_register(struct csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -570,6 +590,8 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 	fwnode_handle_put(ep);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi2->sd,
 						  &csi2->notifier);
 	if (ret)
-- 
2.17.1


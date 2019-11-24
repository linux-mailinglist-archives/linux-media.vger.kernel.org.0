Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782261084A0
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfKXTHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35641 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbfKXTHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:30 -0500
Received: by mail-pg1-f194.google.com with SMTP id k32so5947031pgl.2
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GZ+ndbbNSOuinmxZ+Pqw9olU2lkbVgSJQGTQgul1b80=;
        b=VnVtZALE4HwaKYx96+9w6/bbHDsONBZds5JD8JaIpGoRG+XhxkKHX5MxFbtlh284KM
         97BVLGnPD1ym39j1+TobGya26OdvkGKK254ZZSeozgt4/vc7LRVu/XoeHDnzEj4sEV6l
         b9ZiIg8IGBShhGnJcUHnPqJuc5+8wZLxKB+4GZd6Kyyq2eaHcd0qcEano31D1cfeEwd1
         g/nCTVM+NDAi23MonDynukbJ0vH1PAqosGnqrhuuoufBs4q59T4HEGf7f71hCypOCIvl
         ytMGPrAUtd0XuBbyX4m9bJaEgjlyTfn7G7poW4MmsxaneCe8ZKEWy96e/Z6q2EVSDe9+
         MsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GZ+ndbbNSOuinmxZ+Pqw9olU2lkbVgSJQGTQgul1b80=;
        b=nR7agxiysZFCgXfLSW09LFOGwpkTJoElEd7mxN6xeSxof0VsQ85I6p97aFv/dDbCZu
         sz3tSt8YbpJEDwwa3capTJ/YxwXo6Pr9WK640h2mgm3EjuEkAEVCuoboI5kG/PDhufO3
         lS1z6DTOQpuS+bTF16Cxu3P6NdbhEwYJHS8EffPmI9EqWBw5YUVSN7z9pAFaIbS9aany
         3jTl5qUodUQFBC+XluDhMR7V03EmobaACT/yHAVEIJAsShXpjwNqbC8lu/p/v6pd2iVF
         lte2RftdQ49/gdnLAY+aHyNac1m024DOaS39xVHPdhGG1Lv0f56TK1rXdGxUCqyoHd74
         cbGg==
X-Gm-Message-State: APjAAAXa6a7hR69JpfHEVHLbTwL8z11xh+ZzqqBO8P9dVqTkcgiNrYf0
        eSN/4wpwF1DxfSiunyo/yOwGu8LRixI=
X-Google-Smtp-Source: APXvYqw53MiqXmBr9MA+coO3twXtIiu7UUoFj6kJHq/EqzUHzieK1drPDPr02P2yzrqc0RuT3aks5A==
X-Received: by 2002:a63:1e16:: with SMTP id e22mr8387794pge.87.1574622447599;
        Sun, 24 Nov 2019 11:07:27 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:26 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 15/23] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Sun, 24 Nov 2019 11:06:55 -0800
Message-Id: <20191124190703.12138-16-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
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
index 06ed4057b426..19275a310033 100644
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
@@ -556,6 +561,23 @@ static int csi2_parse_endpoint(struct device *dev,
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
@@ -639,6 +661,8 @@ static int csi2_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi2->notifier);
 
+	csi2->notifier.ops = &csi2_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(
 		&csi2->sd, &csi2->notifier, sizeof(struct v4l2_async_subdev),
 		&sink_port, 1, csi2_parse_endpoint);
-- 
2.17.1


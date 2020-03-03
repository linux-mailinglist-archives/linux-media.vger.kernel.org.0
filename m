Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32217869E
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgCCXn2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:28 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40422 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgCCXn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:28 -0500
Received: by mail-pf1-f193.google.com with SMTP id l184so2315817pfl.7
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u90FNeV7YRWX/ZiCG1LHsUcgglvWvd+1ge0hhU/zuqo=;
        b=QwZeBa7UMT7kP3/NkVSjucIxMf50WJupqQZpfxysjlOU2DKp1BeZrfkqONBpmtrqPo
         H649RLXAGAgbbsNDSgpjTG3h+wTRj+jlFYShxPr5LJyh74Xna3Wi8meHFsHq0ewlJXMY
         gnmM6rjOJ4Q4riHJRGvqItvnolx/g2L/8C4k6dgO2Bl3+JvhjAtIDi6Vpf8VOUJN93+b
         mSRgnDNKptQBHWP1Tc+PfQzdYW+6H7JVcJccUqaeXBDGvJHvJf3+2IILi/e8Nj3Lfe32
         iP1xk7w4j7AR7zjMdgNzu6yTkfyuADMJPcO4jC+UafvHEoYs6FxeaY7Vu1JrDFzlXKKd
         ZDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u90FNeV7YRWX/ZiCG1LHsUcgglvWvd+1ge0hhU/zuqo=;
        b=kXdw1gW/x+kDRHkuWRHL2JSx3OfkfJdDJVYqJ3DrmUIfzcLn7XKUgzPC6T3S5PE9cq
         N9y13KVISr5yfYiV29htW0lWo4/dxA5E56yGiImiM8gtk4KWv5n1Vu71DWlmcv5ih5/j
         JWQdW3vb3s87aPCrYop7VNIOYAJ1dnpIU2SXVPz0/gOWYA8nURSf23tTbU2Q/KxQs851
         aiboa5MAV27kFgCCKBazc4X1SIfOUzegD1XrW/gBzFOOBKdtq5oJLzT9YuXghRLdQbzM
         91wXVf+4yz5mSsFtOWL3//uEoTwyHdM1iH2uodYX54t8awnccn6z1yJWRu0ocnRY4dxK
         GQTg==
X-Gm-Message-State: ANhLgQ2WQAecLnOOgTeFhIOtCE+ywgsVRoxBHa9OHnzhiAKn+yHXuoys
        WctLiqNIhcpT2FiKdyFYhT8q/DDpGUk=
X-Google-Smtp-Source: ADFU+vudvLnY6xwduNuIVNM9PHoO9dNADomuWMN8mF+xcws1psN1qZUhz/q4DnZyHwwihe6Fy2exKg==
X-Received: by 2002:a63:445:: with SMTP id 66mr950644pge.351.1583279006027;
        Tue, 03 Mar 2020 15:43:26 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:25 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 11/17] media: imx7: mipi csis: Create media links in bound notifier
Date:   Tue,  3 Mar 2020 15:42:50 -0800
Message-Id: <20200303234256.8928-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
  unnecessary inline, and rename to mipi_notifier_to_csis_state().
  Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 7e872d8f51e0..363545127047 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -317,6 +317,12 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 	return 0;
 }
 
+static struct csi_state *
+mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_state, notifier);
+}
+
 static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
 {
 	return container_of(sdev, struct csi_state, mipi_sd);
@@ -828,6 +834,20 @@ static int mipi_csis_parse_dt(struct platform_device *pdev,
 
 static int mipi_csis_pm_resume(struct device *dev, bool runtime);
 
+static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
+	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
+	.bound = mipi_csis_notify_bound,
+};
+
 static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
@@ -899,6 +919,8 @@ static int mipi_csis_async_register(struct csi_state *state)
 
 	fwnode_handle_put(ep);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&state->mipi_sd,
 						  &state->notifier);
 	if (ret)
-- 
2.17.1


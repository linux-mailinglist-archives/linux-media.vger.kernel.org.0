Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8970B10253
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfD3WZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:25:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42539 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfD3WZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:25:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id l2so7128328wrb.9
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2019 15:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFFVCEKbOlmuK+M4O+sZWm0uKwVyhXJnCOKlV+9Ibzg=;
        b=qj2WKvZsnVatXrEGldmhqxrJV+K0l6MlqeJOxDL+cvbTMBv16kYKCur8/4nmkelW6j
         p2V6ByM3G/kesv7+Id28DWKq+9zdWSjm3vLcACa1VmMAiUxQVnEUzGVsah7P3tzmkdNO
         EjtDt7uwuvAs96WEuC8htDgCU8FcMF9Ik/ktkISeNQRzYrFzUqIJYJb1ZBCPCNNx+czy
         18PB1uKVvHGRHoxu11tjtRLBLEDk+DxTE/vftJ/fZjGFk0WM22uYLYKm4nz5f7lofc7+
         xtkk18lkaLq5z//ZnSy0RIt97wc3ISDqdTUQwRz91JeXyXvY5qEQiOeZfqK/LVpApFhR
         vIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFFVCEKbOlmuK+M4O+sZWm0uKwVyhXJnCOKlV+9Ibzg=;
        b=alQLaQ7XBA1AQl0Y8H0rD1hxBe6805D4snLA3KhDrKJMzZMzRVcRev+IF9XwNAOoRt
         wNtGZ4g6Nbb8m/H8G2Bf9IrTkAO8d0sq8O5RRVEssx7gnp7oW/YWq8G6brsv3IvfXuUC
         r5MT3muha0X+TCozW2t8eeeC4aRvN/lgQIRTp91InCZeiS+hp3Jl0VXETRPRFpig5N9G
         otFoutQxs4GAjwfiCG6tPSToJs355ZavBf9EkUgsTOGdCeKuzvrAFazl8mKFG3LcQLd8
         lvbKYfhYa/NfW4YHiIcNaXUMx8cr7qQNwLdi0ZgX1AVrFucp+fLLaM4gsHqvjafAIXDn
         +ojw==
X-Gm-Message-State: APjAAAWxeVpS3zFSkuLAwy6uhTdceMeQAMxCErePI4g9IG2FilqQZ6QI
        Hir8WSG8nP0dYwvHU677OEDdfrricb4=
X-Google-Smtp-Source: APXvYqzJDMKGP/DpH3rjxdqq3fJ8QgKmfUy3MWlUN1HuwK/ptGOhbrhRUZgEWoQO+DYcIa8Bj0xkqw==
X-Received: by 2002:adf:ec51:: with SMTP id w17mr5694221wrn.326.1556663139368;
        Tue, 30 Apr 2019 15:25:39 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q4sm15715694wrg.24.2019.04.30.15.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:25:38 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] media: imx7_mipi_csis: fix racy entity pads init
Date:   Tue, 30 Apr 2019 23:25:23 +0100
Message-Id: <20190430222523.22814-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the media entity pads after the async register subdev can be
racy with probe complete callback. So, make sure that the media pads
are initialized before the probe complete is called.

For that move the media entity pads initialization to the registered
subdev internal operation.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 19455f425416..042837b8ea28 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -784,6 +784,17 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int mipi_csis_registered(struct v4l2_subdev *mipi_sd)
+{
+	struct csi_state *state = mipi_sd_to_csis_state(mipi_sd);
+
+	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	return media_entity_pads_init(&state->mipi_sd.entity, CSIS_PADS_NUM,
+				      state->pads);
+}
+
 static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 	.log_status	= mipi_csis_log_status,
 };
@@ -809,6 +820,10 @@ static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
 	.pad	= &mipi_csis_pad_ops,
 };
 
+static const struct v4l2_subdev_internal_ops mipi_csis_internal_ops = {
+	.registered = mipi_csis_registered,
+};
+
 static int mipi_csis_parse_dt(struct platform_device *pdev,
 			      struct csi_state *state)
 {
@@ -869,6 +884,7 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	mipi_sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	mipi_sd->entity.ops = &mipi_csis_entity_ops;
+	mipi_sd->internal_ops = &mipi_csis_internal_ops;
 
 	mipi_sd->dev = &pdev->dev;
 
@@ -990,13 +1006,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_clock;
 
-	state->pads[CSIS_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	state->pads[CSIS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&state->mipi_sd.entity, CSIS_PADS_NUM,
-				     state->pads);
-	if (ret < 0)
-		goto unregister_subdev;
-
 	memcpy(state->events, mipi_csis_events, sizeof(state->events));
 
 	mipi_csis_debugfs_init(state);
@@ -1016,7 +1025,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 unregister_all:
 	mipi_csis_debugfs_exit(state);
 	media_entity_cleanup(&state->mipi_sd.entity);
-unregister_subdev:
 	v4l2_async_unregister_subdev(&state->mipi_sd);
 disable_clock:
 	mipi_csis_clk_disable(state);
-- 
2.21.0


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E7F1084A1
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKXTHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:31 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40215 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfKXTHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:30 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep1so5422237pjb.7
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qKzW5+s6KI4myxqad8J3Vr1gc4mjcMaiSiZAkdUBak0=;
        b=Gyu9En7H9SL54wFBU9+u6daVm7zL4pX493gkvapEwNBvBKb8TBPDNup50udV/PKtdX
         dZi1OR4mgweOknwFKVYa1EGoeGDu481GM6jm9ljqHxZFJ1ByTGK6mUeWV6L5qDZ7IRLM
         v+z8zBv7/63RUFEe9M57wPzkG6sPgWxdco0i9mNpSZpW8r+7Ij93jQw9Dzrrm5ONLC58
         w4NwrxB+qMXLa4KobuDox7buNWc6I7bBtTzPweElGco1G1SxSLZD4bl63FbaKhLxjDGv
         ycWJFLL/p8DlOXEUEoUUQRb8pmVoOYBqfdCtrBpds0VZXswfIJ7Ye29eLtt3g1GnZbcj
         fgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qKzW5+s6KI4myxqad8J3Vr1gc4mjcMaiSiZAkdUBak0=;
        b=EeoTO3Uy9r1X2NqZ7ywyCrYFfBb7J4CCSLJvb8SrSXgd8YJ5fHybXxWsx62i9Q/4zQ
         xtgeDc03X3pKLQ7ZUurqRKox5sJlCuyCcZx+gA2DQuZULB514o2n/W8Yb8Us5wzr8lEi
         gMJJuPlnVT/CBlUncweW6U0II0lAhHB1gczflBNHbpgyCy9Dt/atxIffAUOZRvs8c9PI
         Jr0Qqw9jZxT+p/LL9VBtDmMy/XB03PMltRAttmGzIxqrwwd653rWy+iXaGvwxMQ+Nw4U
         Da5hSOiz1nmUZbzs3O/rNzFeK6i5+Av1ArlM7dLFzHHZ2cVmwkiNX1nqCLQtsy084X6Q
         0exA==
X-Gm-Message-State: APjAAAWNQxLyAeMjqkrA1x4Rkpbf0jzMWK7slzdRfNEYnXQJYLP7ZWTH
        nx7BmidYl0hT+bvjw6y5KdNg7WoljFU=
X-Google-Smtp-Source: APXvYqyHKtF9kjOLoDbMs0ghqGMMF6iZkVrIq0dpo8qZhusJk2LclZPkaM8ip7RSLKwtLT7QIdJE3Q==
X-Received: by 2002:a17:90a:2223:: with SMTP id c32mr11401710pje.15.1574622448772;
        Sun, 24 Nov 2019 11:07:28 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:27 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 16/23] media: imx7-mipi-csis: Create media links in bound notifier
Date:   Sun, 24 Nov 2019 11:06:56 -0800
Message-Id: <20191124190703.12138-17-slongerbeam@gmail.com>
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
Changes in v2:
Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
unnecessary inline, and rename to mipi_notifier_to_csis_state().
Suggested-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index bbbc4d55fa9e..0ea6a48c2274 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -319,6 +319,12 @@ static int mipi_csis_dump_regs(struct csi_state *state)
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
@@ -850,6 +856,23 @@ static int mipi_csis_parse_endpoint(struct device *dev,
 	return 0;
 }
 
+static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
+	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
+
+	return media_create_fwnode_pad_links(sink,
+					     dev_fwnode(state->mipi_sd.dev),
+					     &sd->entity,
+					     dev_fwnode(sd->dev), 0);
+}
+
+static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
+	.bound = mipi_csis_notify_bound,
+};
+
 static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
@@ -888,6 +911,8 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_async_notifier_init(&state->notifier);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
-- 
2.17.1


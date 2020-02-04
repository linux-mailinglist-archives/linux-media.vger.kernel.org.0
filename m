Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E46AA15238A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgBDXu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:50:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43803 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbgBDXtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:50 -0500
Received: by mail-pl1-f193.google.com with SMTP id p11so60646plq.10;
        Tue, 04 Feb 2020 15:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h5BHRotCYsy0a67S2KVH1ySLbRo1QXYTOC5G0a45OSw=;
        b=N6krExxw+iDOgtznqR14UzAobO+11LQwTqSIFnq01ZN+/cRryxOKZiPH6j258N7gnB
         XksOmfuX4/M+r1Ju1OKEH2S4W9cd5roKe4PJNDc5alJYXDpC9qE2xA4J38T135DvnfXl
         mmHfMcfbwroPCc5Lbd/vDm3uVA6hNtr4ZPTOOy8MhbKLeN/FcWNVvVktChc3ohX2InZ3
         sSOOFVcIHGII58Flo8fj2sVSutv4X2heuk3jRs7L3k/wyMHyrFSHcFGqc1HSSqEuLJ+3
         trYC8ZZpAuwpjNkWf31EakOElMLkmv6dZuI9Ly2ya1nNwOSMj40SKlBPa8lzkymc+aQD
         M+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h5BHRotCYsy0a67S2KVH1ySLbRo1QXYTOC5G0a45OSw=;
        b=BSX+Ably089jeMuFXxX/UZPAeBf2+Ce1S2JsCmSuFTx/AThVKGQDue+vIKpVN6cD8Z
         dQewFSieEgKfMemUKyutJM7DyfjScMH2PfoizGBoKGGz1FEPjNlkt+a3An0Tqodzyhjk
         xWWJ7OeCsCUHG2R2mPzXREQ785NGCLmlzO5abavgYtJl6uSbv56y+iNnFsVxWDP7iQfx
         ibbDzXvgzVUqryTtgdWHDMSHutIKJIhKiaUI+0yPWKa5sJ+l0Klf1v4tJ3Ydq+D8t2F3
         FYiIGgCVx6UfGxs257FYt2tDE/VpUguDRL0dUvTgfhQGlTyJn9YMJL2DFgT5sOtXI4ox
         kBjA==
X-Gm-Message-State: APjAAAXsi/mB4FNkCP2J3MH+QS4eTyWTSRf1xGZDWAHYbzpcra1dB7bM
        D+27rUEyDq/eXImdcsDYGUUweQsw
X-Google-Smtp-Source: APXvYqysNJ3RiWVPT9jFpzVjeZWRqmiw1QVTywJOVhIiqMr4BgmIi5yBgbIXD7yptVHG0IAPw4XeBA==
X-Received: by 2002:a17:90a:c301:: with SMTP id g1mr2085955pjt.88.1580860189106;
        Tue, 04 Feb 2020 15:49:49 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:48 -0800 (PST)
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
Subject: [PATCH v3 09/17] media: imx7-mipi-csis: Create media links in bound notifier
Date:   Tue,  4 Feb 2020 15:49:10 -0800
Message-Id: <20200204234918.20425-10-slongerbeam@gmail.com>
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
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
  unnecessary inline, and rename to mipi_notifier_to_csis_state().
  Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 4c54456318ea..d3a83577efed 100644
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
@@ -848,6 +854,20 @@ static int mipi_csis_parse_endpoint(struct device *dev,
 	return 0;
 }
 
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
@@ -886,6 +906,8 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_async_notifier_init(&state->notifier);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
-- 
2.17.1


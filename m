Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83A78281A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbfHEXgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44379 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731203AbfHEXfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so40517064pgl.11;
        Mon, 05 Aug 2019 16:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fbs1mFAvJTATM6fIvB9UCHmR0ykE58CEjMWw0CNcKVw=;
        b=J3zvZBPbrHmjS6LZta22eIsImAqYXiEzcBjlGvfa482lW8RjJx4Akc0Ae3QmAzH2GO
         h0LOzT6sPTs/PEl8B7wYP3VutzzoymShyzc7QKqD/z/fAxou3Ejno26qhQWzTw9ZbvoX
         s7CM7TZYWM4m8Mm10u8JGrDRrw1V21hEUkPPSbplPewwOJ2nAcvDkID94cqB8PC87Pb8
         vfxjBV11vQ5JhzuWPxQ/5hvbjhBvvhnci3txlljSsa0yTGdtVQksNsnCcfLM8pAgpluZ
         TwfQZi+2cQTMR9/zLZB2EAsHJaW1U7vUPTntLgrdSicwrUJKpr7z6mcPQ1RurdeOh4Wn
         2Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fbs1mFAvJTATM6fIvB9UCHmR0ykE58CEjMWw0CNcKVw=;
        b=M3JBsk2R6lZHuLFCbUGZXko/7mrm5SsEhgp7izLb+QNZgcQCi5Mffr8wFr7B270J3S
         YhL3lsZFODNHahzQcIyKLj+tyCCKm5OQVda6njHU9csdXWDZJw2ZUl/By1IGUPG46KaZ
         oy3sdicXIQN8MTWD+yn6GA6kFRphIfzNOMqUsf0VtDnGC7Zg89TYn40b8o+jbrq9SUsv
         LHBzUtzpymPEukWkMV2OmS10jepEQ4W4XG6CbuPPrQ6z2uzy0J95iBWshstalz8dQK5O
         W5ON+kwU/1fI526XWjqATBSaiyeqP5ewIoDpis2KkW35ySRjz0+KmahTpYVa9hAtHW/v
         bAsg==
X-Gm-Message-State: APjAAAWsBSCHO7DcMc59rZJn6a7Tjj+ldZxZINHMMjWgsSjQZkWdBBAX
        fJ4mJpszgv2WhJ6gDGI4/zAtispl
X-Google-Smtp-Source: APXvYqxMcB13LsIEJrOTuGY/j/XtK9RITES5UnefU9LWRAVWxAW33EUR/o2Ph3AMnZGny6/J1lcIww==
X-Received: by 2002:a62:ce07:: with SMTP id y7mr548956pfg.12.1565048131431;
        Mon, 05 Aug 2019 16:35:31 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:30 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
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
Subject: [PATCH 14/22] media: imx7-mipi-csis: Create media links in bound notifier
Date:   Mon,  5 Aug 2019 16:34:57 -0700
Message-Id: <20190805233505.21167-15-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx7-mipi-csis.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index f71d9183cad2..e03b2317a1ac 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -259,6 +259,12 @@ struct csi_state {
 	bool sink_linked;
 };
 
+static inline struct csi_state *
+notifier_to_csis_state(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_state, notifier);
+}
+
 struct csis_pix_format {
 	unsigned int pix_width_alignment;
 	u32 code;
@@ -863,6 +869,23 @@ static int mipi_csis_parse_endpoint(struct device *dev,
 	return 0;
 }
 
+static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct csi_state *state = notifier_to_csis_state(notifier);
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
@@ -895,6 +918,8 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_async_notifier_init(&state->notifier);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
-- 
2.17.1


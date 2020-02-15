Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1336160020
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgBOTmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:23 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43037 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgBOTmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:22 -0500
Received: by mail-pl1-f196.google.com with SMTP id p11so5129314plq.10;
        Sat, 15 Feb 2020 11:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j/2evpY7A0C04k+gk98K37iMCYdFmql/BmRTWB1csrg=;
        b=TlHXKi9U8uiS2fkx2BPSRGo8YoyUc6hHaVvyRF/ec4V6f3e2pH8hLJC5vKohYdzCWn
         cmCCKy/flrosl+0iPDsZgqdwIe/WgrsSGa//kLYqxgKrVxMWqWKotlrBSh6orJ7ljBYn
         oa+Bv5oefAEIME3xifu6PzgaINoMr2vpri9DEznRfFt34Pi5hSTp+5MRTqVP6jnRBHij
         4kBrKqeI+8u0bsVvSJ9fNm6YYDR/WwQHpfkQ5Ip57liK8BFvYVQNKb37cX5YxTpcjbY0
         B2FZctlpPUNGIrt//nirJ9SqU3qwnHkBersRETRBze0OHHVC4HNmIUbSKxzVnmjpkZGA
         PnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j/2evpY7A0C04k+gk98K37iMCYdFmql/BmRTWB1csrg=;
        b=JYFydN2YuCzOFLIJ+5xabGs2POaW3RosBFwQ1EOr654wWp00rYZGmyFkoy+SIRIboo
         Yjvi8Y13RP4XR/FyX9gW2JadtrXwUUeaO4ddU3ltD32rnXyWSmgRqkRGygoJejHIjO8Y
         cwag5v0mbhOLYaD0/MaUKGJQ7NpXBLipMSNfI8tyHWMmeYqrgTEjdO6RQdsgSSNKoJoQ
         31p74TaMr83A5DFSebLXLhHmNiLXcyxarbyQy6Aq+2o363u5VaXgmBg25LLT7CiQEZeN
         yN0DnoAZup05chRgA7FQR/IEVVaprHqvRUsAKRMz0DJ2T4eFg/KCRAtZqVUjfbQwA13f
         YBLg==
X-Gm-Message-State: APjAAAWdyqwPjsbQf25tar3EAsXCGh72NzFqVVmI4SmLBIly8p60z23Q
        Vmjmi3JD69vEL4naGZCEtLl6rpO4zOE=
X-Google-Smtp-Source: APXvYqzMiPby3ABFgdEWNgjVyH0LYRY9+ahPWNR0Ixl7qauNjkEXOJEmC9DbQ6oumPosWwBAam5/vQ==
X-Received: by 2002:a17:902:ff11:: with SMTP id f17mr8898260plj.273.1581795741629;
        Sat, 15 Feb 2020 11:42:21 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:21 -0800 (PST)
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
Subject: [RESEND PATCH v3 08/17] media: imx: mipi csi-2: Create media links in bound notifier
Date:   Sat, 15 Feb 2020 11:41:27 -0800
Message-Id: <20200215194136.10131-9-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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


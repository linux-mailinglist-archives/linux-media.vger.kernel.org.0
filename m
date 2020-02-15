Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 749EC16002A
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgBOTmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:36 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39788 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgBOTmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:35 -0500
Received: by mail-pg1-f196.google.com with SMTP id j15so6911126pgm.6;
        Sat, 15 Feb 2020 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ha1G3XO6Vb76DqwKYHrBrsy5rfHEKdgMuf1qeb5yKus=;
        b=Q4REyd3idXsfin5Vl+BX00/YFMs4hCR+L1l4RXoiLz5ZgfQjqJAQ9H/WYlB4kFFuUn
         2BeQ8QY0Xbo/AXVK6omCd2e8q2qM3Cf7RyjeCPn8Kp15Om5Loq757kfcG0ONVfrFKoYn
         X500fw4Ax9F2m4vpO2tnkg/tEeFSBPbInrWJL0siTj/b+oU6a69nJSvRG7wywi5TBf1K
         pa/1SBon8bHvTHbSxPS0PPHjECAALbiprnh983paW7opRn6p0DBqoDR8kBxgrbVNHI/r
         jF5I2qiraTuDyDa1lRgQiWVPPJR46f5SuX76CXRRP1tX1TtNNO2RZzCyDMlPpIr8ZX77
         4NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ha1G3XO6Vb76DqwKYHrBrsy5rfHEKdgMuf1qeb5yKus=;
        b=tVQaXGfRVqm7GdG/2lub7pO1oxhULU3Z4LX22mJQJ4xh9Ku92LyO/BbBSdC6cToVQT
         m9nXoMuWr0R5wMfhlCVowjiMPi+rn+wke/x7726z9ysiNrkhSM7LLR36msXIwxYVOMcJ
         kIfGgEIxx5d2QQYA6w2Usty4DUUW8Gh2B05QV9RzBotTdGBsViHFymN625vOfu9lpeW+
         R6doeKG0HDqySulOX9wnxuS62G9bh2vMxhYTAuvBW5r21zgKrGdSZ0wMZGQYfNTHWnPn
         rIq19ljE71vwSNwQ50JyeuAprteAiWQGoOX0uFuPRfyV5ne+QdniX+kZ4cxjXyCTUjdQ
         vwfg==
X-Gm-Message-State: APjAAAW6Wpz7zsJBTfup0rdyf5+JpgxVNwDO3dYtuZhqEmEpShqyeM8M
        bUjcqS6qjy6nhUWJr7fuovZCFyvAcmg=
X-Google-Smtp-Source: APXvYqyqh6I7hOUhflWBDDniEbao7BhGpMR39ofFTVzbTV6SmesNF6l10KxundtimLZ6vZIQ42CIyA==
X-Received: by 2002:a63:6383:: with SMTP id x125mr7728780pgb.409.1581795754064;
        Sat, 15 Feb 2020 11:42:34 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:33 -0800 (PST)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 10/17] media: imx7-media-csi: Create media links in bound notifier
Date:   Sat, 15 Feb 2020 11:41:29 -0800
Message-Id: <20200215194136.10131-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Rename notifier_to_dev() to imx7_csi_notifier_to_dev() and remove
  unnecessary inline. Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-media-csi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index dc6d1a28fde7..cf9f675c53a3 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -196,6 +196,12 @@ struct imx7_csi {
 	struct completion last_eof_completion;
 };
 
+static struct imx7_csi *
+imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct imx7_csi, notifier);
+}
+
 static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
 {
 	return readl(csi->regbase + offset);
@@ -1187,6 +1193,20 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
+static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
+	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
+	.bound = imx7_csi_notify_bound,
+};
+
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1269,6 +1289,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi->notifier);
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
 						sizeof(struct v4l2_async_subdev),
 						NULL, 0,
-- 
2.17.1


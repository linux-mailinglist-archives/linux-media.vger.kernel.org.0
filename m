Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79611084A2
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfKXTHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:33 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36285 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfKXTHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:32 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so5953445pgh.3
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yySuFpmjwOQiPlCOH/hIkjrkYS//RfWjr8qhFINVqLQ=;
        b=orRDshB7cgZ0W/uUPEn+Z2B9D8GBODr6lGevXU71e5NaQHBp3pO4mTdb7M4/U/LWwf
         LOsM+GoOXpPAkfxTZhRxfEkU8XfKVkx7H8te/m1KKYXHObcO7MrM3tixcgZHYlzdF1UQ
         rCOyZg3mKSZ8eYjLPLOmbXyaMTCrDX9blTZdCTwvahUB3VvAgmQX4dzkYZDogSdclLAn
         nPNsip/RtcXcHpGk0JWB+tY0UG+swoTgfWPF+pmYHiQDQ4xIX1ohLQeK1knxXD9mZMp7
         9399tGtMCL+465wDE13muhDHQyEoc5iBxMbMcP6GuG0x8uUl/1ik9DPfIML48zz1LVoc
         IKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yySuFpmjwOQiPlCOH/hIkjrkYS//RfWjr8qhFINVqLQ=;
        b=DZfR1Fzjd3tRsysE5YdLtzBkCY/+mc/3/DKaYgEFt9Z3CAlACmM6Sd2xeeVoB1dzCL
         sqBiPPaZoH+w9BTx7jym5AhCdMt97MW08CbIlBRVQ+Tfyf9QHiYm0xUqhM0aB0qUf+2b
         IzZTc6n/2rVphamz/M4kitReMONImFF3D3VMONIgQICo1oC5GrEPDICVXJ/lfvo8lC1X
         Uif19N5i/qY0u3D0L81Xk7Uy2l+zARNJM2o60VxbCIZVC0GR06EhZADpIco8RrDWxBxe
         KA1eNtAJqouqMauV88nsOzF9VXu4VwpijS60t8srKrgNR1uN43WQSyDmCTh9keWQMn85
         kQGg==
X-Gm-Message-State: APjAAAVNEMhdxrjcHYtlTlUv6CVw1CzCUktBSmLv7BRDJR3jBEDKngGP
        x/sddwY7hTn1zmWcXYf2ilKb4uisKhQ=
X-Google-Smtp-Source: APXvYqwuk5DUR/yM01Cani7CTDPCXt1X5AklZDKuzH4mQIVd6tFY7HK1ONcWlQMa0BlHq/dqQ5ZctQ==
X-Received: by 2002:a63:6f01:: with SMTP id k1mr11363344pgc.214.1574622449649;
        Sun, 24 Nov 2019 11:07:29 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:29 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 17/23] media: imx7-media-csi: Create media links in bound notifier
Date:   Sun, 24 Nov 2019 11:06:57 -0800
Message-Id: <20191124190703.12138-18-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
Rename notifier_to_dev() to imx7_csi_notifier_to_dev() and remove
unnecessary inline.
Suggested-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 15b08bfb5aa7..848d1286fbeb 100644
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
@@ -1187,6 +1193,23 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
+static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
+	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
+
+	return media_create_fwnode_pad_links(sink,
+					     dev_fwnode(csi->sd.dev),
+					     &sd->entity,
+					     dev_fwnode(sd->dev), 0);
+}
+
+static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
+	.bound = imx7_csi_notify_bound,
+};
+
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1269,6 +1292,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi->notifier);
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
 						sizeof(struct v4l2_async_subdev),
 						NULL, 0,
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCEBC82815
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731371AbfHEXgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:36:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36065 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731212AbfHEXfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id r7so40423645pfl.3;
        Mon, 05 Aug 2019 16:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=80zZuvj+LjB7muc1lRSag1oD8GSQkupjbn/Cdl2Z1us=;
        b=m9+1Z16t7VCOSQhnktxeXV9tpgKBUk4i4dqvz1AUM2uLciXya2YHvUdXKQPg0nahrp
         Ls2DL2gNH8qovIXjYf3Ou4K404eivEwkhL8C+H1EjVAuTSOaDqxBoT63k1fy4l7adTzQ
         A8FZAf4UVV73lJCmwuyKdNwn+s/AHZiFq+Lfy7cgnR0uOjHpcX4BXip0NbwJaeDsALPC
         POF+Gbq9VZLBATGU2wh30Jfth38krYE1Tlw/3A1u8v02JkC6ye9uz57r4S+AHmfDMw/Q
         Sy8FW41P88uHNyoSkU+TtXlmHiDG1qLCBe2VO7hgLpTe/I1MZqUKNtKVgKmQSdu5Q+x8
         6Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=80zZuvj+LjB7muc1lRSag1oD8GSQkupjbn/Cdl2Z1us=;
        b=nIxMgldzLGrTKqeGHOSXHfnPOHjQIK0XvvgzAOlwZLpX2WMgffLOqr1+VpfjblyVYK
         z+XRoQc90JyR1QGefy3XJZXSWcK1ciDDLPPeQk1OL/hjXsbjlVJYB5KCctz51uB8l5l7
         2G/IvwXymJ8krJpuXp3CH4dUEPBNSRXRLU9HaYTIgQEktMLbkdw8CDB2TqyPflvr92Hh
         vV6gOGar7NfT+pEYyEeH+IP0UKM9HGHLlU0LtrmF93JH3IcZ2tw20Uu59dKyGzcbJkdU
         mI1QwGSQD858xd4TmE7pTEVqzD8EI3wM6irIJ2OteO2xvZ9gLZkSx5rpIfyX7PQYoT+e
         wfcA==
X-Gm-Message-State: APjAAAWpW30zfvdK9Sl6/6RipCe1MYilLSXajLWqLtCGaQhbD1kKvyGo
        ImcJgjCUMt/FfIy34a7g8buLS/xm
X-Google-Smtp-Source: APXvYqynuc9WSN7P4iFLSAjU9euUo/l2aSIhsQXrCHSGZFYLHfCOnZ0+BnlOVd8HxGgj63ZeqPGtRw==
X-Received: by 2002:aa7:9481:: with SMTP id z1mr560979pfk.92.1565048132680;
        Mon, 05 Aug 2019 16:35:32 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:32 -0700 (PDT)
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
Subject: [PATCH 15/22] media: imx7-media-csi: Create media links in bound notifier
Date:   Mon,  5 Aug 2019 16:34:58 -0700
Message-Id: <20190805233505.21167-16-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a1c96c52a606..f71ac485f780 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -196,6 +196,11 @@ struct imx7_csi {
 	struct completion last_eof_completion;
 };
 
+static inline struct imx7_csi *notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct imx7_csi, notifier);
+}
+
 static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
 {
 	return readl(csi->regbase + offset);
@@ -1173,6 +1178,23 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
+static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct imx7_csi *csi = notifier_to_dev(notifier);
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
@@ -1253,6 +1275,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	v4l2_async_notifier_init(&csi->notifier);
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
 						sizeof(struct v4l2_async_subdev),
 						NULL, 0,
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42B8B15236B
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgBDXtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:51 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37495 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgBDXtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:51 -0500
Received: by mail-pl1-f194.google.com with SMTP id c23so72577plz.4;
        Tue, 04 Feb 2020 15:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ha1G3XO6Vb76DqwKYHrBrsy5rfHEKdgMuf1qeb5yKus=;
        b=clTHQOua5ugicz9SFwYMbXH1AC4U17gwJLFJXrYA19wFEZDaqG55wLKVpjnmar9k2w
         l2EduYB1bF7nKZUnVZV4SL1XhMKpPrwfuWJtzUexjbwcMPkP06YmdQWipoSiSsjtufK5
         rgaGo7AUYzb2+4Qh6EGgxdlgr9KADsuDZ1sxa7zQJoEf7p9dDCDmDep8tihLj5RkgiSF
         9YTTW61j1iz/Si2iudelXlgRkCGFPAwoctMg1+MCoaKLnqqajhrFYD8kmNds5jBUGCVu
         tyfV9t15GS18zC8XrBF98Wk+AH/PndxU40jgsCWpq2p9DW+uvMHlRAiUSJcmmB5pp2To
         8mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ha1G3XO6Vb76DqwKYHrBrsy5rfHEKdgMuf1qeb5yKus=;
        b=Z15KGRP9P/wdhaLLDqBbeoWSN5DrZBhyPdhB7dJ1H8s5kNTHXAW7LxkD0aikkJCT73
         NqYetxrtdcuep9rPkLrS0DkvXrk51NcxN/KAJRcz71YGYYccmUHJC15Yhasn10tkKwDw
         sTczegtVIPL+/LJ7Qq5Vsnvt0EIxBTkCU/K2wTX1LYXCxUNJgE7cu5X6n3ZQbBixPgZu
         GekXMmMd3aGskNRPY2e3n0nv00N200j6kQvOR/3A+J6Hv+kbvkSyVDSCmN+nr+l86uIH
         JdqVGzvB3lj/tcutbdjzgK83xq9JRbcVDt/qKqcEiZAQegmdkVHqOj+r4WUFbXn5lse7
         o1YA==
X-Gm-Message-State: APjAAAVdIG7s7Gs+pAmV5BVLpL4Js+PO1D/u0TxcaUjgXBPjWiTFLFTS
        3cP+//V5zeHTd31TLq4WlJqSmHvM
X-Google-Smtp-Source: APXvYqwyLzleegvKCr9D4YaahTk1C9/W40AyYBCK/ry/o6dQcN67cWcYH3Eh8r0Gqgv52nHZiPiPWQ==
X-Received: by 2002:a17:90a:c691:: with SMTP id n17mr2098311pjt.41.1580860190466;
        Tue, 04 Feb 2020 15:49:50 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:50 -0800 (PST)
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
Subject: [PATCH v3 10/17] media: imx7-media-csi: Create media links in bound notifier
Date:   Tue,  4 Feb 2020 15:49:11 -0800
Message-Id: <20200204234918.20425-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
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


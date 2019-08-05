Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4422E8280F
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731248AbfHEXfi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:38 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41783 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731231AbfHEXfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so30169830pgg.8;
        Mon, 05 Aug 2019 16:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6Pj12shXDJ0qL2ITkdFID+0sK7YPIfnJU0EODI45PAo=;
        b=P0cWEJqDtIxlI1iTv4y7nWfH9E/dxbKOHhDEh1Ldkd4KsNCON8XIrlTGdDK1ATCV24
         1pIOi/RmvDSo99JRk88cCOrbmxC7aRhJu7psaA0w/Wb8Dy7uQd0qAqeAWD6gS89htzum
         IXoJG5CORpjEXHBRY0klwJJh1HpapaZ7g5kv2Ar2lryCWFh4NwADK88QZxREjbpWskO1
         7iRKe9s9zr0BQS6lPdiqAHIyjO62zig/8ZcIipv999RP/bKmNDcwpPVac7YKd6ubANy3
         M8sIgODKgXP1t/GSK4n0bavVAMcyuHQzQnpD3Pg/Ld/IKwiHaxJMhawz31vUWPTDcSym
         W54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6Pj12shXDJ0qL2ITkdFID+0sK7YPIfnJU0EODI45PAo=;
        b=HSKkuzEs97l9bS3k4mdcAncOHZ9IbdgUEkTrqagIEe3BSKZTmxoRvaa0Mx9PMz+4eB
         oBfqqfoTg48v2rXrI4FpQ6Z/rbfKXzkW3ZAx+jNn4NNvNUnKkEgvk5GAyg14OjAPfhEn
         F0fZyyIRrdhlNATeqplk7Y4Hhj824vL2tph01kZJK3ve+d6ALN2lsd0cQSz6cKAd9zPF
         XZ+IBITgNnFp6KRWwggqlFdN4A+XQ/n65vXw8uxkuPWSKWCayPVRSq5AUBKPGL/O18g8
         fz8+4k2KNyoJW3HWLuoeFTzkM7LkZCvZ5us1vfaiBnZMhLzxKKjjqGBqBldk18l3Qv9k
         ea8A==
X-Gm-Message-State: APjAAAUR9JATyqFujkmOlI6zgACWiPXanuYOqHrb+omk3kgrGPsf5zTu
        g4aO9czMu4eqV1ILjDWotvFImB3J
X-Google-Smtp-Source: APXvYqwCuNAlXO9lVulSaYfkaEjh7QPRwoh7y+NSTuatvygZigIcX3cPqTy4WpLO+oFiGtP3uC0Vaw==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr194531pjt.107.1565048136137;
        Mon, 05 Aug 2019 16:35:36 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:35 -0700 (PDT)
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
Subject: [PATCH 18/22] media: imx: csi: Create media links in bound notifier
Date:   Mon,  5 Aug 2019 16:35:01 -0700
Message-Id: <20190805233505.21167-19-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-csi.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b39d79e63ac2..37b10cbf3c1a 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -120,6 +120,11 @@ static inline struct csi_priv *sd_to_dev(struct v4l2_subdev *sdev)
 	return container_of(sdev, struct csi_priv, sd);
 }
 
+static inline struct csi_priv *notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_priv, notifier);
+}
+
 static inline bool is_parallel_bus(struct v4l2_fwnode_endpoint *ep)
 {
 	return ep->bus_type != V4L2_MBUS_CSI2_DPHY;
@@ -1895,6 +1900,23 @@ static int imx_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
 }
 
+static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_subdev *asd)
+{
+	struct csi_priv *priv = notifier_to_dev(notifier);
+	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
+
+	return media_create_fwnode_pad_links(sink,
+					     dev_fwnode(priv->dev->parent),
+					     &sd->entity,
+					     dev_fwnode(sd->dev), 0);
+}
+
+static const struct v4l2_async_notifier_operations csi_notify_ops = {
+	.bound = imx_csi_notify_bound,
+};
+
 static int imx_csi_async_register(struct csi_priv *priv)
 {
 	struct fwnode_handle *fwnode;
@@ -1903,6 +1925,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 
 	v4l2_async_notifier_init(&priv->notifier);
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	fwnode = dev_fwnode(priv->dev);
 
 	/* get this CSI's port id */
-- 
2.17.1


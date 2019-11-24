Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A015B1084A4
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfKXTHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:34 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39441 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfKXTHd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:33 -0500
Received: by mail-pj1-f67.google.com with SMTP id v93so2156662pjb.6
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=w9UD0KbOuv61h2E5uokL4oDGzhRyPV6pq2zfaUlyAZQ=;
        b=AxYIUyp/A/MeY+NtzyfgasJiaT1stD4J8vLxU5G18+aFQFdY/T3OEIPCrf9eFI/BRv
         76pUCk8JguJjBQ/yb8P89V2MiJZ036GgvEQ3Y6L2JeJEKmmcn6KQ3CoBEdJZF6g4UjT4
         A+mquv/Nxj0dcTmkmBG85IycGOTMtekByXLuG/x3gmPDyAx8ydhSymBXubuLWNo75gvl
         HW1lafD/Hz38QvsrRvtFRKzbWlJ6FYYQcOETuYgbKMkHreqKPQx1VOxXwXWSYagcb0X1
         0EUb+a3UUGf9zraFKorqvXUjr4MmOCMljljsfHYS/1VFExjd+Jdi72mQ7Y5ETrvzweyl
         hNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w9UD0KbOuv61h2E5uokL4oDGzhRyPV6pq2zfaUlyAZQ=;
        b=dp7jwLKUMlfBO612pbf7ENp9xvPV68QBCTV1bkFZaOjs2B9OFTM2SObWSxJahB7dPk
         OCIemw4oHAJ7wpevAoTNpu9wFNuNjsswJ2TeITtazikne3tOhffglnMvZC4HB3r0VyE6
         LcAcaKAjrUY7DzvRwEeNNEP/iYxvAkvBQC2mnPeIfjYZekMEIdI73sqA9zA7jPSBbobg
         qy/ukXy6mN3tleR2BPwPvIPfzSHwEtrePuiJadmR9kIeax8G1Br465TG0DGCq55ulERu
         iWZOOgMn5Q6qyKxPkMQU1rXdDFeao37Z8LoovdHE3o2hFkqchbyiAhHWbDYnxtnZkNtH
         1ZYA==
X-Gm-Message-State: APjAAAUeeIaBejrzZvTWhRgDIhrbgbPQTZsWRlAM4cLYlKIPepOk0Nox
        6R0dcegpF0wX4kXSLKOlXK6rcrWvUBY=
X-Google-Smtp-Source: APXvYqyX6jguSfkaFpU41a3jlGIfgIzGln1MBuauspNqXkbJkxoXdQ2v9MEd3oZvv1N58Ztb3zEfcg==
X-Received: by 2002:a17:90a:9915:: with SMTP id b21mr11132179pjp.104.1574622452851;
        Sun, 24 Nov 2019 11:07:32 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:32 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 20/23] media: imx: csi: Create media links in bound notifier
Date:   Sun, 24 Nov 2019 11:07:00 -0800
Message-Id: <20191124190703.12138-21-slongerbeam@gmail.com>
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
 drivers/staging/media/imx/imx-media-csi.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3e2afdd59276..e162f8aee164 100644
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
@@ -1896,6 +1901,23 @@ static int imx_csi_parse_endpoint(struct device *dev,
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
@@ -1904,6 +1926,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 
 	v4l2_async_notifier_init(&priv->notifier);
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	fwnode = dev_fwnode(priv->dev);
 
 	/* get this CSI's port id */
-- 
2.17.1


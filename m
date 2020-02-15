Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC831160033
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgBOTmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43057 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgBOTmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:43 -0500
Received: by mail-pl1-f195.google.com with SMTP id p11so5129517plq.10;
        Sat, 15 Feb 2020 11:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J4a12SBTuMD7atLLATUCugE0dEUcvKzeYrZ9OjbRkuY=;
        b=o75oGSh6E0XVjA4LESDf8tAB+lWr3cpyJkllsXdLva6u+vxUPhSlBWaLo/x/P+coQ0
         ziHUMQE9mSHFbUqXNpueAU7rYdwQZcsotuBJ1vGWh5WG0+OKUyH3HHZE2XTSyHuRVfor
         xH1n+a+FB59ZD/4z0PMtQcKXSESzOsanihg72Dk1h72kmQxvTH3GLSkigEdt12b9D68v
         TgChzQjAdc/kh8S+v80oM171rQprxqHMoo2vza9Wc44hPW9e3dX/7tSSdmIGl0QT5Q2x
         FNBoVb77Gp/0iXKR2q2f9O9HcqDOa6eK0Uetm+qJN8pFihgZuow4TQ4O1fmPAf7wdOH/
         6MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J4a12SBTuMD7atLLATUCugE0dEUcvKzeYrZ9OjbRkuY=;
        b=g4dZd7DdvwO8v2I9ldP67ASyjDaCGCYkoZ+ZfZgCvN54HvfLULW1fP6JCbVpmj+O0t
         2iPc09egTdT8ad4h9h/3wjfb5dLxSqAEEQMohMDXH8FzlJgi/0X/QJ4dNtPGntkr1vTU
         1u7s8Jw9GUIGAyW4U8Hv817KLryIYL5YxdmXWXuHLgAvAmZ/6rU2Ft/ogD4ucvp7aPEi
         iILQyQ048aOsN4SKFxlVIUGyCUC6ZvFWW7dXXH/oNnxvynvX6hh8I/kO8PqjAH0wG6VD
         HIX/4t3qkXKiJJKxIZar9H/ER/SObqJh1nEQeY6PH3dzKrlh7PiXLXDuugVW9sRPeZpS
         7XxQ==
X-Gm-Message-State: APjAAAV5rScB6hxv1sRPbN0B1jRxVzGbSVo6W4DoDhxEYGmcYp9IpcVg
        VjarCT9vodr3YMkysCd5GSRnd2hpSKs=
X-Google-Smtp-Source: APXvYqwBQtTLbOCGEG6HDKeQQZqiXvk/KUtfD8Y/2evFbOxbwzS7XJFE9cf5Z4O10CVmJ4jiy5D9aw==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id x3mr10971588pjv.45.1581795762862;
        Sat, 15 Feb 2020 11:42:42 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:42 -0800 (PST)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 13/17] media: imx: csi: Create media links in bound notifier
Date:   Sat, 15 Feb 2020 11:41:32 -0800
Message-Id: <20200215194136.10131-14-slongerbeam@gmail.com>
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
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
---
 drivers/staging/media/imx/imx-media-csi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index bea6a70cc353..2a8f01375f78 100644
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
@@ -1896,6 +1901,20 @@ static int imx_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -ENOTCONN;
 }
 
+static int imx_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_subdev *asd)
+{
+	struct csi_priv *priv = notifier_to_dev(notifier);
+	struct media_pad *sink = &priv->sd.entity.pads[CSI_SINK_PAD];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations csi_notify_ops = {
+	.bound = imx_csi_notify_bound,
+};
+
 static int imx_csi_async_register(struct csi_priv *priv)
 {
 	struct fwnode_handle *fwnode;
@@ -1904,6 +1923,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 
 	v4l2_async_notifier_init(&priv->notifier);
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	fwnode = dev_fwnode(priv->dev);
 
 	/* get this CSI's port id */
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0757152370
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgBDXt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:56 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45341 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgBDXtz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:55 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so157805pfg.12;
        Tue, 04 Feb 2020 15:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J4a12SBTuMD7atLLATUCugE0dEUcvKzeYrZ9OjbRkuY=;
        b=iLQH3OQ/O/+RY2/knhPODGNM2ct4fcN0lZHWtdgDvI2We0LfUzXOKX2vqsi1rMDnBB
         0AGtySTTUvyreBqOa9GXwj6JmkE/8/4IpJ6keZb7o9GBZ6wTE5ycCUgUDkY8xwmsCVXk
         6RDR6faOd47TPhAdkgtuqahcRO3Fpz60TZTshVxVocsPQLNnIpVKiVk6pfb4ZcS67lhl
         Ex/1P5MByc6QhtVDhEzobTJ02ls08pPmY+FbOZumQ2xki8iWuXe71Lwl7EA9MBtL+eQ8
         qkVviCdflEt6ISteRSFbSoYbMllJGASrJr6ZZrVN6Cjgiam9C+ueat/yYvuBHYzSkZRj
         t5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J4a12SBTuMD7atLLATUCugE0dEUcvKzeYrZ9OjbRkuY=;
        b=oL7/QMnMu6CkVVtFNZcqYtkLq5NeUsUQThJZ1gDyOne6nwLfYf1GzDGQT9tu/OBpCz
         ub0ukruI3vZIy8Ktz/A1npkLr5+U3vYkfdw96Wl2wPcXk0DhqcOejdjTeuRAvUcnDiVw
         gN/ovjPrAYLCgKKAg3Td6SaiLNkzb4OEThtBdFGIHLqf8uQ8AlcXHy+mWUqHr+11sHDP
         +X2tQBPVqswhtUY0bjQf56sLF6lPPC2RmUzz8JsPWYucCBHN39Zb7vTR5Fwhh/TMUadh
         7TsEkvXJcDs7rSSeQ23ld3UxgvrRMdoLTUAbf2GdvwSfEYb18OHW9yi2MxAxLi9x7VyZ
         CkFg==
X-Gm-Message-State: APjAAAX0OFYrwZcbG6zi5xvXHK3nlCdrhuUh4Zq30Ek3zjnH0EE240bl
        YGXzPhCvmLhzrxY9ELwwx9Ikie23
X-Google-Smtp-Source: APXvYqzaJhAf6Pam+Cmnn2otTi81LaNdN5atab+90zvh137fxqERYqBVQ5oubpzGkJCsB0HBp4QJsw==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr21060221pfk.206.1580860194433;
        Tue, 04 Feb 2020 15:49:54 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:54 -0800 (PST)
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
Subject: [PATCH v3 13/17] media: imx: csi: Create media links in bound notifier
Date:   Tue,  4 Feb 2020 15:49:14 -0800
Message-Id: <20200204234918.20425-14-slongerbeam@gmail.com>
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


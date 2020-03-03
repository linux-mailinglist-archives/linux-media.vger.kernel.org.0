Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228F61786A0
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgCCXna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:30 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33757 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgCCXna (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:30 -0500
Received: by mail-pf1-f195.google.com with SMTP id n7so2329450pfn.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=I/weKw8gqSMHerG7+ZtB0jaPIbMs+J6LkbgWE8zyS2o=;
        b=KolG0wp/nlZeZAto3wnTI8CtRNn86MNCy+CseiHgX+F39EPJue519oEz+MN/43A8+N
         RWVWIvrZlmA5Xtu6104ZweJnz2bQuXzTlsunDUTsFxCzrj8OWwZjy4yUomTiLCv1Nn8x
         Xk9RZyKjAJZ3pdckHpsTtpGSPZsxyc1djdS54B1jc9to0aDZn5ZgHQjQDvU+3Svajj2J
         d1dml8HLr/TBUbuC4kjpftXwiWXroR/qTlKvaqD8VLoTsQfJhLcBG3OTIA1+4CFMpSS+
         JCFOahxdRafVKdXzUUG1cTH1lm5pJ5R53rIT0BZSMKjFIK27TPGxyVqgP61O/rFVHKmc
         cLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=I/weKw8gqSMHerG7+ZtB0jaPIbMs+J6LkbgWE8zyS2o=;
        b=D1FKead7HQAgN4+BH8xNoNl301tydh2VfNBmi9F98ygMBOrxy9aSDN8HS6L3X7xK5T
         Y7F1RevG3okoqWOAn/G2q/roQAIh9sifUyglA4phY0+j0MEzG6mCJRVP3bQO5WsuyyZQ
         ParRlrRZ6KhOIW23eUFSCGnS452JuWLyhlZE012GagAvX98q2/9OEaGV5/37Oj7QqUKZ
         wkWepDohNhYZyi4wOniEeoJDzPbS4b8HoiOfr7VZAE68e1EZ/XX038ZxsE9Pl4byUiLh
         xZ6OshaK50J1bvgDGQmcfAy5tqB0sqJ+B6jTum+5FHadl5/nj6JPju8E0Uqpg+ikLlKD
         XQLA==
X-Gm-Message-State: ANhLgQ23J8iOFmslKbilX8/W0ADWYjKJ1yRKWIPK3iUEJHNyt2BCtPMz
        +3YtUv0kJVMhcA58gfdD3RE9CO2apOY=
X-Google-Smtp-Source: ADFU+vuqMzyPVjNJsQntTY/2xt5idxopQleSvlethhNFKbopw1FGQ6D7e91X7dIyVyM/mKwAQ0DdJg==
X-Received: by 2002:a63:d18:: with SMTP id c24mr6306470pgl.218.1583279009437;
        Tue, 03 Mar 2020 15:43:29 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:29 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 13/17] media: imx: csi: Create media links in bound notifier
Date:   Tue,  3 Mar 2020 15:42:52 -0800
Message-Id: <20200303234256.8928-14-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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
index 35f2512ed2a9..59ab1cf72841 100644
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
@@ -1889,6 +1894,20 @@ static const struct v4l2_subdev_internal_ops csi_internal_ops = {
 	.unregistered = csi_unregistered,
 };
 
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
 	struct v4l2_async_subdev *asd = NULL;
@@ -1926,6 +1945,8 @@ static int imx_csi_async_register(struct csi_priv *priv)
 		}
 	}
 
+	priv->notifier.ops = &csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&priv->sd,
 						  &priv->notifier);
 	if (ret)
-- 
2.17.1


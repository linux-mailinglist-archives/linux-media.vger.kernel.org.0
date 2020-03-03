Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06C2178699
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgCCXnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:19 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34215 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:18 -0500
Received: by mail-pg1-f196.google.com with SMTP id t3so70296pgn.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MRgADrHFv+sxso8bqXCcm68L6/PWS1nV1T4ZXE1mTTA=;
        b=fq03c8XKW3KkoA3u9y2Q5waI34oSosnG305qdoK/oK0hjCHa387ePGCV2BSpxYHv8Q
         f6OU5iRFlG0MJXCLR3QOgTaMxitwZi/jnFk/vZDJscTjn9hyRS3ELWdbOvNBYG3RwCBo
         cFXxwuGZdHBKTd87P/AMzzA4h/jCPyhZTx0f0CtYlFZJ0X7Rh0VYMDn8LAvWCfaG9zpX
         wQ6uWo3MWmjEbujGkgNd3KYmCoOqxgDP76W0sfmmnWe9rKbeD//dQ2YFz3BGFrIb5KBF
         jG3a+Wry/K8uUil3v3LRbEYfHeRpIgH3A/kfUD7qjQda54TNuL4rF0UrooPWcf4aV8zB
         wTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MRgADrHFv+sxso8bqXCcm68L6/PWS1nV1T4ZXE1mTTA=;
        b=lnJlC6i4NG0VjyrlOCWlmrPJa1/mLIFJtDiB1qIX03CAbXk4gffx74PUAbkXzYVbsJ
         CyrLI7ZuNpLPSJ2GBxzj8ZpsoWBKDXsURnszpMmzIv5WKNXiYwnr2NVVwTBweQVMxlrN
         osvJntAP0v8UKtvVVc+9Z9fwYYAnp55ue/MFCcM0tPfMFmzDb9cxCWTywK6aWrU+y6OL
         zhom7DXi5ASBzR37aZ+fhvzNeLaPZi6gjr/N2LLxzmPUN9hJIKsqxDjyeDMJ1qqZzAu8
         ydL0rRJAsdhji03yhjN22dWzLrraI1hyZaVHROGLr1mc3TwrjYBN2m+XREmPtCh63p6q
         NT3A==
X-Gm-Message-State: ANhLgQ33AfUkWKW42/NZyXDPC3Zr2XV1pwuM72HxTj11l0tw/MazS20H
        jLahtAULJe2I+wutgNJc3eBnOXnbWO0=
X-Google-Smtp-Source: ADFU+vt3+kKoaC+hxfXd5r4vHfXPo3OSVpRGdS7dDX0wef1TTSOu3Xx5CG39ZOjerp+mPQHMdxi4/g==
X-Received: by 2002:aa7:85c8:: with SMTP id z8mr210972pfn.66.1583278997545;
        Tue, 03 Mar 2020 15:43:17 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:17 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 06/17] media: imx: mipi csi-2: Implement get_fwnode_pad op
Date:   Tue,  3 Mar 2020 15:42:45 -0800
Message-Id: <20200303234256.8928-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index fdd763587e6c..8500207e5ea9 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
 				      640, 480, 0, V4L2_FIELD_NONE, NULL);
 }
 
+static int csi2_get_fwnode_pad(struct media_entity *entity,
+			       struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct fwnode_handle *csi2_ep;
+
+	/*
+	 * If the endpoint is one of ours, return the endpoint's port
+	 * number. This device maps port numbers and pad indexes 1:1.
+	 */
+	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
+		if (endpoint->local_fwnode == csi2_ep) {
+			struct fwnode_endpoint fwep;
+			int ret;
+
+			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
+
+			fwnode_handle_put(csi2_ep);
+
+			return ret ? ret : fwep.port;
+		}
+	}
+
+	return -ENXIO;
+}
+
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = csi2_get_fwnode_pad,
 };
 
 static const struct v4l2_subdev_video_ops csi2_video_ops = {
-- 
2.17.1


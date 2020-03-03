Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5DB178698
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgCCXnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:17 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43932 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgCCXnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:17 -0500
Received: by mail-pf1-f193.google.com with SMTP id c144so81061pfb.10
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8uhfqYqnydZFe8c9SbO7P/6+8io27mcAmYqcApQItKE=;
        b=YWcJKSqMuR5iSKKeX5rX0zHZbWyopfB+tKQZi9Qw2mm36NKZiaxS3xyzVxPZJGnSFa
         o80uWzcMGRXyOoShIiFNE3UiewfTsxzD7AV5TBPS+TsyvDrBoTXJHdkpz49cr5V0HWet
         X+vT58P0teBmi6TSGrVYVzD4XxkXD+822yKAIJJZc/kihX96KAFdKZb3tVG2vpG13yh+
         Vp57oCwkQ6MvnfFIP9c/weoHXrn207rGVJTTBInfl6VXPUA2ZnKLNMTTstaWFxHi06qJ
         Q2CV6nOEN+ajaGdHOmiyq8YfrdeccM1mtCkwiiskNpn8dg+nAmtEQfjwZ17S0lWY2nKJ
         Nosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8uhfqYqnydZFe8c9SbO7P/6+8io27mcAmYqcApQItKE=;
        b=QuzQZ1UBgZatM4pVMxkLQ+ckIEi5TjYN04ikfMNEpVD1qszSjNzckYyHyLkBDd//D5
         yd1o2piuRMcAHpxOBFE3oLn7ns1dNkD4UxBNusoFuQT+8Q6UuDFcNCvgraapnSCQbkrW
         JboziQJVwNK2h0gkqmpAyGsYK5kvnhhxyGdYKM+Wvr/DhLGD01dm0D52S3t/hY8oCTfv
         Yle8cnUpMz3tpDDKW9UT65Wz392A1bGNKFX8NXacu4nw5fIxIW0liaghhshaBavH4Eae
         E6cru6nQF/WaqyqrzUm9vN7YHnb2NRd2TXuM+V3EPB7oLeQ+uOV/xRCyD8L+2xckDie0
         Mtew==
X-Gm-Message-State: ANhLgQ2tccKoBUxuFv/dJ4gAjS/rXrbD0LY+y9wNGo01g9NxlMfJvVbl
        GFpPmQ8jC9dK6c0oySp2akAYM4YlBKs=
X-Google-Smtp-Source: ADFU+vvZYT+0vD48JPOzvXHS9JKakN2x81mCVEkguqA9F+dhZEglwW7piTABrFI0VFBAqPwUIfgTWA==
X-Received: by 2002:a62:ae13:: with SMTP id q19mr201439pff.244.1583278995510;
        Tue, 03 Mar 2020 15:43:15 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:15 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 05/17] media: imx: csi: Implement get_fwnode_pad op
Date:   Tue,  3 Mar 2020 15:42:44 -0800
Message-Id: <20200303234256.8928-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI does not have a 1:1 relationship between fwnode port numbers and
pad indexes. In fact the CSI fwnode device is itself a port which is the
sink, containing only a single fwnode endpoint. Implement media_entity
operation get_fwnode_pad to first verify the given endpoint is the CSI's
sink endpoint, and if so return the CSI sink pad index.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index f409fca88dcf..35f2512ed2a9 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1827,9 +1827,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
 		ipu_csi_put(priv->csi);
 }
 
+/*
+ * The CSI has only one fwnode endpoint, at the sink pad. Verify the
+ * endpoint belongs to us, and return CSI_SINK_PAD.
+ */
+static int csi_get_fwnode_pad(struct media_entity *entity,
+			      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi_priv *priv = v4l2_get_subdevdata(sd);
+	struct fwnode_handle *csi_port = dev_fwnode(priv->dev);
+	struct fwnode_handle *csi_ep;
+	int ret;
+
+	csi_ep = fwnode_get_next_child_node(csi_port, NULL);
+
+	ret = endpoint->local_fwnode == csi_ep ? CSI_SINK_PAD : -ENXIO;
+
+	fwnode_handle_put(csi_ep);
+
+	return ret;
+}
+
 static const struct media_entity_operations csi_entity_ops = {
 	.link_setup = csi_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = csi_get_fwnode_pad,
 };
 
 static const struct v4l2_subdev_core_ops csi_core_ops = {
-- 
2.17.1


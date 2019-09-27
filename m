Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABB92C0B53
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfI0Sep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:34:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47052 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbfI0Sep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:45 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYi5Q066326;
        Fri, 27 Sep 2019 13:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609284;
        bh=OKhdMxSgs6BN/L1NKmWbLiSeixvj42ucz1234m6E0RQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=C5ElLHig2gotPUek+F350S3wJVIrH4xBqlc9ceoGaqvCTsg1LEzeyn52kachhbeQm
         pmFqplGxDTQWYbVvhE+pRWIa1k+h+SrJ4RltshxGFPGuI8/sFrNrzb2yfMo1WOeO3I
         T7s3mITtgoMjRQa/FZOdfp/QaiYNuas+JURvahvk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYibd122641
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:35 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbp073031;
        Fri, 27 Sep 2019 13:34:43 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 02/16] media: ti-vpe: vpe: Add missing null pointer checks
Date:   Fri, 27 Sep 2019 13:36:36 -0500
Message-ID: <20190927183650.31345-3-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927183650.31345-1-bparrot@ti.com>
References: <20190927183650.31345-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few NULL pointer checks were missing.
Add check with appropriate return code.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 5ba72445584d..56f60dbea15c 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1537,6 +1537,8 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
+	if (!q_data)
+		return -EINVAL;
 
 	pix->width = q_data->width;
 	pix->height = q_data->height;
@@ -2001,6 +2003,8 @@ static int vpe_queue_setup(struct vb2_queue *vq,
 	struct vpe_q_data *q_data;
 
 	q_data = get_q_data(ctx, vq->type);
+	if (!q_data)
+		return -EINVAL;
 
 	*nplanes = q_data->nplanes;
 
@@ -2025,6 +2029,8 @@ static int vpe_buf_prepare(struct vb2_buffer *vb)
 	vpe_dbg(ctx->dev, "type: %d\n", vb->vb2_queue->type);
 
 	q_data = get_q_data(ctx, vb->vb2_queue->type);
+	if (!q_data)
+		return -EINVAL;
 	num_planes = q_data->nplanes;
 
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -2481,7 +2487,12 @@ static int vpe_probe(struct platform_device *pdev)
 	mutex_init(&dev->dev_mutex);
 
 	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-			"vpe_top");
+						"vpe_top");
+	if (!dev->res) {
+		dev_err(&pdev->dev, "missing 'vpe_top' resources data\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * HACK: we get resource info from device tree in the form of a list of
 	 * VPE sub blocks, the driver currently uses only the base of vpe_top
-- 
2.17.1


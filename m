Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E965ECE6BF
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfJGPHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:07:41 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56194 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728743AbfJGPHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7dqE067900;
        Mon, 7 Oct 2019 10:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460859;
        bh=OKhdMxSgs6BN/L1NKmWbLiSeixvj42ucz1234m6E0RQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xoKUrcEd6MkFjrQ3Xzjzk5mvOa/bQm8tMilArSbue84/q29cz8ScNliadHg2jWFxO
         IzFo1EXKgv0o7kdrkHmosXsLEeHgRUALEhae2aCaeHH9iWbXWfiMaNK0k+kyf591q8
         4doAjcjOCcn+yt+gtl5jkLMviP0+U9Lv/sfem/UE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7dwi060607;
        Mon, 7 Oct 2019 10:07:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:39 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aF9055156;
        Mon, 7 Oct 2019 10:07:39 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 03/21] media: ti-vpe: vpe: Add missing null pointer checks
Date:   Mon, 7 Oct 2019 10:09:51 -0500
Message-ID: <20191007151009.22095-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
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


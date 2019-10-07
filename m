Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1029CE679
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbfJGPHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:07:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35870 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbfJGPHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:07:47 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97F7kkq047029;
        Mon, 7 Oct 2019 10:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570460866;
        bh=aBu0PqWOIhGTbZg+fIEAWe5OpA13KW5g5d1hdo8Rvow=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tYcJXkJRNHupSxbIN5+nc5e9h9ECZ10eMp2Gfxz78FOUusquUuTPSQm0q+IaOmJrR
         Fj4TG6/DRkFBL6gV+lfKyWXMatbkmxXJ28atopY9y5XCzqog6ZzeR7WNgcM9n/yUeJ
         AqT8zJ3NFIP1LMKSkPBIW1b8M+ZjPJ8dTfdSG41k=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97F7kpX043064
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 10:07:46 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:07:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:07:46 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97F7aFH055156;
        Mon, 7 Oct 2019 10:07:46 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 11/21] media: ti-vpe: vpe: fix a v4l2-compliance failure about invalid sizeimage
Date:   Mon, 7 Oct 2019 10:09:59 -0500
Message-ID: <20191007151009.22095-12-bparrot@ti.com>
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

v4l2-compliance fails with this message:

   fail: v4l2-test-formats.cpp(463): !pfmt.sizeimage
   fail: v4l2-test-formats.cpp(736): \
	Video Capture Multiplanar is valid, \
	but TRY_FMT failed to return a format
   test VIDIOC_TRY_FMT: FAIL

This failure is causd by the driver failing to handle out range
'bytesperline' values from user space applications.

VPDMA hardware is limited to 64k line stride (16 bytes aligned, so 65520
bytes). So make sure the provided or calculated 'bytesperline' is
smaller than the maximum value.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma.h | 1 +
 drivers/media/platform/ti-vpe/vpe.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/vpdma.h b/drivers/media/platform/ti-vpe/vpdma.h
index bce17329c4c9..393fcbb3cb40 100644
--- a/drivers/media/platform/ti-vpe/vpdma.h
+++ b/drivers/media/platform/ti-vpe/vpdma.h
@@ -57,6 +57,7 @@ struct vpdma_data_format {
 						 * line stride of source and dest
 						 * buffers should be 16 byte aligned
 						 */
+#define VPDMA_MAX_STRIDE		65520	/* Max line stride 16 byte aligned */
 #define VPDMA_DTD_DESC_SIZE		32	/* 8 words */
 #define VPDMA_CFD_CTD_DESC_SIZE		16	/* 4 words */
 
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 7aa83026fb6c..0a7cf9c820c6 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -1694,6 +1694,10 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
 		if (stride > plane_fmt->bytesperline)
 			plane_fmt->bytesperline = stride;
 
+		plane_fmt->bytesperline = clamp_t(u32, plane_fmt->bytesperline,
+						  stride,
+						  VPDMA_MAX_STRIDE);
+
 		plane_fmt->bytesperline = ALIGN(plane_fmt->bytesperline,
 						VPDMA_STRIDE_ALIGN);
 
-- 
2.17.1


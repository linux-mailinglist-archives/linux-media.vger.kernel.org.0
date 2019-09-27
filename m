Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A453BC0B46
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 20:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfI0Sff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 14:35:35 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57778 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbfI0Sex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 14:34:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYqCK091577;
        Fri, 27 Sep 2019 13:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569609292;
        bh=aBu0PqWOIhGTbZg+fIEAWe5OpA13KW5g5d1hdo8Rvow=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Lih83Mfr/uZv0CJJJPYITFRfSbwbN/lUxEi7JpjbS98kGH3ub1DSarR65YuGnh13Z
         0nKgCvb+2hP+xv1MwQY2XC2hDwJqHr3+pZMv3+iDaqm4tu0CWj6Hr50qPc8PEwO9x6
         7dHR94r9gkvq0qV9yelMTY9Giy+J6VIqVUJkxRzk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8RIYqHN061224
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 27 Sep 2019 13:34:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 13:34:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 13:34:52 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8RIYgbx073031;
        Fri, 27 Sep 2019 13:34:51 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 10/16] media: ti-vpe: vpe: fix a v4l2-compliance failure about invalid sizeimage
Date:   Fri, 27 Sep 2019 13:36:44 -0500
Message-ID: <20190927183650.31345-11-bparrot@ti.com>
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


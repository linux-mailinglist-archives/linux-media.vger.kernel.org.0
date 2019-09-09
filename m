Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C307AD3D6
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732347AbfIIH2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:28:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54450 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbfIIH2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:28:23 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D893E28C273;
        Mon,  9 Sep 2019 08:28:21 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Francois Buergisser <fbuergisser@google.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 2/3] media: hantro: h264: Rename POC_CMP() into HANTRO_CMP()
Date:   Mon,  9 Sep 2019 09:28:14 +0200
Message-Id: <20190909072815.23981-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909072815.23981-1-boris.brezillon@collabora.com>
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

And use it for all native type comparisons, even if it's not strictly
required. By doing that we make the code more consistent and prevent
from potential incorrect results in case of overflow or when the the
values being compared are both negative.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro_h264.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index f070e7174007..881d73977ff6 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -22,7 +22,7 @@
 #define POC_BUFFER_SIZE			34
 #define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
 
-#define POC_CMP(p0, p1) ((p0) < (p1) ? -1 : 1)
+#define HANTRO_CMP(a, b) ((a) < (b) ? -1 : 1)
 
 /* Data structure describing auxiliary buffer format. */
 struct hantro_h264_dec_priv_tbl {
@@ -353,9 +353,9 @@ static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 	 * ascending order.
 	 */
 	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
-		return b->frame_num - a->frame_num;
+		return HANTRO_CMP(b->frame_num, a->frame_num);
 
-	return a->pic_num - b->pic_num;
+	return HANTRO_CMP(a->pic_num, b->pic_num);
 }
 
 static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
@@ -381,7 +381,7 @@ static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 
 	/* Long term pics in ascending pic num order. */
 	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-		return a->pic_num - b->pic_num;
+		return HANTRO_CMP(a->pic_num, b->pic_num);
 
 	poca = builder->pocs[idxa];
 	pocb = builder->pocs[idxb];
@@ -392,11 +392,11 @@ static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 	 * order.
 	 */
 	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
-		return POC_CMP(poca, pocb);
+		return HANTRO_CMP(poca, pocb);
 	else if (poca < builder->curpoc)
-		return POC_CMP(pocb, poca);
+		return HANTRO_CMP(pocb, poca);
 
-	return POC_CMP(poca, pocb);
+	return HANTRO_CMP(poca, pocb);
 }
 
 static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
@@ -422,7 +422,7 @@ static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 
 	/* Long term pics in ascending pic num order. */
 	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
-		return a->pic_num - b->pic_num;
+		return HANTRO_CMP(a->pic_num, b->pic_num);
 
 	poca = builder->pocs[idxa];
 	pocb = builder->pocs[idxb];
@@ -433,11 +433,11 @@ static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
 	 * order.
 	 */
 	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
-		return POC_CMP(pocb, poca);
+		return HANTRO_CMP(pocb, poca);
 	else if (poca < builder->curpoc)
-		return POC_CMP(pocb, poca);
+		return HANTRO_CMP(pocb, poca);
 
-	return POC_CMP(poca, pocb);
+	return HANTRO_CMP(poca, pocb);
 }
 
 static void
-- 
2.21.0


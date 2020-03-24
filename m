Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2DF419159A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 17:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgCXQDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 12:03:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51522 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbgCXQDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 12:03:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 8E96828C5A3
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de
Subject: [PATCH v2] media: coda: jpeg: support optimized huffman tables
Date:   Tue, 24 Mar 2020 18:04:29 +0200
Message-Id: <20200324160429.2626-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each jpeg can have the huffman tables optimized for its specific content
meaning that the table lenghts and values don't match the standard table
of substitutions so there's no reason to hardcode and expect the standard
lengths, otherwise we just end up rejecting optimized jpegs altogether.

Tested on CODA960.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
Changes since v1:
  - Added test for DC tables upper boundary (Philipp)
---
 drivers/media/platform/coda/coda-jpeg.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 6a11b64efb6b..60d6e1073334 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -343,7 +343,10 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
 			return -EINVAL;
 		}
-		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
+		/* AC tables should be between 17 -> 178, DC between 17 -> 28 */
+		if (huffman_tables[i].length < 17 ||
+		    huffman_tables[i].length > 178 ||
+		    ((i & 2) == 0 && huffman_tables[i].length > 28)) {
 			v4l2_err(&dev->v4l2_dev,
 				 "invalid Huffman table %d length: %zu\n",
 				 i, huffman_tables[i].length);
@@ -357,10 +360,12 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			return -ENOMEM;
 		ctx->params.jpeg_huff_tab = huff_tab;
 	}
-	memcpy(huff_tab->luma_dc, huffman_tables[0].start, 16 + 12);
-	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, 16 + 12);
-	memcpy(huff_tab->luma_ac, huffman_tables[2].start, 16 + 162);
-	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, 16 + 162);
+
+	memset(huff_tab, 0, sizeof(*huff_tab));
+	memcpy(huff_tab->luma_dc, huffman_tables[0].start, huffman_tables[0].length);
+	memcpy(huff_tab->chroma_dc, huffman_tables[1].start, huffman_tables[1].length);
+	memcpy(huff_tab->luma_ac, huffman_tables[2].start, huffman_tables[2].length);
+	memcpy(huff_tab->chroma_ac, huffman_tables[3].start, huffman_tables[3].length);
 
 	/* check scan header */
 	for (i = 0; i < scan_header.num_components; i++) {
-- 
2.26.0


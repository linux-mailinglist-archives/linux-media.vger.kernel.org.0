Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58FE318F544
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgCWNIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 09:08:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35778 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbgCWNIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:08:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id F2FF029057E
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de, Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 1/2] media: coda: jpeg: support optimized huffman tables
Date:   Mon, 23 Mar 2020 15:09:36 +0200
Message-Id: <20200323130937.3666244-2-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
References: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each jpeg can have the huffman tables optimized for its specific content
meaning that the table lenghts and values don't match the standard table
of substitutions so there's no reason to hardcode and expect the sandard
lenghts, otherwise we just end up rejecting optimized jpegs altogether.

Tested on CODA960.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/media/platform/coda/coda-jpeg.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
index 6a11b64efb6b..162ba28a6b95 100644
--- a/drivers/media/platform/coda/coda-jpeg.c
+++ b/drivers/media/platform/coda/coda-jpeg.c
@@ -343,7 +343,8 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
 			v4l2_err(&dev->v4l2_dev, "missing Huffman table\n");
 			return -EINVAL;
 		}
-		if (huffman_tables[i].length != ((i & 2) ? 178 : 28)) {
+		if (huffman_tables[i].length < 17 ||
+		    huffman_tables[i].length > 178) {
 			v4l2_err(&dev->v4l2_dev,
 				 "invalid Huffman table %d length: %zu\n",
 				 i, huffman_tables[i].length);
@@ -357,10 +358,12 @@ int coda_jpeg_decode_header(struct coda_ctx *ctx, struct vb2_buffer *vb)
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
2.25.2


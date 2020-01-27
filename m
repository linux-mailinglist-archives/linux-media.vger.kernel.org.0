Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248C514A617
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 15:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgA0OaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 09:30:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60512 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbgA0OaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 09:30:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E9B2B293983
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 2/4] media: hantro: Use standard luma quantization table
Date:   Mon, 27 Jan 2020 15:30:07 +0100
Message-Id: <20200127143009.15677-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127143009.15677-1-andrzej.p@collabora.com>
References: <20200127143009.15677-1-andrzej.p@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The table is actually different in the document than in this file, so align
this file with the document.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/hantro_jpeg.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
index 125eb41f2ede..d3b381d00b23 100644
--- a/drivers/staging/media/hantro/hantro_jpeg.c
+++ b/drivers/staging/media/hantro/hantro_jpeg.c
@@ -23,17 +23,17 @@
 #define HUFF_CHROMA_AC_OFF	409
 
 /* Default tables from JPEG ITU-T.81
- * (ISO/IEC 10918-1) Annex K.3, I
+ * (ISO/IEC 10918-1) Annex K, tables K.1 and K.2
  */
 static const unsigned char luma_q_table[] = {
-	0x10, 0x0b, 0x0a, 0x10, 0x7c, 0x8c, 0x97, 0xa1,
-	0x0c, 0x0c, 0x0e, 0x13, 0x7e, 0x9e, 0xa0, 0x9b,
-	0x0e, 0x0d, 0x10, 0x18, 0x8c, 0x9d, 0xa9, 0x9c,
-	0x0e, 0x11, 0x16, 0x1d, 0x97, 0xbb, 0xb4, 0xa2,
-	0x12, 0x16, 0x25, 0x38, 0xa8, 0x6d, 0x67, 0xb1,
-	0x18, 0x23, 0x37, 0x40, 0xb5, 0x68, 0x71, 0xc0,
+	0x10, 0x0b, 0x0a, 0x10, 0x18, 0x28, 0x33, 0x3d,
+	0x0c, 0x0c, 0x0e, 0x13, 0x1a, 0x3a, 0x3c, 0x37,
+	0x0e, 0x0d, 0x10, 0x18, 0x28, 0x39, 0x45, 0x38,
+	0x0e, 0x11, 0x16, 0x1d, 0x33, 0x57, 0x50, 0x3e,
+	0x12, 0x16, 0x25, 0x38, 0x44, 0x6d, 0x67, 0x4d,
+	0x18, 0x23, 0x37, 0x40, 0x51, 0x68, 0x71, 0x5c,
 	0x31, 0x40, 0x4e, 0x57, 0x67, 0x79, 0x78, 0x65,
-	0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0xc7,
+	0x48, 0x5c, 0x5f, 0x62, 0x70, 0x64, 0x67, 0x63
 };
 
 static const unsigned char chroma_q_table[] = {
-- 
2.17.1


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773BF2722E9
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgIULoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:44:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:60118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 580C42193E;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=PcsfrJstsNrwJx3ZDrhAbdKhkGTJB9vTs/TlIRZUZNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o1mVP6JFq0R/a1rw7lD6rFwUrDpNPE+NbJF+ugWuKDiyCwePhT64OLTFCzoqm2Nw0
         PfUOozOyUIuqGcGMnLXgW9aCTQYeLhbLrPxYAmOka1IQmaV3+MD+zFVLPFJjI12MXa
         AEydz9IdBN/4gxgvR0uPf6CMMlTqipjghufINpl8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004VL-6h; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 7/9] media: vidtv: simplify parameters for vidtv_pes_write_stuffing()
Date:   Mon, 21 Sep 2020 13:43:44 +0200
Message-Id: <f10d1c3c3754658c42ef2b0690475604a8b131e4.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of passing struct pes_ts_header_write_args fields as
function parameters, just pass a pointer to the struct.

That would allow adding more args without needing to change
the function prototype.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_pes.c | 42 +++++++++-----------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 34518ef042f7..de0ce5529d06 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -176,37 +176,34 @@ static u32 vidtv_pes_write_h(struct pes_header_write_args args)
 	return nbytes;
 }
 
-static u32 vidtv_pes_write_stuffing(void *dest_buf,
-				    u32 dest_offset,
-				    u32 n_stuffing_bytes,
-				    u32 buf_sz)
+static u32 vidtv_pes_write_stuffing(struct pes_ts_header_write_args *args,
+				    u32 dest_offset)
 {
 	u32 nbytes = 0;
 	struct vidtv_mpeg_ts_adaption ts_adap = {};
-	u32 stuff_nbytes = 0;
+	u32 stuff_nbytes;
 
-	if (!n_stuffing_bytes)
+	if (!args->n_stuffing_bytes)
 		goto out;
 
-	if (n_stuffing_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
+	if (args->n_stuffing_bytes > PES_TS_HEADER_MAX_STUFFING_BYTES) {
 		pr_warn_ratelimited("More than %d stuffing bytes for a PES packet!\n",
 				    PES_TS_HEADER_MAX_STUFFING_BYTES);
 
-		n_stuffing_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
+		args->n_stuffing_bytes = PES_TS_HEADER_MAX_STUFFING_BYTES;
 	}
 
 	/* the AF will only be its 'length' field with a value of zero */
-	if (n_stuffing_bytes == 1) {
-		nbytes += vidtv_memset(dest_buf,
+	if (args->n_stuffing_bytes == 1) {
+		nbytes += vidtv_memset(args->dest_buf,
 				       dest_offset + nbytes,
-				       buf_sz,
+				       args->dest_buf_sz,
 				       0,
-				       n_stuffing_bytes);
-
+				       args->n_stuffing_bytes);
 		goto out;
 	}
 
-	stuff_nbytes = n_stuffing_bytes - sizeof(ts_adap);
+	stuff_nbytes = args->n_stuffing_bytes - sizeof(ts_adap);
 
 	/* length _immediately_ following 'adaptation_field_length' */
 	ts_adap.length = sizeof(ts_adap) -
@@ -214,24 +211,24 @@ static u32 vidtv_pes_write_stuffing(void *dest_buf,
 			 stuff_nbytes;
 
 	/* write the adap after the TS header */
-	nbytes += vidtv_memcpy(dest_buf,
+	nbytes += vidtv_memcpy(args->dest_buf,
 			       dest_offset + nbytes,
-			       buf_sz,
+			       args->dest_buf_sz,
 			       &ts_adap,
 			       sizeof(ts_adap));
 
 	/* write the stuffing bytes */
-	nbytes += vidtv_memset(dest_buf,
+	nbytes += vidtv_memset(args->dest_buf,
 			       dest_offset + nbytes,
-			       buf_sz,
+			       args->dest_buf_sz,
 			       TS_FILL_BYTE,
 			       stuff_nbytes);
 
 out:
-	if (nbytes != n_stuffing_bytes)
+	if (nbytes != args->n_stuffing_bytes)
 		pr_warn_ratelimited("write size was %d, expected %d\n",
 				    nbytes,
-				    n_stuffing_bytes);
+				    args->n_stuffing_bytes);
 
 	return nbytes;
 }
@@ -261,10 +258,7 @@ static u32 vidtv_pes_write_ts_h(struct pes_ts_header_write_args args)
 			       sizeof(ts_header));
 
 	/* write stuffing, if any */
-	nbytes += vidtv_pes_write_stuffing(args.dest_buf,
-					   args.dest_offset + nbytes,
-					   args.n_stuffing_bytes,
-					   args.dest_buf_sz);
+	nbytes += vidtv_pes_write_stuffing(&args, args.dest_offset + nbytes);
 
 	return nbytes;
 }
-- 
2.26.2


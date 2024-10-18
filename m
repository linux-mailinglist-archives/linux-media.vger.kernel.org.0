Return-Path: <linux-media+bounces-19827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9549A34B1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0C801F2435B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8F518873A;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcKa8wDU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253ED17C9B9;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=RSYA+DhpDJIiu0mvz05QxVDAbfj6BIGCjFZ0MMXg/CBCNX8ymqWsHvR9zMk+PPmk41EX08FrJlN/Yxg04O2ZfyldAgkYO+7/DQxzsmSRQyaf1yBsuv/oPBG373U0WP88DHKMlIlzsS4jHbntd5l2Fhr/4nDjk0RIosO89g/lkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=wVXSfTdlzHbzFNnkVyQi+BQqJKzdBu2IARFn0RCaO+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvomTix8m0hxaXCbSBs1AUZoKpIxZgvnyP8gBo6FexFXsIulpDwgYZgiyygq3T6IOhOocw1MKpMnklodZeK7zkSstXXMba0X9Rb/y+xqa0j4/IIB1s2AWSMVw/pXQRMGqDEblVlCqeePkg8Jpl4KW/jfW0e59FJckdE1GYLf+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcKa8wDU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F92C4CED1;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=wVXSfTdlzHbzFNnkVyQi+BQqJKzdBu2IARFn0RCaO+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rcKa8wDUnwuY0FJLrBxIUAGN44E/2NnZ8QzxgE9pfKxNX4Xuof00SUbx2CQeqlDan
	 /wzOt+/tae2mSufNC8k0DATXp1O8oS2PDiNErWX2dNKhnlVaydX9cb5+RLZMx0mncS
	 67Jc+9ErK3C7ycsuH0VMell/QtaFRBVXIsqnUI+0J+O41mBqxK24rE6xzrmAMd8Cm6
	 zQt2CbfnZ8pSYP9slekMPX7+gPo+8RJAoqXcSGhAe6bysAvY9O1rCOPBxEud/Y/lm1
	 3rYHGjceh2E+v3ESEC7YJdTGlI6vx4AGaIeelBXpJNv0ebOzjTrMrdOs4tWVpSQAN1
	 N1O2YYH/EwDsg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005MeL-1uTx;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 07/13] media: s5p-jpeg: prevent buffer overflows
Date: Fri, 18 Oct 2024 07:53:09 +0200
Message-ID: <172461a2e8b2a1a4f01add73afae777463ea0fb8.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The current logic allows word to be less than 2. If this happens,
there will be buffer overflows, as reported by smatch. Add extra
checks to prevent it.

While here, remove an unused word = 0 assignment.

Fixes: 6c96dbbc2aa9 ("[media] s5p-jpeg: add support for 5433")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index d2c4a0178b3c..1db4609b3557 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -775,11 +775,14 @@ static void exynos4_jpeg_parse_decode_h_tbl(struct s5p_jpeg_ctx *ctx)
 		(unsigned long)vb2_plane_vaddr(&vb->vb2_buf, 0) + ctx->out_q.sos + 2;
 	jpeg_buffer.curr = 0;
 
-	word = 0;
-
 	if (get_word_be(&jpeg_buffer, &word))
 		return;
-	jpeg_buffer.size = (long)word - 2;
+
+	if (word < 2)
+		jpeg_buffer.size = 0;
+	else
+		jpeg_buffer.size = (long)word - 2;
+
 	jpeg_buffer.data += 2;
 	jpeg_buffer.curr = 0;
 
@@ -1058,6 +1061,7 @@ static int get_word_be(struct s5p_jpeg_buffer *buf, unsigned int *word)
 	if (byte == -1)
 		return -1;
 	*word = (unsigned int)byte | temp;
+
 	return 0;
 }
 
@@ -1145,7 +1149,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
-			if (!length)
+			if (length <= 0)
 				return false;
 			sof = jpeg_buffer.curr; /* after 0xffc0 */
 			sof_len = length;
@@ -1176,7 +1180,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
-			if (!length)
+			if (length <= 0)
 				return false;
 			if (n_dqt >= S5P_JPEG_MAX_MARKER)
 				return false;
@@ -1189,7 +1193,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
-			if (!length)
+			if (length <= 0)
 				return false;
 			if (n_dht >= S5P_JPEG_MAX_MARKER)
 				return false;
@@ -1214,6 +1218,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 			if (get_word_be(&jpeg_buffer, &word))
 				break;
 			length = (long)word - 2;
+			/* No need to check underflows as skip() does it  */
 			skip(&jpeg_buffer, length);
 			break;
 		}
-- 
2.47.0



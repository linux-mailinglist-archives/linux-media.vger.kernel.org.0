Return-Path: <linux-media+bounces-19737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2569A0720
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927821C223A7
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065F22076D3;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRiOwBdO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D199206E95;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=lRcEdOxCr7rPjgc7hm0UrG2QI1HDbHZ52ETGD3WiSmaKTIw51vWatcwvhD3GoMxyDQ9v0gm//F6gSavT1KjtPGHJiMVmCyobxSl3feIBb7wUzHDVXKMyhvQ+Rl72AOh84hD3yoa35mXWVuQA+S6BgVV4lWgFuh3T9YRmiZQoBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=OwZ5oRre6Qvryx1HKm59rgRRdHOV74pHCRQsrCjAiZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOgD0uu98kPSVgO85WS/HLy1o9rgpsOq19brQM9zdd/Xa1sy2c9h1Q2+Vsbbb2RBxiGYTGIlfBOuAOYG+/0N74IMGsW4voHuAYPzLuRUmofkDd1mfaLC02JxmdV2O2XoqaVXHj6/Th2ohHuoibmpim+B1Q0C4FNt80qGFYHtBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRiOwBdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FBAC4CED1;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=OwZ5oRre6Qvryx1HKm59rgRRdHOV74pHCRQsrCjAiZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRiOwBdOQnR56E9IFo6vSYnI0BAQADVHdAG+nZ55R50yOOJiOYxtPEO61tQWOONLr
	 fC8QtBvHVTVp+1occ1ZxIjDqoTgF+/J0wB/d37FaWstaGML4TLH52bXR9RQioKWcam
	 h8KiQuoy5fMKc1P/1xc6nz2ZYS3DCGufIrlh73lCR7X1WQSuWJQYQAOINtdT06uYV+
	 o6rzFAzbfbtFamw+NROgiSYqim+BvQtJEjXcM1Kcp51MlQzvs/cr4Cl69ee4kIC89J
	 I8x9zvuDY41PchLrTph0FSAgOFmcPC0aoKU0QFat6bnByYy3NL2tYT/qeKuLw1TXTl
	 zWxJZVm+VL38w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Ymp-2SnT;
	Wed, 16 Oct 2024 12:22:35 +0200
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
Subject: [PATCH 07/13] media: s5p-jpeg: prevent buffer overflows
Date: Wed, 16 Oct 2024 12:22:23 +0200
Message-ID: <16ccf3d588665a5a0dda91cbb04374d6aea99ca6.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The current logic allows word to be less than 2. If this happens,
there will be buffer overflows. Add extra checks to prevent it.

While here, remove an unused word = 0 assignment.

Fixes: 6c96dbbc2aa9 ("[media] s5p-jpeg: add support for 5433")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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



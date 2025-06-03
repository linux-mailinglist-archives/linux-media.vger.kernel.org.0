Return-Path: <linux-media+bounces-34032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC02ACD00D
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 00:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5750A1764B3
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 22:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C837253934;
	Tue,  3 Jun 2025 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="q/sDGbU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E822688C;
	Tue,  3 Jun 2025 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991087; cv=none; b=WEtoqdxTG4Lx6f9lt8ioKx173ZvwYjNdYgupaDKjzFNsoFGPoDzcx5xzrS+JJogVzgvrWAXJghFdzfzhsY62ozuUUOZ29A0/Bk87uqNCtGvzkQc9RUevADsQRY0p+eRZ1vVxHuUTg2FjkA9fcltO/PG37w7eZUrtd+iwF059hSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991087; c=relaxed/simple;
	bh=U2fAHShTsPt3xM9RI+E0kyll2X7at0kvzSSVpwpOxt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yv3UZOGPgYV6wxfCRRUqqo0P1eyrLmcgCSYyDd8r3WVAe9UOXk0bTultvbF0VBVJTMvNBAPSUeLvowG0GiLDeAti/+2AzSs1MoTyAWFQmzMhYkX0MQHbT6BlK2Xsydupi3LpYbTyT/u7qY8duHS1xeob0j0keUwuTxcN7N8n+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=q/sDGbU0; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=FQ3DHoKvMraMJ0d27hoH4C3fLV1yEdec7+t3t0+1/Ak=; b=q/sDGbU07pJFA1RX
	krmkJGueYxlIFGXPG0vz24InA5FimusUCXjcHZ0jsW2sQkHHuuQlYHx2/e20cxiTiOHTjK3iqp4yJ
	0PxxIrhN0J9LoI0k+NJ2mrpvynxW8kYg10940zdQNFp5UKlO6pWvLrZxGW/sk6glfDHDxEeC516/R
	Wr6/XzPdtGFABONvoTth8cxoC5svjashhiT7wJiqApNVDP2gYQrJNUmO+YHI0b2VgJMb7DBcZcp2u
	0TQxjTEg8KmvtBWE3Ws1zUpVN4OlNBRMwU7QjlhOhTUeYzq6q0EFY3mNTynoM2mVKd2gMPE0EdcpP
	4vpo6OPtAMHfbGZH5w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uMaTa-007UXY-1I;
	Tue, 03 Jun 2025 22:51:22 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: v4l2-tpg: Remove unused tpg_fillbuffer
Date: Tue,  3 Jun 2025 23:51:21 +0100
Message-ID: <20250603225121.308402-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of tpg_fillbuffer() was removed in 2015 by
commit ddcaee9dd4c0 ("[media] vivid: add support for single buffer planar
formats")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 17 -----------------
 include/media/tpg/v4l2-tpg.h                  |  2 --
 2 files changed, 19 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 931e5dc453b9..d51d8ba99dcb 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -2710,23 +2710,6 @@ void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
 }
 EXPORT_SYMBOL_GPL(tpg_fill_plane_buffer);
 
-void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std, unsigned p, u8 *vbuf)
-{
-	unsigned offset = 0;
-	unsigned i;
-
-	if (tpg->buffers > 1) {
-		tpg_fill_plane_buffer(tpg, std, p, vbuf);
-		return;
-	}
-
-	for (i = 0; i < tpg_g_planes(tpg); i++) {
-		tpg_fill_plane_buffer(tpg, std, i, vbuf + offset);
-		offset += tpg_calc_plane_size(tpg, i);
-	}
-}
-EXPORT_SYMBOL_GPL(tpg_fillbuffer);
-
 MODULE_DESCRIPTION("V4L2 Test Pattern Generator");
 MODULE_AUTHOR("Hans Verkuil");
 MODULE_LICENSE("GPL");
diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index a55088921d1d..3e3bd0889b6d 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -248,8 +248,6 @@ void tpg_calc_text_basep(struct tpg_data *tpg,
 unsigned tpg_g_interleaved_plane(const struct tpg_data *tpg, unsigned buf_line);
 void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,
 			   unsigned p, u8 *vbuf);
-void tpg_fillbuffer(struct tpg_data *tpg, v4l2_std_id std,
-		    unsigned p, u8 *vbuf);
 bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc);
 void tpg_s_crop_compose(struct tpg_data *tpg, const struct v4l2_rect *crop,
 		const struct v4l2_rect *compose);
-- 
2.49.0



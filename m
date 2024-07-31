Return-Path: <linux-media+bounces-15657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4620E943480
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777E41C21F6A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B5B1BE86A;
	Wed, 31 Jul 2024 16:53:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A001BE242;
	Wed, 31 Jul 2024 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444794; cv=none; b=BKKqsdiPGiKJRY7/Vai/MjmA5Es2wkef0h1hH+pnUitVhV5IMMIcSbqyuR5ms33JbITOpolZuhBDUM7DFsn8FVb5xRaG5bsBO2LbDmxau080who3lgl5UQjr0nVwwhhaJRsJ6FSOQ02gKUn+66Kx3sWe90pzjW/r5whUMjfkFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444794; c=relaxed/simple;
	bh=mrZ3g7n1/oLXeu784YnUGJEyIyvmeTD3R96dJjFzqmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKDaI0K8lVjmDP1ObbP6ojtNuv/EnCTa2auLMgzeCB8tZ1R9vXWGwPPSYWdqLWyly+7nwFQa3fGaqYg8C6GIyGnsLN+54opfKT3w40ItX/cuMYsy6yPEFaolHZTa02PdT3u42jnkIBBgQbIRlTFmHmjjel3PP87cT65zDV+ZuHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9673914649D8; Wed, 31 Jul 2024 18:44:27 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] media: cedrus: Setup secondary output formats
Date: Wed, 31 Jul 2024 18:44:11 +0200
Message-ID: <20240731164422.206503-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

It's needed for JPEG codec, since engine outputs to it for some reason.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   | 12 +++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  9 +++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 32af0e96e762..582b6cb796ea 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -88,15 +88,21 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV12:
 		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
 
-		reg = VE_PRIMARY_OUT_FMT_NV12;
+		reg = VE_PRIMARY_OUT_FMT_NV12 | VE_SECONDARY_OUT_FMT_EXT_NV12;
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
 
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_CHROMA_BUF_LEN_SDRT(chroma_size / 2) |
+		      VE_CHROMA_WIDTH_ALIGN_8 |
+		      VE_SECONDARY_OUT_FMT_EXT;
+		cedrus_write(dev, VE_CHROMA_BUF_LEN, reg);
+
+		reg = VE_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
+		      VE_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
+		cedrus_write(dev, VE_SECONDARY_FB_LINE_STRIDE, reg);
 
 		break;
 	case V4L2_PIX_FMT_NV12_32L32:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc548ab..3acc05e0fb54 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -59,9 +59,10 @@
 #define VE_INTRAPRED_DRAM_BUF_ADDR		0x58
 #define VE_PRIMARY_CHROMA_BUF_LEN		0xc4
 #define VE_PRIMARY_FB_LINE_STRIDE		0xc8
+#define VE_SECONDARY_FB_LINE_STRIDE		0xcc
 
-#define VE_PRIMARY_FB_LINE_STRIDE_CHROMA(s)	SHIFT_AND_MASK_BITS(s, 31, 16)
-#define VE_PRIMARY_FB_LINE_STRIDE_LUMA(s)	SHIFT_AND_MASK_BITS(s, 15, 0)
+#define VE_FB_LINE_STRIDE_CHROMA(s)		SHIFT_AND_MASK_BITS(s, 31, 16)
+#define VE_FB_LINE_STRIDE_LUMA(s)		SHIFT_AND_MASK_BITS(s, 15, 0)
 
 #define VE_CHROMA_BUF_LEN			0xe8
 
@@ -69,6 +70,10 @@
 #define VE_SECONDARY_OUT_FMT_EXT		(0x01 << 30)
 #define VE_SECONDARY_OUT_FMT_YU12		(0x02 << 30)
 #define VE_SECONDARY_OUT_FMT_YV12		(0x03 << 30)
+#define VE_CHROMA_WIDTH_ALIGN_16		(0x00 << 29)
+#define VE_CHROMA_WIDTH_ALIGN_8			(0x01 << 29)
+#define VE_LUMA_WIDTH_ALIGN_16			(0x00 << 28)
+#define VE_LUMA_WIDTH_ALIGN_32			(0x01 << 28)
 #define VE_CHROMA_BUF_LEN_SDRT(l)		SHIFT_AND_MASK_BITS(l, 27, 0)
 
 #define VE_PRIMARY_OUT_FMT			0xec
-- 
2.45.2



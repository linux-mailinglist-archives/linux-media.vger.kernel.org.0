Return-Path: <linux-media+bounces-20733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5F9BA7A4
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 20:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045002817AF
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 19:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C23A189B95;
	Sun,  3 Nov 2024 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="B1smspZu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2333FE;
	Sun,  3 Nov 2024 19:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730661813; cv=none; b=W0wroOznmnED9t+7C5LbPx+WzbORBeqVcb6Idu5dobulzuaZulHPYQr1HZkHCiSsjsuo0/Qrxf2TYCfsTRE+gDoVzdIicc74SEr0XqJ+6tbPCfmtY+Fcoug1NQA/zo7XWohu7pTVIg92Glz9MFn8PJYWqtDBmG2MDqgYbe9hpy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730661813; c=relaxed/simple;
	bh=OMuyRg4bzStPqNNN3yp859gI6JRk5cF+8sCpKoD37SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=joprAa1cY5+91VsDw+nyYCcqkoieeMx8AMKcA3xwP1eAQ//d32sGGEVOZHKL6i2MD5vEi1V3zvD0KxrAGs77nN6vmyQfkSOQy+HyTDiX/K0wSW5TGf4TnZYJb49kdURphI4xQrLWaNSE8lbm4vFwmi8zFumX01lfZgzncnZQeQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=B1smspZu; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=K2N0tDeGrz7QCmhPIrTtZDVUgTHAHsRgEUCvSiXLL6E=; b=B1smspZuOYOQR+09
	Dol6frTZVigXzMffVPXGLhvEFqEkZ5g+NPVIVPyYqwcwLpoN5S62+kVO6RC8aN5l5INXps7CW68Ls
	LTuz2wB4f1uDleO/QH7Wne/7u2z7bMdo6LxK8TXLHOYHj0MreDMlwHBIqnTKVaxtmAUBSOU6R9vMr
	DdcoXUFCN4BwV/HwtL8PElHMwya00e9tOY76xEzJGXVVJym015wYWg+FaqfBtzAIpyqaMU3ShVNf7
	kxtsX9xmggmkWgvn048GwBRBdeMEcH0Jj6kL9Refyybnftp0V3T2/OeGqjCAx7lfKiXqvEVwtGZYv
	636O0oUm8RxrOlz3Mg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1t7gBy-00FC9O-0T;
	Sun, 03 Nov 2024 19:23:18 +0000
From: linux@treblig.org
To: andrzejtp2010@gmail.com,
	jacek.anaszewski@gmail.com,
	s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: samsung: s5p-jpeg: Remove deadcode
Date: Sun,  3 Nov 2024 19:23:15 +0000
Message-ID: <20241103192315.288743-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

exynos3250_jpeg_operating() has been unused since it was added in 2014's
commit 3246fdaa0ac2 ("[media] s5p-jpeg: Add support for Exynos3250 SoC")

exynos4_jpeg_get_fifo_status(), exynos4_jpeg_get_frame_size(), and
exynos4_jpeg_set_timer_count() have been unused since they were added by
commit 80529ae5c137 ("[media] s5p-jpeg:  JPEG codec")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../samsung/s5p-jpeg/jpeg-hw-exynos3250.c     |  5 -----
 .../samsung/s5p-jpeg/jpeg-hw-exynos3250.h     |  1 -
 .../samsung/s5p-jpeg/jpeg-hw-exynos4.c        | 19 -------------------
 .../samsung/s5p-jpeg/jpeg-hw-exynos4.h        |  4 ----
 4 files changed, 29 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
index 637a5104d948..6657d294c10a 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c
@@ -427,11 +427,6 @@ void exynos3250_jpeg_clear_int_status(void __iomem *regs,
 	writel(value, regs + EXYNOS3250_JPGINTST);
 }
 
-unsigned int exynos3250_jpeg_operating(void __iomem *regs)
-{
-	return readl(regs + S5P_JPGOPR) & EXYNOS3250_JPGOPR_MASK;
-}
-
 unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs)
 {
 	return readl(regs + EXYNOS3250_JPGCNT) & EXYNOS3250_JPGCNT_MASK;
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
index 15af928fad76..709c61ae322c 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h
@@ -45,7 +45,6 @@ void exynos3250_jpeg_rstart(void __iomem *regs);
 unsigned int exynos3250_jpeg_get_int_status(void __iomem *regs);
 void exynos3250_jpeg_clear_int_status(void __iomem *regs,
 						unsigned int value);
-unsigned int exynos3250_jpeg_operating(void __iomem *regs);
 unsigned int exynos3250_jpeg_compressed_size(void __iomem *regs);
 void exynos3250_jpeg_dec_stream_size(void __iomem *regs, unsigned int size);
 void exynos3250_jpeg_dec_scaling_ratio(void __iomem *regs, unsigned int sratio);
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
index 0828cfa783fe..479288fc8c77 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c
@@ -185,11 +185,6 @@ unsigned int exynos4_jpeg_get_int_status(void __iomem *base)
 	return readl(base + EXYNOS4_INT_STATUS_REG);
 }
 
-unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base)
-{
-	return readl(base + EXYNOS4_FIFO_STATUS_REG);
-}
-
 void exynos4_jpeg_set_huf_table_enable(void __iomem *base, int value)
 {
 	unsigned int	reg;
@@ -300,22 +295,8 @@ void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size)
 	writel(size, base + EXYNOS4_BITSTREAM_SIZE_REG);
 }
 
-void exynos4_jpeg_get_frame_size(void __iomem *base,
-			unsigned int *width, unsigned int *height)
-{
-	*width = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) &
-				EXYNOS4_DECODED_SIZE_MASK);
-	*height = (readl(base + EXYNOS4_DECODE_XY_SIZE_REG) >> 16) &
-				EXYNOS4_DECODED_SIZE_MASK;
-}
-
 unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base)
 {
 	return readl(base + EXYNOS4_DECODE_IMG_FMT_REG) &
 				EXYNOS4_JPEG_DECODED_IMG_FMT_MASK;
 }
-
-void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size)
-{
-	writel(size, base + EXYNOS4_INT_TIMER_COUNT_REG);
-}
diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
index 3e2887526960..b941cc89e4ba 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h
@@ -35,10 +35,6 @@ void exynos4_jpeg_select_dec_h_tbl(void __iomem *base, char c, char x);
 void exynos4_jpeg_set_encode_hoff_cnt(void __iomem *base, unsigned int fmt);
 void exynos4_jpeg_set_dec_bitstream_size(void __iomem *base, unsigned int size);
 unsigned int exynos4_jpeg_get_stream_size(void __iomem *base);
-void exynos4_jpeg_get_frame_size(void __iomem *base,
-			unsigned int *width, unsigned int *height);
 unsigned int exynos4_jpeg_get_frame_fmt(void __iomem *base);
-unsigned int exynos4_jpeg_get_fifo_status(void __iomem *base);
-void exynos4_jpeg_set_timer_count(void __iomem *base, unsigned int size);
 
 #endif /* JPEG_HW_EXYNOS4_H_ */
-- 
2.47.0



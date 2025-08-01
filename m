Return-Path: <linux-media+bounces-38709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B23A8B17C63
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 07:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5931A5A5EFC
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 05:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F671F03D8;
	Fri,  1 Aug 2025 05:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EofZYBgE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0672608;
	Fri,  1 Aug 2025 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754026472; cv=none; b=e6h7TgYBtxQwuR3416r6yzNe1S3796PwZhguj+DpF53g2lg9DWDZXM9p2WGD8LDp/7ydIOGP0nf0JE8m9Ayc1pXCBO0XVDmCSULWW5SJYaj85LtTI1vxL1YtsM8EMju10QhWAloih4DfwqbqIP2+Z4Ec50ftyiBDnYnsBGow+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754026472; c=relaxed/simple;
	bh=lUEltV6OAtiyidgRHr/HCdDCnnAgasUSDgbkEO46Ilo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+xHOyquOnTeZbE7xmNDCDdwby6PnD+rezRuzUSVBcTFpOFUUB6h112MsyGtlrN4Z/4ire2zLqzs5nifNqyZqxwMb1D8MctHsQv5BbxfWnlYD/BTG5hMyLclSCOwb2iiMON0yndDF+U3Hvkn34a1vSm3zKQaAgvCf48i6FCB9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EofZYBgE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45622a1829eso4348315e9.1;
        Thu, 31 Jul 2025 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754026469; x=1754631269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnpAJsRbjz5iHGkErkzsTDAvzXrJNXwTeomVOzxagis=;
        b=EofZYBgEEI2dVyqBZlRS15KIrNv0RHw2TgfesW5rXeBd3V1iNYIiK3BlH4vY08pWJI
         VWBtn9mHl6A7uZQTptx/8ZcGSXdER7sh8Zqde87Wn3NxTttyYoIhOzZRVGmoEuzoQnyT
         uYRSO6LNTpCMHghKDnrEiQg2UOvk+UglEZe4lxIF2w/TNAXGrxd0iRKs5FnDospQlub7
         w/amcRrbgkAIJZptjJxn8Wn8SxmQ3ved1ilcvD/Y1RQ1T5dd7ppK0GC/WRgLSVxpkQsD
         1AFBAR0TfNmhrN1zSPZvPtFZJbUgpvYL6WxL1XQDcUzeeYwAIXWt0ZOAGcXjV3BVSvpK
         f6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754026469; x=1754631269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnpAJsRbjz5iHGkErkzsTDAvzXrJNXwTeomVOzxagis=;
        b=N1BuKLF1KHx2fGWe2GFpdUciV6RWoCdTDblIxH2BwhgrSHrVi4nGwCePJjr578DWfk
         rmqCUpHtoteNGLkhZy4/XzGF9+q1zVIFfM2yWOp2DQWBngwxSmaG8PUo+H80XryXIufq
         e4gxHyvs2UAJVKy0O0xxUyS2DXN2savOm4VHgszvMWWiph0lDvjABPEebgL6y6x3pzW3
         CKR+XAZlGJkmFdkGBl9gYzh34hxlFfCdUmjb4gyotBB+9GGgQmUyhYF1P5kdZcl1iceF
         gyrIe4gVhdKIMTzTiwZ3/xf34cm/O1EoxSdLQNBkBvMnCz+c/go4Sy8VaYDiDDMTgXsW
         teYg==
X-Forwarded-Encrypted: i=1; AJvYcCV8P2vV0goFtMfRhUZGG6IxeFRU1Woa2UO5ZRzo9dXAY7IGli1ndONMp0NsPIgWkHUzCfVsEt/9MhVb2sE=@vger.kernel.org, AJvYcCWS5RhzNuaRUMLYE/TNmnXLAVqioVwZNW5bctzRWeitOKm4iFR5+5UTRpuzofSgzp1pXAObOs7c8UzoBNw=@vger.kernel.org, AJvYcCXA7TXP4qSn3aSNCRahneDUp6sFJRTJUa+jGLcVrMTDOK2UlVfZ4cnmHqu8llsPRT9v1H+m/ZK1P8TmaTnIVvP1/Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSDjeZutRhr3xr1QBYP8vmzcLmG2GgaIj8cUhJVB0Vgu++PxO
	ThwKz00T392485pAWoVg0A3OzKqxUDjorKXBIpgJxEiZVuNNOIcTcpMs
X-Gm-Gg: ASbGnctOcMNwt5zmHVX4mSgWmJj5BM/TtqimqnRu4QTABu4Ne+wDjNHvdeEJw1OQkQQ
	aXXE3KwHuTmyHQj3vljY7VceSV3UVtCQ3DpYCaE/aDJQU05ulMIjJnwqh5oUdzdTcijKh9rD9p8
	Ip3f9t7RAz7+WtYBIELftmW7A9Z3RfEfelBVTD3KTafaak29IWbb+9QkcAk5th0Fzd/W+TrsxV+
	EgDI+DG3HofPqZ0qoKb5Qpmhqbp8cw7a3vsCCBGC8FVBXSMe5fWMeSvH9A1o9UGfrTkGpJRIYO2
	GP9zoviPYXDHNkUmkvFBLtEtiMcuQ4HlWUnJ5IZcZXqgFQGRQWAlkrPjjSq8CY88yCRefjYbRlA
	Gc+cclMa5isPpHtH6LAYpGJh5k32RJvAYCM+B+u63aL6BRI71rb9yYoiw/WCcQbD0+8fCg53WIB
	YTievErOhP
X-Google-Smtp-Source: AGHT+IGFH/YPjJWqwHqXBIAgMvQbNywFxXEl9OBHGSm8hLbyg8ZUCBLzRVlELjJD4uf6BegtqoB3VA==
X-Received: by 2002:a05:600c:4ecd:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-458af3b7b6dmr4251945e9.33.1754026469219;
        Thu, 31 Jul 2025 22:34:29 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edfcdf4sm51056875e9.11.2025.07.31.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 22:34:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: Drop function pointer to configure CSI
Date: Fri,  1 Aug 2025 06:34:22 +0100
Message-ID: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop function pointer to configure CSI to avoid code duplication
by checking the presence of vc select register in rzg2l_cru_info.
After this change, limit the scope of the rzg2l_cru_csi2_setup()
to static.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 --
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  9 ------
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 30 ++++++-------------
 3 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 806acc8f9728..3c5fbd857371 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -367,7 +367,6 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
 	.enable_interrupts = rzg3e_cru_enable_interrupts,
 	.disable_interrupts = rzg3e_cru_disable_interrupts,
 	.fifo_empty = rzg3e_fifo_empty,
-	.csi_setup = rzg3e_cru_csi2_setup,
 };
 
 static const u16 rzg2l_cru_regs[] = {
@@ -412,7 +411,6 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
-	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index be95b41c37df..3a200db15730 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -92,9 +92,6 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
-	void (*csi_setup)(struct rzg2l_cru_dev *cru,
-			  const struct rzg2l_cru_ip_format *ip_fmt,
-			  u8 csi_vc);
 };
 
 /**
@@ -204,11 +201,5 @@ void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
 bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
-void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-			  const struct rzg2l_cru_ip_format *ip_fmt,
-			  u8 csi_vc);
-void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-			  const struct rzg2l_cru_ip_format *ip_fmt,
-			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a8817a7066b2..d75cd5fa9f7c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -257,30 +257,18 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-			  const struct rzg2l_cru_ip_format *ip_fmt,
-			  u8 csi_vc)
+static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+				 const struct rzg2l_cru_ip_format *ip_fmt,
+				 u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
-
-	/* Set virtual channel CSI2 */
-	icnmc |= ICnMC_VCSEL(csi_vc);
-
-	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
-	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
-			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
-	rzg2l_cru_write(cru, info->image_conv, icnmc);
-}
-
-void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-			  const struct rzg2l_cru_ip_format *ip_fmt,
-			  u8 csi_vc)
-{
-	const struct rzg2l_cru_info *info = cru->info;
-	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+	if (cru->info->regs[ICnSVC]) {
+		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
+		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	}
 
 	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
 
@@ -299,7 +287,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	info->csi_setup(cru, cru_ip_fmt, csi_vc);
+	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0



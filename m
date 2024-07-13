Return-Path: <linux-media+bounces-14988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F3930637
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 17:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DDA7B21985
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6F613B7B3;
	Sat, 13 Jul 2024 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="F0NlpOk6"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DA1304B7
	for <linux-media@vger.kernel.org>; Sat, 13 Jul 2024 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720885389; cv=none; b=dSWpDJQEEyQKn/W1jaDG0Pc2wbd6eSfPtXiFgZ07tPSHm2LykH6eYwGwCle1GObbuSuM/D0Qj2dHMojyiywXPpS8z/OzuZctk7v5UR8f7snlRJpU92GtF+YpRgbhZX1vOqSXADapL8PbCEaSeUQN9hVIuWOWqrHmMujOFCQBg0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720885389; c=relaxed/simple;
	bh=6gGlLxZiOTXf4cPMy6elRiz5RJKvypBSBuumW/7GlAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKQwvYppLBN4oC63LawVM2QrX5+Q6npM2qs5CL4VEw59jjEhWHfk+Dgu5poonuuuRxBv6MsMROi2lzZjhvN2UNCraarJYkxJfGCCRyo99k8lsVVruuv7qx7RaELxBRzipvNoDDn4YAigWzQQhfLDCYCvoxZFZTGr9aX1aHugAos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=F0NlpOk6; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0EFAE886FF;
	Sat, 13 Jul 2024 17:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720885386;
	bh=F2gMh1HMGizvLA3op2Ou6zfTSwsvNO4JdCatWbnbzTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0NlpOk6I/r57otAsMPecKrlWpSFLX6fwpfKcd/URJBKsrqFgK94/tg7gJnFYwxRa
	 m0TaRQkA4f7Y5ZuVMD1l9HzITaABObbMA37U7TBKbD+rR+v63LIzlfxWHD57h0kZzJ
	 pjgfm7dG4gOGkdNoChYHvTK30tvPetJ9GfZ8zEoJqV4xcxL01+OSVADp0gTPDLz6QC
	 yqr2l3va2l/4P2tfbzJjCUX8/PKNtpXcPK5b0MaG+50g/rnikyCpEbqkrh6CEPimin
	 d70fqKQWGQkpxeaGVBXRoecOcOQ/cefTiP5vdm4/BeacWQKlxVqAxWBV2pvhASINf+
	 TUYz9jFttMnZg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/3] media: i2c: isl7998x: Use 0xf page to program all four pages
Date: Sat, 13 Jul 2024 17:41:55 +0200
Message-ID: <20240713154242.107903-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240713154242.107903-1-marex@denx.de>
References: <20240713154242.107903-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Use page 0xf to program the same value of SDT and short detection
settings into all four pages 1..4 . This reduces the I2C traffic
slightly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-media@vger.kernel.org
---
 drivers/media/i2c/isl7998x.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 5f8f11f7a2c1c..7d2799e498520 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -312,14 +312,8 @@
 
 static const struct reg_sequence isl7998x_init_seq_1[] = {
 	{ ISL7998X_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
-	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x07 },
-	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x07 },
-	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x07 },
-	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x07 },
-	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
+	{ ISL7998X_REG_PX_DEC_SDT(0xf), 0x07 },
+	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0xf), 0x03 },
 	{ ISL7998X_REG_P5_LI_ENGINE_CTL, 0x00 },
 	{ ISL7998X_REG_P0_SW_RESET_CTL, 0x1f, 10 },
 	{ ISL7998X_REG_P0_IO_BUFFER_CTL, 0x00 },
-- 
2.43.0



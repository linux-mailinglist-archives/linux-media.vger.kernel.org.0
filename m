Return-Path: <linux-media+bounces-14987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D18930635
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 17:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC9522826E4
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 15:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73B813B78A;
	Sat, 13 Jul 2024 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="V76d3+Rs"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72749645
	for <linux-media@vger.kernel.org>; Sat, 13 Jul 2024 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720885389; cv=none; b=nQpwAi7czUUUVmK/TgvqtcsAeVyZ8j8uPn5A4s9JYjE50tdYfBBg+apOc4zO9TK7aYYQ+TdqJt8u3E41mo113GiOpExLmsk09W3Qrg+aFj/5MB1XIeDyHtpKLD4gj+qzCQEtRpQGARWlUlyIcUV18qoSm214wuzU7xtcsJNkTPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720885389; c=relaxed/simple;
	bh=4YWMVp9bgeHqtvmhIkQuCeVN0emt4TIi1x+EIhucc14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uu6EtfmqhFLNRBbO/bIAvTZiEKskVeoiDO5/3SSqrG37oD3mvn6XPvhJYOWID+QqVpYXqgnmp1gFcHXDXz9oqa+bRfzDJm0qaIVvo5Y68NuU40jMgCnUEqzrlNTAysRlvityp+u5LrmAVfUbSpjMTUdOoGAKWr8DynWPsEriUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=V76d3+Rs; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B227B87FC7;
	Sat, 13 Jul 2024 17:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720885385;
	bh=4Gk0rJZRsQNhaeiMxQENesSasVP+e2i4pe0Jf4Y+sh8=;
	h=From:To:Cc:Subject:Date:From;
	b=V76d3+Rs510jgaja2v0bM+LLnkRKeAu/Xf36UUQfvATK5tkA1xnRysRUiw9UueBw9
	 JNJ3DGaz0Q+LjvPELEgrKPXBVXNCGz/uteBl95vKlqzWhJhleBmf7skXTTxaHYVNr8
	 Db7McJuuIZ8rRVjYjvP/1jDwiJhw40Q4n1FxgD7+sblo73MBR7aX75PJhhT3aMXLPM
	 p5tVsm4n7AGdhS+9QtjjdFZk/3MJhSsWizqRFxNxaeA61A9pPbEoHSWNBS4Z0xpuc3
	 tRyCE689j8q9bsVpT2gHVNjGkPU90SiU4ZPYk4xY4z2wjtOIG0mPGVaIArqaFoO0Mz
	 T6ao7PDKotHXg==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/3] media: i2c: isl7998x: Enable VACTIVE and HDELAY shadow registers
Date: Sat, 13 Jul 2024 17:41:54 +0200
Message-ID: <20240713154242.107903-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The VACTIVE and HDELAY shadow registers must be enabled for per channel
NTSC/PAL detection to work, enable them.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-media@vger.kernel.org
---
 drivers/media/i2c/isl7998x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index c7089035bbc10..5f8f11f7a2c1c 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -312,13 +312,13 @@
 
 static const struct reg_sequence isl7998x_init_seq_1[] = {
 	{ ISL7998X_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
-	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x00 },
+	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x07 },
 	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x00 },
+	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x07 },
 	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x00 },
+	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x07 },
 	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
-	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x00 },
+	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x07 },
 	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
 	{ ISL7998X_REG_P5_LI_ENGINE_CTL, 0x00 },
 	{ ISL7998X_REG_P0_SW_RESET_CTL, 0x1f, 10 },
-- 
2.43.0



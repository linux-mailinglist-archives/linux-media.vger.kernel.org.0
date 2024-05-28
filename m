Return-Path: <linux-media+bounces-12089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC18D1C1B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8511F24C33
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D4F16F829;
	Tue, 28 May 2024 13:03:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1E16E86B
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901407; cv=none; b=pz75ZENhXYfj1EV0jDxjqbjhjqGPRDsxasjTefqogaMtT2bzmEBp26AxDSuIoN4fnnmVcUWO8HedldDiXsL1IUPX4hT/V0tmgSJf+x/CvTg3ErIgn+WJ3CxOZoFf7h343SWHeheZgFhPI4fviv2ZYE0RYCmXhJCR8xBZQU3XnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901407; c=relaxed/simple;
	bh=wRmoA5PQ+/DSxoY0//L1KUp8sXxm7IoIJHFuRBV8keE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LfJS7Y7Sk1KIG+M9GumdupZQD3eT1sePThflGxnsAjwfFyiI2KYbHlBNC596jawbnO8JY8YgJxkm6Vn5gfEYW185qgjMzIPnSQEXF9tRn3McuJhSrzTFAEUxDref/vSXWsL6aH8YZZgrk2MDM91MaC/Zaf7xt66B35fjzwVAV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1sBwTy-0004p0-NQ; Tue, 28 May 2024 15:03:14 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	mtr@pengutronix.de
Subject: [PATCH] media: verisilicon: Use fourcc format string
Date: Tue, 28 May 2024 15:03:14 +0200
Message-Id: <20240528130314.464867-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

There is a fourcc format string for printing formats. Use it instead of
open coding the conversion.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index df6f2536263b..62d3962c18d9 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -303,11 +303,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 
 	coded = capture == ctx->is_encoder;
 
-	vpu_debug(4, "trying format %c%c%c%c\n",
-		  (pix_mp->pixelformat & 0x7f),
-		  (pix_mp->pixelformat >> 8) & 0x7f,
-		  (pix_mp->pixelformat >> 16) & 0x7f,
-		  (pix_mp->pixelformat >> 24) & 0x7f);
+	vpu_debug(4, "trying format %p4cc\n", &pix_mp->pixelformat);
 
 	fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	if (!fmt) {
-- 
2.39.2



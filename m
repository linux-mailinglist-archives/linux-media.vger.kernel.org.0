Return-Path: <linux-media+bounces-42515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC6B5707D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B727C3A557B
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399EB2877D6;
	Mon, 15 Sep 2025 06:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qZYEitbk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400728751F;
	Mon, 15 Sep 2025 06:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918398; cv=none; b=BZK9DdsNncksZNH/eiHHTDsel8reKKceC0HhonvY4xJTEia9igwrGRvSQYnBuhBvBOAF/ymxI9CUeFdqL0ANAx2HkaZ4Cq+LO4UbzCEuMpzMWzcaOuL6ZbOMP9HoF2DeGPQPOp1mhXUj+2o7MsMSZXUDLoabvk/3HqlyM7xzH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918398; c=relaxed/simple;
	bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFW/D7MHfSvn+kmlPmmQ2i3A1J6CHdIEEzpyIJj6S0VjWbxNevEuOpTIU7mjPFfqOFuy/X5U4RIyWuKcbUAlXT4Istw8bHRS3vA1EOkx1ImwpoP3sckdOtrc2EAdYKPKlTypj/ZdXu2P/gnis8qE1D+wogjg2KIwucpoBxKCIb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qZYEitbk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04478C71;
	Mon, 15 Sep 2025 08:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918318;
	bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qZYEitbkx/lTDT1oosO0rI/fKHsiPN6GWmnPTON5rIQJC0uLXA05Pk6WU7unZF6rk
	 Om94bgYQf2OGZubLGExQgC7hi6kPSHKE0CaaGa92V00pXkjJZFVfFpEeoNY7qgD7oM
	 BL/ecCxaSyV7lqOqXD9CwB2DAzyH1eXY1voj7sh8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:10 +0530
Subject: [PATCH v3 4/8] media: imx335: Update HBLANK range on mode change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-4-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=aZlKkf1i1h0XvF+Ov2evMQQ/nZrBsd8Vt1HWgTXZ0yg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7STxnoNuN2N24wmm25jnZRnnGdHN61Wz0IOy
 mm4ksnI9rCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0kwAKCRBD3pH5JJpx
 RXXoD/47BOKM7qRnK97NmmuC56ZyKqVYO7u5bVg3lX3g2n6fw5R3uLtutD6LR8wkxor95NeXQJL
 YhfI/WAIe9C/vMm7HhEnW9kTMNyald4m+eQBBuyRIrafztuflaey/s5i8kosMZIGNq4q0U7/hsz
 cCKu5AklvRV1BcSu7SN8shkKaeUX8axiMxUZE6NRqXGrls6LfBBROwGhutlVCw0xVKIhiS+AtMK
 EBOlK7Aj4HN65gVjjmjEQNZGZF0E014Qnv1jA8iMDP4gRvrXlpkDugUio4YDr6j6yYRN0lKd7fp
 Uv6ObgLoOWuwkkRl4MsPuRDVH260JCimJ/QgpzN4Sp+VfLG2XFZN6b4AlukGwRRv39aG44ut5o6
 e4ziuPlXRnh459U76FufHHMgpJyWiM/NPc9tbiGQR5ARqjQ2sGVwN86m5ok4BXDxNa9UoH25i10
 a2uKfao60JeQqZsZulqiJaxHbrPIbpDpfGkumMDmIt5VKcEaZLo86mYYbhsgNv92J7pHv/8AOHg
 E8cdFpwoCHxGAnJo7IeXFX+8e+XOAL902mH6MFgxCIjdK/27L+QexGHkvzdisSIFKfdK2ucpMH7
 tZmRSySPVVeQOK3hAzB6akVuM4dqkZYket78ghObkZWIUydf6A+TZUxz0qu3hCTiVaHeAydw2nJ
 2dwdM+GUh60Qw1w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

While switching modes, updating to a different value of HBLANK isn't
sufficient, as this is a read-only control with a single allowed value,
and thus hblank_min == hblank_max == hblank of the default mode.

So to correctly update the user-facing value of the HBLANK parameter,
which is necessary for correct framerate calculation, update the whole
range when switching modes.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 3522a6b1ca14e27c46a55e18e5bf51240ea5a6ee..62a76517ecb263a4fd7e7a593c02a3cdaf3da190 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -493,7 +493,8 @@ static int imx335_update_controls(struct imx335 *imx335,
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx335->hblank_ctrl, mode->hblank);
+	ret = __v4l2_ctrl_modify_range(imx335->hblank_ctrl, mode->hblank,
+				       mode->hblank, 1, mode->hblank);
 	if (ret)
 		return ret;
 

-- 
2.51.0



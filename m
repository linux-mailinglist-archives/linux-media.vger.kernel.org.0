Return-Path: <linux-media+bounces-20499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 890789B451D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351991F23823
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ADA204018;
	Tue, 29 Oct 2024 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DMZHoHvS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C02204029;
	Tue, 29 Oct 2024 08:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192318; cv=none; b=tePjgiSt0ZzslpAUd2teGwDS4nfcyzllOyoPkmjf0NMR4WKvIxIRcG8OjfEzXHJz4n7efHiIJP/Igu0RXOZRstchyo9GwBJnGJ2s6ok5NRsz83OeMPHUcGk8ekr0R6UZxvUr5FCGjF+Bml3CW8c1jv4W9f1AnJUXuGfuCAjPEqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192318; c=relaxed/simple;
	bh=b5kMoUY5fEN9QNCesVCHdR6TYNW7ZndQEXVBK7dSQak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWF7U9Iz2NKW5T63pW2JtDu6v8Ch6CnSLsEilO8F6BKq4rrBIkQviFl/jdlg33JHtONtM0J+MtvAJpNL+sWuA4PC2zjZFjOKEk5h9OKM2yPATeQipCTsmDG/ZLA3ByKdl0PZCrP4J22m44MG9RnSyQUvBEHUBIsFk9XNZbcT4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DMZHoHvS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:9301:2bb5:b494:2d46:ba69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92AF74D4;
	Tue, 29 Oct 2024 09:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730192313;
	bh=b5kMoUY5fEN9QNCesVCHdR6TYNW7ZndQEXVBK7dSQak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DMZHoHvSTy35aAN9FbA+tM/VqthB7dtuElsOYVIjWw1Oaw1iOcWFm1eQrN28MI8r7
	 1BAL0j+dJlhBL4RdgwRWZjeS2xGNxH3JJbznqAGf7t7FiFKbVNGf8L20YyR3T9dPYd
	 n63KNT4FGGFWtW+9DUYsp9FQWXhwarmVMEFTpfn4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 29 Oct 2024 14:27:35 +0530
Subject: [PATCH 1/3] media: i2c: imx219: Correct the minimum vblanking
 value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-imx219_fixes-v1-1-b45dc3658b4e@ideasonboard.com>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
In-Reply-To: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=887;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GYqSOn1ss8LemMDmik0yF8hzBMbOBLBFwe7AEg2ce80=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnIKOuJHWdyujo+MgOVJi/D9lfJvO0/VtJxyjO0
 S99omv+q7mJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZyCjrgAKCRBD3pH5JJpx
 RT6dEACnnI3tI2rAwUH48j65f7pkyhCMmK4rGeGo9dmxoOtLmiu+iuQlwMfWCkl/MZtjMmoLGGQ
 kVP1+wHLEZpM1dpJhAOzpQARh3e9InA5xIYatYYs0ekrp5YzCIbs18BPQiPCSqvZwAlR3+DzzVk
 AIDR/HlnaspcXYwTwP1yIRI4uHdxMeIjNV/sIt9AEWJVyfI4cL9KdY9WnaEppiDdUcwWSlnknb8
 Csmy8pnveKOHMosDuILVDj9MJKZPWQ3ly3bB4C558SejvodZYqzLnTzoaJP8xjoPnHTIK2iPz91
 mFwWnl7le5T/92Tl4TWTBVZSw3g7gxFvkxR2DLAAweUvMI0TNYJWvuwYX0pds7A4RawvhQItmea
 /MMHXLBPHZJUYqGD69XJlYeqj59LwtrXLPUxGp8+EJ//FmXhwP8h0/J7GE7/wWnYsY/CpMnrA/N
 YjThcMr8jWVy2tm2U2hoHnr0aibWc2/v9b94n35lRj1Y7l4U5kK9mAWvdFXlKlU2dG9a4+cae15
 nqnExdf5q0cISDWCTmbP78mnJVxqJuNm1DufNIsOaMVejHoxLveMdIfxbXkh3g/fAm8/Zl6A7op
 ZY1a0whLR+JSufpUducC7kLuIsKVKYY+zTZZ19LgUzUFk06UQ+JPoz2L9UNPY5s2Ub9RSedt+c2
 Q6SR9Ov3h5ko4DA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

The datasheet for this sensor documents the minimum vblanking as being
32 lines. It does fix some problems with occasional black lines at the
bottom of images (tested on Raspberry Pi).

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e78a80b2bb2e455c857390b188c128b28c224778..f98aad74fe584a18e2fe7126f92bf294762a54e3 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,7 @@
 #define IMX219_REG_VTS			CCI_REG16(0x0160)
 #define IMX219_VTS_MAX			0xffff
 
-#define IMX219_VBLANK_MIN		4
+#define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448

-- 
2.47.0



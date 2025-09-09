Return-Path: <linux-media+bounces-42110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2523AB4FB58
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441C61C277FF
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 12:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DCC337698;
	Tue,  9 Sep 2025 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mc1KBfpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E4334704;
	Tue,  9 Sep 2025 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421339; cv=none; b=S4mm4FUTTBptYdlbbs3WU7DkfqDyggcNwo4rZaSKaepTbVXEplvCjX8hb7nEhM096mmk8q/PtbuhAU8LP1IdeLzWkGEdg2DJI/Mmu0R8z+ZuZi87rp8afHxaqoUuLlQHEiuRPRKOot7LE6ZJteYofOCOVC/5LEumcn4xus2J0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421339; c=relaxed/simple;
	bh=oz15XcYvyoG1Vj7doIEmZ4rSoEoAPHMUCB2YH7Tk65c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1QiMOQSNuiuLzjdiwdV1FfhmAMAb8bNCIOuuPcahtmMR5tZAJ18CwPcm1oMvoE9Bc7dfjOQerLpxDSHh6L9Q6e62TsO0HJyAOUiG7KQgJXG2q//bNjb90CjE2v8hCZs8G7DCtvkwkRlK7c7+vYgivb8JQbWCAVi5S9fk4BizIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mc1KBfpr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b04679375f6so984575766b.2;
        Tue, 09 Sep 2025 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757421336; x=1758026136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRb5B7o2xDB9wgWoSpkMOT2610gE/WgW3/wgBC4P3qg=;
        b=Mc1KBfprQM7+tfW/K19HybQ8VpVbrrr90j3aNt7o3r5GQ3ttXl58ye7GZQAhZZEpAK
         oHat5YWRPjbxTy/9CgQQN8PM09PN1DmVDYSyHlH6QJzQ4oJN6FIR0hysO9QmYP+Sp0W7
         wcbY7w5xSB0rhlxN/eJckmg997mcZshTYqzI1PErM61xIGfbciL8T+OOZkPuXlhVsbuu
         /iS90An88V7QTdHB2RMaE/3DTJTUykToqofx0OL8ZmH9+fD33e7jU1tLTVEa8rMPyS3m
         EOVwokmyPV/EAnuCpgTTXOsSiZtxM3qcuKscFcFFkFKIzZRG7RsLmVPpmsysqwLmHNFR
         wmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421336; x=1758026136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRb5B7o2xDB9wgWoSpkMOT2610gE/WgW3/wgBC4P3qg=;
        b=JK7QWUvPUYP8/vGsugAAU2GvXv4yYs26oJ/IHAGvDW6ugSJU5vo6hv1IrTwe4naA2w
         EWK1rEtzpCTRFFgPbahZtpukOaUDurU1QdEnh1x7IzSOcKcZol0/5hOVvP9U58FZ7JQS
         PGjxTJN8Ll0qaKs7i3mvaAbFqN4zeUAlFHWbh/KXzixTy7eRpJMrRY5E0H7pnBHC+P7K
         kZ+1ch1lRW985gfpwM8MVMgpJOrhhpMWOwmRlfy5deqfcBq1j96SYjiD3O13mWE5K8Pa
         VkK18BQbqKVBOlhUorVpnt4iW09j3nDYym8V1oO5/xXUsGBY4eu+i2CVQU+aozkKZoYb
         J4jw==
X-Forwarded-Encrypted: i=1; AJvYcCVVIayhAFZKkBtAHNRlbtMuetzHX3nsolC5U1agowOHbBP6rpzQiIPhEvRGyq24rpnUX3xRZhPPTbHY6bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVjUPO3Z5x0od+7CY6fpydtkrAl7KRLrJsHKa1YE/9ZUhgEVs
	xkFGfRvE1J+ddJ/YwimLagQKdWxlBCBvxep7U/NqVZU+8K6niDp/PrOeK9e1Dx0t
X-Gm-Gg: ASbGncvObyON1vfPxmvyZMAtB7JM0fjutQBIEyYVnl+nAbv8Y7B7plKRkSxRVhv9EYl
	ZpWE/TwCetzxo/CjtOqy8WYxKV3XnAbaO235VKprGyriQ41zMpUaGDrWIW1EgcVioZGsFyywzcU
	9QJjyXXdX+HHh0/QZwqLoQZYEwO/Q7/yXU2cfeZQ6RJ+u3wE4V3ci0JOjNW+7nD85dxTRB8mAto
	lacKupaobyZIAtl67uSzs8fjjSwLxTIt0GYXPMPl01qw6TOHFeYP+l9sTBZXaJrdfqR/CqyRX/e
	h3ulIOI517VSUTDKu5VcMtb7owhRh+XVlfQMw6MLQNuImp6qsiPEDOwJWZidn6u4jUo4d4XXu/I
	Ta+3H2NZTM7pZG7a2PeOsAiBbX18o6yE1
X-Google-Smtp-Source: AGHT+IEkilOY34M+BmivOzBrvGQ1PpWHdWNeuJAn+WCn8p/bQkZh4CGqQwnsODNTbVkX7+D1ggO3Eg==
X-Received: by 2002:a17:906:fe0c:b0:b04:7708:ee36 with SMTP id a640c23a62f3a-b04b13c8c2dmr1146633366b.9.1757421335594;
        Tue, 09 Sep 2025 05:35:35 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047a90387esm1342975366b.0.2025.09.09.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:35:35 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Subject: [PATCH v1] media: i2c: alvium: cleanup media bus formats
Date: Tue,  9 Sep 2025 14:35:06 +0200
Message-ID: <20250909123507.2704703-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes MEDIA_BUS_FMT_RBG888_1X24 and MEDIA_BUS_FMT_BGR888_1X24
as of that formats are not supported by Alvium currently.
The missing and supported MEDIA_BUS_FMT_RGB565_1X16 has been added.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 28 +++++++++-------------------
 drivers/media/i2c/alvium-csi2.h |  3 +--
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index c63af96d3b31..743b300fba4c 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -94,19 +94,9 @@ static const struct alvium_pixfmt alvium_csi2_fmts[] = {
 		.bay_fmt_regval = -1,
 		.is_raw = 0,
 	}, {
-		/* RBG888_1X24 */
-		.id = ALVIUM_FMT_RBG888_1X24,
-		.code = MEDIA_BUS_FMT_RBG888_1X24,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.fmt_av_bit = ALVIUM_BIT_RGB888,
-		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
-		.mipi_fmt_regval = MIPI_CSI2_DT_RGB888,
-		.bay_fmt_regval = -1,
-		.is_raw = 0,
-	}, {
-		/* BGR888_1X24 */
-		.id = ALVIUM_FMT_BGR888_1X24,
-		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		/* RGB888_3X8 */
+		.id = ALVIUM_FMT_RGB888_3X8,
+		.code = MEDIA_BUS_FMT_RGB888_3X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.fmt_av_bit = ALVIUM_BIT_RGB888,
 		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
@@ -114,15 +104,15 @@ static const struct alvium_pixfmt alvium_csi2_fmts[] = {
 		.bay_fmt_regval = -1,
 		.is_raw = 0,
 	}, {
-		/* RGB888_3X8 */
-		.id = ALVIUM_FMT_RGB888_3X8,
-		.code = MEDIA_BUS_FMT_RGB888_3X8,
+		/* RGB565_1X16 */
+		.id = ALVIUM_FMT_RGB565_1X16,
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.colorspace = V4L2_COLORSPACE_SRGB,
-		.fmt_av_bit = ALVIUM_BIT_RGB888,
+		.fmt_av_bit = ALVIUM_BIT_RGB565,
 		.bay_av_bit = ALVIUM_BIT_BAY_NONE,
-		.mipi_fmt_regval = MIPI_CSI2_DT_RGB888,
+		.mipi_fmt_regval = MIPI_CSI2_DT_RGB565,
 		.bay_fmt_regval = -1,
-		.is_raw = 0,
+		.is_raw = 0,
 	}, {
 		/* Y8_1X8 */
 		.id = ALVIUM_FMT_Y8_1X8,
diff --git a/drivers/media/i2c/alvium-csi2.h b/drivers/media/i2c/alvium-csi2.h
index 978af44f76c7..0f1af5e5355c 100644
--- a/drivers/media/i2c/alvium-csi2.h
+++ b/drivers/media/i2c/alvium-csi2.h
@@ -224,9 +224,8 @@ enum alvium_mipi_fmt {
 	ALVIUM_FMT_YUYV8_2X8,
 	ALVIUM_FMT_YUYV10_1X20,
 	ALVIUM_FMT_RGB888_1X24,
-	ALVIUM_FMT_RBG888_1X24,
-	ALVIUM_FMT_BGR888_1X24,
 	ALVIUM_FMT_RGB888_3X8,
+	ALVIUM_FMT_RGB565_1X16,
 	ALVIUM_FMT_Y8_1X8,
 	ALVIUM_FMT_SGRBG8_1X8,
 	ALVIUM_FMT_SRGGB8_1X8,
-- 
2.43.0



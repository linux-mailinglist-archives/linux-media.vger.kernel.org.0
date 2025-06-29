Return-Path: <linux-media+bounces-36213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7EAED11B
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EBC3B1026
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2772B23E354;
	Sun, 29 Jun 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejB7ap98"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872D22F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230605; cv=none; b=jItBLtMtzbG1FfvAE1uzpULtVsoEks+OY/ySOXq5x8TTxSMtpMSuoiGwlgHmGbJfofzW7nXaMmiz1+eWspCo2Ns9yOhzpDnuwL750LcAZzY23hV0sKYlQF3R0igKIgEnxzwjF1Oia1fhW0cAcWV0YkECd2rONBdPBiOHk+xjb0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230605; c=relaxed/simple;
	bh=GSsiJ1NnSiRJzJhGCSxOjxBmP2NqlKI1cI0lJ4Pg9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bKkCMdVXeoXBz3CpLiHiEkvmRG33hOymxptPPdg2Ie4sWV78+BMJrl7HYOTxK36dNzsjOh/hg+McJNVkTLdxPUO0Bg+UfDREtTKmlMdX0p3ZmybB665/v6aB4zRTAje4SVTtB2XBleGpYvzthEDXeOyptEFlnbQLN3LTdlvXjm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejB7ap98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01A1C4CEEF;
	Sun, 29 Jun 2025 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230605;
	bh=GSsiJ1NnSiRJzJhGCSxOjxBmP2NqlKI1cI0lJ4Pg9OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ejB7ap98gbnMV2Ai17C1Iu4b7Ayd2PhVrZyFGuw4jg8Cw6JEt52bMzqtgMm9zPKm7
	 SYrUdbq53vsIiYOi795BDTqU41rm+8V7mUILus8ppBSxgwT8ekBmHg2KtUwMBT3/NW
	 QNyxqT4HPW3tnxnfo0fca+KOjkn52c3rOtArUu0404b1Jp5SQgkmsaeg972yBoIBuG
	 YYbWAc4ZYzqTFmNLEuSbvBqanOoTKg0tcnFMgp2X6Seodf1UYP16CTeXRQRSZBrO6a
	 iv/vSmKhvUYsRwhKtYLwMXb+qkpDw6xiAetKorD7QBENhquIoUkO4HrE4vnp84Faab
	 iV3DTfJgJ6I/g==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 06/15] media: mt9m114: Tweak default hblank and vblank for more accurate fps
Date: Sun, 29 Jun 2025 22:56:16 +0200
Message-ID: <20250629205626.68341-7-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PLL gets programmed to achieve a 48 MHz pixelclock, with the current
vblank + hblank defaults this results in a fps of:

48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps

Tweak the defaults to get closer to 30 fps:

48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps

This improves things from being 0.026 fps too low to 0.015 fps too high.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 10ddcc102b8a..06f835b08f8e 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -333,8 +333,8 @@
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				307
-#define MT9M114_DEF_VBLANK				23
+#define MT9M114_DEF_HBLANK				308
+#define MT9M114_DEF_VBLANK				21
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
-- 
2.49.0



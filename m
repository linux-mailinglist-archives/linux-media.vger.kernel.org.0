Return-Path: <linux-media+bounces-24098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA79FC983
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C25B161ED5
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F009F1CF5EE;
	Thu, 26 Dec 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZUiR6sE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A41D45FD;
	Thu, 26 Dec 2024 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199459; cv=none; b=NYwL3LbA19tyZPGqhnJzq8jyXyPEaKIgxaDqRsvOQ+nchVWg2rCzRkusXcvuMHboei6QuBg2J37SFEEUYjlOt2L6ah89hZv3LFq1KMpmWIpKJ0BJNmnrHQeS3ufhXlX0JP/i1cEXd3g2DLOUANCULdYlXS4IcUkuublSEC0ePjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199459; c=relaxed/simple;
	bh=Lqgv7KZAthmu4zkgSK7+QwyexgQxR4U3n3PVnnCC1tY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jd3hv3FVoDWvn3n7HvNyBIe0wneTUM0s/nDDPmgaw+ccRg9+z8jiZwBnG1BOJBZs2zfdS4uX3zu3lBjQ089i0ljvObXyqBfc3EtNWABPAqCiOWJHomCxxUO1docLI9h9ob3nuRGJYR8AwTXKmiimWz+mPwGG2JeJZxLVZiaMv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IZUiR6sE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 807579FF;
	Thu, 26 Dec 2024 08:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199412;
	bh=Lqgv7KZAthmu4zkgSK7+QwyexgQxR4U3n3PVnnCC1tY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IZUiR6sEI4VSeDmPoIJ+x1p0TB8napa/7wZleA9sMZCu6uMPk1VLURHZSF/S0Rok/
	 SBtEhU8RpfOcXSIAyhrVMwy5ecqkuabAjiMBShw8UGFwFQdYuf4qC0fhEhP7rftpv4
	 CWUQ9sulmxKLnNlcTJxBhGMGtDpiBHR0w4955TTs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Dec 2024 13:19:36 +0530
Subject: [PATCH v4 4/5] media: i2c: imx219: Update PLL multipliers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-imx219_fixes-v4-4-dd28383f06f7@ideasonboard.com>
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
In-Reply-To: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Lqgv7KZAthmu4zkgSK7+QwyexgQxR4U3n3PVnnCC1tY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrC9f6D4R0XwMKc+JZuwvB55qRCleIceG67a
 J1OmJorh1OJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwgAKCRBD3pH5JJpx
 RVFYEACwMC6gOWGBw9WxnspHYwvSWvvJEWg4jadmIv+bb3Vl9fl3PY8mFhXRuDGp5H2FGkWhGGT
 FEJ/XePHhVhBtqEbN+L/SzQMgsjIORVqraVsVQAiaIONhOzSB6JHNmUcB3Y2Kua+xvXiGPCGGpM
 bMTgjZKUbrcqSXbKF8ZoVLwWv6M46jvbYW76XxK6Djx9z0Z1X1Ob/i5CvdcWZt/D5/Z2FU8izzG
 nHhqWsOC/SDb3F8lY5X5RA7ATPDZINJdAMfQ34bIjQNZ2h2GQ9uKlQDeYSIxMSnWmR6VfE1Fwlj
 cikwDNiHpXWUZ5yr9R+/HRe/UKLUo7GXv/oKL0c/n7TJYDddtr/R+cUwrvMEtS3sGt4vcbSVSlJ
 dDK64pVamlQbN7NuXIPMSAJ4PAtjo/q1zS00wh7mx/mYI3sWDAnHY7MEcfWud7hqwA2qDP34UHw
 qA9t1auv+zbqWmHSrscGE9fi1VrMr+wN1XsZLUJbd3Yx8hwMLvIT8BNi3fPdbHnsCURSwGhUin2
 +a2rGObS30aGVEkiz599W/Lgd2IZ6Qdl/h0TU4SCGzoW1irsoYdG5iEOlnI2Ow7aXOMxhRHzC+O
 mvqjjHWfsMsMHQnmCbsyRmGR0pRTQlZO35V/uOwBTz/VuJObaanniypY/5APMv5FqjJEK4HOOew
 dZb/LhEX0jVHeLA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Switch to different PLL multipliers and FLL/LLP to achieve the same
resolution and framerate while avoiding blocky artefacts seen when using
analog binning with RAW10 format on higher resolutions [1].

These new settings match the register sequence generated for
1640x1232@60fps (2x2 analog binned) RAW10 mode where no artefacts are
present. The same values work for other modes as well. It is unclear
from the datasheet why a higher HBLANK, lower VBLANK and lower PLL
multipliers fix the artefacts seen before.

[1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 84681e5da3e238905139fe174e9ee3cfe5fa0246..a8fcb7234c78b888cd7424629ced02cdc55a98fd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,7 @@
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH		CCI_REG16(0x0162)
-#define IMX219_LLP_MIN			0x0d78
+#define IMX219_LLP_MIN			0x0de8
 #define IMX219_LLP_MAX			0x7ff0
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -171,9 +171,9 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ IMX219_REG_VTSYCK_DIV, 1 },
 	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
 	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
-	{ IMX219_REG_PLL_VT_MPY, 57 },
+	{ IMX219_REG_PLL_VT_MPY, 48 },
 	{ IMX219_REG_OPSYCK_DIV, 1 },
-	{ IMX219_REG_PLL_OP_MPY, 114 },
+	{ IMX219_REG_PLL_OP_MPY, 96 },
 
 	/* Undocumented registers */
 	{ CCI_REG8(0x455e), 0x00 },
@@ -287,25 +287,25 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.vts_def = 3526,
+		.vts_def = 2876,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.vts_def = 1763,
+		.vts_def = 1438,
 	},
 	{
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
-		.vts_def = 1763,
+		.vts_def = 1438,
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
-		.vts_def = 1763,
+		.vts_def = 1438,
 	},
 };
 

-- 
2.47.1



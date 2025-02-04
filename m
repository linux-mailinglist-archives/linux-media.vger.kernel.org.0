Return-Path: <linux-media+bounces-25616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CCA26C6F
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 08:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E203D7A4318
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 07:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ABF204F97;
	Tue,  4 Feb 2025 07:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Crv1DwgA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4F02063E7;
	Tue,  4 Feb 2025 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652731; cv=none; b=VY7rNIMq9zwEUXDB87z/o+Mz15eOGOb8hc3ISgs+u+PsOyrWXfX6jIDu4XSojMdOXZqSDc8IIPawH7p+sYw+Z6BMPKPZ9XkGsIfETyH675hmAA+k/FLDxnHrgBbzB+9j9v/tqm6gvNgNW42o9EllUdSviUhtSZgXNpBLylA3nFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652731; c=relaxed/simple;
	bh=2XHKHc5jDxS0ReYPBqzAlsz2r1Tp5Fe8TOh9+K3HdhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GbPzWrvT0/OT2UJZ8WLFy4/DX/W9LsG5PAsnxhENOxtINEq6lDehkWOszM3fLYmg+R+qB/Moyq3diDlIJXtKPIWnEmPeS5RyuDmZsPuAoG+tQREIo9LXmpcccl9eatPmgYNhoxX6GtHwFREjDuT2u8aEoAHK8PsQeuXp4UjTxWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Crv1DwgA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:8839:be31:a1f6:6475:ef19:2df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77E46CDB;
	Tue,  4 Feb 2025 08:04:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738652656;
	bh=2XHKHc5jDxS0ReYPBqzAlsz2r1Tp5Fe8TOh9+K3HdhY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Crv1DwgArpeKwdbPOTu/vPWbe/zdMjuLtzU/utxuaaS0q5f8bL40G2K7nyTLloJ1o
	 2Ug9oR2/W7ez7kdAytekRnaXbfMc4DKs5aPy+SRwO39fayDcX06iXOCOuX/NxmWFXq
	 GoXGi0cClTVLTNC2U7uOZQ9fskRjZwAHtw1q3Ft4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 04 Feb 2025 12:34:39 +0530
Subject: [PATCH v6 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2XHKHc5jDxS0ReYPBqzAlsz2r1Tp5Fe8TOh9+K3HdhY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnobweUTBqx6DfmucM3yFzaa9fgNakFQm0Lpgh+
 AoeEBkfJXeJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ6G8HgAKCRBD3pH5JJpx
 RWYiD/9NsXsLG1lmfYHjUyDVy/EG6i2jCzVM5ZN65v5Vx1MpCHsx6EAcIttCo8zzFT5G2KR+S1k
 4vK+3HuPe/WQx1Q5MHL8Anylt6WMW0AffEavhDuFMya0E4RH7MQzHYD+TpxHJoQ7CGsR4bwrNbT
 3B7d/vvdq3rghmXXdNvWYWWhFaw0MJjCW/CdZfNejdODaq/R5tA5e6ksVqGPIEtSbBLQKzw4Jug
 0Q/v6aU2x6uqIX1iDyM05poUoOLU90EILA35iEQHp09mu8W5wupgl0hkLFZ3UkVDyToyc6w3V8b
 rfStW4ik3acvaXQnOiGw4KnM1nW2JXxfGvGK+RVK85+QtRAVH/y5cuUgDrjwrp5i87Ee91QSgaJ
 ZTiYnrv4A4sG06l67IMFwZ36EIJ1BMK8wPHN+0WkeJa7PUzkQu8HT0eHtuV/6aI0nuCkS3R8PTY
 uRM9qMiNRy2w1NZxXnIV6+0t1IbposwmNImsCjkeL/YG7kKNDeyu6YB19YspMI1fN8g6UkGDoPz
 1BjsJdln6ghYiZki5YEw+ELBwod7/leA8yaXEoW1TYhkSIDGWBiQXwBN0tqmAKns9WapMp6MIce
 PE9jWYVYUkTlQM/1xNhlRPMT2g6QLecdbaCdyOm6I4MxDgVLMqw0exjyIFj1weORK3C06S5YIDC
 qP0P3aFHKJoDVFg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The sensor's internal ADC supports a minimum line length of 3448 pixels,
which may be too small to use with analog binning, where ADC operates on
two lines together. Switch to a higher minimum line length of 3560
pixels to fix the blocky artefacts seen with analog binning [1].

To keep the same default framerate as before for all the modes, lower
the default fll value to compensate for the increase in llp.

[1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..e4aa6e66b673bb7a8942bf8daf27267c2884ec95 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,7 @@
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
-#define IMX219_LLP_MIN			0x0d78
+#define IMX219_LLP_MIN			0x0de8
 #define IMX219_LLP_MAX			0x7ff0
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -286,25 +286,25 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.fll_def = 3526,
+		.fll_def = 3415,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.fll_def = 1763,
+		.fll_def = 1707,
 	},
 	{
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
-		.fll_def = 1763,
+		.fll_def = 1707,
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
-		.fll_def = 1763,
+		.fll_def = 1707,
 	},
 };
 

-- 
2.48.1



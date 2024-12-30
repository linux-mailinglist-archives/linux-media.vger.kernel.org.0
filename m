Return-Path: <linux-media+bounces-24153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC19FE2DC
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CFBC161C41
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF9819CC1F;
	Mon, 30 Dec 2024 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XEXgFnfl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86A19882F;
	Mon, 30 Dec 2024 06:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735539157; cv=none; b=ij63LmcMdtam1HX1VE6TcjP6olBvtto4AhrfDDdhA6heE/faB+Xwi2mMcrVOrO5l1z/4jrfZhroqr97jYEu+rGV7rH73pRItIx39SPHrKHm/wom6Ippcq3UYY8FPdHQ/4qu/W0JC1236nJAc/goo1j/dRa3tkzaJDB0GBkomhIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735539157; c=relaxed/simple;
	bh=/zuK+IMKWUpsPxYK9SeLgzl0Ed82qSbZNYmxPYheVTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9vPAhm76VKT+GSS2nBwGzIw+NLRIK5tqDApenMEZxTuH3gGscZgrL9g0f9cDY/0J9/2Bswlcb7CRPCfyXPlOir+KZo3pbWZ13Ahce+EkSctNeoV6RTSgPJBey9qsXeDqUo/pF04iORk79n9G7vpvDqm/YvUslMDIbsxC6xquWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XEXgFnfl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 511AC3DC;
	Mon, 30 Dec 2024 07:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735539108;
	bh=/zuK+IMKWUpsPxYK9SeLgzl0Ed82qSbZNYmxPYheVTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XEXgFnflhnVidsxjb6V5leh8fg6zi8ozPOzbo9oJBE7zInB0Tytpj8DAAkwHXI+dT
	 ENVqw6HcGTn8mfH2M0wZ0j89N8u+UnNG/OsJeN5omfuc0WafC8PkXgfeLJryz6OFef
	 jno1osjRb9zyeKGeyvpIYlXRLtAtP+R1xjXYetjo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 30 Dec 2024 11:41:21 +0530
Subject: [PATCH v5 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-imx219_fixes-v5-4-98446d816489@ideasonboard.com>
References: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
In-Reply-To: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/zuK+IMKWUpsPxYK9SeLgzl0Ed82qSbZNYmxPYheVTI=;
 b=kA0DAAgBQ96R+SSacUUByyZiAGdyOYuhZFG2vPQf9iVDj4b872Yc0vGbOftOLWxcui7rq8h8H
 YkCMwQAAQgAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJncjmLAAoJEEPekfkkmnFFIDUP/235
 SrmbWpglvjOM1grxWaxkavyLA7cANjLgm2o7n241Ljf7tHlSVLpGBfPApI3hALhXjisfr6HxTxa
 GMl8tnxfVqWIHTPb+W46s4zMqWZi1cB7jlMNdbjYYvf3GfSMRPCn5VbuWqHEuMdtoYLvXkWqiI3
 OAuGoJC3Y2xaNeSV8CqrygUlrB5OlyXu+mUhC1xQJc9AhvIKJh2V6owY87nAT/Lh+3bhlakzPyQ
 X/iao7Qqr5KY4HwOl2GnePoNZHBSUnnKla3D46t6M6Zuxs9fnfrtn94YZWdERJJQkUsWZstrcim
 yQhShPlZoEb0Y67LmR1AbYWPwsJ93fSOYx4OcXI+Ls0HPeCHUtIJQ+sD6AgUe2bIaYlRFfPIAnY
 In2rZzYNxReN9A6PfmRL9PhK3yWP3FD2Nja0mFR/gJ98eCYRD6G7fmOrhJgJDKSfeMysitEAWJZ
 6yQyFehwWnWf2kK3wjdiP6NlALOJN19dyyM7endLtJGaDBWPOGjkarklZzaRAjypvQ0Kd6wLlVG
 i9URkDdJqQyQSKf5ZNk6KTe8Q6dmfPQ2BjihWdhCdVCCIbPeD9MLEPdS2TcmwQEPyqAJhux3ryG
 TbvsI4W8U2sjF4MqbLxVlD/pK/b2bwSlf0xazHRzkV+NfEU9lYWSSK8sdYHZgdYRPi+QU0tvw6/
 Op+2C
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
index 9682a74feb3b7b74cd2ca54779323396c77cd5a5..5cbd7b90bed28bcf59debdba6dfc76bcd34eb9b4 100644
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
@@ -287,25 +287,25 @@ static const struct imx219_mode supported_modes[] = {
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
2.47.1



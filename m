Return-Path: <linux-media+bounces-23663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B633C9F58FB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94AC618954F2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589C01FBCA6;
	Tue, 17 Dec 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYzuAkxr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727E1FA25F;
	Tue, 17 Dec 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734471564; cv=none; b=okwo/sQBWZSffsHDNZSVobeEUUkWTih0+8M5iazqURPdZhrM360bjmyvG/paVMr1NzwoBk8PflSw0tnwF9J8ufwxY5HoSvSrNXAUcG8egY7u1HGURU4WaUHi/c2RGKnk2SMBOfCqOGIaTfNNJxltrE5vrbi3BbQsHzaIv65lyVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734471564; c=relaxed/simple;
	bh=YErCTUhQ/G7sCBOzYDhoT3G1Z1y0MkXWxHYYmk+C8lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afuQ1+8HJEPN/NDwv+mCsxs4Q7MZs1zqCslbtykkT5j9M2gRqrlv2n7hmbG8ulF7DMG7dW7W3X42L7w0xTmsjjd3K4/rRAqqKwpusZlVR0hvKQYYoeEq5C3RQwHoxrt2UeyMfkBX9uR2j2jSAUKwivshAb758JceIErbJ4RxtcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYzuAkxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02917C4CEFB;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734471564;
	bh=YErCTUhQ/G7sCBOzYDhoT3G1Z1y0MkXWxHYYmk+C8lg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CYzuAkxruak4SeqaBYzDphn+etOS1xsvcbEp8tTBPidFM8qzsR4Hqwey1nOvAOZcI
	 ivVTbPrF+sf+LEVBguUsZ1cAXP4pxQSGAwcK5gDu+S0KiO2AoVd7bnh9yZ5GLogwmO
	 /qkxmgPpr7Q30/UiyxFVL+ohud5EMBsWwnxgMJU9XayAIaxct1izFdzXSHgnOeTdhl
	 G4ej3Ga+9ODeb+lFqlTKYTBGelOfwTFLAb8FT3DkmupBmeIiZDMBI91tQ676nTbNlU
	 kDeekjpfMW4PFTziPpeTffg/VyXSYL1O3LevF6wdEo/NF0DeM4t3a2bI21p54OCKgM
	 AWqdhPQmIvv4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4239E7718A;
	Tue, 17 Dec 2024 21:39:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Tue, 17 Dec 2024 22:39:25 +0100
Subject: [PATCH v5 13/13] media: i2c: imx214: Fix link frequency validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241217-imx214-v5-13-387f52adef4d@apitzsch.eu>
References: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
In-Reply-To: <20241217-imx214-v5-0-387f52adef4d@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734471561; l=2951;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=IaHeW2kn0+BFS3UpeRipHSvLaInVm6GgixkZfvH8Zn8=;
 b=iceWVJ/p6O7NHmC2GG6/G00Ue3fCNEOdq+Km0itSPUrZBIifHQiuWcE0/Oj+cpofhaS6rS9Vn
 LWct7FTWZXDAHSf4LXuhe47H7G4pQFDB2/HyHCDpBd3sHdmwCmtzkMR
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
which works out as 384MPix/s. (The 8 is 4 lanes and DDR.)

Parsing the PLL registers with the defined 24MHz input. We're in single
PLL mode, so MIPI frequency is directly linked to pixel rate.  VTCK ends
up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.  Section 5.3
"Frame rate calculation formula" says "Pixel rate
[pixels/s] = VTPXCK [MHz] * 4", so 120 * 4 = 480MPix/s, which basically
agrees with my number above.

3.1.4. MIPI global timing setting says "Output bitrate = OPPXCK * reg
0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
frequency of 600MHz due to DDR.
That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR.

Keep the previous link frequency for backward compatibility.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e8d35f8b0f8b57d64f03ff6f5ed9eac51a671e8e..6a05094bbd4e94bb1a436a602745c3b5b2fdfbe2 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -31,7 +31,9 @@
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
 #define IMX214_DEFAULT_CLK_FREQ	24000000
-#define IMX214_DEFAULT_LINK_FREQ 480000000
+#define IMX214_DEFAULT_LINK_FREQ	600000000
+/* Keep wrong link frequency for backward compatibility */
+#define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
 #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
 
@@ -1225,18 +1227,26 @@ static int imx214_parse_fwnode(struct device *dev)
 		goto done;
 	}
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
+	if (bus_cfg.nr_of_link_frequencies != 1)
+		dev_warn(dev, "Only one link-frequency supported, please review your DT. Continuing anyway\n");
+
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
 		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
 			break;
-
-	if (i == bus_cfg.nr_of_link_frequencies) {
-		dev_err_probe(dev, -EINVAL,
-			      "link-frequencies %d not supported, Please review your DT\n",
-			      IMX214_DEFAULT_LINK_FREQ);
-		ret = -EINVAL;
-		goto done;
+		if (bus_cfg.link_frequencies[i] ==
+		    IMX214_DEFAULT_LINK_FREQ_LEGACY) {
+			dev_warn(dev,
+				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
+				 IMX214_DEFAULT_LINK_FREQ);
+			break;
+		}
 	}
 
+	if (i == bus_cfg.nr_of_link_frequencies)
+		ret = dev_err_probe(dev, -EINVAL,
+				    "link-frequencies %d not supported, please review your DT\n",
+				    IMX214_DEFAULT_LINK_FREQ);
+
 done:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	fwnode_handle_put(endpoint);

-- 
2.47.1




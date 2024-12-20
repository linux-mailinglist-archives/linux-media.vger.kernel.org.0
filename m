Return-Path: <linux-media+bounces-23911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDA9F934F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F8AD188728E
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD06218848;
	Fri, 20 Dec 2024 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXhDUsr/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374E217649;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701194; cv=none; b=FScqjckJOe3z/zHSogirkuzVdoe/uqz1UO79EJQXA+jAEseurf1sdgQjq/RXwZb8jCwd5UzBzpE5H2F+sDZxIzFAciB9Q96wqUAvjLgxe51VQp41oHk8BpwpoHFnzVZFgWCeFEuG03DF3bpNG9n4BTDNjFKfyRdZmmuT7JdtD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701194; c=relaxed/simple;
	bh=YErCTUhQ/G7sCBOzYDhoT3G1Z1y0MkXWxHYYmk+C8lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GM/zaDZfPtRaBXxwVYZ0/q1reQojfYkY8wKBiRY5YrgacES6XGpZX24L9T9HumK01Pm3G7cCzGX+44o9MQWC0/hzOzsxE2csC91a4dFHDCs6i9bgS2G8XzaK3kFZrmbhkFw3ADPp3ZalNXVB4b7+3hmeUlYhJSHQ+i8QDOntme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXhDUsr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D40DC4CEDE;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734701194;
	bh=YErCTUhQ/G7sCBOzYDhoT3G1Z1y0MkXWxHYYmk+C8lg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eXhDUsr/o9DN0qR1QCZgs69tfuq7yloh9rv3y3zEiQcw0LESUMt5JSnqATwQG94kj
	 2X2C+mxzcWixhRfmobtImMTbLq9C9Tns9NE8kYn2JGbqMaNCEj91cAhntbx789r09G
	 J/+va4xxKmhNcZpo8Lu23vFHqm8LXROzBZ0Su70R63b5vM/XrGHIVq3Zqo7ESz/zyv
	 pIZue7drf+zKdgacA86qMdhEco3xGHqYXsmS4HzeeJ8gCiL55xLO3uNi3Sb5V/EF+S
	 jlQ0+CfbsapmzLtDqpLK3oySnXHRzOk4ALF04pmxLmnGgClwdNDhd27md2IGVBroML
	 5DuLEF/d73WCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836DEE7718C;
	Fri, 20 Dec 2024 13:26:34 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 20 Dec 2024 14:26:12 +0100
Subject: [PATCH v6 13/13] media: i2c: imx214: Fix link frequency validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241220-imx214-v6-13-d90a185d82e5@apitzsch.eu>
References: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
In-Reply-To: <20241220-imx214-v6-0-d90a185d82e5@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734701191; l=2951;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=IaHeW2kn0+BFS3UpeRipHSvLaInVm6GgixkZfvH8Zn8=;
 b=Po0SGggNaPu5O51OSAA3+Nyz+HSVKOHv8NES/O+KqW/EtK1fQnx6tqn3cvMXCBJ3xroWNX7AX
 1JXE1KMkCEwCsWatXwTXB61SUb5Vvf4lS7wtevlgagfAHeNz+Vwy3OZ
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




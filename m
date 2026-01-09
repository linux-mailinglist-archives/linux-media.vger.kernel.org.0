Return-Path: <linux-media+bounces-50302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E3D0B307
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B4CA301E838
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C943644BC;
	Fri,  9 Jan 2026 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DUzfcDnG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E936404A;
	Fri,  9 Jan 2026 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975385; cv=none; b=mWN3beV8/MxAt0DaH1WUBA4w37oM28FefpGXmCYY/KztBYCemZXAQjlcxDvAAhTv6TK5TT+PD0KWrOBkqQAg79GNic6jwnPrH+OHnXm2tCGV1pJ8J1UecwuiKhrXas0ShuMxkQmx/Clu3np6K38R9MukQumXgrfFDTI1S9ARaUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975385; c=relaxed/simple;
	bh=2cfBe2HMjZ1TVCyq7yRqYr5Xf8tgJn9wnLlQqFOVpSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6s2g0vqJf3WwCdL+nsISwNAZDlDiPr7K9JAIgaeEo4S+qwdjIOHdF8z/FVy/xkQBTvQpw5IRyPDLhhTOdPwuzFezLw4uHSokGiSR34pLn8lDpwX4KyX+nML4GsDvtfnQpR9A0Y/yqdPd5IMnHtrMA1ONPWC6hkw7zzpim4t6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DUzfcDnG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767975382;
	bh=2cfBe2HMjZ1TVCyq7yRqYr5Xf8tgJn9wnLlQqFOVpSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUzfcDnG7flTDX5MHJ0SaSz0mj816vvHeKbsvK40vO39QvDjXQBeG0Guk6fY5K5Yu
	 06G1t1Mgx8jV+68vYajhe3DNwhcWVoZIbCLMkJerPfyQ0D5okczqZINBWLi/zvxb9V
	 vH0jS7hAaphyOMk2pnkU6X1mF0LLPpK45r5XCttRHswIYJWdkdqQiVVsu5n8/n7IEt
	 5K+JeE+MVe2iStyAzvbTTUoXYQXn9tfhfM/wX53jiXz0w7UbrpH21XHofpkog1ivqD
	 ukhAqvB3OP/08/Bxw3ZFvXaj9y9UtkSqzLAb4zJezijZQqk1cXTiWV7QmjKRD7uNLD
	 24jyoB9y5C5Gg==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F245617E385E;
	Fri,  9 Jan 2026 17:16:19 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v8 13/17] media: rkvdec: Disable multicore support
Date: Fri,  9 Jan 2026 11:15:29 -0500
Message-ID: <20260109161538.1294449-14-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109161538.1294449-1-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to what is done in Hantro, avoid exposing equal video codecs to
userspace. Equal video codecs allow scheduling work between the cores.
For that kernel support is required, which does not yet exist.
Until that is implemented, avoid exposing each core separately to
userspace so that multicore can be added in the future without breaking
userspace ABI.

This currently applies only to RK3588 which has 2 equal VDPU381 decoders,
but will be applied for all SoC supported by rkvdec that has multiple DTS
nodes with the same compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index ce96a0470d4d..af2eced90026 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1269,6 +1269,49 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+/*
+ * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
+ * kernel is currently missing support for multi-core handling. Exposing
+ * separate devices for each core to userspace is bad, since that does
+ * not allow scheduling tasks properly (and creates ABI). With this workaround
+ * the driver will only probe for the first core and early exit for the other
+ * cores. Once the driver gains multi-core support, the same technique
+ * for detecting the first core can be used to cluster all cores together.
+ */
+static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
+{
+	struct device_node *node = NULL;
+	const char *compatible;
+	bool is_first_core;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* The first compatible and available node found is considered the main core */
+	do {
+		node = of_find_compatible_node(node, NULL, compatible);
+		if (of_device_is_available(node))
+			break;
+	} while (node);
+
+	if (!node)
+		return -EINVAL;
+
+	is_first_core = (rkvdec->dev->of_node == node);
+
+	of_node_put(node);
+
+	if (!is_first_core) {
+		dev_info(rkvdec->dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static const struct rkvdec_variant_ops rk3399_variant_ops = {
 	.irq_handler = rk3399_irq_handler,
 };
@@ -1332,6 +1375,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
+	ret = rkvdec_disable_multicore(rkvdec);
+	if (ret)
+		return ret;
+
 	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
 	if (ret < 0)
 		return ret;
-- 
2.52.0



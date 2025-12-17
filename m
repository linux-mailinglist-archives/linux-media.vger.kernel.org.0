Return-Path: <linux-media+bounces-49016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5396CC92A7
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 18:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96D531D41EB
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E934F47A;
	Wed, 17 Dec 2025 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DmkWCWx9"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6434EEF8;
	Wed, 17 Dec 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993346; cv=none; b=fH71RupTmN4hG9gGOMPP9WQ3ho9B39iyxWT/mKHvEQBRJCZ0icFJ7/JlCLaxkKtsbjCPkazqHOEqlNbDMdrF787job/V4ffOIxyUkunas6oJJ9+r/ayYXFydauR/hwN1YtTMHM4f9aXVNJml29Wqf5Moia6pZReXb9Kbq+88058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993346; c=relaxed/simple;
	bh=8vBoOMskbJh8WrjcrKtrm9DB0ZYyv0qQu+8wReK92W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swSeJB2Y6JDzFGg/tFN7rsXCS/nf1sHvXK0j+SHA8Z01jnOk7ynOnpt1m/YxbZ7DP5iqhrItrYcVJUGb6Kl3UvJuiv5oYmlQGsZNEnZJutiGTDRPDwWVCkCyfXTOFLBHShqDtIG35xALs/Ak5+Ina3K8d1xCg0BwNrxtsXu4qOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DmkWCWx9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993342;
	bh=8vBoOMskbJh8WrjcrKtrm9DB0ZYyv0qQu+8wReK92W0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmkWCWx9BesM2Jngn/QPNRU0jjqo67PTo/kYteNd67PDC4bbXd2vHB14arAeribY+
	 CfFurO+DlhEAAsbNzQS5RHJKAg89inmvcIUkDuZdHae+HfjsYJ25EAebOBhc5LWnFK
	 9aOKYbcfFagvP5hpTGnZG2eKZY4rpTvqYusTVNDIJph1TtlsWiP0oJCsYhQhijxn3r
	 eJPSUSkngHyYgqVGFsSmIh5Zt++YOKwsyA6AzJ7UHzVtokgwz3lpopw414T3zVPpvW
	 UuTm8gkH28f9BItBKDQvaC8vUzcmaAIuyUcXQnDuZvtRmlgOianDPoQ7Km6K7b/SL5
	 K7DpwC9QhQhwA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 205EA17E13F9;
	Wed, 17 Dec 2025 18:42:20 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 13/17] media: rkvdec: Disable multicore support
Date: Wed, 17 Dec 2025 12:40:50 -0500
Message-ID: <20251217174059.1341784-14-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
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
index 9bd98b6a6be7..f7353d0acdab 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1265,6 +1265,49 @@ static void rkvdec_watchdog_func(struct work_struct *work)
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
@@ -1335,6 +1378,10 @@ static int rkvdec_probe(struct platform_device *pdev)
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



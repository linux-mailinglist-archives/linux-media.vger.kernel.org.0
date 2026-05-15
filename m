Return-Path: <linux-media+bounces-61756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JTEG84/B2qjvAIAu9opvQ
	(envelope-from <linux-media+bounces-61756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:46:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EC5525C7
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 940A4310B87A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697D14BCAD9;
	Fri, 15 May 2026 15:33:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4184D98F6
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859203; cv=none; b=kS24FNRbUDXk3TpKSiQLn4zLjuGW1XcB3e8fK5Jqt6BiyTSxqJib9RaS18jbT4ND+driJRHiS+a42nFs2+blrTmqHlggj6GAQGfFYaqiOwWVUmihQ3nhzMhaTDgMIAUH+GplfP66Q0KVh5Ix/5s1Qy5Pm4W9Y0WtKey9yjcOQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859203; c=relaxed/simple;
	bh=pKZOYwEGn5x3zzyKEaY7cYxemy2d0t5TJOhgO3uVp9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egIoyUn9JB3lOurhHWpUCyBh7M7m6eO5bISc5bq9joknNo+DTheMs6W9P+7Uh9+FQNu/Kx73JoqHiYtf6EFfLu6qTTSV5cM9ATgZZFJsiZxYXHmUOjK6uiSPr83MRtbw32R99lke8btFXjzSNivGWifREX7Pgb5yKrPqLvQ1lxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNuXL-0005OF-Sr; Fri, 15 May 2026 17:33:15 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Fri, 15 May 2026 17:32:52 +0200
Subject: [PATCH v6 26/28] media: rockchip: rga: disable multi-core support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-spu-rga3-v6-26-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
In-Reply-To: <20260515-spu-rga3-v6-0-e547152eb9c9@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: DD9EC5525C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61756-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Disable multi-core support in preparation of the RGA3 addition. The
RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
work between both cores, which is not yet implemented. Until it is
implemented avoid exposing both cores as independent video devices to
prevent an ABI breakage when multi-core support is added.

This patch is copied from the Hantro driver patch to disable multi core
support by Sebastian Reichel. See
commit ccdeb8d57f7f ("media: hantro: Disable multicore support")

Link: https://lore.kernel.org/all/20240618183816.77597-4-sebastian.reichel@collabora.com/
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8d60e94da32d8..0152b8ef2da2f 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -711,6 +711,49 @@ static int rga_parse_dt(struct rockchip_rga *rga)
 	return 0;
 }
 
+/*
+ * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
+ * kernel is currently missing support for multi-core handling. Exposing
+ * separate devices for each core to userspace is bad, since that does
+ * not allow scheduling tasks properly (and creates ABI). With this workaround
+ * the driver will only probe for the first core and early exit for the other
+ * cores. Once the driver gains multi-core support, the same technique
+ * for detecting the main core can be used to cluster all cores together.
+ */
+static int rga_disable_multicore(struct device *dev)
+{
+	struct device_node *node = NULL;
+	const char *compatible;
+	bool is_main_core;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(dev->of_node, "compatible", &compatible);
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
+	is_main_core = (dev->of_node == node);
+
+	of_node_put(node);
+
+	if (!is_main_core) {
+		dev_info(dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int rga_probe(struct platform_device *pdev)
 {
 	struct rockchip_rga *rga;
@@ -721,6 +764,10 @@ static int rga_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	ret = rga_disable_multicore(&pdev->dev);
+	if (ret)
+		return ret;
+
 	rga = devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
 	if (!rga)
 		return -ENOMEM;

-- 
2.54.0



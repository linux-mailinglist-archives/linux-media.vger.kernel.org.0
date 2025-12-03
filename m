Return-Path: <linux-media+bounces-48177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 735CCC9FC74
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 17:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE6EC3018D7B
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 15:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4979933A707;
	Wed,  3 Dec 2025 15:54:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95F337B9F
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777241; cv=none; b=O89DwR1ctgaOIvHjnuJVwIvSxJoknvylBgWUG07vuY/ORbgQ382Svxv6P0f55BxPYPB+yXaVcWh5d/4sPkRQR3k2uKIC/7yJ7PdyVL/qLXyrsuWRz71EMalV7jTXKKk2MJVJ1tc9Di0QCcOoC+/k234aW79O+4F69sLX0qn8BTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777241; c=relaxed/simple;
	bh=RNLZlK3ZCHBGRd9kdE2qLK4mSIb9x6NAepsB8YXR4CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2oWwB4RsoqcXCaIfurMQrjXcHTFJnhJj4FF4bHBP+Lbjxo7uvoN1RCY7y5lUZFb9UTeMkVVSlKpsnNGo28bRraEC1kDV41LhPHN0+dAfxTz7qaQA+JqlyJpPEGpvgQHqgsNt/Lwko+xmJAfNRsLwV+5oPdW2dsde3iAAvaZXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAe-0007dW-SI; Wed, 03 Dec 2025 16:53:36 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:42 +0100
Subject: [PATCH v2 20/22] media: rockchip: rga: disable multi-core support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-20-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Disable multi-core support in preparation of the RGA3 addition. The
RK3588 SoC features two equal RGA3 cores. This allows scheduling of the
work between both cores, which is not yet implemented. Until it is
implemented avoid exposing both cores as independent video devices to
prevent an ABI breakage when multi-core support is added.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3958e71b8987d..65686228b7300 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -660,6 +660,30 @@ static int rga_parse_dt(struct rockchip_rga *rga)
 	return 0;
 }
 
+static int rga_disable_multicore(struct device *dev)
+{
+	const char *compatible;
+	struct device_node *node;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* first compatible node found from the root node is considered the main core */
+	node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!node)
+		return -EINVAL; /* broken DT? */
+
+	if (dev->of_node != node) {
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
@@ -670,6 +694,10 @@ static int rga_probe(struct platform_device *pdev)
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
2.52.0



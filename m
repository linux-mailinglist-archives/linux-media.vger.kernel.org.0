Return-Path: <linux-media+bounces-13189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E87907449
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C6131F2398F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 13:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AFA1E519;
	Thu, 13 Jun 2024 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n0FUOv3a"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D726144D21;
	Thu, 13 Jun 2024 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286640; cv=none; b=PdKr7UyeBOMeCmJTczqOVhg309NGGJ6CuiZ3LHgSEQw2gwbQx7tqY/qRxX+w9VHGsxhyMD7F64nDFHgRS/9YaVk3hnc39RUvnf/IrF0o0mSPRTy4syKIS4/omP/llrwMv6xz99hh6dxw/fSvxIKOANi/uUrpVBjj2rYEgBw2yiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286640; c=relaxed/simple;
	bh=th5seJF3vBX+X27ODP/uDhCZmMW2KCKtk8juv3MEKfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7zziaaBYQwyf58IYu6UlFRHQRYFZunnjt/7FqfcfJiIxJnTjUEi3u9XYQoT3JhrXnOIGHlfMRXRGUPHEPmjnzPehb1MHxMjOMnVTJTGGlTqnBgsTumxYiylmWCV9jMUPzSnEJtW7z1oOLtuT+7dwsAh2lTAxsU2Nc5XK9Z2Tnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n0FUOv3a; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718286636;
	bh=th5seJF3vBX+X27ODP/uDhCZmMW2KCKtk8juv3MEKfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0FUOv3agw37r9+4v5v97sFRYeVfEt9Poau2rpub37bk0MsW5XfHXFPpWrAcyZlsT
	 xBiSmd/Av8NAZQjq8Op066tgjYtjv1cBDX9ZUxuT6FKcMDOgz9298q4F4AI/7PzVYP
	 npg6AXeFRXzFZzQgzcnTRWpRIEzJIk+Kv5SYtt0FzlPYXzVc/LsAHnSzxcGT0p+VGc
	 t9tGN/6WY6h++/VeLdedjlzv6liz/UTcmZyM5333OZhlzNWcwJ1NrZCo8QLa1qNm/F
	 7MwLHyywoqROiDYEHrwcSATTvSk3k1l9RmnSgwqTqhO5Bz7s20uaRORvmG47rx6PEY
	 qOdqi/oNebkFA==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 997DA37821B5;
	Thu, 13 Jun 2024 13:50:36 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 36AB84800CE; Thu, 13 Jun 2024 15:50:36 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v6 3/6] media: hantro: Disable multicore support
Date: Thu, 13 Jun 2024 15:48:44 +0200
Message-ID: <20240613135034.31684-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613135034.31684-1-sebastian.reichel@collabora.com>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid exposing equal Hantro video codecs to userspace. Equal video
codecs allow scheduling work between the cores. For that kernel support
is required, which does not yet exist. Until that is implemented avoid
exposing each core separately to userspace so that multicore can be
added in the future without breaking userspace ABI.

This was written with Rockchip RK3588 in mind (which has 4 Hantro H1
cores), but applies to all SoCs.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../media/platform/verisilicon/hantro_drv.c   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 34b123dafd89..7123479b3eab 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -992,6 +992,39 @@ static const struct media_device_ops hantro_m2m_media_ops = {
 	.req_queue = v4l2_m2m_request_queue,
 };
 
+/*
+ * Some SoCs, like RK3588 have multiple identical Hantro cores, but the
+ * kernel is currently missing support for multi-core handling. Exposing
+ * separate devices for each core to userspace is bad, since that does
+ * not allow scheduling tasks properly (and creates ABI). With this workaround
+ * the driver will only probe for the first core and early exit for the other
+ * cores. Once the driver gains multi-core support, the same technique
+ * for detecting the main core can be used to cluster all cores together.
+ */
+static int hantro_disable_multicore(struct hantro_dev *vpu)
+{
+	const char *compatible;
+	struct device_node *node;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(vpu->dev->of_node, "compatible", &compatible);
+	if (ret)
+		return ret;
+
+	/* first compatible node found from the root node is considered the main core */
+	node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!node)
+		return -EINVAL; /* broken DT? */
+
+	if (vpu->dev->of_node != node) {
+		dev_info(vpu->dev, "missing multi-core support, ignoring this instance\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -1011,6 +1044,10 @@ static int hantro_probe(struct platform_device *pdev)
 	match = of_match_node(of_hantro_match, pdev->dev.of_node);
 	vpu->variant = match->data;
 
+	ret = hantro_disable_multicore(vpu);
+	if (ret)
+		return ret;
+
 	/*
 	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
 	 * but it's deprecated. Please update your DTS file to use
-- 
2.43.0



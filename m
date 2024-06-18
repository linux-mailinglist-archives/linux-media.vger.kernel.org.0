Return-Path: <linux-media+bounces-13594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3790DBAC
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA0E1F22603
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B3615EFA1;
	Tue, 18 Jun 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ye9sOwwJ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9015E5CF;
	Tue, 18 Jun 2024 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735901; cv=none; b=cwSm7pus5ZvmelH3zV1eiT0nVJ1kgG4K1PkwN5RDdpkS4c9NGuLvcCzYIK17wNbDdOCBbEUgCc8O2b2dx+GWqpfTqm75Vmf4CkmEhnEcQaVp5K8rJT7ud/KoRQH5cZfypKvy+kFrOxLosbTaeTzVZTJq2j8fjUbQbhKFnL+jkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735901; c=relaxed/simple;
	bh=pgX34qM//hg5kqXfNWtX3zkJ2uIiYClJs5SfTuN4s/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imiRLidcRf6J8GjdPQcXbeBuqH+n9YpKZkeV7ZA6Yf42Tn5EZB+B4yijJN8Ov/o0zejDdhc0Ds5UOOlzyZZ2UohkVfEUsHRj0iXa/tYFObWF2lWoiiMM8pfvRpPoHwZta/0+qau82Bp1UUX0NpJTjV8JVyzD6j95tMPYZphXFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ye9sOwwJ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718735897;
	bh=pgX34qM//hg5kqXfNWtX3zkJ2uIiYClJs5SfTuN4s/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ye9sOwwJzUb0wqRSYgfAMOB/II/ka0Ctx/xNJPTxxwtgTXCDNSgmRHnrJ8Z6A7VDa
	 Is1NEM1EwVwEEnOKBqQW2XMwIoUlvMbRt6e9xKDPvcX4xriBdhZCgK9CXi1rhUKYcA
	 NLSy0vTYvxlpG03XJkBEY0ZkGPKxjBykq5a4EtgqPlmMrqwI63KPOH582n4M+qa+Mu
	 phlBLrnKW23fIUzFp0XEprtOaptJDZIls2paRSpwCntmIU0IJ47qV7sSJdbB0ET6H3
	 5Ujsf3tUZxDgC31xmLp38EXfurrruOL1ILItmEHyHqfqCtBHTl8OMnpi5z7lWihH15
	 31ZqOVdL32yDg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A510E378219A;
	Tue, 18 Jun 2024 18:38:17 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2FE4E4800CE; Tue, 18 Jun 2024 20:38:17 +0200 (CEST)
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
Subject: [PATCH v7 3/6] media: hantro: Disable multicore support
Date: Tue, 18 Jun 2024 20:18:34 +0200
Message-ID: <20240618183816.77597-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618183816.77597-1-sebastian.reichel@collabora.com>
References: <20240618183816.77597-1-sebastian.reichel@collabora.com>
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
 .../media/platform/verisilicon/hantro_drv.c   | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 34b123dafd89..748187623990 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -992,6 +992,49 @@ static const struct media_device_ops hantro_m2m_media_ops = {
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
+	struct device_node *node = NULL;
+	const char *compatible;
+	bool is_main_core;
+	int ret;
+
+	/* Intentionally ignores the fallback strings */
+	ret = of_property_read_string(vpu->dev->of_node, "compatible", &compatible);
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
+	is_main_core = (vpu->dev->of_node == node);
+
+	of_node_put(node);
+
+	if (!is_main_core) {
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
@@ -1011,6 +1054,10 @@ static int hantro_probe(struct platform_device *pdev)
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



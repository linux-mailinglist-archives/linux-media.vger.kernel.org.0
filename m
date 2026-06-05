Return-Path: <linux-media+bounces-63961-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jHWUFGBJI2pUnwEAu9opvQ
	(envelope-from <linux-media+bounces-63961-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:10:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DD64B8FD
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63961-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63961-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D0D03068BEA
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E996B3D6CCD;
	Fri,  5 Jun 2026 22:08:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212EF3D2FFC
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697308; cv=none; b=urJTb1BGx26I+lSpBEnQUqYtbeN7d27ay87de3BvDH/grlrWXUiOp9H8MqsC4MeW9P+5n+6sxHDyafgqCr7CcWhJXLDpcWSL3BjMUv+ctVVlf4GMWYsKurT0kv9xSiZqaPUEm/A78wW1r0i6P0EtoFZ6fmMPRBDu2REdKFciTTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697308; c=relaxed/simple;
	bh=eU0m7fiQeNWxnmH4Hq8GssGuaAxqRHYPTDmZYHnQ4SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4rftz5h5EE5rta5cYO/iIZMJvgO9+xQ2jnzTjwLj0sy8QCZZ4dMhj7bM1hBehjvAUNcmu35UEjRuQxoGYQLqkJesMoztg5vAQCFivjwo3sYDpfS/LcDDJ889Ov9JDWGI6LkO5s8/jB1MAvHgFPWAd46jFlNspA0FqF+1YyeVnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciB-0000LW-DK; Sat, 06 Jun 2026 00:08:19 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:58 +0200
Subject: [PATCH 12/17] media: rockchip: rga: move core initialization from
 bind to probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,m:s.pueschel@pengutronix.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63961-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:from_mime,pengutronix.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA4DD64B8FD

Move the core initialization from the core binding function to the core
probing function. This better matches the actual sequence, where the
core probe initializes most things and the bind function just binds the
core to the actual rga struct from the master device.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 83 ++++++++++++++++---------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 952377ae467f5..0413b8518dfc8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -740,21 +740,49 @@ static int rga_parse_dt(struct rga_core *core)
 
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
+	struct rga_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	core->rga = rga;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret < 0)
+		return ret;
+
+	rga->version = rga->hw->get_version(core);
+
+	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
+		  rga->version.major, rga->version.minor);
+
+	pm_runtime_put(core->dev);
+
+	rga->cores[0] = core;
+
+	return 0;
+}
+
+static const struct component_ops rga_core_ops = {
+	.bind = rga_core_bind,
+};
+
+static int rga_core_probe(struct platform_device *pdev)
+{
 	struct rga_core *core;
+	const struct rga_hw *hw;
 	int ret = 0;
 	int irq;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
+	hw = of_device_get_match_data(&pdev->dev);
+	if (!hw)
+		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
+
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
-	core->rga = rga;
 	core->dev = &pdev->dev;
 
-	rga->cores[0] = core;
-
 	ret = rga_parse_dt(core);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
@@ -775,7 +803,7 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = devm_request_irq(core->dev, irq, rga_isr,
-			       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
+			       hw->has_internal_iommu ? 0 : IRQF_SHARED,
 			       dev_name(core->dev), core);
 	if (ret < 0) {
 		dev_err(core->dev, "failed to request irq\n");
@@ -790,42 +818,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	platform_set_drvdata(pdev, core);
 
-	ret = pm_runtime_resume_and_get(core->dev);
-	if (ret < 0)
-		goto err_put_clk;
-
-	rga->version = rga->hw->get_version(core);
-
-	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
-		  rga->version.major, rga->version.minor);
-
-	pm_runtime_put(core->dev);
-
-	return 0;
-
-err_put_clk:
-	pm_runtime_disable(core->dev);
-
-	return ret;
-}
-
-static void rga_core_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	struct rga_core *core = dev_get_drvdata(dev);
-
-	pm_runtime_disable(core->dev);
-}
-
-static const struct component_ops rga_core_ops = {
-	.bind = rga_core_bind,
-	.unbind = rga_core_unbind,
-};
-
-static int rga_core_probe(struct platform_device *pdev)
-{
-	int ret = 0;
-
 	ret = component_add(&pdev->dev, &rga_core_ops);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register component: %d", ret);
@@ -833,11 +825,20 @@ static int rga_core_probe(struct platform_device *pdev)
 	}
 
 	return 0;
+
+err_put_clk:
+	pm_runtime_disable(core->dev);
+
+	return ret;
 }
 
 static void rga_core_remove(struct platform_device *pdev)
 {
+	struct rga_core *core = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &rga_core_ops);
+
+	pm_runtime_disable(core->dev);
 }
 
 static int __maybe_unused rga_runtime_suspend(struct device *dev)

-- 
2.54.0



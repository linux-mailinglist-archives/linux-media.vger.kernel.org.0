Return-Path: <linux-media+bounces-63972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kpnMCZxKI2oyoAEAu9opvQ
	(envelope-from <linux-media+bounces-63972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D605864B971
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:15:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63972-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63972-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3517D30D8AB0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488093D564B;
	Fri,  5 Jun 2026 22:08:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B9B466B4A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697320; cv=none; b=kVIfOuI7+Wr4orU9igxG7nzcn5nEIe7yalk4Fl1XxvDiy6jjl2PIn3ME3iI2uF/wJphaez3DVkepXnWNV3Zc+71CwZ9hGLvgnO3LMOvEvLrnDK2Rtqw8vWL2ho0LQP85arEWfz1xy81+D7M8vJl4mGoyNHBEfEJVVySysfjzcDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697320; c=relaxed/simple;
	bh=916SlS7hxt/WUsc+c1C0gXblrc3pxUP/yNEdXxo1EC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM2b4plEvUPc6eodbmytNjA9BYrP5tymcU8hQsXETtS9MWBY3wWMA8pKVu/wAA8XXgmzf2nsXGvERWibj8Vznplrq4rO4p0vSj4P37C8T/0basDPJBSCMFL4cYV+O1kX+YImufs5spuxEKmJa8pP573Ru9vLtuO9SSsP4RorCus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci9-0000LW-EE; Sat, 06 Jun 2026 00:08:17 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:56 +0200
Subject: [PATCH 10/17] media: rockchip: rga: move rockchip_rga allocation
 to master probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-10-3ec2b15675f7@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-63972-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: D605864B971

Move the rockchip_rga struct allocation to the master component probe
function in preparation of enabling all cores. This also adjusts the
allocation to use the actual number of cores found in the of tree
instead of being fixed to one core.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 32 ++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 178f45b8da940..11912bf5b6906 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -741,7 +741,7 @@ static int rga_parse_dt(struct rga_core *core)
 static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct rockchip_rga *rga;
+	struct rockchip_rga *rga = data;
 	struct rga_core *core;
 	struct video_device *vfd;
 	int ret = 0;
@@ -750,17 +750,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	rga = devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->cores), GFP_KERNEL);
-	if (!rga)
-		return -ENOMEM;
-
-	rga->hw = of_device_get_match_data(&pdev->dev);
-	if (!rga->hw)
-		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\n");
-
-	spin_lock_init(&rga->ctrl_lock);
-	mutex_init(&rga->mutex);
-
 	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
 	core->rga = rga;
 	core->dev = &pdev->dev;
@@ -947,9 +936,10 @@ static struct platform_driver rga_core_pdrv = {
 
 static int rga_bind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
 	int ret;
 
-	ret = component_bind_all(dev, NULL);
+	ret = component_bind_all(dev, rga);
 	if (ret) {
 		dev_err(dev, "component bind failed\n");
 		return ret;
@@ -974,6 +964,8 @@ static int rga_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct component_match *match = NULL;
 	struct device_node *core_node;
+	struct rockchip_rga *rga;
+	u8 num_cores = 0;
 
 	if (!match_desc)
 		return dev_err_probe(dev, -ENODEV, "missing platform data\n");
@@ -985,6 +977,7 @@ static int rga_probe(struct platform_device *pdev)
 		of_node_get(core_node);
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
+		num_cores++;
 
 		/*
 		 * As multi core is not implemented yet,
@@ -1000,6 +993,19 @@ static int rga_probe(struct platform_device *pdev)
 			dev, -ENODEV,
 			"no matching available component devices found\n");
 
+	rga = devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores), GFP_KERNEL);
+	if (!rga)
+		return -ENOMEM;
+
+	rga->hw = match_desc->data;
+	if (!rga->hw)
+		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
+
+	spin_lock_init(&rga->ctrl_lock);
+	mutex_init(&rga->mutex);
+
+	dev_set_drvdata(dev, rga);
+
 	return component_master_add_with_match(dev, &rga_master_ops, match);
 }
 

-- 
2.54.0



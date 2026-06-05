Return-Path: <linux-media+bounces-63965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +AOOGaZJI2qKnwEAu9opvQ
	(envelope-from <linux-media+bounces-63965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:11:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8864B919
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:11:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63965-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63965-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64DD307E732
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1297D3DA7EC;
	Fri,  5 Jun 2026 22:08:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA33D413C
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697309; cv=none; b=BzsB/giOfPL2FU1rQtI83Gezi0MoNzsauc7BGbGJaNtS2wk3r6ot1tmobAcOniow5ldF3FUJolwaB2ZhOzkuamEyK4AoaHcFU6st9J8z1482BN3E6tvZjPZmpD9PM0BR0pDD3y2CWJ4pvtATC746p7BqgaTzx4OrxCs0/Y332sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697309; c=relaxed/simple;
	bh=XwN3H/WKKx/hGJtxMoOnjRz+1bUtNM/m1v1dgCK0DMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlXw0yXcwDzfKXFv+TUoArJrvw2WLc5Kb2szavT+H5dWBlwc2hLmdbr365hkIND1C+htqiU9JfMtNd2hpjQaBm7lZ68bVsXZyBocsnMrbwuKCtsWZfe7eHsd4DAtwjj2ic10n46TS5ouh/atXyS1tkYmRreqHDXcAh4CsfEeci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciA-0000LW-Cf; Sat, 06 Jun 2026 00:08:18 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:57 +0200
Subject: [PATCH 11/17] media: rockchip: rga: move video device to the
 master
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-11-3ec2b15675f7@pengutronix.de>
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
	TAGGED_FROM(0.00)[bounces-63965-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: EDB8864B919

Move the video device allocation and registration to the master
component bind function in preparation for binding multiple cores
to the master. Moving it to the master bind function allows to
only register the v4l2 device when all cores have been successfully
bound to the master device. This also causes the video device to be
bound against the master platform device instead of a specific core.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 96 ++++++++++++++++---------------
 1 file changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 11912bf5b6906..952377ae467f5 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -743,7 +743,6 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga = data;
 	struct rga_core *core;
-	struct video_device *vfd;
 	int ret = 0;
 	int irq;
 
@@ -789,33 +788,11 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 		goto err_put_clk;
 	}
 
-	ret = v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
-	if (ret)
-		goto err_put_clk;
-	vfd = video_device_alloc();
-	if (!vfd) {
-		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
-		ret = -ENOMEM;
-		goto unreg_v4l2_dev;
-	}
-	*vfd = rga_videodev;
-	vfd->lock = &rga->mutex;
-	vfd->v4l2_dev = &rga->v4l2_dev;
-
-	video_set_drvdata(vfd, rga);
-	rga->vfd = vfd;
-
 	platform_set_drvdata(pdev, core);
-	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
-	if (IS_ERR(rga->m2m_dev)) {
-		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
-		ret = PTR_ERR(rga->m2m_dev);
-		goto rel_vdev;
-	}
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto rel_m2m;
+		goto err_put_clk;
 
 	rga->version = rga->hw->get_version(core);
 
@@ -824,23 +801,8 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_put(core->dev);
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
-	if (ret) {
-		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto rel_m2m;
-	}
-
-	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
-		  vfd->name, video_device_node_name(vfd));
-
 	return 0;
 
-rel_m2m:
-	v4l2_m2m_release(rga->m2m_dev);
-rel_vdev:
-	video_device_release(vfd);
-unreg_v4l2_dev:
-	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
 	pm_runtime_disable(core->dev);
 
@@ -851,13 +813,6 @@ static void rga_core_unbind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
-	struct rockchip_rga *rga = core->rga;
-
-	v4l2_info(&rga->v4l2_dev, "Removing\n");
-
-	v4l2_m2m_release(rga->m2m_dev);
-	video_unregister_device(rga->vfd);
-	v4l2_device_unregister(&rga->v4l2_dev);
 
 	pm_runtime_disable(core->dev);
 }
@@ -937,6 +892,7 @@ static struct platform_driver rga_core_pdrv = {
 static int rga_bind(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
+	struct video_device *vfd;
 	int ret;
 
 	ret = component_bind_all(dev, rga);
@@ -945,11 +901,59 @@ static int rga_bind(struct device *dev)
 		return ret;
 	}
 
+	ret = v4l2_device_register(dev, &rga->v4l2_dev);
+	if (ret)
+		return ret;
+	vfd = video_device_alloc();
+	if (!vfd) {
+		v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
+		ret = -ENOMEM;
+		goto unreg_v4l2_dev;
+	}
+	*vfd = rga_videodev;
+	vfd->lock = &rga->mutex;
+	vfd->v4l2_dev = &rga->v4l2_dev;
+
+	video_set_drvdata(vfd, rga);
+	rga->vfd = vfd;
+
+	rga->m2m_dev = v4l2_m2m_init(&rga_m2m_ops);
+	if (IS_ERR(rga->m2m_dev)) {
+		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(rga->m2m_dev);
+		goto rel_vdev;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
+		goto rel_m2m;
+	}
+
+	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
+		  vfd->name, video_device_node_name(vfd));
+
 	return 0;
+
+rel_m2m:
+	v4l2_m2m_release(rga->m2m_dev);
+rel_vdev:
+	video_device_release(vfd);
+unreg_v4l2_dev:
+	v4l2_device_unregister(&rga->v4l2_dev);
+	return ret;
 }
 
 static void rga_unbind(struct device *dev)
 {
+	struct rockchip_rga *rga = dev_get_drvdata(dev);
+
+	v4l2_info(&rga->v4l2_dev, "Removing\n");
+
+	v4l2_m2m_release(rga->m2m_dev);
+	video_unregister_device(rga->vfd);
+	v4l2_device_unregister(&rga->v4l2_dev);
+
 	component_unbind_all(dev, NULL);
 }
 

-- 
2.54.0



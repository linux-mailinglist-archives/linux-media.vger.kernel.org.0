Return-Path: <linux-media+bounces-30507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA10A92D1F
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 00:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B6A19E6B2F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 22:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2978214A6C;
	Thu, 17 Apr 2025 22:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Sb4W16iu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6161F585C;
	Thu, 17 Apr 2025 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927901; cv=none; b=a6+T2PEiCqErUqteArkPu8wlzxAeQk37Ku8M2ibk1LkDbJZl3OtxGqvDieLfqyTtss2x9lK4nTrN96JvB1zI+8DDeAMipfWM1H7Zpl7djUAx3JUr2xgTL9LTFLZblHQu4RdWp0oeXNXBIX/l52AB2fsrIDUQAAdmzExlz0wt1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927901; c=relaxed/simple;
	bh=PE+TjdUopxSp8BkidKGkIbGWLaP1+fCPSat8nwKEV50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4dt2yTraRmPbV7VE4GgVBfht3KR4cdQMfeO0NbtaQGtQMq71dD/RboBUngIVR4qt6FN4P33OvIw2DGyQb8zIzKRP62aLcpN3OkjuX/FBwOsh3QeW4VZwx1Xez001/GKJjdB77ZJ/44Iz9gGdEcFyfPUlaTih68VGXJH+oOgmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Sb4W16iu; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5XJDuPve2ZSWC5XJHufye6; Fri, 18 Apr 2025 00:02:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744927335;
	bh=jtp8GYhjZseAjbyWNNzA/7uP91uP4NjtvHa4qyzcjGA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Sb4W16iujH9X2qQIj0Drugo+28BaX6cz1IW1IjU0SCgR/iHoMQkIOcGRqYmIggfbt
	 lIJDs+oAbaDbpe+8J000u+0+cdGbQxmRCsZh/aCcDXfCFHLf6IMtYyLpLSSxCff9Rd
	 orAFpHvZmZRJGoMmwYDsXhFgIhHw//k+C/75XTuqIRwtqNzN5nzvIf1k07qt2UHT9u
	 oaGsXg6VSZfTxeuxDVMJebvlSS1RWesZXDyAhP6KMfGrPK/ebbcFIHkNzVymdmbslr
	 ChExic6tYWiafGJo6GECbLwX8xksxi2cohEtMVnBagrCaLYNZEpXYU+UCqsxZo7u+b
	 eBYKZ7UWHCMrQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 00:02:15 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: amphion: Slightly simplify vpu_core_register()
Date: Fri, 18 Apr 2025 00:01:58 +0200
Message-ID: <e59b3387479fcdaa4ae0faf9fe30eb92a8f6034b.1744927294.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"vpu_core->msg_buffer_size" is unused out-side of vpu_core_register().
There is no need to save this value in struct vpu_core.

Remove it and use a local variable instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/amphion/vpu.h      | 1 -
 drivers/media/platform/amphion/vpu_core.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 22f0da26ccec..1451549c9dd2 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -162,7 +162,6 @@ struct vpu_core {
 	struct delayed_work msg_delayed_work;
 	struct kfifo msg_fifo;
 	void *msg_buffer;
-	unsigned int msg_buffer_size;
 
 	struct vpu_dev *vpu;
 	void *iface;
diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 8df85c14ab3f..da00f5fc0e5d 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -250,6 +250,7 @@ static void vpu_core_get_vpu(struct vpu_core *core)
 static int vpu_core_register(struct device *dev, struct vpu_core *core)
 {
 	struct vpu_dev *vpu = dev_get_drvdata(dev);
+	unsigned int buffer_size;
 	int ret = 0;
 
 	dev_dbg(core->dev, "register core %s\n", vpu_core_type_desc(core->type));
@@ -263,14 +264,14 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
 	}
 	INIT_WORK(&core->msg_work, vpu_msg_run_work);
 	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
-	core->msg_buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
-	core->msg_buffer = vzalloc(core->msg_buffer_size);
+	buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
+	core->msg_buffer = vzalloc(buffer_size);
 	if (!core->msg_buffer) {
 		dev_err(core->dev, "failed allocate buffer for fifo\n");
 		ret = -ENOMEM;
 		goto error;
 	}
-	ret = kfifo_init(&core->msg_fifo, core->msg_buffer, core->msg_buffer_size);
+	ret = kfifo_init(&core->msg_fifo, core->msg_buffer, buffer_size);
 	if (ret) {
 		dev_err(core->dev, "failed init kfifo\n");
 		goto error;
-- 
2.49.0



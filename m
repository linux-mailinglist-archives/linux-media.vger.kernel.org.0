Return-Path: <linux-media+bounces-50823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CAD29B45
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 02:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D177307896F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 01:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E6432A3D9;
	Fri, 16 Jan 2026 01:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XcoApMOV"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A96311C2C;
	Fri, 16 Jan 2026 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768527992; cv=none; b=gapen3LPGNsC9Hs9RvFtwYADNS/utB/eVifKmEtNXou+oSnaRE6RrHjFVMt8Lgbv8w5SUfWJvgnaPoTjEngZsN4Ww5kmyOnp4cfCBJZMyWH68DCOc/p9wyOXZfn7KCKdsDWCBc7Ojf4s0FQQeibFOKzPgWtluZIp7B9vNB4FTLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768527992; c=relaxed/simple;
	bh=oE01T2bUBbv/xOvKlxps12ONbFlTXtz/r2TKCMTfE0E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bBuEKEJ7xe7M+0cWUfzq7rnTto8QiSA+7iIe6mqTl5FZDgk+tq7Ab1GNM/ndssNakBvwp+s9UwyEoDx/df9hnMTvXbjApsWl3teLo2N6OoEqDPY2Vr1SlImowmm71CSvC0KFVh0tBBZPgw3vkEB0mVjqyTmOqQQczR7jlPkQC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XcoApMOV; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Za
	PCl/3N1GOQRMkwhC1D3hsVaJCItnWHiwvUu3wcPSc=; b=XcoApMOVhJhQow+2GM
	D+rCeKWcPcgdiIJvdQPr7keWhS6B6ccdhyWh9nUHdlweDPBViBUVTgUgrWBvdqUW
	BHFYOJTlqNujmPKQ0B26HysMhzO3i4pVLCyqllZbK1FIY2g4hBs1ui3267V42VJk
	2h3LQvpk8NPLLID5wIAiJ/XRU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCXVGRYmGlp0fIPGQ--.372S2;
	Fri, 16 Jan 2026 09:46:01 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH v3] media: mali-c55: Initialise dev member for tpg/rsz/isp sub-devices
Date: Fri, 16 Jan 2026 01:45:59 +0000
Message-Id: <20260116014559.154091-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXVGRYmGlp0fIPGQ--.372S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF43Cr48tw18ZF48WrWrGrg_yoW5Cr1UpF
	4xJFW8Zry7GF1jgw1UA3ZrZFW5Gw1Fqa1Uur97uw4aqa90kF9xJr1aka4ayFy5CF1UA3W3
	JFyIqr4Y9rs0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi0tCrUUUUU=
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbC+Bnw8WlpmFmStQAA3G

The subdevices registered by the Mali-C55 driver do not have their
'struct device *dev' member initialized. This is visibile when looking
at debug message, as in example:

"(NULL device *): collect_streams: sub-device 'mali-c55 tpg' does not
 support streams"

Fix this by initializing the *dev field for each subdevice registered
by the Mali-C55 driver.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: jempty.liang <imntjempty@163.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 1 +
 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 1 +
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 497f25fbdd13..ce84aad9f1d5 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -610,6 +610,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 	sd->entity.ops = &mali_c55_isp_media_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
 	sd->internal_ops = &mali_c55_isp_internal_ops;
+	sd->dev = mali_c55->dev;
 	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
 
 	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index a8d739af74b6..c4f46651dcee 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -1070,6 +1070,7 @@ static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
 	sd->internal_ops = &mali_c55_resizer_internal_ops;
+	sd->dev = mali_c55->dev;
 
 	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
 	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
index 1af5d2759a83..894f4cf377af 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
@@ -370,6 +370,7 @@ int mali_c55_register_tpg(struct mali_c55 *mali_c55)
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	sd->internal_ops = &mali_c55_tpg_internal_ops;
+	sd->dev = mali_c55->dev;
 	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
 
 	pad->flags = MEDIA_PAD_FL_SOURCE;
-- 
2.25.1



Return-Path: <linux-media+bounces-50633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E67D1BFDC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 02:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90ED83015E0A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 01:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70FD2F0699;
	Wed, 14 Jan 2026 01:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mZUmH936"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3F34CDD;
	Wed, 14 Jan 2026 01:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355465; cv=none; b=ZnkufUuZ69NzKBZBWcKpwbzuczwZHB8TWgG1bZrPK/GmXxtQUUsRzrOrIIVM9lRZPxaCH2GVBk/5kaHZlIbL2NHAqPLTOfLl6x4Ju+i2Gbl4q7tJN88PRpbGdbdaiUZ75NFrlYvysm45EYOF8lSwZG3EADvOtAXLDi+1w86PDKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355465; c=relaxed/simple;
	bh=Y/erY5HvQvIaF2EosjpkBvcc0Kr3xzuydcSaDtETejU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hLt4Jxvbc3IWv7vf3TROSJA+bgdUOoKcY0FQKjZZ/4O945+B65QVre1yZnkzXgd/MoFHpbi814oakIBqRE7AQrluVwoZ+kZ0z2vhFcU/VEFgWVe222VoSKDw/Tswwi9K1YIXF6VG0VzRdzLYRssPLMKdV3Wj8kTSTgnJXyu4ZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mZUmH936; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3n
	bW+YRq9h+KJfwauCU7f0oLs7w5BSYoG31Z0UWHcFE=; b=mZUmH936MpO4rlf46W
	qJpRRRs/HtQSTe847ncWiQxcAnWCKgpto9QfXBNORvlkZqo38KDfML+b3mzB58XI
	2u5g7Gos+JHagpdiXIR2fjrKpu+aN6jzOZbFplZRq+LNE6rktFoDVHvYqV5jGP6b
	Kz7/VYX1nPyMKZmTmApdzksws=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnP+pw9mZpzPJyLQ--.194S2;
	Wed, 14 Jan 2026 09:50:43 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH v2] media: mali-c55: Fix NULL dev stream alert for tpg/rsz/isp sub-device
Date: Wed, 14 Jan 2026 01:50:33 +0000
Message-Id: <20260114015033.153793-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnP+pw9mZpzPJyLQ--.194S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4DZr1UZw1DXFW8Ww1xZrb_yoW5AF1DpF
	48JFW8Zry7GF1jgw1UA3ZrZFW5Jw1FqayUur97uw4aqas8CasxJr1aka4ayFy5CF1UA3W3
	tFyIqr4Y9rs0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU2hF7UUUUU=
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbC2xPNzmlm9nMPmwAA3V

The subdevices registered by the Mali-C55 driver do not have their
'struct device *dev' member initialized. This is visibile when looking
at debug message, as in example:

"(NULL device *): collect_streams: sub-device 'mali-c55 tpg' does not
 support streams"

Fix this by initializing the *dev field for each subdevice registered
by the Mali-C55 driver.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


